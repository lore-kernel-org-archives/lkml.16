Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE04228EA7C;
	Thu, 10 Apr 2025 19:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314059; cv=pass; b=LzZhYJ8e5vePbkz5ihpicfDPI8XWW8euJTem1JS4R8bCWo8hmAF8Lhgxbsa0U6EpBwOXmVsZ76Z7HhzGysqcH+Sa0ne4HtUJB13fPm1jfLl3TbOr9Ob89uhgRtLjfw9brmXkhvwksrg2aJWhKLmYA25x5V2JHEFIHCL5QyxzuaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314059; c=relaxed/simple;
	bh=ioMRugEWublB3+wH+i+bFKX5LLNZRZGfDIlj+9/jrZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kc7rzJwpQPNT43HvLH+hm1ZFe2iZyl/PGZRCs32VGV71dJXpItUg8jQIhaJuFZ9CrAMKWSL+X+KdhRgK5P/Ppj896mwVEBeUN64yRoteq4w6IHvMg0yiPEzMtl7UUc6xBf2iLi7QHRwL1G8KVBKLvbGWuxpNtHWWcDVGRzXxONY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=L7leXApD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="L7leXApD"
ARC-Seal: i=1; a=rsa-sha256; t=1744314019; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OkgUZthNmo+Egj+G4jV+vRnTkJVpQrzM7EQuTN1iJevpz4U9m01yCyR3J5BXRPu+8ctAHbFIOp+zmYTL4KYlm3B1Xun2b38dfbzVy8GFoRnW23dSD0F+zBPlRcLtGFtZtmQ89nK1Cp6vST1dfFbMeJBYz7OQS7xEDGQDXelTE2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314019; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=; 
	b=ETYj1Ye60BkzNxmjgTFouDZUcqBw/xHDAiXeplw9owDAWp9vnQfIRPVwMuqJWOkE+lTgb3DhhZA7WLffaDIOaBY5vQpk1PFQ3ZLmc2SNMm9CvbxTV2sbiBuqNYtcfgsP34s7ylZ4FtQUv36gdW3Vxh+wEswElwHg/UGIQ2JokIQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314019;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=;
	b=L7leXApDPBM54bdU1QBrM6mExrCnOG4mLjLvfIx1D6OS2nRdCT+xv5Zg8JqCAdVf
	c0D3xOg8nLnuSGDjjxUHOOfws1EM096tx+ky/if3dL9DpW2c+ZJZ0DIxBo/0wRyrk7J
	vC4IVJH6V+39ZeR/NoK9yqKUFluOiHTI2vsKeQ3A=
Received: by mx.zohomail.com with SMTPS id 1744314017941145.1745690911024;
	Thu, 10 Apr 2025 12:40:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:39:53 +0200
Subject: [PATCH v2 01/11] dt-bindings: clock: rk3576: add IOC gated clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-1-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Certain clocks on the RK3576 are additionally essentially "gated" behind
some bit toggles in the IOC GRF range. Downstream ungates these by
adding a separate clock driver that maps over the GRF range and leaks
their implementation of this into the DT.

Instead, define some new clock IDs for these, so that consumers of these
types of clocks can properly articulate which clock they're using, so
that we can then add them to the clock driver for SoCs that need them.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3576-cru.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3576-cru.h b/include/dt-bindings/clock/rockchip,rk3576-cru.h
index f576e61bec7041455e10ac18c92f3b33ec0760e3..ded5ce42e62a7f4bc8058fd71b5e9e1d4580f49c 100644
--- a/include/dt-bindings/clock/rockchip,rk3576-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3576-cru.h
@@ -594,4 +594,14 @@
 #define SCMI_ARMCLK_B			11
 #define SCMI_CLK_GPU			456
 
+/* IOC-controlled output clocks */
+#define CLK_SAI0_MCLKOUT_TO_IO		571
+#define CLK_SAI1_MCLKOUT_TO_IO		572
+#define CLK_SAI2_MCLKOUT_TO_IO		573
+#define CLK_SAI3_MCLKOUT_TO_IO		574
+#define CLK_SAI4_MCLKOUT_TO_IO		575
+#define CLK_SAI4_MCLKOUT_TO_IO		575
+#define CLK_FSPI0_TO_IO			576
+#define CLK_FSPI1_TO_IO			577
+
 #endif

-- 
2.49.0

