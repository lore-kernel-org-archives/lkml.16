Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7411DF97D;
	Sat, 17 May 2025 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747471940; cv=none; b=U5mu5oGMSsNcSBS5byabrAoRDU4ZIlTKK4BTsOAirMDZAzcPUw7glwN6qZoefU2AEeQ7EfVUrM0swpqorZieZ7dXUTqn4ZsVDvnv0rV4AgFbbgojkqn7o7UybX+wXSLZRcN1L6bFVuEphFkqRNeuOeSDNiEmm0e31Tj8SfPM6/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747471940; c=relaxed/simple;
	bh=rmQRwhQBhuVXzEdWrxu6DgGpJ/TFjWXuQ+dIpPlVohk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4bRvJ44H6ZaYLvbtJUi1bBIDsIxj8xrVYk959I6p6MNLE+JfR1MEMk1K5BTLmkmCCfRPH88xAgfLdyhhlIfStLy1wxXVNWLJPoQDsqIRTlP3Ltuq1CDKEXYKzwwqA09q9fE2Y/5W9u/rAiPU2J5W+lJ+MSnj//clkxcF/dYbNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UneHCoBP; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UneHCoBP"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52446b21cfdso934943e0c.1;
        Sat, 17 May 2025 01:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747471937; x=1748076737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qccBuuWpvwsgM8Jc+gDFmCX6IMSyESybM5/OV7jtB+0=;
        b=UneHCoBPT5tdHfFK+JquMmD4Rpco7CnynnOKQE1mL8MuUzKHs4mVCDrdiEOjULEZYt
         LYxHfreHmcL2iFPOLTgvLt3Ml4mYlej/2OxlKNPtS5JObEDeB1GNBvmwp44h2C2bvjeh
         qdtnbidSYTnfKUfSwQ5LFzUQ3XjqWlaE99hrAIAR8YhDTgJThi5jGYugk/GGGemPNyVR
         hJlOfn4FfuQKVPdy7LtV1vN3lPZL11UpP5fk/7sxtZyy/jtWfagyWFCwlpSCw8gZTKbG
         py+ROQ1F/1jYo0NbLf5ugDtXfQxbDyMCODkzpaT4HMMk6126wNhmi5+rQZesOzn696fC
         eADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747471937; x=1748076737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qccBuuWpvwsgM8Jc+gDFmCX6IMSyESybM5/OV7jtB+0=;
        b=ctW95QUHiNXFfB+gfeiXfFrzA9daXS/9OkUn42AFxbFP5ZxaqeDP7R9Q18O4uzID+v
         FPADBqv5voUC/7LNqq1e88485H7cNn5/eJMTKz3ga9LVm5bkodlOSFCFfttziS9Oxvz6
         S1+FOryxCmmvfVsQXzuecpwxZBHvEl55vFYTEnxSNIXdNIrAj0wBwPpSDWp7u/3MlYMY
         u45JQO1s/5fucEqqD+wb57xbsYvR7KpXbs3d5szibpUznahGGLqyA2eEW5YceclOo9zO
         PxpL9/2DyWdmrPDrSkkT3qIAls9luIUqs3BFq9wbrNQV6Q/ppJ4jnRa80zrIc4yJl7i6
         2/ug==
X-Forwarded-Encrypted: i=1; AJvYcCVhK9DUed7WkyvvbDn8aY2lhVJtb0FXJKLnQmh5FLjfpSAJMdOhGHYXwdrW9xgGewmC1XdH0rXYQWuU0to=@vger.kernel.org, AJvYcCWAU9ndizfpro0eWFsZgDKXyo5hF7bDqEaQoW9e152m90RKdpSirSbX1VWrUPKRgjPV1NP9XE5m4yqNcWh1z13rdHwbSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW7gpY1S+y+rChPKAsiUiuAKnsqdRa6qRPIkKz3uqGrNtVcJZi
	vn4hMO3Zpb88f5yfJM4xy1JI7VgxWWIU62P31chwHYfmB7A88+oy7npI
X-Gm-Gg: ASbGnctkuuLfMyiwQL7RlDd1oR0JGt+vUgmrp1/AOaj+xPb0dhY6Se5MSm+P2XT67LN
	P3DK11ILAfxQVMNaG/5SbGL1FlzuNpmdq7YUEtrCSM0f31my0Tbv5lTnbThM1fI7e53tj2Ccd/X
	b3C5nL3OUuHM4ZaMkC5UPKjrpE7EXs+UcKqhAptaXD1W5wRv0oEKYvKxiRQkWGHpIp0U6duCbam
	D4vkmyP+Ab0G7qDUbwyxcZL57oHqsgjoOUmPavjZW40zSgCPeOmra+re3E+ZSpzXwafAJ5FLcn3
	yNtfkfgKhGLQwu2qQ+8c5xTJNVzo0jDmqZxnJ2/uioj1eKa3Ww==
