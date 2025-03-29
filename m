Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBBC1C5F18;
	Sat, 29 Mar 2025 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233586; cv=none; b=G9CDPsgwzHNYVU8vmV7VSzgEPOWhLa9NPmGz+hjcD6zfGUDe6lr3O0kXOaBDHImwjZVaAPHaiKZ78wjM62eCzTrizzVTNVJ26C9a+cpoEGlpqqRlPUVHiHe6RDLl0jvfyPjd36h2fP5L/dKaUwEKhedrvf0KismzxSnh2dXna84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233586; c=relaxed/simple;
	bh=2KOJGb3TfQNpBEipaaFsJun53GcQ7/CJSWvqGaTayvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9loOi9nsQz6WN/6QqQ273WxIMH7VKlQWyTVqcWCVMcbFOwpo4CgSfKBr7mGBPu3DkpxEM4DHgfAt88/2GazqckDhLOTsVQoPvvf37N4Oj/5PEnKCQvZ/xxorEckDin+1ykapPKOro4bufQA1cAaqANoxsi74T11fTcgm7vf5kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cevqm/JJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cevqm/JJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2260c915749so43143915ad.3;
        Sat, 29 Mar 2025 00:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233584; x=1743838384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=If3OzlJA+J+w/N9kAYOqkCq+CjhXIVRXJITXcSQtINY=;
        b=cevqm/JJn6sdJzLDYygJUm+69WtQIjhAbfWCXQGq4ka6Dfv77k+Avohofu/SG2PpJM
         IUtzVWeCy2YdAy4dYZ2u7YPJDVPQameVHcj5FMM3TFYF2fNgEiZNBo/0fUkTl2VdU4MP
         XMdkjAcOCGZG2ZpEI0BdpjAoPOVYPq4PXeYCTRhtb7jNSrk2SOlhtWKZCszffmLuWOWY
         CWN9WEVfT8+o7v7geoSri9WGIQje1JVwZgHNLpcmhSXAR+WcfayGZBxqdKujf7E5ahLt
         J4Aicx/MTe2Ir9B5zJ6f5wwizcjO2528zakdJRGu/u5wqeIalY+jYQ1vkuc49pyJIvR+
         q2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233584; x=1743838384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=If3OzlJA+J+w/N9kAYOqkCq+CjhXIVRXJITXcSQtINY=;
        b=t5BgZNWNjZVs/Hf3d9IQlKzqGldWBFZfTgPAc3/D6f+Y/c84ENnKKvwJKgJ6VoMX06
         gWX4jM0UhAaGYNR2gRjAkFIWbSUX6L3Ghf69ByBWq1vLvWRr6PbForgoGXiRBqp7Jzp0
         eRu21gsS2kBxmRsnpdZUzkE8lnXUeJ5z31jehssqQQOG7htMjQvR2/OI6ZFkqc0NHqEd
         5iMFrHFQu8KtB/IwWSxTCF2UJ8RLVL8UWvyWhZdll28yFNJyx31gBuOGblYbfSPKJIxx
         vvkI7vuuZeUEoW860PXHvQSbgmLf7XXUcHF6XnvjsakDgz9att7x9Df38GGR/b7A9xjv
         0bjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT3Q88NN64F3lDdEL9a4mwyiw7sEMdqo/M8zaw8ytw6uaxlBnJxxFxh6NIeZAlq6Ey3a2RScgHmiPWgqM081y4IuYULg==@vger.kernel.org, AJvYcCVoYyF7Oi8HrBVxkanG7sPBNTJTOpgdXoPy2XjStq6ENgMyQ7quwm2FQX+jNpGj9NbZpWW4vW8u7tdGdBw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy37h2zn+DhB/y5Hiwpprl08IPAUrnVO1LEwAIRonTnLYeteiIA
	MQofQSk2BYkccxo0Nmoxnx0dq41mlNotG1/Uw/JlTQR1L41iOELhoww9tw==
