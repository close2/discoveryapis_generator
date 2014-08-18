part of discovery_api_client_generator;


/**
 * Class for keeping all named schemas. This is used for
 *  - resolving forward references
 *  - quering types by name
 *  - access to built-in types
 */
class DartSchemaTypeDB {
  // Builtin types
  final StringType stringType;
  final IntegerType integerType;
  final NumberType numberType;
  final DoubleType doubleType;
  final BooleanType booleanType;
  final AnyType anyType;

  DartSchemaTypeDB(DartApiImports imports)
      : stringType = new StringType(imports),
        integerType = new IntegerType(imports),
        numberType = new NumberType(imports),
        doubleType = new DoubleType(imports),
        booleanType = new BooleanType(imports),
        anyType = new AnyType(imports);

  // List of all [DartSchemaType]s.
  // TODO: This has to be in depth-first sorted traversal, right?
  List<DartSchemaType> dartTypes = [];

  // Original schema names to [DartSchemaType].
  final Map<String, DartSchemaType> namedSchemaTypes = {};

  // Name of dart class to [DartSchemaType].
  final List<ComplexDartSchemaType> dartClassTypes = [];
}


/**
 * Represents a property in a dart class.
 */
class DartClassProperty {
  final Identifier name;
  final Comment comment;
  final DartSchemaType type;
  final String jsonName;

  // If this property is a base64 encoded bytes, this identifier will represent
  // the name used for a setter/getter.
  final Identifier byteArrayAccessor;

  DartClassProperty(this.name, this.comment, this.type, this.jsonName,
                    {this.byteArrayAccessor: null});
}


/**
 * Represents an internal representation used for codegen.
 *
 * [DartSchemaType] and it's subclasses are a representation for codegen of:
 *   - dart class definitions
 *   - dart type declarations
 *   - dart expressions for encoding/decoding json
 *
 * Before a [DartSchemaType] can be used, it's [resolve] method must be called
 * to resolve all forward references.
 */
abstract class DartSchemaType {
  // [className] is the name of the dart class this [DartSchemaType] represents
  // or `null` if it does not represent a schema type represented by a custom
  // dart class.
  final Identifier className;
  final Comment comment;
  final DartApiImports imports;

  bool _resolved = false;

  DartSchemaType(this.imports, this.className, {Comment comment_})
      : comment = comment_ != null ? comment_ : Comment.Empty;

  DartSchemaType resolve(DartSchemaTypeDB db) {
    if (!_resolved) {
      _resolved = true;
      return _resolve(db);
    }
    return this;
  }

  DartSchemaType _resolve(DartSchemaTypeDB db);

  String get declaration;

  /**
   * [value] is the string expression of this [DartSchemaType] that needs to be
   * encoded.
   */
  String jsonEncode(String value);

  /**
   * [json] is the string expression of json data that needs to be decoded to
   * a [DartSchemaType].
   */
  String jsonDecode(String json);
}


/**
 * Placeholder type for forward references.
 */
class DartSchemaForwardRef extends DartSchemaType {
  final String forwardRefName;

  DartSchemaForwardRef(DartApiImports imports, this.forwardRefName)
      : super(imports, null);

  DartSchemaType resolve(DartSchemaTypeDB db) {
    var concreteType = db.namedSchemaTypes[forwardRefName];
    if (concreteType == null) {
      throw new StateError('Invalid forward reference: $forwardRefName');
    }
    return concreteType;
  }

  DartSchemaType _resolve(DartSchemaTypeDB db) => null;

  String get declaration {
    throw new StateError('Type declarations can only be created after '
                         'resolving references.');
  }

  String jsonEncode(String value) {
    throw new StateError('JSON methods can only be called after '
                         'resolving references.');
  }

  String jsonDecode(String json) {
    throw new StateError('JSON methods can only be called after '
                         'resolving references.');
  }
}


/**
 * Superclass for primitive types which will not be represented as custom dart
 * classes.
 */
