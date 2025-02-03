Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B38320F098;
	Mon,  3 Feb 2025 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607258; cv=none; b=jDPC9NwtUsIkvQIfwHC+jLvgqiKWv9gGIC5XY6M5Q/0HscxDi9GlOR/Yw1UsRbX5A+ABQPOleq4yVokE3lPL2ImNevp3eDjMG6JDBY9HUSFOZYOgjmhnt9Eu6bTGD1iRMnzyLvUg6emhaAoFBc0bn4LTPkCkoIO9eicGGyy2VjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607258; c=relaxed/simple;
	bh=d7GIRWG1w+oy6GfRgUg+f2ZhMmcP2ix7xOFCG6UMgSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fKL2qk1Ih0xsBf7NV5HcwQ0k/+/z6LkazkAiu/7rjZ70aTBcXYmqJRjHH8cyogiat21rY/Zn/+EVx+vJEvopHDEIMHucDuLwvYdLC5sPZVQ8ZHhmR7NXQZ8opMOWtpPevVNUXdgjUrOBDUZWRIOt0Yz6c6zVma4hLX0TjZ3Q+44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3aETF46; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3aETF46"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e461015fbd4so4335892276.2;
        Mon, 03 Feb 2025 10:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607255; x=1739212055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSZEgnvkvRJA2TPZEho+sfAhLOhXPrLDclL09/UUlls=;
        b=f3aETF46ZIRMSgi2zrj8wog/VWJ8hhlNmcX7KvsAhYT8XdrM+qF5Wym1LrOUXVd9S6
         9EQgG7Ww3WVZ9T+otkjWxl5LBEpSS8oXfjQdjw0dbwfDlNZttS/cj3WcrKAEA53kr5sh
         LxsTLpAE8RXnRnFbEaH6IYDRRTuuOEJETEhhajyRZyxJp100OeP0Q5kQtiQ4NXhsJe0y
         SURZfxvb6NkDgw5/VoeZqwpHtAdBI36sOoAEzXIgb+gbLQo73l3IeseElGbXy2v9sKwZ
         jRfmCq5WSPPgMOY92F0FajWkcu/60h63rcdYwmVlif93R9GwHZ2g9ruc5BWbCAL8kXsI
         0j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607255; x=1739212055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSZEgnvkvRJA2TPZEho+sfAhLOhXPrLDclL09/UUlls=;
        b=B5mRNYKI46uhmmupH6jufblQPSIowUYsUZfqRqo71AjCuoKXRkqJ5lpGOGYegbWx0E
         mjUH8c6TZL3r0aN1/lh9xIqpzqkeg/gOpLP9veyidtWgm+NX0xBEVkA4Zqqeu+9ONWVJ
         teH/BfyD/z55o18tCsbq3d+IfLTV5G6yqlJSVnsjFzogJk7+c2VMfz/9lgTau5m/TDVs
         H50IM6qLt4OsuzahCeGgmzCTWxBWOSApvt8snfMAk1CVAuwt8id+WBGg738TEPEZvCiQ
         RMxwjWSbT1QVPsQjvbvUtiue9OVButA+FHT2bzWhFz1xZuyqbqUnlW9kzkQYg9kRM1Nx
         XluA==
X-Forwarded-Encrypted: i=1; AJvYcCXKDInbj6Dd+i/42XUCZPdJHPma2i0pfjUxXD2waaAfMpR25XcStpNQhqaC3VkTMIhseQUPRJocsIJQXgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDpzJKv68HjeesOr5pHzgmjs9IqKZ4bndbGF3xW2wjwKbg1yrF
	GwYOFRAt699IszvD1eu8p3TnBkIxeaTa5i5bVIibhfj32W8de4oarKHmUg==
X-Gm-Gg: ASbGncs0is+To4ZdbqXWQhjh6m+rZmSUlWQWUWuTvTyCwUfavJkRVJPTUv1lZX97aj7
	ya4s38f0TYBfmBVcEMCv9RN4mH+4F4y0ySxkeAJjeE5dLVLoJdWPfpgotxCj0YI0+uevqltwMb1
	CTsW7zTAz8mgi7/8uu6UuID3hT90BVjpniIc74YL+wRjEjyPweagVDkVmcyQH7CIv/xGDeSnpR2
	Iq4+4rjjFiWpPSIZkxS4RULDibziEP/UKkV2m8vKBWGxpLYl9t5HzMie2ECZZ+DDtsFpR6ikFfg
	/8jjFb7ilUabse80xyhJ70o=
X-Google-Smtp-Source: AGHT+IGI/mTMXOlT4DWnxbUzFAN8KqEmmsHfZSIbG4psMMHIpc+UZjaHsNGjZ4PKChsyvJVmTmbBVA==
X-Received: by 2002:a05:6902:1ac9:b0:e58:1112:c3e6 with SMTP id 3f1490d57ef6-e58a4a9c707mr17783643276.2.1738607253482;
        Mon, 03 Feb 2025 10:27:33 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:33 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 06/14] platform/x86: alienware-wmi: Refactor thermal control methods
