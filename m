Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5E71D7E3E;
	Sat, 29 Mar 2025 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233592; cv=none; b=koQA4r2lsBk2kv8MyKhUgsnhuzqw4mhU1YiU0qa5AL5mP9kUp0rZKODxdozg8sxgGQCu4XEUG3oyWLEi+Yh87/16H7LpZSusro+0zb8JufFQ7GX4k1bcUrKuuoqGAl02L35yX1WQL0lUCc/V7y231eonXVlq/G6UgZwCWMpllFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233592; c=relaxed/simple;
	bh=QsWoyW1XS4m6Bd4r88tABkYNjT7y5g2Ky+C1X3Iu05k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ju6AXCIfEzv/wbsNj4AfJD8dJGBi0wCQgHDQ5l3f2nTvQpDspScUK5xy5k8+tpeS34qWAfq5xupsh0OWvSjgFWSsQ6BSVuSWJpqx/n+sKSYSvdk0JFztumJAFOYuMr4JW5+F8A8n/C3GzktTeMG7l8jDDWKjzZ6nF3mpxgLett8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtWRxW8q; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtWRxW8q"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227a8cdd241so21496585ad.3;
        Sat, 29 Mar 2025 00:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233591; x=1743838391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cN5sVvQlZvDQ4uyq+1qDztNQT0cZNR4FxP0i2F4LalM=;
        b=mtWRxW8qGoqwKSb5i2zPV5VsTFWHhBJU+tQcWhSzF1BFfzvrjYxBMAtVV4miEGi+Bi
         /2YRwK9t3zNWhTmfFk28MmSksjkr0wPFu1l8gDT90ld3yW0bFY5UXhYg5JguYs6vWudQ
         Tgv3lpoRYIUFjqV4ma6kPg1e7ppmlge6y2A7g55GG++t5JS1y79jqiofmuxQ68M0M+ZE
         HVB6s0/RcB6ZDQSpgVtTnQmcr8SWGdZppNb+x8awRB2skCe0fQkAMS7YWuycEnl6N6EU
         rlKRdug0dy4XqBOIpj7Q5aSaS61IxkKcEVxHqp8hgJn/iH2dkVNT2L9RTTjoK4r7FTfw
         ORbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233591; x=1743838391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cN5sVvQlZvDQ4uyq+1qDztNQT0cZNR4FxP0i2F4LalM=;
        b=fg6PHKX0e8S4nKeBMnZLYP8bDeZnzlza5KSimD+aruY++lu8eUR/te8q2lKC8gw3Ab
         ZMNHNh3HG1Bi18PX16SrhvFIMfEgsdav9w7Ri2gnvj4QnImkKeNlbl2DxFZ3AiuJJ1XW
         IFyLCA+9b80/zUKt6Xxta2VRP0+eJkHcJhz0M8n4Nf/cizfi584byk6tqv8RSR1jnLHx
         T4sXi1TspJM8wte5lS/QCLf0TrjH3Ztf1DMW/Of7cwq6w5crLzGH2AAPRqFADRMCEDXl
         BAW5NpO13YISzyzpPw6Q5EZLhqiVXuiCnQCGNbUGSnzwXPpqS+ZVEwkbyOp9PyLmRc0w
         Kaqw==
X-Forwarded-Encrypted: i=1; AJvYcCVLlk+UYivNnxuBF/kmHZKZ/8eu7CxRB+KZ54n6mRfJpAGjcwhcl2eooUfZrudbsacNFxcwbsiCu9SqPnQ=@vger.kernel.org, AJvYcCWHzeCNnTrOAGxcfCUCd1kne8ulN9faC3Dvt3Kg6s+dPJMrUFZMWaZlGjF8QaKecqa7SZaEsISyi6fuCs4RrhCzIIJidg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDr1g8G98DE5lo7skgH1SDLk29VaQVJcsliTVngm89ykgY0XGG
	uVpJLYm+5CmxJXsFTJVKg1xytB8ipdW9a5ygdOKLmVD2CKrSpoPD
