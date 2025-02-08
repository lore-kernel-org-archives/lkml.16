Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B01ABEC7;
	Sat,  8 Feb 2025 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991823; cv=none; b=Y0OBK0XvK43Gb064iU4prHxwUuCfO5AtmFuM18h5qj3/3xcqEpTPZ4WmImjlAQYPYzwNrLLyI0kgGRPcWAl1JnjiiceE6V3B/A7BQCPMlU0l8KqrCfppvBarUSC9flg1hBueGf1K8nhbaWaQ0Oud6eWOGBynO60K4/h9ZsdntGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991823; c=relaxed/simple;
	bh=0KSHupGOBgYOmFdNIreIK/QT2kr+uVPilbRT7ogzeQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhXz1fJ4x7LyWk3GbMOE7/I5MQ/FyljQbLPmd3mdEaDRN9e6EvvhmfyQOGWraoUH+rlPGEgaMDWq4QeemRpZUfyQ4EY8Nw3b8WknuykaULIW2cVfzg7I6cDD6JRdxPmG+Ovj2SymDOOioNlCusN3JWdtZWVVMavkhQuhvFJqT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwy8F9uD; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwy8F9uD"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so2390610276.3;
        Fri, 07 Feb 2025 21:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738991820; x=1739596620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mL0o1E0ZrpQj6F5YrHl7y+57sG0AVLmpDEujQJqimLI=;
        b=lwy8F9uDmhyS70pGJfhRAKUuKHS921HtSH4799Ut9bos0pl18vteMzOTJ1CD6uW7E5
         dhO4Hns1frI21aOXuloZ6pUzVRBcd4JW00EwC3vvazgGhIKmC06WmifDWbwLerAtcbRM
         C+5pcbBuulXXEkSyENpPpBwcxjA+FXu7PlrU1PXwC2QlufHNcsGVugSKSbpvr2sxiRTq
         GySP2hBPEH4HY5HHzlipuMjUBeY6GVgUkK3gzsAmW+4bsg1rl2fgpjS6K4JFPdFtomG+
         xo/fHdWe5HcsBUoePC9VIFViF4BBBUCjYii+JJFmQV8OG76LCLGlzTIlZc57wL7AInI4
         h+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991820; x=1739596620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mL0o1E0ZrpQj6F5YrHl7y+57sG0AVLmpDEujQJqimLI=;
        b=T8IjBF9U6GJyAGc1LrLbumsQvFoFjcSWRxML0TrbOQcPfrCSl0Kb4aX1Ir05OFHVvj
         iNeFRE0EdoUGgfsOkZXbh1brAhbppWIqCcISwntKkEx2OLl/pAbB0gVC89dhrDo4ZSPZ
         W2eUMmEs+n3PYOP/0S1TAcjjEXeHKQ5avtA3Te2Z2ZSzHuLD7C1p9LwW5COGcJZ7d7iV
         gqXPetyeWwFeUsj5Fl4bQ6x4o2QKR6Gssrj4WmffRog74Nmvts+RzWYJkf1HVgLYzSQb
         wTo88Pq7kH1N2c+DMexhu4wt7hrwfcaxhMLKYAIPf+p/cBwxbE90svTqeZ8rHV6yvFJD
         P97g==
X-Forwarded-Encrypted: i=1; AJvYcCVcgIIbFj+H5Aui7wh6SBgA7HDE0Y2aa5u8Wb2Yd8YLbZmlsiFYxEiFbzZ7NxX/68Q2pbqHzMa15Zr3828=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw7WVf2gmux/VEeb9UXLiuAnBhDVXfWny02w2hSiU2l/6KsAcz
	auYKKf6ru1Pt3ksVTvoQb33PZizfNTmK6C/quFAsji9CROqwVyaK
X-Gm-Gg: ASbGncsBumQMIETFHbNJVkxN3XnyYD31/D6fOkhYc5r4uzUBlk+LrhpsbZmRdHNqMf5
	6tlAldotdcDEn/LLZdl0SNgR09UAHK+sHou0dvxKj2ssNAM2DK2uNbyEi5jZIjM9ppMNO06iDv/
	roJ6lKWKIMEmD9CeJqYJL2r1Xq3UDEEAdltwLLWt9oLlp3uY2A3d/7I7aJHg5if206Y5Xhzie79
	My/MYGvCl9r3V6u9i9Ogl83s9Igz+W1sz3AY73Kd8WkwUjU7Pf4u5HAhzyaLFY7cCqI9AzXziF8
	Nu/atT7FCaWz7GXPEstOtPM=
X-Google-Smtp-Source: AGHT+IG/9d8oLIAckNjS/PepLkF71XB6GaYD3HwYj6XFmSZHuIa9XnVe8fd1To9WBR4Awtl3OJHRFw==
X-Received: by 2002:a05:6902:1691:b0:e5b:2245:9d6d with SMTP id 3f1490d57ef6-e5b4619ef87mr5711450276.13.1738991820176;
        Fri, 07 Feb 2025 21:17:00 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f00e0sm1207670276.2.2025.02.07.21.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:16:59 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 04/10] platform/x86: alienware-wmi-wmax: Modify supported_thermal_profiles[]
Date: Sat,  8 Feb 2025 00:16:08 -0500
Message-ID: <20250208051614.10644-5-kuurtb@gmail.com>
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

Rename supported_thermal_profiles[] -> supported_profiles[] and change
it's type to u8 because it stores AWCC thermal IDs.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 57897a0f4296..4a8335d90b5d 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -212,7 +212,7 @@ struct wmax_u32_args {
 struct awcc_priv {
 	struct wmi_device *wdev;
 	struct device *ppdev;
-	enum awcc_thermal_profile supported_thermal_profiles[PLATFORM_PROFILE_LAST];
+	u8 supported_profiles[PLATFORM_PROFILE_LAST];
 };
 
 static const enum platform_profile_option awcc_mode_to_platform_profile[AWCC_PROFILE_LAST] = {
@@ -606,7 +606,7 @@ static int awcc_platform_profile_set(struct device *dev,
 	}
 
 	return awcc_thermal_control(priv->wdev,
-				    priv->supported_thermal_profiles[profile]);
+				    priv->supported_profiles[profile]);
 }
 
 static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
@@ -643,7 +643,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 
 		mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
 		profile = awcc_mode_to_platform_profile[mode];
-		priv->supported_thermal_profiles[profile] = id;
+		priv->supported_profiles[profile] = id;
 
 		set_bit(profile, choices);
 	}
@@ -652,7 +652,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 		return -ENODEV;
 
 	if (awcc->gmode) {
-		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
+		priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			AWCC_THERMAL_MODE_GMODE;
 
 		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
-- 
2.48.1

