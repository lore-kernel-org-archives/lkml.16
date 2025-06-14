Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115B92E7F3A;
	Sat, 14 Jun 2025 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924918; cv=none; b=TNAHUi8jM0nymyCJs84bSh0KRoqz7MqRiugNxvLjmG6A1fweoV3K7S3N9jNnka4XAf4LU1jURlIRUbgOKJ/EsvIIPXDJ8nSVhtNldOx0qreixNTonbFSRVu6clw0KwuIJCG7MQ7KFjrzvO9zA8YcUcf0ERsYC9kGck/EUNJU7sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924918; c=relaxed/simple;
	bh=EFL42CJiaQOiXrGt6/pdixsIsoXZFU3sPb2V2UplPlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suobZ2dQplz99QN2679qQRzAQXGeD8bThhN9Sp+ez+EEEskR93ZG99CFYdiP33f0jWhCjszSb/M50fIylJ4qByCs4pE6fcH3cQr1zNuw7lZrbT6H+1PiW+Jmju1SvwtcuFwyu10e7cWNcMFhFA+mOXnjMXbWdkD2OepT2Alo1qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amPozZR3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amPozZR3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so2761123f8f.3;
        Sat, 14 Jun 2025 11:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749924914; x=1750529714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0Bs6c37/y07phySGIaMXCLcTr8q9NO06Gh+4XGoKB8=;
        b=amPozZR3eKow8NQK175BOdXBAqQlnwK3aReIuhcQYBjBL5G4WPknSnnbwfq18FN552
         xQGWU0s66I8Aig5iddxU5fohzujf94ru+lXSqH9ehRqNWDX2m/ejjSVYoZR4oSFHnjW8
         ukZ/Tc0SxZhHKAgipuU/f3FCLOANK1KSiRfMrbZSWIsHQwqvkp0yHgme2iquNdGe98to
         HwKB7GGwjsMasGFRigpKS0MOrI12TIQdwWYHIcWm5KamvXJvdlI71JGCdEkQU0MzmQpv
         anpJl4awDjZNKGfNJkHy0BomhPFIvKzYhnwGRRjChdA5chJe0yqWlf+I6Tz9j0HeogJl
         749w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749924914; x=1750529714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0Bs6c37/y07phySGIaMXCLcTr8q9NO06Gh+4XGoKB8=;
        b=v6bffyWfFjC2Y1zQDubronC+zx/EYMGsqbmXEEHPY2YjgNms4sF3SLwrLKRg1M+FX9
         3Lwmzvub/ucEb1UTyYmE2BKfrfVS355etkKmcZlWv8tL9pR+ekS2NlTWm4TC6kepsTYW
         o2Ty+4G0M4/iQmyx0KlbdQi/VpE468l/METW7TVFQdRRKdNs/WMdhO6g6p3Cnt3N77j/
         hMaZPl+Uin9fQGDFW4Q1JlTl4sfLjiHtOKZrrMva8FczHMhsDfvLyKWCvNcN9t1N9Bzu
         jYLz6WuwOTfICCHQGMA0TRzQhO9RgRT0S9xJ7zSlb/e4TNxzZf5phosiDfBY9Fhtp8vy
         qsDw==
X-Forwarded-Encrypted: i=1; AJvYcCWxlqV4lOcbr1blzPyjKGcuBr+qSTIoaV7jh/XIuLrdBwCTraI5ihR2sKYitAdEY/03ILr7wgfFkng5Bto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy99ys0OJ05JQLsT/omQ8JGg/NczJb6Qge4XqtCwXlTwIciY/e8
	OTVwjbGbVciMPwsO5U57E/l+5GI45gv3F9JUD3DTjq2RLaISb8rw516x
