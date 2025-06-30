Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6746B226188;
	Mon, 30 Jun 2025 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270511; cv=none; b=h+235TlJJwJ/Z/HxPsEylSy+alhZHN6itzgcIY11m5ld9jaYvlRmtfKPMNQs3qtCUq0aSO+yShzwoOz8phZFu6MYTGz4xPXHvUa8DXlkNZD+AxqiY0kiGUC97FRSc7ZD3+UnmpdNoCfDygmq/1xui0zjfrIoGSaIYFR43P02gCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270511; c=relaxed/simple;
	bh=zZ69nhPC05C/IVyet5AAcunJAngX7yFVUr44yHysUEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CM5Txj1ZnoqKNqIIswxJIwE6oVoSF3xJ13pEpCxLMMfuZDmWWzjMhevf5r2pHkARte3QUrYFS91zLSlRSMopsMLB8T05pAcJ5MqI+uu+nTKwnX7XgvSuuLX/OeI4Lrn/526SqGqyo+UqdwSLa+1GW7rM0BFwAm6zqEvB6ycZ6EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxMqFkgX; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxMqFkgX"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6facacf521eso39928236d6.3;
        Mon, 30 Jun 2025 01:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751270508; x=1751875308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/hr4oZCa99X/XQ29O91yb8fYOE3pn7wlTo8T8hI858=;
        b=lxMqFkgXpjBeAp3/yvRFNiAZBlV40wzUIBPVv12BDTbAwxEQl5yh7BmkXH33W2k9fr
         I75/J32aJ181Yo88sG8RiIotJ8sYWf30sdUSMvgDl0M8dzDAv598j7djfWfNtGj3Wfly
         2CjJjMSUm2TdC1iaIQzTIbz9fdkUOHNnJlo65d9S3IzbzM77rmwarO8Ln2baGtW5wSio
         4j/wImLxNUh+fl7kJPbUn3kJmfWL1I7HIwtn+rux0w5X3+ghy5iLd4HfuDLVEmHt2DxX
         qp9xWip/fFpgsfx0ORGaeGFeqjQxF1Z3fzv7AOHlc6O7k0j2RulUbAumXI8ROBCu9SqR
         DeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270508; x=1751875308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/hr4oZCa99X/XQ29O91yb8fYOE3pn7wlTo8T8hI858=;
        b=n3I/9ZDWLaQKf83zPuAaBN2BLFNUfyiNK+hkcd50Ki2sYSFn7tCW+7ZY+ZtaC+xJWd
         QdfFCF3dpzntEAQ6OIZwE+OjTVN7A4F9OgnzXXpkndfvMiyGkJE66TWchMsm5kbu95gV
         PSTq8jVGCMupvsoLYvZUJBykkdU4BscSch2pIfALi77TiwAMmrQ4Nnbefm4hKgLiPbK3
         ENT/y9R/hnUmBJQZefqlShqOyS/0h60TLXrxfnI9JeLzgb57p1N4SZIi5IIxkRxm+ucW
         bD0jvIsXGUfajH2prpOXP8yZcu0lfVw75jK/Fdr7Fc7Hr3jmL7ju5esti3YW4aSlILd3
         NSzg==
X-Forwarded-Encrypted: i=1; AJvYcCVCQosXXg/xGV2kiHEQlNXWb6CFPZvJddLDjDY+4dIKDuieZcmOGJ6POc2f59Ce1hottFj0zF5ppoOA0i7fHWOI4bb9xA==@vger.kernel.org, AJvYcCX4AB6w9qdWxgGgv9LxHoKxzcTkTV0luDZeEJZov24QOvGjhk5OoaDQCcPxhwTqIjXeJRA1vA0yLnxxpyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLido09L5+7i3TNwxAPZtAXzubJH/bjRZd8uO1Q09PRQ++EHlI
	fNJDkYj2k6CiYAkITVZ3mmHgQELRm3BjLTwUDNCtWL9ayXDpXCCsqdvW
