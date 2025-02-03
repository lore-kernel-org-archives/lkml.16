Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BDB1E98FE;
	Mon,  3 Feb 2025 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563789; cv=none; b=Mz5qw7M43dh5pnKNAwnZvqtOeMYKXC+WWQYhAebjDikXZ1qxWagJdo9QP1rFRZdZQuXCtQJ54c94ZDqArUru/FRfX0jK9opvfCWFvL/dXw87aI8KNmHnX0vBrwgkMO8Y0UOrN6Gx3ONXBpLRVE954t4+xrpusUP9T/iNTSlltWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563789; c=relaxed/simple;
	bh=IdcpjdsJDaq1jFspJKftwTEFIZaSoGxu0KtQxVgCGFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YHAXvzKe7xluX/hVb3609x3wdTl4JZSdr/8UszqUEVM9MTSZjSJaPeV7aHbzYUWBJO86SUdmj1no8qEEq1P2rYp4WnRm/FU2QYJVtNWKcpEwvOaUIEmERxcpGkrmpYiAycHRTdyjQB0z5BYz9v8py66D/gWNAKZAw4m+e6NYm4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONJLM5YM; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONJLM5YM"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85bad9e0214so1805712241.3;
        Sun, 02 Feb 2025 22:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563786; x=1739168586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQq4nmqKcIUI1Qy21JPqGpG0SxeT5xGS5MBZ52udNtY=;
        b=ONJLM5YM23uXLgbIUW3WmiSPRSVyb275KT69rWn3HB9wVBtr4hWHfaUU46vIHrhhjs
         0366MUfGW9KNjIr8MROlKGEc5McipZfo5EDMMn53gCWFwWH/3Mr35y6CS96O8VJUjwfl
         voP9R95wMVhpFOaVWLnO1glacXQk8uqsUhq4JzKyenCRi/DdMeteiNBpEs4pgdHDg4Nd
         xmffWrUFxmEqkfsJJr0nY2UmXuQYAafemNN4zRBlWJrq3aGWHodH5fePgwpknbVeOQ8U
         eBxvlxLEF347hZFs4CdliB/Bwkk0M6sEPTr1wjPTbp528aqlsRCVvkRKoT+owtMrLbYV
         AJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563786; x=1739168586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQq4nmqKcIUI1Qy21JPqGpG0SxeT5xGS5MBZ52udNtY=;
        b=gqBJ4p4lRvCSWZeVKhJ1lFJRnTplffoByF0bp9DQJXvvCSl+kpvSVR3xogxinVBVfm
         EM35XLtLYDMOx2o0OIKLgGl1ONSHqW2AMsKuZlLIhJpeiXfbNNPQLdT5QSlwnwTIfM5T
         oQnJySXXrvxLPqlSUHKGI474xoy7q9p2ANnUF8KM2mUK1HbIKG8o4Ob+7sZlIrX9+jNb
         HNGu2jZzSBC1lD3kvL0+mQXlQ3su8TreKtAGoJ12NyJC69xzfoqUAGeVoExhVJQ9kpWM
         JAmrz5ZG+L45t64JnHud3tZuHY9LwV+B2Wv7XYOKjUCopO8fAkZtCAhyfsbrQU3F3u2a
         53oA==
X-Forwarded-Encrypted: i=1; AJvYcCVRYfbadnsOmPAEBILbug1X3Uxw+DACb9UdGklJMiSUuj2yQDRRCe6aX7ZzLlEd9BXx7tLhzl6ylCf/0Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd5Eol8tYPEN2lnrNi1/lZGZyH/jb1gZDsFVadtAl/IJ0gM3/G
	TUWKRJs+LmoYXz/ysKRDDn0YbM49zQZScxhEFIrzfbqfwVTMR5SVnzkcVg==
X-Gm-Gg: ASbGncuAwhBs01G+lzfPtDZBh0ZskRrn2xTAWuVmGJboptrdqN+rpGd63knd8kEu+Hm
	Ce8+u9aeVFbTGwQGuhp/WP5516SN9xUaTRLGenPVP9wi57kwQvG3W/Jb43Navg9JZTTj3qj9a01
	D7hWjaGMrsw2bYiVROsjiUcVr61LqX66eiSp4c4MIBQO8xmbFCfg+wIOOE1hLJpB9AJw4MAAZD/
	Qdvya5/JTZeFZ9QOEYMsUp/KBan0Zk9K6CqdTSqWM2Z0Uthf8TLJhsxeEiG1ygOF27MOo0JuEwn
	yVCYy93SUvLPd1xmKiUJMSo=
X-Google-Smtp-Source: AGHT+IEPWxZicq+HqQ21/658DYPM/eq7yImkKY+GRXEjbInofXyNg0DCS7dJDNCr3PgglwdIo4oHyg==
X-Received: by 2002:a05:6122:3212:b0:50d:6a43:d525 with SMTP id 71dfb90a1353d-51e9e30c2b7mr13068445e0c.1.1738563785794;
        Sun, 02 Feb 2025 22:23:05 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:05 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 06/14] platform/x86: alienware-wmi: Refactor thermal control methods
Date: Mon,  3 Feb 2025 01:20:47 -0500
Message-ID: <20250203062055.2915-7-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203062055.2915-1-kuurtb@gmail.com>
References: <20250203062055.2915-1-kuurtb@gmail.com>
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
index a219d68ff84e..e63f232dab80 100644
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

