Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12E61A5B9D;
	Sat,  8 Feb 2025 05:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991820; cv=none; b=P0YKBD91kFIezUoneFjw4cQyVWXZCy+OubKChRzjeA0VFT+g1bpv5E7bqKnLANJb/UEaYOg+dVTXTRdTjFedVGLVosAf9Chg70HfcsiU0lCkk+v34NAQfwolMcuaO0sMibiJOi+W9MXtZ7h3QQ+KRl1iC766ZgkL4f6e0zl6QMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991820; c=relaxed/simple;
	bh=nI7FgGy/u+gMITPMdKClt3nhKrK1SXiymvwzKMU4lKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EisQbuYuRHvrTX5aofisHWADaA9S4uxNO0t6ckZa1USbO3mTWRt4mNAy6j4kQloKDAD4szFX8rPLZmurqMwgULZCdIP6cTt2hrkbBrq8aZhOzhgWtjwGZDFTUDZ4V2OH7Nps+tsOTt17wcK5q+BST6gzf9Rb+GmFEqfEE4d1AmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aU8tU/kv; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aU8tU/kv"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e4419a47887so2151072276.0;
        Fri, 07 Feb 2025 21:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738991818; x=1739596618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2/ZbQaS7tudFA0bnX4MRV45fdFtTe7iOxVt9wUYReY=;
        b=aU8tU/kvAETNmsV7C7BezRSARh4/+7GIY9IYrCekhcgIaHLLjvvoQs5tcGmf+sbrJB
         UGPAIwmuAMYyvS2QIVe+hZ57//v9U3du/62+GBtL7Yz1KuSnSFuUG6/5j19zlbFuoAJO
         NYGTI4x6QX4q1VNcBbO1VJSE+0puWjy7EGr4srbXs5UDtJP2BDr5fTB7YgcmF3SUJeOw
         fpvHpGFu5BWYmYFRzh8Fyp9MKZa98+X9otxJJUBmog/4Xt56Dy6aVxNYkOVrq7BPD9g4
         dsTzobk1u6ADiyznvDRvApexL45EcNz+Xd306DpcQauYKqlzYnVOnpZTcROaZkic3zHL
         QgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991818; x=1739596618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2/ZbQaS7tudFA0bnX4MRV45fdFtTe7iOxVt9wUYReY=;
        b=ZbFdU7mhH2TURj0w9YGYy3LYAcBtVDylHas1TD0EthN4XYTmjqShbKJm6GTbzC3nqW
         3mXG+RNThrqkhrwRaXXlooi5ZMQQyouUBfw+l1Gmsp4Lsv8Jw4kMBlWxcLIPgEIehD4v
         1fPZQ2B2VOuy/FcaMKhPZkbGthI+tkwEPagqKMDs/jmqNxEJY/sjMlASB6nWgcOwDDEz
         NX9KA1Fp2x1Dl6j51j14W+qEwv5aTg+iFzyMAzMfHNvxyx3AXlElK+cQLAq9tVdVlu/d
         TsObIp8+Db/TMkmj18OURUt/LUgdAjkQGE7/lH6sTmzpd+ayryfBvxKyQG1XvZylF4o/
         4w3w==
X-Forwarded-Encrypted: i=1; AJvYcCWynGMFTpX2w6Q2n5QEhm++yGffXS5ryGoaWYogucyyExWEgCKospIMwwotrj3QuINuZuGI9JuRb+yPrxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrq2qQGu/U2kv0NiiezervWLFQCmFS/gdotPGJ0AJ0cUAeIF1H
	Iw/S5Worxl+3HqzGYSEnGo13ip81UoWNgF3Xuw5bNs/HLCvzzT+n
X-Gm-Gg: ASbGncv3sR7HWdIk8SzK+B4/A6j/fk/szikMBOVn4COJJoIkLOPIBiNZKY9jN36e8g0
	TKRDXEyM6pFG0/a/0dpCmNkBjKwVS9PC1/7HxRL98PJ6tjnX6KfdXG13uToUgLl/LbdhxlAFqUt
	CiZQz25qOAAoSyDDF/v7qVuOIP9JFx0gkJZnE4lGSqPVtxav0oWJpo6IXxNdeortfbokgtljSwV
	0yZ4S8lSY7vHuRuRipVA0PiLQ+9L2T/Ut+ExKuu9eJqHhJ7R6/OLe/1I64N9w+LXJDqRbCNI7L6
	OOmGMMQj3bmQJNVX1MdzyMQ=
X-Google-Smtp-Source: AGHT+IGWwiLJOyK+4R8azb8TXlvlewJs/Oya5AYFHe5PNT8EH8cTaLZ3Qb+qs4Mgs2kSV/kG+AlfEw==
X-Received: by 2002:a05:6902:1b85:b0:e4d:25c6:c3b2 with SMTP id 3f1490d57ef6-e5b46175f3bmr5696643276.7.1738991817828;
        Fri, 07 Feb 2025 21:16:57 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f00e0sm1207670276.2.2025.02.07.21.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:16:57 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 03/10] platform/x86: alienware-wmi-wmax: Improve internal AWCC API
