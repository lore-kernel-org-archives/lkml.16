Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDA92C3770
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564389; cv=none; b=BiMg9Ag/wCwByfkHOAdCn+9x6ARtNIiYNtGBZjws9G8xaENb6MZ0yObixM+QwIg66SU2gb/F0htVPd6H79R/cy00s3Pv/1D4oozcw2E9bnP67mHtAhy92dW4ZTbiAWsNvxo75tYynKqXBWPrNfayX1YVXEh8pBGXDnXVDQpGKo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564389; c=relaxed/simple;
	bh=RNboVNFWutHKxxSCJ7Ad+xBqpxMQb2M+r4Es9Fz+OXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utLyzYUqalQ/ydyCjgI1MXn42K6iBYGrp9lfxkGkRxTSpm0+vKiOy75AzmS4MZFj4UrQg1NfS2dj14s4Zz+hVvRvf+/171UWH8vabKi3UMab2vGoOx+U+0dfYG/dqrBe2ekCXWCwdVBqMr1yd02m4yBoEfHHsUiqMrF0Sy/f/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m0v/ZUKK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0v/ZUKK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a528e301b0so728755f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564385; x=1750169185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpOiO+FEaa+w4A+7D6YhlJmVtA2pagPAEL+dLTD4VlY=;
        b=m0v/ZUKKZqZe5TNcEGLKccHUc6SgEYjmvh9vLrNTZ06zZCsbPU33NlRXDOoTvrAvL6
         Hykiq1i8wStE7c126I3M2GewwPMDaOi+gFv81yZl/OjoJ6m7SN5KBagglzahtSoYIFh0
         Tm1RvgLuESlHQgW7uyExAGrGKxlJxSxv5P+iCtpkNP+PMivz2E1xVT/QEXKW7BHAUkBm
         cOEzPaXQVfIl0gtWCJQ9Y9xirmWuEJvB569QEc0dqIImoD1Hslg7P/dUc7DxgLphYpSZ
         SkEyYxIfYzPaWCu9t0tTYnIIehXiZqIipUMxb3o3cHB6u77G7ZeuGFhNhLN+pJs7N5Nq
         VYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564385; x=1750169185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpOiO+FEaa+w4A+7D6YhlJmVtA2pagPAEL+dLTD4VlY=;
        b=IR4JrX80TW5Y6a1m84UJeAt0J2h8r2qc2ezDVnRgujffbjlybTty+pKLrFmwBGTQKi
         YvLuuzik0ZBqAFGdzMznDmql5CXJL+20lXNEDDtQltKPdMG9woPXTN6A5+GXP8CbeETE
         LffveTra4qxr7kJwu4id/ivWyFXMFCmyUrY+o/V/+90OYGvyN3usTewMhoBRweX+5eTb
         eiu+gi6c9gW3M5P+AvGvZOvsk1MY/yiTXEQ1W98SusTBPPSyhxWN028y2sBixnFpHVam
         lxzSlOfRnDQy2h7sNl9XLaltl4v38rFv6Cs24VMHXtvrQF/h7JSGFTwS8SjKmHUBCPqC
         U4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUMo5Wkt/FkwTfVd4fEhNDP1t/SkEzplVoxp6FUMCA9dM0/UkAjtb5QiJ36ywKxxNRypALyLvAR7fHC7N0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE1OK0dEbEyloQybLBVTfdCPzcb0COupHB4ru+jYYZlqxrbG5H
	qdpL7yWCTOezLaN4qlF3i657kcpOjexbcqOrB3TmWFY86CbFi7bfFZMs4/O6YLkeArE=
X-Gm-Gg: ASbGnculyio5WdvQIl67kfCHhyoMCugURA6rYe2hwC8U3qhnYoikF2weIZdGsSEjDiI
	K7sSX/Z84ky8+XKgpFj0rdNyvOZLKYsCGBOND1WS59hpXGZiUfofNSgo0kXR6iE3LzB/XybpD+q
	W+dJpb56l1pwyVFTnhb3GvIs+y0WAa7cAJKWisgfcwFr/pFj2J3MuBP65I/Lt3JHNeMjhJJgaiK
	7K6wWcxFKIZSJ841S6BiEuTBQsYCs8lfzBlUXTAVgqAFMiOG0cAgyKPVUpc71gqtMaQSvmRmlsl
	PWZmIsnICGBKGEm6f04Fvh3ArY7WJpTpKWIHDy0YFqomPaEzW4qHo2KW8/kNP5wUBQtu54BRboe
	4PsoFqQ==
