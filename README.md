# custom-integrations-demo

Demonstration of how to build custom distributable integrations for
[WebhookDB](https://github.com/webhookdb/webhookdb).

You should be able to base your own integrations off the code in this repo.

See <https://docs.webhookdb.com/guides/custom-integrations/> for more information.

```
make up
make migrate-test
make test
MESSAGE=example_message make message-render-html
```
