Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F347E27466A;
	Fri,  9 May 2025 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776963; cv=none; b=kvoA5oQ1jmRfzrA+OrXG1ATNa3/ha4BIxQZMX5g2uBYonfoUd/GA3CNakvJCkt/w2HTo22xsNbNl77zML1NwDs0xVW6mnbHQhR5/SRsG/WHaIUrNhDZprZfzUbRs+B0iI1oQ8ISOwhIvT6wFwNS/rKw9gW2uA0RWfgo5wXeC+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776963; c=relaxed/simple;
	bh=zqJFSCx7AUWfbriM3zIDxSBZnylClDLryW6FMC+feiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUwLsrTcgZtRuURUMb6iFgtMuH5cUM1Fci6TIWfozxyzrDrv9pakB6/LQ8OUzpAZ3JLA2N9zTve8d5uE+umhmZeAdDceSNeSHD9tb1N63MUTnay2rKuW7CoIiRcnD2M1bsN4H0/Ufu8XgWui1PbgRifvE/gHjgrePcGQLmWlNIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1F7EGgH; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1F7EGgH"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4c4ecf86e8bso566861137.2;
        Fri, 09 May 2025 00:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746776955; x=1747381755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0Qr/Dx2Mpz9q6UxyEXOpqASgzXyh5bvBW29AbGoUfc=;
        b=I1F7EGgHvEgyLkvLUFXz+4oq7NFuIZ91/yxmw84bxy+gXMBZ2soupOuOyxryr3LtAz
         u5RwYvRF7mvEl2CW95BVj+Mgz38jagok64Ij9odBxPNYGCVQpkZ5VQHXbA8a8X7HxpC4
         7Hs4xZYoFGFd64lObKEVfQMPUCGe6REJVchad60Ah3BGBdPK8TtxA8B+xo+oJ9K0Ge/W
         GqAa07dWo76IjM3EH3/hynL95As+Dx9R1OKFXHXIsW+qjzJIh9aE/0BBWoXTOAxkU3so
         wtqmN/gb7HQ+vR+mi/XyIuPH3Mboc7nxAw3F2rpRyH3+6uFjBA6iHdoLtS/jeVzdyuXf
         VbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776955; x=1747381755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0Qr/Dx2Mpz9q6UxyEXOpqASgzXyh5bvBW29AbGoUfc=;
        b=em0MEer4d/gj/fWLjOicuo/0DGQyhMfAsrU7p28Lt4qawnFv1OBvyn5oWif6b7YLr/
         wu10yEIpOtbTV7zSqp7dCM+n5TPwyn+yJfb58r5k57XDPmtGCj8GLalIslm1qW5+S9vn
         6mRpAHXw52xeAggA9ddHaGdrmxqYDz2d5d3XHnCaIt0QqWuN68ThOKYFxb5ubwCBKNXs
         ugKqVkZmiyKTmEK0SfUdaAXqPnDiBG8nZCZThZ4cZcbNK0thIpUR55kdJO+Dwtdm5P2t
         g6DJ5dZyx/0C7eDWAFORDZ2H91DcWxdlEZqETkXDpFLB5oTOqs5LCvXyQ3Hl/DPSZS8J
         Tyxg==
X-Forwarded-Encrypted: i=1; AJvYcCV6SlmHOtH53U2rB168UcVW3JC+b27BPBJQr1/+jdfN83RaUEDjrXxDMaeZqRgkGY5qsN7nfvkljJ4b1nU=@vger.kernel.org, AJvYcCWDV670Y+P0iUAFGFzML+AiB38Xr2wp3cdxrbxEVgqcGE/K8eQQMgQQEGTrxFSkjKYqmdCylWoegs8ByFQL1e6Dy44eNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzZrr8fVxwPd0pMIz2ga7y+u/lX+pph6dHqfgEPqbiX743WOME
	BYeZ1OFav7MHaB7UrN6YqLle7TTI1l4YS6ZpRh5kjh9T2s29M+nC
