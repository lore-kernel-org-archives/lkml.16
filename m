Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585491DE2A0;
	Tue,  3 Jun 2025 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970090; cv=none; b=hE+VDpZZyA6t/JYl96hI4KMCaKvGxqnANmxNekGtnKd4XqfedLsJkdjhGWsTYmPJvOHi6jpvIcrleheraYWvhhQvtH1QdTcfgRDEhIDd9qR2GHgN84b0RZXtYpeUR4h0fR1PcbMqZo8lF9RHaRqUsjnOoyH+gZDHOCPFIJPwJQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970090; c=relaxed/simple;
	bh=/jxBFaE9CUNBmVgOuhhenfDlDH8KFQDwg+N7a0wwgYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y2K/MdFr3mNr06AMV9/iiVyPMZs8u47NgMwkrJ6XimHyvVUQ49IR5joBGLJVpMi+s2oKf0OtlFCdNJfH6jBZ0r9IM5K+1wqDlEJ40AjzBZacZMDOxUvVkRZbBmgwYv8FxKCm7G6oh3ouZMipw6Z7DRIqvgmKEJ8ec3yYv5NKwxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbLQpLn3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbLQpLn3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a367ec7840so4103244f8f.2;
        Tue, 03 Jun 2025 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970086; x=1749574886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+Y2+/5bQj+UyWYgF6XPRVH1n6sz9KuKz5tspqNX/HA=;
        b=GbLQpLn3NE2RAYDy5q2XQSFk8FBlmfg+wKOBsxOlp6UF1REq5yX/8v4ESJwFcFQNfo
         OkpLGOIDPEd1uzCmiDlpjRtQV/AXdN8WwhFgxZ6b9uIsbws3EmOsXHJ0+wjTOFkbJtQR
         32gFV/iyL4s38nu1+mVQiri6+hRZ/sYGEPvOa4iQJOVXVmxk5B74xzvd1IDiXsZcNK6T
         Oa3EdrPToKesrFXwCvIwELBMucOP4APc+rw9DonVePWB0yNRBJ/CSsy0yRo4rffnH97w
         3JRRyIolq6JxGYqqb/6/SFlGVdhGEcLDLsYbzx/cBEZywRBOZqg1p0QLe8aMCTxNpThX
         ocPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970086; x=1749574886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+Y2+/5bQj+UyWYgF6XPRVH1n6sz9KuKz5tspqNX/HA=;
        b=wQS38Xg1UNiyopRigmjV7lCtU0OP5aduDkqNHjGbXg0QFTgQZQgruS0d7Ov4nuPrcS
         +d0vggc6XVcUCAJYOJ72YSD6ej6vjgrrz0L/SCSQ8ny49+ZaeJ2TiXiQx7I6vfLPfBHX
         brOa2keuY6KnS5ZzyIJCPX+pqIzKg2htiAzGCRnV1ekVpyjUTlCr8Eu+F22ishE617AX
         YxZBa3/s6EdAM8Ne5VxNtJ8qeu9hQjk3DOYmrjDnSWwyfSOx1DdkhRw39W1sA0Js+xSY
         KVwdXNlihFXJUD6pzyk0bgsDMSnH79/DxoLpITfY5O7gTgJibbJsK0RcxXvUWolDFNhG
         61Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUZF77FnjL5rYSiRZ7uU7Pg4czMWHnwTxsV98XROGG90LQKXhc5QsiGbhpuCnwCnBKMOB8TMG396tHKVZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVLd5JF/7pTClLBY5OKCcx3UTcZhY9rBpGCQG4w4Ahx71pI5ie
	paoW3M1cjk15aJFiXTzwrfNjk9OGnAl5t2ZCldGlE1o+iVFuGjmAwqZUDcEdEGV40I5bcg==
X-Gm-Gg: ASbGncsgQuk0J36F/Wax6hLGFOHpzCpBxWI5JYxjFu5I1J6mpYz4t5TSs7JFgVz9mVD
	UMUcJpEIqdLL8zUpL0mdSh7yrvQPvBHl0vShC2jJ2WuJ3ldYEVpnjC0s7RD/t2pscSoZxkC1tKb
	BNn0dcRF5PnhVQzPtmYV1K3NRqr/I8fiKAj/gFEK1UCF6ZvLfmekZ9echZWqIkhpkIenBP7SNHg
	HapoSJGHIUj02jt1EDfXNkOW+XXg+1qMel4Als+KHZlB8BNAmcJshIpyVYKui+JNeviW5u5HO03
	Nw9x3Sq9ukoTucadp9UtJYRz04Wq0Q8AgpjcBSK9VRWGZaN3Ep1ie6ZJLHBsp3/1rz3Hvp6S3ap
	otw0z1CIBsnWO3HjdYrx60X3Ajg==
X-Google-Smtp-Source: AGHT+IEd7niGDk209e3NNIRllNpceyj2oXoBqCcB0+aBdqpp3KWCFcGQ39RE+qgrAghnytpTslgwAw==
X-Received: by 2002:a05:6000:178e:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a4f89dee77mr14367562f8f.36.1748970085470;
        Tue, 03 Jun 2025 10:01:25 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:25 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 03 Jun 2025 21:01:14 +0400
Subject: [PATCH 2/4] arm64: dts: rockchip: enable USB A ports on ArmSoM
 Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-sige5-updates-v1-2-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=2102;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=/jxBFaE9CUNBmVgOuhhenfDlDH8KFQDwg+N7a0wwgYU=;
 b=+XtNr+B1DUYIB9wG66JOoiJYYOzk9WZbXMt5Xzp3KR2kUPEVA7/v7pGuOJEbTcwg2ZHehAxRZ
 EGLg8ZQX4V2CoMknzSdSaUy3I7XFmFOzUvZWC1+iv5j3F0QJWZs0wLl
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Enable the two USB type A ports (USB2 and USB3) present on the ArmSoM
Sige5 board.

Both ports use just one xHCI controller, with the USB 2.0 signals fed
off the same USB OTG PHY through an onboard hub. VBUS of both ports is
controlled by the same GPIO regulator (VCC_USBHOST in the schematics,
toggled by GPIO4 RK_PA6).

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index d9c129be55a0d997e04e6d677cdc98fb50353418..7ce1fb1380b0863c902fdd9cbc7454ee6011cf92 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -205,6 +205,24 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v0_sys>;
 	};
+
+	vcc_5v0_host: regulator-vcc-5v0-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_5v0_device>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+	};
+};
+
+&combphy1_psu {
+	status = "okay";
 };
 
 &cpu_b0 {
@@ -757,6 +775,12 @@ pcie_reset: pcie-reset {
 			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &sai1 {
@@ -798,11 +822,25 @@ &sdmmc {
 	status = "okay";
 };
 
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc_5v0_host>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
 
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &vop {
 	status = "okay";
 };

-- 
2.49.0

