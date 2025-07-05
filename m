Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8792750FE;
	Sat,  5 Jul 2025 03:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751686472; cv=none; b=X6+bmT6lpaWU+iy6F0TgxMfIG1emfN93jZkQ/MXP02+0Kcxv/1PEcKLLwYiEFrF1hc0rbIqxFecww9b1YQ4YlUXZeAT58yyVV7g8kykamtWGt9wx+Avtgfapmi0LmvdaDSKnpuleZIotFntVHZyPaCPH72t9aRPaRfLp1OXf/nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751686472; c=relaxed/simple;
	bh=qesUASDRqxVXZpS+A6xRsFs8Zz1otj+XO6QGFCpLsJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnBYf9PT7guoTJpN6lYQzD4VAljFZ0eioV6b+Gy2ToL5MN6VcfsJ0Qvx85TbGTtMLRFXZhi/L1aQ2mhCCmZhcSjVO5lZ4U53hLBtesPG84cSkWVTXbLR+m+8RY22WPEQ5OlqgC7Gh92UFgZvy965P41C8zb5lPAOI0JA5KSaxIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyID7RvW; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyID7RvW"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a58ebece05so18651191cf.1;
        Fri, 04 Jul 2025 20:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751686469; x=1752291269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnkXAtFrf7nxnP+T+BL361jXm28TaP0Cx95Aq6bp4vI=;
        b=GyID7RvWD9eEn+PZv4B0tOyBt4O5iTKSqF5JLU9ql73k40NaTE4dWyN6h58kw2ygLg
         OpP2+GhOYjvz1SZS1ziOA26igwzISccpiOmSqes08NRQEnRU9M9WX3NIJ60NNyf+zT2r
         QRzLRYyLoN2gfmUQgTpGyTcCTk5ud7+HqHKUL2A9a0pYvnp+OLnQelxOnDtCRqZGtt4C
         GTFaUFOngGVksfAoLBoMRvLCfti3sxyCSCLc/Ya60X4DLK/519JuHcDZz4bFdefm+/P8
         fYWgcWLUhV3sKzDSBp1dhn4GtoL+MWrl2DILvdj6XIi3KB7BcdJiYVaUwSdr+q/3QBx6
         +vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751686469; x=1752291269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnkXAtFrf7nxnP+T+BL361jXm28TaP0Cx95Aq6bp4vI=;
        b=J4cbOk58xy0Cvg2FPQsIhdIiqVGo7IdZ+5GW38caITH/035R0TRhrE6bmGm6/njs2R
         CF9Ht7jfUhsoxyAauFMDW2D1QBJFFfqYlEflDBsPyTaqXwdgqLj9nEpFNzpuhr5YhpfD
         LJIgZTg6Uin7WxF/9ENapDeyVaKnqVi/X6bENRyR04BnDaYyEBIuaElZ7cVWanSWHtKQ
         5rijwolmbT0tYIKohXR8pKhLu41WoGiLaadqykTEtCFuFdd+wuoNJlTNPmX9or1N8RqS
         0NsBO5TYVo4yjsqf+r7EwziKoIWroUHWa/i6sRNtCGTLqjS3+ag/GLtkZdlb5zAnibNf
         F+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9p8ln2+qbsslM1OJuavcuAH/bXKVioilQ7w8kvbdFtjnHM4GWb9aZQBPiSQsdyjDnwj8nfulhNt9AtjQ=@vger.kernel.org, AJvYcCWYMd4gehMVdmgqNG3tVELEqFfkRaifcqA7Mgy9f1D03Evsd52FThb0oOmZyFYrC3b7WkfnFUQ7V2vuCKDd4NBRJZwoug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwanfXJetMInEZ9UmlS/8UoL1yk97iVoU4heqdDYzbIy4Ox3q3
	jdgRV+2NE14udrJK64YXF7Qb1d5jcY9wd0/IxJe95PHkxN9j1trZbsxH
X-Gm-Gg: ASbGncuttHrnSC7vhnTTnA9Th46kaXXvaNC9dgny5kkT432D1r7bAaNgHAN8WkG8jNq
	qQZjxEcspl3GfqFGpJO5o6wfhGaOP6gSp3iEl1VY5x/CNoAnFL4OM1sfvqfTAq2AnJeRW/ebuJZ
	VoHYuZ+cv75/lOgr+JOkf5AOfQSM2EG7sLILz1rOw/9szFJg3sfPk8fW8PoX58ue5F57X3BinD3
	l377kYtdfN3AUEQuhDKm7vqE8FwgQEcHXBzAcWW+ZDA1OJSJT16xmk/qLUBMLfeygIvPoo4oEeX
	qf1lLKTORbFTO+vOs7HCl9MKSsgsDqCoWrIEyw/k4JY/jtzyjacqkGX/02F+6Q==
X-Google-Smtp-Source: AGHT+IHirRPjd9W4dOhjeX1p0e8FhmnU0OCdPNPxgt2CS+a0PmXCMwK+ceDXAMKGpLFFQo3codJmKw==
X-Received: by 2002:a05:622a:8f13:b0:4a9:91fa:7ff4 with SMTP id d75a77b69052e-4a9a119b45bmr29902501cf.33.1751686469074;
        Fri, 04 Jul 2025 20:34:29 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4a48sm25850281cf.13.2025.07.04.20.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 20:34:28 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 05 Jul 2025 00:33:56 -0300
Subject: [PATCH v5 1/6] platform/x86: firmware_attributes_class: Add device
 initialization methods
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250705-fw-attrs-api-v5-1-60b6d51d93eb@gmail.com>
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
In-Reply-To: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6433; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=/QEeIwGjvbsjee7Vf79ak5H1ghdhU4XqRdrxZm09VUw=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkZc20e5Rbs+7Jjwbu1d678mntrQ9n1Vbm+H96p5Dw1d
 9Xb++GxXkcpC4MYF4OsmCJLe8Kib4+i8t76HQi9DzOHlQlkCAMXpwBMpGo3I8NZneYceZ+ZUq+v
 /mVaztX7kTFeJnfW7bUfLf16LuoqnN/IyPB7gYTPqcK3Sy9p/D1lItE1Jfx0YFOj63vX6UYccu6
 bi7gA
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
index 736e96c186d9dc6d945517f090e9af903e93bbf4..290364202cce64bb0e9046e0b2bbb8d85e2cbc6f 100644
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
+ * @drvdata: Drvdata of the class device
+ * @groups: Extra groups for the "attributes" directory
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
index d27abe54fcf9812a2f0868eec5426bbc8e7eb21c..048fd0904f767357ef856e687ec4cf3260016ec6 100644
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
+fwat_device_register(struct device *parent, const char *name, void *drvdata,
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

