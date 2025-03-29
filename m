Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00C01CCEE0;
	Sat, 29 Mar 2025 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233588; cv=none; b=oeg76VAELmYD1w2MEqolUu5Q/MCeIxaaF3hqOBp82+Om6fV0ET4rd+5SFMERc7t7r1Gbpv1zPmooi+zdNxQV4wsvCJrRkzNLSrSeahKY+5F1qIGcHfLjxs487tET6yiBK8BP/YL/T5+lOSWIChiO5v2EzhCgNi3QoFprgjxzWs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233588; c=relaxed/simple;
	bh=xIuiJDxeW0O/sMuAJB93UTQkJwwWyiSYYKGC7w3qZgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Daqn5DviQ3RHdioQpaJl/qW6P3bACeGUB2eVPX9CjHs6gED0Iqm6Gd+v0gwj7wJSbaeoGUiJrSbB9wh1fDtjBfAiXt0ull+aX6nLWzHQQ3ELcBYl57Jc8dnhoe036Pkd5Zax5Sxw9bKP+/hmhNWQSeQiXfvJBcgGl1lTj6vdtnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nShqXdGw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nShqXdGw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22409077c06so87809475ad.1;
        Sat, 29 Mar 2025 00:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233586; x=1743838386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGlH08n70UCTP2pPy+HTCD4e8STPbVESuWCDYyWINJ4=;
        b=nShqXdGwAzUR7kSWcBcLHRK4wFyZYY0H2TMW8yHmDOF7z401pGjZVQSoApdo7+T1do
         ag16CXNM3XEmuz416iSecGu4jYE39igbIrxqVplZfn1H3f8uaWkwQUIRSvWxr7orqIid
         zcQK9Bhbo+Uevhg54Tj/oCUHhKTk9Y1pDv0T2Ud52c7n8fDWhs9iByNF8RMhWm/BAYcw
         kXDCKxSr1F8eEhfz2EhBrY0X7lpSBR2BBHV/azcKLNvxEBXyT1QpryAaca9fdagr5nvh
         1CDXRgN4e/DsKZZjRIKFlE1gcesaP6UHP/yvlvKcb2Son2+2yZ2u3xTnWwKeouoYqQTv
         TG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233586; x=1743838386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGlH08n70UCTP2pPy+HTCD4e8STPbVESuWCDYyWINJ4=;
        b=X4uxuGonVeZEECdPTenjqlXijjJcKBViK74LVBxn/ktbxvtv9k8BbNnZEW8Y5Ps9aG
         yfdBb4oHg/0dc8kfa4KGX2ev43ncifvxIzLlIAczjMXCC0rM9w5qbxy+TVDPAVmu9TMK
         HVyNPg4nBnSoZpgS//24V4tOVJ1Pey+aKefYoXaspEcQ1u9gEpjCqorK8VjbSA5icp1q
         YVL9K/4j0XHuP64hK61nCI2AnHSN4aMFnftsEpmlQ5+8VlpnirkOfUOWoo22yFHoJ4td
         h31c9esXl5xwv10oHahwhRAUzE/c1wyZcHDA8hXByosqrZ/e0fVuMNzzmI8yw3te2Q5J
         r9HA==
X-Forwarded-Encrypted: i=1; AJvYcCWqsW4bSR0nWCsO2ncjmkjWgqlwEKc/u1ujPb2SN0gZkXgBn7EOc422nihwpmJPSKR/Q99NkcMDcddnfLsfjb0T4dGPog==@vger.kernel.org, AJvYcCWwVe6GjZBGLYYDnFZTaCNCLvPwOVsmjTk4JKcYxDQLW4szBEaB5qpYLg+SskmCaf4C/mahWz4/rUxv7MY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgI90K05nHZ3cI1H8+8IpgS3vZexraXYDNIJNlwjZA1xQF9HNu
	52ZHgFUcZHHVbYt2XrD+SZneZOha48yAjsr8aqSZqS29BIxD66cx
X-Gm-Gg: ASbGncv9LyblXz7SnYRfu7GVM9MgzqlCbVRjduWycOJBesV+g53ik/Hdf3W76kmCPLx
	f7mq++jwaRxtKbKZdU5qmj16L5YrEXZryjhZYgyT4RvW3XqKAfUYgaQErk7wLpXJMVMM8WUVQh1
	qLSU2HeZzOeabT4pHHDysqnE8pE++3Hpl5cJW6WixRIVtw4zqB9/01qFWLk5iJWxlUacJzLZNQq
	LajTQunlXSPGUYv7fIcZ/NMWAxFyVDjf4uWVA0G7J1C1V9w77NxzUJ1e1jQYJUTRWDUD3B5EYdm
	yjAEqYjJHnyggzGsXIZFATRPxcMyW3rhoh8peGDt1Cnf
X-Google-Smtp-Source: AGHT+IEZ8pOEjq6fw34fxltHTDLxl56ip7RCIbysgC4oOPJFwcTd3eYr/JFZOq2yKX9V85q2bXBzvA==
X-Received: by 2002:a17:902:d548:b0:223:6254:b4ba with SMTP id d9443c01a7336-2292f961fefmr27214485ad.13.1743233585984;
        Sat, 29 Mar 2025 00:33:05 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:05 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:21 -0300
Subject: [PATCH v7 04/12] platform/x86: alienware-wmi-wmax: Modify
 supported_thermal_profiles[]
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250329-hwm-v7-4-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Rename supported_thermal_profiles[] -> supported_profiles[] and change
it's type to u8 because it stores AWCC thermal IDs.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index c0831c069e366c52b5bc6dcf7996c7b21f4c089d..dd7a17619e38b32a5be6daf44efbaa8d224f304d 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -214,7 +214,7 @@ struct wmax_u32_args {
 struct awcc_priv {
 	struct wmi_device *wdev;
 	struct device *ppdev;
-	enum awcc_thermal_profile supported_thermal_profiles[PLATFORM_PROFILE_LAST];
+	u8 supported_profiles[PLATFORM_PROFILE_LAST];
 };
 
 static const enum platform_profile_option awcc_mode_to_platform_profile[AWCC_PROFILE_LAST] = {
@@ -625,8 +625,7 @@ static int awcc_platform_profile_set(struct device *dev,
 		}
 	}
 
-	return awcc_op_activate_profile(priv->wdev,
-					priv->supported_thermal_profiles[profile]);
+	return awcc_op_activate_profile(priv->wdev, priv->supported_profiles[profile]);
 }
 
 static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
@@ -660,7 +659,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 
 		mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
 		profile = awcc_mode_to_platform_profile[mode];
-		priv->supported_thermal_profiles[profile] = id;
+		priv->supported_profiles[profile] = id;
 
 		set_bit(profile, choices);
 	}
@@ -669,7 +668,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 		return -ENODEV;
 
 	if (awcc->gmode) {
-		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
+		priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			AWCC_THERMAL_MODE_GMODE;
 
 		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);

-- 
2.49.0

