Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D697259CA5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848523; cv=none; b=sBPKyuemmzzIXC9eZw/cagKL8EtOQ1NKlqcjyL3iRoMU+GY7FjemlHxpBzkuqisz+tnBmg8N8QYE4XTyWQNIxyNIKkiIcWhUzpCTx645a7qiWXzqnj67k1/3PtcLCPtdHW/Woc2NfuwqICz/ZBTx2FXoG8y7kSM7ABVrZtBQlGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848523; c=relaxed/simple;
	bh=OjjfW5o4vw/nHQvb2Y1n2INOdZ4wgN/cSmHtl0YQR4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5pUUvuAaTbBLwNC2TUtGmJZAwh9lBF+54QjfJNHStpC4s+heis1Ry4/B3D2kGjYSC2Fa428+CJbQZdSEly5U/do/1ZGKvD6oAC/WUY9rDl4bYjOT5WG88FrU8X2md0uPxKPOWAsLlUQbV2LQcufuFhTPQjqJEKPhkdVXlVoA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RCEl928i; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RCEl928i"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddcbe64d0dso22737655ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848520; x=1750453320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2mgtiYfhNYD39L2Q37c064MNMF3bvcCZcMAWhqDZfw=;
        b=RCEl928iPj0qOWFdZ/O49+rtdMf+glkzAozySonivb+ZEyL3lAGxyqgTYTl5wu1vQj
         gp3NYi3Q2N20S+kAlbRa75tqEri8n1H7iXkwdQLWdt7n4WBcsWxwrPDOnWB1Aqr2xCf4
         Yr1tDWlnRskps4BAYFtCgbIx0GeZMcwHF6kKzaXoYxKH/27NUZpROYU4j53sPo2DUJO6
         hoBhSfXDqdqHW+zP5HzEWjMOXGZOQDeHOdnephJCfdySHHmWr7A+yTUfYWFPIbwOXk2s
         8V5InWOOcNyTx+g2n2ZP7vUOtJT0Yu3Nse5g/gxTvbMDvhteD/0iu+a+t/UARX/pZI7h
         yPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848520; x=1750453320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2mgtiYfhNYD39L2Q37c064MNMF3bvcCZcMAWhqDZfw=;
        b=aleTgNrggT/wfYoxvEV8sh5KzkCacK+VMHV6RIEjQIYWx15eNfSkDrU4l2A6ILMb9f
         lDSQD4sh3jFKX50zDvYjFdI2g+eb11Knqm+u3zORFYwVO8XSj8PSiXXmxBeJI5CBJMNN
         b0pCS6wRMVXvNhbx5yGf+8bZFQf/hZBzQnh3p7LWR1BKi0QSbDfJFxKDjo7e4JNPxUKb
         ZWuEcF27/tLPJQ2pNPi6h/ZuBeDQmHUW3lO+yweFfP0KrEO/a4HzaffSwk16VsXE5lgL
         06Y9WsAgZ8O60+aJUAHl/JoI90te6hHfzRaFYkG/b43Lnmv9MXTyoFy7BhP61pQzB+rj
         qJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4n4V1dRO7sGZX6ZB/OoZgHlgEUnbUqxblDTSutT7GoDJg1DYKQZ6bCqF8FlzEGUcI/XiGZagUry4YRk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFQODcCCPt7BtfE073NvrEx8/zX7awGmLUqTabN54U4aqybLl4
	KtCnaFxjZn5o8NWAIjRWwbTfJz1c0xejk7H6GdGPcqvVc3E3xjGrrmM3kfhqePlLjXA=
X-Gm-Gg: ASbGncsWv99eepq2Q9Kfw7AfTQVweU2an9S5EJLnYXRg74qQQM4Cm/Cyi9G1G8Hz6ui
	SLheWb/MTunEVca0gtiq0UbiFSJh6/kIVo27EvTse0nbmYEmFRHYenNkgZzOw8orppNdg/FTFvb
	v6dUc2YgAJqlI1TwbRJ7ZUrJOcxDK9Ey1ckCxlA/+tYq5FImR+AUcSlgum8ikzLF+5L4nsFDJK3
	mYPAqMMgYZ2df0xdPCHf8amQqcnQ1EKe8ZrFoP+MKImEquszZxkt9IUGlsTmlvIBdgg+M/yWaoE
	iDC0ydzjktgVIcrvjkbqOEf5EiOOv4LzTjOL1wavX/KLtrQDUtQMjFV1yWz8kcySXbg1Z6ykcQg
	PADqW6mLTHBlQmoaOBH91nONiFjoxFqI=
X-Google-Smtp-Source: AGHT+IFJnN+44P/6kI3Vi3znat08kUjPZnFLip3bdnFcT5akCn5z9CQ3kkgTwKRZIufa7kf1G/Q2CA==
X-Received: by 2002:a05:6e02:3601:b0:3dd:b523:7abe with SMTP id e9e14a558f8ab-3de07cee497mr18084105ab.18.1749848520290;
        Fri, 13 Jun 2025 14:02:00 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] riscv: dts: spacemit: enable the i2c8 adapter
Date: Fri, 13 Jun 2025 16:01:47 -0500
Message-ID: <20250613210150.1468845-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define properties for the I2C adapter that provides access to the
SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 816ef1bc358ec..f5d454937d300 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -30,6 +30,21 @@ led1 {
 	};
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		status = "okay";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86f..9d6d4503fe751 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,6 +11,13 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	i2c8_cfg: i2c8-cfg {
+		i2c8-0-pins {
+			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
+				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
 			pinmux = <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0f8c5fca975d..34e843bd275fa 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -483,6 +483,17 @@ gpio: gpio@d4019000 {
 				      <&pinctrl 3 0 96 32>;
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			interrupts = <19>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.45.2

