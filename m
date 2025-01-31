Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4041E571A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738335807; cv=none; b=KYmwKCeJbqP+50vsIPLHnvGugm/f+3nAIZfimcZ7dkj9VaUZ9bByii/1j/obd8oGstDoZZuCFZhVmWvgjh3xmA3wI3hABotyFaUNvKsjtzyf228ttraSBegpxp3wP3lf76t7bcDPOBg+EpHbB/AxlQQSS+13okq7ZfAfY+cL5jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738335807; c=relaxed/simple;
	bh=TQMpX2q60ioSuYRUXxHVBxFSOpUM+v7zvcx6K2VHOjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5klC5EiMjPAewsQzAnSJBHKpJJL0EUi9cjcpw0B/GttfkQfDJDS/M4Y7YPEm2SpqfsuFfuZVdVPT8lyXYbPQQUc1xsUPLaE6b3Rgg8qV3JDr5n9oTGvUnhck7ajFTdsiizPa/D1uQr2Q3/XVdZCV9tBp5G9UApaU2MlugKu2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZT/RlMQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZT/RlMQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so2956075e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738335803; x=1738940603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOG04vmKwSpyueEe3IB81azzOYNf9nZXosv7oYLCah0=;
        b=MZT/RlMQe6Cp3VtF55LuwREQJTL2UPY3a2s2P2k0VIG1WNJmpaJl06gUNdhnLiCHCz
         VFvPpEdpq4nqUEu4VxMhtZAHtubgVGjctOz090y+cSLMuQllDQDDYvhATNjjcT2041if
         wZQDNEsTi2d8174PVrFJEfi4pQlugK528tFgbW62jHCC83c27bDqO24VH1PWvQ8iDmrC
         nmwPE2E9Sq4V0nz1CIaNQpfI9yQ0Bq9rwGwuGHHTGJa2ygRVk0nO5Qs56KSTmvTDwLRw
         iMWeNa0C+CFoQY4a5SvwDPvERQDh9cPLpvD/6N86ouYAKHUkhG4zARROHhH/GXzdOOZA
         hRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738335803; x=1738940603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOG04vmKwSpyueEe3IB81azzOYNf9nZXosv7oYLCah0=;
        b=aVTeFow6jgXBwaUIF5BKzYcqGFKin/jlApmMsG2KXwoitL9lc16AOE5eU8yk7YExAH
         139EkiFWvTN3V4tLskZFng3QMAqnQ8XnQBhNNSfnWv1dQcriaRjBMKRtdvJfcJRVIiwL
         FS/SC2JTTz1ySas+HPdQn6gvIUGIxvgJQRiA4YgQxLa9mOf674HM/9AAAFCfooowYqRk
         a3otgYFxCo9aRwrdwhH/1aZBaISvmfp7fZi+YXoyEXG9nq58CPs5Xe7WeyME2PbT7zHC
         87cwOtns7oGtO2iy6TU/jZk2yyTcYl8LDYaL92ELacL66jdOMro6bZ/5KTCVYw1p+0LH
         a1wg==
X-Forwarded-Encrypted: i=1; AJvYcCVpXcE2cARbbjKGVT/RR3hLct+ae4O0GEvr6vjXxQ7yrgIeQEEQwEg3bcVWqulCJw3aP1k7JldmyZOacgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUTjMMi64hA/zKHe6RkQHx+zQiVbr4dDECGIJLGD3tRAJlmFOZ
	v5LK4bg8M11wnosf4b1995QoOzOFcJouSod24zZbgtBms6Je8PXwbk7JzWXXM0E=
X-Gm-Gg: ASbGncsN4zHxt2bFb4iuBF75KAnkaladN52wIY2/Eyy9pTiUW9AcYGrLyVBUv3tkRtv
	+KhzykSJr0os/B8SoCVUL+us3Psx3gaZj/m5LBGwpa74ttml9aeF5FxsvLghpFRdisSaewF0eEO
	+8yvY3GCpeDYII7mFFGZq80HhX5lzbzNInQBs589UTHHBCzLmA8iWGy41Thx7/mq5mOuwEHUP7n
	HgRc5b8xqdpxtEEtWFTs2GOwoYEzwEfSiOdLM8TNrxVW6X2rqCpeOwLxjXJS4jHfNAWqQ5IbK7+
	OnHNtiuJQJeLvwFalcx4ayx+AHXi2+g=
X-Google-Smtp-Source: AGHT+IG0gOzbonjy401fUUBUdELzQ5desAwbmNzSYkgOdCuyLIAiMWn9cUJeegXo09KdZBWlNYXK9Q==
X-Received: by 2002:a05:600c:19d2:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-438dc3a3ea6mr39897945e9.1.1738335801194;
        Fri, 31 Jan 2025 07:03:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm56679925e9.33.2025.01.31.07.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:03:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 Jan 2025 16:02:50 +0100
Subject: [PATCH 1/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from
 driver side
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-drm-msm-phy-pll-cfg-reg-v1-1-3b99efeb2e8d@linaro.org>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TQMpX2q60ioSuYRUXxHVBxFSOpUM+v7zvcx6K2VHOjQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnnOYym0KBKDhMEN2wb8SIxsqakbhU9C7pTdPul
 yz5WkWsN/yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5zmMgAKCRDBN2bmhouD
 15kHD/9c4oyVXwtyotRJmwCneKgUX+w0FoSrMVh89THMgyOyMr/F9oOKG+hFzLDrr9Tt7BIba7P
 ykIF48LWVhx4yn/ctm1lBWtwPD7P196DQaJLivIfdcuKtAwG9KSTyA5HbzkgTIG+6T44bWISYTx
 g0TxXJTBAq7vDi2c/Rnv60NnamXCNqS8psx33J/HtTlFF1Hz9OaSeWE1wwyYRU2IM3iDlrhB9dg
 8ddut5dznzY+PrJPjGpEgvLTJ056GurYKFqxxlJLxk740r4Um+U2N5Cq7qc+H5L8M5vme+uogvP
 mGfFCPmb9mp0Dy6kWxlYmSSzrEDUgciS62FVLDTbrlrTPD7oj65t/FuLviN8h48VrafC/d+FGqL
 8kQLvT4zziEXkUdqYQ/oOPMxWm2jY2zi+kHsPwPsMs+FqsJvx208/fqefI9NjHNAJMxE98yq6/P
 iDt8/JHX2agVgHiSzRhy/AIGG5tWgXL1LcSoRhTaLV9cj5D15Oow+r1Ufyssoq/G+lc3y8kmMgo
 5lGItK0HilEYpKIUyzF69EUhbEhRY0CYYgVk5eN0TJF/4r0korrYa7A+QjDh1rysioGwp33AeY8
 15Vuj6Wk1T+VUAcLh8epJ/EcDyA1lErfvu9NZWjw+mUtJ6AztohP2NsnHv0FQv0oFzaAULba9fg
 ceHjFl4uHXMW6Eg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
divider clocks from Common Clock Framework:
devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
clocks side is protected with spinlock, however driver's side in
restoring state is not.  Restoring state is called from
msm_dsi_phy_enable(), so there could be a path leading to concurrent and
conflicting updates with clock framework.

Add missing lock usage on the PHY driver side, encapsulated in its own
function so the code will be still readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 	ndelay(250);
 }
 
+static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pll->postdiv_lock, flags);
+	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
+}
+
 static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
@@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_out_div;
 	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 
-	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
-	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
+				   cached->bit_clk_div | (cached->pix_clk_div << 4));
 
 	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;

-- 
2.43.0

