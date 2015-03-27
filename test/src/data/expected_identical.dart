library discoveryapis_tests.toyApi.client;

import 'dart:core' as core;
import 'dart:collection' as collection;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'package:discoveryapis-tests/messages.dart';
export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client toyApi/0.1';

class ToyApi {

  final commons.ApiRequester _requester;

  ComputeResourceApi get compute => new ComputeResourceApi(_requester);
  StorageResourceApi get storage => new StorageResourceApi(_requester);

  ToyApi(http.Client client, {core.String rootUrl: "http://localhost:9090/", core.String servicePath: "api/toyApi/0.1/"}) :
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
    return _response.then((data) => ToyResponseFactory.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [core.Map<core.String, ToyResponse>].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<core.Map<core.String, ToyResponse>> helloListOfClass(core.List<ToyRequest> request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode(request.map((value) => ToyRequestFactory.toJson(value)).toList());
    }


    _url = 'helloListOfClass';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => commons.mapMap(data, (item) => ToyResponseFactory.fromJson(item)));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [core.Map<core.String, ToyResponse>].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<core.Map<core.String, ToyResponse>> helloListOfListOfClass(core.List<core.List<ToyRequest>> request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode(request.map((value) => value.map((value) => ToyRequestFactory.toJson(value)).toList()).toList());
    }


    _url = 'helloListOfListOfClass';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => commons.mapMap(data, (item) => ToyResponseFactory.fromJson(item)));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [core.Map<core.String, core.int>].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<core.Map<core.String, core.int>> helloMap(core.Map<core.String, core.int> request) {
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
    return _response.then((data) => data);
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
    return _response.then((data) => ToyResponseFactory.fromJson(data));
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
      _body = convert.JSON.encode(ToyAgeRequestFactory.toJson(request));
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
    return _response.then((data) => ToyResponseFactory.fromJson(data));
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
    return _response.then((data) => ToyResponseFactory.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [core.List<core.List<core.String>>].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<core.List<core.List<core.String>>> helloNestedListList(core.List<core.List<core.int>> request) {
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
    return _response.then((data) => data);
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [core.List<core.Map<core.String,
   * core.List<core.String>>>].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<core.List<core.Map<core.String, core.List<core.String>>>> helloNestedListMapList(core.List<core.Map<core.String, core.List<core.int>>> request) {
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
    return _response.then((data) => data);
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
    return _response.then((data) => ToyMapResponseFactory.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [core.Map<core.String, core.List<core.Map<core.String,
   * core.bool>>>].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<core.Map<core.String, core.List<core.Map<core.String, core.bool>>>> helloNestedMapListMap(core.Map<core.String, core.List<core.Map<core.String, core.int>>> request) {
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
    return _response.then((data) => data);
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [core.Map<core.String, core.Map<core.String, core.bool>>].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<core.Map<core.String, core.Map<core.String, core.bool>>> helloNestedMapMap(core.Map<core.String, core.Map<core.String, core.int>> request) {
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
    return _response.then((data) => data);
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
      _body = convert.JSON.encode(ToyRequestFactory.toJson(request));
    }


    _url = 'helloPost';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => ToyResponseFactory.fromJson(data));
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
    return _response.then((data) => ToyResponseFactory.fromJson(data));
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
    return _response.then((data) => ToyResponseFactory.fromJson(data));
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
   * Completes with a [core.List<core.String>].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<core.List<core.String>> reverseList(core.List<core.String> request) {
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
    return _response.then((data) => data);
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
    return _response.then((data) => ToyResourceResponseFactory.fromJson(data));
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
    return _response.then((data) => ToyResourceResponseFactory.fromJson(data));
  }

}



class NestedResponseFactory {
  static NestedResponse fromJson(core.Map _json) {
    var message = new NestedResponse();
    if (_json.containsKey("nestedResult")) {
      message.nestedResult = _json["nestedResult"];
    }
    return message;
  }

  static core.Map toJson(NestedResponse message) {
    var _json = new core.Map();
    if (message.nestedResult != null) {
      _json["nestedResult"] = message.nestedResult;
    }
    return _json;
  }
}


class ToyAgeRequestFactory {
  static ToyAgeRequest fromJson(core.Map _json) {
    var message = new ToyAgeRequest();
    if (_json.containsKey("age")) {
      message.age = _json["age"];
    }
    return message;
  }

  static core.Map toJson(ToyAgeRequest message) {
    var _json = new core.Map();
    if (message.age != null) {
      _json["age"] = message.age;
    }
    return _json;
  }
}


class ToyMapResponseFactory {
  static ToyMapResponse fromJson(core.Map _json) {
    var message = new ToyMapResponse();
    if (_json.containsKey("mapResult")) {
      message.mapResult = commons.mapMap(_json["mapResult"], (item) => NestedResponseFactory.fromJson(item));
    }
    if (_json.containsKey("result")) {
      message.result = _json["result"];
    }
    return message;
  }

  static core.Map toJson(ToyMapResponse message) {
    var _json = new core.Map();
    if (message.mapResult != null) {
      _json["mapResult"] = commons.mapMap(message.mapResult, (item) => NestedResponseFactory.toJson(item));
    }
    if (message.result != null) {
      _json["result"] = message.result;
    }
    return _json;
  }
}


class ToyRequestFactory {
  static ToyRequest fromJson(core.Map _json) {
    var message = new ToyRequest();
    if (_json.containsKey("age")) {
      message.age = _json["age"];
    }
    if (_json.containsKey("name")) {
      message.name = _json["name"];
    }
    return message;
  }

  static core.Map toJson(ToyRequest message) {
    var _json = new core.Map();
    if (message.age != null) {
      _json["age"] = message.age;
    }
    if (message.name != null) {
      _json["name"] = message.name;
    }
    return _json;
  }
}


class ToyResourceResponseFactory {
  static ToyResourceResponse fromJson(core.Map _json) {
    var message = new ToyResourceResponse();
    if (_json.containsKey("result")) {
      message.result = _json["result"];
    }
    return message;
  }

  static core.Map toJson(ToyResourceResponse message) {
    var _json = new core.Map();
    if (message.result != null) {
      _json["result"] = message.result;
    }
    return _json;
  }
}


class ToyResponseFactory {
  static ToyResponse fromJson(core.Map _json) {
    var message = new ToyResponse();
    if (_json.containsKey("result")) {
      message.result = _json["result"];
    }
    return message;
  }

  static core.Map toJson(ToyResponse message) {
    var _json = new core.Map();
    if (message.result != null) {
      _json["result"] = message.result;
    }
    return _json;
  }
}


