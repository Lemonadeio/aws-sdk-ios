//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSRekognitionResources.h"
#import <AWSCore/AWSLogging.h>

@interface AWSRekognitionResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSRekognitionResources

+ (instancetype)sharedInstance {
    static AWSRekognitionResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSRekognitionResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2016-06-27\",\
    \"endpointPrefix\":\"rekognition\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Rekognition\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"RekognitionService\",\
    \"uid\":\"rekognition-2016-06-27\"\
  },\
  \"operations\":{\
    \"CompareFaces\":{\
      \"name\":\"CompareFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CompareFacesRequest\"},\
      \"output\":{\"shape\":\"CompareFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Compares a face in the <i>source</i> input image with each face detected in the <i>target</i> input image. </p> <note> <p> If the source image contains multiple faces, the service detects the largest face and uses it to compare with each face detected in the target image. </p> </note> <p>In response, the operation returns an array of face matches ordered by similarity score with the highest similarity scores first. For each face match, the response provides a bounding box of the face and <code>confidence</code> value (indicating the level of confidence that the bounding box contains a face). The response also provides a <code>similarity</code> score, which indicates how closely the faces match. </p> <note> <p>By default, only faces with the similarity score of greater than or equal to 80% are returned in the response. You can change this value.</p> </note> <p>In addition to the face matches, the response returns information about the face in the source image, including the bounding box of the face and confidence value.</p> <note> <p> This is a stateless API operation. That is, the operation does not persist any data.</p> </note> <p>For an example, see <a>get-started-exercise-compare-faces</a> </p> <p>This operation requires permissions to perform the <code>rekognition:CompareFaces</code> action.</p>\"\
    },\
    \"CreateCollection\":{\
      \"name\":\"CreateCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCollectionRequest\"},\
      \"output\":{\"shape\":\"CreateCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Creates a collection in an AWS region. You can add faces to the collection using the operation. </p> <p>For example, you might create collections, one for each of your application users. A user can then index faces using the <code>IndexFaces</code> operation and persist results in a specific collection. Then, a user can search the collection for faces in the user-specific container. </p> <p>For an example, see <a>example1</a>. </p> <p>This operation requires permissions to perform the <code>rekognition:CreateCollection</code> action.</p>\"\
    },\
    \"DeleteCollection\":{\
      \"name\":\"DeleteCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCollectionRequest\"},\
      \"output\":{\"shape\":\"DeleteCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified collection. Note that this operation removes all faces in the collection. For an example, see <a>example1</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:DeleteCollection</code> action.</p>\"\
    },\
    \"DeleteFaces\":{\
      \"name\":\"DeleteFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteFacesRequest\"},\
      \"output\":{\"shape\":\"DeleteFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes faces from a collection. You specify a collection ID and an array of face IDs to remove from the collection.</p> <p>This operation requires permissions to perform the <code>rekognition:DeleteFaces</code> action.</p>\"\
    },\
    \"DetectFaces\":{\
      \"name\":\"DetectFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectFacesRequest\"},\
      \"output\":{\"shape\":\"DetectFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects faces within an image (JPEG or PNG) that is provided as input.</p> <p> For each face detected, the operation returns face details including a bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed set of attributes such as facial landmarks (for example, coordinates of eye and mouth), gender, presence of beard, sunglasses, etc. </p> <p>The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured faces, the algorithm may not detect the faces or might detect faces with lower confidence. </p> <note> <p>This is a stateless API operation. That is, the operation does not persist any data.</p> </note> <p>For an example, see <a>get-started-exercise-detect-faces</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:DetectFaces</code> action. </p>\"\
    },\
    \"DetectLabels\":{\
      \"name\":\"DetectLabels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectLabelsRequest\"},\
      \"output\":{\"shape\":\"DetectLabelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects instances of real-world labels within an image (JPEG or PNG) provided as input. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; and concepts like landscape, evening, and nature. For an example, see <a>get-started-exercise-detect-labels</a>.</p> <p> For each object, scene, and concept the API returns one or more labels. Each label provides the object name, and the level of confidence that the image contains the object. For example, suppose the input image has a lighthouse, the sea, and a rock. The response will include all three labels, one for each object. </p> <p> <code>{Name: lighthouse, Confidence: 98.4629}</code> </p> <p> <code>{Name: rock,Confidence: 79.2097}</code> </p> <p> <code> {Name: sea,Confidence: 75.061}</code> </p> <p> In the preceding example, the operation returns one label for each of the three objects. The operation can also return multiple labels for the same object in the image. For example, if the input image shows a flower (for example, a tulip), the operation might return the following three labels. </p> <p> <code>{Name: flower,Confidence: 99.0562}</code> </p> <p> <code>{Name: plant,Confidence: 99.0562}</code> </p> <p> <code>{Name: tulip,Confidence: 99.0562}</code> </p> <p>In this example, the detection algorithm more precisely identifies the flower as a tulip.</p> <p> You can provide the input image as an S3 object or as base64-encoded bytes. In response, the API returns an array of labels. In addition, the response also includes the orientation correction. Optionally, you can specify <code>MinConfidence</code> to control the confidence threshold for the labels returned. The default is 50%. You can also add the <code>MaxLabels</code> parameter to limit the number of labels returned. </p> <note> <p>If the object detected is a person, the operation doesn't provide the same facial details that the <a>DetectFaces</a> operation provides.</p> </note> <p>This is a stateless API operation. That is, the operation does not persist any data.</p> <p>This operation requires permissions to perform the <code>rekognition:DetectLabels</code> action. </p>\"\
    },\
    \"IndexFaces\":{\
      \"name\":\"IndexFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"IndexFacesRequest\"},\
      \"output\":{\"shape\":\"IndexFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects faces in the input image and adds them to the specified collection. </p> <p> Amazon Rekognition does not save the actual faces detected. Instead, the underlying detection algorithm first detects the faces in the input image, and for each face extracts facial features into a feature vector, and stores it in the back-end database. Amazon Rekognition uses feature vectors when performing face match and search operations using the and operations. </p> <p>If you provide the optional <code>externalImageID</code> for the input image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you call the operation, the response returns the external ID. You can use this external image ID to create a client-side index to associate the faces with each image. You can then use the index to find all faces in an image. </p> <p>In response, the operation returns an array of metadata for all detected faces. This includes, the bounding box of the detected face, confidence value (indicating the bounding box contains a face), a face ID assigned by the service for each face that is detected and stored, and an image ID assigned by the service for the input image If you request all facial attributes (using the <code>detectionAttributes</code> parameter, Rekognition returns detailed facial attributes such as facial landmarks (for example, location of eye and mount) and other facial attributes such gender. If you provide the same image, specify the same collection, and use the same external ID in the <code>IndexFaces</code> operation, Rekognition doesn't save duplicate face metadata. </p> <p>For an example, see <a>example2</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:IndexFaces</code> action.</p>\"\
    },\
    \"ListCollections\":{\
      \"name\":\"ListCollections\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCollectionsRequest\"},\
      \"output\":{\"shape\":\"ListCollectionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns list of collection IDs in your account. If the result is truncated, the response also provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p> <p>For an example, see <a>example1</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:ListCollections</code> action.</p>\"\
    },\
    \"ListFaces\":{\
      \"name\":\"ListFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListFacesRequest\"},\
      \"output\":{\"shape\":\"ListFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata for faces in the specified collection. This metadata includes information such as the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID. For an example, see <a>example3</a>. </p> <p>This operation requires permissions to perform the <code>rekognition:ListFaces</code> action.</p>\"\
    },\
    \"SearchFaces\":{\
      \"name\":\"SearchFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SearchFacesRequest\"},\
      \"output\":{\"shape\":\"SearchFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>For a given input face ID, searches the specified collection for matching faces. You get a face ID when you add a face to the collection using the <a>IndexFaces</a> operation. The operation compares the features of the input face with faces in the specified collection. </p> <note> <p>You can also search faces without indexing faces by using the <code>SearchFacesByImage</code> operation.</p> </note> <p> The operation response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match that is found. Along with the metadata, the response also includes a <code>confidence</code> value for each face match, indicating the confidence that the specific face matches the input face. </p> <p>For an example, see <a>example3</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:SearchFaces</code> action.</p>\"\
    },\
    \"SearchFacesByImage\":{\
      \"name\":\"SearchFacesByImage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SearchFacesByImageRequest\"},\
      \"output\":{\"shape\":\"SearchFacesByImageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection. </p> <note> <p> To search for all faces in an input image, you might first call the API, and then use the face IDs returned in subsequent calls to the API. </p> <p> You can also call the <code>DetectFaces</code> API and use the bounding boxes in the response to make face crops, which then you can pass in to the <code>SearchFacesByImage</code> API. </p> </note> <p> The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a <code>similarity</code> indicating how similar the face is to the input face. In the response, the API also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Rekognition used for the input image. </p> <p>For an example, see <a>example3</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:SearchFacesByImage</code> action.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You are not authorized to perform the action.</p>\",\
      \"exception\":true\
    },\
    \"Attribute\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"ALL\"\
      ]\
    },\
    \"Attributes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Attribute\"}\
    },\
    \"Beard\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face has beard or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face has a beard, and the confidence level in the determination.</p>\"\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BoundingBox\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Width\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Width of the bounding box as a ratio of the overall image width.</p>\"\
        },\
        \"Height\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Height of the bounding box as a ratio of the overall image height.</p>\"\
        },\
        \"Left\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Left coordinate of the bounding box as a ratio of overall image width.</p>\"\
        },\
        \"Top\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Top coordinate of the bounding box as a ratio of overall image height.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the bounding box around the object or face. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates representing the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p> <p>The <code>top</code> and <code>left</code> values returned are ratios of the overall image size. For example, if the input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p> <p> The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall image dimension. For example, if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p> <note> <p> The bounding box coordinates can have negative values. For example, if Amazon Rekognition is able to detect a face that is at the image edge and is only partially visible, the service can return coordinates that are outside the image bounds and, depending on the image edge, you might get negative values or values greater than 1 for the <code>left</code> or <code>top</code> values. </p> </note>\"\
    },\
    \"CollectionId\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-]+\"\
    },\
    \"CollectionIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CollectionId\"}\
    },\
    \"CompareFacesMatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Similarity\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence that the faces match.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"ComparedFace\",\
          \"documentation\":\"<p>Provides face metadata (bounding box and confidence that the bounding box actually contains a face).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provide the bounding box, confidence that the bounding box actually contains a face, and the similarity between the face in the bounding box and the face in the source image.</p>\"\
    },\
    \"CompareFacesMatchList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CompareFacesMatch\"}\
    },\
    \"CompareFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SourceImage\",\
        \"TargetImage\"\
      ],\
      \"members\":{\
        \"SourceImage\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>Source image either as bytes or an Amazon S3 object</p>\"\
        },\
        \"TargetImage\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>Target image either as bytes or an Amazon S3 object</p>\"\
        },\
        \"SimilarityThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The minimum level of confidence in the match you want included in the result.</p>\"\
        }\
      }\
    },\
    \"CompareFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceImageFace\":{\
          \"shape\":\"ComparedSourceImageFace\",\
          \"documentation\":\"<p>The face from the source image that was used for comparison.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"CompareFacesMatchList\",\
          \"documentation\":\"<p>Provides an array of <code>CompareFacesMatch </code> objects. Each object provides the bounding box, confidence that the bounding box contains a face, and the similarity between the face in the bounding box and the face in the source image.</p>\"\
        }\
      }\
    },\
    \"ComparedFace\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\"shape\":\"BoundingBox\"},\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence that what the bounding box contains is a face.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides face metadata (bounding box and confidence that the bounding box actually contains a face).</p>\"\
    },\
    \"ComparedSourceImageFace\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\"shape\":\"BoundingBox\"},\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence that the selected bounding box contains a face.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Type that describes the face Amazon Rekognition chose to compare with the faces in the target. This contains a bounding box for the selected face and confidence level that the bounding box contains a face. Note that Amazon Rekognition selects the largest face in the source image for this comparison. </p>\"\
    },\
    \"CreateCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID for the collection that you are creating.</p>\"\
        }\
      }\
    },\
    \"CreateCollectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusCode\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>HTTP status code indicating the result of the operation.</p>\"\
        },\
        \"CollectionArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Amazon Resource Name (ARN) of the collection. You can use this to manage permissions on your resources. </p>\"\
        }\
      }\
    },\
    \"Degree\":{\
      \"type\":\"float\",\
      \"max\":180,\
      \"min\":-180\
    },\
    \"DeleteCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteCollectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusCode\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>HTTP status code that indicates the result of the operation.</p>\"\
        }\
      }\
    },\
    \"DeleteFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"FaceIds\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>Collection from which to remove the specific faces.</p>\"\
        },\
        \"FaceIds\":{\
          \"shape\":\"FaceIdList\",\
          \"documentation\":\"<p>An array of face IDs to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeletedFaces\":{\
          \"shape\":\"FaceIdList\",\
          \"documentation\":\"<p>An array of strings (face IDs) of the faces that were deleted.</p>\"\
        }\
      }\
    },\
    \"DetectFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The image in which you want to detect faces. You can specify a blob or an S3 object. </p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A list of facial attributes you would like to be returned. By default, the API returns subset of facial attributes. </p> <p>For example, you can specify the value as, [\\\"ALL\\\"] or [\\\"DEFAULT\\\"]. If you provide both, [\\\"ALL\\\", \\\"DEFAULT\\\"], the service uses a logical AND operator to determine which attributes to return (in this case, it is all attributes). If you specify all attributes, Rekognition performs additional detection. </p>\"\
        }\
      }\
    },\
    \"DetectFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceDetails\":{\
          \"shape\":\"FaceDetailList\",\
          \"documentation\":\"<p>Details of each face found in the image. </p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p>The algorithm detects the image orientation. If it detects that the image was rotated, it returns the degrees of rotation. If your application is displaying the image, you can use this value to adjust the orientation. </p> <p>For example, if the service detects that the input image was rotated by 90 degrees, it corrects orientation, performs face detection, and then returns the faces. That is, the bounding box coordinates in the response are based on the corrected orientation. </p>\"\
        }\
      }\
    },\
    \"DetectLabelsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image. You can provide a blob of image bytes or an S3 object.</p>\"\
        },\
        \"MaxLabels\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>Maximum number of labels you want the service to return in the response. The service returns the specified number of highest confidence labels. </p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return any labels with confidence lower than this specified value.</p> <p>If <code>minConfidence</code> is not specified, the operation returns labels with a confidence values greater than or equal to 50 percent.</p>\"\
        }\
      }\
    },\
    \"DetectLabelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Labels\":{\
          \"shape\":\"Labels\",\
          \"documentation\":\"<p>An array of labels for the real-world objects detected. </p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p> Amazon Rekognition returns the orientation of the input image that was detected (clockwise direction). If your application displays the image, you can use this value to correct the orientation. If Rekognition detects that the input image was rotated (for example, by 90 degrees), it first corrects the orientation before detecting the labels. </p>\"\
        }\
      }\
    },\
    \"Emotion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"EmotionName\",\
          \"documentation\":\"<p>Type of emotion detected.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The emotions detected on the face, and the confidence level in the determination. For example, HAPPY, SAD, and ANGRY.</p>\"\
    },\
    \"EmotionName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HAPPY\",\
        \"SAD\",\
        \"ANGRY\",\
        \"CONFUSED\",\
        \"DISGUSTED\",\
        \"SURPRISED\",\
        \"CALM\",\
        \"UNKNOWN\"\
      ]\
    },\
    \"Emotions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Emotion\"}\
    },\
    \"ExternalImageId\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-:]+\"\
    },\
    \"EyeOpen\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the eyes on the face are open.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the eyes on the face are open, and the confidence level in the determination.</p>\"\
    },\
    \"Eyeglasses\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face is wearing eye glasses or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face is wearing eye glasses, and the confidence level in the determination.</p>\"\
    },\
    \"Face\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceId\":{\
          \"shape\":\"FaceId\",\
          \"documentation\":\"<p>Unique identifier that Amazon Rekognition assigns to the face.</p>\"\
        },\
        \"BoundingBox\":{\"shape\":\"BoundingBox\"},\
        \"ImageId\":{\
          \"shape\":\"ImageId\",\
          \"documentation\":\"<p>Unique identifier that Amazon Rekognition assigns to the source image.</p>\"\
        },\
        \"ExternalImageId\":{\
          \"shape\":\"ExternalImageId\",\
          \"documentation\":\"<p>Identifier that you assign to all the faces in the input image.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence level that the bounding box contains a face (and not a different object such as a tree).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the face properties such as the bounding box, face ID, image ID of the source image, and external image ID that you assigned. </p>\"\
    },\
    \"FaceDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box of the face.</p>\"\
        },\
        \"Smile\":{\
          \"shape\":\"Smile\",\
          \"documentation\":\"<p>Indicates whether or not the face is smiling, and the confidence level in the determination.</p>\"\
        },\
        \"Eyeglasses\":{\
          \"shape\":\"Eyeglasses\",\
          \"documentation\":\"<p>Indicates whether or not the face is wearing eye glasses, and the confidence level in the determination.</p>\"\
        },\
        \"Sunglasses\":{\
          \"shape\":\"Sunglasses\",\
          \"documentation\":\"<p>Indicates whether or not the face is wearing sunglasses, and the confidence level in the determination.</p>\"\
        },\
        \"Gender\":{\
          \"shape\":\"Gender\",\
          \"documentation\":\"<p>Gender of the face and the confidence level in the determination.</p>\"\
        },\
        \"Beard\":{\
          \"shape\":\"Beard\",\
          \"documentation\":\"<p>Indicates whether or not the face has a beard, and the confidence level in the determination.</p>\"\
        },\
        \"Mustache\":{\
          \"shape\":\"Mustache\",\
          \"documentation\":\"<p>Indicates whether or not the face has a mustache, and the confidence level in the determination.</p>\"\
        },\
        \"EyesOpen\":{\
          \"shape\":\"EyeOpen\",\
          \"documentation\":\"<p>Indicates whether or not the eyes on the face are open, and the confidence level in the determination.</p>\"\
        },\
        \"MouthOpen\":{\
          \"shape\":\"MouthOpen\",\
          \"documentation\":\"<p>Indicates whether or not the mouth on the face is open, and the confidence level in the determination.</p>\"\
        },\
        \"Emotions\":{\
          \"shape\":\"Emotions\",\
          \"documentation\":\"<p>The emotions detected on the face, and the confidence level in the determination. For example, HAPPY, SAD, and ANGRY. </p>\"\
        },\
        \"Landmarks\":{\
          \"shape\":\"Landmarks\",\
          \"documentation\":\"<p>Indicates the location of the landmark on the face.</p>\"\
        },\
        \"Pose\":{\
          \"shape\":\"Pose\",\
          \"documentation\":\"<p>Indicates the pose of the face as determined by pitch, roll, and the yaw.</p>\"\
        },\
        \"Quality\":{\
          \"shape\":\"ImageQuality\",\
          \"documentation\":\"<p>Identifies image brightness and sharpness.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence level that the bounding box contains a face (and not a different object such as a tree).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure containing attributes of the face that the algorithm detected.</p>\"\
    },\
    \"FaceDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceDetail\"}\
    },\
    \"FaceId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\"\
    },\
    \"FaceIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceId\"},\
      \"max\":4096,\
      \"min\":1\
    },\
    \"FaceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Face\"}\
    },\
    \"FaceMatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Similarity\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence in the match of this face with the input face.</p>\"\
        },\
        \"Face\":{\"shape\":\"Face\"}\
      },\
      \"documentation\":\"<p>Provides face metadata. In addition, it also provides the confidence in the match of this face with the input face.</p>\"\
    },\
    \"FaceMatchList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceMatch\"}\
    },\
    \"FaceRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Face\":{\"shape\":\"Face\"},\
        \"FaceDetail\":{\"shape\":\"FaceDetail\"}\
      },\
      \"documentation\":\"<p>Object containing both the face metadata (stored in the back-end database) and facial attributes that are detected but aren't stored in the database.</p>\"\
    },\
    \"FaceRecordList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceRecord\"}\
    },\
    \"Float\":{\"type\":\"float\"},\
    \"Gender\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"GenderType\",\
          \"documentation\":\"<p>Gender of the face.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Gender of the face and the confidence level in the determination.</p>\"\
    },\
    \"GenderType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MALE\",\
        \"FEMALE\"\
      ]\
    },\
    \"Image\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bytes\":{\
          \"shape\":\"ImageBlob\",\
          \"documentation\":\"<p>Blob of image bytes up to 5 MBs.</p>\"\
        },\
        \"S3Object\":{\
          \"shape\":\"S3Object\",\
          \"documentation\":\"<p>Identifies an S3 object as the image source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the source image either as bytes or an S3 object.</p>\"\
    },\
    \"ImageBlob\":{\
      \"type\":\"blob\",\
      \"max\":5242880,\
      \"min\":1\
    },\
    \"ImageId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\"\
    },\
    \"ImageQuality\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Brightness\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Value representing brightness of the face. The service returns a value between 0 and 1 (inclusive).</p>\"\
        },\
        \"Sharpness\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Value representing sharpness of the face.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies image brightness and sharpness. </p>\"\
    },\
    \"ImageTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input image size exceeds the allowed limit. For more information, see <a>limits</a>. </p>\",\
      \"exception\":true\
    },\
    \"IndexFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"Image\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of an existing collection to which you want to add the faces that are detected in the input images.</p>\"\
        },\
        \"Image\":{\"shape\":\"Image\"},\
        \"ExternalImageId\":{\
          \"shape\":\"ExternalImageId\",\
          \"documentation\":\"<p>ID you want to assign to all the faces detected in the image.</p>\"\
        },\
        \"DetectionAttributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>(Optional) Returns detailed attributes of indexed faces. By default, the operation returns a subset of the facial attributes. </p> <p>For example, you can specify the value as, [\\\"ALL\\\"] or [\\\"DEFAULT\\\"]. If you provide both, [\\\"ALL\\\", \\\"DEFAULT\\\"], Rekognition uses the logical AND operator to determine which attributes to return (in this case, it is all attributes). If you specify all attributes, the service performs additional detection, in addition to the default. </p>\"\
        }\
      }\
    },\
    \"IndexFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceRecords\":{\
          \"shape\":\"FaceRecordList\",\
          \"documentation\":\"<p>An array of faces detected and added to the collection. For more information, see <a>howitworks-index-faces</a>. </p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p>The algorithm detects the image orientation. If it detects that the image was rotated, it returns the degree of rotation. You can use this value to correct the orientation and also appropriately analyze the bounding box coordinates that are returned. </p>\"\
        }\
      }\
    },\
    \"InternalServerError\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Rekognition experienced a service issue. Try your call again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidImageFormatException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The provided image format is not supported. </p>\",\
      \"exception\":true\
    },\
    \"InvalidPaginationTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Pagination token in the request is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Input parameter violated a constraint. Validate your parameter before calling the API again.</p>\",\
      \"exception\":true\
    },\
    \"InvalidS3ObjectException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Rekognition is unable to access the S3 object specified in the request.</p>\",\
      \"exception\":true\
    },\
    \"Label\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name (label) of the object.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure containing details about the detected label, including bounding box, name, and level of confidence.</p>\"\
    },\
    \"Labels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Label\"}\
    },\
    \"Landmark\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"LandmarkType\",\
          \"documentation\":\"<p>Type of the landmark.</p>\"\
        },\
        \"X\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>x-coordinate from the top left of the landmark expressed as the ration of the width of the image. For example, if the images is 700x200 and the x-coordinate of the landmark is at 350 pixels, then this value is 0.5. </p>\"\
        },\
        \"Y\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>y-coordinate from the top left of the landmark expressed as the ration of the height of the image. For example, if the images is 700x200 and the y-coordinate of the landmark is at 100 pixels, then this value is 0.5.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates the location of the landmark on the face.</p>\"\
    },\
    \"LandmarkType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EYE_LEFT\",\
        \"EYE_RIGHT\",\
        \"NOSE\",\
        \"MOUTH_LEFT\",\
        \"MOUTH_RIGHT\",\
        \"LEFT_EYEBROW_LEFT\",\
        \"LEFT_EYEBROW_RIGHT\",\
        \"LEFT_EYEBROW_UP\",\
        \"RIGHT_EYEBROW_LEFT\",\
        \"RIGHT_EYEBROW_RIGHT\",\
        \"RIGHT_EYEBROW_UP\",\
        \"LEFT_EYE_LEFT\",\
        \"LEFT_EYE_RIGHT\",\
        \"LEFT_EYE_UP\",\
        \"LEFT_EYE_DOWN\",\
        \"RIGHT_EYE_LEFT\",\
        \"RIGHT_EYE_RIGHT\",\
        \"RIGHT_EYE_UP\",\
        \"RIGHT_EYE_DOWN\",\
        \"NOSE_LEFT\",\
        \"NOSE_RIGHT\",\
        \"MOUTH_UP\",\
        \"MOUTH_DOWN\",\
        \"LEFT_PUPIL\",\
        \"RIGHT_PUPIL\"\
      ]\
    },\
    \"Landmarks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Landmark\"}\
    },\
    \"ListCollectionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>Pagination token from the previous response.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>Maximum number of collection IDs to return.</p>\"\
        }\
      }\
    },\
    \"ListCollectionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CollectionIds\":{\
          \"shape\":\"CollectionIdList\",\
          \"documentation\":\"<p>An array of collection IDs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the result is truncated, the response provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p>\"\
        }\
      }\
    },\
    \"ListFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection from which to list the faces.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition returns a pagination token in the response. You can use this pagination token to retrieve the next set of faces.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>Maximum number of faces to return.</p>\"\
        }\
      }\
    },\
    \"ListFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Faces\":{\
          \"shape\":\"FaceList\",\
          \"documentation\":\"<p>An array of <code>Face</code> objects. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition returns this token that you can use in the subsequent request to retrieve the next set of faces.</p>\"\
        }\
      }\
    },\
    \"MaxFaces\":{\
      \"type\":\"integer\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"MouthOpen\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the mouth on the face is open or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the mouth on the face is open, and the confidence level in the determination.</p>\"\
    },\
    \"Mustache\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face has mustache or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face has a mustache, and the confidence level in the determination.</p>\"\
    },\
    \"OrientationCorrection\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ROTATE_0\",\
        \"ROTATE_90\",\
        \"ROTATE_180\",\
        \"ROTATE_270\"\
      ]\
    },\
    \"PageSize\":{\
      \"type\":\"integer\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"PaginationToken\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"Percent\":{\
      \"type\":\"float\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"Pose\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Roll\":{\
          \"shape\":\"Degree\",\
          \"documentation\":\"<p>Value representing the face rotation on the roll axis.</p>\"\
        },\
        \"Yaw\":{\
          \"shape\":\"Degree\",\
          \"documentation\":\"<p>Value representing the face rotation on the yaw axis.</p>\"\
        },\
        \"Pitch\":{\
          \"shape\":\"Degree\",\
          \"documentation\":\"<p>Value representing the face rotation on the pitch axis.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates the pose of the face as determined by pitch, roll, and the yaw.</p>\"\
    },\
    \"ProvisionedThroughputExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The number of requests exceeded your throughput limit. If you want to increase this limit, contact Amazon Rekognition.</p>\",\
      \"exception\":true\
    },\
    \"ResourceAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The collection with specific ID already exist.</p>\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Collection specified in the request is not found.</p>\",\
      \"exception\":true\
    },\
    \"S3Bucket\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":3,\
      \"pattern\":\"[0-9A-Za-z\\\\.\\\\-_]*\"\
    },\
    \"S3Object\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>Name of the S3 bucket.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"S3ObjectName\",\
          \"documentation\":\"<p>S3 object key name.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>If the bucket is versioning enabled, you can specify the object version. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the S3 bucket name and object name.</p>\"\
    },\
    \"S3ObjectName\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"S3ObjectVersion\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"SearchFacesByImageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"Image\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection to search.</p>\"\
        },\
        \"Image\":{\"shape\":\"Image\"},\
        \"MaxFaces\":{\
          \"shape\":\"MaxFaces\",\
          \"documentation\":\"<p>Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.</p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>(Optional) Specifies the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%.</p>\"\
        }\
      }\
    },\
    \"SearchFacesByImageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SearchedFaceBoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>The bounding box around the face in the input image that Rekognition used for the search.</p>\"\
        },\
        \"SearchedFaceConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The level of confidence that the <code>searchedFaceBoundingBox</code>, contains a face.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"FaceMatchList\",\
          \"documentation\":\"<p>An array of faces that match the input face, along with the confidence in the match.</p>\"\
        }\
      }\
    },\
    \"SearchFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"FaceId\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection to search.</p>\"\
        },\
        \"FaceId\":{\
          \"shape\":\"FaceId\",\
          \"documentation\":\"<p>ID of a face to find matches for in the collection.</p>\"\
        },\
        \"MaxFaces\":{\
          \"shape\":\"MaxFaces\",\
          \"documentation\":\"<p>Maximum number of faces to return. The API will return the maximum number of faces with the highest confidence in the match.</p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Optional value specifying the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%.</p>\"\
        }\
      }\
    },\
    \"SearchFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SearchedFaceId\":{\
          \"shape\":\"FaceId\",\
          \"documentation\":\"<p>ID of the face that was searched for matches in a collection.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"FaceMatchList\",\
          \"documentation\":\"<p>An array of faces that matched the input face, along with the confidence in the match.</p>\"\
        }\
      }\
    },\
    \"Smile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face is smiling or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face is smiling, and the confidence level in the determination.</p>\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Sunglasses\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face is wearing sunglasses or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face is wearing sunglasses, and the confidence level in the determination.</p>\"\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Rekognition is temporarily unable to process the request. Try your call again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"UInteger\":{\
      \"type\":\"integer\",\
      \"min\":0\
    }\
  },\
  \"documentation\":\"<p>This is Amazon Rekognition API guide.</p>\"\
}\
\
";
}

@end
