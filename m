Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631941DB12D;
	Mon,  3 Feb 2025 06:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563779; cv=none; b=F2u/WqCoDctNov7xShVRggcgVWfcDnOKB76e5ROFaQwXgoo+rXd9sUQVihc+7y544Dkbv5Fr0BautF9DDamJciIjTcwr3k5qtv3tNBEN4nHWkUVm+rjvKxyqOpIUrISyMz/UtJV4vD4clcoOz6sguAo500Av/rCLYkgr8AbSETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563779; c=relaxed/simple;
	bh=/hv9b0y3+QmRGzvNQxI59EEr2+BbcQmrJxFqYRyQaDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PW5oRWaZrTqQzm8MNBz3Q5hygS/5zXTjl7x/djXAHWCEPth9a2OCGWek7ubiYYh68g8KnI8fhxmy7ifF4NWVXMvwBKRu+2e+ITjR9jT0o7JjoNkYoiFgxoHqWsouhU7IVJOz1Q3x4qyrN6nRhbQWJwuPji/rzpl7n9oQ0d3sgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndyVZIC2; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndyVZIC2"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51878cf85a7so960225e0c.0;
        Sun, 02 Feb 2025 22:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563776; x=1739168576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVPdXGVcq+AKN0EcXss9rNtSG3r7jQ/iRsXkVRRG+os=;
        b=ndyVZIC25RBg6/DGMWgo4heI7uipWl1X6FRwNaS4PzHM4fsjt7pwClCCOU71uy8TLo
         mMx3PMRB0VbBJ1Jl12dZySHg6UZ9zbdXpzNkloz0s8XzulVlHOdNib7xiQUMzku/FaaH
         i8vsthG3G2QgGuoTzd8TX7oQfbdAi2AV7K86MAbSIAiLG1LebTdVpDyk2gctxCdZcYYQ
         pzwDw+W7cLkMCTdTcSGwhG88gLeUjw9nRvQ8wlBocIGoA9zPTHNf6nl5tIGlpoi01qgw
         YEvOOqKyCX/DJeBMgUvh1L3w9Z9kImqeA290LQYskURqEOWihEVw0DNEkLb5CZpXv4rS
         Tk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563776; x=1739168576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVPdXGVcq+AKN0EcXss9rNtSG3r7jQ/iRsXkVRRG+os=;
        b=CL+qalqsnTOMCt8gpCLHfHo2EKbUxPiXcov78FJRqne1LMpueMeqCQC8Lc6ujDVbM+
         Phv/aqC2RalnHw+SJvQCYDOOFCyPCpavdZk44nQC8MEylhdlADkvZQo2tu1L8Cswf9cW
         8yL2FLY05+79VcwOpco9Ft4/fhC/NqG9Vk7efTIMoCVf5UVjBHBQDZ7uVPN5J6YRPXlE
         RRa/Gpf71cxHe3k0eLZDWQmoLoWWly4F9FwP0J9rSlQDBajg9NN5C2dKhUYiwoJVnq5m
         qNvZzh87ZuJG6W+xrxBYYynRfhqBTNtMiiP1vwb32QdJ629p4hAS11oF8ROhibAJsTNx
         jQWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi6znL/SantFYH3jUK0QRiUiNfbU3Q8cTnG+zYfhVdybV/lC/o/p5IJPYqX+hZIQkE+suckIoUTebyLys=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWMUlkk2EJR4VOERujlGUDA1Xgvshc0tgfyyJ8533DtM+mO5s
	guU8Jq5hENXh9QvrPs1YrqbPDiYuCSuu1l0n917nzA/f/iN/IUASpR+c/w==
X-Gm-Gg: ASbGncuTVpp4F+60IxjxqEOVE0ST64+2w3kLjgwHLpU7yAoA1brG2PTseHg7Xa36MG8
	tlare6JGFAgW8C8XjHIxAnJQbz+x54+qYik2KnfHt67+gcDObc0iWAcUhSX9PGDwUT2M7CcbFMh
	lcnyRdRN3WWg5so81Z/g6agKGQDUsW2eZ6Bw8CH/ByKekmOcCoYDW/6DIfa4g4tmBmf+5Pw94Mq
	JeF1w4ZZfAiGfhp0nWnB2m/S0QZs0MLqv2SbIkV4RLenkb9xvrYvfh5RItUm5bRpt9tcTdKa4DU
	NS1E4UID268Ob69ST6aHTts=
X-Google-Smtp-Source: AGHT+IG4suY1DU4GcBDBVKG7BrdLDo8/hS6a+qQfzaKfRjRZIQgnC9cdrxnyhreSYsfO/g59/m66rQ==
X-Received: by 2002:a05:6122:da4:b0:516:1582:f72e with SMTP id 71dfb90a1353d-51e9e30993dmr16674199e0c.2.1738563775899;
        Sun, 02 Feb 2025 22:22:55 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:22:55 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 03/14] platform/x86: alienware-wmi: Add a state container for thermal control methods
Date: Mon,  3 Feb 2025 01:20:44 -0500
Message-ID: <20250203062055.2915-4-kuurtb@gmail.com>
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
index 5ce954137f9d..6a3385350725 100644
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
 
-	ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
-					       NULL, &awcc_platform_profile_ops);
+	return PTR_ERR_OR_ZERO(priv->ppdev);
+}
 
-	return PTR_ERR_OR_ZERO(ppdev);
+static int alienware_awcc_setup(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
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
@@ -1273,7 +1301,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	int ret;
 
 	if (quirks->thermal) {
-		ret = create_thermal_profile(wdev);
+		ret = alienware_awcc_setup(wdev);
 	} else {
 		ret = alienware_alienfx_setup(&pdata);
 		if (ret < 0)
-- 
2.48.1