X-Gm-Gg: ASbGnctGee2iwC1NdfzIa8uI91AZkV2sJDNSc0tVwFdA/zG1498DpR9KHFlTpWaXO2R
	j+awY0GjXRYmmd9940W9jXlSU0eONFa/UbrEq+a/wx3GnI1F/bFUxHf65tRTFwnw/j5GkNyWcLY
	DCvERsGvyxbZjnu4wci4nGwfi4pd0yie/yVRE+DXrY030j0YVT0neafKeyXgZxPGdhCMG54kamb
	HhikUeyG2A31aX30pDNlxdeyS+ezpOaz+qxQAf/IcyKsQlEnyKJQm1JmM85/CvJv9QVdbHFPHPX
	ZvZhXHS6pav0LbX4Ktg2nxnsd8gtdMmHDngi+se5kbReUujgmwAJTVjYx5fvDF8h7fvRYY8i
X-Google-Smtp-Source: AGHT+IHskYkxpsJvBPm9JBOuX//BGvZ8iinVtXuBAELRkfUZGzB7gp1/62K3tOPOF8hmaislRkajnw==
X-Received: by 2002:a05:6214:c67:b0:6fd:6fc6:3961 with SMTP id 6a1803df08f44-70003c8eae7mr211017006d6.37.1751270508208;
        Mon, 30 Jun 2025 01:01:48 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772df637sm63677026d6.79.2025.06.30.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:01:47 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 30 Jun 2025 05:01:08 -0300
Subject: [PATCH v4 1/6] platform/x86: firmware_attributes_class: Add device
 initialization methods
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250630-fw-attrs-api-v4-1-1a04952b255f@gmail.com>
References: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
In-Reply-To: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6428; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=miBaZDkSezgefWBLluXQog1pUwOQXq4z7EwqkNdxXE8=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlJLsksi3cz3G7ZPYXn3Q3u1yy7mq8lqme9WqiyP3ZB6
 POcG4HyHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCR7ksM/1Qt8io+fFCXXZ4s
 KrpccN/sE6ua59QfmsG6Z2qHybXo5Z8ZGVbW350teOjwi7VxgvnxYYcfRfVmbP933inOcK6YT+h
 6YQ4A
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

From: Thomas Weißschuh <linux@weissschuh.net>

Currently each user of firmware_attributes_class has to manually set up
kobjects, devices, etc.

