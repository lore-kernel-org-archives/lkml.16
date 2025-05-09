Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470B27464B;
	Fri,  9 May 2025 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776953; cv=none; b=DWEjtjCHeqhbiNoCo3yq6JU88/cZeCowVe45ZVbIUPzpPdqB+0h5PkPpDdh/ChQB1KD6R7OktRN0H52yNrFvbUJIN9vC5VGmGroathrp14WRx/0rD+ueGTqropKGUm43ZLfl8IuOX8wfV9GvXCkpTRmRssBUtJJty1FUtYFPpvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776953; c=relaxed/simple;
	bh=YCYqXKj8zBvvNVfNZMoHOsi2v4z3PSsjaVp9XyPor6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=be9y6/pxSmlVVGIk/9yjoLFYlcbIgDg2q4aGSsQSeQLWWU0n23S90TTNGaJrsGQsmddlh/ZTIr1oGLX087EOipBSUBMf+gIfmgmW4YUh3wWm9WUU+6+1ORM2lZaUvk9uB6hYao4T0lA6dcBP0bNo9jgStg5LhL3TY4haiWWyvpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gY95asV8; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gY95asV8"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-875b8e006f8so514904241.0;
        Fri, 09 May 2025 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746776950; x=1747381750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eBx27AMGCwqy5ZDp1gOClNdGcPujNcYWbgmiJhO5wI=;
        b=gY95asV8AfbplobYLJyjIIrySm0dOuLrNZYJPvcR1QP1ZJaSuVVXxOGuWUXqjkQuB3
         JttdvtwyoMZgEtr8sIOMpRJjPFPluD36TFKAehfv0zIVsqfQ1epEFm8gxVGyAbwOkZng
         nJ5qSkFjC8dgqu0hKmwXCoDjn2uBVzW+sIKE2JtebXbs9mK2xu3Gj7DbEWjCAoMoFgmN
         I1zWWLTxhoi4x0y8riE/O8dKbVgst35p/kd3DOJ2zkIMiz6TcFIr48O7Apdd5v/ewney
         zKWN8BMBT1mx6YY2JuktLRoXo9Cyxb6QAwGR4HRYbqywhyAZy4HRmLfPSiliJzCXoZxw
         j6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776950; x=1747381750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eBx27AMGCwqy5ZDp1gOClNdGcPujNcYWbgmiJhO5wI=;
        b=HzROCfukZ+31aoUbRnwy4vehcfzqUIiUDnDuBi5ToVCMz4QCrhOHKJraqyGHDEq3ut
         NMe50SnNedro25HYLIv+bNfxyRLccqNXCAf1IIdr9L9du4hvbMcTh+jlqDh+taIKhh+b
         yrv+ZBjhyfGET/XSat//y6fF7ZmTF41Zvd2SxP70lZkU3kf8AZ92NTM69jhKqpvmDVJ6
         lgOQYzS9NLG+jx2IpTh6ZNxwI2Nzh2oZz729gx0kbMX2CYGxCwVLkOSipg1QjO5cSqSy
         kME7HJL/JVRbynqN+FXLfV9Rfl/tnn9sjTIuQPxIci5A1VUsA/RJZkN4u9hcgvBHq1v3
         l44Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWd1mQ6+hIYVP7Op9tT2aG2F34sIEWjOg7YDBlR9cRdOdTPF9ubviSavtD6C2owMl02xLh6g3n9tPo81BNqnnt743B2A==@vger.kernel.org, AJvYcCXpQ6FIFZjgjPoUZ7tnN0lBI3x5RCTLQ7zZs6eA4qu0e5Z7X+eFsNhkGq7Ee/d+FJUgOiVEqS60lsCbHgw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8DXz//ZdAz9jDpVUCHGmJkAOCWgE+OCY6sqvuEVc1O2Vwtk4D
	AHOQxmrNyI+GX8M9n2Lp+00bYelQz0sSAswRpe0gXSfJR+Z+zxJgT8McvA==