abstract class PrimitiveDartSchemaType extends DartSchemaType {
  PrimitiveDartSchemaType(DartApiImports imports) : super(imports, null);

  DartSchemaType _resolve(DartSchemaTypeDB db) => this;

  String jsonEncode(String value) => value;
  String jsonDecode(String json) => json;
}


class BooleanType extends PrimitiveDartSchemaType {
  BooleanType(DartApiImports imports) : super(imports);

  String get declaration => '${imports.core}.bool';
}


class IntegerType extends PrimitiveDartSchemaType {
  IntegerType(DartApiImports imports) : super(imports);

  String get declaration => '${imports.core}.int';
}


class NumberType extends PrimitiveDartSchemaType {
  NumberType(DartApiImports imports) : super(imports);

  String get declaration => '${imports.core}.num';
}


class DoubleType extends PrimitiveDartSchemaType {
  DoubleType(DartApiImports imports) : super(imports);

  String get declaration => '${imports.core}.double';
}


class StringType extends PrimitiveDartSchemaType {
  StringType(DartApiImports imports) : super(imports);

  String get declaration => '${imports.core}.String';
}


class EnumType extends StringType {
  final List<String> enumValues;
  final List<String> enumDescriptions;

  EnumType(DartApiImports imports, this.enumValues, this.enumDescriptions)
      : super(imports) {
    if (enumValues.length != enumDescriptions.length) {
      throw new ArgumentError('Number of enum values does not match number of '
          'enum descriptions.');
    }
  }
}


/**
 * Class representing "any" schema type.
 *
 * FIXME/TODO:
 *
 * This is unimplemented and not supported right now.
 * It does not work with jsonEncode/jsonDecode and probably many
 * other things.
 */
class AnyType extends PrimitiveDartSchemaType {
  AnyType(DartApiImports imports) : super(imports);

  String get declaration => '${imports.core}.Object';
}


/**
 * Class representing non-primitive types.
 *
 * Subclasses may be named dart classes or composed classes (e.g. List<X>).
 */
abstract class ComplexDartSchemaType extends DartSchemaType {
  ComplexDartSchemaType(DartApiImports imports,
                        Identifier name,
                        {Comment comment})
      : super(imports, name, comment_: comment);

  // TODO: Remove this.
  String get instantiation;

  String get classDefinition;

  String get declaration;
}


/**
 * Represents an unnamed List<T> type with a given `T`.
 */
class UnnamedArrayType extends ComplexDartSchemaType {
  DartSchemaType innerType;

  UnnamedArrayType(DartApiImports imports, this.innerType)
      : super(imports, null);

  DartSchemaType _resolve(DartSchemaTypeDB db) {
    innerType = innerType.resolve(db);
    return this;
  }

  String get instantiation =>
      'new ${imports.core}.List<${innerType.declaration}>()';

  String get classDefinition => null;

  String get declaration => '${imports.core}.List<${innerType.declaration}>';

  String jsonEncode(String value) {
    return '${value}.map((value) => ${innerType.jsonEncode('value')}).toList()';
  }

  String jsonDecode(String json) {
    return '${json}.map((value) => ${innerType.jsonDecode('value')}).toList()';
  }
}

/**
 * Represents a named List<T> type with a given `T`.
 */
class NamedArrayType extends ComplexDartSchemaType {
  DartSchemaType innerType;

  NamedArrayType(DartApiImports imports, Identifier name, this.innerType,
                 {Comment comment})
      : super(imports, name, comment: comment);

  DartSchemaType _resolve(DartSchemaTypeDB db) {
    innerType = innerType.resolve(db);
    return this;
  }

  String get instantiation => 'new ${className.name}()';

