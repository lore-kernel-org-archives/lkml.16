Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD0274FCA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018101; cv=none; b=hFAXynXGLtVb/rONOB3YIlER6sV3AtTavMLdoQOrSPN969idKVU+ML94dGMv9z9pDYiA6vVAGGfNE4N3PjJtHbZLLGvGvwVaPWEmmuJ+lOSTVfkwqoc4xlnmTm/V+7/VsOulgZgYDDLJ5+5Y2itTJl5/8HK+JEPtN8TJFD0Lg6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018101; c=relaxed/simple;
	bh=ie++luqCCOkUIqplEYfGoj3PyvDBiGZnnE2vPE0q2fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxQuZC8euaJoQ1FPFDnVnrpeLizFduMh+Hue6Eb1rIQFO6+l/ekciNcQv+hv4SZHG2ZOf6oAPcKBOuxBVRHGu24SN/dDaXbqjP8JvGCqUREP0HffXDbPfUMXtvk0Io32LEU2rdupbHAM3FYWSRSd0eaxODTjnxY9g46rrSqC27M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZEE+FVc2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZEE+FVc2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912a28e629so248900f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018098; x=1746622898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlgW31bMSvJHQr/+7FLD6mAl+2mcjre5T4tLb0NZhIc=;
        b=ZEE+FVc26Hwn3/do/ggdV6DnpTay1/WsZPGygW+rNHtdo8iTC1egjhz2g/LlSb7rmT
         kXKkMQS1IDhGnkVAZSX4O1I1ol5ncnfi1TbrKTowLjEWU8wYS9f4iwa5bB6WQOwqtpHB
         +ZtEXssHGsezXWNNY5DEdBCcJGdXsIdnbAR+BxsIfTNroo+ePQT7WHAnP8lsj8y5UdFI
         QeI9AIfGB1OKgLj80L9EQ+S5nvNYBP1AcgQvPry+84P8YORSPQD4TDp4tCnBmknOQQSF
         LoOaPahmDiPdnP3orHpAskPWQbfEbIOH0tx3qB7bL+uoSJpyittiAL2ZwktfinBWtMIQ
         tLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018098; x=1746622898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlgW31bMSvJHQr/+7FLD6mAl+2mcjre5T4tLb0NZhIc=;
        b=aenRTpP/ui2murkwrHJ71xcyitR4QIpvpeU8mUhy1ubxt1YyGPixCH9z8DSzeuRJRW
         pu2aYOwNy0C517S7XjVp3FSQSzL9xUxdiOF8GtyQXKlbTUFPfhnmeo9/MUM2O6Fw/U5L
         ogEdaa7KyyhGaC1ReJpcZcHtIb4fdQp4ighFzelhgpatjNN1dLlxUKBOu2Q9sOGnsjW7
         mgOco0WzxnTZa3ZpuyY9JJfgO0bm8pqcypjlU52T/jLljg0yWszCi/6lWW6Dl1supjBD
         YhYY9yVgrInG+fIpCgR81LvjgaOPZMijPIF994JExOZg8YTF39bAmQQiVmOcdoWNFeBA
         k62g==
X-Forwarded-Encrypted: i=1; AJvYcCX6swofEr9Vzyr0z8xmvlFQUNFclbuS7CldgIQ+YXZ6BVGI059625H8a6dKTjjIbQCvug0DH2xVTU8xcYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy46rVoc5oc/qQs45kdMNp4Aopx5RxDn3ZpQHxws6d+Jj94M0AD
	XL+B0g3teY8/otDwmglS5CiZhuslCnYthfBLNf7m1alumRM4M2ZL3WdgpRNnfag=
