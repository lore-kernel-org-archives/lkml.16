Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch [185.125.25.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8672505C5
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417345; cv=none; b=P/BdOaZlQQcc/DO15jgfMALMtg+XoMNQdncqR2IPoZLk0C+9H0TJI0N9U1TM9C28Bcxn+nBsaTyW6Qep7IsRYjb6IwA0Sbkb3ddRCtJGh09OuOLZJaGeqj8xMePgXjDaqEHLyD7uWSozAYZOqsI6RhU22ebdlzDG1I2FaKcsIrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417345; c=relaxed/simple;
	bh=kzzMtAkAvsHpI2Azo0/w0vdO+w4bqLIgLNTR4fkASTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CpXjguHHaotr5j28O/VXmk0OwiFY8+WaIC6HA0EsjcdCvwG66RWtkMXrOUDIgGOYUWDeJ+d9dZxUGSdrUPbOQH+4D+Pmo/bH1vWOZez7sb3SoHpiwUc/zGSh4AU3T0xifoBD0UUFSmd5GPaJOzJSlUAVeTGNxxrSS65RvmH0tE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZzYsb3nGKzK1R;
	Fri, 16 May 2025 19:26:43 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZzYsZ1yphzSdm;
	Fri, 16 May 2025 19:26:42 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 16 May 2025 19:26:10 +0200
Subject: [PATCH] arm64: dts: rockchip: support camera module on Haikou
 Video Demo on PX30 Ringneck
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ringneck-haikou-video-demo-cam-v1-1-fff23160395f@cherry.de>
X-B4-Tracking: v=1; b=H4sIADF1J2gC/x3NTQqAIBBA4avErBswyf6uEi1MxxoiDaUIorsnL
 b/New8kikwJhuKBSBcnDj6jKgswq/YLIdtskEIqoaoGI/vFk9lw1byFEy+2FNDSHtDoHWspmk6
 5uXW9gxw5Ijm+/8E4ve8HLcFN+HAAAAA=
X-Change-ID: 20250516-ringneck-haikou-video-demo-cam-420685fb7f9f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The Haikou Video Demo adapter has a proprietary connector for a camera
module which has an OV5675 camera sensor and a companion DW9714 focus
lens driver.

This adds support for the camera module on PX30 Ringneck module fitted
on a Haikou devkit with the Haikou Video Demo adapter.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This adapter is also used with RK3588 Tiger, but there's currently no
camera stack at all on RK3588, and RK3399 Puma, but:
 - 19.2MHz is not achievable exactly, so need to patch the driver to
   support 24MHz for example, this will come later,
 - The camera clk is on an IO domain at 1.8V but configured at boot at
   3.3V, and until the IO domain is properly configured, the camera
   won't receive a clock. Based on the probe order, it is possible (and
   empirically very likely) that the camera won't be detected at all.
   A Linux kernel solution was attempted multiple times in the past,
   c.f.
   https://lore.kernel.org/linux-gpio/20230904115816.1237684-1-s.hauer@pengutronix.de/
   https://lore.kernel.org/lkml/20220802095252.2486591-1-foss+kernel@0leil.net/
   We'll need to figure something out this time as I won't be able to
   upstream camera support without it :)

To test, install libcamera on Debian Bookworm (or more recent I guess)
add a file at /usr/share/libcamera/ipa/rkisp1/ov5675.yaml whose content
is (remove one leading whitespace):

 # SPDX-License-Identifier: CC0-1.0
 %YAML 1.1
 ---
 version: 1
 algorithms:
   - Agc:
   - Awb:
   - BlackLevelCorrection:
   - ColorProcessing:
 ...

then call

qcam -platform eglfs -c /base/i2c@ff190000/camera@36

While this is running, control the focus lens driver with:

v4l2-ctl -d /dev/v4l-subdev5 -c focus_absolute=150

and change the focus_absolute value to see the lens moving and the focus
change.

I'll try to have a look at libcamera's config file so I can send a
proper one to the project instead of this dummy one.
---
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
index 7d9ea5aa598486680191d52e4c87af59f7b0e579..1e3f43bbe1734e5c88d1f76f8f7a545d881df88d 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
@@ -94,6 +94,15 @@ video-adapter-led {
 	};
 };
 
+&cif_clkout_m0 {
+	rockchip,pins =
+		<2 RK_PB3 1 &pcfg_pull_none_12ma>;
+};
+
+&csi_dphy {
+	status = "okay";
+};
+
 &display_subsystem {
 	status = "okay";
 };
@@ -135,6 +144,12 @@ &i2c1 {
 	/* OV5675, GT911, DW9714 are limited to 400KHz */
 	clock-frequency = <400000>;
 
+	focus: focus@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0xc>;
+		vcc-supply = <&cam_afvdd_2v8>;
+	};
+
 	touchscreen@14 {
 		compatible = "goodix,gt911";
 		reg = <0x14>;
@@ -157,6 +172,47 @@ pca9670: gpio@27 {
 		pinctrl-names = "default";
 		reset-gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;
 	};
+
+	camera@36 {
+		compatible = "ovti,ov5675";
+		reg = <0x36>;
+		clocks = <&cru SCLK_CIF_OUT>;
+		assigned-clocks = <&cru SCLK_CIF_OUT>;
+		/* Only parent to get exactly 19.2MHz */
+		assigned-clock-parents = <&cru USB480M>;
+		assigned-clock-rates = <19200000>;
+		avdd-supply = <&cam_avdd_2v8>;
+		dvdd-supply = <&cam_dvdd_1v2>;
+		dovdd-supply = <&cam_dovdd_1v8>;
+		lens-focus = <&focus>;
+		orientation = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cif_clkout_m0>;
+		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
+
+		port {
+			cam_out: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&mipi_in_cam>;
+			};
+		};
+	};
+};
+
+&isp {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_in_cam: endpoint@0 {
+				reg = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&cam_out>;
+			};
+		};
+	};
 };
 
 &pinctrl {

---
base-commit: fee3e843b309444f48157e2188efa6818bae85cf
change-id: 20250516-ringneck-haikou-video-demo-cam-420685fb7f9f

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

