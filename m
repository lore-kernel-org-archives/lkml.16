Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7A26AA86;
	Fri,  9 May 2025 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776962; cv=none; b=UrsYOvrHif5V3Xfuus0C5dlfQRmbulfkwBc9NmHZJ+mQYgBlRPyS2h41EB+AspToBXyIc4AVRUZoAppJorVQPnFcly3hOTvKA1dG2fVdYkQI0a23IlXZf5SSHpf3X8jUSPpYRbmkvpfJQmbRvVB1jV8I4O2piy4t/Ub0p82PD/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776962; c=relaxed/simple;
	bh=0mI/bIClotmAIMEue5Uh6KbwoJ+g9tFgZQBd+jg7Spg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsUZLbnO9LtLoiCQr5z5d4U03IVR7rZSX9Uv+N0Q1wOmErhIibmmtQDzc+fe+kRyt1sx36dZpQEFillMDxJV/FeI7dsV8HbqPqYXYaqFj+Ug8KPwekvtCUHQoKbr6T0pETIUpQPyOHdYU560F9HNiGugrrszF4kvSa4XWIAcrTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScPJHkM7; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScPJHkM7"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-523f670ca99so604730e0c.1;
        Fri, 09 May 2025 00:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746776959; x=1747381759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1RzP8Nae7C+98McQ5BCAJ1tDJLogzrgZIHRK1qrkfg=;
        b=ScPJHkM7HqMcWWbJw4DRDwIuHq1d7WO91CMBt1o6hsUyl6Xr6szh90kXVW/cbr6hb2
         nyhGORoQjpK29yzGvPFf0Ld4PfDcNAuay4GmAO73zkl6BBFykC9yXorcsCYhqj9+hpce
         mpOhp5vTQVSEOD8JFX6lLJy7Hb+2p+92/jbGygcZ6TO/nXYhFLEjc6Om2G7ov4KcB0aq
         lZHycUfYu4Nce6NFU15MFjyDYPPb1n0/xC9CYJAJoSP4lLi8VIHyjkmlXflxunTs/sI+
         rANwI4FJum7EhkE2LWPdtpZCiPYbwMDRUo35NWkYTE2PCqRORajhw4LmQUtSP+jL4Kcf
         U/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776959; x=1747381759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1RzP8Nae7C+98McQ5BCAJ1tDJLogzrgZIHRK1qrkfg=;
        b=RHTIeHCKnB16KhAB+cVP9g9HSr85uDoZB9U2GUoXTRrGALCRFBgTj/xCXZi1xawKOo
         ByX7t0PJh1o9fh44mKYrehoJxtda1V6Vhm612Q7LCVjA7qrCZYBU5lEA2L+HCSeDPwcf
         336MMeSGIfg2m7vaZw8BWImTEdORF29tLQGOCmXOknwNYviRqfNT6Brew+CkEttwq9tj
         hvrgvR3OJZ6wnmjdNLm0fCiE37RwU8HoHBdLDQZiT+9oS8ejr7mRkGu7xt/gyRcLUSMX
         PWQNhnzxkpqarV0fDO3chm/IBowom8QIXpaEWjVv8lrb61zZZgLlJaeBU2uFUV/+tnR9
         KpBA==
X-Forwarded-Encrypted: i=1; AJvYcCV1/1/IkDQj7PmfmcLjmp0NM+wo9OEosVmNA58QEX9eaXssa6znUXwXjTuh9ikUCTNyGlApBLmyJ4tXBvU=@vger.kernel.org, AJvYcCXSsZTayU+HjGV2lgNvM0zzL1NwHr3QrrmJ7wXv/1LuGhKJlDHJT0WZMs5rUKUa+W6FND8Xe42uIVjRvQOWLnr5XSzCgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNcHNxEvBAdT0GX+cCnEGb8U2iGLK4ICI5lAtXtm8BUUjreFi
	NJ65A7SH1PV1mZ/bXumaJN5dPJP49EqM2+ArrLbIL3OQudg/t/HU
X-Gm-Gg: ASbGnctrPHei/g8bCgh9EV72XrUawLUja96JZiZzXVwZyziyYVdC7kPRjPokQigl1F1
	djWcJvoBExyPLV4JIE5NeaLhOEnThSRjbfi6AWmasHQ9ETZLSk5trHZtVgJgOo49uU+4pXq8NSC
	6mvUYrnbIgV3QDEK7eQMCE5g3EWfUNaoBVwXeGG6jkPwnO8HsffkQcXGo5xCjTqow1vXCBb2r1M
	p8bi6x37SkMBwjQDRxtwOgCWvAkhKPJtNZoMr9mcba2LlSbSkHwufsex6Yes7gkSyF9LQMG5tSS
	7UkFAy/oLTL/vMfrJNvwBPkncPOQr18RTxk/c0Rz
