Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0D20E012
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603783; cv=none; b=Z15oLFeC9nG+5TxmSPJmVzRLvkeiuZyupOoeul6pnSWZaPwLbjkLb9lh26PZKClzjDUk0igsvx966QKevXdKVlIc5pU1chmUzMQ06F8DQDyAHTQu3k1XR1kEdEaNYDdiyqAL1VHrKIwv3mNmYJBtpI/GNBApR5Zn8cxS5TuhCfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603783; c=relaxed/simple;
	bh=8J9yPH7vzWSfYWlIvW/7lONVx1z/scQLxZ+Dr1iePJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQeTErgN999DotZcy3ksdYvJKTz1Y/ELFkPADTdH87y6W5GQ1SGOXVR/U1jQ3p2B0pSEkfUl+CMWHZZm0DnvSWNFEA5xYXNdBnVdlGk3PpxO2zX8feHPeYYepojlQX7JMjneqw2NiSY4atjmRuPul0JS+zOGXOtvYf3Ttw/uZtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3mt4tQt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3mt4tQt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436230de7a3so5888815e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738603779; x=1739208579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFEJkSWV8EqlxS4ccHV0qsfBF5Y8l25q3xX6ZVEbfhk=;
        b=F3mt4tQt/MN5QvY1Lh10RffPjKoJ2cOK1ifyIWffmDtzEueKUdLqnXMBFRKBkUDUzt
         uv0dUIJpRB27IdfOFpdnf8/6SWS65AIZK3h2FysK2Q8OWoMZT7k10vp3nnCZw6F7oF3k
         bKobfptzVHiz8Fbo5AJeN5bIV5fmUqDVvzZmCZ4F9laFW6rKM+kNYr13A887va5kB/cK
         dM3n3e2bBlLrU3SXNxM3QP0MYIszzZyWvGOk9OR7pdkPK4Bv4qe7hEE/XGR8RfHs/YOQ
         7Cf5FzbMuwvIn1/k/hQ18QHljVULK1+IpuygdQf2UnZ82cIEUILN8addTiMhuh7+8hzo
         F8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603779; x=1739208579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFEJkSWV8EqlxS4ccHV0qsfBF5Y8l25q3xX6ZVEbfhk=;
        b=gITEjpVipbqCP5mtOqrkFFtPRCPLPq+KJL3xZF1YtVIPqORwjFefdFwFSB7n6c1C6S
         Kt9Dqf/ogPgOHY0eo649eMaCjglNizr3lqzxTqy3b6SzT+dI1DZCDuWPmrdGMRaJl+3q
         9yqLtBNIfvIDIiiWa2p1gFF4ORxI+kJdWzjFRyK0P84sCIFRyRrrQUcPnTzy6h69a1Bm
         0+AllVOZOQjaBi3k1+eOhR9rqywTdxon+5byEQFTJzQ4tOWh2+lwouQwIEuH3VoHk3ns
         FurpaS43Xl8CQMs+kT8aBV/C+6Mkp6tFvWWqBPdxZSK71AtdQRq13SKHbWyogZqAB7i9
         Kuog==
X-Forwarded-Encrypted: i=1; AJvYcCXSYyryI16AG73ZeLyg5h2mwXpntJW/N1dlc579qE4z/Usb+/ZE6U7tovM3kUhtHtOssK0xqeWqbICemKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSn5i9psHFuQDa9o2t3rjqw5XnYKaD1Uv3O46r9dATmL7xhLT4
	FWhATrVKZED7Mr7smmOr2H2hs5EJNy4M+ThQYzzyovGlz3ZuMGCrz8wFCFBEKD2WUZ0YKjIlI5k
	s
X-Gm-Gg: ASbGncvRZjj7yIHFP4OFzUhUVzzVF2gkiA6VgIvR3H2fgMqbzjriocO9lLiFX+OIwFr
	wwDNF9Fgg6acaPRcrL0gMLduoKX7Pjkj9zr3n/SqD26xSO2V2fRqmX3bX3Vi/pFWbKuMWmvlHRZ
	9RS2VkfTT4Ty0fNiBdwaVO162s4+fa/1tiBnz95GblsUVc83cMiVV8yY+QfC/tw1437eOoSxgRF
	sOuvvydKFjVFFiuRH1qB8MABYMWaIUvnhF+i5FxCXmwbDgv9oj45oPYeMrfN/ldS+Zdec+HRjNw
	QOQ0XSSJ80bi2quqEiuWlnFHJjxVKbs=
X-Google-Smtp-Source: AGHT+IHAZR31jk7cgQImdAXKbLZVi3PgQDQvGTzkJyq/KIHOb1BAE4Ed3PCPRMwsFm7IFfCJtLB63Q==
X-Received: by 2002:a05:600c:548b:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-43905ac4913mr1728715e9.4.1738603779408;
        Mon, 03 Feb 2025 09:29:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:29:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Feb 2025 18:29:21 +0100