X-Google-Smtp-Source: AGHT+IGp6hPOh6NJySLw2Ewyl+wfIspmsXg3vEzw48m59injigVXszENJYTCD0nB94sqN7ZRcfAaYQ==
X-Received: by 2002:a05:6122:8c0f:b0:520:3536:feb5 with SMTP id 71dfb90a1353d-52dba97c622mr7276344e0c.11.1747471937443;
        Sat, 17 May 2025 01:52:17 -0700 (PDT)
Received: from [192.168.1.26] ([181.85.227.70])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba9405adsm3455812e0c.11.2025.05.17.01.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 01:52:17 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 17 May 2025 05:51:38 -0300
Subject: [PATCH v2 3/5] platform/x86: firmware_attributes_class: Add a
 boolean type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-fw-attrs-api-v2-3-fa1ab045a01c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=rmQRwhQBhuVXzEdWrxu6DgGpJ/TFjWXuQ+dIpPlVohk=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkafvrHTlQayQs+/d03p3uugLOnfGjKpzn2Esw+tXYvv
 uw4VhjcUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABOZ3c3wV7hje0VYblaeRdEN
 Bs4PK5m5fy+Obp9XYhYg7ML/sKl9GiND12NJa0uPX5N8PfPDZixn1J5psPJocfgKD49y3UmTf8m
 zAQA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add a `boolean` attribute type to prevent the use of the `enumeration`
type for this simple specification.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../ABI/testing/sysfs-class-firmware-attributes       |  1 +
 drivers/platform/x86/firmware_attributes_class.c      | 19 +++++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h      |  8 ++++++++
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
index 29401b81b25b9bb1332dbe56eadf96ff81e91c2f..6ff38b3be98bc8705ac29ce0afc11d5a4604dc8e 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -27,6 +27,7 @@ EXPORT_SYMBOL_GPL(firmware_attributes_class);
 
 static const char * const fwat_type_labels[] = {
 	[fwat_type_integer]		= "integer",
+	[fwat_type_boolean]		= "boolean",
 	[fwat_type_string]		= "string",
 	[fwat_type_enumeration]		= "enumeration",
 };
@@ -74,6 +75,7 @@ fwat_current_value_show(struct device *dev, const struct fwat_attribute *attr, c
 	const struct fwat_attr_config *config = ext->config;
 	const struct fwat_attr_ops *ops = config->ops;
 	const char *str;
+	bool bool_val;
 	long int_val;
 	int ret;
 
@@ -87,6 +89,12 @@ fwat_current_value_show(struct device *dev, const struct fwat_attribute *attr, c
 			return ret;
 
 		return sysfs_emit(buf, "%ld\n", int_val);
+	case fwat_type_boolean:
+		ret = config->ops->boolean.read(dev, config->aux, &bool_val);
+		if (ret)
+			return ret;
+
+		return sysfs_emit(buf, "%u\n", bool_val);
 	case fwat_type_string:
 		if (!ops->string.read)
 			return -EOPNOTSUPP;
@@ -117,6 +125,7 @@ fwat_current_value_store(struct device *dev, const struct fwat_attribute *attr,
 	const struct fwat_attribute_ext *ext = to_fwat_attribute_ext(attr);
 	const struct fwat_attr_config *config = ext->config;
 	const struct fwat_attr_ops *ops = config->ops;
+	bool bool_val;
 	long int_val;
 	int ret;
 
@@ -131,6 +140,16 @@ fwat_current_value_store(struct device *dev, const struct fwat_attribute *attr,
 
 		ret = ops->integer.write(dev, config->aux, int_val);
 		break;
+	case fwat_type_boolean:
+		if (!ops->boolean.write)
+			return -EOPNOTSUPP;
+
+		ret = kstrtobool(buf, &bool_val);
+		if (ret)
+			return ret;
+
+		ret = ops->boolean.write(dev, config->aux, bool_val);
+		break;
 	case fwat_type_string:
 		if (!ops->string.write)
 			return -EOPNOTSUPP;
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index 3a13c69ca6a0f993cf7c6bfae6e43f1eeaa002ab..b823d05d76e91efa40cd3623687b57c664176073 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -49,6 +49,7 @@ struct fwat_attribute {
 
 enum fwat_attr_type {
 	fwat_type_integer,
+	fwat_type_boolean,
 	fwat_type_string,
 	fwat_type_enumeration,
 };
@@ -80,11 +81,17 @@ struct str_ops {
 	int (*write)(struct device *dev, long aux, const char *str, size_t count);
 };
 
+struct bool_ops {
+	int (*read)(struct device *dev, long aux, bool *val);
+	int (*write)(struct device *dev, long aux, bool val);
+};
+
 /**
  * struct fwat_attr_ops - Operations for a firmware *attribute*
  * @type: Type of callbacks.
  * @prop_read: Callback for retrieving each configured property of an attribute.
  * @integer: Integer type callbacks.
+ * @boolean: Boolean type callbacks.
  * @string: String type callbacks.
  * @enumeration: Enumeration type callbacks.
  */
@@ -94,6 +101,7 @@ struct fwat_attr_ops {
 			     enum fwat_property prop, char *buf);
 	union {
 		struct long_ops integer;
+		struct bool_ops boolean;
 		struct str_ops string;
 		struct str_ops enumeration;
 	};

-- 
2.49.0

