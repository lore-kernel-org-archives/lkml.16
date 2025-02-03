Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192120E338;
	Mon,  3 Feb 2025 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607251; cv=none; b=RgFIRZSe+1N3TNq6GqXZoa/zmAMrq9HyNLW5INByuKNwyhpB6ZV/V51vfq9bvCSMiNs1IzdkUES0JpNTpMQnqLvGnX+0BoY/WqwdLdjNTC9q5j1RQ0q4p4fqFbAVe6OTALX8eahY26O+octZVgr+BmOXQEk5TvcscKrR7ffiy8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607251; c=relaxed/simple;
	bh=CQOdNIc583x14fsDOLKm2hyQoPhlC3QadwB4vTCp9Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQaHNMVizsG2mkeYwF8TGFBNd5TY5b3z4jSvbJR7uG3zUyZXpEcv1AUCksHRfneN4CTGE4GEfbSDXtI3IQMQqxf3qpWMos4iYI+nSE5mYdGltAwO4bHaR6MiGvILqrbqpUHYUXroGkBxY+rv/sHcGvn9wlcW83B1UwpezHc4eg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rp3ULpx/; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp3ULpx/"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e39779a268bso4241248276.1;
        Mon, 03 Feb 2025 10:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607248; x=1739212048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eh9MtY8QMee8pu6PHbRVyWPVH4kaZoOf3tRPuu+Pts8=;
        b=Rp3ULpx/iE7VLJhcO8kEM42fjEYLqUyzgcXv9hkkfeL9rppkwpchuBdSVMNiFiyGfO
         Bkpy0b0UNDRnMoi9gNSMh05Ae1TBemOSZF0z1E6XYr2GI65YmJ9qUczl8stQBgbYOTOb
         z1anXUFLFOsuozLgBvbNrvmWeGU1oVkj5dA7oeFI5aXs2pBvvXgGNlBsCstbeOe2gx82
         hYOuD2ndWG4f0nirl4okLtB6Z+zLJ3CYaNpli/iFic89BlkPDifFG5xBe6l1VLG9iEqX
         krYoscKtQLL+KrpNlrcriBHjgGnYhmPe9/F1ZMLC+vpz2d4PcL7vgsx6m+pqlFKRgQvo
         WFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607248; x=1739212048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh9MtY8QMee8pu6PHbRVyWPVH4kaZoOf3tRPuu+Pts8=;
        b=ny67B/fTJtMf2j1cBStZABOgLTCgr5lGYvWkihQC5Vx+4nWCdW/NN9OrIKUMmGXJa/
         wk3pEgXafn2iGaQCfdiONmZ0BMGjEkrZMam1io0ASLTmm8o9Xpec00HgFdS2fkRuB+aC
         MxKUtioaQ1q7bixj1xA5LeYePvEnobgwEzYgJkWGLg4f44Q4UN5kziD4QRGgG3+zAwpE
         OOr54ieHKHownsoFteJkhXCXSzvfmK+sJ2XJg5r1qMgcI8da78V6zJdxhs9wcuwb3ODM
         hwMEC2kFH2PP4k3C5tqGuDvNqMxogZAF6SF1rBk6UsMSnzVNOgr2NXUXg5+oYmCfgfDP
         K7pg==
X-Forwarded-Encrypted: i=1; AJvYcCX4QCGr597XpnIJXePdAAzCMZTId7TP10m1Q/TIUuBqNxZBm8qTIdtkJxnyFfNJ2Tai0yCGIgYB82NNvCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx26AVw3y9NPV7FX1A8s8vZ5zgbh/mUcq6l7f2mhxDP7FyzbJ3n
	aSZs4jNPw7LSMzGoIiQ9jXD8/dBSbCXd8GXRQn8NuZ/S1tfsTRWZzc6NWA==
X-Gm-Gg: ASbGncuZxsDsNVHc7Pl0V/fo7zSS3WGV+QzCuprHXv3GM+eyAJYpRIL9OsmFj5Eqd9P
	jTQf6jlTbGZostMK7r6RUW8GWJPZVBE3w0mnFNrnaIbAvdi3gdPDrMTLVX81MJ4vxjhDKh9jelh
	iWJORuwkzCilsGYIqFSY7ls5yrwaKt4bddkhhKH6l1ngXTf+P5fv2XmdtKdDA6isPtAOexLJzTv
	iBrF4DUCskYOybq0iUZJGppkjSyEGO5B6T7o0Vdl6ZBDdpNmDQ38rnj8rVj49OMduFqxoi5m/Sn
	5DmeFhfmGkj6LJoPnjiymlY=
