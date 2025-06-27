Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364642E3395
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034205; cv=none; b=a7+NlEGKuv0vScD8nSP2jGTmbM8pStjEbRhEwL8DW20B80TsfEeIwiewTuLLOpyed6zT1G3DuQrrWJ0f1HoSACxRaGDlR+6+3q7bYbkdkwwyffBqFaBivtggjGSxQLYk9b9NZRJRNpUV6E8go+p9A49qCACz+zgQtsjIxGKyUFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034205; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKVNOAZWVi2uknomEbtuZKqBSaludoGBFKaS23ewMX1rQJm8M1A+eP/VRj4B9lZjaruckBbqOokd+pHq0msGB+CuwKlYrF/Ix0e+9fliok50Cb98cjAMHag3kKfOP+pAWb71b64rS7Sc2BOGahKTyVcMJqk3VvkaEY+z52UIFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bo3+biOD; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bo3+biOD"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d3dd14a7edso306736585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034201; x=1751639001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=bo3+biODD7LGhBMJw9JZexn307AmIA2AtUnAF5Cjl/lX8LYCg5ZkdIWaU4QrG7VtoU
         kHjewxGKCQ0YfPzX/9YwY0H8HmFsQXGIMcCfgfSYmgubfPoN+1iejl6NxOqQUYQqmY1C
         Y3vqwah+1m/vS9f2ASOFSBkhPJA+x9eAIXCCNaOZH/g8dTxICtfkQ6gwtlqpxW9sTQWs
         PUeugbP9/KDQSKWMxtgfv+8PnONY3zFt+s4QievGN8KAn1IWZNxR1J75wyI5HV/d8sTI
         KHZR4ObeKzMg0bJ6C6U1/6xtcd75TYRLNfQDtYlwR+uUWeTjMVnoHnQ/tNLJUZZCqwN+
         L3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034201; x=1751639001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=NbF0jn7KqmmwdwnOn0I8NYn3kGEu+jJG8rw58wG50YVtd/Yjsvle7bxJmXAdRuTrT0
         khxFltmpbAOwFN5tGUcjSeh39iCiUHIE57/LDZCwaDORjU7Cw2WpQPP67rje+Jf9m3e3
         7/J9YWfU3UCvtuf1Zu/dAU6IKd3IU+CAhjH/sIug1b6L4a7vHA6frwt9fE68zw26woTb
         p7suuzP9cVhbhvJlFcoC8mO4SedxA55/m/mfJiHKyxb0fJRhSN6CHNjvD5N5A9Zdkuhd
         xdSF9VJOhJjxcokn+k1bspExYm4qfyq47TeI+g0RCQVzERT3A9RYuonGIWeR67PBtP7H
         h+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVwbua8PEK1QIMG+79/e1f0Q0BMMXD0UHXk/HEyXixvUH7ZPmn3gc9gDyocAxNq7hDJedSjGlqIwnmNMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2PVsLgvogK0pjJ9HqIagryJGEVFt64vJXM4id+QgzFLvBxhGu
	ChJudKDa9qpC7IQo+iNqKtftTYXRKFraK7ysAJMrdgqH2dWgmgnkoSYGoQboMbD1MDI=
X-Gm-Gg: ASbGncuziqdShcVullgoBoCjxqOjICFUeSPoZTj4cLAs593TkEFj8GWk40c6otO7H/X
	WLal3P4cfGBxexe7ODCmIDYIFX5wtitcr5wZx7j6hG3POStwi7+fdSVYXgQNHNBRaE30/hjMv2Q
	UFfJNgnM3cuSWwThpVF4oeoQUewlQNmWhH0eA/+N22RFZ+2FEsUC+bJTzvg2vH6Wdx5s6MM3ins
	ih1vNpQsOlo79Ycj/vvlOIOzkJv4jT3LUqduEbto7uE6/rp4E9zHK8ai97paSnJpGwnvpEbKbn4
	bDSMehtDClZtCrhJZOKQIoFEEQgnN558PyARE5enb/noX9GBOJUbxNqSeR71Uv8OJ8qdbgCviwq
	qN5mp8AJp8vFIknraPiZYXE0uel2uNzUxKIs=
X-Google-Smtp-Source: AGHT+IGbR8LfUszD/aEIdWwkUQ61eynSIqFyVoyDA8206vPOUxXJejP9vRZ618fRX8/VdY8/tjO/YQ==
X-Received: by 2002:a05:620a:198b:b0:7d3:9113:7902 with SMTP id af79cd13be357-7d44397f5e8mr481566285a.38.1751034201091;
        Fri, 27 Jun 2025 07:23:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:20 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Fri, 27 Jun 2025 09:23:05 -0500
Message-ID: <20250627142309.1444135-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
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
index fe22c747c5012..7c9f91c88e01a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,21 @@ &emmc {
 	status = "okay";
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
index 14097f1f6f447..a85239e8e430b 100644
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