X-Gm-Gg: ASbGncuWEhxzPxRrGfRsMf4vb5T4OTS5pC28fVB7dXF+jPNQHBT44XQySBC6vRBbgs2
	6Tv+pHCsfg/nBbmpEDRjowsL0EBp1JH9YKOk4ZgKsBJWTDL/t7eGcYImozrRBkxCuQXDuhrr4lG
	cyE2v2/F0bKZw/fqYuesVE/8j8cW2UII6gYF3fuvT+iB5oOybcXL4l9EOS62aqoqV73geHP9umu
	txFluoB3ysWiol948t6qqIjKKrEmGZDQ5bC5mYiR/FKks0aKUB3m7qTRNZgJ+cQXDkWsyttHDiI
	gDuMLiMxNFw3d4edRjcbhDiVZ4cyOBd8svpVqdYy
X-Google-Smtp-Source: AGHT+IFyg2xmtOe/i3sQe/MqyF86NBYm8lH9pBZYHyw+Kbxgfnly1h69GDwzd1eYQB67ELiM/x/wmQ==
X-Received: by 2002:a05:6102:5e97:b0:4da:e631:a472 with SMTP id ada2fe7eead31-4deed3e3410mr2179824137.20.1746776950293;
        Fri, 09 May 2025 00:49:10 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f62986f3sm678265241.33.2025.05.09.00.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:49:09 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 09 May 2025 04:48:33 -0300
Subject: [PATCH RFC 1/5] platform/x86: firmware_attributes_class: Add
 device initialization methods
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250509-fw-attrs-api-v1-1-258afed65bfa@gmail.com>
References: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
In-Reply-To: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8227; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=Vxr1YLgSfKtW1/Fz3hWql1pRw5necvJXVBfazYuQO4A=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBmym3OKToqlJe1sENPQZghUuWIiaTGzo2PD189TZj5i/
 bCSv31CRykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAExkpiwjw/eHm743xqUKXlvs
 +PKX05v/ex6rMb5fE7ZQKq/EOt3NSpmR4UZapUc3Z2+w//Q3/mEvH9lvTnW7LfVg3iQbvwsCqQU
 azAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

From: Thomas Weißschuh <linux@weissschuh.net>

Currently each user of firmware_attributes_class has to manually set up
kobjects, devices, etc.

Provide this infrastructure out-of-the-box through the newly introduced
fwat_device_register().

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Co-developed-by: Kurt Borja <kuurtb@gmail.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/firmware_attributes_class.c | 165 +++++++++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h |  44 ++++++
 2 files changed, 209 insertions(+)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 736e96c186d9dc6d945517f090e9af903e93bbf4..58ab1495ba3bd449cfe17de2827a57a0c5937788 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -2,7 +2,12 @@
 
 /* Firmware attributes class helper module */
 