Date: Sat,  8 Feb 2025 00:16:07 -0500
Message-ID: <20250208051614.10644-4-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208051614.10644-1-kuurtb@gmail.com>
References: <20250208051614.10644-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline all AWCC WMI helper methods and directly return the newly
introduced __awcc_wmi_command() to simplify implementation. Additionally
make wmax_u32_args __packed, additional failure code and add a helper
with documentation for AWCC_OP_GET_RESOURCE_ID.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../platform/x86/dell/alienware-wmi-wmax.c    | 104 +++++++++++-------
 1 file changed, 63 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 7f0aa88221d6..57897a0f4296 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -32,6 +32,7 @@
 #define AWCC_THERMAL_MODE_GMODE			0xAB
 
 #define AWCC_FAILURE_CODE			0xFFFFFFFF
+#define AWCC_FAILURE_CODE_2			0xFFFFFFFE
 #define AWCC_THERMAL_TABLE_MASK			GENMASK(7, 4)
 #define AWCC_THERMAL_MODE_MASK			GENMASK(3, 0)
 #define AWCC_RESOURCE_ID_MASK			GENMASK(7, 0)
@@ -206,7 +207,7 @@ struct wmax_u32_args {
 	u8 arg1;
 	u8 arg2;
 	u8 arg3;
-};
+} __packed;
 
 struct awcc_priv {
 	struct wmi_device *wdev;
@@ -442,8 +443,7 @@ const struct attribute_group wmax_deepsleep_attribute_group = {
 };
 
 /*
- * Thermal Profile control
- *  - Provides thermal profile control through the Platform Profile API
+ * AWCC Helpers
  */
 static bool is_awcc_thermal_profile_id(u8 code)
 {
@@ -462,72 +462,95 @@ static bool is_awcc_thermal_profile_id(u8 code)
 	return false;
 }
 
-static int awcc_thermal_information(struct wmi_device *wdev, u8 operation,
-				    u8 arg, u32 *out_data)
+static int __awcc_wmi_command(struct wmi_device *wdev, u32 method_id,
+			      struct wmax_u32_args *args, u32 *out)
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
+static inline int awcc_thermal_information(struct wmi_device *wdev, u8 operation,
+					   u8 arg, u32 *out)
 {
-	struct wmax_u32_args in_args = {
-		.operation = AWCC_OP_ACTIVATE_PROFILE,
-		.arg1 = profile,
+	struct wmax_u32_args args = {
+		.operation = operation,
+		.arg1 = arg,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	u32 out_data;
-	int ret;
 
-	ret = alienware_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL,
-				    &in_args, sizeof(in_args), &out_data);
-	if (ret)
-		return ret;
+	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
+}
 
-	if (out_data == AWCC_FAILURE_CODE)
-		return -EBADRQC;
+static inline int awcc_thermal_control(struct wmi_device *wdev, u8 profile)
+{
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_ACTIVATE_PROFILE,
+		.arg1 = profile,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+	u32 out;
 
-	return 0;
+	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL, &args, &out);
 }
 
-static int awcc_game_shift_status(struct wmi_device *wdev, u8 operation,
-				  u32 *out_data)
+static inline int awcc_game_shift_status(struct wmi_device *wdev, u8 operation,
+					 u32 *out)
 {
-	struct wmax_u32_args in_args = {
+	struct wmax_u32_args args = {
 		.operation = operation,
 		.arg1 = 0,
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	int ret;
 
-	ret = alienware_wmi_command(wdev, AWCC_METHOD_GAME_SHIFT_STATUS,
-				    &in_args, sizeof(in_args), out_data);
-	if (ret < 0)
-		return ret;
+	return __awcc_wmi_command(wdev, AWCC_METHOD_GAME_SHIFT_STATUS, &args, out);
+}
 
-	if (*out_data == AWCC_FAILURE_CODE)
-		return -EOPNOTSUPP;
+/**
+ * awcc_op_get_resource_id - Get the resource ID at a given index
+ * @wdev: AWCC WMI device
+ * @index: Index
+ * @out: Value returned by the WMI call
+ *
+ * Get the resource ID at a given index. Resource IDs are listed in the
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
+static inline int awcc_op_get_resource_id(struct wmi_device *wdev, u8 index, u32 *out)
+{
+	struct wmax_u32_args args = {
+		.operation = AWCC_OP_GET_RESOURCE_ID,
+		.arg1 = index,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
 
-	return 0;
+	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
 }
 
+/*
+ * Thermal Profile control
+ *  - Provides thermal profile control through the Platform Profile API
+ */
 static int awcc_platform_profile_get(struct device *dev,
 				     enum platform_profile_option *profile)
 {
@@ -605,8 +628,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_RESOURCE_ID,
-					       i + first_mode, &out_data);
+		ret = awcc_op_get_resource_id(priv->wdev, i + first_mode, &out_data);
 
 		if (ret == -EIO)
 			return ret;
-- 
2.48.1