  String get classDefinition {
    var decode = new StringBuffer();
    decode.writeln('  $className.fromJson(${imports.core}.List json)');
    decode.writeln('      : _inner = json.map((value) => '
                   '${innerType.jsonDecode('value')}).toList();');

    var encode = new StringBuffer();
    encode.writeln('  ${imports.core}.List toJson() {');
    encode.writeln('    return _inner.map((value) => '
                   '${innerType.jsonEncode('value')}).toList();');
    encode.write('  }');

    var type = innerType.declaration;
    return
'''
${comment.asDartDoc(0)}class $className
    extends ${imports.collection}.ListBase<$type> {
  final ${imports.core}.List<$type> _inner;

  $className() : _inner = [];

$decode
$encode

  $type operator [](${imports.core}.int key) => _inner[key];

  void operator []=(${imports.core}.int key, $type value) {
    _inner[key] = value;
  }

  ${imports.core}.int get length => _inner.length;

  void set length(${imports.core}.int newLength) {
    _inner.length = newLength;
  } 
}
''';
  }

  String get declaration => '${className.name}';

  String jsonEncode(String value) {
    return '(${value}).toJson()';
  }

  String jsonDecode(String json) {
    return 'new $className.fromJson($json)';
  }
}


/**
 * Represents an unnamed Map<F, T> type with given types `F` and `T`.
 */
class UnnamedMapType extends ComplexDartSchemaType {
  DartSchemaType fromType;
  DartSchemaType toType;

  UnnamedMapType(DartApiImports imports, this.fromType, this.toType)
      : super(imports, null) {
    if (fromType is! StringType) {
      throw new StateError('Violation of assumption: Keys in map types must '
                           'be Strings.');
    }
  }

  DartSchemaType _resolve(DartSchemaTypeDB db) {
    fromType = fromType.resolve(db);
    toType = toType.resolve(db);
    return this;
  }

  String get instantiation {
    var from = fromType.declaration;
    var to = toType.declaration;
    return 'new ${imports.core}.Map<$from, $to>()';
  }

  String get classDefinition => null;

  String get declaration {
    var from = fromType.declaration;
    var to = toType.declaration;
    return '${imports.core}.Map<$from, $to>';
  }

  String jsonEncode(String value) {
    return '${imports.internal}.mapMap'
           '(${value}, (item) => ${toType.jsonEncode('item')})';
  }

  String jsonDecode(String json) {
    return '${imports.internal}.mapMap'
           '(${json}, (item) => ${toType.jsonDecode('item')})';
  }
}


/**
 * Represents a named Map<F, T> type with given types `F` and `T`.
 */
class NamedMapType extends ComplexDartSchemaType {
  DartSchemaType fromType;
  DartSchemaType toType;

  NamedMapType(
      DartApiImports imports, Identifier name, this.fromType, this.toType,
      {Comment comment})
      : super(imports, name, comment: comment) {
    if (fromType is! StringType) {
      throw new StateError('Violation of assumption: Keys in map types must '
                           'be Strings.');
    }
  }

  DartSchemaType _resolve(DartSchemaTypeDB db) {
    fromType = fromType.resolve(db);
    toType = toType.resolve(db);
    return this;
  }

  String get instantiation {
    var from = fromType.declaration;
    var to = toType.declaration;
    return 'new $className()';
  }

  String get classDefinition {
    var decode = new StringBuffer();
    decode.writeln('  $className.fromJson(${imports.core}.Map _json) {');
    decode.writeln('    _json.forEach((${imports.core}.String key, value) {');
    decode.writeln('      this[key] = ${toType.jsonDecode('value')};');
    decode.writeln('    });');
    decode.writeln('  }');

    var encode = new StringBuffer();
    encode.writeln('  ${imports.core}.Map toJson() {');
    encode.writeln('    var _json = {};');
    encode.writeln('    this.forEach((${imports.core}.String key, value) {');
    encode.writeln('      _json[key] = ${toType.jsonEncode('value')};');
    encode.writeln('    });');
    encode.writeln('    return _json;');
    encode.write('  }');

    var fromT = fromType.declaration;
    var toT = toType.declaration;

    return
'''
${comment.asDartDoc(0)}class $className
    extends ${imports.collection}.MapBase<$fromT, $toT> {
  final ${imports.core}.Map _innerMap = {};

  $className();

$decode
$encode

  ${toType.declaration} operator [](${imports.core}.Object key)
      => _innerMap[key];

  operator []=($fromT key, $toT value) {
    _innerMap[key] = value;
  }

  void clear() {
    _innerMap.clear();
  }

  ${imports.core}.Iterable<$fromT> get keys => _innerMap.keys;

  $toT remove(${imports.core}.Object key) => _innerMap.remove(key);
}
''';
  }