X-Google-Smtp-Source: AGHT+IFdh3K8D/AsAmUV7aiJ3n2dUD0gZY0HWzhfepUoUEOQIyN3FiLcjdCcIyhy8JuMkPAR9vx0VQ==
X-Received: by 2002:a05:6122:45a1:b0:520:af9c:c058 with SMTP id 71dfb90a1353d-52c53b7f396mr2104851e0c.5.1746776959286;
        Fri, 09 May 2025 00:49:19 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f62986f3sm678265241.33.2025.05.09.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:49:18 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 09 May 2025 04:48:35 -0300
Subject: [PATCH RFC 3/5] platform/x86: firmware_attributes_class: Add a
 boolean type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-fw-attrs-api-v1-3-258afed65bfa@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4584; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=0mI/bIClotmAIMEue5Uh6KbwoJ+g9tFgZQBd+jg7Spg=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBmym3M+q23cdt2n5GiH9IwDKSIVq254Gy39UFHftOPro
 W/mn1pUO0pZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAicyYx/C9acflwYQvLgtbl
 gS4zRbVTNH5EpOsv1nU8ftxH8J0h6xyG/5k8XUYbC65dTz1RuHlW1vNFqWLPztTGimoot18X6xU
 o4AUA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add a `boolean` attribute type to prevent the use of the `enumeration`
type for this simple specification.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../ABI/testing/sysfs-class-firmware-attributes          |  1 +
 drivers/platform/x86/firmware_attributes_class.c         | 16 ++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h         | 11 +++++++++++
 3 files changed, 28 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 2713efa509b465a39bf014180794bf487e5b42d6..dc117e694416aed3f1f7ba0ebb1d0c23337b2298 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -21,6 +21,7 @@ Description:
 			- enumeration: a set of pre-defined valid values
 			- integer: a range of numerical values
 			- string
+			- bool
 
 		HP specific types
 		-----------------
diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 7cfb0f49f235728c7450a82a7e9d00b8963d3dea..13b10a1209be726b00fa1ebad6148778e165101e 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -26,6 +26,7 @@ EXPORT_SYMBOL_GPL(firmware_attributes_class);
 
 static const char * const fwat_type_labels[] = {
 	[fwat_type_integer]		= "integer",
+	[fwat_type_boolean]		= "boolean",
 	[fwat_type_string]		= "string",
 	[fwat_type_enumeration]		= "enumeration",
 };
@@ -72,6 +73,7 @@ fwat_current_value_show(struct device *dev, const struct fwat_attribute *attr, c
 	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
 	const struct fwat_attr_config *config = ext->config;
 	const char *str;
+	bool bool_val;
 	long int_val;
 	int ret;
 
@@ -82,6 +84,12 @@ fwat_current_value_show(struct device *dev, const struct fwat_attribute *attr, c
 			return ret;
 
 		return sysfs_emit(buf, "%ld\n", int_val);
+	case fwat_type_boolean:
+		ret = config->ops->boolean_read(dev, config->aux, &bool_val);
+		if (ret)
+			return ret;
+
+		return sysfs_emit(buf, "%u\n", bool_val);
 	case fwat_type_string:
 		ret = config->ops->string_read(dev, config->aux, &str);
 		if (ret)
@@ -105,6 +113,7 @@ fwat_current_value_store(struct device *dev, const struct fwat_attribute *attr,
 {
 	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
 	const struct fwat_attr_config *config = ext->config;
+	bool bool_val;
 	long int_val;
 	int ret;
 
@@ -116,6 +125,13 @@ fwat_current_value_store(struct device *dev, const struct fwat_attribute *attr,
 
 		ret = config->ops->integer_write(dev, config->aux, int_val);
 		break;
+	case fwat_type_boolean:
+		ret = kstrtobool(buf, &bool_val);
+		if (ret)
+			return ret;
+
+		ret = config->ops->boolean_write(dev, config->aux, bool_val);
+		break;
 	case fwat_type_string:
 		ret = config->ops->string_write(dev, config->aux, buf);
 		break;
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index f250875d785c3439682c43c693f98e1c20e9ff54..d95d2024b0d9630ee3750ec26e18874965ec5cff 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -49,6 +49,7 @@ struct fwat_attribute {
 
 enum fwat_attr_type {
 	fwat_type_integer,
+	fwat_type_boolean,
 	fwat_type_string,
 	fwat_type_enumeration,
 };
@@ -77,6 +78,10 @@ struct fwat_attr_config;
  *                type *integer*.
  * @integer_write: Callback for writing the current_value of an attribute of
  *                 type *integer*.
+ * @boolean_read: Callback for reading the current_value of an attribute of type
+ *                *boolean*.
+ * @boolean_write: Callback for writing the current_value of an attribute of
+ *                 type *boolean*.
  * @string_read: Callback for reading the current_value of an attribute of type
  *               *string*.
  * @string_write: Callback for writing the current_value of an attribute of type
@@ -96,6 +101,12 @@ struct fwat_attr_ops {
 			int (*integer_write)(struct device *dev, long aux,
 					     long val);
 		};
+		struct {
+			int (*boolean_read)(struct device *dev, long aux,
+					    bool *val);
+			int (*boolean_write)(struct device *dev, long aux,
+					     bool val);
+		};
 		struct {
 			int (*string_read)(struct device *dev, long aux,
 					   const char **str);

-- 
2.49.0

