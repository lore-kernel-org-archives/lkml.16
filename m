Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE8221DA6;
	Fri,  7 Feb 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937301; cv=none; b=GjdP2S2uEtqsZFFQjsUWwOSZ2O+BIChA44WfL3+IigBeFdqiG5a5N8FHaqx8o31INHMH4Kqm9nPehuQ4MCrdDulMDG+irqiOn+CzROwCzW/7N+Tszz0vJJcvv1gTpfH4eAxhNC/VFDGHUnfAIZ2uNPlRyM8Az/tFKQQMlYhmIoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937301; c=relaxed/simple;
	bh=iLplJqGOUWH2yC/l1CaxhcXFjVrg8V0rQaqfGwOIqnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5UlU306OobalDSlGO69DTySfXiGtLsYJ5IWGw3O60L57wgoRhb9d0m2SpClmrcABpYUzuhqgcqD6LiFZa/hO8R5yNmPR2QeWvOIgvDHZoLoJEr/NHAp450s5bRJFTQRLn4UjSSmfMy39RFNDaB18ou1ZMbUclTIU+MUEnIfECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPZYXgA9; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPZYXgA9"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6efe4324f96so18970987b3.1;
        Fri, 07 Feb 2025 06:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937298; x=1739542098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwdRGSFgj7FqI1tYvmFFNT3wx7x6pU35t6rwqkf283A=;
        b=gPZYXgA9QnlHceXTM87GqX2503l1FeU8a9czRt27pj64L9YF4QMdYc41Qgws0JUtoF
         WQVaSivxlo+xf6iQR2+/WJzFvd3YWPIXmEGGYXPvgKtNiDcZRB7TPOyWuvWdI+wxWNGg
         aDizgR1YX/gqNVP/Y3LNTsn6f/EDMnjH2QzxBblsIvl5onGbv5Fz8gNolbm3ZvDXJLcf
         VjAdJEUuzaoU8dQJ8vMPsEiYWjV8ycm9+Gv1e2CBR5hqtWsP9hUO989zCXrV1ITsSSPe
         1m/icUOSdWU+R6NI9p8DqopALoQbs5KLQf/ga2c5qSohy22u4XkQTi5AyM1KYYFAITPC
         Q5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937298; x=1739542098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwdRGSFgj7FqI1tYvmFFNT3wx7x6pU35t6rwqkf283A=;
        b=BcOCamLgSE/hBqHMJBmcfMSzBSd4qGOAzvw4n3YADzcZafw687U+FZnN13WRZ4fd+r
         2N6n4P8ri5DkiwsCJVYnSBoj6AwZRxVYN1AfW9139sQm07a3GJxqCt6ji9EqlnRLdSrT
         zQnc9APm7jhxrIIM8TE2DnE/IvAXyA26IlV1DCsja43qo4zTKmtNpiDusFM5RG+OLSNR
         uk7u0Yms8gI/RH4zKyHjexDDEDtuQFIJVL+IvRrZ0zPmL3o13XbbGLzN70rvr60ZVxgo
         opm1Xh1KZf+7oVhW6YbOY3O1p/S8pAwG43EgEM5b44fNcMIxkFyqrQzKiPc1kx9rpqNh
         39Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUWPU17jJnEbagoDOFpBzle33KSevwrwVJMh30+P/9eTrG4bjPgiyCIRfPhBfUVKYjzNdF2a7ZYTg9bBBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxruIzl07khuU/VojGT/tHJ5g+iBL8r4cpsQtMuQzDc2iYF4xic
	CuJWe6zT3i1zqr2s5w3mjAVXpOoUt2wGLRxGXrDQEw/HQm/HV+QUR5jqHw==
X-Gm-Gg: ASbGncuhE5a8yx2BfIosi3JnvlVo/dejah6XVguMuA6KzuxFEu2Se7LX5f3bn2ffqJo
	1nZdzwjGpP5Fcw7awvVnTuuli7Ci3a47r9TFqOLamW0sBk4TTQEwQiubYxA8kuXJFkBe9koasNB
	GMqWHmubqwJ9+bhuB7jTi2O6Wts34H2JHi5JWoL+FzITesvvCVtfXCZHfI2dtW+L18YUMlLYCKt
	Aal1FY9lWS0y4336f2sEyZ3DRFKGhTtwGssiFBgCuUeYzEim2jl1O+YVua2Tio9fiBj6upBbPbR
	DGa2EHhOq807JzKYHhAD/ko=
