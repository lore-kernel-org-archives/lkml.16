Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F332206A7;
	Fri,  7 Feb 2025 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937295; cv=none; b=R2aSmvlgO8hc6PMTEN8OCjIOVXhyjwgkDHSFaMLeanmMxrOjmBdLAtIbHM9O+w1SUi/EdBC2KBEk+rgORVTxIMmahZlDUtxWyrceSRo02e12haD82RBIX+p9yH+9qCc4U51NSWOrHTx0719GAr4sU4D/Ov1Mnp10yOOZ2Sy7jfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937295; c=relaxed/simple;
	bh=CQOdNIc583x14fsDOLKm2hyQoPhlC3QadwB4vTCp9Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBdiqcj5/zaU6YVu7+dp3cVl0demeujYyc4q8YN7l5w4k1HFg0ZFwB46STiT0+1lylpKLQzrKrdIB2PugdEdXgXK+6LjHraVHVh+xZOig6ibUDCFqM/YKOxvLyxLrNjgSWtoc/n5ss1grx2NQMQwHn7LZylBMfJXiiArwKudnqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYvTGg5L; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYvTGg5L"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f9bb24d033so4770467b3.0;
        Fri, 07 Feb 2025 06:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937292; x=1739542092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eh9MtY8QMee8pu6PHbRVyWPVH4kaZoOf3tRPuu+Pts8=;
        b=PYvTGg5L20bvOtATZCi2Tnw6LNZeMKlL3swgRONZXPtuDLvSn5vT/pbFpMXz5a3iUC
         ePJcCKXbq1Ld+vW8FJoQHef8pf2KJtQz6wQskKIzbEJqlpk69CpsQfjM26L14H7iAMeP
         OvjxqwTt7HOMCnOVFPBuDaRdWaBU5pQ3QuG2SKGt6h2VCz+KvswS5mCKOlEcbuxJfgzI
         p3mOPMgwGLJmLkNS+tJ0qGSrI1udFwcc6GnBDUi9VcVhJM18Quz7MkyD5v/u3tP9CSQ/
         zy0c1GI+6SKyO3/qMTdebpczlgW/vjIg/AdCG+OPITgndI3yz+1ou9IdaDtPaR/g+evY
         jBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937292; x=1739542092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh9MtY8QMee8pu6PHbRVyWPVH4kaZoOf3tRPuu+Pts8=;
        b=frEIw6RznD+YKe6v/pnNFLvsX4kBxC+p8Dr3bTBcjtY4sr25p6evQM4QBig/ptfk0i
         rX4b1seVBbN5MDM/QWhi8DEeHtLNXArGD9+BTH1svp2aOOOQeTZ+Jjw8NMdrz5ItyLt8
         kqO4SAStrqMkU8odJmRN2++b7ha06ThdN0AyVxZEiQ6f2oRegnXWOTLrJNKYVJvyORFb
         z7gORs4oG4AuIuFgA2ivyalQxOOpjNqW9pVyiiVMADF7WCgbcrkgvghhFXbuaw8z2F+j
         QZTexViCCDw9ywSxgr91og/cODv/4Yi1WyVNR7nw+vsclTqws6+I+h1+XgAYVW4IpSPi
         P/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrLFCelX1V9t4tnBvcoAxYoQjzshBsx1WHXyncatoaPzoeUMbmdyiE5WRUsgaFzxJH+dBGGA3UUbO0a7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5sc4wTiumuLg38o4qGOxDmf/c13OEyuyPZW4U06W9L96epRKQ
	K4c4LDhKzDD1IhpOt+11GmwIR0H7LYZy1yFKUMLqAOlyO0DfCV4Apfuttw==
X-Gm-Gg: ASbGncsSTie3LTO48x3XQiOeUDhZOSfcJBCVPtzxq9buvIVouJC8B05KBsyAItHzP4D
	91VH6QMQkZTfWL3lF8dI1F+gFX0Nf+6KFNrbneOt9Wd44873gayw8nnLoYKBaUe+ABCKmmCkQJY
	xqCSJ1dRRgO3rZVvLtQk8cOuJx+8jhAkN2YWh1GEzvLhJAF4i4+5UuYrz+SLRiw0u1yVNZpyvGw
	F9dptfRAdZLwcOsBXW1bYxe2ZZDKT4L2fAKIj7AqKjlM2aKsDVuwWEF980MxsbEsoh5lmg8PedZ
	yP/EJrn89yjPT+SX7rLnwUk=
X-Google-Smtp-Source: AGHT+IFO0v8GqLki5C/9ECRXacfeDWLsVuQsyX6hVewAmVobWmdd1pnhaXbbq8AqPHQl/oApieMm2g==
X-Received: by 2002:a05:690c:4c13:b0:6f9:79b2:ce02 with SMTP id 00721157ae682-6f9b29d4f65mr27403187b3.35.1738937292431;
        Fri, 07 Feb 2025 06:08:12 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:12 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 03/14] platform/x86: alienware-wmi: Add a state container for thermal control methods
Date: Fri,  7 Feb 2025 09:07:32 -0500
Message-ID: <20250207140743.16822-4-kuurtb@gmail.com>
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

