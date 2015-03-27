// This is a generated file (see the discoveryapis_generator project).

library discoveryapis_tests.toyApi.D0_1;

import 'dart:core' as core;
import 'dart:collection' as collection;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client toyApi/0.1';

class ToyApiApi {

  final commons.ApiRequester _requester;

  ComputeResourceApi get compute => new ComputeResourceApi(_requester);
  StorageResourceApi get storage => new StorageResourceApi(_requester);

  ToyApiApi(http.Client client, {core.String rootUrl: "http://localhost:9090/", core.String servicePath: "api/toyApi/0.1/"}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);

  /**
   * Request parameters:
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future failing() {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;


    _downloadOptions = null;

    _url = 'failing';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => null);
  }

  /**
   * Request parameters:
   *
   * Completes with a [ToyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyResponse> hello() {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;



    _url = 'hello';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyResponse.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [MapOfToyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<MapOfToyResponse> helloListOfClass(ListOfToyRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }


    _url = 'helloListOfClass';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new MapOfToyResponse.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [MapOfToyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<MapOfToyResponse> helloListOfListOfClass(ListOfListOfToyRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }


    _url = 'helloListOfListOfClass';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new MapOfToyResponse.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [MapOfint].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<MapOfint> helloMap(MapOfint request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode(request);
    }


    _url = 'helloMap';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new MapOfint.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * [name] - Path parameter: 'name'.
   *
   * [age] - Path parameter: 'age'.
   *
   * Completes with a [ToyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyResponse> helloNameAge(core.String name, core.int age) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (age == null) {
      throw new core.ArgumentError("Parameter age is required.");
    }


    _url = 'hello/' + commons.Escaper.ecapeVariable('$name') + '/age/' + commons.Escaper.ecapeVariable('$age');

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyResponse.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * [name] - Path parameter: 'name'.
   *
   * Completes with a [ToyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyResponse> helloNamePostAge(ToyAgeRequest request, core.String name) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }


    _url = 'helloPost/' + commons.Escaper.ecapeVariable('$name');

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyResponse.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * [name] - Path parameter: 'name'.
   *
   * [foo] - Query parameter: 'foo'.
   *
   * [age] - Query parameter: 'age'.
   *
   * Completes with a [ToyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyResponse> helloNameQueryAgeFoo(core.String name, {core.String foo, core.int age}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (foo != null) {
      _queryParams["foo"] = [foo];
    }
    if (age != null) {
      _queryParams["age"] = ["${age}"];
    }


    _url = 'helloQuery/' + commons.Escaper.ecapeVariable('$name');

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyResponse.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [ListOfListOfString].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ListOfListOfString> helloNestedListList(ListOfListOfint request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode(request);
    }


    _url = 'helloNestedListList';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ListOfListOfString.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [ListOfMapOfListOfString].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ListOfMapOfListOfString> helloNestedListMapList(ListOfMapOfListOfint request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode(request);
    }


    _url = 'helloNestedListMapList';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ListOfMapOfListOfString.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * Completes with a [ToyMapResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyMapResponse> helloNestedMap() {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;



    _url = 'helloNestedMap';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyMapResponse.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [MapOfListOfMapOfbool].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<MapOfListOfMapOfbool> helloNestedMapListMap(MapOfListOfMapOfint request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode(request);
    }


    _url = 'helloNestedMapListMap';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new MapOfListOfMapOfbool.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [MapOfMapOfbool].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<MapOfMapOfbool> helloNestedMapMap(MapOfMapOfint request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode(request);
    }


    _url = 'helloNestedMapMap';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new MapOfMapOfbool.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [ToyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyResponse> helloPost(ToyRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }


    _url = 'helloPost';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyResponse.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * Completes with a [ToyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyResponse> helloReturnNull() {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;



    _url = 'helloReturnNull';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyResponse.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * Completes with a [ToyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyResponse> helloVoid() {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;



    _url = 'helloVoid';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyResponse.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future noop() {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;


    _downloadOptions = null;

    _url = 'noop';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => null);
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [ListOfString].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ListOfString> reverseList(ListOfString request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode(request);
    }


    _url = 'reverseList';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ListOfString.fromJson(data));
  }

}


class ComputeResourceApi {
  final commons.ApiRequester _requester;

  ComputeResourceApi(commons.ApiRequester client) : 
      _requester = client;

  /**
   * Request parameters:
   *
   * [resource] - Path parameter: 'resource'.
   *
   * [compute] - Path parameter: 'compute'.
   *
   * Completes with a [ToyResourceResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyResourceResponse> get(core.String resource, core.String compute) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if (compute == null) {
      throw new core.ArgumentError("Parameter compute is required.");
    }


    _url = 'toyresource/' + commons.Escaper.ecapeVariable('$resource') + '/compute/' + commons.Escaper.ecapeVariable('$compute');

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyResourceResponse.fromJson(data));
  }

}


class StorageResourceApi {
  final commons.ApiRequester _requester;

  StorageResourceApi(commons.ApiRequester client) : 
      _requester = client;

  /**
   * Request parameters:
   *
   * [resource] - Path parameter: 'resource'.
   *
   * [storage] - Path parameter: 'storage'.
   *
   * Completes with a [ToyResourceResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ToyResourceResponse> get(core.String resource, core.String storage) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if (storage == null) {
      throw new core.ArgumentError("Parameter storage is required.");
    }


    _url = 'toyresource/' + commons.Escaper.ecapeVariable('$resource') + '/storage/' + commons.Escaper.ecapeVariable('$storage');

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ToyResourceResponse.fromJson(data));
  }

}



class ListOfListOfString
    extends collection.ListBase<core.List<core.String>> {
  final core.List<core.List<core.String>> _inner;

  ListOfListOfString() : _inner = [];

  ListOfListOfString.fromJson(core.List json)
      : _inner = json.map((value) => value).toList();

  core.List toJson() {
    return _inner.map((value) => value).toList();
  }

  core.List<core.String> operator [](core.int key) => _inner[key];

  void operator []=(core.int key, core.List<core.String> value) {
    _inner[key] = value;
  }

  core.int get length => _inner.length;

  void set length(core.int newLength) {
    _inner.length = newLength;
  }
}


class ListOfListOfToyRequest
    extends collection.ListBase<core.List<ToyRequest>> {
  final core.List<core.List<ToyRequest>> _inner;

  ListOfListOfToyRequest() : _inner = [];

  ListOfListOfToyRequest.fromJson(core.List json)
      : _inner = json.map((value) => value.map((value) => new ToyRequest.fromJson(value)).toList()).toList();

  core.List toJson() {
    return _inner.map((value) => value.map((value) => (value).toJson()).toList()).toList();
  }

  core.List<ToyRequest> operator [](core.int key) => _inner[key];

  void operator []=(core.int key, core.List<ToyRequest> value) {
    _inner[key] = value;
  }

  core.int get length => _inner.length;

  void set length(core.int newLength) {
    _inner.length = newLength;
  }
}


class ListOfListOfint
    extends collection.ListBase<core.List<core.int>> {
  final core.List<core.List<core.int>> _inner;

  ListOfListOfint() : _inner = [];

  ListOfListOfint.fromJson(core.List json)
      : _inner = json.map((value) => value).toList();

  core.List toJson() {
    return _inner.map((value) => value).toList();
  }

  core.List<core.int> operator [](core.int key) => _inner[key];

  void operator []=(core.int key, core.List<core.int> value) {
    _inner[key] = value;
  }

  core.int get length => _inner.length;

  void set length(core.int newLength) {
    _inner.length = newLength;
  }
}


class ListOfMapOfListOfString
    extends collection.ListBase<core.Map<core.String, core.List<core.String>>> {
  final core.List<core.Map<core.String, core.List<core.String>>> _inner;

  ListOfMapOfListOfString() : _inner = [];

  ListOfMapOfListOfString.fromJson(core.List json)
      : _inner = json.map((value) => value).toList();

  core.List toJson() {
    return _inner.map((value) => value).toList();
  }

  core.Map<core.String, core.List<core.String>> operator [](core.int key) => _inner[key];

  void operator []=(core.int key, core.Map<core.String, core.List<core.String>> value) {
    _inner[key] = value;
  }

  core.int get length => _inner.length;

  void set length(core.int newLength) {
    _inner.length = newLength;
  }
}


class ListOfMapOfListOfint
    extends collection.ListBase<core.Map<core.String, core.List<core.int>>> {
  final core.List<core.Map<core.String, core.List<core.int>>> _inner;

  ListOfMapOfListOfint() : _inner = [];

  ListOfMapOfListOfint.fromJson(core.List json)
      : _inner = json.map((value) => value).toList();

  core.List toJson() {
    return _inner.map((value) => value).toList();
  }

  core.Map<core.String, core.List<core.int>> operator [](core.int key) => _inner[key];

  void operator []=(core.int key, core.Map<core.String, core.List<core.int>> value) {
    _inner[key] = value;
  }

  core.int get length => _inner.length;

  void set length(core.int newLength) {
    _inner.length = newLength;
  }
}


class ListOfString
    extends collection.ListBase<core.String> {
  final core.List<core.String> _inner;

  ListOfString() : _inner = [];

  ListOfString.fromJson(core.List json)
      : _inner = json.map((value) => value).toList();

  core.List toJson() {
    return _inner.map((value) => value).toList();
  }

  core.String operator [](core.int key) => _inner[key];

  void operator []=(core.int key, core.String value) {
    _inner[key] = value;
  }

  core.int get length => _inner.length;

  void set length(core.int newLength) {
    _inner.length = newLength;
  }
}


class ListOfToyRequest
    extends collection.ListBase<ToyRequest> {
  final core.List<ToyRequest> _inner;

  ListOfToyRequest() : _inner = [];

  ListOfToyRequest.fromJson(core.List json)
      : _inner = json.map((value) => new ToyRequest.fromJson(value)).toList();

  core.List toJson() {
    return _inner.map((value) => (value).toJson()).toList();
  }

  ToyRequest operator [](core.int key) => _inner[key];

  void operator []=(core.int key, ToyRequest value) {
    _inner[key] = value;
  }

  core.int get length => _inner.length;

  void set length(core.int newLength) {
    _inner.length = newLength;
  }
}


class MapOfListOfMapOfbool
    extends collection.MapBase<core.String, core.List<core.Map<core.String, core.bool>>> {
  final core.Map _innerMap = {};

  MapOfListOfMapOfbool();

  MapOfListOfMapOfbool.fromJson(core.Map _json) {
    _json.forEach((core.String key, value) {
      this[key] = value;
    });
  }

  core.Map toJson() {
    var _json = {};
    this.forEach((core.String key, value) {
      _json[key] = value;
    });
    return _json;
  }

  core.List<core.Map<core.String, core.bool>> operator [](core.Object key)
      => _innerMap[key];

  operator []=(core.String key, core.List<core.Map<core.String, core.bool>> value) {
    _innerMap[key] = value;
  }

  void clear() {
    _innerMap.clear();
  }

  core.Iterable<core.String> get keys => _innerMap.keys;

  core.List<core.Map<core.String, core.bool>> remove(core.Object key) => _innerMap.remove(key);
}


class MapOfListOfMapOfint
    extends collection.MapBase<core.String, core.List<core.Map<core.String, core.int>>> {
  final core.Map _innerMap = {};

  MapOfListOfMapOfint();

  MapOfListOfMapOfint.fromJson(core.Map _json) {
    _json.forEach((core.String key, value) {
      this[key] = value;
    });
  }

  core.Map toJson() {
    var _json = {};
    this.forEach((core.String key, value) {
      _json[key] = value;
    });
    return _json;
  }

  core.List<core.Map<core.String, core.int>> operator [](core.Object key)
      => _innerMap[key];

  operator []=(core.String key, core.List<core.Map<core.String, core.int>> value) {
    _innerMap[key] = value;
  }

  void clear() {
    _innerMap.clear();
  }

  core.Iterable<core.String> get keys => _innerMap.keys;

  core.List<core.Map<core.String, core.int>> remove(core.Object key) => _innerMap.remove(key);
}


class MapOfMapOfbool
    extends collection.MapBase<core.String, core.Map<core.String, core.bool>> {
  final core.Map _innerMap = {};

  MapOfMapOfbool();

  MapOfMapOfbool.fromJson(core.Map _json) {
    _json.forEach((core.String key, value) {
      this[key] = value;
    });
  }

  core.Map toJson() {
    var _json = {};
    this.forEach((core.String key, value) {
      _json[key] = value;
    });
    return _json;
  }

  core.Map<core.String, core.bool> operator [](core.Object key)
      => _innerMap[key];

  operator []=(core.String key, core.Map<core.String, core.bool> value) {
    _innerMap[key] = value;
  }

  void clear() {
    _innerMap.clear();
  }

  core.Iterable<core.String> get keys => _innerMap.keys;

  core.Map<core.String, core.bool> remove(core.Object key) => _innerMap.remove(key);
}


class MapOfMapOfint
    extends collection.MapBase<core.String, core.Map<core.String, core.int>> {
  final core.Map _innerMap = {};

  MapOfMapOfint();

  MapOfMapOfint.fromJson(core.Map _json) {
    _json.forEach((core.String key, value) {
      this[key] = value;
    });
  }

  core.Map toJson() {
    var _json = {};
    this.forEach((core.String key, value) {
      _json[key] = value;
    });
    return _json;
  }

  core.Map<core.String, core.int> operator [](core.Object key)
      => _innerMap[key];

  operator []=(core.String key, core.Map<core.String, core.int> value) {
    _innerMap[key] = value;
  }

  void clear() {
    _innerMap.clear();
  }

  core.Iterable<core.String> get keys => _innerMap.keys;

  core.Map<core.String, core.int> remove(core.Object key) => _innerMap.remove(key);
}


class MapOfToyResponse
    extends collection.MapBase<core.String, ToyResponse> {
  final core.Map _innerMap = {};

  MapOfToyResponse();

  MapOfToyResponse.fromJson(core.Map _json) {
    _json.forEach((core.String key, value) {
      this[key] = new ToyResponse.fromJson(value);
    });
  }

  core.Map toJson() {
    var _json = {};
    this.forEach((core.String key, value) {
      _json[key] = (value).toJson();
    });
    return _json;
  }

  ToyResponse operator [](core.Object key)
      => _innerMap[key];

  operator []=(core.String key, ToyResponse value) {
    _innerMap[key] = value;
  }

  void clear() {
    _innerMap.clear();
  }

  core.Iterable<core.String> get keys => _innerMap.keys;

  ToyResponse remove(core.Object key) => _innerMap.remove(key);
}


class MapOfint
    extends collection.MapBase<core.String, core.int> {
  final core.Map _innerMap = {};

  MapOfint();

  MapOfint.fromJson(core.Map _json) {
    _json.forEach((core.String key, value) {
      this[key] = value;
    });
  }

  core.Map toJson() {
    var _json = {};
    this.forEach((core.String key, value) {
      _json[key] = value;
    });
    return _json;
  }

  core.int operator [](core.Object key)
      => _innerMap[key];

  operator []=(core.String key, core.int value) {
    _innerMap[key] = value;
  }

  void clear() {
    _innerMap.clear();
  }

  core.Iterable<core.String> get keys => _innerMap.keys;

  core.int remove(core.Object key) => _innerMap.remove(key);
}


class NestedResponse {
  core.String nestedResult;


  NestedResponse();

  NestedResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nestedResult")) {
      nestedResult = _json["nestedResult"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (nestedResult != null) {
      _json["nestedResult"] = nestedResult;
    }
    return _json;
  }
}


class ToyAgeRequest {
  core.int age;


  ToyAgeRequest();

  ToyAgeRequest.fromJson(core.Map _json) {
    if (_json.containsKey("age")) {
      age = _json["age"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (age != null) {
      _json["age"] = age;
    }
    return _json;
  }
}


class ToyMapResponse {
  core.Map<core.String, NestedResponse> mapResult;

  core.String result;


  ToyMapResponse();

  ToyMapResponse.fromJson(core.Map _json) {
    if (_json.containsKey("mapResult")) {
      mapResult = commons.mapMap(_json["mapResult"], (item) => new NestedResponse.fromJson(item));
    }
    if (_json.containsKey("result")) {
      result = _json["result"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (mapResult != null) {
      _json["mapResult"] = commons.mapMap(mapResult, (item) => (item).toJson());
    }
    if (result != null) {
      _json["result"] = result;
    }
    return _json;
  }
}


class ToyRequest {
  core.int age;

  core.String name;


  ToyRequest();

  ToyRequest.fromJson(core.Map _json) {
    if (_json.containsKey("age")) {
      age = _json["age"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (age != null) {
      _json["age"] = age;
    }
    if (name != null) {
      _json["name"] = name;
    }
    return _json;
  }
}


class ToyResourceResponse {
  core.String result;


  ToyResourceResponse();

  ToyResourceResponse.fromJson(core.Map _json) {
    if (_json.containsKey("result")) {
      result = _json["result"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (result != null) {
      _json["result"] = result;
    }
    return _json;
  }
}


class ToyResponse {
  core.String result;


  ToyResponse();

  ToyResponse.fromJson(core.Map _json) {
    if (_json.containsKey("result")) {
      result = _json["result"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (result != null) {
      _json["result"] = result;
    }
    return _json;
  }
}
