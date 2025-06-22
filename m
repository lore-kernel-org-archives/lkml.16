Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D393C8F66;
	Sun, 22 Jun 2025 00:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750550692; cv=none; b=EY4r86Qu0/ujQZsABvbWmEPX49CtHardfCMOeCOOEo/MKcpX+ZhW/0zITBLUH2VuZdeyAJx6HL43D5fPwLcXEN2Q0MK5g5rrZKtRaVPzcEfaF3/+wZobD5EQr65k6YAJOJVo5+NgUtM9hZgwFHotoHsbioZj0FfPw8VP/OD6tO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750550692; c=relaxed/simple;
	bh=EOxhodjuHtiKmkEMUox8ZZUATb824HNGZIyEw2W8pzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVOA3ek5Fltk3EVtqx+K//aOKfuL9Y+X1P91icvu4eStjQ9YA603Saa969vo4GuCVA/RoQzBKCQv81sY9RVCABxHStzNPJzZbmCXuI/W8W21hajLys8ursLUDsrBqZKBLw0lTyqDNum+/JGm105xeF1rKD/63zHaW0jz9geriE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0EYaq22; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0EYaq22"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1132777b3a.0;
        Sat, 21 Jun 2025 17:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750550689; x=1751155489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psczNds0l29gY7n5y91wpugrv6OcsGiddH5j1nMGU+s=;
        b=O0EYaq22LjBaM5jShGs7g8hzU9fMehVmHyzsrobTHg0SSEOWhoCRWbyl25ZmXbom7S
         94SRRe7t52g06IXzkqTXx7SujNxw9lYbpPPaKTAujo+I5HSnZY9zwhcvEY2N9sVg5VvQ
         7X26MH8XNeq1t29Fa90ACDmmJ5rT6Q3bfyEOuIxY5rkkyD5rhKqgx8cEPb4qINR8IeQP
         LMI4AwQiwjWDm7skhmBBwIWGid5Duwdz20P3yONUVAVSN9Ua80Su6rz/tNdkA+ZIbcd1
         SHDAuNMyD0V3oJ5IDxcEpKzqJuT2RCMA+MFlW2rvxOejgRJfoFdYlB375Bfw1iWjrPF5
         Uytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750550689; x=1751155489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psczNds0l29gY7n5y91wpugrv6OcsGiddH5j1nMGU+s=;
        b=MHOP369SdSRaxluVjVbM6XUQhZH5ZpQP3xlPkXCW67OzZGIgG5/G2qHYnPZmCUfh3P
         OiJnONzbjIm3aqN9j7SAUTN0cnfeRC2mvBS3ed2TY2h3xDwsd3HhFnutd9+hk5sVf11L
         2+Sj2zK9foSTT0I0wUtaiIq51criHrG4lnXdA/+h+ofxWyW4J0VppDlJXn9OEAdZ7b9Y
         g1QXYPZx15DCd235luaqeU1axoPKnMNjpXF/W+BKb41/EJQmstTwol2u1QcruFfylVU8
         208mCB2PJcV4blTL//kQEADh61YPKpFhR+ujZc2xHllc3TgiAF0ttP1IKv/wekS07SHS
         dYcw==
X-Forwarded-Encrypted: i=1; AJvYcCVOxXoGvzfjYIneh143sjhuCCuGFVt+HY8lrBgjWpuUfNHL7qLQELgC2m+QyIQpnTYjR8MG2VAc/kPuTQw=@vger.kernel.org, AJvYcCX5pild7ztkXAa5CHxjLbtmpvD8EN/r3Mu/KoPHPeA9ai68wCOi4bgpXfjWJ4Q3QRjiyR2d4pNCUrqxCOQS5g1yeaOetg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxby4VVZvHIwerrCOE5ujh68jopZvJn57oNlCwEoEdOeaH+/BJ0
	OTdkAwpuf+BZrM08WxYYnYle8FHht47v+AP13caDBPbeajWaRRK9+p9Q
X-Gm-Gg: ASbGncv4Gw7nXv/5YmT/SN2m5GPX7VWgkuswL2KwhYrdhtVu8H7JBnWeCXMYMZ4tENQ
	WI72IaLO/qtpHiEtvJeiv6HPP9ZXoyQsBiq08N8mLEXnDj2zqE3nh1GM7pNp2D9qomPqGIyVXDF
	YERLxr46KSjL3MfZUr9efWNd9G5Diq+SS+jYOPRF8UQdFA4MlbZYrHgBZUSOF/LhIivhoJwHKw8
	gt904Tw7BiV5uECJF2sak/uo5bqXToJdDK5b/Xlz9+iPQOACtBpP4V4RRDiL7AOs9X6wKjHqrJJ
	Hu4uFlnJk2GnjvLsjlj6KP8EXyA25pcZOKbRRkJJcoIjMFN9qcuVxoaW1qPCLRMXrDk7hkHn