  String get declaration => '$className';

  String jsonEncode(String value) {
    return '(${value}).toJson()';
  }

  String jsonDecode(String json) {
    return 'new $className.fromJson($json)';
  }
}


/**
 * Represents a named custom dart class with a number of properties.
 */
class ObjectType extends ComplexDartSchemaType {
  final List<DartClassProperty> properties;
  // FIXME: Can we have subclasses of subclasses ???
  AbstractVariantType superVariantType;

  ObjectType(DartApiImports imports, Identifier name, this.properties,
             {Comment comment})
      : super(imports, name, comment: comment);

  DartSchemaType _resolve(DartSchemaTypeDB db) {
    for (var i = 0; i < properties.length; i++) {
      var property = properties[i];
      var resolvedProperty = new DartClassProperty(
          property.name, property.comment, property.type.resolve(db),
          property.jsonName, byteArrayAccessor: property.byteArrayAccessor);
      properties[i] = resolvedProperty;
    }
    return this;
  }

  String get instantiation => 'new $className()';

  String get classDefinition {
    var superClassString = '';
    if (superVariantType != null) {
      superClassString = ' extends ${superVariantType.declaration} ';
    }

    var propertyString = new StringBuffer();
    properties.forEach((DartClassProperty property) {
      var comment = property.comment.asDartDoc(2);
      var prefix = '', postfix = '';
      if (isVariantDiscriminator(property)) {
        prefix = 'final ';
        postfix = ' = "${escapeString(discriminatorValue())}"';
      }
      propertyString.writeln(
          '$comment  $prefix${property.type.declaration} ${property.name}'
          '$postfix;');
      propertyString.writeln();

      if (property.byteArrayAccessor != null) {
        propertyString.writeln(
            '  ${imports.core}.List<${imports.core}.int> get '
            '${property.byteArrayAccessor} {');
        propertyString.writeln('    return '
            '${imports.crypto}.CryptoUtils.base64StringToBytes'
            '(${property.name});');
        propertyString.writeln('  }');

        propertyString.writeln();

        propertyString.write(
            '  void set ${property.byteArrayAccessor}');
        propertyString.writeln(
            '(${imports.core}.List<${imports.core}.int> _bytes) {');
        propertyString.writeln('    ${property.name} = '
            '${imports.crypto}.CryptoUtils.bytesToBase64(_bytes);');
        propertyString.writeln('  }');

        propertyString.writeln();
      }
    });

    var fromJsonString = new StringBuffer();
    fromJsonString.writeln(
        '  $className.fromJson(${imports.core}.Map _json) {');
    properties.forEach((DartClassProperty property) {
      // The super variant fromJson() will call this subclass constructor
      // and the variant descriminator is final.
      if (!isVariantDiscriminator(property)) {
        var decodeString = property.type.jsonDecode(
            '_json["${escapeString(property.jsonName)}"]');
        fromJsonString.writeln('    if (_json.containsKey'
                               '("${escapeString(property.jsonName)}")) {');
        fromJsonString.writeln('      ${property.name} = ${decodeString};');
        fromJsonString.writeln('    }');
      }
    });
    fromJsonString.writeln('  }');

    var toJsonString = new StringBuffer();
    toJsonString.writeln('  ${imports.core}.Map toJson() {');
    toJsonString.writeln('    var _json = new ${imports.core}.Map();');

    properties.forEach((DartClassProperty property) {
      toJsonString.writeln('    if (${property.name} != null) {');
      toJsonString.writeln(
          '      _json["${escapeString(property.jsonName)}"] = '
          '${property.type.jsonEncode('${property.name}')};');
      toJsonString.writeln('    }');
    });
    toJsonString.writeln('    return _json;');
    toJsonString.write('  }');

    return
'''
${comment.asDartDoc(0)}class $className $superClassString{
$propertyString
  $className();

$fromJsonString
$toJsonString
}
''';
  }