X-Gm-Gg: ASbGncv6DI1iCYtHwTYZdNIapvY9k9lRUcBeXhg/lvhH+LNIW0oGKHqdAjC1olOsgbL
	9RmckfDmKzDhg6Eo1wpESmYh8enh2Li5lOU73trA9f1BlQy/GBe2ehedLOX2igI6PDyGhwWYmrO
	p4rDIKEyQm5KwAP8DHm24I+41FzikelFvvQsWi91uygq7q1Rbm/X7PBECsAz65eXBGN3ygfSHTO
	V7ztr+RONvxMU/I1CpnROYFpjtw3dLj+JjhZN3bEsBZg+u5OFPhNm9CKhths5kaSQbzr13jqotj
	Gx8pkCIzVaZl2mLLhmzn0joESCXl/swpmVOJacoHyBMMhZwiSq8=
X-Google-Smtp-Source: AGHT+IEvyGOw+PpFZVA8mGRWI3dO+d4jJXn8bisKljR4euFo6qCqbKdB/hbtVsIvlqf3IB3qeQE9og==
X-Received: by 2002:a05:6102:8006:b0:4cb:5d6e:e6c8 with SMTP id ada2fe7eead31-4deed33c1abmr1928239137.9.1746776954585;
        Fri, 09 May 2025 00:49:14 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f62986f3sm678265241.33.2025.05.09.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:49:14 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 09 May 2025 04:48:34 -0300
Subject: [PATCH RFC 2/5] platform/x86: firmware_attributes_class: Add a
 high level API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-fw-attrs-api-v1-2-258afed65bfa@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19553; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=zqJFSCx7AUWfbriM3zIDxSBZnylClDLryW6FMC+feiA=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBmym3M0HZZXtt9y1i2f9eDeskjmpKigm+GLqr+9Y/mr+
 fzT7nOfOkpZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiJpGMDM9l2gNquH9O23xD
 ++rhbRf29RiVWG/RY+q91eh9Iuql1iqG/1lTt8tP9T965CNvs6yooS/XabNkrj8suk7W8/yfzTx
 sxgYA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add an attribute configuration mechanism through the newly introduced
`struct fwat_dev_config`, which makes use of other documented structs
and callbacks.

This API aims to be simple, yet flexible. In order to accomplish this,
the following features were taken into account:

* Ability to statically define attributes
* Custom read/write callbacks for each attribute type
* Ability to map attributes to numbers in order to differentiate them in
  callbacks (`aux` number)
* Ability to reuse read/write callbacks in different attributes
* Ability to reuse property selection in different attributes
* Optional visibility callback for dynamic attribute visibility

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/firmware_attributes_class.c | 249 ++++++++++++++++++++++-
 drivers/platform/x86/firmware_attributes_class.h | 228 +++++++++++++++++++++
 2 files changed, 474 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 58ab1495ba3bd449cfe17de2827a57a0c5937788..7cfb0f49f235728c7450a82a7e9d00b8963d3dea 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -7,14 +7,233 @@
 #include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 #include "firmware_attributes_class.h"
 
+#define to_fwat_attribute_ext(_a) container_of_const(_a, struct fwat_attribute_ext, attr)
+
+struct fwat_attribute_ext {
+	struct fwat_attribute attr;
+	enum fwat_property prop;
+	const struct fwat_attr_config *config;
+};
+
 const struct class firmware_attributes_class = {
 	.name = "firmware-attributes",
 };
 EXPORT_SYMBOL_GPL(firmware_attributes_class);
 
