Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2890E1A2543;
	Sat,  8 Feb 2025 05:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991818; cv=none; b=lErj632GLwaVbZmzhq1DCrCoKlOwGdC4Md98XXrgXzpPztTxoUHOLWI8Owgm6OXKP6hPtN3kej83RcnJSehF6gAYcrK4DqeCEciCVFH6YQtKG1fd9mnHX3jaPtDaQVw/wr6ZDbK0CPI7ZuVV5T3TFpYLywGTg4QAEnbG8m+BEzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991818; c=relaxed/simple;
	bh=rFO1Ir2kxvm4ytz3DRnBwxmehRM/X9eIKqxxVfduUS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdnMJM+rZVOb2RquQUikuxacvGAOCkGeiEqdKKsS2csttBl1iNA80uGrKmisWl+HqdjB8UyyQyk94KAy5+yPlb4orh0UP4ZjpwwZhCpKr0XPACJVwrje5sBnLb4BPQnqPSyTuxWlMqc4AXgcyv4/7AlJpWHZZI17aKA1Q6YrnIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqB2igEs; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqB2igEs"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5b22d35268so2563346276.3;
        Fri, 07 Feb 2025 21:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738991816; x=1739596616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziKlG74+FykDx2qVs72IwbcctC+93P49F74KIGbxq/I=;
        b=CqB2igEsKK3Iebr2whgYAPo6tbdrgT/q+QewkkiTRKEB5lyzuT1ILRck40rycDVHEP
         KmRklhW/3m7Hgn0V7e7sbdiKQqVUL2YADYPNDts3ladYEWdauT13zykcXNj83B3Nct+r
         psVqDmwkbxxgLTbM/V1NVz2RP4m/sJteGXwzeiO9IZmNn0arnoI5mN/fwiMvtxL0QBCp
         j0mLyZRcqrGN/h7DuxViVj5KxVSdhnci7/8ifYxbuCNCiDT9r3qnBRNA0ELUurq7Coa3
         Q7p+ezmUncCZwu0UOIw8SLR8jhyarFLCyHBgPI8OvCNYOrPjUseaKd9FSEQBL8J8/VQB
         /1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991816; x=1739596616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziKlG74+FykDx2qVs72IwbcctC+93P49F74KIGbxq/I=;
        b=H3JixrQ4YXFCi2Xdyb92FMGw5tFGDC4P+/pLnm9XO6EJ3Sb4rRfz7smFWFyOb0pY0J
         XIcrZyBiwbQ7uDHT67zg3AeL9FjAK0w1l9wEZycveq7vb1hAbdh3y2bAH6UiGO6HFrfi
         7Ipu5ukaoZVMwLw3ah4Ebbo7H11UQ4SvzObrpruPY6msbKe/G275ydHwJaJPnhCW/nep
         euJOP6q/5IrgiSNYp7zai+Adn3HPOYfZsN9XdUJPqWYwWteApyP/n7ksN6Z9kDQ41Q77
         N10enpi0z3AkBDuOpg9TkmnjAGLUB4E8hetXG1MFv3knQXwpuDR7gAo8tvmHV2TVN2kw
         iAJg==
X-Forwarded-Encrypted: i=1; AJvYcCWZj3MJvnGfcB7N4KBDyUVEQlMLZe7iMZvZVe8fOXAkUt20/PHmI/gcKblRw9EfL/ZL+2lGZNrV7RSBdKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvLOWOyWY7MgjpdNavs74Ub95SkENrUdGLgP3+CL1hfwOs0uC
	akQdfDRJuxYim8VsL6v9XRbcj7RnBfZdbkf547K8K7+hb6liN0QT
X-Gm-Gg: ASbGncuz8BcQ0fhdXIPVOVwf5d3Ni9BRYOljOIj4ssTU6EppqPt8uz1UGtIbfkdoA6q
	j4DNnjT8BG+Of2ZnqF/LArKRpKcUVARRVrZoP4LCeJDVbUAKSdrugKQLpm17xOiFzDrIsScdXu0
	lyLQsY4QYGH4zvpTCZ7ighjaPeR5ajj+4xTpyAcmztwLrG42OgKIxtdMt/77VaICnSyejZSCt5Z
	CCIC7RFZ9SKM9z+cstSoe3EQ191Wjloi21l+dXS6BZDdgwKr3JS+Hf9EcCxewhH4FXI964hsKnv
	FGWZFs44mN3qTktxcUENgXU=
