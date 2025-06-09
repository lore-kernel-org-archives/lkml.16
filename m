Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2E922A4D2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 23:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749513436; cv=none; b=GPKOPGqZJhhtvW3ESs/2b1/JG1NeSh62ZSmkK/HOLuksXChgPGv64tnwmnsz69h1/UI0DLdke3r3S3k+kZVXTkQogYjFTnV27hcDcYf3AGQPS4pOOY+RK7WeWEW72XSW34qmTl9K/ezScWb3CPmAakeJ2sJyQfmySkL3RErOOFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749513436; c=relaxed/simple;
	bh=tRzQqHrUutyzBhHIn6fDKm+FqsbWULiZFM05BhfTP+M=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jqWOwnuhW8fiLi0ZJEMl85PM0cJNOUyP6Mnr/3Aaj5myZlJtNLWFmkqvHrz5AuQ+xwzFK6EBih1mzg+eAVM1tGUknW1Iau6CW82S2xpw5nLojSKDHZCblX6Ln1BYNAm8PF/YtNYcJB+KWy/vVmtiuZhUsq3dOwS6MdC2+IV3GuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nFPjWKAM; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nFPjWKAM"
Message-ID: <cb354fd2-bece-42ef-9213-de7512e80912@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749513432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MA2f4Uv02tKPXsFx6OHw+Cx+7nXIdLjvoA4VfDNY4ak=;
	b=nFPjWKAM4H/2hsS40TUC4K/2dozlE+zUTL+oHvQSylbgnqedmiWHYQxcsKB6OI5zGUEUkf
	j9FQDMnXndb08pA2BVXura3IDpHXqRh5aFkAYY/kRCsdxu7pcerqVugmWxnruqjkGNXPyH
	5V1h/AgsHLuFWFMOrfB8gSa6IeDMFIg=
Date: Mon, 9 Jun 2025 19:57:05 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
Subject: [BUG] Deferred probe loop with child devices
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

I've been running into a deferred probe loop when a device gets
EPROBE_DEFER after registering a bus with children:

deferred_probe_work_func()
  driver_probe_device(parent)
    test_parent_probe(parent)
      device_add(child)
        (probe successful)
        driver_bound(child)
          driver_deferred_probe_trigger()
      return -EPROBE_DEFER
    driver_deferred_probe_add(parent)
    // deferred_trigger_count changed, so...
    driver_deferred_probe_trigger()

Because there was another successful probe during the parent's probe,
driver_probe_device thinks we need to retry the whole probe process. But
we will never make progress this way because the only thing that changed
was a direct result of our own probe function.

Ideally I'd like to ignore probe events resulting from our own children
when probing. I think this would need a per-device probe counter that
gets added to the parent's on removal. Is that the right way to approach
things?

I've attached a minimal example below. When you load it, the console
will be filled with 

    test_parent_driver test_parent_driver.0: probing...

If this occurs because the module for the affected resource is missing
then the entire boot process will come to a halt (or not, depending on
how you look at things) while waiting for the parent.

While this example is contrived, this situation really does occur with
netdevs that acquire resources after creating their internal MDIO bus.
Reordering things so the MDIO bus is created last is not a very
satisfying solution, since the affected resources may itself be on the
MDIO bus.

--Sean

---
 drivers/base/test/Makefile              |   1 +
 drivers/base/test/test_deferred_probe.c | 103 ++++++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 drivers/base/test/test_deferred_probe.c

diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index e321dfc7e922..f5ba5bca7bce 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TEST_ASYNC_DRIVER_PROBE)	+= test_async_driver_probe.o
+obj-m += test_deferred_probe.o
 
 obj-$(CONFIG_DM_KUNIT_TEST)	+= root-device-test.o
 obj-$(CONFIG_DM_KUNIT_TEST)	+= platform-device-test.o
diff --git a/drivers/base/test/test_deferred_probe.c b/drivers/base/test/test_deferred_probe.c
new file mode 100644
index 000000000000..89b68afed348
--- /dev/null
+++ b/drivers/base/test/test_deferred_probe.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2025 Sean Anderson <sean.anderson@seco.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+static struct platform_driver child_driver = {
+	.driver = {
+		.name = "test_child_driver",
+	},
+};
+
+static int test_parent_probe(struct platform_device *pdev)
+{
+	struct platform_device *child;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	dev_info(dev, "probing...\n");
+
+	/* Probe a child on a bus of some kind */
+	child = platform_device_alloc("test_child_driver", 0);
+	if (!child)
+		return -ENOMEM;
+
+	child->dev.parent = dev;
+	ret = platform_device_add(child);
+	if (ret) {
+		dev_err(dev, "could not add child: %d\n", ret);
+		platform_device_put(child);
+		return ret;
+	}
+
+	/* Whoops, we got -EPROBE_DEFER from something else! */
+	platform_device_unregister(child);
+	return dev_err_probe(dev, -EPROBE_DEFER, "deferring...\n");
+}
+
+static struct platform_driver parent_driver = {
+	.driver = {
+		.name = "test_parent_driver",
+	},
+	.probe = test_parent_probe,
+};
+
+static struct platform_device *parent;
+
+static int __init test_deferred_probe_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&parent_driver);
+	if (ret) {
+		pr_err("could not register parent driver: %d\n", ret);
+		return ret;
+	}
+
+	ret = platform_driver_register(&child_driver);
+	if (ret) {
+		pr_err("could not register child driver: %d\n", ret);
+		goto err_parent_driver;
+	}
+
+	parent = platform_device_alloc("test_parent_driver", 0);
+	if (!parent) {
+		ret = -ENOMEM;
+		goto err_child_driver;
+	}
+
+	pr_info("registering parent device\n");
+	ret = platform_device_add(parent);
+	if (ret) {
+		pr_err("Failed to add parent: %d\n", ret);
+		platform_device_put(parent) ;
+		goto err_child_driver;
+	}
+
+	return 0;
+
+err_child_driver:
+	platform_driver_unregister(&child_driver);
+err_parent_driver:
+	platform_driver_unregister(&parent_driver);
+	return ret;
+}
+module_init(test_deferred_probe_init);
+
+static void __exit test_deferred_probe_exit(void)
+{
+	platform_driver_unregister(&parent_driver);
+	platform_driver_unregister(&child_driver);
+	platform_device_unregister(parent);
+}
+module_exit(test_deferred_probe_exit);
+
+MODULE_DESCRIPTION("Test module for deferred driver probing");
+MODULE_AUTHOR("Sean Anderson <sean.anderson@seco.com>");
+MODULE_LICENSE("GPL");
-- 
2.35.1.1320.gc452695387.dirty

