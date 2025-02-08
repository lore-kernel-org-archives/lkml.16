Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996AE1B0406;
	Sat,  8 Feb 2025 05:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991825; cv=none; b=SwT9IeRaX/6Xr8P2z1jCR91tG+DcCMQbs0vEMeRbRa46J+zpcmR01dhMDXtU8B0pLjxdw+JN0g5VWnpOplynHlCf6dx2tUKg5VZF283Loj1p6EhKIlx5QkKz2HvWkDRDAdGbTC+AKOZm35GZEYyLLK0+rnj6F0MlsqR9p7PLiPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991825; c=relaxed/simple;
	bh=veRVDVSaWPMKYXKn2D3ut9WJXqVYipXaTrijz24ZORk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxO953e/0y03CWlJcoOYDv+QV/SiWLEhXQH7PhFF76l0WdQ5d1tCumN8uU433VXHl2bqYExI4j+qF1k79wt01jSYKYFw3X+yosno4XB7oN/MLusTmQfK5c7/70RbkaM9WSccCdRv8PQzRovu2euZIqFpZp+ACDzlf6Jyv2IYlMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpsbC4BI; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpsbC4BI"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e5b32f64ffeso2377403276.3;
        Fri, 07 Feb 2025 21:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738991822; x=1739596622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnq6bctUyMKnKWzXF4tir00PhIfIZPwMmmwSRfd2GRg=;
        b=QpsbC4BIlYPOymgxWV7DLDxcZpePyTveV4eBXNNmUq4quIMVm98QVHuRoVT3suPu3A
         cZ+1TWv7LeOAUMUqG3yYbSgcH/y4FQmSg0OJncTXr+HWlMKoqYOAKjjBQj+3bdvljoQG
         CvGaLoFq2y6kF06Fy34gM+bJv41nLqBQXgCkG7M2KOrgV/4CUlFfH5m8sp6g4+GRK2Ln
         qgHc/iOC+y+nnG2cGRymA8rJ71l/NY+TBlBaE0GMi2C7W+F/MwFx8heHfDcZNNe6iwjI
         L8sxu9Imt9x9Lv87AcUA94l8jgBCnmW9w67q8hU+uvJbb4s2rc9kWsJtAFaPKRUPasWE
         Kqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991822; x=1739596622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnq6bctUyMKnKWzXF4tir00PhIfIZPwMmmwSRfd2GRg=;
        b=sXO3JmoaLAWbbK6dABOy6YzpbWOYJJrSmTH6nSqOwHsrteJquaLIxK0lPy7kGYsLpL
         rKLAbRoDeMDV6c5ImOOv2any1f7MCOpN92bjlVnSp2nnV3TZ5rx1JcfJpnQ3aFikiXY1
         eiKNoA7YPnL8tK1H2uRYpIQMCizdSFuvUFiROXHZ91RoW1SUNmdmAxXw9BLxhy090pPT
         3lPUmxhlZUZj32BgiiJweMi+SpwJO9t4PixlJqFCkahk0/Lc/1zbw1EcS3atKHuKNrPs
         2W1BQRO9HCPZQfdFJ3kKOE2SWpo+b7nyWC/ukwlcaslE5MbmUJoL11OkjltOpuwOg+mM
         O9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU+T28kxKcJOSgaTGrKW5ATFoFNfMEcg0l0ArxQkSYJy5s2xuYCbFHV/VrVwukRi1KOC7guVwtyfVLO0fM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCqoRWEjE1otDtKxcPZ4MjUkY/mLERU4KLS1iW8hqoa0QAK0Kc
	T74/ZSrWHnqLt+1PHzLxHf4g1mfiUmiWoIyDPRYRyiN04by3FAuW
X-Gm-Gg: ASbGncvyL3vkM4WYJcAcKkU0X9to3nL8MhVuKF6FVEDJ6kIndNPuCb8PlDMioEhlmya
	0BFxz0NSdHPAtknYAJ4JZTa3cq4qKIC8BQ3qCG1arWnn2PRdJdWvvqccZTcvpYhGYsNqU4YeUJ7
	xeVqBN1FpyaiHQFwqd6E+/da5MVF2Y6Maza+XMq+M41IWui8V8fnHcNjpwbTplYwRVOE6Av7Bdg
	7ogsdLQ1tXSiffytkQ+FVgmBQZE6IyUVNPiFAj56MXP5rXSDMllpJq06U7zbw/ixzGt6v1vfdPn
	qCrv0Bh3Y43hgY/b4fGUMqE=
