Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CB20B80C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603780; cv=none; b=c/p7kEW7tnFoX5isD659mn1YYuJZDc9GJMRznJ1zWdh76KoqhF1hmPeBmdpACJ2sGUP8p2o62zNtkiB163FgifDwcTlQXdPUPadDVS9D76bu0+KbfwiZJqZQ+uiaBCDIQ3xiywmtKsmUgBu9dpzeXOHD9N2/lwYcB63HPtkzgKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603780; c=relaxed/simple;
	bh=qPayIg/NkA+MgAFyPivDQRmrfYR5ne0X/KrNddzzxvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlPqK6htiOLVdZpwkOWoEkI6A5ePBIHlwb0FvxtQg0W4n8WHkt/weto6COM9z4XDrgJx8EQIFt6aAGkaJsxUQ/YoTzVJNdMwMfF36Q3V0KK5F3Wf4tadLNHKlbUdI9gKFrRZhHzd/xk4RPoZqeaqXYqoFuUZLoPyESasqTihM98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7Q8sEDb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7Q8sEDb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so7132505e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738603775; x=1739208575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuYKr/hO5ESxnU+rHE9EocNAqOyGfy1DJ7LFqKkR5XM=;
        b=c7Q8sEDbVXvfEmePzPSng6Ly0uKKVT8hN5Oi/uvCOVheN4UeAdp1TXAW1wZmmaHbcl
         4ovdVQkafTbqSbqix7S3hpaexhijkjAFO4/52nY2ugh10C9kol7cINjonYw46I1qAWBy
         H2Vy/eTxsrRUHXQZgdde7g1ipsNGCkhWTbUAUObrmXQJlam3wiPE93bSu/wN8w8xQfVu
         956FtcOMU05OZrBvOy5tOdqraAVwi/dWqwFIq+ETC2cwWzQLr6SWXHQonWPkzBYdwH01
         VftGosaMzYkDdLdhm/xq622SDtlmebOj2MfalcgfG96zJfDZbyk+ctc45K5y2Hq9I/6v
         OFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603775; x=1739208575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuYKr/hO5ESxnU+rHE9EocNAqOyGfy1DJ7LFqKkR5XM=;
        b=c7Y5FtsTXoXxm0Eq9sEXGSI+DxOkbQ2O4Hk87BdbIN2pfF7QHTbx009FnRJPD8Y+SY
         7/Yu613YpsiDrqcBH9Cd/FSZigMRAH5Vc4DINuvn6He1qsdht3mVtZ/AFhj9lv6x6gzp
         chysL+99p1WdfsZ3ZVJeU41DlgPvwx68eVdC9bZXMoogcPLjXNAKpfyOtTy0SOZgaT++
         aTHL+aJQ4/WadvaO4OOMnnQNwPsiVoc4OxnpmrQ+aVT+7MLR4sXJMc8Fqo2fM8fz8Zl/
         HeaLMWkl8zYkdH4p4adSoS7V5BUDtGBXhAW5VGnTlFgDCTW6QfM/k24qG5ud63PcFWVf
         +k4w==
X-Forwarded-Encrypted: i=1; AJvYcCUreU/Li2VHpbiGZP1KMsRjeCBOa09WJdeNg2zLEW0NvoRzLlNNrntYI7sQ9rTP6mXRh4VbGPtroZWAcv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzICJCjFBd0p4R/CD/ZoLjKN8hA62VDnaseNZXi5thEMAIfaXb1
	8Q+5PMM2wbWqpltubomm7utsDXhyPDAf1+ZW9Uo8qjNcMcM0yK7C8C1dfcRKpVc=
X-Gm-Gg: ASbGncvx2m0AzBXAWuXFCwuyrxIHNkwgjUN195QmtG8ksbT8MsVh/F+tBaUKBwU4Vn2
	e19qxxXqZprzrYP3hyE+p2E1igFH7ebR1ZbHAFPbp4gZs1tt7y59WWXq4no14ZukaXuMbn+v1nf
	I+q/Ije+B3vhz+xmBZ9iVepBvGSutAYfbU783CMqOEWSOIxdZYlCGw+z4PdD5w0klLggydkilI8
	zC+u6N4UHASVxLzyF0r1wCZxgUgVciVsubBJAUQX1/u5f21pprwHYV+/w7XiBXSErPfFQLqWDJE
	NcYItLkCEzpOM+NZ9GWiwpDUjZmDrQ4=
X-Google-Smtp-Source: AGHT+IECb98Xkkqy62+Q7p2Drgjriyq42gI9R4uri6xqRDj25EMSJm+y28xmAHcntMRMQEfZGqJsfA==
X-Received: by 2002:a05:6000:4013:b0:38a:8784:9137 with SMTP id ffacd0b85a97d-38da4e637e4mr149177f8f.9.1738603775494;
        Mon, 03 Feb 2025 09:29:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:29:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Feb 2025 18:29:18 +0100
Subject: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qPayIg/NkA+MgAFyPivDQRmrfYR5ne0X/KrNddzzxvc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz5WQwjRgNnNMv5Hfv7P6hoqwOW1ag0x8hBw
 6PQOZoOJZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D8+QAKCRDBN2bmhouD
 1wRzD/4jCTIK8MbzpBxNwd/b0SIj8Csp+QLgtshMGR8U7NiBcwPDx3vo/xW8PpGfPxVpfH40Cd+
 WrN1C/pNihHURZRJhoGPIrFRFW6VBFM2znehMUfvdkHGsLVxyT6UUkpsE5RiAVGa2Y9MHSv4osR
 JadWShWRvTiSaEH9S8jqj4ZrnnIKPNpiHYTJgEVomWb0ohaduXyXsXeLa7vnfSQKIpkDHJwKGaD
 l5h64tzDYk7D/8XfNa5k/L1Rkh0Oe9TOt/t/SHkJDWkljek3IqQ4L717HFfZW8jpJWB8UBTcnA+
 KBrP6SGSP0JrM/p5DKyia58IoWMKWN6qnqPsbsJdL7tvdyGOTqrNGBN5uGMpLX9NiO7v2X4vcAe
 jV00rYtsgS91CNe9lYealqyuXgBUezMFW2rXwJRoTHyk622+JfywVaG6BKdgZrCs+w8UnDcgOie
 6d5Sn37sXVt0WbxKuqZqf2Hmqikpi+qRgOZRHqQ9KE7/XEuZ/4F3W6i27J2VX3OsYUFnhbIETcc
 IIy7t5zJimNNF0rDrRerf9cYwk001V6uR3v7+kv4NxXIvJy3ln7a0a46D1vxqUDo44/d+evkfbi
 luJ+QkmH0PojUAmCJMaFtswrsB91IrlyX4aGGiLmCVuvzoZCazYzkUr8ScBiF8Hfg9Q67ZpmBNg
 WzBkgvtEKrudStg==
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

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
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