X-Google-Smtp-Source: AGHT+IFgY8b+tLodyVNMMY4yEqu97Wmh/mYwBaQshN9u0rBDFGNjph4J4RIyqywlU0B3qvY93Yyyww==
X-Received: by 2002:a05:6a00:3d14:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-7490daae7abmr10623053b3a.20.1750550689009;
        Sat, 21 Jun 2025 17:04:49 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626326sm4941424b3a.75.2025.06.21.17.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 17:04:48 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 21 Jun 2025 21:04:05 -0300
Subject: [PATCH v3 2/6] platform/x86: firmware_attributes_class: Add high
 level API for the attributes interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-fw-attrs-api-v3-2-3dd55e463396@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=28533; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=EOxhodjuHtiKmkEMUox8ZZUATb824HNGZIyEw2W8pzw=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnhHlNdTJ6rBjCXqnA5XY337i9q23f8WHJKjclb86S1R
 mqv/uZ3lLIwiHExyIopsrQnLPr2KCrvrd+B0Pswc1iZQIYwcHEKwEQyhBkZ3j/Yp7P+zMRJTvND
 BHmckp8+DExL8fCx+7zEZfL3MxGS0owMs2zt5hpenbczTt94wvHK6G1BX9cGqW108lgnp1375OM
 dVgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add high level API to aid in the creation of attribute groups attached
to the `attrs_kobj` (per ABI specification).

This new API lets users configure each group, either statically or
dynamically through a (per type) data struct and then create this group
through the generic fwat_create_group() macro.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/firmware_attributes_class.c | 453 ++++++++++++++++++++++-
 drivers/platform/x86/firmware_attributes_class.h | 333 +++++++++++++++++
 2 files changed, 785 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 27edb48636c8a91125b0a335411ebafd9818630c..034f9254240b048f58c97c18062db03f771f8139 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -9,13 +9,88 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/string_choices.h>
 #include "firmware_attributes_class.h"
 
+#define to_fwat_bool_data(_c) \
+	container_of_const(_c, struct fwat_bool_data, group)
+#define to_fwat_enum_data(_c) \
+	container_of_const(_c, struct fwat_enum_data, group)
+#define to_fwat_int_data(_c) \
+	container_of_const(_c, struct fwat_int_data, group)
+#define to_fwat_str_data(_c) \
+	container_of_const(_c, struct fwat_str_data, group)
+
+struct fwat_group {
+	struct attribute_group group;
+	struct list_head node;
+};
+
+struct fwat_group_config {
+	int type;
+	unsigned int total_attrs;
+	const char * const *attr_labels;
+	ssize_t (*show)(struct device *dev, const struct fwat_attribute *attr,
+			char *buf);
+	ssize_t (*store)(struct device *dev, const struct fwat_attribute *attr,
+			 const char *buf, size_t count);
+};
+
+struct fwat_attribute_ext {
+	struct fwat_attribute fattr;
+	const struct fwat_group_data *data;
+	unsigned int type;
+};
+
+#define to_fwat_attribute_ext(_f) \
+	container_of_const(_f, struct fwat_attribute_ext, fattr)
+
+#define fwat_attribute_ext_init(_name, _mode, _show, _store, _idx, _type, _config) \
+	((struct fwat_attribute_ext){				\
+		.fattr = __ATTR(_name, _mode, _show, _store),	\
+		.config = _config,				\
+		.idx = _idx,					\
+		.type = _type,					\
+	 })
+
 const struct class firmware_attributes_class = {
 	.name = "firmware-attributes",
 };
 EXPORT_SYMBOL_GPL(firmware_attributes_class);
 