Subject: [PATCH v2 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5553;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8J9yPH7vzWSfYWlIvW/7lONVx1z/scQLxZ+Dr1iePJY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz8U+LiZC73yFpJFPRfF2xbFXgicoUahB2Wt
 8PLA7CrdsaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D8/AAKCRDBN2bmhouD
 100GD/9lVGCRE731lWWUz4GdQLNxSdZ55RES0L+uItHvLkzhV5GSP7VvyA3mfDGylnkqGHDD3dE
 d1doKuC6a0ZsMD54rshnuwWEi7Q2QGydWWHqaMyOLGMGvfLERnswhH2uOvu4e/PLM+ubSweZUQg
 ppNlnxj//QI+gGnc3D3DONFaPLhdJHRTYZQn4lBxf+uF4d/OCoxCg22kF/qpheOarxa725F0xpm
 LxXHDj6Fzz+unuesi7vODErgjXGyn0t0vfXLu+pt/kUkfOBahieHmj+KVMAoHKONySwBqFhd+Nz
 ApC3UHAdquEuLon8PO6mI2LFt4T71/e+IOi6uhUiOBD45so48KtJ1o5S84s3thYA30Ll8gstYjZ
 n/XBlAG3942Em02ovnGIPcsVtXiE3oTlcM7wW8bLlnxOX9Qn0JCC9k3FsUigTEvy95FSJ6q8l1n
 VXeuyLATS6ie1PdJzyZKoug/RYJC1SxWkNuRCgpreBHL8/8k2Sk67O5FEQWzWycFaIN+QyFwkiB
 ThwGRH2H7EtoZ8/p8dwmjLIgZjpR/c3hRTM9a6Jh9d31cPSukSN1ksHL9eHGSZB/JihmQuEzwPh
 KCkRO84+WuLGbvRaU7WOTgaVLaXA8yNV1qCebEOUGxpEkqd3XY4KOzBtLNu6H21a7QBb9BP1X8j
 4Ozsnn3H3c3YqIw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
avoid hard-coding bit masks and shifts and make the code a bit more
readable.  While touching the lines in dsi_7nm_pll_save_state()
resulting cached->pix_clk_div assignment would be too big, so just
combine pix_clk_div and bit_clk_div into one cached state to make
everything simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 31 ++++++++++++----------
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++++++--
 2 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8..b61e75a01e1b69f33548ff0adefc5c92980a15d7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -67,8 +67,7 @@ struct dsi_pll_config {
 
 struct pll_7nm_cached_state {
 	unsigned long vco_rate;
-	u8 bit_clk_div;
-	u8 pix_clk_div;
+	u8 clk_div;
 	u8 pll_out_div;
 	u8 pll_mux;
 };
@@ -401,12 +400,12 @@ static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
 
 static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
 {
-	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
+	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 {
-	u32 cfg_1 = BIT(5) | BIT(4);
+	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
 
 	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
 	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
@@ -572,15 +571,17 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	cached->pll_out_div &= 0x3;
 
 	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
-	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
-	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
+	cached->clk_div = cmn_clk_cfg0 & (DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK |
+					  DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK);
 
 	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	cached->pll_mux = cmn_clk_cfg1 & 0x3;
+	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
-	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
-	    cached->pix_clk_div, cached->pll_mux);
+	    pll_7nm->phy->id, cached->pll_out_div,
+	    cached->clk_div & DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK,
+	    cached->clk_div >> DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT,
+	    cached->pll_mux);
 }
 
 static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
@@ -595,9 +596,9 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_out_div;
 	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 
-	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
-				   cached->bit_clk_div | (cached->pix_clk_div << 4));
-	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
+	dsi_pll_cmn_clk_cfg0_write(pll_7nm, cached->clk_div);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+				    cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -634,7 +635,8 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__MASK,
+				    data << DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__SHIFT);
 
 	return 0;
 }
@@ -737,7 +739,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		u32 data;
 
 		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 
 		phy_pll_out_dsi_parent = pll_post_out_div;
 	} else {
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index d54b72f924493b4bf0925c287366f7b1e18eb46b..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -9,8 +9,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00004" name="REVISION_ID1"/>
 	<reg32 offset="0x00008" name="REVISION_ID2"/>
 	<reg32 offset="0x0000c" name="REVISION_ID3"/>
-	<reg32 offset="0x00010" name="CLK_CFG0"/>
-	<reg32 offset="0x00014" name="CLK_CFG1"/>
+	<reg32 offset="0x00010" name="CLK_CFG0">
+		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
+		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>
+	</reg32>
+	<reg32 offset="0x00014" name="CLK_CFG1">
+		<bitfield name="CLK_EN" pos="5" type="boolean"/>
+		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
+		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
+		<bitfield name="DSICLK_SEL" low="0" high="1" type="uint"/>
+	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
 	<reg32 offset="0x00020" name="VREG_CTRL_0"/>

-- 
2.43.0