Provide this infrastructure out-of-the-box through the newly introduced
fwat_device_register().

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Co-developed-by: Kurt Borja <kuurtb@gmail.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/firmware_attributes_class.c | 125 +++++++++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h |  28 +++++
 2 files changed, 153 insertions(+)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 736e96c186d9dc6d945517f090e9af903e93bbf4..29c303c20d47a7dccf59cf54fa1a7e91e582f894 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -2,7 +2,14 @@
 
 /* Firmware attributes class helper module */
 
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/device/class.h>
+#include <linux/kdev_t.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 #include "firmware_attributes_class.h"
 
 const struct class firmware_attributes_class = {
@@ -10,6 +17,122 @@ const struct class firmware_attributes_class = {
 };
 EXPORT_SYMBOL_GPL(firmware_attributes_class);
 
+static void fwat_device_release(struct device *dev)
+{
+	struct fwat_device *fadev = to_fwat_device(dev);
+
+	kfree(fadev);
+}
+
+/**
+ * fwat_device_register - Create and register a firmware-attributes class
+ *			  device
+ * @parent: Parent device
+ * @name: Name of the class device
+ * @data: Drvdata of the class device
+ * @groups: Extra groups for the class device (Optional)
+ *
+ * Return: pointer to the new fwat_device on success, ERR_PTR on failure
+ */
+struct fwat_device *
+fwat_device_register(struct device *parent, const char *name, void *drvdata,
+		     const struct attribute_group **groups)
+{
+	struct fwat_device *fadev;
+	int ret;
+
+	if (!parent || !name)
+		return ERR_PTR(-EINVAL);
+
+	fadev = kzalloc(sizeof(*fadev), GFP_KERNEL);
+	if (!fadev)
+		return ERR_PTR(-ENOMEM);
+
+	fadev->groups = groups;
+	fadev->dev.class = &firmware_attributes_class;
+	fadev->dev.parent = parent;
+	fadev->dev.release = fwat_device_release;
+	dev_set_drvdata(&fadev->dev, drvdata);
+	ret = dev_set_name(&fadev->dev, "%s", name);
+	if (ret) {
+		kfree(fadev);
+		return ERR_PTR(ret);
+	}
+	ret = device_register(&fadev->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	fadev->attrs_kset = kset_create_and_add("attributes", NULL, &fadev->dev.kobj);
+	if (!fadev->attrs_kset) {
+		ret = -ENOMEM;
+		goto out_device_unregister;
+	}
+
+	ret = sysfs_create_groups(&fadev->attrs_kset->kobj, groups);
+	if (ret)
+		goto out_kset_unregister;
+
+	return fadev;
+
+out_kset_unregister:
+	kset_unregister(fadev->attrs_kset);
+
+out_device_unregister:
+	device_unregister(&fadev->dev);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(fwat_device_register);
+
+void fwat_device_unregister(struct fwat_device *fadev)
+{
+	if (!fadev)
+		return;
+
+	sysfs_remove_groups(&fadev->attrs_kset->kobj, fadev->groups);
+	kset_unregister(fadev->attrs_kset);
+	device_unregister(&fadev->dev);
+}
+EXPORT_SYMBOL_GPL(fwat_device_unregister);
+
+static void devm_fwat_device_release(void *data)
+{
+	struct fwat_device *fadev = data;
+
+	fwat_device_unregister(fadev);
+}
+
+/**
+ * devm_fwat_device_register - Create and register a firmware-attributes class
+ *			       device
+ * @parent: Parent device
+ * @name: Name of the class device
+ * @data: Drvdata of the class device
+ * @groups: Extra groups for the class device (Optional)
+ *
+ * Device managed version of fwat_device_register().
+ *
+ * Return: pointer to the new fwat_device on success, ERR_PTR on failure
+ */
+struct fwat_device *
+devm_fwat_device_register(struct device *parent, const char *name, void *data,
+			  const struct attribute_group **groups)
+{
+	struct fwat_device *fadev;
+	int ret;
+
+	fadev = fwat_device_register(parent, name, data, groups);
+	if (IS_ERR(fadev))
+		return fadev;
+
+	ret = devm_add_action_or_reset(parent, devm_fwat_device_release, fadev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fadev;
+}
+EXPORT_SYMBOL_GPL(devm_fwat_device_register);
+
 static __init int fw_attributes_class_init(void)
 {
 	return class_register(&firmware_attributes_class);
@@ -23,5 +146,7 @@ static __exit void fw_attributes_class_exit(void)
 module_exit(fw_attributes_class_exit);
 
 MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
+MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net>");
+MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
 MODULE_DESCRIPTION("Firmware attributes class helper module");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index d27abe54fcf9812a2f0868eec5426bbc8e7eb21c..4ae700eec1e586e1f9ed96bd6e3843342381816d 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -5,8 +5,36 @@
 #ifndef FW_ATTR_CLASS_H
 #define FW_ATTR_CLASS_H
 
+#include <linux/container_of.h>
+#include <linux/device.h>
 #include <linux/device/class.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 
 extern const struct class firmware_attributes_class;
 
+/**
+ * struct fwat_device - The firmware-attributes device
+ * @dev: The class device.
+ * @attrs_kobj: The "attributes" root kobject.
+ * @groups: Sysfs groups attached to the @attrs_kobj.
+ */
+struct fwat_device {
+	struct device dev;
+	struct kset *attrs_kset;
+	const struct attribute_group **groups;
+};
+
+#define to_fwat_device(_d)	container_of_const(_d, struct fwat_device, dev)
+
+struct fwat_device * __must_check
+fwat_device_register(struct device *parent, const char *name, void *data,
+		     const struct attribute_group **groups);
+
+void fwat_device_unregister(struct fwat_device *fwadev);
+
+struct fwat_device * __must_check
+devm_fwat_device_register(struct device *parent, const char *name, void *data,
+			  const struct attribute_group **groups);
+
 #endif /* FW_ATTR_CLASS_H */

-- 
2.50.0

