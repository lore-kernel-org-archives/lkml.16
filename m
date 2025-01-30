Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1DA1F12E9
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 21:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272541; cv=none; b=JxGnWu1e5oFMtXzmI3Vs1MOG98dV8BTAIQtW2v7Evf07Ytw+BxAel25y+SrCGCsz9w8QtI/T0wjpa5acbBsmesnJQSbkUq2MFTis0d2Urv3bmUm6j8t14tOWvOiVGJYnDfhHTiViKVYvjJYgA/VjIfl1zNjWv0YoN6yJbNK66nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272541; c=relaxed/simple;
	bh=NqKvdpC7/h9M8fbWhxTLYpD/CXyBpPui9nmBSWL2bfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAZ16M1mzfBrr45UZSIkybbXfwFqrV6fCZscFruqKXy4juhkBct9qkSgah7LcYOlZG+601RnacVwKiC1uCmX5IPkHEIkSdRO/gFrvjWf0DHp0Uk5EoXN/zyqHb12mc1iHsC7o8q9h5vMVfpb5koNcZRJy329eUomAb7nCjKUmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wl16yuCv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wl16yuCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738272539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfPXlt1BaHC9qNggpXArv/npGs2QEcWgUpdglWgCezw=;
	b=Wl16yuCvQFiwfNAYHbsptoPElkKhpjmG+Y2WjlDLUZz2c2A1P4eAmvblx8wEqteisA8pcT
	fwQK+iC+nBimUMzr00RZqIQCZadF+lOXWSDlb3S7ETOT22FCPW21XI+4FrbCqrkQntx7hP
	Hj70zqNBxkFeVov1cd2nFz7dl2eMg4Q=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-ncJL25ZOPqCR3Evyj_JIqA-1; Thu,
 30 Jan 2025 16:28:52 -0500
X-MC-Unique: ncJL25ZOPqCR3Evyj_JIqA-1
X-Mimecast-MFC-AGG-ID: ncJL25ZOPqCR3Evyj_JIqA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F40021801F13;
	Thu, 30 Jan 2025 21:28:48 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.81.115])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B94419560A3;
	Thu, 30 Jan 2025 21:28:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] WIP: drivers/base: Add virtual_device_create()
Date: Thu, 30 Jan 2025 16:28:26 -0500
Message-ID: <20250130212843.659437-1-lyude@redhat.com>
In-Reply-To: <Z5Nw8kaieLueWyUu@pollux>
References: <Z5Nw8kaieLueWyUu@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
for the taking - but the vast majority of device drivers concerned with
virtual devices do not use this and instead misuse the platform device API.

To fix this, let's start by adding a simple function that can be used for
creating virtual devices - virtual_device_create().

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

So, WIP obviously because I wrote this up in a few minutes - but this goes
off the idea that Danilo suggested to me off-list of coming up with a
simple API for handling virtual devices that's a little more obvious to
use. I wanted to get people's feedback and if we're happy with this idea,
I'm willing to go through and add some pointers to this function in various
platform API docs - along with porting over the C version of VKMS over to
this API.
---
 drivers/base/core.c    | 28 ++++++++++++++++++++++++++++
 include/linux/device.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5a1f051981149..050e644ba11d5 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4390,6 +4390,34 @@ struct device *device_create(const struct class *class, struct device *parent,
 }
 EXPORT_SYMBOL_GPL(device_create);
 
+/**
+ * virtual_device_create - creates a virtual device and registers it with sysfs
+ * @class: optional pointer to a struct class this device should be registered to
+ * @drvdata: the data to be added to the device for the callbacks
+ * @fmt: string for the device's name
+ *
+ * This function can be used to create standalone virtual devices, optionally
+ * registered to a specific class. Drivers which create virtual devices can use
+ * this. The device will live in /sys/devices/virtual.
+ *
+ * A pointer to the struct device will be returned from the call. Any further
+ * sysfs files that might be required can be created using this pointer.
+ *
+ * Returns &struct device pointer on success or ERR_PTR() on error.
+ */
+struct device *virtual_device_create(void *drvdata, const char *fmt, ...)
+{
+	va_list vargs;
+	struct device *dev;
+
+	va_start(vargs, fmt);
+	dev = device_create_groups_vargs(NULL, NULL, 0, drvdata, NULL,
+					 fmt, vargs);
+	va_end(vargs);
+	return dev;
+}
+EXPORT_SYMBOL_GPL(virtual_device_create);
+
 /**
  * device_create_with_groups - creates a device and registers it with sysfs
  * @class: pointer to the struct class that this device should be registered to
diff --git a/include/linux/device.h b/include/linux/device.h
index 80a5b32689866..74e07ec942f4e 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1244,6 +1244,8 @@ bool device_is_bound(struct device *dev);
 __printf(5, 6) struct device *
 device_create(const struct class *cls, struct device *parent, dev_t devt,
 	      void *drvdata, const char *fmt, ...);
+__printf(2, 3) struct device *
+virtual_device_create(void *drvdata, const char *fmt, ...);
 __printf(6, 7) struct device *
 device_create_with_groups(const struct class *cls, struct device *parent, dev_t devt,
 			  void *drvdata, const struct attribute_group **groups,

base-commit: b323d8e7bc03d27dec646bfdccb7d1a92411f189
-- 
2.47.1