X-Gm-Gg: ASbGncu9ugowe8iaHTHODfMJkrOzp6mtmur25kDfxbMsxR7Tp7NsoAwWtjStviBPdny
	hgWemGM/FZOJcmKdM3kXjVoZufH6vHpHilGREwuX5/5uZkSoRc1m3GoYpLLB1NSkQY05HHlpzUb
	vhsvXZ1sZx0BROY2JQxRE3i2wPxCAPsOVa2nNr27uzeyDPuVz2jP1136XvTn9IxdEq62GEVrRdT
	/x7z3hzvoUFsmyu3bwVZnkqp6oK2U55aoon7vod9OOIRq+vNB/K2FI+VMA0lGmUcbR+xulZuHkc
	flZtxP04p0G1uNnzfYCUnBJMB4HOlykydLjAdeW4szc5duigzouObN4=
X-Google-Smtp-Source: AGHT+IEMV+ijW5j60am+44nMCggZe76hy5amvMXwrB4x3BvSQqqoNOAATNcfHmVzGPJU8R+jkLK5hQ==
X-Received: by 2002:a17:902:d583:b0:216:7926:8d69 with SMTP id d9443c01a7336-2292fa0258fmr31311185ad.47.1743233583614;
        Sat, 29 Mar 2025 00:33:03 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:03 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:20 -0300
Subject: [PATCH v7 03/12] platform/x86: alienware-wmi-wmax: Improve
 internal AWCC API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-hwm-v7-3-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Inline all AWCC WMI helper methods and directly return the newly
introduced awcc_wmi_command() helper to simplify implementation.

Drop awcc_thermal_control() in favor of awcc_op_activate_profile().

Add awcc_op_get_resource_id(), awcc_op_get_current_profile() and a new
failure code.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 130 ++++++++++++++++---------
 1 file changed, 84 insertions(+), 46 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 66755ff21933297568a5262726c05bc60fef56db..c0831c069e366c52b5bc6dcf7996c7b21f4c089d 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -32,6 +32,7 @@
 #define AWCC_THERMAL_MODE_GMODE			0xAB
 
 #define AWCC_FAILURE_CODE			0xFFFFFFFF
+#define AWCC_FAILURE_CODE_2			0xFFFFFFFE
 
 #define AWCC_SENSOR_ID_FLAG			BIT(8)
 #define AWCC_THERMAL_MODE_MASK			GENMASK(3, 0)
@@ -444,8 +445,7 @@ const struct attribute_group wmax_deepsleep_attribute_group = {
 };
 
 /*
- * Thermal Profile control
- *  - Provides thermal profile control through the Platform Profile API
+ * AWCC Helpers
  */
 static bool is_awcc_thermal_profile_id(u8 code)
 {
@@ -464,72 +464,115 @@ static bool is_awcc_thermal_profile_id(u8 code)
 	return false;
 }
 
-static int awcc_thermal_information(struct wmi_device *wdev, u8 operation,
-				    u8 arg, u32 *out_data)
+static int awcc_wmi_command(struct wmi_device *wdev, u32 method_id,
+			    struct wmax_u32_args *args, u32 *out)
 {
-	struct wmax_u32_args in_args = {
-		.operation = operation,
-		.arg1 = arg,
-		.arg2 = 0,
-		.arg3 = 0,
-	};
 	int ret;
 
-	ret = alienware_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION,
-				    &in_args, sizeof(in_args), out_data);
-	if (ret < 0)
+	ret = alienware_wmi_command(wdev, method_id, args, sizeof(*args), out);
+	if (ret)
 		return ret;
 
-	if (*out_data == AWCC_FAILURE_CODE)
+	if (*out == AWCC_FAILURE_CODE || *out == AWCC_FAILURE_CODE_2)
 		return -EBADRQC;
 
 	return 0;
 }
 
