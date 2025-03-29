Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197861C4609;
	Sat, 29 Mar 2025 07:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233583; cv=none; b=gJJWFuge+IG1qqsqkcUZ74nCljwtXsTMmq8l6t/HTJXGmYlMGOxkgBeZoIPRBA4/6ULOVFwWla/arQQWiH4DKWoSTWpgOg5t/lHlD49jU6M3N9+WcBFibNi5XEJkB4FZf7zyKL6KvZXN6NCMWrwErhnsSLRhJLOqDb20QZMBdQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233583; c=relaxed/simple;
	bh=ATkgHyh6kAu1cPNPrpR84y8/RB4MmJZ/qDOHMtR/6Uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehKNoylzER+MrXeKG9k6rr+saKK6mLWM3XQrrP1N3J6a6TtOQ9+Rf6OnXcY2iJga7j7HnDjHGQVpkNVRwTVidLNwX1B4526wiKkeDhf0lJjF5CqLijCE26efaeW1MO7Kk+09/wdHnqf+wuTBerMkfla/v8LrRAGtxnOamUTWoi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQYombgT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQYombgT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2243803b776so26570865ad.0;
        Sat, 29 Mar 2025 00:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233581; x=1743838381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X94Wn4jXJlBDIK6nkAvx3Ra3AzwCgwminFT7JbpZY1U=;
        b=cQYombgTCps9q19kPCly7zn1bCY+yazxu/Vh6vU2HInb4SnbLHzh4lBfdk3IULKDg3
         qyBTXxYBLRs+Q0IWuOU9U2yZ79WNXWx0BjrFRdeELpIUiiSPKSxTZX4phWhXme+bmVQJ
         Ut4UcxzHZa43fQ/43AIgK5ddv3Bjwg4mvQF/2GrOXBiix50Ixh4+HnA04AG4eYqCLNoY
         x9c85LQDHfr6n1ainW3gKAN0GAGyjs7/VHMzFstcVEO4nF41Gj3lnGOk4PyvTkPOB5E2
         HAaLEfVJc5QnydT+hXAfNtr/nAr6EV7h0opXzKOUT04hjdMbsG8gye+Vy1q2xEVpHcVv
         LvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233581; x=1743838381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X94Wn4jXJlBDIK6nkAvx3Ra3AzwCgwminFT7JbpZY1U=;
        b=qq49Crw3mqo/pu0TfaIXeNGbyn330RhoRwvczLE6DnuuZUpWqPEckMFJJt7o4aXwO5
         YPzZl7z65akhdJ467cwthZ3VZgAz4MTw6GVwgMUoMiYD/1j7X+wlZacBrlqXY6bzFOlk
         oqYHEFBOgtFMW/8BjQ5sgLgq8I95U6KjBsbZVAzdYuAYUmkJgpXjDuQL779vhfNj4jcY
         pqAEnVDctepgzJb/nW4ZHL3NyX3K4mRQ632rtZ4Gmg7PtpEmARLi6NYvaciD5Dy1U08K
         pRZtUnoqheyPRBdvFbOlTsojNazN69v9BIgr6GCdfUKuEVW4y0nARKp20Nb+yRlDDzIu
         U2/A==
X-Forwarded-Encrypted: i=1; AJvYcCVqpcsLnnkNayNZVay3jCrSHK1n+c4zB/QLmJ4AS3dBg/XPSe1Eedr61hgGUyVYyHzvLKEA7wWgApBE4+0=@vger.kernel.org, AJvYcCXnfpYJQUJim8sNzxhHk9QpO5M/MHc/F5JIBvwsIz18ZZOC8SfT3zHdk88whZyCXvo8VPbiJ2RKsWkRGS9i11w/frqp6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7YkFrC706CY1oiV3SMEAp4LpaEqRJekYGlC+cgrv4ig5VK6H
	jBaoFBbSDp7+wcU4mHNck2pWhz+9CfoOnHcrGa7sei4ID91+VF23
X-Gm-Gg: ASbGncvVkY+DoSTe3BTnDv8N2pWrmKS15sGDuu+VaL3DEfHUpBwzFVyEDMcBMfZwcvW
	DJFqGTYcQsPjStKHx0/6HYVUOZ6H+ivaXVDJY1xBMfTj85ea4COVbKjHOXTNNeGV2/weMCfHlXJ
	TVoBY+lvGHOWKCHlaqG4A5vP2lq50C6pqMgVZ890q5RNmnaEByja00vy3jXM9glF2bicgAjHSVb
	QYxd0k8GnfbtJW+GpyQmLsassHxgiyIsno/WJNufAd7pB+rZgyBu7W1SLpvLGNMBqcJD2WTvqIG
	FDkPoAUepECP3qrRPKGSRMTFvgvKEd0jgamdHKX3/nfX
X-Google-Smtp-Source: AGHT+IGVJSPSkxnymoT1GsBYRA7J0h38PJ/kLxumqSXjvLhNKKTQvpqtx4xjjHOPyQS0/naSEE4bVg==
X-Received: by 2002:a17:902:daca:b0:223:6180:1bea with SMTP id d9443c01a7336-2292f9e601emr28261305ad.37.1743233581261;
        Sat, 29 Mar 2025 00:33:01 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:01 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:19 -0300