+static const char * const fwat_type_labels[] = {
+	[fwat_type_integer]		= "integer",
+	[fwat_type_string]		= "string",
+	[fwat_type_enumeration]		= "enumeration",
+};
+
+static const char * const fwat_prop_labels[] = {
+	[FWAT_PROP_DISPLAY_NAME]		= "display_name",
+	[FWAT_PROP_LANGUAGE_CODE]		= "display_name_language_code",
+	[FWAT_PROP_DEFAULT]			= "default",
+
+	[FWAT_INT_PROP_MIN]			= "min_value",
+	[FWAT_INT_PROP_MAX]			= "max_value",
+	[FWAT_INT_PROP_INCREMENT]		= "scalar_increment",
+
+	[FWAT_STR_PROP_MIN]			= "min_length",
+	[FWAT_STR_PROP_MAX]			= "max_length",
+
+	[FWAT_ENUM_PROP_POSSIBLE_VALUES]	= "possible_values",
+};
+
+static ssize_t
+fwat_type_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_attr_config *config = ext->config;
+
+	return sysfs_emit(buf, "%s\n", fwat_type_labels[config->type]);
+}
+
+static ssize_t
+fwat_property_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_attr_config *config = ext->config;
+
+	if (!config->ops->prop_read)
+		return -EOPNOTSUPP;
+
+	return config->ops->prop_read(dev, config->aux, ext->prop, buf);
+}
+
+static ssize_t
+fwat_current_value_show(struct device *dev, const struct fwat_attribute *attr, char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_attr_config *config = ext->config;
+	const char *str;
+	long int_val;
+	int ret;
+
+	switch (config->type) {
+	case fwat_type_integer:
+		ret = config->ops->integer_read(dev, config->aux, &int_val);
+		if (ret)
+			return ret;
+
+		return sysfs_emit(buf, "%ld\n", int_val);
+	case fwat_type_string:
+		ret = config->ops->string_read(dev, config->aux, &str);
+		if (ret)
+			return ret;
+
+		return sysfs_emit(buf, "%s\n", str);
+	case fwat_type_enumeration:
+		ret = config->ops->enumeration_read(dev, config->aux, &str);
+		if (ret)
+			return ret;
+
+		return sysfs_emit(buf, "%s\n", str);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static ssize_t
+fwat_current_value_store(struct device *dev, const struct fwat_attribute *attr,
+			 const char *buf, size_t count)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_attr_config *config = ext->config;
+	long int_val;
+	int ret;
+
+	switch (config->type) {
+	case fwat_type_integer:
+		ret = kstrtol(buf, 0, &int_val);
+		if (ret)
+			return ret;
+
+		ret = config->ops->integer_write(dev, config->aux, int_val);
+		break;
+	case fwat_type_string:
+		ret = config->ops->string_write(dev, config->aux, buf);
+		break;
+	case fwat_type_enumeration:
+		ret = config->ops->enumeration_write(dev, config->aux, buf);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return ret ? ret : count;
+}
+
+static struct attribute *
+fwat_alloc_attr(struct device *dev, const struct fwat_attr_config *config,
+		const char *attr_name, umode_t mode, enum fwat_property prop,
+		ssize_t (*show)(struct device *dev, const struct fwat_attribute *attr,
+				char *buf),
+		ssize_t (*store)(struct device *dev, const struct fwat_attribute *attr,
+				 const char *buf, size_t count))
+{
+	struct fwat_attribute_ext *fattr;
+
+	fattr = devm_kzalloc(dev, sizeof(*fattr), GFP_KERNEL);
+	if (!fattr)
+		return NULL;
+
+	fattr->attr.attr.name = attr_name;
+	fattr->attr.attr.mode = mode;
+	fattr->attr.show = show;
+	fattr->attr.store = store;
+	fattr->prop = prop;
+	fattr->config = config;
+	sysfs_attr_init(&fattr->attr.attr);
+
+	return &fattr->attr.attr;
+}
+
+static struct attribute **
+fwat_create_attrs(struct device *dev, const struct fwat_attr_config *config)
+{
+	struct attribute **attrs;
+	enum fwat_property prop;
+	unsigned int index = 0;
+
+	attrs = devm_kcalloc(dev, config->num_props + 3, sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return NULL;
+
+	/*
+	 * Create optional attributes
+	 */
+	for (; index < config->num_props; index++) {
+		prop = config->props[index];
+		attrs[index] = fwat_alloc_attr(dev, config, fwat_prop_labels[prop],
+					       0444, prop, fwat_property_show, NULL);
+	}
+
+	/*
+	 * Create mandatory attributes
+	 */
+	attrs[index++] = fwat_alloc_attr(dev, config, "type", 0444, 0, fwat_type_show, NULL);
+	attrs[index++] = fwat_alloc_attr(dev, config, "current_value", 0644, 0,
+					 fwat_current_value_show, fwat_current_value_store);
+
+	return attrs;
+}
+
+static const struct attribute_group *
+fwat_create_group(struct device *dev, const struct fwat_attr_config *config)
+{
+	struct attribute_group *group;
+	struct attribute **attrs;
+
+	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return NULL;
+
+	attrs = fwat_create_attrs(dev, config);
+	if (!attrs)
+		return NULL;
+
+	group->name = config->name;
+	group->attrs = attrs;
+
+	return group;
+}
+
+static const struct attribute_group **
+fwat_create_auto_groups(struct device *dev, const struct fwat_dev_config *config)
+{
+	const struct attribute_group **groups;
+	const struct attribute_group *grp;
+	unsigned int index = 0;
+	size_t ngroups = 0;
+
+	while (config->attrs_config[ngroups])
+		ngroups++;
+
+	groups = devm_kcalloc(dev, ngroups + 1, sizeof(*groups), GFP_KERNEL);
+	if (!groups)
+		return NULL;
+
+	for (unsigned int i = 0; i < ngroups; i++) {
+		if (config->is_visible &&
+		    !config->is_visible(dev, config->attrs_config[i]))
+			continue;
+
+		grp = fwat_create_group(dev, config->attrs_config[i]);
+		if (!grp)
+			return NULL;
+
+		groups[index++] = grp;
+	}
+
+	return groups;
+}
+
 static ssize_t fwat_attrs_kobj_show(struct kobject *kobj, struct attribute *attr,
 				    char *buf)
 {
@@ -61,6 +280,7 @@ static const struct kobj_type fwat_attrs_ktype = {
  *			  device
  * @parent: Parent device
  * @name: Name of the class device
+ * @config: Device configuration
  * @data: Drvdata of the class device
  * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
  *
@@ -72,8 +292,10 @@ static const struct kobj_type fwat_attrs_ktype = {
  */
 struct fwat_device *
 fwat_device_register(struct device *parent, const char *name, void *data,
+		     const struct fwat_dev_config *config,
 		     const struct attribute_group **groups)
 {
+	const struct attribute_group **auto_groups;
 	struct fwat_device *fadev;
 	struct device *dev;
 	int ret;
@@ -97,19 +319,36 @@ fwat_device_register(struct device *parent, const char *name, void *data,
 	if (ret)
 		goto out_kobj_put;
 
-	if (groups) {
-		ret = sysfs_create_groups(&fadev->attrs_kobj, groups);
+	if (config) {
+		auto_groups = fwat_create_auto_groups(dev, config);
+		if (!auto_groups) {
+			ret = -ENOMEM;
+			goto out_kobj_unregister;
+		}
+
+		ret = sysfs_create_groups(&fadev->attrs_kobj, auto_groups);
 		if (ret)
 			goto out_kobj_unregister;
 	}
 
+	if (groups) {
+		ret = sysfs_create_groups(&fadev->attrs_kobj, groups);
+		if (ret)
+			goto out_remove_auto_groups;
+	}
+
 	fadev->dev = dev;
 	fadev->groups = groups;
+	fadev->auto_groups = groups;
 
 	kobject_uevent(&fadev->attrs_kobj, KOBJ_ADD);
 
 	return fadev;
 
+out_remove_auto_groups:
+	if (config)
+		sysfs_remove_groups(&fadev->attrs_kobj, auto_groups);
+
 out_kobj_unregister:
 	kobject_del(&fadev->attrs_kobj);
 
@@ -125,6 +364,8 @@ void fwat_device_unregister(struct fwat_device *fwadev)
 {
 	if (fwadev->groups)
 		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->groups);
+	if (fwadev->auto_groups)
+		sysfs_remove_groups(&fwadev->attrs_kobj, fwadev->auto_groups);
 	kobject_del(&fwadev->attrs_kobj);
 	kobject_put(&fwadev->attrs_kobj);
 	device_unregister(fwadev->dev);
@@ -143,6 +384,7 @@ static void devm_fwat_device_release(void *data)
  *			       device
  * @parent: Parent device
  * @name: Name of the class device
+ * @config: Device configuration
  * @data: Drvdata of the class device
  * @groups: Sysfs groups for the custom `fwat_attrs_ktype` kobj_type
  *
@@ -156,12 +398,13 @@ static void devm_fwat_device_release(void *data)
  */
 struct fwat_device *
 devm_fwat_device_register(struct device *parent, const char *name, void *data,
+			  const struct fwat_dev_config *config,
 			  const struct attribute_group **groups)
 {
 	struct fwat_device *fadev;
 	int ret;
 
-	fadev = fwat_device_register(parent, name, data, groups);
+	fadev = fwat_device_register(parent, name, data, config, groups);
 	if (IS_ERR(fadev))
 		return fadev;
 
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index ad94bf91e5af30a2b8feb9abf224ee6f0d17600a..f250875d785c3439682c43c693f98e1c20e9ff54 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -18,11 +18,14 @@ extern const struct class firmware_attributes_class;
  * @dev: The class device.
  * @attrs_kobj: The "attributes" root kobject.
  * @groups: Sysfs groups attached to the @attrs_kobj.
+ * @auto_groups: Sysgs groups generated from &struct fwat_attr_config attached.
+ * to the @attrs_kobj
  */
 struct fwat_device {
 	struct device *dev;
 	struct kobject attrs_kobj;
 	const struct attribute_group **groups;
+	const struct attribute_group **auto_groups;
 };
 
 #define to_fwat_device(_k)	container_of_const(_k, struct fwat_device, attrs_kobj)
@@ -30,6 +33,7 @@ struct fwat_device {
 /**
  * struct fwat_attribute - The firmware-attributes's custom attribute
  * @attr: Embedded struct attribute.
+ * @aux: Auxiliary number defined by the user.
  * @show: Show method called by the "attributes" kobject's ktype.
  * @store: Store method called by the "attributes" kobject's ktype.
  */
@@ -43,14 +47,238 @@ struct fwat_attribute {
 
 #define to_fwat_attribute(_a) container_of_const(_a, struct fwat_attribute, attr)
 
+enum fwat_attr_type {
+	fwat_type_integer,
+	fwat_type_string,
+	fwat_type_enumeration,
+};
+
+enum fwat_property {
+	FWAT_PROP_DISPLAY_NAME,
+	FWAT_PROP_LANGUAGE_CODE,
+	FWAT_PROP_DEFAULT,
+
+	FWAT_INT_PROP_MIN,
+	FWAT_INT_PROP_MAX,
+	FWAT_INT_PROP_INCREMENT,
+
+	FWAT_STR_PROP_MIN,
+	FWAT_STR_PROP_MAX,
+
+	FWAT_ENUM_PROP_POSSIBLE_VALUES,
+};
+
+struct fwat_attr_config;
+
+/**
+ * struct fwat_attr_ops - Operations for a firmware *attribute*
+ * @prop_read: Callback for retrieving each configured property of an attribute.
+ * @integer_read: Callback for reading the current_value of an attribute of
+ *                type *integer*.
+ * @integer_write: Callback for writing the current_value of an attribute of
+ *                 type *integer*.
+ * @string_read: Callback for reading the current_value of an attribute of type
+ *               *string*.
+ * @string_write: Callback for writing the current_value of an attribute of type
+ *                *string*.
+ * @enumeration_read: Callback for reading the current_value of an attribute of
+ *                    type *enumeration*.
+ * @enumeration_write: Callback for writing the current_value of an attribute
+ *                     of type *enumeration*.
+ */
+struct fwat_attr_ops {
+	ssize_t (*prop_read)(struct device *dev, long aux,
+			     enum fwat_property prop, const char *buf);
+	union {
+		struct {
+			int (*integer_read)(struct device *dev, long aux,
+					    long *val);
+			int (*integer_write)(struct device *dev, long aux,
+					     long val);
+		};
+		struct {
+			int (*string_read)(struct device *dev, long aux,
+					   const char **str);
+			int (*string_write)(struct device *dev, long aux,
+					    const char *str);
+		};
+		struct {
+			int (*enumeration_read)(struct device *dev, long aux,
+						const char **str);
+			int (*enumeration_write)(struct device *dev, long aux,
+						 const char *str);
+		};
+	};
+};
+
+/**
+ * struct fwat_attr_config - Configuration for a single firmware *attribute*
+ * @name: Name of the sysfs group associated with this *attribute*.
+ * @type: Type of this *attribute*.
+ * @aux: Auxiliary number defined by the user, which will be passed to
+ *       read/write callbacks.
+ * @ops: Operations for this *attribute*.
+ * @props: Array of properties of this *attribute*.
+ * @num_props: Size of the props array.
+ */
+struct fwat_attr_config {
+	const char *name;
+	enum fwat_attr_type type;
+	long aux;
+	const struct fwat_attr_ops *ops;
+	const enum fwat_property *props;
+	size_t num_props;
+};
+
+/**
+ * DEFINE_SIMPLE_FWAT_OPS() - Define static &struct fwat_attr_ops for a simple
+ *                            *attribute* with no properties, i.e. No
+ *                            &fwat_attr_ops.read_prop callback
+ * @_name: Prefix of the `read` and `write` callbacks.
+ * @_type: Firmware *attribute* type.
+ *
+ * Example:
+ *
+ * static int example_read(...) {...}
+ * static int example_write(...) {...}
+ *
+ * DEFINE_SIMPLE_FWAT_OPS(example, ...);
+ */
+#define DEFINE_SIMPLE_FWAT_OPS(_name, _type)		\
+	static const struct fwat_attr_ops _name##_ops = { \
+		._type##_read = _name##_read,		\
+		._type##_write = _name##_write,		\
+	}
+
+/**
+ * DEFINE_FWAT_OPS() - Define static &struct fwat_attr_ops with all callbacks.
+ * @_name: Prefix of the `read` and `write` callbacks.
+ * @_type: Firmware *attribute* type.
+ *
+ * Example:
+ *
+ * static int example_read(...) {...}
+ * static int example_write(...) {...}
+ * static int example_prop_read(...) {...}
+ *
+ * DEFINE_FWAT_OPS(example, ...);
+ */
+#define DEFINE_FWAT_OPS(_name, _type)			\
+	static const struct fwat_attr_ops _name##_ops = { \
+		.prop_read = _name##_prop_read,		\
+		._type##_read = _name##_read,		\
+		._type##_write = _name##_write,		\
+	}
+
+/**
+ * FWAT_CONFIG() - Configuration pointer for a single firmware *attribute*.
+ * @_name: String name of this *attribute*.
+ * @_type: Firmware *attribute* type.
+ * @_ops: Pointer to &struct fwat_attr_ops.
+ * @_props: Pointer to a enum fwat_property array.
+ * @_num_props: Size of the @_props array.
+ *
+ * This is a convenience macro to quickly construct a &struct fwat_attr_config
+ * array, which will be passed to &struct fwat_dev_config.
+ *
+ * Example:
+ *
+ * static int example_read(...) {...}
+ * static int example_write(...) {...}
+ * static int example_prop_read(...) {...}
+ *
+ * DEFINE_FWAT_OPS(example, ...);
+ *
+ * static const enum fwat_property props[] = {...};
+ *
+ * static const struct fwat_attr_config * const attrs_config[] = {
+ *	FWAT_CONFIG(example, ..., &example_fwat_ops, props,
+ *		    ARRAY_SIZE(props)),
+ *	...
+ *	NULL
+ * };
+ *
+ * static const struct fwat_dev_config fdev_config = {
+ *	.attrs_config = attrs_config,
+ *	...
+ * }
+ */
+#define FWAT_CONFIG(_name, _type, _ops, _props, _num_props) \
+	(&(const struct fwat_attr_config) {	\
+		.name = _name,				\
+		.type = fwat_type_##_type,		\
+		.ops = _ops,				\
+		.num_props = _num_props,		\
+		.props = _props,			\
+	})
+
+/**
+ * FWAT_CONFIG_AUX() - Configuration pointer for a single firmware *attribute*
+ *                     with an auxiliary number defined by the user
+ * @_name: String name of this *attribute*.
+ * @_type: Firmware *attribute* type.
+ * @_aux: Auxiliary number defined by the user.
+ * @_ops: Pointer to &struct fwat_attr_ops.
+ * @_props: Pointer to a enum fwat_property array.
+ * @_num_props: Size of the @_props array.
+ *
+ * This is a convenience macro to quickly construct a &struct fwat_attr_config
+ * array, which will be passed to &struct fwat_dev_config.
+ *
+ * Example:
+ *
+ * static int example_read(...) {...}
+ * static int example_write(...) {...}
+ * static int example_prop_read(...) {...}
+ *
+ * DEFINE_FWAT_OPS(example, ...);
+ *
+ * static const enum fwat_property props[] = {...};
+ *
+ * static const struct fwat_attr_config * const config[] = {
+ *	FWAT_CONFIG_AUX(example, ..., n, &example_fwat_ops, props,
+ *			ARRAY_SIZE(props)),
+ *	...
+ *	NULL
+ * };
+ *
+ * static const struct fwat_dev_config fdev_config = {
+ *	.attrs_config = attrs_config,
+ *	...
+ * }
+ */
+#define FWAT_CONFIG_AUX(_name, _type, _aux, _ops, _props, _num_props) \
+	(&(const struct fwat_attr_config) {		\
+		.name = _name,				\
+		.type = fwat_type_##_type,		\
+		.aux = _aux,				\
+		.ops = _ops,				\
+		.num_props = _num_props,		\
+		.props = _props,			\
+	})
+
+/**
+ * struct fwat_dev_config - Configuration for this devices's
+ *                          &fwat_device.auto_groups
+ * @attrs_config: NULL terminated &struct fwat_attr_config array.
+ * @is_visible: Optional visibility callback to determine the visibility
+ *              of each auto_group.
+ */
+struct fwat_dev_config {
+	const struct fwat_attr_config *const *attrs_config;
+	bool (*is_visible)(struct device *dev, const struct fwat_attr_config *config);
+};
+
 struct fwat_device * __must_check
 fwat_device_register(struct device *parent, const char *name, void *data,
+		     const struct fwat_dev_config *config,
 		     const struct attribute_group **groups);
 
 void fwat_device_unregister(struct fwat_device *fwadev);
 
 struct fwat_device * __must_check
 devm_fwat_device_register(struct device *parent, const char *name, void *data,
+			  const struct fwat_dev_config *config,
 			  const struct attribute_group **groups);
 
 #endif /* FW_ATTR_CLASS_H */

-- 
2.49.0