  String get declaration => '$className';

  String jsonEncode(String value) {
    return '(${value}).toJson()';
  }

  String jsonDecode(String json) {
    return 'new $className.fromJson($json)';
  }

  bool isVariantDiscriminator(DartClassProperty prop) {
    return superVariantType != null &&
           prop.jsonName == superVariantType.discriminant;
  }

  String discriminatorValue() {
    for (var key in superVariantType.map.keys) {
      var value = superVariantType.map[key];
      if (value == this) return key;
    }
    throw new StateError('Could not find my discriminator string.');
  }
}

/**
 * Represents a schema variant type.
 */
class AbstractVariantType extends ComplexDartSchemaType {
  final String discriminant;
  final Map<String, DartSchemaType> map;

  AbstractVariantType(DartApiImports imports,
                      Identifier name,
                      this.discriminant,
                      this.map,
                      {Comment comment})
      : super(imports, name, comment: comment);

  DartSchemaType _resolve(DartSchemaTypeDB db) {
    map.forEach((String name, DartSchemaType ref) {
      var resolvedType = ref.resolve(db);
      if (resolvedType is ObjectType) {
        map[name] = resolvedType;
        // Set superclass to ourselves.
        if (resolvedType.superVariantType == null) {
          resolvedType.superVariantType = this;
        } else {
          throw new StateError('Superclass already set. A object type should '
                               'have only one superclass');
        }
      } else {
        throw new StateError('A variant type can only have concrete object '
                             'types as subclasses.');
      }
    });
    return this;
  }

  String get instantiation => null;

  String get classDefinition {
    var fromJsonString = new StringBuffer();
    fromJsonString.writeln(
        '  factory $className.fromJson(${imports.core}.Map json) {');
    fromJsonString.writeln('    var discriminant = json["$discriminant"];');
    map.forEach((String name, DartSchemaType type) {
      fromJsonString.writeln('    if (discriminant == "$name") {');
      fromJsonString.writeln('      return new ${type.declaration}'
                             '.fromJson(json);');
      fromJsonString.writeln('    }');
    });
    fromJsonString.writeln('    throw new ${imports.core}.ArgumentError'
                           '("Invalid discriminant: \$discriminant!");');
    fromJsonString.writeln('  }');

    var toJsonString = new StringBuffer();
    toJsonString.writeln('  ${imports.core}.Map toJson();');

    return
'''
${comment.asDartDoc(0)}abstract class $className {
  $className();
$fromJsonString
$toJsonString
}
''';
  }

  String get declaration => '$className';

  String jsonEncode(String value) {
    return '(${value}).toJson()';
  }

  String jsonDecode(String json) {
    return 'new $className.fromJson($json)';
  }
}



/**
 * Parses all schemas in [description] and returns a [DartSchemaTypeDB].
 */