Subject: [PATCH v7 02/12] platform/x86: alienware-wmi-wmax: Improve ID
 processing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250329-hwm-v7-2-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Rename AWCC_SENSOR_ID_MASK to AWCC_SENSOR_ID_FLAG and reorder the ID
processing defines in a more logical manner. Then replace their use in
bitwise operations with FIELD_GET().

The latter also involves dropping the AWCC_SENSOR_ID_FLAG check inside
is_awcc_thermal_mode() in favor of extracting the first byte out of IDs
obtained with AWCC_OP_GET_RESOURCE_ID. This is also a requirement to add
support for Alienware Aurora desktops.

While at it, also rename is_awcc_thermal_mode() to
is_awcc_thermal_profile_id().

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 38 ++++++++++++++------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index ed70e12d73d7fe5d89f3364c5367820bf47e3c1e..66755ff21933297568a5262726c05bc60fef56db 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -32,9 +32,11 @@
 #define AWCC_THERMAL_MODE_GMODE			0xAB
 
 #define AWCC_FAILURE_CODE			0xFFFFFFFF
-#define AWCC_THERMAL_TABLE_MASK			GENMASK(7, 4)
+
+#define AWCC_SENSOR_ID_FLAG			BIT(8)
 #define AWCC_THERMAL_MODE_MASK			GENMASK(3, 0)
-#define AWCC_SENSOR_ID_MASK			BIT(8)
+#define AWCC_THERMAL_TABLE_MASK			GENMASK(7, 4)
+#define AWCC_RESOURCE_ID_MASK			GENMASK(7, 0)
 
 static bool force_platform_profile;
 module_param_unsafe(force_platform_profile, bool, 0);
@@ -168,8 +170,8 @@ enum AWCC_GAME_SHIFT_STATUS_OPERATIONS {
 };
 
 enum AWCC_THERMAL_TABLES {
-	AWCC_THERMAL_TABLE_LEGACY		= 0x90,
-	AWCC_THERMAL_TABLE_USTT			= 0xA0,
+	AWCC_THERMAL_TABLE_LEGACY		= 0x9,
+	AWCC_THERMAL_TABLE_USTT			= 0xA,
 };
 
 enum awcc_thermal_profile {
@@ -445,20 +447,18 @@ const struct attribute_group wmax_deepsleep_attribute_group = {
  * Thermal Profile control
  *  - Provides thermal profile control through the Platform Profile API
  */
-static bool is_awcc_thermal_mode(u32 code)
+static bool is_awcc_thermal_profile_id(u8 code)
 {
-	if (code & AWCC_SENSOR_ID_MASK)
+	u8 table = FIELD_GET(AWCC_THERMAL_TABLE_MASK, code);
+	u8 mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, code);
+
+	if (mode >= AWCC_PROFILE_LAST)
 		return false;
 
-	if ((code & AWCC_THERMAL_MODE_MASK) >= AWCC_PROFILE_LAST)
-		return false;
-
-	if ((code & AWCC_THERMAL_TABLE_MASK) == AWCC_THERMAL_TABLE_LEGACY &&
-	    (code & AWCC_THERMAL_MODE_MASK) >= AWCC_PROFILE_LEGACY_QUIET)
+	if (table == AWCC_THERMAL_TABLE_LEGACY && mode >= AWCC_PROFILE_LEGACY_QUIET)
 		return true;
 
-	if ((code & AWCC_THERMAL_TABLE_MASK) == AWCC_THERMAL_TABLE_USTT &&
-	    (code & AWCC_THERMAL_MODE_MASK) <= AWCC_PROFILE_USTT_LOW_POWER)
+	if (table == AWCC_THERMAL_TABLE_USTT && mode <= AWCC_PROFILE_USTT_LOW_POWER)
 		return true;
 
 	return false;
@@ -548,10 +548,10 @@ static int awcc_platform_profile_get(struct device *dev,
 		return 0;
 	}
 
-	if (!is_awcc_thermal_mode(out_data))
+	if (!is_awcc_thermal_profile_id(out_data))
 		return -ENODATA;
 
-	out_data &= AWCC_THERMAL_MODE_MASK;
+	out_data = FIELD_GET(AWCC_THERMAL_MODE_MASK, out_data);
 	*profile = awcc_mode_to_platform_profile[out_data];
 
 	return 0;
@@ -597,6 +597,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 	u32 first_mode;
 	u32 out_data;
 	int ret;
+	u8 id;
 
 	ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
@@ -615,12 +616,13 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 		if (ret == -EBADRQC)
 			break;
 
-		if (!is_awcc_thermal_mode(out_data))
+		id = FIELD_GET(AWCC_RESOURCE_ID_MASK, out_data);
+		if (!is_awcc_thermal_profile_id(id))
 			continue;
 
-		mode = out_data & AWCC_THERMAL_MODE_MASK;
+		mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
 		profile = awcc_mode_to_platform_profile[mode];
-		priv->supported_thermal_profiles[profile] = out_data;
+		priv->supported_thermal_profiles[profile] = id;
 
 		set_bit(profile, choices);
 	}

-- 
2.49.0

