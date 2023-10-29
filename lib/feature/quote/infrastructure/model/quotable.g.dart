// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuotesImpl _$$QuotesImplFromJson(Map<String, dynamic> json) => _$QuotesImpl(
      quotes: (json['quotes'] as List<dynamic>?)
          ?.map((e) => Quote.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$$QuotesImplToJson(_$QuotesImpl instance) =>
    <String, dynamic>{
      'quotes': instance.quotes,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

_$QuoteImpl _$$QuoteImplFromJson(Map<String, dynamic> json) => _$QuoteImpl(
      id: json['id'] as int?,
      quote: json['quote'] as String?,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$$QuoteImplToJson(_$QuoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quote': instance.quote,
      'author': instance.author,
    };
