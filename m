Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD11DF25D;
	Sat, 17 May 2025 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747471931; cv=none; b=pL+000tLwjbruSK457zQo8e5dTBBcLZ4kxqx/+E2GXFuSjQS1cybIhMelRHVgKu4Ob/1wNF2wILb+gpSAPx+zrUdyVsonycKL3lBiUVgnFbMf6Z5yWKXhTos2+808n9JXN0YOmsnOm+l15CilxNBQqpqeGgNZ1p3l/IOcFN/ajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747471931; c=relaxed/simple;
	bh=75ZDl0sGCv0SWzsXoZgaGiv9+9aMgRhElnW5gGizokY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7lmk9gXnjx4batPZhwK26iwccB8veYeKLdFvuPriT798QDpinVcJk6vMHGlzAbDdsrzuzpcXeQ4IdG0/Dut8F9ZXnkm1teScy91/b4uFp5pITjEfeB1AuR0QolriEVeCiJl+cMBXA8dVQ8ajUgrtf5plTE0zQCICnFb3R1E2oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BB2WTmiY; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BB2WTmiY"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5240a432462so1821800e0c.1;
        Sat, 17 May 2025 01:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747471929; x=1748076729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUrdN074hiEwflDk+I/k00uBo8y8f88hJd62syL580w=;
        b=BB2WTmiYEl3ufU3tHkf2LjBzWoQUBP0HjiqU5erkXqGXghp3mjcIA8j3m4uwxCOE/j
         A0+GZRBUAOYhX41NqwM6zWWS2ZeQkGfV53fCgdkuWfJg19SOGXe7fJeWxo6OxZLIrrDz
         UQZhA/OJPEEACKA9ekcF3OCO9E3WXIKzrJ7W/mTG9kYZ3xhYw//xSkFRtyMOBebzB0hx
         MyZpruMs7eh4pwteOe067GztBQ7/ihPUTyO3ravlTi/dXIxzR3tlxmh3uiKeDA/UybJA
         ETZHEgJIbJ+nWaTutGz6ZccO/epOkEVCC+bCc2mF0RKQdrmGi9qDLKQWpQegkt76XK3M
         NnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747471929; x=1748076729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUrdN074hiEwflDk+I/k00uBo8y8f88hJd62syL580w=;
        b=Wdr83UM4Y0OkbMdF+nuPd/4E5XAyM5a+A7+aH+b74hDiCTR4daavO3J/aI0gHWZre/
         /J9VfwmZcNahdv6VDPSiHI7jxW4hbT5TZmsI8aEQ17mLhLjy1Q9D77k14zZgka5+LJRt
         woTecsqrcMmpJ+d0C2MNm2sBbuDzagG9sXd19fH3yd7pUB3CtHefxSG9xZzpWrKxrg36
         KI08zKEr2efmHbFtnAU+Ejflb3EHRpngEBGcF9+tBPG1/ZHTTGkptgfrOhS7N27pxEaE
         aTWd5hv2ZCOJcCvC9J1THiTWkuE6x/eVwsiQ8bSOBVzPBR/tFFqth1heBXQ3lc1rqIPP
         pA7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyt7sOX+MFELdi3TGIEljrTlEvjhR9Q6olRoFsABtGyiP+OKeee0dUoW9jTZSmab9ssZuqvkU8WESYeqPHdOIl5K5flQ==@vger.kernel.org, AJvYcCWV474Bl0JLUqr/f5WR4v55hUSD/hJEDX5xztULv0oh9nJwnODkagklTXQsZ816w/cB1XkF6dnMdOC+yUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXI6h5Fk0G5kyJoh7qnRZOSwSwes9oRVQyl2px7ARHuPGbDBt
	CiNLfUKNaJfyYkqIbggcJNhjR3oGAxoaBLJ5A1v5SF85FL97L4LkEXQu
X-Gm-Gg: ASbGnctncInS4XdUciVTWBw9oOVYU4+OX8hgvu2XMrbwHCYj+aFXeuBK18nG2OsW9mq
	0aaCtOt5qCndWdOnzI9fI8l59QkxvlCDBbVtgVjROnkf1/MSK4CEnpVDjJ8l6cnZaWkeA4mRx2h
	iwO+LlaYY2wXCt4KnkZDagRUeJTjhszUrh+MRml7qDpE81xRYJKpPBdHZtflcBSrQliwuegHA6t
	2wvbhryBsiLWfOrIBRkh6b9no5Gq6QMYhOckY2uli+FrSpd+/9rvkYCP3aKLvOV4UYT6KE9lwZo
	oej9R7KAzwOvCZyrNSr/4IQ/F+7H4tF5z0syeCIVmHeToVchOA==
X-Google-Smtp-Source: AGHT+IGekttsnjR4yfZC6e53wSmQkWD8O76qt/LKyjUcjuwTzYobLODD+5oaXhqxFQVqMxFWF3O6HA==
X-Received: by 2002:a05:6122:2104:b0:527:67d9:100d with SMTP id 71dfb90a1353d-52dbb5b963cmr5214659e0c.4.1747471928671;
        Sat, 17 May 2025 01:52:08 -0700 (PDT)
Received: from [192.168.1.26] ([181.85.227.70])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba9405adsm3455812e0c.11.2025.05.17.01.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 01:52:08 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 17 May 2025 05:51:36 -0300
Subject: [PATCH v2 1/5] platform/x86: firmware_attributes_class: Add device
 initialization methods
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250517-fw-attrs-api-v2-1-fa1ab045a01c@gmail.com>
References: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
In-Reply-To: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8315; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=yRUATjMViscKiiFkHj3mgMrluIU4SerksyxB4/Vxmus=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkafnr76s0MV1Zeju687fri/9fkxmTprZ1q+3SnBseaf
 muvrPjaUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABOZuYDhv/8W3eirGd/zIs1P
 Fe0NOfDiJMPW7FmrjFX2X+9TmvNvpScjQ4uc17UjB/6+eFaV++muWxKbBNPVC7elrOvVXSQMQqv
 9GAE=
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
 drivers/platform/x86/firmware_attributes_class.c | 166 +++++++++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h |  44 ++++++
 2 files changed, 210 insertions(+)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 736e96c186d9dc6d945517f090e9af903e93bbf4..e2dcf2781513b5b033b019780d3e28115e83a1a5 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -2,7 +2,13 @@
 
 /* Firmware attributes class helper module */
 
+#include <linux/device.h>
+#include <linux/device/class.h>
+#include <linux/kdev_t.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 #include "firmware_attributes_class.h"
 
 const struct class firmware_attributes_class = {
@@ -10,6 +16,164 @@ const struct class firmware_attributes_class = {
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
@@ -23,5 +187,7 @@ static __exit void fw_attributes_class_exit(void)
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