X-Google-Smtp-Source: AGHT+IFMhckmXcGnjChqtVdaAAq6SLAgWxkzv2bzSAaK4VvB5QeKCr7BJgtMZofJPhIMMyh+0XvSKg==
X-Received: by 2002:a05:6000:18ab:b0:3a5:324a:89b5 with SMTP id ffacd0b85a97d-3a53316bea1mr4327656f8f.8.1749564384148;
        Tue, 10 Jun 2025 07:06:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:45 +0200
Subject: [PATCH v6 07/17] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3534;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RNboVNFWutHKxxSCJ7Ad+xBqpxMQb2M+r4Es9Fz+OXY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvFX0W+WTwJ4w1LSGespVXTP1AzgrXMWkFy8
 TE7C6mdXrKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7xQAKCRDBN2bmhouD
 17NnD/4mMwgXpWRaFzN80tziJN1bGIPXDrhr0vKKLTqKnew/1/UgO2cwOucF397xWD9s37gwisF
 xlibcQo3MGfJXYyZDuLn5/TXMiPelmJuGAZgP8VI6Yu77rAkURXwjixbNTCvC6A5DXGgsbRs6/l
 Juhn+UPvEDD0yc5VgrMjeQNHED1NPV1Z86yU0gB+P7jxLygbrhWO2apN2/r+ohNrz1p2Mo8YvD2
 Q6oT6mkARDuT5hAwp8cT5NVODU17FcLU/rdU1Si5KqN4T5xRYHXypoaCft/SYy3IaLI3QsuM3Eo
 0OC6/GVtEoTJhVjmSFlQMuQ7j2+MeR1zXOUnG2cyV2viAK1HtRj2jKhakvpxxTyCSDUfmx9GUpo
 oOqHseSgzZJrWwdH4igX6ttQZ/JUX9yD02MMV9noYd20mGPUxoH8+9sWeaGsx8bSzbtJ+88ZQ4X
 tKng722zYkuG6sZPw8gGjFQsl4DXG1YBovz3UNK5ZUS+6YrVdDZQrq9AOawb+bVsH499RAq3pbA
 zBv1vnYAjJzHUOLEFeIiC0xDZeHTXrfx33F4vL7naLp8yx6s6t+lJg6mpNQC5/howyMAeF/aBkP
 QBQJfHfNfBEL6eWtMNRhGXSS/OceJx9A575nEBEGq2zjxcLPKowStveSoCBjnFZBgjw2hLYhCLK
 LnKLQ+LNpwXLafg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
masks and shifts and make the code a bit more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v6:
1. Add new line between declarations and actual code (Dmitry)

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 16 +++++++++++-----
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index f0ff6c9fbc2e6d28c96c08114c0f417708d70b10..4df865dfe6fe111297f0d08199c515d3b5e5a0b6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -361,18 +361,23 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data;
 
+	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
-	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data;
+
+	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	writel(data | BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	ndelay(250);
 }
@@ -996,7 +1001,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	}
 
 	/* de-assert digital and pll power down */
-	data = BIT(6) | BIT(5);
+	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
+	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	/* Assert PLL core reset */
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367..d49122b88d14896ef3e87b783a1691f85b61aa9c 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -22,7 +22,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
 	<reg32 offset="0x00020" name="VREG_CTRL_0"/>
-	<reg32 offset="0x00024" name="CTRL_0"/>
+	<reg32 offset="0x00024" name="CTRL_0">
+		<bitfield name="CLKSL_SHUTDOWNB" pos="7" type="boolean"/>
+		<bitfield name="DIGTOP_PWRDN_B" pos="6" type="boolean"/>
+		<bitfield name="PLL_SHUTDOWNB" pos="5" type="boolean"/>
+		<bitfield name="DLN3_SHUTDOWNB" pos="4" type="boolean"/>
+		<bitfield name="DLN2_SHUTDOWNB" pos="3" type="boolean"/>
+		<bitfield name="CLK_SHUTDOWNB" pos="2" type="boolean"/>
+		<bitfield name="DLN1_SHUTDOWNB" pos="1" type="boolean"/>
+		<bitfield name="DLN0_SHUTDOWNB" pos="0" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x00028" name="CTRL_1"/>
 	<reg32 offset="0x0002c" name="CTRL_2"/>
 	<reg32 offset="0x00030" name="CTRL_3"/>

-- 
2.45.2

