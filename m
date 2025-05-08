Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D4BE65
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699516; cv=none; b=o0kqmH+3JvipOSGcc/VrSaopboH+lZquiLlJ1ZB0NxNg0F6Z92aIMTo6OIdGevOPQJuhqV0zb1fdPQ4VshOtEXDEDbipHZKDs7PBz2lvfwK5erS1SeO0nEAxpx+dJ70Uyezo6ulMoEmHopUVEsqNbJbwn+ok/hgY+kgOKx8YIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699516; c=relaxed/simple;
	bh=4+5xC11//k7SELncU7TsWsMFz+BlhXNj6YltonqzUPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YUioVItfG6V50faDJzz83DTEyxY1sUmPqJpe9DacUI/KmcbaMex5cW4lPERu/JdeAIJcNoR1q5/nCQ6kWNeKWAgppOA08XGb8YbKgtKMsK9mHDt2gqGj5U2t3gQso9+lCr57tqK73kWmgPi8Sjxg4eg8NPmBfH+Km6xd41V1BDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=M9Mtw4vE; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="M9Mtw4vE"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 60C6E240101
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1746699506; bh=4+5xC11//k7SELncU7TsWsMFz+BlhXNj6YltonqzUPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=M9Mtw4vEv6bpgKDIz15tCNIk7FQuaUi8d9hjJs/cz6v2WJBYX7otl4N25tkBpSVMq
	 oRqvxoT0hrbzB3v2NJqjXprgRm+kzIXmI3+YcYN8l1gzCDI4R7JUVqQhh9h9VJO+3e
	 6I4DGhlY4Hb1PmwmX8qtvNrq2n1Xhum0YwDZYRWmf62ymKKWMhhi0/MbiXV3sWMVak
	 hy4Md6ac+dlLq10zpVFEFbXemuCEELsiG8g8PcJAv3M5goT/ya13pjjoBBy0C8CTM7
	 UlltC5vQISPz7Kurw68RtoO1+spffHSRmCL4RGd3I/mS7tE251Lsd6xGAOHPUlgy7Q
	 kj0b8smd1XHRA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZtSl427Mcz6trs;
	Thu,  8 May 2025 12:18:24 +0200 (CEST)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH] arm64: dts: imx8mp: Enable gpu passive throttling
Date: Thu,  8 May 2025 10:18:02 +0000
Message-Id: <20250508101802.489712-1-martink@posteo.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hook up the gpu as a passive cooling device to the thermal zones' alert
trip point just like the cpu.

The gpu here consists of 3D GPU, 2D GPU and NPU.

One way to test would be to set one "alert" trip point low enough
and watch the cooling device state increase:

echo 10000 > /sys/class/thermal/thermal_zone0/trip_point_0_temp
watch cat /sys/class/thermal/cooling_device*/cur_state

And of course set the trip point back to its original value and watch
the cooling device states jump to 0 again.

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 50a07c56faffc..dea9342d071c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -320,7 +320,10 @@ map0 {
 						<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -350,7 +353,10 @@ map0 {
 						<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -2229,6 +2235,7 @@ gpu3d: gpu@38000000 {
 				 <&clk IMX8MP_CLK_GPU_ROOT>,
 				 <&clk IMX8MP_CLK_GPU_AHB>;
 			clock-names = "core", "shader", "bus", "reg";
+			#cooling-cells = <2>;
 			assigned-clocks = <&clk IMX8MP_CLK_GPU3D_CORE>,
 					  <&clk IMX8MP_CLK_GPU3D_SHADER_CORE>;
 			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
@@ -2245,6 +2252,7 @@ gpu2d: gpu@38008000 {
 				 <&clk IMX8MP_CLK_GPU_ROOT>,
 				 <&clk IMX8MP_CLK_GPU_AHB>;
 			clock-names = "core", "bus", "reg";
+			#cooling-cells = <2>;
 			assigned-clocks = <&clk IMX8MP_CLK_GPU2D_CORE>;
 			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
 			assigned-clock-rates = <1000000000>;
@@ -2302,6 +2310,7 @@ npu: npu@38500000 {
 				 <&clk IMX8MP_CLK_ML_AXI>,
 				 <&clk IMX8MP_CLK_ML_AHB>;
 			clock-names = "core", "shader", "bus", "reg";
+			#cooling-cells = <2>;
 			power-domains = <&pgc_mlmix>;
 		};
 
-- 
2.39.5

