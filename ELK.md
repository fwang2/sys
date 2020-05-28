# ELK

- [ELK](#elk)
  - [Meta operations](#meta-operations)
    - [Check cluster health](#check-cluster-health)
    - [Check at the shard level](#check-at-the-shard-level)
    - [List all index(s)](#list-all-indexs)
    - [Show mapping of an index](#show-mapping-of-an-index)
    - [Get stats of index (including size)](#get-stats-of-index-including-size)
    - [Refresh index](#refresh-index)
    - [Delete index](#delete-index)
    - [Document counts](#document-counts)
  - [Create, Delete and Retrieval](#create-delete-and-retrieval)
    - [PUT to create new entry](#put-to-create-new-entry)
    - [Bulk API](#bulk-api)
    - [GET to retrieve an entry by ID](#get-to-retrieve-an-entry-by-id)
    - [GET to retrieve a fix number of entries](#get-to-retrieve-a-fix-number-of-entries)
    - [Get to retrieve only certain field(s)](#get-to-retrieve-only-certain-fields)
    - [HEAD for checking existence](#head-for-checking-existence)
    - [Delete single document](#delete-single-document)
    - [Delete index](#delete-index-1)
- [Lucene Query](#lucene-query)
  
## Meta operations

### Check cluster health
  
```sh
curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'
```

### Check at the shard level

This has more details at the shard level.

```sh
curl -XGET 'http://localhost:9200/_cluster/health?level=shards&pretty=true'
```

### List all index(s)

```sh
curl -XGET 'http://localhost:9200/_cat/indices?v'
```

`?v` is to print out headers, the default is `false`.

[Click here for more
information](https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-indices.html)

For KB, this can be done by:
```
GET /_cat/indices?pretty
```

### Show mapping of an index

```
GET /summit_darshan/_mapping 
```

### Get stats of index (including size)

```
GET /summit_darshan_metrics/_stat
```

### Refresh index

```
POST /summit_darshan/_refresh
```

This can be useful for it to show up in search immediately. By default, ES refresh every 1 seconds, but only on indices that has been accessed once or more over the last 30 seconds.

To refresh all indices:
```
POST /_refresh
```


### Delete index 

For KB, this will be:

```
DELETE /summit_darshan
```

### Document counts

ElasticSearch provides a count API for this:

```sh
curl -XGET 'http://localhost:9200/_cat/count/foo?v'
```

[Click here for more information](https://www.elastic.co/guide/en/elasticsearch/reference/current/cat.html)

## Create, Delete and Retrieval

### PUT to create new entry

```sh
curl -XPUT "http://localhost:9200/foo/bar/9999" -d '
{
    "name": "Oliver",
    "id": 9999,
    "department": "sales"
}
'
```

Expected `201 created` response, with `_index` as `foo`, `_type` as `bar`, and
`_id` as 9999. 

Note that `type` mapping is deprecated. See [Elastic Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/removal-of-types.html) for more information.

Note that `type` mapping is deprecated. See [Elastic Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/removal-of-types.html) for more information.

### Bulk API

Prepare a text file:

```sh
$ cat ex_create.txt
{ "index" : { "_index" : "test", "_id" : "1" } }
{ "field1" : "value1" }
```

Use `curl` as command line:

```sh
$ curl -s -H "Content-Type: application/x-ndjson" -XPOST localhost:9200/_bulk 
  --data-binary "@ex_create"; echo
```
* `-s` for silent output
* `-H` extra header
* Note second line is optional source, but for index operation, you need it;
  otherwise, it will complain empty document.
* `ndjson` is new line terminated format. You need `\n` for each line and *last line*.

```sh
$ cat ex_delete
{"delete": {"_index": "test", "_id": "1"}}
```



### GET to retrieve an entry by ID

```sh
curl -XGET "http://localhost:9200/foo/bar/9999"
```

### GET to retrieve a fix number of entries

```
GET summit_darshan/_search?size=10
```


### Get to retrieve only certain field(s)

```sh
curl -XGET "http://localhost:9200/foo/bar/9999?_source=name,department"
```


### HEAD for checking existence

```sh
curl -i -XHEAD http://localhost:9200/foo/bar/9999?pretty
```

### Delete single document

```sh
curl -XDELETE localhost:9200/indexName/type/doc_id
```

### Delete index

```sh
curl -XDELETE localhost:9200/indexName
```

# Lucene Query

Here is the [Lucene Query Syntax](https://www.elastic.co/guide/en/elasticsearch/reference/7.7/query-dsl-query-string-query.html#query-string-syntax)