X-Gm-Gg: ASbGncuh0IhncpNuldcfE5ncsOkwcKkmmSJRRpysnLX/BkhT7saSwVvDk4XSSXgYySP
	DpSjT0KYqXWU/hZtRccZu0NUBwYA3sXkxgOsw6uLUjygm17MQbKtETuEP9KJKmB/IaWpO5lLH/w
	ts5yYIG1Anmh/6nExA1GVn9WsKKr/jwcXaF/uF82n0hoYIdtGZ9lJBR0RVJ6t6vq1ngJ3XqxUnc
	qpgkz/zOFy+LHiybNqgg1Xs9bRFG4ekFtdF6LUSNiWa7eKkLqW7XnD6lJo7fT6ybiH11+DwCHB7
	G7ai+T675CnE3TFByBOGL66WcoKAVk/s/nf6Cj5FY/q4CZVvLyjNaFRHQZGbRqQ/zYOwFKZ2yOk
	v2Q==
X-Google-Smtp-Source: AGHT+IG5rFauCOueVdM2iXEQWzdE2SfWJbIG/lvF5F894+FF1XVgY2tgRSBxiioBxzB/96rT9zK44w==
X-Received: by 2002:a05:6000:1881:b0:3a4:e5fa:73f0 with SMTP id ffacd0b85a97d-3a572397846mr3775795f8f.20.1749924914431;
        Sat, 14 Jun 2025 11:15:14 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm88195255e9.4.2025.06.14.11.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 11:15:14 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 14 Jun 2025 22:14:36 +0400
Subject: [PATCH v2 4/4] arm64: dts: rockchip: add overlay for the WiFi/BT
 module on Sige5 v1.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-sige5-updates-v2-4-3bb31b02623c@gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
In-Reply-To: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749924902; l=3898;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=EFL42CJiaQOiXrGt6/pdixsIsoXZFU3sPb2V2UplPlE=;
 b=YfwVvAfQQ0bYQttXHGd+f/0IXgDcOU1tVo0HYaR34VuKkZq7NKdZWXwTmc/z2ybOD877W5oXS
 EjW7JI6YLZYCjDF5xMJJ4cXS3R2+/oITH6nGhdnZRpmiBy5Q6OOoLx5
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add support for the Broadcom based WiFi/Bluetooth module (BW3752-50B1)
found in ArmSoM Sige5 boards version 1.2. This includes SDIO connected
WiFi with OOB interrupt support, as well as UART connected Bluetooth
with its respective interrupts.

PCM support for Bluetooth SCO audio is left out for now. It is connected
to SAI2 in M0 pin mode in case someone needs to enable it.

Note that v1.1 boards used a Realtek based module which is incompatible
with these DT nodes, so v1.1 would need a different overlay.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  5 +++
 .../rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso  | 49 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4bf84622db473696f64b157ba94560f476d4f52f..26533be1dd865972b681d133aad6fbbbf4e64bce 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -143,6 +143,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
@@ -225,6 +226,10 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
 	rk3568-wolfvision-pf5-io-expander.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtb
+rk3576-armsom-sige5-v1.2-wifibt-dtbs := rk3576-armsom-sige5.dtb \
+	rk3576-armsom-sige5-v1.2-wifibt.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
 rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..6985c3b22ebe4efcc7e7b7370f527838a557cf2b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * DT-overlay to enable the onboard WiFi and Bluetooth module present in v1.2
+ * boards. Note that v1.1 boards use a different module, so this probably won't
+ * work there.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&sdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+        wifi@1 {
+                compatible = "brcm,bcm4329-fmac";
+                reg = <1>;
+                clock-names = "lpo";
+                clocks = <&hym8563>;
+                interrupt-names = "host-wake";
+                interrupt-parent = <&gpio0>;
+                interrupts = <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
+                pinctrl-0 = <&wifi_wake_host>;
+                pinctrl-names = "default";
+        };
+};
+
+&uart4 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clock-names = "lpo";
+		clocks = <&hym8563>;
+		device-wakeup-gpios = <&gpio1 RK_PD7 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wakeup";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-0 = <&bt_reg_on>, <&bt_wake_host>, <&host_wake_bt>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};

-- 
2.49.0