X-Gm-Gg: ASbGnctV7CDqcFdgIlK4RqzzwNK/WM+198UBSRKdoUO41ePZ+jJWO3uw4/5TtuAnw7/
	BeAq03pmkMN9aqAqVRqiqO7AKgipBlplcEad12N88pg5kBoCYiLGEJiPtesMX9B2nfokxaC4oD6
	/WMP+FpCWfukYYM827ZAV5LG0Pgo74ZdyLEcd808SfZFk1dx1cxraCorDLTj4oUZKTB7gp62D8c
	VzuZoUDqaqAKu4FiwtoAVbxdtE8oMJS6P4NlvSdetGE064vRpnKX/TdjBXxd+VTwXVhFJlvgH6G
	4uHkOJs46MVshlCcqxEu7FqXxQpOXXg1FtsvGdYGfjGg
X-Google-Smtp-Source: AGHT+IGhUsOkR9unrfcrbycTL5Ld5lHyW+wGhmOo/hH+o/oYYC6/PZbPQROSr0ywadTVy+e4nooz2A==
X-Received: by 2002:a17:902:ebc6:b0:224:c76:5e57 with SMTP id d9443c01a7336-2292f9e8652mr31278955ad.39.1743233590460;
        Sat, 29 Mar 2025 00:33:10 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:10 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:23 -0300
Subject: [PATCH v7 06/12] platform/x86: alienware-wmi-wmax: Add support for
 the "custom" thermal profile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250329-hwm-v7-6-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

All models with the "AWCC" WMAX device support a "custom" thermal
profile. In some models this profile signals user-space that the user
wants to manually control the fans, which are always unlocked. In other
models it actually unlocks manual fan control.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index cd4234a282cbd3c480a77801c282c3e786fc4a9c..5bf8264a1063b7d3310100d0edbfd0b9447dbe74 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -30,8 +30,6 @@
 #define AWCC_METHOD_THERMAL_CONTROL		0x15
 #define AWCC_METHOD_GAME_SHIFT_STATUS		0x25
 
-#define AWCC_THERMAL_MODE_GMODE			0xAB
-
 #define AWCC_FAILURE_CODE			0xFFFFFFFF
 #define AWCC_FAILURE_CODE_2			0xFFFFFFFE
 
@@ -179,6 +177,11 @@ enum AWCC_THERMAL_TABLES {
 	AWCC_THERMAL_TABLE_USTT			= 0xA,
 };
 
+enum AWCC_SPECIAL_THERMAL_CODES {
+	AWCC_SPECIAL_PROFILE_CUSTOM		= 0x00,
+	AWCC_SPECIAL_PROFILE_GMODE		= 0xAB,
+};
+
 enum awcc_thermal_profile {
 	AWCC_PROFILE_USTT_BALANCED,
 	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
@@ -599,9 +602,15 @@ static int awcc_platform_profile_get(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (out_data == AWCC_THERMAL_MODE_GMODE) {
+	switch (out_data) {
+	case AWCC_SPECIAL_PROFILE_CUSTOM:
+		*profile = PLATFORM_PROFILE_CUSTOM;
+		return 0;
+	case AWCC_SPECIAL_PROFILE_GMODE:
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
 		return 0;
+	default:
+		break;
 	}
 
 	if (!is_awcc_thermal_profile_id(out_data))
@@ -686,11 +695,17 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 
 	if (awcc->gmode) {
 		priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =
-			AWCC_THERMAL_MODE_GMODE;
+			AWCC_SPECIAL_PROFILE_GMODE;
 
 		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 	}
 
+	/* Every model supports the "custom" profile */
+	priv->supported_profiles[PLATFORM_PROFILE_CUSTOM] =
+		AWCC_SPECIAL_PROFILE_CUSTOM;
+
+	__set_bit(PLATFORM_PROFILE_CUSTOM, choices);
+
 	return 0;
 }
 

-- 
2.49.0