X-Google-Smtp-Source: AGHT+IG+C3Xv8lxo9hkllBJCbQGk+5SdWM2eyu6+rZItbSJyTlRuSzISKfOtNsALBmDQVkv7Cwb/dQ==
X-Received: by 2002:a05:6902:2412:b0:e5a:c5d6:3943 with SMTP id 3f1490d57ef6-e5b4606740bmr5139658276.0.1738991822473;
        Fri, 07 Feb 2025 21:17:02 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f00e0sm1207670276.2.2025.02.07.21.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:17:01 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 05/10] platform/x86: alienware-wmi-wmax: Improve platform profile probe
Date: Sat,  8 Feb 2025 00:16:09 -0500
Message-ID: <20250208051614.10644-6-kuurtb@gmail.com>
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

Get and store the AWCC system description in alienware_awcc_setup()
instead of awcc_platform_profile_probe() and add a check for integer
overflows to avoid misbehaviors.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../platform/x86/dell/alienware-wmi-wmax.c    | 56 ++++++++++++++-----
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 4a8335d90b5d..e8fe16da036a 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/dmi.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/platform_profile.h>
 #include <linux/wmi.h>
 #include "alienware-wmi.h"
@@ -211,6 +212,17 @@ struct wmax_u32_args {
 
 struct awcc_priv {
 	struct wmi_device *wdev;
+	union {
+		u32 system_description;
+		struct {
+			u8 fan_count;
+			u8 temp_count;
+			u8 unknown_count;
+			u8 profile_count;
+		} __packed;
+		u8 res_count[4];
+	} __packed;
+
 	struct device *ppdev;
 	u8 supported_profiles[PLATFORM_PROFILE_LAST];
 };
@@ -614,32 +626,35 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 	enum platform_profile_option profile;
 	struct awcc_priv *priv = drvdata;
 	enum awcc_thermal_profile mode;
-	u8 sys_desc[4];
-	u32 first_mode;
+	u8 id, offset = 0;
 	u32 out_data;
 	int ret;
-	u8 id;
-
-	ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
-				       0, (u32 *) &sys_desc);
-	if (ret < 0)
-		return ret;
-
-	first_mode = sys_desc[0] + sys_desc[1];
 
-	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = awcc_op_get_resource_id(priv->wdev, i + first_mode, &out_data);
+	/*
+	 * Thermal profile IDs are listed last at offset
+	 *	fan_count + temp_count + unknown_count
+	 */
+	for (u32 i = 0; i < ARRAY_SIZE(priv->res_count) - 1; i++)
+		offset += priv->res_count[i];
 
+	for (u32 i = 0; i < priv->profile_count; i++) {
+		ret = awcc_op_get_resource_id(priv->wdev, i + offset, &out_data);
 		if (ret == -EIO)
 			return ret;
 
+		/*
+		 * Some devices report an incorrect number of thermal profiles
+		 * so the resource ID list may end prematurely
+		 */
 		if (ret == -EBADRQC)
 			break;
 
 		/* Some IDs have a BIT(8) flag that should be ignored */
 		id = FIELD_GET(AWCC_RESOURCE_ID_MASK, out_data);
-		if (!is_awcc_thermal_profile_id(id))
+		if (!is_awcc_thermal_profile_id(id)) {
+			dev_dbg(&priv->wdev->dev, "Unmapped thermal profile ID 0x%02x\n", id);
 			continue;
+		}
 
 		mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
 		profile = awcc_mode_to_platform_profile[mode];
@@ -680,12 +695,27 @@ static int awcc_platform_profile_init(struct wmi_device *wdev)
 static int alienware_awcc_setup(struct wmi_device *wdev)
 {
 	struct awcc_priv *priv;
+	u8 tot = 0;
 	int ret;
 
 	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	ret = awcc_thermal_information(wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
+				       0, &priv->system_description);
+	if (ret < 0)
+		return ret;
+
+	/* Sanity check */
+	for (u32 i = 0; i < ARRAY_SIZE(priv->res_count); i++) {
+		if (check_add_overflow(tot, priv->res_count[i], &tot)) {
+			dev_err(&wdev->dev, "Malformed system description: %u\n",
+				priv->system_description);
+			return -ENXIO;
+		}
+	}
+
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
-- 
2.48.1

