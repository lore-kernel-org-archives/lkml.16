Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3D525949C;
	Fri,  7 Feb 2025 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943223; cv=none; b=KxVXjJu8ozVgbuH6ewNbVroSR/skSqFaU62woFdJ3v9rqwbNVbthiQ3HxjDW4lPZveDgNazZwOJRwnmRtjA6oNBP6+bmpD+COsN7OaVxUwwK3UE5WbeanXpazqKB6fNpQ7QZrOhESYshspvXuZ+SVDzsrDdxrbobcuAIT5WLU7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943223; c=relaxed/simple;
	bh=iLplJqGOUWH2yC/l1CaxhcXFjVrg8V0rQaqfGwOIqnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reGSVq7ijLf50cPtK/XTcXq42pjyw6euypf4KzJB3dCu4H3MV2aaMM+SmupIv2owyxGMXIvCBBkzLoHpQihVcRoBufcEgzywhvlctMxRQldVVWtyRhus9/4UZYJHY1JvjSVB5CIRsGZTxAMlA5S9SB3fmRBUhG4qqllKW6A+WAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6yq6sQx; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6yq6sQx"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4ba00b6821aso603809137.2;
        Fri, 07 Feb 2025 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943220; x=1739548020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwdRGSFgj7FqI1tYvmFFNT3wx7x6pU35t6rwqkf283A=;
        b=R6yq6sQxSL+drIxmSQ1R+1HIk+Zcn1dDWsHZvKw8dnlaV+KFkFrrGv8yBADLXvMogC
         3grqsDKtZ6lZCr6XeqNNhENLunGcOdFcPd8+M7sHcrOoX3QEY4vcZZ18AAgIt7qkIrwo
         WJligN9NXz1MNiX0+Y8uj2SX5ROwgDqrDoikGdc7noStQm4CoRLPROCEE3x6fQFbO1N5
         /XzM83I0KMhszl/Uy9R387HCa79USFyRSZOgCuQvf2h5TYjksbRH9w55BL7W24dJ/jWG
         9h9NUKDsbQxFbB90H1NcG12UAwQ+o3c+m0r7iXRhbXgN2FM61i7QT6PW9MhZ24pLuQS6
         eyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943220; x=1739548020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwdRGSFgj7FqI1tYvmFFNT3wx7x6pU35t6rwqkf283A=;
        b=vzR73w5fBLyybqmqSe237Dmxxadkty6/TtAOJa5kHtOkKXVDbvs+VMqTYepgLHljO6
         rtEt/hsKYRc1550hKKSjVmy0tpef/TP9KdajXmFEiY5n1h0oASK5P3O4fzCYh30uc03q
         wx21S3gvds/hXk1RlPuucm0A9Y9L6I0cCiIcVoTJZ73zE46eFStJpKyhB4fJUnWJLhEx
         tQIWmIMGGTI5pbdWmEVKMwx8C5/8uAp4NU/Fz8HqLPmqvJjyVfl3VfH+7CKpPOF9vXpZ
         vLp4bHSaOEwQ9wV+/laQDT037ggdZK+uxn+296s0SkUKZ1sWi5IBw8rjMBUsLWy1IJWV
         Ihlw==
X-Forwarded-Encrypted: i=1; AJvYcCUFukh+1SolGUSfKH14XxgKu+kVI1uXX/+RR8xvG0mzZ0rjbsdcQnOEiP5o7yttEg66nBCtx2SAB/WDBAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmeSxFSvl9zXvftjgZRd6mcZOqN3Mgx6N5Crr8NvdV2/CHyOMU
	EGF5jcmd/GhznOoGQkiOUDZinUbPIUf5Jj8VXmCwxNWkiu7XPoIfUBtdZg==
X-Gm-Gg: ASbGnctvcuJJSCd9tldFtLcneQA5enaTNnrD5VhKQayV7laX7ncECguLl2xJsbJHvsS
	SNhqg4v38YFnGQdRXMLx57c42AF7OPY5/LAg4zDCRiYfdVYlJp9i0AR9Fn5HAnOH0wE/yOuLCSz
	cokHQsf7U/ErZhXhZ+JG4YTFbtAOgkIoWeW5ki+e+uDXCcYVtFbB8kKFkdp12NP3mbrbzlPpmK7
	LnoQqgw7Mp2hklDevp06fe9PsJX4a938Vg/EFej9TANsqlKsR4C/N/gPeCgzERNDebRhKJV0Hoa
	xIr3+Oqm88nLfX2dbzzePI4=
X-Google-Smtp-Source: AGHT+IE8d9Abb2BQ19iV1I8ZqIv6LjHmj4QajnSK3jxdcdiUHwQcTJxX3Geq0z2BO2awthH+CLocAw==
X-Received: by 2002:a05:6102:3ed4:b0:4b2:7446:fc18 with SMTP id ada2fe7eead31-4ba85f063b1mr2830352137.17.1738943220607;
        Fri, 07 Feb 2025 07:47:00 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:46:59 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 06/14] platform/x86: alienware-wmi: Refactor thermal control methods
Date: Fri,  7 Feb 2025 10:46:02 -0500
Message-ID: <20250207154610.13675-7-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207154610.13675-1-kuurtb@gmail.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
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

