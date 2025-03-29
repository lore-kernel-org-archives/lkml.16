Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA1B1D5AB8;
	Sat, 29 Mar 2025 07:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233590; cv=none; b=YgwSnIasVwHCTDLF8yKdD8AAEwv0hnBem0tJHSL6ZSks5dDu9KHxa0qEk4dRdqmwVBdXc5vGizMzDEiAqpBNv13sXHpA5tDH4wM8zW1XhChaP/j2hqwP5hJiSFazE7qBf1giTAsX0cDYkUXGP6qbVsLF37k1lmNQOzwyMhhcvgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233590; c=relaxed/simple;
	bh=VcgaSGlp2//fUsGH0TlUzixOVNLQ73JOn3EvZ/CH1FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhvbIwfhZhcm9Bw3v+XMq5nOFWq+AN9Gnl9pOe7upi5BnKKbzSq3dS1vAEXmkCuG+uKXp/HB95x0VgBiJchsCLGSRg2+MtLM4iHBucXfMcl9ogixnJIgznQWo2DNK29oP+kheQ1MMWrncIoN+jdAcuUCTEAYWTvJS4jTHc2k5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNoXvPlK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNoXvPlK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227914acd20so62584735ad.1;
        Sat, 29 Mar 2025 00:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233588; x=1743838388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPQ2wgB/QHLk3d3quX542tAD7K4cxjHyvVNK1jD2ymE=;
        b=FNoXvPlKsqR+hIJCNhwzgS4jZL5Inh0N1MtEVhnuLnp5wDEw/4s+xOpGc8fKq52RCm
         PJWHebn4Y5TYyaINzWxi69wnSAqb1VwcmNLilr1L9V3QajUNxIwfC+bTF2h21xGq6+ed
         pTOGcBzaGTsnTqRN2SpIsC+LNscj0Q0vKHHhvy78MuTiAkQ4lau+UgVwmBiUpmqpIcOI
         w4ohI306TRIucjt8IXeIuxXqzk1+QoBNeI0W2Ms27jp77VLUhXiC+eAUQiEjSnu6DgO6
         TxUwbn9GOI7zYOkRrdvZBN3PuQ2Q1sJzDX+iPPg/K1QA8JSU1unU/SEUZhk/nRxlJPmL
         S+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233588; x=1743838388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPQ2wgB/QHLk3d3quX542tAD7K4cxjHyvVNK1jD2ymE=;
        b=h+z1NBs0u0fLLS17I4VIZNc0Eq/U5ttGzON4usYmYabAA13/e9IDlIrrtBB+vM42qr
         3+baXFB1n1atg+XbtpwRBtVlyFWyFb81TnOSq3U43kSq9mGYzGsPjS6ofntOLZkE0QSM
         HKlCJFbFB80J2VHXVe2ZmuxlUT6tzCsA6FWp8psFbBwHq6nZuUiO/wq2kc3WKtGZXMfj
         WbqSVK75xzCsfKpaTxTP66J94kzFEMXPRV/KyJRHpoKW7TZXFKilmSF2kqWULGISceQq
         cvH2F4NZDBA1m0cnBAsg/h2XRZheYxsnN077f+RoM6nOmPKIBvLCS2rmHjU52R9SkHfe
         fD4A==
X-Forwarded-Encrypted: i=1; AJvYcCUrrAEnw2FpSZL4JzD+HiLq8vM2fy/6NUOh1nkBPylDwq8+qIyTzYg3YKZG0TPH/BY/EI6HD7OejlovZzp0C99NlyBhNw==@vger.kernel.org, AJvYcCVukxzheCTCNj8AxEeVBg+MJ+ULfqQEpo1FCCbxjvrNOHWrz6E5mnQ5PIesFjW3KabYowBHYc5NZNc302A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVd1bbrtXXLdOCzaqBxM1dqymJeHoczVGb5UByGkAnias4vfp0
	RNBMbcNn//eS8z1yFSyaWHbwYSv3UQnuo4reRqDbU3FkcXXyotSA
X-Gm-Gg: ASbGncs3Wcjmrd8ONE4EggCCb+gvHEWopleUd+bSyl/Otxs6PhGCa0CK6xz71Yt6Ybs
	UTNa1k97abQwhicIauaT+CDMnhF2bnSYDRs1JJ+4dlcuP9Dqk+ceVD70by15aZcY9rMmvkX9sYC
	wlAsW3ENMl6E+awsFJWJXfRjJDuYUpzkSzBxgBIcebdLZv8Q2AYI+ZHeJtMajnDZ58/5mscCm7M
	7Taq4qnu71c7c56MaMXgrcREoumiZlJxBw1N+rGbsDJbXOUZ6DF+kDIAdRMx8rv/RwDV/Djj0o5
	PuuvnuTMKnPnU7h3h3BEVs8BcnE9graDMa4J3M0wqNtY