+#include <linux/device.h>
+#include <linux/device/class.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 #include "firmware_attributes_class.h"
 
 const struct class firmware_attributes_class = {
@@ -10,6 +15,164 @@ const struct class firmware_attributes_class = {
 };
 EXPORT_SYMBOL_GPL(firmware_attributes_class);
 
+static ssize_t fwat_attrs_kobj_show(struct kobject *kobj, struct attribute *attr,
+				    char *buf)
+{
+	const struct fwat_attribute *fattr = to_fwat_attribute(attr);
+	struct fwat_device *fadev = to_fwat_device(kobj);
+
+	if (!fattr->show)
+		return -ENOENT;
+
+	return fattr->show(fadev->dev, fattr, buf);
+}
+
+static ssize_t fwat_attrs_kobj_store(struct kobject *kobj, struct attribute *attr,
+				     const char *buf, size_t count)
+{
+	const struct fwat_attribute *fattr = to_fwat_attribute(attr);
+	struct fwat_device *fadev = to_fwat_device(kobj);
+
+	if (!fattr->store)
+		return -ENOENT;
+
+	return fattr->store(fadev->dev, fattr, buf, count);
+}
+
+static const struct sysfs_ops fwat_attrs_kobj_ops = {
+	.show	= fwat_attrs_kobj_show,
+	.store	= fwat_attrs_kobj_store,
+};
+
+static void fwat_attrs_kobj_release(struct kobject *kobj)
+{
+	struct fwat_device *fadev = to_fwat_device(kobj);
+
+	kfree(fadev);
+}
+
+static const struct kobj_type fwat_attrs_ktype = {
+	.sysfs_ops	= &fwat_attrs_kobj_ops,
+	.release	= fwat_attrs_kobj_release,
+};
+
+/**
+ * fwat_device_register - Create and register a firmware-attributes class
+ *			  device
+ * @parent: Parent device
+ * @name: Name of the class device
+ * @data: Drvdata of the class device
+ * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
+ *
+ * NOTE: @groups are attached to the .attrs_kobj of the new fwat_device which
+ * has a custom ktype, which makes use of `struct fwat_attribute` to embed
+ * attributes.
+ *
+ * Return: pointer to the new fwat_device on success, ERR_PTR on failure
+ */
+struct fwat_device *
+fwat_device_register(struct device *parent, const char *name, void *data,
+		     const struct attribute_group **groups)
+{
+	struct fwat_device *fadev;
+	struct device *dev;
+	int ret;
+
+	if (!parent || !name)
+		return ERR_PTR(-EINVAL);
+
+	fadev = kzalloc(sizeof(*fadev), GFP_KERNEL);
+	if (!fadev)
+		return ERR_PTR(-ENOMEM);
+
+	dev = device_create(&firmware_attributes_class, parent, MKDEV(0, 0),
+			    data, "%s", name);
+	if (IS_ERR(dev)) {
+		kfree(fadev);
+		return ERR_CAST(dev);
+	}
+
+	ret = kobject_init_and_add(&fadev->attrs_kobj, &fwat_attrs_ktype, &dev->kobj,
+				   "attributes");
+	if (ret)
+		goto out_kobj_put;
+
+	if (groups) {
+		ret = sysfs_create_groups(&fadev->attrs_kobj, groups);
+		if (ret)
+			goto out_kobj_unregister;
+	}
+
+	fadev->dev = dev;
+	fadev->groups = groups;
+
+	kobject_uevent(&fadev->attrs_kobj, KOBJ_ADD);
+
+	return fadev;
+
+out_kobj_unregister:
+	kobject_del(&fadev->attrs_kobj);
+
+out_kobj_put:
+	kobject_put(&fadev->attrs_kobj);
+	device_unregister(dev);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(fwat_device_register);
+
+void fwat_device_unregister(struct fwat_device *fwadev)
+{
+	if (fwadev->groups)
+		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->groups);
+	kobject_del(&fwadev->attrs_kobj);
+	kobject_put(&fwadev->attrs_kobj);
+	device_unregister(fwadev->dev);
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
+ * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
+ *
+ * Device managed version of fwat_device_register().
+ *
+ * NOTE: @groups are attached to the .attrs_kobj of the new fwat_device which
+ * has a custom ktype, which makes use of `struct fwat_attribute` to embed
+ * attributes.
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
@@ -23,5 +186,7 @@ static __exit void fw_attributes_class_exit(void)
 module_exit(fw_attributes_class_exit);
 
 MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
+MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net>");
+MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
 MODULE_DESCRIPTION("Firmware attributes class helper module");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index d27abe54fcf9812a2f0868eec5426bbc8e7eb21c..ad94bf91e5af30a2b8feb9abf224ee6f0d17600a 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -5,8 +5,52 @@
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
+	struct device *dev;
+	struct kobject attrs_kobj;
+	const struct attribute_group **groups;
+};
+
+#define to_fwat_device(_k)	container_of_const(_k, struct fwat_device, attrs_kobj)
+
+/**
+ * struct fwat_attribute - The firmware-attributes's custom attribute
+ * @attr: Embedded struct attribute.
+ * @show: Show method called by the "attributes" kobject's ktype.
+ * @store: Store method called by the "attributes" kobject's ktype.
+ */
+struct fwat_attribute {
+	struct attribute attr;
+	ssize_t (*show)(struct device *dev, const struct fwat_attribute *attr,
+			char *buf);
+	ssize_t (*store)(struct device *dev, const struct fwat_attribute *attr,
+			 const char *buf, size_t count);
+};
+
+#define to_fwat_attribute(_a) container_of_const(_a, struct fwat_attribute, attr)
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
2.49.0