DartSchemaTypeDB parseSchemas(DartApiImports imports,
                              RestDescription description) {
  var namer = imports.namer;
  var db = new DartSchemaTypeDB(imports);

  DartSchemaType register(DartSchemaType type) {
    if (type is! DartSchemaForwardRef) {
      // Add [type] to list of all types.
      db.dartTypes.add(type);
    }
    return type;
  }

  void registerTopLevel(String schemaName, DartSchemaType type) {
    db.namedSchemaTypes[schemaName] = type;
  }

  /*
   * Primitive types "integer"/"boolean"/"double"/"number"/"string":
   *   { "type": "boolean" ... }
   *
   * Any type:
   *   { "type" : "any" ... }
   *
   * Array types:
   *   { "type": "array", "items" : {"type": ...}, ... }
   *
   * Map types:
   *   {
   *     "type": "object",
   *     "additionalProperties" : {"type": ...},
   *     ...
   *   }
   *   => key is always String
   *
   * Forward references:
   *   { "$ref" : "NamedSchemaType" }
   *
   * Normal objects:
   *   {
   *     "type" : "object",
   *     "properties": {"prop1" : {"type" : ...}, ... },
   *     ...
   *   }
   *
   * Variant objects:
   *   {
   *     "type" : 'object",
   *     "variant": {
   *       "discriminant" : "type",
   *       "map": [
   *           { "type_value" : "type_a", "$ref" : "NamedSchemaType" },
   *           { "type_value" : "type_b", "$ref" : "NamedSchemaType" }
   *       ]
   *     }
   *   }
   *
   * If these types appear on the top level, i.e. in the {"schemas" { XXX }},
   * they are named, otherwise they are unnamed.
   */
  DartSchemaType parse(String className,
                       Scope classScope,
                       JsonSchema schema,
                       {bool topLevel: false}) {
    if (schema.repeated != null) {
      throw new ArgumentError('Only path/query parameters can be repeated.');
    }

    if (schema.type == 'object') {
      var comment = new Comment(schema.description);

      if (schema.additionalProperties != null) {
        var anonValueClassName =
            namer.schemaClassName('${className}Value');
        var anonClassScope = namer.newClassScope();
        var valueType = parse(anonValueClassName,
                              anonClassScope,
                              schema.additionalProperties);
        if (topLevel) {
          if (schema.additionalProperties.description != null) {
            comment = new Comment(
                '${comment.rawComment}\n\n'
                '${schema.additionalProperties.description}');
          }
          // This is a named map type.
          var classId = namer.schemaClass(className);
          return register(new NamedMapType(
              imports, classId, db.stringType, valueType, comment: comment));
        } else {
          // This is an unnamed map type.
          return register(
              new UnnamedMapType(imports, db.stringType, valueType));
        }
      } else if (schema.variant != null) {
        // This is a variant type, declaring the type discriminant field and all
        // subclasses.
        var map = <String, DartSchemaType>{};
        schema.variant.map.forEach((JsonSchemaVariantMap mapItem) {
          map[mapItem.type_value] =
              new DartSchemaForwardRef(imports, mapItem.$ref);
        });
        var classId = namer.schemaClass(className);
        return register(new AbstractVariantType(
            imports, classId, schema.variant.discriminant, map));
      } else {
        // This is a normal named schema class, we generate a normal
        // [ObjectType] for it with the defined properties.
        var classId = namer.schemaClass(className);
        var properties = new List<DartClassProperty>();
        if (schema.properties != null) {
          orderedForEach(schema.properties,
                         (String jsonPName, JsonSchema value) {
            var propertyName = classScope.newIdentifier(jsonPName);
            var propertyClass = namer.schemaClassName(
                jsonPName, parent: className);
            var propertyClassScope = namer.newClassScope();

            var propertyType = parse(propertyClass, propertyClassScope, value);

            var comment = new Comment(value.description);
            comment = extendEnumComment(comment, propertyType);
            var byteArrayAccessor = null;
            if (value.format == 'byte' && value.type == 'string') {
              byteArrayAccessor =
                  classScope.newIdentifier('${jsonPName}AsBytes');
            }
            var property = new DartClassProperty(
                propertyName, comment, propertyType, jsonPName,
                byteArrayAccessor: byteArrayAccessor);
            properties.add(property);
          });
        }
        return register(
            new ObjectType(imports, classId, properties, comment: comment));
      }
    } else if (schema.type == 'array') {
      var comment = new Comment(schema.description);
      if (topLevel) {
        var elementClassName =
            namer.schemaClassName('${className}Element');
        var classId = namer.schemaClass(className);
        return register(new NamedArrayType(imports,
                        classId,
                        parse(elementClassName,
                              namer.newClassScope(),
                              schema.items),
                        comment: comment));
      } else {
        return register(new UnnamedArrayType(imports,
                parse(className, namer.newClassScope(), schema.items)));
      }
    } else if (schema.type == 'boolean') {
      return db.booleanType;
    } else if (schema.type == 'string') {
      if (schema.enumProperty != null) {
        return register(new EnumType(
            imports, schema.enumProperty, schema.enumDescriptions));
      } else {
        return db.stringType;
      }
    } else if (schema.type == 'number') {
      return db.numberType;
    } else if (schema.type == 'double') {
      return db.doubleType;
    } else if (schema.type == 'integer') {
      // FIXME: Also take [schema.format] into account, e.g. "int64"
      return db.integerType;
    } else if (schema.type == 'any') {
      return db.anyType; // FIXME: What do we do here?
    } else if (schema.$ref != null) {
      // This is a forward or backward reference, it will be resolved in
      // another pass following the parsing.
      return register(new DartSchemaForwardRef(imports, schema.$ref));
    }
    throw new ArgumentError('Invalid JsonSchema.type (was: ${schema.type}).');
  }

  if (description.schemas != null) {
    orderedForEach(description.schemas, (String name, JsonSchema schema) {
      var className = namer.schemaClassName(name);
      var classScope = namer.newClassScope();
      registerTopLevel(name,
                       parse(className, classScope, schema, topLevel: true));
    });

    // Resolve all forward references and save list in [db.dartTypes].
    db.dartTypes = db.dartTypes.map((type) => type.resolve(db)).toList();

    // Build map of all top level dart schema classes which will be represented
    // as named dart classes.
    db.dartClassTypes.addAll(
        db.dartTypes.where((type) => type.className != null));
  }

  return db;
}