X-Gm-Gg: ASbGncuDvFO7OUE97qdhmtBISt8WUX3TvrQFVr5WCxf+ea84upX3lqer69/8UHoES8F
	+1OV762xBDIqdlzSbDTa7+tHmhgHl/vu24lopg4XaVFI8el6f1OztbikeK+XE2A9RKKFI1oSz4X
	bUjItGcJW2+uxF1zaFfPOjP36Bmf6mC4bhG1FGUjS7DW0xE4V57uLMJoaK19j7+G/NE1GR+H4X4
	ws9ky57TP0dsITdsR6GLjBpLt/VAQMefjOCzfGmnP1+bDAUOBTfAfZkfyAWiWjSDapnCyp1Z+JJ
	xWC7/mq/m8yVwxC3PTUVM62ly2mq2vYf4z6EzBeH2xdvzLa5LdSh6RIPXqI=
X-Google-Smtp-Source: AGHT+IHmxoUPURdmmgQHz7Jfj8+u8t0c/VIE/4vq98Yg1gd3UGcNqtyKVvz0Ufit6P2ua3jO7/u+tg==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id ffacd0b85a97d-3a08ff35f51mr816557f8f.0.1746018097648;
        Wed, 30 Apr 2025 06:01:37 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:44 +0200
Subject: [PATCH v5 14/24] drm/msm/dsi/phy: Toggle back buffer resync after
 preparing PLL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ie++luqCCOkUIqplEYfGoj3PyvDBiGZnnE2vPE0q2fs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8DPK+FwfYxZwhAaHV3AlW+BD3qudeCMCqz3
 OYe9MuARDeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfAwAKCRDBN2bmhouD
 1+V6D/48DkbGSx3PoiTDnUJsqlJggDdfcZuoUZnjxl4PJSz/rktRaRaay/hiT4JNAAsLHB+dC0S
 KJ7ZpYI4zG52UiNG7o7KJoPFFlH1SLeRgs0PuHfx58n+ZKbogI2WWIiQ++0CfuMm484s0F0E48a
 QU5wjbF0TuVEZ4gG3ud+8p7xPetF1YduSekNRPw2MRkOUV3+0857Z9eFfbVgaHPSEJNEA1rNO3K
 TmRs2D3EoX9qi+ZIvvDJ5BxYa9MjCAb39D/7XuVj3X20DYvTTyv3a46kEI08haCjxbkXFJj3axF
 MP6cXSL1fdt7Bo2TPFV0OBzPMI+AOmnwPdizhelzDbjd9vfwaUCqgeLYAWKKEjpDrrxUcGM3Gnx
 rvQ6lhr3SQjkbr6vdPkJ3VgBO2wdRLfkhvMn6UMY3j9znH0a9CX9AGKocVMq6YjqmG6ILiY/7jR
 QozLeOjqymN7TJzz1UCaCyHiPUHih5BxcO78BDTFScr40NLnLcl9zD4w/gJ6bCUi8ZGpBlB8ipk
 hx9yPNd//qGfUMCjhOrPakJ56GJOInTiey2NcrqoBCdEfROozCncSpMRDL8jADOn7U5ATEDtzmz
 PNfhEvYfXWo6F1cjAcoxwMYfZ7xPm34odoidWGhs6JERWO2+G0IdQQNy6RFaNNKflFC6SHjaROi
 zIojsRSRHDWoh0g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

According to Hardware Programming Guide for DSI PHY, the retime buffer
resync should be done after PLL clock users (byte_clk and intf_byte_clk)
are enabled.  Downstream also does it as part of configuring the PLL.

Driver was only turning of the resync FIFO buffer, but never bringing it
on again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index a92decbee5b5433853ed973747f7705d9079068d..ca1a120f630a3650bf6d9f9d426cccea88c22e7f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -467,6 +467,10 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 	if (pll_7nm->slave)
 		dsi_pll_enable_global_clk(pll_7nm->slave);
 
+	writel(0x1, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+	if (pll_7nm->slave)
+		writel(0x1, pll_7nm->slave->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+
 error:
 	return rc;
 }

-- 
2.45.2

