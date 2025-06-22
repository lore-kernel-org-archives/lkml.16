Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263994C97;
	Sun, 22 Jun 2025 00:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750550687; cv=none; b=icEQRU/23qacUAwTLNsBxU1wR20V3VedTv/SidOPq2+6dK1Sw1NdtPUGNzaEO7zzo5j6dAD1kt2VLgRD6teeA5t7LCOAmyeIGk5H8ikLsxq4JfXXbabpSgs4EXEr6jZk7lL+V1PMXRDqoBFp39XY64tkGmUALT/dZoBS64WApl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750550687; c=relaxed/simple;
	bh=DXyFUucMFonCOoKPXmmdpzv0Mx3fIW1WWsT7f2FzLDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAUjnGwbAk1hS0Vm08s8MsCkGtaFDEDWxLKns7c8NtDollGh0Ni2/0pDljFqcf98t13oX4RdgXFMQE+Y7PVhq7/8tQCOpLDPv7fJT1bgrBKyOPHMKj7goQ157M5ThdaS7kP0ZD5xjBJPzEeu6Jlji678N/fQmFZcma8yTV+bxok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRaBLgSQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRaBLgSQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7426c44e014so2638195b3a.3;
        Sat, 21 Jun 2025 17:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750550685; x=1751155485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzQdUBlScYsXkw8H+z5lKEEFfhrtswPUm2kf4rvQK8I=;
        b=MRaBLgSQlf/f6tENcL8wQSESXdvc13zI61g6X5un4VSZG9hTNKqVQyez+dZeagjixd
         hcaRtYFSlC5UFPW622tA98bqlz/StRGlFPBaGs7QWFIgruTS4lvT97NcGOc6jnpvLsKd
         16ddgnFXPn5W+mdaKgLzoOQkejmqT4KrRebFsad1yY7Ee6qNKotOw3xIJOBkDTyev/kh
         0G/Y9FXrjSXLG7MIhMMTXZlU+uVDfto0626yFYhRsZ+7+j80nZdkWNNlZo6TR45JbOjH
         vVdrLNAhXM1gFmBgdz6Q+wdWIV7mUbpuAIWHtG1c8d00VHC8BsKvMEcbBCnN3cTZvEeS
         F6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750550685; x=1751155485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzQdUBlScYsXkw8H+z5lKEEFfhrtswPUm2kf4rvQK8I=;
        b=WLTDDQcwyUBxwCbIGzQ/4Jlo7VZDDpPh9jQXp4tPQdTvRzvTORvk6evXF5lZrFFhL3
         jON6tutWjNbxtHYODqujDFwudfyMKHw8e3MCGuc0tMR9tGq3dYPo2dKUHN0GVpjdcoWO
         2zOCTBaN/eN7NFT0v2xVpnpgLgWiFkqNck4L0+HmIkWupzWQHwGOsRIHZGMxkKyDtW9f
         ya+c6kyTjt3lUN56s6wy9muLJWwM/xx8DQxClo9J3gDmDAA+ElvMDgGrzvCJiIsDJWmK
         tMNxJFxo4irJ7dSdWoHxxeVR/Seze7+GqzS9+kJIsWX3A2z73F1xEGEVn1RWAf9A5mMW
         G4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUk7QD5o+ryasyO59ODvS6OTnyl1b3oicGCiDSD4E5OcANchbUJR9ToQ9QhSwpPKIYq4n+opM5JAglAJaeDvH8Wc+QOvw==@vger.kernel.org, AJvYcCXc8o8+83+sMbYVbeTm0Kk2QlGPsyeTSnL9t2Eqcpg6tOxkExPukL4zfLIqbV/peWDjRsrmdPhYxiYSVRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HnD+8yv/yYK3ChV4cosilNd+ls+vh4I88O3ZKm1FGeEXRvsQ
	Pk8mJEPpiQmcfow5/xYEE4XG1AjKuQ12CWgn85m2A622nKUMm6zQ8+Vi2MlZuvIg
X-Gm-Gg: ASbGncu8pEdK07Y4iStE4vXAWO+U6I+51sUJBdKWcY5VcydkWUwxY4+Y3jaFr8izxJN
	I4nvao6qKC9QLV0B3bA2BWXuiyqyQlJqT4phu6MMMLo3lBjuVHO2ATwTAMn/8TDK4+8wl4QjqSV
	2dnT7h/Y5dgG4TAdKum5NtbuMT/LgDGGfP+4KwH7VoH9ZamkWu3TB4PKNCi50tdvevt9bIWiM99
	f1BHjEPTw6nkafftWULNtXbasMB11FjMBD1K1ECcIIeErKIHxFpgHouBWWAgShK8Z3Zl3cONkKt
	BSdRX39tqU+jzMY1cJPSsZy3MCI/5iEcFWrQi/gaKvpku1zC0G7b5OdtJv8rEg==
X-Google-Smtp-Source: AGHT+IGEd+F8VmPYtB07eTUhRT6mDvcuNsqwcgGnEYeMmojCiF2bIRcPwH83J1OL1PUkvUENUht6RA==
X-Received: by 2002:a05:6a21:33a9:b0:1f5:80a3:b006 with SMTP id adf61e73a8af0-22026e47a3dmr11760134637.21.1750550685101;
        Sat, 21 Jun 2025 17:04:45 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626326sm4941424b3a.75.2025.06.21.17.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 17:04:44 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 21 Jun 2025 21:04:04 -0300
Subject: [PATCH v3 1/6] platform/x86: firmware_attributes_class: Add device
 initialization methods
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250621-fw-attrs-api-v3-1-3dd55e463396@gmail.com>
References: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
In-Reply-To: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7934; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=zizOHC0AlSPEm/Zzww0cbN6lQ5O2XQbDki5mm7XGl5A=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnhHlOvbAhPKTnjbG5tXs15VYx1zc2Xz29xLXDQ2n1Jw
 Oeq6ew1HaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRi+sZfrN7f7ZKs51hGsei
 LyjIsHlKoXXrGSEfq/qDnq+/3j+bXcbwh9dgWcov1m2ntn8qWhvvEn572fOUNnfzGxXT5to+Dsl
 nZgUA
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
 drivers/platform/x86/firmware_attributes_class.c | 162 +++++++++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h |  44 ++++++
 2 files changed, 206 insertions(+)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 736e96c186d9dc6d945517f090e9af903e93bbf4..27edb48636c8a91125b0a335411ebafd9818630c 100644
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
@@ -10,6 +16,160 @@ const struct class firmware_attributes_class = {
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
+ * @groups: Extra groups for the class device (Optional)
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
+		ret = device_add_groups(dev, groups);
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
+void fwat_device_unregister(struct fwat_device *fadev)
+{
+	struct device *dev = fadev->dev;
+
+	if (!fadev)
+		return;
+
+	device_remove_groups(dev, fadev->groups);
+	kobject_del(&fadev->attrs_kobj);
+	kobject_put(&fadev->attrs_kobj);
+	device_unregister(dev);
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
@@ -23,5 +183,7 @@ static __exit void fw_attributes_class_exit(void)
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
2.50.0

