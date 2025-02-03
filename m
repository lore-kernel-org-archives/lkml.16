Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649E20D515
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603781; cv=none; b=G0NZeHXdwi/bYC7l3bRuFEOqZZy3dln/jZ+qb5TEozQUJkgbW9XOfrPccsVhUY/s7hPcigu1qUPa/EB6rHNCfhDMXTDQDQMwyz8neF5IULlyuLOtgxJ2/4d/05j7YsGZ+TxWeCUuKt4LSZnohW4TyVscvKj4AMShrXRKxr08HlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603781; c=relaxed/simple;
	bh=hyETAALjAp1ZZkmUcX9prHNyliCQYJnSPIVGqiYhRz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFrAj2kMP1fLd8QwsEuz0qBRtkPkL6l3QStyAEFEcvjUWsRUKTfgMiuKYOfqxzbpv5iXZbbAwxjNkauYrgSawLMfpxY9vKP8I/0PxN5ZowA8godvg+kU25UGMikycCPINZKwYS2DQETkv4DUJNK5zoQeIMq94QmxnCMhRN6EdC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTMIFlAr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTMIFlAr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38c5ba0be37so281191f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738603778; x=1739208578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJ4SckAe3M5hIc6bII4OvJM2A7o5F83xDKuWL0+57KE=;
        b=RTMIFlArVDT5vELC+OTFrYoX/+shiD8E3Q3XIm9sl7e/5EwRD6HMLRIFsKDGviZJl6
         8drNKdqM+5gferuBij1MIJk/Vy/2KJYj1vtJvmUDKFystwNxTY0icEw6eqEe11LxVEH/
         oRTZij8oXIUw9jlxk7vpfI207nGBokyriwnx08PHtvoi0rQOtzSSMzh+GiGOMxjyWQ1p
         J+xWJw6Xw86fgF7AFfLzO8E0UHrzOU/G4XEQuWFvZXefTqIDAkKby5TxEZ0AKBDzPrBy
         /RAP6mIo85F78Dj+5bQYzvWLodxO23F4hpA6+S74K5r5ZZbcaVjlytJbiSoPLj48Prej
         r2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603778; x=1739208578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ4SckAe3M5hIc6bII4OvJM2A7o5F83xDKuWL0+57KE=;
        b=TI93tFiWDR79TyMlmf+dWXf4saSoOwpRkrGz0XviKAcFF03JQtmfrFjgXbVXmUQcsK
         uzCy3Nzg0jp/Byo3tH+Xqp1jY9b2ZNvtLwUcPIybm/9nZNKGkak0mU953YOI1TBA4TKa
         FHkAslNGcve0+9P0zwX9tRkHzoBxvLsu14912sWZdbSMbR104T7QZrZADXiicJDysHQL
         AiGUvHmjBGWUcEfWXDY+Rm6C9edlYY0sALAPKzEVIQ2o7Ee6LUwyAfggxS/e5o9csene
         R2MGdr+OWuNuyVGEMrlTFRuL9YPnIxyCKMq5wPEKA7tIJ03HPLMv/hJ6oOhZ62VRYkFa
         zbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFxHU4NDfK5hCsmDfVoeI52L/y1rdtN+4g97QYPhqVzGfsjcM4B/QGQXE3YRDzDiDaLTO9FmH1OceofdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuDa/iOAcrmgl9rXb/8byizcq8CXlb+QcIk+3+Ji+Aq4f+CPap
	8uCG6GGSpeP9M/zR39pNs9RuK9SHYOMhMShx9tUh0tYCu7BN2REHYGaG767XBdo=
X-Gm-Gg: ASbGnctPtYWXkbHw7YDbMqRAo9qh4deicMgDqWVrSUf8n5ZCqKQ4XnuMpdJ02uGZcIr
	36nXEHaB0HxeUOyMXorZ29aBXmPI8ywmFdaUSfluf5cCFkK4WHwKpcSI0V8I3kOppwgxo1uAV7C
	2uuseW6wi3oYFAc60wZEeU03kg0zEo+qZNwlngf0ymgN5opNxOQJS3mjbu/2LVbC+b7O0b9f9I/
	r/NORuxZwr7UQVYV5Gh/hCP8OQuBLmnaZXmhGjfbUvLSYClvuvkyJ3bI8u4luAmWuavn9gmnwqr
	1iRbiumySW3So0Y9SDeYSbg0oHyGuhs=
X-Google-Smtp-Source: AGHT+IFIj4gRIDP4pX0InpsIa4ZwSNF/sOa8F+6utSwOkoqKvTqGjRdYhd1+BwpOgmBytJ4Gc3rcYQ==
X-Received: by 2002:a05:6000:1acb:b0:38b:f3a4:4e15 with SMTP id ffacd0b85a97d-38da4e027c5mr148030f8f.4.1738603778081;
        Mon, 03 Feb 2025 09:29:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:29:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Feb 2025 18:29:20 +0100
Subject: [PATCH v2 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=hyETAALjAp1ZZkmUcX9prHNyliCQYJnSPIVGqiYhRz8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz7wTiytFmItVkhR/QVQhjlyp7a9NNDuCzGS
 viLLXyQdLeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D8+wAKCRDBN2bmhouD
 13ecD/45uNqBQXPujtKXQplCzdZ1S842t1bD975cTQzBpJN1MF75/iexO0wkpEJ6CNa0k7fiP/H
 RE2nQ7Q0HPfls6Secz/pG9DTzy2OSiQmnOHq6eOWExVJSl6cQcjZ7o0+y21srYhpSdXutcpJ6xp
 kGJN7lQyXyOJ5fFGnPWALIeNVf0ozbkylM/Vz4rac4IqDcf1QfFvNA69wX14RhVxuyBsRLhq6z8
 DKj5oBB3OU1ahAlviKu0t/QQjTzGe93CeZVECz1mQYMeP7t0ARY+TWzCwSxfz0ruWi9wOLMsUnL
 tD0C/XZyJWAkMmPQvPdxXpvxi5iygP95ZVkYu7RZJLgbsS3BlkQJaacvP9/SjDzQ/FM7F6/l3nq
 aSGm0kDHrtl9xKUaJYfzGT//rbAYE7+kC65UxR0/duievXHCMFHaCd+kK1EmI9RmTYintf5RMWQ
 wTGUO5QpvM/s1cwyaVRE+BDfVT63Usc4PoQDKMTMDcBI2/hO86rn5zEwiqpAiHQwmj0p8CjsfYc
 z44BJYZt19buIAOLuaMGpVtKb0AmjGXI7m43Ves93B7laSLFisFFqyWirB8cUp8sNbeiSimpZLh
 LINguzbhhSWwMtaI2sxpN6vcKNUsG4zvl5703fAv43h5uvZI1EFLXtSFgw0MOjYo5K0ts2+uxAt
 wzuwFw28fzFFykw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
clock divider, source of bitclk and two for enabling the DSI PHY PLL
clocks.

dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
all other bits untouched.  Use newly introduced
dsi_pll_cmn_clk_cfg1_update() to update respective bits without
overwriting the rest.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e26f53f7cde8f0f6419a633f5d39784dc2e5bb98..926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -616,7 +616,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
-	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
 
 	return 0;
 }

-- 
2.43.0