+static const char * const fwat_type_labels[] = {
+	[FWAT_GROUP_BOOLEAN]				= "boolean",
+	[FWAT_GROUP_ENUMERATION]			= "enumeration",
+	[FWAT_GROUP_INTEGER]				= "integer",
+	[FWAT_GROUP_STRING]				= "string",
+};
+
+static const char * const fwat_bool_labels[] = {
+	[fwat_bool_current_value]			= "current_value",
+	[fwat_bool_default_value]			= "default_value",
+};
+
+static const char * const fwat_enum_labels[] = {
+	[fwat_enum_current_value]			= "current_value",
+	[fwat_enum_default_value]			= "default_value",
+	[fwat_enum_possible_values]			= "possible_values",
+};
+
+static const char * const fwat_int_labels[] = {
+	[fwat_int_current_value]			= "current_value",
+	[fwat_int_default_value]			= "default_value",
+	[fwat_int_min_value]				= "min_value",
+	[fwat_int_max_value]				= "max_value",
+	[fwat_int_scalar_increment]			= "scalar_increment",
+};
+
+static const char * const fwat_str_labels[] = {
+	[fwat_str_current_value]			= "current_value",
+	[fwat_str_default_value]			= "default_value",
+	[fwat_str_min_length]				= "min_length",
+	[fwat_str_max_length]				= "max_length",
+};
+
 static ssize_t fwat_attrs_kobj_show(struct kobject *kobj, struct attribute *attr,
 				    char *buf)
 {
@@ -57,6 +132,379 @@ static const struct kobj_type fwat_attrs_ktype = {
 	.release	= fwat_attrs_kobj_release,
 };
 
+static ssize_t fwat_type_show(struct device *dev, const struct fwat_attribute *attr,
+			      char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+
+	return sysfs_emit(buf, "%s\n", fwat_type_labels[ext->type]);
+}
+
+static ssize_t
+fwat_display_name_show(struct device *dev, const struct fwat_attribute *attr,
+		       char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_group_data *data = ext->data;
+
+	if (!data->display_name)
+		return -EOPNOTSUPP;
+
+	return sysfs_emit(buf, "%s\n", data->display_name);
+}
+
+static ssize_t
+fwat_language_code_show(struct device *dev, const struct fwat_attribute *attr,
+			char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_group_data *data = ext->data;
+
+	if (!data->language_code)
+		return -EOPNOTSUPP;
+
+	return sysfs_emit(buf, "%s\n", data->language_code);
+}
+
+static ssize_t
+boolean_group_show(struct device *dev, const struct fwat_attribute *attr,
+		   char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_bool_data *data = to_fwat_bool_data(ext->data);
+	bool val;
+	int ret;
+
+	switch (ext->type) {
+	case fwat_bool_current_value:
+		ret = data->read(dev, data->group.id, &val);
+		if (ret < 0)
+			return ret;
+		break;
+	case fwat_bool_default_value:
+		val = data->default_val;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return sysfs_emit(buf, "%s\n", str_yes_no(val));
+}
+
+static ssize_t
+enumeration_group_show(struct device *dev, const struct fwat_attribute *attr,
+		       char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_enum_data *data = to_fwat_enum_data(ext->data);
+	int val_idx, sz = 0;
+	int ret;
+
+	switch (ext->type) {
+	case fwat_enum_current_value:
+		ret = data->read(dev, data->group.id, &val_idx);
+		if (ret < 0)
+			return ret;
+		break;
+	case fwat_enum_default_value:
+		val_idx = data->default_idx;
+		break;
+	case fwat_enum_possible_values:
+		sz += sysfs_emit_at(buf, sz, "%s", data->possible_vals[0]);
+		for (unsigned int i = 1; data->possible_vals[i]; i++)
+			sz += sysfs_emit_at(buf, sz, ";%s", data->possible_vals[i]);
+		sz += sysfs_emit_at(buf, sz, "\n");
+		return sz;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return sysfs_emit(buf, "%s\n", data->possible_vals[val_idx]);
+}
+
+static ssize_t
+integer_group_show(struct device *dev, const struct fwat_attribute *attr,
+		   char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_int_data *data = to_fwat_int_data(ext->data);
+	long val;
+	int ret;
+
+	switch (ext->type) {
+	case fwat_int_current_value:
+		ret = data->read(dev, data->group.id, &val);
+		if (ret < 0)
+			return ret;
+		break;
+	case fwat_int_default_value:
+		val = data->default_val;
+		break;
+	case fwat_int_min_value:
+		val = data->min_val;
+		break;
+	case fwat_int_max_value:
+		val = data->max_val;
+		break;
+	case fwat_int_scalar_increment:
+		val = data->increment;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return sysfs_emit(buf, "%ld\n", val);
+}
+
+static ssize_t
+string_group_show(struct device *dev, const struct fwat_attribute *attr,
+		  char *buf)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_str_data *data = to_fwat_str_data(ext->data);
+	const char *val;
+	long len;
+	int ret;
+
+	switch (ext->type) {
+	case fwat_str_current_value:
+		ret = data->read(dev, data->group.id, &val);
+		if (ret < 0)
+			return ret;
+		break;
+	case fwat_str_default_value:
+		val = data->default_val;
+		break;
+	case fwat_str_min_length:
+		len = data->min_len;
+		return sysfs_emit(buf, "%ld\n", len);
+	case fwat_str_max_length:
+		len = data->max_len;
+		return sysfs_emit(buf, "%ld\n", len);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return sysfs_emit(buf, "%s\n", val);
+}
+
+static ssize_t
+boolean_group_store(struct device *dev, const struct fwat_attribute *attr,
+		    const char *buf, size_t count)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_bool_data *data = to_fwat_bool_data(ext->data);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
+	ret = data->write(dev, data->group.id, val);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t
+enumeration_group_store(struct device *dev, const struct fwat_attribute *attr,
+			const char *buf, size_t count)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_enum_data *data = to_fwat_enum_data(ext->data);
+	int val_idx;
+	int ret;
+
+	val_idx = __sysfs_match_string(data->possible_vals, -1, buf);
+	if (val_idx < 0)
+		return val_idx;
+
+	ret = data->write(dev, data->group.id, val_idx);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t
+integer_group_store(struct device *dev, const struct fwat_attribute *attr,
+		    const char *buf, size_t count)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_int_data *data = to_fwat_int_data(ext->data);
+	long val;
+	int ret;
+
+	ret = kstrtol(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	ret = data->write(dev, data->group.id, val);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t
+string_group_store(struct device *dev, const struct fwat_attribute *attr,
+		   const char *buf, size_t count)
+{
+	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
+	const struct fwat_str_data *data = to_fwat_str_data(ext->data);
+	int ret;
+
+	ret = data->write(dev, data->group.id, buf);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static int fwat_add_group(struct fwat_device *fadev, const struct fwat_group_data *data,
+			  const struct fwat_group_config *config)
+{
+	struct fwat_attribute_ext *fattrs;
+	struct fwat_group *group;
+	struct attribute **attrs;
+	unsigned int bit, i = 0;
+	size_t nattrs;
+	int ret;
+
+	nattrs = bitmap_weight(&data->fattrs, config->total_attrs);
+	if (data->display_name)
+		nattrs++;
+	if (data->language_code)
+		nattrs++;
+
+	attrs = devm_kcalloc(fadev->dev, sizeof(*attrs), nattrs + 2, GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+	fattrs = devm_kcalloc(fadev->dev, sizeof(*fattrs), nattrs + 1, GFP_KERNEL);
+	if (!fattrs)
+		return -ENOMEM;
+
+	fattrs[i].fattr.attr.name = "type";
+	fattrs[i].fattr.attr.mode = 0444;
+	fattrs[i].fattr.show = fwat_type_show;
+	fattrs[i].data = data;
+	fattrs[i].type = config->type;
+	attrs[i] = &fattrs[i].fattr.attr;
+	i++;
+
+	if (data->display_name) {
+		fattrs[i].fattr.attr.name = "display_name";
+		fattrs[i].fattr.attr.mode = 0444;
+		fattrs[i].fattr.show = fwat_display_name_show;
+		fattrs[i].data = data;
+		fattrs[i].type = config->type;
+		attrs[i] = &fattrs[i].fattr.attr;
+		i++;
+	}
+
+	if (data->language_code) {
+		fattrs[i].fattr.attr.name = "display_name_language_code";
+		fattrs[i].fattr.attr.mode = 0444;
+		fattrs[i].fattr.show = fwat_language_code_show;
+		fattrs[i].data = data;
+		fattrs[i].type = config->type;
+		attrs[i] = &fattrs[i].fattr.attr;
+		i++;
+	}
+
+	for_each_set_bit(bit, &data->fattrs, config->total_attrs) {
+		fattrs[i].fattr.attr.name = config->attr_labels[bit];
+		/* current_value is always at bit 0 and uses data->mode */
+		fattrs[i].fattr.attr.mode = bit ? 0444 : data->mode;
+		fattrs[i].fattr.show = config->show;
+		fattrs[i].fattr.store = config->store;
+		fattrs[i].data = data;
+		fattrs[i].type = bit;
+		attrs[i] = &fattrs[i].fattr.attr;
+		i++;
+	}
+
+	group = devm_kzalloc(fadev->dev, sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return -ENOMEM;
+	group->group.name = data->name;
+	group->group.attrs = attrs;
+	ret = sysfs_create_group(&fadev->attrs_kobj, &group->group);
+	if (ret)
+		return ret;
+	list_add(&group->node, &fadev->auto_groups);
+
+	kobject_uevent(&fadev->attrs_kobj, KOBJ_CHANGE);
+
+	return 0;
+}
+
+static void fwat_remove_auto_groups(struct fwat_device *fadev)
+{
+	struct fwat_group *pos;
+
+	list_for_each_entry(pos, &fadev->auto_groups, node)
+		sysfs_remove_group(&fadev->attrs_kobj, &pos->group);
+}
+
+int fwat_create_bool_group(struct fwat_device *fadev, const struct fwat_bool_data *data)
+{
+	struct fwat_group_config config = {
+		.type = FWAT_GROUP_BOOLEAN,
+		.total_attrs = fwat_bool_attrs_last,
+		.attr_labels = fwat_bool_labels,
+		.show = boolean_group_show,
+		.store = boolean_group_store,
+	};
+
+	return fwat_add_group(fadev, &data->group, &config);
+}
+EXPORT_SYMBOL_GPL(fwat_create_bool_group);
+
+int fwat_create_enum_group(struct fwat_device *fadev, const struct fwat_enum_data *data)
+{
+	struct fwat_group_config config = {
+		.type = FWAT_GROUP_ENUMERATION,
+		.total_attrs = fwat_enum_attrs_last,
+		.attr_labels = fwat_enum_labels,
+		.show = enumeration_group_show,
+		.store = enumeration_group_store,
+	};
+
+	return fwat_add_group(fadev, &data->group, &config);
+}
+EXPORT_SYMBOL_GPL(fwat_create_enum_group);
+
+int fwat_create_int_group(struct fwat_device *fadev, const struct fwat_int_data *data)
+{
+	struct fwat_group_config config = {
+		.type = FWAT_GROUP_INTEGER,
+		.total_attrs = fwat_int_attrs_last,
+		.attr_labels = fwat_int_labels,
+		.show = integer_group_show,
+		.store = integer_group_store,
+	};
+
+	return fwat_add_group(fadev, &data->group, &config);
+}
+EXPORT_SYMBOL_GPL(fwat_create_int_group);
+
+int fwat_create_str_group(struct fwat_device *fadev, const struct fwat_str_data *data)
+{
+	struct fwat_group_config config = {
+		.type = FWAT_GROUP_STRING,
+		.total_attrs = fwat_str_attrs_last,
+		.attr_labels = fwat_str_labels,
+		.show = string_group_show,
+		.store = string_group_store,
+	};
+
+	return fwat_add_group(fadev, &data->group, &config);
+}
+EXPORT_SYMBOL_GPL(fwat_create_str_group);
+
 /**
  * fwat_device_register - Create and register a firmware-attributes class
  *			  device
@@ -102,6 +550,7 @@ fwat_device_register(struct device *parent, const char *name, void *data,
 
 	fadev->dev = dev;
 	fadev->groups = groups;
+	INIT_LIST_HEAD(&fadev->auto_groups);
 
 	kobject_uevent(&fadev->attrs_kobj, KOBJ_ADD);
 
@@ -120,11 +569,13 @@ EXPORT_SYMBOL_GPL(fwat_device_register);
 
 void fwat_device_unregister(struct fwat_device *fadev)
 {
-	struct device *dev = fadev->dev;
+	struct device *dev;
 
 	if (!fadev)
 		return;
 
+	dev = fadev->dev;
+	fwat_remove_auto_groups(fadev);
 	device_remove_groups(dev, fadev->groups);
 	kobject_del(&fadev->attrs_kobj);
 	kobject_put(&fadev->attrs_kobj);
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index ad94bf91e5af30a2b8feb9abf224ee6f0d17600a..6b089e61cfb74c4bf1d196d374bc6c271b14f211 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -10,6 +10,7 @@
 #include <linux/device/class.h>
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
+#include <linux/list.h>
 
 extern const struct class firmware_attributes_class;
 
@@ -23,6 +24,7 @@ struct fwat_device {
 	struct device *dev;
 	struct kobject attrs_kobj;
 	const struct attribute_group **groups;
+	struct list_head auto_groups;
 };
 
 #define to_fwat_device(_k)	container_of_const(_k, struct fwat_device, attrs_kobj)
@@ -43,6 +45,337 @@ struct fwat_attribute {
 
 #define to_fwat_attribute(_a) container_of_const(_a, struct fwat_attribute, attr)
 
+enum fwat_group_type {
+	FWAT_GROUP_BOOLEAN,
+	FWAT_GROUP_ENUMERATION,
+	FWAT_GROUP_INTEGER,
+	FWAT_GROUP_STRING,
+};
+
+enum fwat_bool_attrs {
+	fwat_bool_current_value,
+	fwat_bool_default_value,
+	fwat_bool_attrs_last
+};
+
+#define FWAT_BOOL_CURRENT_VALUE			BIT(fwat_bool_current_value)
+#define FWAT_BOOL_DEFAULT_VALUE			BIT(fwat_bool_default_value)
+#define FWAT_BOOL_ALL_ATTRS			GENMASK(fwat_bool_attrs_last, 0)
+
+enum fwat_enum_attrs {
+	fwat_enum_current_value,
+	fwat_enum_default_value,
+	fwat_enum_possible_values,
+	fwat_enum_attrs_last
+};
+
+#define FWAT_ENUM_CURRENT_VALUE			BIT(fwat_enum_current_value)
+#define FWAT_ENUM_DEFAULT_VALUE			BIT(fwat_enum_default_value)
+#define FWAT_ENUM_POSSIBLE_VALUES		BIT(fwat_enum_possible_values)
+#define FWAT_ENUM_ALL_ATTRS			GENMASK(fwat_enum_attrs_last, 0)
+
+enum fwat_int_attrs {
+	fwat_int_current_value,
+	fwat_int_default_value,
+	fwat_int_min_value,
+	fwat_int_max_value,
+	fwat_int_scalar_increment,
+	fwat_int_attrs_last
+};
+
+#define FWAT_INT_CURRENT_VALUE			BIT(fwat_int_current_value)
+#define FWAT_INT_DEFAULT_VALUE			BIT(fwat_int_default_value)
+#define FWAT_INT_MIN_VALUE			BIT(fwat_int_min_value)
+#define FWAT_INT_MAX_VALUE			BIT(fwat_int_max_value)
+#define FWAT_INT_SCALAR_INCREMENT		BIT(fwat_int_scalar_increment)
+#define FWAT_INT_ALL_ATTRS			GENMASK(fwat_int_attrs_last, 0)
+
+enum fwat_str_attrs {
+	fwat_str_current_value,
+	fwat_str_default_value,
+	fwat_str_min_length,
+	fwat_str_max_length,
+	fwat_str_attrs_last
+};
+
+#define FWAT_STR_CURRENT_VALUE			BIT(fwat_str_current_value)
+#define FWAT_STR_DEFAULT_VALUE			BIT(fwat_str_default_value)
+#define FWAT_STR_MIN_LENGTH			BIT(fwat_str_min_length)
+#define FWAT_STR_MAX_LENGTH			BIT(fwat_str_max_length)
+#define FWAT_STR_ALL_ATTRS			GENMASK(fwat_str_attrs_last, 0)
+
+static_assert(fwat_bool_current_value == 0);
+static_assert(fwat_enum_current_value == 0);
+static_assert(fwat_int_current_value == 0);
+static_assert(fwat_str_current_value == 0);
+
+/**
+ * struct fwat_group_data - Data struct common between group types
+ * @idx: Group ID defined by the user.
+ * @name: Name of the group.
+ * @display_name: Name showed in the display_name attribute. (Optional)
+ * @language_code: Language code showed in the display_name_language_code
+ *                 attribute. (Optional)
+ * @fattrs: Bitmap of selected attributes for this group type.
+ * @mode: Mode for the current_value attribute. All other attributes will have
+ *        0444 permissions.
+ *
+ * NOTE: This struct is not meant to be defined directly. It is supposed to be
+ * embedded and defined as part of fwat_[type]_data structs.
+ */
+struct fwat_group_data {
+	long id;
+	const char *name;
+	const char *display_name;
+	const char *language_code;
+	unsigned long fattrs;
+	umode_t mode;
+};
+
+/**
+ * struct fwat_bool_data - Data struct for the boolean group type
+ * @default_val: Default value.
+ * @read: Read callback for the current_value attribute.
+ * @write: Write callback for the current_value attribute.
+ * @group: Group data.
+ */
+struct fwat_bool_data {
+	bool default_val;
+	int (*read)(struct device *dev, long id, bool *val);
+	int (*write)(struct device *dev, long id, bool val);
+	struct fwat_group_data group;
+};
+
+/**
+ * struct fwat_enum_data - Data struct for the enumeration group type
+ * @default_idx: Index of the default value in the @possible_vals array.
+ * @possible_vals: Array of possible value strings for this group type.
+ * @read: Read callback for the current_value attribute.
+ * @write: Write callback for the current_value attribute.
+ * @group: Group data.
+ *
+ * NOTE: The `val_idx` argument in the @write callback is guaranteed to be a
+ *       valid (within bounds) index. However, the user is in charge of writing
+ *       valid indexes to the `*val_idx` argument of the @read callback.
+ *       Failing to do so may result in an OOB access.
+ */
+struct fwat_enum_data {
+	int default_idx;
+	const char * const *possible_vals;
+	int (*read)(struct device *dev, long id, int *val_idx);
+	int (*write)(struct device *dev, long id, int val_idx);
+	struct fwat_group_data group;
+};
+
+/**
+ * struct fwat_int_data - Data struct for the integer group type
+ * @default_val: Default value.
+ * @min_val: Minimum value.
+ * @max_val: Maximum value.
+ * @increment: Scalar increment for this value.
+ * @read: Read callback for the current_value attribute.
+ * @write: Write callback for the current_value attribute.
+ * @group: Group data.
+ *
+ * NOTE: The @min_val, @max_val, @increment constraints are merely informative.
+ *       These values are not enforced in any of the callbacks.
+ */
+struct fwat_int_data {
+	long default_val;
+	long min_val;
+	long max_val;
+	long increment;
+	int (*read)(struct device *dev, long id, long *val);
+	int (*write)(struct device *dev, long id, long val);
+	struct fwat_group_data group;
+};
+
+/**
+ * struct fwat_str_data - Data struct for the string group type
+ * @default_val: Default value.
+ * @min_len: Minimum string length.
+ * @max_len: Maximum string length.
+ * @read: Read callback for the current_value attribute.
+ * @write: Write callback for the current_value attribute.
+ * @group: Group data.
+ *
+ * NOTE: The @min_len, @max_len constraints are merely informative. These
+ *       values are not enforced in any of the callbacks.
+ */
+struct fwat_str_data {
+	const char *default_val;
+	long min_len;
+	long max_len;
+	int (*read)(struct device *dev, long id, const char **val);
+	int (*write)(struct device *dev, long id, const char *val);
+	struct fwat_group_data group;
+};
+
+#define __FWAT_GROUP(_name, _disp_name, _mode, _fattrs) \
+	{ .name = __stringify(_name), .display_name = _disp_name, .mode = _mode, .fattrs = _fattrs }
+
+/**
+ * DEFINE_FWAT_BOOL_GROUP - Convenience macro to quickly define an static
+ *                          struct fwat_bool_data instance
+ * @_name: Name of the group.
+ * @_disp_name: Name showed in the display_name attribute. (Optional)
+ * @_def_val: Default value.
+ * @_mode: Mode for the current_value attribute. All other attributes will have
+ *         0444 permissions.
+ * @_fattrs: Bitmap of selected attributes for this group type.
+ *
+ * `read` and `write` callbacks are required to be already defined as
+ * `_name##_read` and `_name##_write` respectively.
+ */
+#define DEFINE_FWAT_BOOL_GROUP(_name, _disp_name, _def_val, _mode, _fattrs) \
+	static const struct fwat_bool_data _name##_group_data = {	\
+		.read = _name##_read,					\
+		.write = _name##_write,					\
+		.default_val = _def_val,				\
+		.group = __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
+	}
+
+/**
+ * DEFINE_FWAT_ENUM_GROUP - Convenience macro to quickly define an static
+ *                          struct fwat_enum_data instance
+ * @_name: Name of the group.
+ * @_disp_name: Name showed in the display_name attribute. (Optional)
+ * @_def_idx: Index of the default value in the @_poss_vals array.
+ * @_poss_vals: Array of possible value strings for this group type.
+ * @_mode: Mode for the current_value attribute. All other attributes will have
+ *         0444 permissions.
+ * @_fattrs: Bitmap of selected attributes for this group type.
+ *
+ * `read` and `write` callbacks are required to be already defined as
+ * `_name##_read` and `_name##_write` respectively.
+ *
+ * NOTE: The `val_idx` argument in the `write` callback is guaranteed to be a
+ *       valid (within bounds) index. However, the user is in charge of writing
+ *       valid indexes to the `*val_idx` argument of the `read` callback.
+ *       Failing to do so may result in an OOB access.
+ */
+#define DEFINE_FWAT_ENUM_GROUP(_name, _disp_name, _poss_vals, _def_idx, _mode, _fattrs) \
+	static const struct fwat_enum_data _name##_group_data = {	\
+		.read = _name##_read,					\
+		.write = _name##_write,					\
+		.default_idx = _def_idx,				\
+		.possible_vals = _poss_vals,				\
+		.group = __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
+	}
+
+/**
+ * DEFINE_FWAT_INT_GROUP - Convenience macro to quickly define an static
+ *                         struct fwat_int_data instance
+ * @_name: Name of the group.
+ * @_disp_name: Name showed in the display_name attribute. (Optional)
+ * @_def_val: Default value.
+ * @_min: Minimum value.
+ * @_max: Maximum value.
+ * @_inc: Scalar increment for this value.
+ * @_mode: Mode for the current_value attribute. All other attributes will have
+ *         0444 permissions.
+ * @_fattrs: Bitmap of selected attributes for this group type.
+ *
+ * `read` and `write` callbacks are required to be already defined as
+ * `_name##_read` and `_name##_write` respectively.
+ *
+ * NOTE: The @_min, @_max, @_inc constraints are merely informative. These
+ *       values are not enforced in any of the callbacks.
+ */
+#define DEFINE_FWAT_INT_GROUP(_name, _disp_name, _def_val, _min, _max, _inc, _mode, _fattrs) \
+	static const struct fwat_int_data _name##_group_data = {	\
+		.read = _name##_read,					\
+		.write = _name##_write,					\
+		.default_val = _def_val,				\
+		.min_val = _min,					\
+		.max_val = _max,					\
+		.increment = _inc,					\
+		.group = __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
+	}
+
+/**
+ * DEFINE_FWAT_STR_GROUP - Convenience macro to quickly define an static
+ *                         struct fwat_str_data instance
+ * @_name: Name of the group.
+ * @_disp_name: Name showed in the display_name attribute. (Optional)
+ * @_def_val: Default value.
+ * @_min: Minimum string length.
+ * @_max: Maximum string length.
+ * @_mode: Mode for the current_value attribute. All other attributes will have
+ *         0444 permissions.
+ * @_fattrs: Bitmap of selected attributes for this group type.
+ *
+ * `read` and `write` callbacks are required to be already defined as
+ * `_name##_read` and `_name##_write` respectively.
+ *
+ * NOTE: The @_min, @_max constraints are merely informative. These values are
+ *       not enforced in any of the callbacks.
+ */
+#define DEFINE_FWAT_STR_GROUP(_name, _disp_name, _def_val, _min, _max, _mode, _fattrs) \
+	static const struct fwat_str_data _name##_group_data = {	\
+		.read = _name##_read,					\
+		.write = _name##_write,					\
+		.default_val = _def_val,				\
+		.min_len = _min,					\
+		.max_len = _max,					\
+		.group = __FWAT_GROUP(_name, _disp_name, _mode, _fattrs), \
+	}
+
+int fwat_create_bool_group(struct fwat_device *fadev,
+			   const struct fwat_bool_data *data);
+int fwat_create_enum_group(struct fwat_device *fadev,
+			   const struct fwat_enum_data *data);
+int fwat_create_int_group(struct fwat_device *fadev,
+			  const struct fwat_int_data *data);
+int fwat_create_str_group(struct fwat_device *fadev,
+			  const struct fwat_str_data *data);
+
+/**
+ * fwat_create_group - Convenience generic macro to create a group
+ * @_dev: fwat_device
+ * @_data: One of fwat_{bool,enum,int,str}_data instance
+ *
+ * This macro (and associated functions) creates a sysfs group under the
+ * 'attributes' directory, which is located in the class device root directory.
+ *
+ * See Documentation/ABI/testing/sysfs-class-firmware-attributes for details.
+ *
+ * The @_data associated with this group may be created either statically,
+ * through DEFINE_FWAT_*_GROUP macros or dynamically, in which case the user
+ * would have allocate and fill the struct manually. The dynamic approach should
+ * be preferred when group constraints and/or visibility is decided dynamically.
+ *
+ * Example:
+ *
+ * static int stat_read(...){...};
+ * static int stat_write(...){...};
+ *
+ * DEFINE_FWAT_(BOOL|ENUM|INT|STR)_GROUP(stat, ...);
+ *
+ * static int create_groups(struct fwat_device *fadev)
+ * {
+ *	struct fwat_enum_data *dyn_group_data;
+ *	int ret;
+ *	...
+ *	dyn_group_data = kzalloc(...);
+ *	// Fill the data
+ *	...
+ *	fwat_create_group(fadev, &stat_group_data);
+ *	fwat_create_group(fadev, &dyn_group_data);
+ *	fwat_create_group(...);
+ *	...
+ * }
+ *
+ * Return: 0 on success, -errno on failure
+ */
+#define fwat_create_group(_dev, _data) \
+	_Generic((_data),							\
+		 const struct fwat_bool_data * : fwat_create_bool_group,	\
+		 const struct fwat_enum_data * : fwat_create_enum_group,	\
+		 const struct fwat_int_data * : fwat_create_int_group,		\
+		 const struct fwat_str_data * : fwat_create_str_group)		\
+		(_dev, _data)
+
 struct fwat_device * __must_check
 fwat_device_register(struct device *parent, const char *name, void *data,
 		     const struct attribute_group **groups);

-- 
2.50.0