-static int awcc_thermal_control(struct wmi_device *wdev, u8 profile)
+static int awcc_thermal_information(struct wmi_device *wdev, u8 operation, u8 arg,
+				    u32 *out)
 {
-	struct wmax_u32_args in_args = {
-		.operation = AWCC_OP_ACTIVATE_PROFILE,
-		.arg1 = profile,
+	struct wmax_u32_args args = {
+		.operation = operation,
+		.arg1 = arg,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
+}
+
+static int awcc_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out)
+{
+	struct wmax_u32_args args = {
+		.operation = operation,
+		.arg1 = 0,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_GAME_SHIFT_STATUS, &args, out);
+}
+
+/**
+ * awcc_op_get_resource_id - Get the resource ID at a given index
+ * @wdev: AWCC WMI device
+ * @index: Index
+ * @out: Value returned by the WMI call
+ *
+ * Get the resource ID at a given @index. Resource IDs are listed in the
+ * following order:
+ *
+ *	- Fan IDs
+ *	- Sensor IDs
+ *	- Unknown IDs
+ *	- Thermal Profile IDs
+ *
+ * The total number of IDs of a given type can be obtained with
+ * AWCC_OP_GET_SYSTEM_DESCRIPTION.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+static int awcc_op_get_resource_id(struct wmi_device *wdev, u8 index, u8 *out)
+{
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_GET_RESOURCE_ID,
+		.arg1 = index,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
 	u32 out_data;
 	int ret;
 
-	ret = alienware_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL,
-				    &in_args, sizeof(in_args), &out_data);
+	ret = awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, &out_data);
 	if (ret)
 		return ret;
 
-	if (out_data == AWCC_FAILURE_CODE)
-		return -EBADRQC;
+	*out = FIELD_GET(AWCC_RESOURCE_ID_MASK, out_data);
 
 	return 0;
 }
 
-static int awcc_game_shift_status(struct wmi_device *wdev, u8 operation,
-				  u32 *out_data)
+static int awcc_op_get_current_profile(struct wmi_device *wdev, u32 *out)
 {
-	struct wmax_u32_args in_args = {
-		.operation = operation,
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_GET_CURRENT_PROFILE,
 		.arg1 = 0,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	int ret;
 
-	ret = alienware_wmi_command(wdev, AWCC_METHOD_GAME_SHIFT_STATUS,
-				    &in_args, sizeof(in_args), out_data);
-	if (ret < 0)
-		return ret;
-
-	if (*out_data == AWCC_FAILURE_CODE)
-		return -EOPNOTSUPP;
-
-	return 0;
+	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
 }
 
+static int awcc_op_activate_profile(struct wmi_device *wdev, u8 profile)
+{
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_ACTIVATE_PROFILE,
+		.arg1 = profile,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+	u32 out;
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL, &args, &out);
+}
+
+/*
+ * Thermal Profile control
+ *  - Provides thermal profile control through the Platform Profile API
+ */
 static int awcc_platform_profile_get(struct device *dev,
 				     enum platform_profile_option *profile)
 {
@@ -537,10 +580,8 @@ static int awcc_platform_profile_get(struct device *dev,
 	u32 out_data;
 	int ret;
 
-	ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_CURRENT_PROFILE,
-				       0, &out_data);
-
-	if (ret < 0)
+	ret = awcc_op_get_current_profile(priv->wdev, &out_data);
+	if (ret)
 		return ret;
 
 	if (out_data == AWCC_THERMAL_MODE_GMODE) {
@@ -584,8 +625,8 @@ static int awcc_platform_profile_set(struct device *dev,
 		}
 	}
 
-	return awcc_thermal_control(priv->wdev,
-				    priv->supported_thermal_profiles[profile]);
+	return awcc_op_activate_profile(priv->wdev,
+					priv->supported_thermal_profiles[profile]);
 }
 
 static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
@@ -595,7 +636,6 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 	enum awcc_thermal_profile mode;
 	u8 sys_desc[4];
 	u32 first_mode;
-	u32 out_data;
 	int ret;
 	u8 id;
 
@@ -607,8 +647,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_RESOURCE_ID,
-					       i + first_mode, &out_data);
+		ret = awcc_op_get_resource_id(priv->wdev, i + first_mode, &id);
 
 		if (ret == -EIO)
 			return ret;
@@ -616,7 +655,6 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 		if (ret == -EBADRQC)
 			break;
 
-		id = FIELD_GET(AWCC_RESOURCE_ID_MASK, out_data);
 		if (!is_awcc_thermal_profile_id(id))
 			continue;
 

-- 
2.49.0