Date: Mon,  3 Feb 2025 13:27:05 -0500
Message-ID: <20250203182713.27446-7-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203182713.27446-1-kuurtb@gmail.com>
References: <20250203182713.27446-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor thermal control methods to use alienware_wmi_command() instead
of alienware_wmax_command().

Drop alienware_wmax_command() as there is no more users left.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 87 ++++++++---------------
 1 file changed, 30 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 412caf0e3b84..d94690e50ecb 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -676,34 +676,6 @@ static enum led_brightness global_led_get(struct led_classdev *led_cdev)
 	return priv->global_brightness;
 }
 
-static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
-					  u32 command, u32 *out_data)
-{
-	acpi_status status;
-	union acpi_object *obj;
-	struct acpi_buffer input;
-	struct acpi_buffer output;
-
-	input.length = in_size;
-	input.pointer = in_args;
-	if (out_data) {
-		output.length = ACPI_ALLOCATE_BUFFER;
-		output.pointer = NULL;
-		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
-					     command, &input, &output);
-		if (ACPI_SUCCESS(status)) {
-			obj = (union acpi_object *)output.pointer;
-			if (obj && obj->type == ACPI_TYPE_INTEGER)
-				*out_data = (u32)obj->integer.value;
-		}
-		kfree(output.pointer);
-	} else {
-		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
-					     command, &input, NULL);
-	}
-	return status;
-}
-
 /*
  *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
  *	It can toggle between standard system GPU output and HDMI input.
@@ -949,7 +921,8 @@ static bool is_wmax_thermal_code(u32 code)
 	return false;
 }
 
-static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
+static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
+				    u8 arg, u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -957,14 +930,12 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	acpi_status status;
-
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_THERMAL_INFORMATION,
-					out_data);
+	int ret;
 
-	if (ACPI_FAILURE(status))
-		return -EIO;
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
+				    &in_args, sizeof(in_args), out_data);
+	if (ret < 0)
+		return ret;
 
 	if (*out_data == WMAX_FAILURE_CODE)
 		return -EBADRQC;
@@ -972,7 +943,7 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 	return 0;
 }
 
-static int wmax_thermal_control(u8 profile)
+static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
 {
 	struct wmax_u32_args in_args = {
 		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
@@ -980,15 +951,13 @@ static int wmax_thermal_control(u8 profile)
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	acpi_status status;
 	u32 out_data;
+	int ret;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_THERMAL_CONTROL,
-					&out_data);
-
-	if (ACPI_FAILURE(status))
-		return -EIO;
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
+				    &in_args, sizeof(in_args), &out_data);
+	if (ret)
+		return ret;
 
 	if (out_data == WMAX_FAILURE_CODE)
 		return -EBADRQC;
@@ -996,7 +965,8 @@ static int wmax_thermal_control(u8 profile)
 	return 0;
 }
 
-static int wmax_game_shift_status(u8 operation, u32 *out_data)
+static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -1004,14 +974,13 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	acpi_status status;
+	int ret;
 
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_GAME_SHIFT_STATUS,
-					out_data);
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
+				    &in_args, sizeof(in_args), out_data);
 
-	if (ACPI_FAILURE(status))
-		return -EIO;
+	if (ret < 0)
+		return ret;
 
 	if (*out_data == WMAX_FAILURE_CODE)
 		return -EOPNOTSUPP;
@@ -1022,10 +991,11 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
 static int thermal_profile_get(struct device *dev,
 			       enum platform_profile_option *profile)
 {
+	struct awcc_priv *priv = dev_get_drvdata(dev);
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_CURRENT_PROFILE,
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_PROFILE,
 				       0, &out_data);
 
 	if (ret < 0)
@@ -1054,7 +1024,8 @@ static int thermal_profile_set(struct device *dev,
 		u32 gmode_status;
 		int ret;
 
-		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
 					     &gmode_status);
 
 		if (ret < 0)
@@ -1062,7 +1033,8 @@ static int thermal_profile_set(struct device *dev,
 
 		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
 		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
 						     &gmode_status);
 
 			if (ret < 0)
@@ -1070,7 +1042,8 @@ static int thermal_profile_set(struct device *dev,
 		}
 	}
 
-	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
 }
 
 static int thermal_profile_probe(void *drvdata, unsigned long *choices)
@@ -1083,7 +1056,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
 	if (ret < 0)
 		return ret;
@@ -1091,7 +1064,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
+		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
 					       i + first_mode, &out_data);
 
 		if (ret == -EIO)
-- 
2.48.1

