Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A824A054
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673482; cv=none; b=CkkrejEaAJH4w9u4FiSSpOHMVv0dH0Z00CeTNJ9Y3glOkSuFqmPNZ+qgfT9VxuY/ecdzljWVOYXrZeqrEj5phBeOyYJsWAxLT7TrSRZaC0NzMltkPkuAsqGlwl4QMqY0oY+G6rHU9hzlen485intCS7YYHlGrqYJUfi8Xae/x/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673482; c=relaxed/simple;
	bh=3AubRSS+ya6hDCLXEzTEe3Tn70P5HJRPgG60nMUm1wU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=pmaWyYXqwNSz5yFc9CXnD7G2JuqID2KbsGFU8YXOqVo41vrl+JfDIFWWSLwrzzV2EHdBbONNu5SdbtmW3NFR3tQ781FxGKikqD4wBjVqClwkrNtMboi+E/TY2psyb/5pTjmBYO5oLZyyP09+D7ofc9PIg8rDTs19qoEyRLQbcwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=s8yXrf3i; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="s8yXrf3i"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250403094432euoutp01336b61be2c9c0c1a6e81f279b1a7e549~yxckKXgwA0763107631euoutp01W
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:44:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250403094432euoutp01336b61be2c9c0c1a6e81f279b1a7e549~yxckKXgwA0763107631euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743673473;
	bh=kExwcL4NEQLd9uoCfAh/3fBxxncVKWmzGw+zTUsCc70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s8yXrf3iuOKjIv0fW9aJBHdPINw00liYfUFmJ8bp4s5V3oYfYdRdgZMxBB3i0tMYJ
	 AqFVaM9U3aQnIQgLcotNca26GChh/izDS6FFt+auIJqm7sbgFO5MyyINh/f2Yd2QjJ
	 CGhB0/s9wfLw4+Bfgxaj/q3zsp+Q90LQlquokSGY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250403094432eucas1p1a709cb14de37ba09deb02ccc7a75ad73~yxcjhq3Dx2581025810eucas1p1i;
	Thu,  3 Apr 2025 09:44:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 5B.93.20397.0885EE76; Thu,  3
	Apr 2025 10:44:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250403094431eucas1p21412dff1c24aae077fdfeef08e0f802b~yxci5M0W71406714067eucas1p2K;
	Thu,  3 Apr 2025 09:44:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250403094431eusmtrp2ce05d6a2c0dd262453cd9ee154f72bc8~yxci4Q8-q1352013520eusmtrp2j;
	Thu,  3 Apr 2025 09:44:31 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-f6-67ee588001cc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id CB.A9.19920.F785EE76; Thu,  3
	Apr 2025 10:44:31 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250403094430eusmtip23ece497bd59ff01169f0212b093815f3~yxchxcEa20708707087eusmtip2y;
	Thu,  3 Apr 2025 09:44:30 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/3] dt-bindings: clock: thead: Add TH1520 VO clock
 controller