X-Google-Smtp-Source: AGHT+IE8Fx8YRBAVDg371LAxr4DfqFtRvNYV8dsAeJXPCUKQaTkChI9lKBZ2U8CLL2jtI469zEdNzA==
X-Received: by 2002:a05:6902:2101:b0:e58:341d:50d6 with SMTP id 3f1490d57ef6-e5b4628600bmr4910120276.35.1738991815985;
        Fri, 07 Feb 2025 21:16:55 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f00e0sm1207670276.2.2025.02.07.21.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:16:55 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 02/10] platform/x86: alienware-wmi-wmax: Refactor is_awcc_thermal_mode()
Date: Sat,  8 Feb 2025 00:16:06 -0500
Message-ID: <20250208051614.10644-3-kuurtb@gmail.com>
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

Refactor is_awcc_thermal_mode() to use FIELD_GET() instead of bitwise
operations. Drop the check for BIT(8) sensor flag and rename it to
is_awcc_thermal_profile_id().

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../platform/x86/dell/alienware-wmi-wmax.c    | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index ed70e12d73d7..7f0aa88221d6 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -34,7 +34,7 @@
 #define AWCC_FAILURE_CODE			0xFFFFFFFF
 #define AWCC_THERMAL_TABLE_MASK			GENMASK(7, 4)
 #define AWCC_THERMAL_MODE_MASK			GENMASK(3, 0)
-#define AWCC_SENSOR_ID_MASK			BIT(8)
+#define AWCC_RESOURCE_ID_MASK			GENMASK(7, 0)
 
 static bool force_platform_profile;
 module_param_unsafe(force_platform_profile, bool, 0);
@@ -168,8 +168,8 @@ enum AWCC_GAME_SHIFT_STATUS_OPERATIONS {
 };
 
 enum AWCC_THERMAL_TABLES {
-	AWCC_THERMAL_TABLE_LEGACY		= 0x90,
-	AWCC_THERMAL_TABLE_USTT			= 0xA0,
+	AWCC_THERMAL_TABLE_LEGACY		= 0x9,
+	AWCC_THERMAL_TABLE_USTT			= 0xA,
 };
 
 enum awcc_thermal_profile {
@@ -445,20 +445,18 @@ const struct attribute_group wmax_deepsleep_attribute_group = {
  * Thermal Profile control
  *  - Provides thermal profile control through the Platform Profile API
  */
-static bool is_awcc_thermal_mode(u32 code)
+static bool is_awcc_thermal_profile_id(u8 code)
 {
-	if (code & AWCC_SENSOR_ID_MASK)
-		return false;
+	u8 table = FIELD_GET(AWCC_THERMAL_TABLE_MASK, code);
+	u8 mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, code);
 
-	if ((code & AWCC_THERMAL_MODE_MASK) >= AWCC_PROFILE_LAST)
+	if (mode >= AWCC_PROFILE_LAST)
 		return false;
 
-	if ((code & AWCC_THERMAL_TABLE_MASK) == AWCC_THERMAL_TABLE_LEGACY &&
-	    (code & AWCC_THERMAL_MODE_MASK) >= AWCC_PROFILE_LEGACY_QUIET)
+	if (table == AWCC_THERMAL_TABLE_LEGACY && mode >= AWCC_PROFILE_LEGACY_QUIET)
 		return true;
 
-	if ((code & AWCC_THERMAL_TABLE_MASK) == AWCC_THERMAL_TABLE_USTT &&
-	    (code & AWCC_THERMAL_MODE_MASK) <= AWCC_PROFILE_USTT_LOW_POWER)
+	if (table == AWCC_THERMAL_TABLE_USTT && mode <= AWCC_PROFILE_USTT_LOW_POWER)
 		return true;
 
 	return false;
@@ -548,7 +546,7 @@ static int awcc_platform_profile_get(struct device *dev,
 		return 0;
 	}
 
-	if (!is_awcc_thermal_mode(out_data))
+	if (!is_awcc_thermal_profile_id(out_data))
 		return -ENODATA;
 
 	out_data &= AWCC_THERMAL_MODE_MASK;
@@ -597,6 +595,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 	u32 first_mode;
 	u32 out_data;
 	int ret;
+	u8 id;
 
 	ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
@@ -615,12 +614,14 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 		if (ret == -EBADRQC)
 			break;
 
-		if (!is_awcc_thermal_mode(out_data))
+		/* Some IDs have a BIT(8) flag that should be ignored */
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
2.48.1