// NOTE: This will be called for resolving parameter types in methods.
DartSchemaType parseResolved(DartApiImports imports,
                             DartSchemaTypeDB db,
                             JsonSchema schema) {
  var primitiveTypes = {
    'boolean' : db.booleanType,
    'string' : db.stringType,
    'number' : db.numberType,
    'double' : db.doubleType,
    'integer' : db.integerType,
  };
  var primitiveType = primitiveTypes[schema.type];
  if (primitiveType == null) {
    throw new ArgumentError('Invalid JsonSchema.type (was: ${schema.type}).');
  }
  if (schema.repeated == null || !schema.repeated) {
    if (schema.enumProperty != null) {
      return new EnumType(
          imports, schema.enumProperty, schema.enumDescriptions);
    }
    return primitiveType;
  } else {
    return new UnnamedArrayType(imports, primitiveType);
  }
}


/**
 * Generates the codegen'ed dart string for all schema classes.
 */
String generateSchemas(DartSchemaTypeDB db) {
  var sb = new StringBuffer();
  db.dartClassTypes.forEach((ComplexDartSchemaType value) {
    var classDefinition = value.classDefinition;
    if (classDefinition != null) {
      sb.writeln(classDefinition);
      sb.writeln();
    }
  });

  return '$sb';
}


Comment extendEnumComment(Comment baseComment, DartSchemaType type) {
  if (type is EnumType) {
    var s = new StringBuffer()
        ..writeln(baseComment.rawComment)
        ..writeln('Possible string values are:');
    for (int i = 0; i < type.enumValues.length; i++) {
      var description = type.enumDescriptions[i];
      if (description != null && description.trim().length > 0) {
        s.writeln('- "${type.enumValues[i]}" : $description');
      } else {
        s.writeln('- "${type.enumValues[i]}"');
      }
    }
    return new Comment('$s');
  }
  return baseComment;
}