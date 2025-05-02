Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BE6242917;
	Fri,  2 May 2025 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183856; cv=pass; b=Nn8/s6T5ELyjqUKj+0aJboBJdC+uo5JF/mUYEJwJf5XqrQ7liHzw7lURar0X49Ul7Q0sHS1wdnpIeONZcXfOuaaR7derjwFfFqg60jVlnLHDz403/SeRdbkqA6s3sKRtNwR43Z0kNCwhosQlXd84VXPs+yLuMiaur1T6TXmydE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183856; c=relaxed/simple;
	bh=ioMRugEWublB3+wH+i+bFKX5LLNZRZGfDIlj+9/jrZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAIJIsO/XBsvnszJ0dzUUuYiqhpNRWbw2YZypWLY1ijn+h9DyEJs7uhCslGwHF7Ke56PaXyI12ANYYpEuYLm+mBmMz3+3PLMRCk/K6eJQybq/cC9SrTNRAkO9mdS0cvvRWqF/V+xz0Rxr+pcggsdzkm/8SRY4BRfpJIOgUY10Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=b2Ijr5M8; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="b2Ijr5M8"
ARC-Seal: i=1; a=rsa-sha256; t=1746183810; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wuk9VY6+HZcfXuRN67EKlUwM3sJq2okMWDRnwBuDoNSJM1hs4LWAjTwcfPjecsuZl0bNEVm9yvRkMLXdC0HRC6ASybcUQOLCaGIr0UZfzXdfvK3RJ/GZdq0eFlkwVqce8gKE75uDZT1HcgH8jFy/WN6x6/gK3nJhGuoggR7fy48=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183810; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=; 
	b=Lqkqd2o80YHYSQv8kXOWLuPfX7fonkMpFKE4U+t4dhHen4jYbXLvh3isP7We+vG+qMK3fThd8j156Q521Y6TuiNHm8coJ2CQvfJifVZTIe/knWebZhRNtxhTUd8vImBnO2aHH3jrLL3z7Tk/u3nazV7XMsLgK9PS4dNtlQjGulk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183810;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vLcyEazL4MwkJMa6AXHbeFliu5XVPS/TvBzOMo6zWY4=;
	b=b2Ijr5M8fYEB1+Ufw1d+lgXzLkzQFssdAb2gNvPiYyYw2mPV2gL5mL0GJS1XCBfk
	4tYaniJSDIF0R4J1Kst3rnA7OwiPMDpwDc3fTo2FcTPeztLwDgFrFRlxY2W3dyxwwlN
	RPZ45TOy1lK18uLonoRxMqc2QWvTzOTqUL+YC37A=
Received: by mx.zohomail.com with SMTPS id 1746183809886671.6040478081637;
	Fri, 2 May 2025 04:03:29 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:07 +0200
Subject: [PATCH v3 01/10] dt-bindings: clock: rk3576: add IOC gated clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-1-376cef19dd7c@collabora.com>
References: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
In-Reply-To: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
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

