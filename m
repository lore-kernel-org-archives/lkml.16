Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C2B244E98
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199706; cv=none; b=CFYV4q9vEvQlAT0MC6RTA6OmGByoIguSjwr0GnOIacsfpt0oPUgPaFGe7GbEctlYtERlX1w0LkNOMi67cjno+1V9jqnYmnHcg/z30pQCWdbG6bAXiPdnzLRoL2RkOQ7paqEMY9rQUTUN1AdwkCSl9T5frnv4EFxGkYFPKPxcUbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199706; c=relaxed/simple;
	bh=KAhecjI26XiC6Rkzh5V+N4uCqMajbLT/16ybq2CB8AQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X3UxPaDQvWwoZZW3hJ1dMTl5lFRrDU8AT9H0etuOROr5oQyfXrIGsP0emFwf6IHZJoNzd7wPc85dzqBlKzq9XdnTR+D6RZ4buuisokDz8XH8RUVgU8H52duqaeos6J2O4knqSVJ7/eUsmPViRghS8mwg8RI3qHyZuQyHspG9dRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JzjZwR3J; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JzjZwR3J"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so696573266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199702; x=1739804502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zy3IZpzQXEf48BiX24sRog0zkDKc85etGewBmE/vSM=;
        b=JzjZwR3JpvLBny2gBVPIvGEgJPzim6SWO6Ae/EgwBZfxleXmKrnIbvm0087KgJNltV
         GIc8i0wbKuUkOF128S5c9FzBmufDnl7YH+eYToZjDkR+t1vWv5d/1dLwPbAaJgUdPVPl
         7e/xCsFYGVV/YrYn+QaVGmyL2uNrX2MCk4BeD1cBKPK1Guaj38lB4opJKX9KDE7mg8hF
         Ui9x86zBCxLZmmVnhhLfJ1s8RyZ2LfIzy3NtU4WwyUGfXBp8HlfEzizxfGFKIYmOy9kl
         nWtVnFJxcjCDH4XAmEi/feoKB2ntLveM+U5DbfdiDWY7BRrA4gMaV4XAcuRp1084AmoE
         ThSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199702; x=1739804502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Zy3IZpzQXEf48BiX24sRog0zkDKc85etGewBmE/vSM=;
        b=PHjpfWp2hYaAv861kpeN9kzpGkbtWgsrlUjsr5Bwziis8LPVpwFUVJHmTbS8JgQ7jt
         8gUG7uTVW3NTNRtibAqDapT8LChmhk1tvr2QrNKGrQaRU3m90isUNc77kUiYnuv7CNIQ
         APJp93Zb5el7ozv6K8DfVoofi+Xo/f/ZutEsLZjKyWjVMF9+V/6T637nszi30cHo5LY9
         xy0Ym1OpBtw16C3ubncRDAHqZyiN+X2sglEr4PBhrKB3IMaqbwiCorCDYE8UpWv8HGXc
         Sq1Pa9umSLKjdgJpdP8FdLbNhZ7GpCg26qi2NBLidVv6nRvI6aA6W0PCZecZ2zec4CRL
         zlow==
X-Gm-Message-State: AOJu0YxuknvgVdoEEEFtEg1L5cSKnD3dil5J8q93eTJ9BMPVRX2POQ5u
	9Rpc1GgUP/yNkjMzP5K6HlR6jazgUFG26EGHGrIF6H1G2Ngpuczv2KfbyrtNpTk=
X-Gm-Gg: ASbGncuEQDASzXKmu8rA+KGMK3oejQNqOHZkwh3VV6k6cZ7aO9MrUpH3wx8uN0x9GmT
	wRZ+GW6eZY2TSY8oe/IV3YI16qibRfc+mkGSdnuFp4vm3aK+IlpLCf6P0qty7j7m6AjL4D057yy
	uAcYpVjNiJ8TAbhMNNurbBsgO1XxslnmUiXO0i7HQpwXc0QoEoMt3UsK/AABz9aIDPbGEl1qv/y
	EJR7j+CyV5fCCcu64J0DhGhM6E1ek40SevvQCvVL5YcaEMNYjG+PzAY0k9mXe4KXaAly8h+kNqy
	0UxWxSIcvGcNWUtIY7grFgh6rHeQ
X-Google-Smtp-Source: AGHT+IEbHPd1oSXP7eD15imjc/jvWXdr6BpOIe7NB5TG+hcbBq9WIktQHOMG5ONOKZqK3lCo6o+VLA==
X-Received: by 2002:a17:906:110c:b0:ab7:c3c9:2ab1 with SMTP id a640c23a62f3a-ab7c3c92cd1mr373031766b.50.1739199699671;
        Mon, 10 Feb 2025 07:01:39 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:39 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 5/6] arm64: dts: meson-gx: add audin support
Date: Mon, 10 Feb 2025 16:01:28 +0100
Message-Id: <20250210150129.40248-6-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the AUDIN audio device to the Amlogic GX SoC family DT.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   |  8 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 25 +++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 2673f0dbafe7..594d7de606ec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -304,6 +304,14 @@ aiu: audio-controller@5400 {
 				status = "disabled";
 			};
 
+			audin: audio-input-controller@a000 {
+				compatible = "amlogic,audin";
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "AUDIN";
+				reg = <0x0 0xa000 0x0 0x308>;
+				status = "disabled";
+			};
+
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x84c0 0x0 0x18>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index e2026b7aa03f..2db6916684fc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -94,6 +94,31 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,audin-gxbb", "amlogic,audin";
+	clocks = <&clkc CLKID_AIU_GLUE>,
+		 <&clkc CLKID_I2S_OUT>,
+		 <&clkc CLKID_AOCLK_GATE>,
+		 <&clkc CLKID_CTS_AMCLK>,
+		 <&clkc CLKID_MIXER_IFACE>,
+		 <&clkc CLKID_I2S_SPDIF>,
+		 <&aiu AIU_AOCLK_DIV_GATE>,
+		 <&aiu AIU_AOCLK_BASIC_DIV>,
+		 <&aiu AIU_AOCLK_MORE_DIV>,
+		 <&aiu AIU_LRCLK_DIV>;
+	clock-names = "pclk",
+		      "i2s_pclk",
+		      "i2s_aoclk",
+		      "i2s_mclk",
+		      "i2s_mixer",
+		      "i2s_input_clk",
+		      "i2s_aoclk_div_gate",
+		      "i2s_aoclk_basic_div",
+		      "i2s_aoclk_more_div",
+		      "i2s_lrclk_div";
+	resets = <&reset RESET_AIU>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
-- 
2.39.5