X-Google-Smtp-Source: AGHT+IEkLq0qjUrXPko4h6Wura7ZYF4q0H0p0+hLabGetTV9m8puOt1Q1xpHSHAkT3UtsZo4Nar6HA==
X-Received: by 2002:a05:6902:1585:b0:e38:d040:eeed with SMTP id 3f1490d57ef6-e5b135d3238mr433177276.15.1738607248553;
        Mon, 03 Feb 2025 10:27:28 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:28 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 03/14] platform/x86: alienware-wmi: Add a state container for thermal control methods
Date: Mon,  3 Feb 2025 13:27:02 -0500
Message-ID: <20250203182713.27446-4-kuurtb@gmail.com>
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

Refactor all thermal control methods to use the newly defined awcc_priv
state container instead of global variables. While at it, rename
create_thermal_profile() to awcc_platform_profile_init() and introduce
alienware_awcc_setup() to set up the "AWCC" WMI device driver data.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 50 ++++++++++++++++++-----
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 506c096553e8..9512143c82ec 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -412,6 +412,12 @@ struct wmax_u32_args {
 	u8 arg3;
 };
 
+struct awcc_priv {
+	struct wmi_device *wdev;
+	struct device *ppdev;
+	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
+};
+
 struct alienfx_priv {
 	struct platform_device *pdev;
 	struct led_classdev global_led;
@@ -424,8 +430,6 @@ struct alienfx_platdata {
 	struct wmi_device *wdev;
 };
 
-static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
-
 static u8 interface;
 
 /*
@@ -1060,6 +1064,8 @@ static int thermal_profile_get(struct device *dev,
 static int thermal_profile_set(struct device *dev,
 			       enum platform_profile_option profile)
 {
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+
 	if (quirks->gmode) {
 		u32 gmode_status;
 		int ret;
@@ -1080,12 +1086,13 @@ static int thermal_profile_set(struct device *dev,
 		}
 	}
 
-	return wmax_thermal_control(supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
 }
 
 static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 {
 	enum platform_profile_option profile;
+	struct awcc_priv *priv = drvdata;
 	enum wmax_thermal_mode mode;
 	u8 sys_desc[4];
 	u32 first_mode;
@@ -1114,7 +1121,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 
 		mode = out_data & WMAX_THERMAL_MODE_MASK;
 		profile = wmax_mode_to_platform_profile[mode];
-		supported_thermal_profiles[profile] = out_data;
+		priv->supported_thermal_profiles[profile] = out_data;
 
 		set_bit(profile, choices);
 	}
@@ -1123,7 +1130,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 		return -ENODEV;
 
 	if (quirks->gmode) {
-		supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
+		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			WMAX_THERMAL_MODE_GMODE;
 
 		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
@@ -1138,14 +1145,35 @@ static const struct platform_profile_ops awcc_platform_profile_ops = {
 	.profile_set = thermal_profile_set,
 };
 
-static int create_thermal_profile(struct wmi_device *wdev)
+static int awcc_platform_profile_init(struct wmi_device *wdev)
 {
-	struct device *ppdev;
+	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	priv->ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
+						     priv, &awcc_platform_profile_ops);
+
+	return PTR_ERR_OR_ZERO(priv->ppdev);
+}
 
-	ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
-					       NULL, &awcc_platform_profile_ops);
+static int alienware_awcc_setup(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
 
-	return PTR_ERR_OR_ZERO(ppdev);
+	priv->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	if (quirks->thermal) {
+		ret = awcc_platform_profile_init(wdev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 /*
@@ -1267,7 +1295,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	int ret;
 
 	if (quirks->thermal)
-		ret = create_thermal_profile(wdev);
+		ret = alienware_awcc_setup(wdev);
 	else
 		ret = alienware_alienfx_setup(&pdata);
 
-- 
2.48.1

