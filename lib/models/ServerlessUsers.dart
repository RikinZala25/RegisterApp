/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the ServerlessUsers type in your schema. */
class ServerlessUsers extends amplify_core.Model {
  static const classType = const _ServerlessUsersModelType();
  final String? _userName;
  final String? _email;
  final String? _firstName;
  final String? _lastName;
  final String? _linkedInURL;
  final String? _objectURI;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();
  
  ServerlessUsersModelIdentifier get modelIdentifier {
    try {
      return ServerlessUsersModelIdentifier(
        userName: _userName!,
        email: _email!
      );
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userName {
    try {
      return _userName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get firstName {
    try {
      return _firstName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get lastName {
    try {
      return _lastName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get linkedInURL {
    try {
      return _linkedInURL!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get objectURI {
    try {
      return _objectURI!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ServerlessUsers._internal({required userName, required email, required firstName, required lastName, required linkedInURL, required objectURI, createdAt, updatedAt}): _userName = userName, _email = email, _firstName = firstName, _lastName = lastName, _linkedInURL = linkedInURL, _objectURI = objectURI, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ServerlessUsers({required String userName, required String email, required String firstName, required String lastName, required String linkedInURL, required String objectURI}) {
    return ServerlessUsers._internal(
      userName: userName,
      email: email,
      firstName: firstName,
      lastName: lastName,
      linkedInURL: linkedInURL,
      objectURI: objectURI);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServerlessUsers &&
      _userName == other._userName &&
      _email == other._email &&
      _firstName == other._firstName &&
      _lastName == other._lastName &&
      _linkedInURL == other._linkedInURL &&
      _objectURI == other._objectURI;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ServerlessUsers {");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("linkedInURL=" + "$_linkedInURL" + ", ");
    buffer.write("objectURI=" + "$_objectURI" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ServerlessUsers copyWith({String? firstName, String? lastName, String? linkedInURL, String? objectURI}) {
    return ServerlessUsers._internal(
      userName: userName,
      email: email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      linkedInURL: linkedInURL ?? this.linkedInURL,
      objectURI: objectURI ?? this.objectURI);
  }
  
  ServerlessUsers copyWithModelFieldValues({
    ModelFieldValue<String>? firstName,
    ModelFieldValue<String>? lastName,
    ModelFieldValue<String>? linkedInURL,
    ModelFieldValue<String>? objectURI
  }) {
    return ServerlessUsers._internal(
      userName: userName,
      email: email,
      firstName: firstName == null ? this.firstName : firstName.value,
      lastName: lastName == null ? this.lastName : lastName.value,
      linkedInURL: linkedInURL == null ? this.linkedInURL : linkedInURL.value,
      objectURI: objectURI == null ? this.objectURI : objectURI.value
    );
  }
  
  ServerlessUsers.fromJson(Map<String, dynamic> json)  
    : _userName = json['userName'],
      _email = json['email'],
      _firstName = json['firstName'],
      _lastName = json['lastName'],
      _linkedInURL = json['linkedInURL'],
      _objectURI = json['objectURI'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'userName': _userName, 'email': _email, 'firstName': _firstName, 'lastName': _lastName, 'linkedInURL': _linkedInURL, 'objectURI': _objectURI, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'userName': _userName,
    'email': _email,
    'firstName': _firstName,
    'lastName': _lastName,
    'linkedInURL': _linkedInURL,
    'objectURI': _objectURI,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ServerlessUsersModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ServerlessUsersModelIdentifier>();
  static final USERNAME = amplify_core.QueryField(fieldName: "userName");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final FIRSTNAME = amplify_core.QueryField(fieldName: "firstName");
  static final LASTNAME = amplify_core.QueryField(fieldName: "lastName");
  static final LINKEDINURL = amplify_core.QueryField(fieldName: "linkedInURL");
  static final OBJECTURI = amplify_core.QueryField(fieldName: "objectURI");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ServerlessUsers";
    modelSchemaDefinition.pluralName = "ServerlessUsers";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["userName", "email"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServerlessUsers.USERNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServerlessUsers.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServerlessUsers.FIRSTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServerlessUsers.LASTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServerlessUsers.LINKEDINURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServerlessUsers.OBJECTURI,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ServerlessUsersModelType extends amplify_core.ModelType<ServerlessUsers> {
  const _ServerlessUsersModelType();
  
  @override
  ServerlessUsers fromJson(Map<String, dynamic> jsonData) {
    return ServerlessUsers.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ServerlessUsers';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ServerlessUsers] in your schema.
 */
class ServerlessUsersModelIdentifier implements amplify_core.ModelIdentifier<ServerlessUsers> {
  final String userName;
  final String email;

  /**
   * Create an instance of ServerlessUsersModelIdentifier using [userName] the primary key.
   * And [email] the sort key.
   */
  const ServerlessUsersModelIdentifier({
    required this.userName,
    required this.email});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'userName': userName,
    'email': email
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ServerlessUsersModelIdentifier(userName: $userName, email: $email)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ServerlessUsersModelIdentifier &&
      userName == other.userName &&
      email == other.email;
  }
  
  @override
  int get hashCode =>
    userName.hashCode ^
    email.hashCode;
}