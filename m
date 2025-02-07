Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7282475E7;
	Fri,  7 Feb 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943216; cv=none; b=nY0daAcV1628/a3qcc9uNu1XuZyP9qsvWZtYjvV5Ac6kkXNbbhRBCn9eA3i3i+LdEBbvplZN7hMOUI2okk5bn7rQR3eGcggXtSiMXypxHqLu84QHLGslODsjg9HuuYHVPwzvoCqmlefkGZFH7UDDlHUZS/wCIqKmj+IBLoEgsqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943216; c=relaxed/simple;
	bh=CQOdNIc583x14fsDOLKm2hyQoPhlC3QadwB4vTCp9Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+TxVRfxdpFSVjNStjH9LlQpbVg3Br/Y1iQgaZPnD+PWh8XpQUu0NWqXfiFFychy5pDyBfkLt2PQyT6fQ/xeK0C3Vn9cMxEyouN0B0Xz+g7VibrG5EB4EkgFVkKVVTaZeJL41GZKepxdTNf6lGSYU2FBS4IUkQ/EU9u52l3Ab6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwiwtrWQ; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwiwtrWQ"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ba9680271fso49790137.1;
        Fri, 07 Feb 2025 07:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943213; x=1739548013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eh9MtY8QMee8pu6PHbRVyWPVH4kaZoOf3tRPuu+Pts8=;
        b=MwiwtrWQlw8ifqoUCjo+izA28VhYm1dcImU8wVmrwuulU70ONHt6kuMVmaM6QtfQ7Q
         G3tGfhJbiDznCN87MsIAOwlIu3ATX82YQFPzMzjdF0yM2u6dYzsVGgFsCjZscjK1pn6I
         LeJMoYxFszJxWrrb77XhRs7zThbpp11iPMC5agpPsLq6GuQCc+RhIR8EX1oAoxtDiJVw
         PrwrYY7F5fIdlRpcu5IlMix+cTgQ+1YXkAAbwUKZErEzy4FHNx62nqhmQ6vZysCfZJ1h
         p6GHheE0PUCVzCi8JKp7hGTBf3FGsN1wfM6x4X8G4kIWzQ9ybYJ1Az3wreXIzzUGzMtH
         3OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943213; x=1739548013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh9MtY8QMee8pu6PHbRVyWPVH4kaZoOf3tRPuu+Pts8=;
        b=JD8GnsJLJuy4m7N3n9fIMaLJz32i9SD/h0p9aN+Ihuj4blhyVEGWhQn4BzslhlkVng
         JvPrJZfkeDI6KTbADGmRrkwOiqdvbYzDQVI21eXWy5684VK7Fwuamsp1IZaSsoBm0jwW
         Ryyh2nTwWUNwiIQU4ibKpo5wJ/ZzN7xEWR57Bw7HQajCBs854WkHqnbd4xRZ+ky//T5w
         u8QPAOA5iAXsxTS4DgSB245peS9qc3o8mY3KCEzzIyAxEB9Y7QlgbTM+o2FOF6AH42uI
         8SVnZc3mhIr7j/3zMYvjfRhZbnmrzVeFyr76VrX1sJWMpT1OXSuTAhp1zKxamzBoRGtl
         3TSA==
X-Forwarded-Encrypted: i=1; AJvYcCW9qtBjfMgvw/Nsdt2pYXvEjITQsw180bZtdBogZUkYB8ro+ZQJBokWUIVirOxYfjZWuOvv5JLof9OdluA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmHZXBt25DzR8pUhIb0TS6reMwpPd3O4L3ciNiA5N4JhWxpicj
	08PWSJRQqBoYVeoED5ukozlvmpJwufjCg26epgm3fQvJueyN/s+20w0j2A==
X-Gm-Gg: ASbGncvHp2n8xFXv8FXKDKPP2+ZTFh1UXo/AeKZ47ZlooCZNJd5pmvlSUkBJnjy1bJy
	p0EAUlUJ/OBawTrEM3dzyygCIWgHwTWImMmgqO1l1SXnCtwOCsn7Zsvs978K1JOXSMbSv2eYwg7
	bwKYvC8YXDJJf1anTNq8til8AhFDtNS559kCdfFKqxN9BZL1lpXz/pFF6aCS5gQ62r2cNd+rchi
	rGBC05Iv8GO4aiSIQNiN3ZeYNm96CiH5HPjEqBSr5kYqfuA5qBMZD9h+oPerHuwO2b6FhAHEP4H
	QnDvv6IhvqrsewMLgQdaURY=
X-Google-Smtp-Source: AGHT+IHUu+UXJ3E8TFVf09WEqaaTw74CZZsbFkV2e68LZ+sjlzm82mzbFGJhxYH338f4N1dBrrJTOg==
X-Received: by 2002:a67:fa98:0:b0:4ba:708e:58fc with SMTP id ada2fe7eead31-4ba71feca49mr4539978137.6.1738943213633;
        Fri, 07 Feb 2025 07:46:53 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:46:52 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 03/14] platform/x86: alienware-wmi: Add a state container for thermal control methods
Date: Fri,  7 Feb 2025 10:45:59 -0500
Message-ID: <20250207154610.13675-4-kuurtb@gmail.com>
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