Date: Thu,  3 Apr 2025 11:44:23 +0200
Message-Id: <20250403094425.876981-2-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403094425.876981-1-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmk+LIzCtJLcpLzFFi42LZduzned2GiHfpBs+v8ls8u/OV1WLr71ns
	Fmv2nmOymLJpB7vF/CPnWC3uXdrCZPFibyOLRfOx9WwWL2fdY7PY+3oru8XHnnusFpd3zWGz
	2Pa5hc1i7ZG77Bbrv85nsrh4ytXi7r0TLBYvL/cwW7TN4rf4vwdo2r9rG1ksWvZPYXEQ83h/
	o5Xd483Llywehzu+sHvcOzGN1WPTqk42jzvX9rB5bF5S73Hnx1JGj5a1x5g8+v8aeLzfd5XN
	o2/LKkaPS83X2T0+b5IL4IvisklJzcksSy3St0vgyjgy0abgsVzFmh2HmBsY2yS7GDk5JARM
	JCa0LmQEsYUEVjBKnP+X2MXIBWR/YZT437afDcL5zCjx4+VuVpiO2bs/MUF0LGeUeHHFB6Lo
	DaPE2/enwYrYBIwkHiyfzwqSEBHYwyTx/ftPZhCHWaCXSWLa0rlAczk4hAWCJfbvcgRpYBFQ
	lZjxdz8LiM0rYCfR+/EWM8Q2eYn9B8+C2ZwC9hIbpjxmhKgRlDg58wlYPTNQTfPW2WDzJQQe
	cUpM/XAHqtlFomH3H0YIW1ji1fEt7BC2jMT/nfOZIOx8iQdbP0HV10js7DkOZVtL3Dn3C+xO
	ZgFNifW79CHCjhJzrh9lBAlLCPBJ3HgrCHECn8SkbdOZIcK8Eh1tQhDVahJTe3rhlp5bsQ1q
	qYfE1gWvWCYwKs5C8swsJM/MQti7gJF5FaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmA6
	Pf3v+NcdjCtefdQ7xMjEwXiIUYKDWUmEt1DrbboQb0piZVVqUX58UWlOavEhRmkOFiVx3kX7
	W9OFBNITS1KzU1MLUotgskwcnFINTBIMJS0nbHaf2N+x2el8RNfLePY/Oj35Tb95mTTubPp6
	eZrT3DUp//4sPmYrW7UtuOvg3sefw52mndvuwJvVdrnzxxm5iV/0nMWnl3pyyf92VC7IaSyJ
	iOmXq36/YnnatbMGVne/vuj29Lp5Wuri/I5ADY/Jtz78UTOWeNH4eUfmX+u3py28pm4NVjw9
	oep4RAzr3xWnVm+5wJL928nyYNaFK+Y6v5ybeHPTAmK4Fe/+OnDibsB1l9kfNi7JTP4Q3H7w
	zeqql1t3XuYX0dLZvp5nweb05ay2xyryzCN7Dx6Vf8Zwbz3fiibRe9oXWldNMOq89qrp4Q/e
	TvdHlcunc3xPmZbgFHvE7NT0yMw+wZdKLMUZiYZazEXFiQCj1c1DFgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKIsWRmVeSWpSXmKPExsVy+t/xe7r1Ee/SDR48kLZ4ducrq8XW37PY
	LdbsPcdkMWXTDnaL+UfOsVrcu7SFyeLF3kYWi+Zj69ksXs66x2ax9/VWdouPPfdYLS7vmsNm
	se1zC5vF2iN32S3Wf53PZHHxlKvF3XsnWCxeXu5htmibxW/xfw/QtH/XNrJYtOyfwuIg5vH+
	Riu7x5uXL1k8Dnd8Yfe4d2Iaq8emVZ1sHneu7WHz2Lyk3uPOj6WMHi1rjzF59P818Hi/7yqb
	R9+WVYwel5qvs3t83iQXwBelZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRv
	Z5OSmpNZllqkb5egl3Fkok3BY7mKNTsOMTcwtkl2MXJySAiYSMze/Ympi5GLQ0hgKaPE07f7
	2SASMhLXul+yQNjCEn+udbFBFL1ilDi58RZYEZuAkcSD5fNZQRIiAheYJHatWw02illgMpPE
	pI/vmUCqhAUCJab8bgezWQRUJWb83Q82llfATqL34y1miBXyEvsPngWzOQXsJTZMecwIYgsB
	1fy52c8MUS8ocXLmE7BeZqD65q2zmScwCsxCkpqFJLWAkWkVo0hqaXFuem6xoV5xYm5xaV66
	XnJ+7iZGYPxvO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMJbqPU2XYg3JbGyKrUoP76oNCe1+BCj
	KdDdE5mlRJPzgQkoryTe0MzA1NDEzNLA1NLMWEmc1+3y+TQhgfTEktTs1NSC1CKYPiYOTqkG
	Jo7AraZlVTmL2GJCGf90sgp5L/SsPu79ylG2ptxsx/ONZyfdyOqR7XFiDHiUyc/dq2stWdHn
	pKgTqhj699xvkSe8S18yyrDx73UO75FRLJ8TfmP7rA86vatevlixuy5louhyRtv2vsx5zMfn
	s6Q+y/9Vur7wno3o1sdhF7bfsvqx+3PI9a777u1r1y95LP/KUP/2aRnunP/fX/p1nn54vWjz
	4XcHLpr0hi6odzgh7vTiA8O5S4z2rLGHbnAmzbdmyfR4u+vZDJE0Hb49u4+4MH/QymNkVZp2
	6ZbRO9PLK5fJs2/yfPzs03xz3jct1msf32D+5JsvZP2ZK632abKg361CTi8rs94kcctlvwU3
	KLEUZyQaajEXFScCACVS1eCIAwAA
X-CMS-MailID: 20250403094431eucas1p21412dff1c24aae077fdfeef08e0f802b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250403094431eucas1p21412dff1c24aae077fdfeef08e0f802b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250403094431eucas1p21412dff1c24aae077fdfeef08e0f802b
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
	<CGME20250403094431eucas1p21412dff1c24aae077fdfeef08e0f802b@eucas1p2.samsung.com>