X-Google-Smtp-Source: AGHT+IH5YbJY1m9zEGhFMc3bfFRYAnCBEYDz+OxdTb48LcMqYo/S0s8dQdg5NCj39OA0hGX+/rIAZA==
X-Received: by 2002:a05:690c:4986:b0:6f9:4bb6:eb4e with SMTP id 00721157ae682-6f9b29ead87mr31468997b3.31.1738937297044;
        Fri, 07 Feb 2025 06:08:17 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:16 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 06/14] platform/x86: alienware-wmi: Refactor thermal control methods
Date: Fri,  7 Feb 2025 09:07:35 -0500
Message-ID: <20250207140743.16822-7-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207140743.16822-1-kuurtb@gmail.com>
References: <20250207140743.16822-1-kuurtb@gmail.com>
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
 drivers/platform/x86/dell/alienware-wmi.c | 88 ++++++++---------------
 1 file changed, 30 insertions(+), 58 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 6e12164132a6..04c526f95c2f 100644
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
@@ -943,7 +915,8 @@ static bool is_wmax_thermal_code(u32 code)
 	return false;
 }
 
-static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
+static int wmax_thermal_information(struct wmi_device *wdev, u8 operation,
+				    u8 arg, u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -951,14 +924,12 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
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
@@ -966,7 +937,7 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
 	return 0;
 }
 
-static int wmax_thermal_control(u8 profile)
+static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
 {
 	struct wmax_u32_args in_args = {
 		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
@@ -974,15 +945,13 @@ static int wmax_thermal_control(u8 profile)
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
@@ -990,7 +959,8 @@ static int wmax_thermal_control(u8 profile)
 	return 0;
 }
 
-static int wmax_game_shift_status(u8 operation, u32 *out_data)
+static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
+				  u32 *out_data)
 {
 	struct wmax_u32_args in_args = {
 		.operation = operation,
@@ -998,14 +968,12 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
 		.arg2 = 0,
 		.arg3 = 0,
 	};
-	acpi_status status;
-
-	status = alienware_wmax_command(&in_args, sizeof(in_args),
-					WMAX_METHOD_GAME_SHIFT_STATUS,
-					out_data);
+	int ret;
 
-	if (ACPI_FAILURE(status))
-		return -EIO;
+	ret = alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
+				    &in_args, sizeof(in_args), out_data);
+	if (ret < 0)
+		return ret;
 
 	if (*out_data == WMAX_FAILURE_CODE)
 		return -EOPNOTSUPP;
@@ -1016,10 +984,11 @@ static int wmax_game_shift_status(u8 operation, u32 *out_data)
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
@@ -1048,7 +1017,8 @@ static int thermal_profile_set(struct device *dev,
 		u32 gmode_status;
 		int ret;
 
-		ret = wmax_game_shift_status(WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
+		ret = wmax_game_shift_status(priv->wdev,
+					     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
 					     &gmode_status);
 
 		if (ret < 0)
@@ -1056,7 +1026,8 @@ static int thermal_profile_set(struct device *dev,
 
 		if ((profile == PLATFORM_PROFILE_PERFORMANCE && !gmode_status) ||
 		    (profile != PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
-			ret = wmax_game_shift_status(WMAX_OPERATION_TOGGLE_GAME_SHIFT,
+			ret = wmax_game_shift_status(priv->wdev,
+						     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
 						     &gmode_status);
 
 			if (ret < 0)
@@ -1064,7 +1035,8 @@ static int thermal_profile_set(struct device *dev,
 		}
 	}
 
-	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->wdev,
+				    priv->supported_thermal_profiles[profile]);
 }
 
 static int thermal_profile_probe(void *drvdata, unsigned long *choices)
@@ -1077,7 +1049,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	u32 out_data;
 	int ret;
 
-	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
+	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
 	if (ret < 0)
 		return ret;
@@ -1085,7 +1057,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	first_mode = sys_desc[0] + sys_desc[1];
 
 	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = wmax_thermal_information(WMAX_OPERATION_LIST_IDS,
+		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
 					       i + first_mode, &out_data);
 
 		if (ret == -EIO)
-- 
2.48.1