X-Google-Smtp-Source: AGHT+IHm582aKb7fSU1i5isdeEVlaCcikF+jMqhtwFuclB5srx4o7D5Vo3uYJLdRMwvTeukT4+xvag==
X-Received: by 2002:a17:902:d4c9:b0:223:607c:1d99 with SMTP id d9443c01a7336-2292e918e21mr35795285ad.0.1743233588121;
        Sat, 29 Mar 2025 00:33:08 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:07 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:22 -0300
Subject: [PATCH v7 05/12] platform/x86: alienware-wmi-wmax: Improve
 platform profile probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-hwm-v7-5-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Get and store the AWCC system description in alienware_awcc_setup()
instead of awcc_platform_profile_probe() and get the correct offset by
iterating through each member of the system_description.

Then add a debug message for unmatched profiles and replace set_bit()
with it's non-atomic version __set_bit() because the choices bitmap only
belongs to this thread.

In the process also check for a malformed system description by defining
an arbitrary limit of resource count.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 63 +++++++++++++++++++-------
 1 file changed, 47 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index dd7a17619e38b32a5be6daf44efbaa8d224f304d..cd4234a282cbd3c480a77801c282c3e786fc4a9c 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/dmi.h>
@@ -39,6 +40,9 @@
 #define AWCC_THERMAL_TABLE_MASK			GENMASK(7, 4)
 #define AWCC_RESOURCE_ID_MASK			GENMASK(7, 0)
 
+/* Arbitrary limit based on supported models */
+#define AWCC_MAX_RES_COUNT			16
+
 static bool force_platform_profile;
 module_param_unsafe(force_platform_profile, bool, 0);
 MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
@@ -213,6 +217,17 @@ struct wmax_u32_args {
 
 struct awcc_priv {
 	struct wmi_device *wdev;
+	union {
+		u32 system_description;
+		struct {
+			u8 fan_count;
+			u8 temp_count;
+			u8 unknown_count;
+			u8 profile_count;
+		};
+		u8 res_count[4];
+	};
+
 	struct device *ppdev;
 	u8 supported_profiles[PLATFORM_PROFILE_LAST];
 };
@@ -633,35 +648,37 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 	enum platform_profile_option profile;
 	struct awcc_priv *priv = drvdata;
 	enum awcc_thermal_profile mode;
-	u8 sys_desc[4];
-	u32 first_mode;
+	u8 id, offset = 0;
 	int ret;
-	u8 id;
 
-	ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
-				       0, (u32 *) &sys_desc);
-	if (ret < 0)
-		return ret;
-
-	first_mode = sys_desc[0] + sys_desc[1];
-
-	for (u32 i = 0; i < sys_desc[3]; i++) {
-		ret = awcc_op_get_resource_id(priv->wdev, i + first_mode, &id);
+	/*
+	 * Thermal profile IDs are listed last at offset
+	 *	fan_count + temp_count + unknown_count
+	 */
+	for (unsigned int i = 0; i < ARRAY_SIZE(priv->res_count) - 1; i++)
+		offset += priv->res_count[i];
 
+	for (unsigned int i = 0; i < priv->profile_count; i++) {
+		ret = awcc_op_get_resource_id(priv->wdev, i + offset, &id);
 		if (ret == -EIO)
 			return ret;
-
+		/*
+		 * Some devices report an incorrect number of thermal profiles
+		 * so the resource ID list may end prematurely
+		 */
 		if (ret == -EBADRQC)
 			break;
 
-		if (!is_awcc_thermal_profile_id(id))
+		if (!is_awcc_thermal_profile_id(id)) {
+			dev_dbg(&priv->wdev->dev, "Unmapped thermal profile ID 0x%02x\n", id);
 			continue;
+		}
 
 		mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
 		profile = awcc_mode_to_platform_profile[mode];
 		priv->supported_profiles[profile] = id;
 
-		set_bit(profile, choices);
+		__set_bit(profile, choices);
 	}
 
 	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
@@ -671,7 +688,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 		priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			AWCC_THERMAL_MODE_GMODE;
 
-		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 	}
 
 	return 0;
@@ -702,6 +719,20 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
 	if (!priv)
 		return -ENOMEM;
 
+	ret = awcc_thermal_information(wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
+				       0, &priv->system_description);
+	if (ret < 0)
+		return ret;
+
+	/* Sanity check */
+	for (unsigned int i = 0; i < ARRAY_SIZE(priv->res_count); i++) {
+		if (priv->res_count[i] > AWCC_MAX_RES_COUNT) {
+			dev_err(&wdev->dev, "Malformed system description: 0x%08x\n",
+				priv->system_description);
+			return -ENXIO;
+		}
+	}
+
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 

-- 
2.49.0