Add device tree bindings for the TH1520 Video Output (VO) subsystem
clock controller. The VO sub-system manages clock gates for multimedia
components including HDMI, MIPI, and GPU.

Document the VIDEO_PLL requirements for the VO clock controller, which
receives its input from the AP clock controller. The VIDEO_PLL is a
Silicon Creations Sigma-Delta (integer) PLL typically running at 792 MHz
with maximum FOUTVCO of 2376 MHz.

This binding complements the existing AP sub-system clock controller
which manages CPU, DPU, GMAC and TEE PLLs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/clock/thead,th1520-clk-ap.yaml   | 17 ++++++++--
 .../dt-bindings/clock/thead,th1520-clk-ap.h   | 34 +++++++++++++++++++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
index 0129bd0ba4b3..9d058c00ab3d 100644
--- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
@@ -8,7 +8,8 @@ title: T-HEAD TH1520 AP sub-system clock controller
 
 description: |
   The T-HEAD TH1520 AP sub-system clock controller configures the
-  CPU, DPU, GMAC and TEE PLLs.
+  CPU, DPU, GMAC and TEE PLLs. Additionally the VO subsystem configures
+  the clock gates for the HDMI, MIPI and the GPU.
 
   SoC reference manual
   https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
@@ -20,14 +21,24 @@ maintainers:
 
 properties:
   compatible:
-    const: thead,th1520-clk-ap
+    enum:
+      - thead,th1520-clk-ap
+      - thead,th1520-clk-vo
 
   reg:
     maxItems: 1
 
   clocks:
     items:
-      - description: main oscillator (24MHz)
+      - description: |
+          One input clock:
+          - For "thead,th1520-clk-ap": the clock input must be the 24 MHz
+            main oscillator.
+          - For "thead,th1520-clk-vo": the clock input must be the VIDEO_PLL,
+            which is configured by the AP clock controller. According to the
+            TH1520 manual, VIDEO_PLL is a Silicon Creations Sigma-Delta PLL
+            (integer PLL) typically running at 792 MHz (FOUTPOSTDIV), with
+            a maximum FOUTVCO of 2376 MHz.
 
   "#clock-cells":
     const: 1
diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt-bindings/clock/thead,th1520-clk-ap.h
index a199784b3512..09a9aa7b3ab1 100644
--- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
+++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
@@ -93,4 +93,38 @@
 #define CLK_SRAM3		83
 #define CLK_PLL_GMAC_100M	84
 #define CLK_UART_SCLK		85
+
+/* VO clocks */
+#define CLK_AXI4_VO_ACLK		0
+#define CLK_GPU_MEM			1
+#define CLK_GPU_CORE			2
+#define CLK_GPU_CFG_ACLK		3
+#define CLK_DPU_PIXELCLK0		4
+#define CLK_DPU_PIXELCLK1		5
+#define CLK_DPU_HCLK			6
+#define CLK_DPU_ACLK			7
+#define CLK_DPU_CCLK			8
+#define CLK_HDMI_SFR			9
+#define CLK_HDMI_PCLK			10
+#define CLK_HDMI_CEC			11
+#define CLK_MIPI_DSI0_PCLK		12
+#define CLK_MIPI_DSI1_PCLK		13
+#define CLK_MIPI_DSI0_CFG		14
+#define CLK_MIPI_DSI1_CFG		15
+#define CLK_MIPI_DSI0_REFCLK		16
+#define CLK_MIPI_DSI1_REFCLK		17
+#define CLK_HDMI_I2S			18
+#define CLK_X2H_DPU1_ACLK		19
+#define CLK_X2H_DPU_ACLK		20
+#define CLK_AXI4_VO_PCLK		21
+#define CLK_IOPMP_VOSYS_DPU_PCLK	22
+#define CLK_IOPMP_VOSYS_DPU1_PCLK	23
+#define CLK_IOPMP_VOSYS_GPU_PCLK	24
+#define CLK_IOPMP_DPU1_ACLK		25
+#define CLK_IOPMP_DPU_ACLK		26
+#define CLK_IOPMP_GPU_ACLK		27
+#define CLK_MIPIDSI0_PIXCLK		28
+#define CLK_MIPIDSI1_PIXCLK		29
+#define CLK_HDMI_PIXCLK			30
+
 #endif
-- 
2.34.1

