Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCDC2E92D2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947524; cv=none; b=ilxgoK3+hqrF8ZjsuDPVWiiKBZuamMy1VJAzGlxclFSuGUHqENXmGWYWwynxR6+VOi6qBoBi1l0aadBbKHre2dfFQH5dzraYgv6CEhImdY9WT3CCZn3zOuiSzh9YTkS7JQwwCEDyRHdjbQNA4n7QIFJEPy5s7DpvXkEUp3wFzz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947524; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q21vl53e3/s7NGlwI7O8PGyA6GnKkz8RN7JWtSzbiuAjuS1CNKAaffofe9Fv9168Y5JBC7HvazvpXyWycoAtJhcl+wdhxAFidhjKpLmXiJgzM1BVInBUjTYyDmBBup3MzV0uX/49ro/SnNnlEl0pym5gli0Ro5AU+pQyFck2Hiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AI/QEUJc; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AI/QEUJc"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a58ebece05so10980731cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947520; x=1751552320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=AI/QEUJcK0DkAmq93csorudXKNtImvZ5rgYUkouKVssbGhpeKdVKLLBH40VG1adE59
         fe0H5D5v0ggM0KQqXON8nRscf3Vh0KyvOUj2ZUDm34iMVDgq3Fz0WWtd5hxcyqWBT+fQ
         cs7EqdVSEu/jZUeJV6mksA+If3k/Y3nE1n6n41bZlaLDP9P/1ljp85sdr6rEXJkBSwtY
         eh03yhTXXCgP7AnvzrjruE1KVJNLuJoCyqSYnQ6SmW8AFmWQvfuW3zGsqngYfJwzLNFr
         0J1zgH8zqdU2nq3r7YWtAV46glZpfSKhghyywWUtTl8+vqItzvNNINsbWnj23fQfsko6
         f0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947520; x=1751552320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=FjZpw+CyE1ddeafyi7yL1J39Iwet/LiWbwm8xENvQO95NTTq5DsDHCU2wiifS0HQBu
         cUSSBJdYylnXjfMIPFcMT5KBan2lgSi4alhjL9iYcajX3tOIbpReoOiGWc6g2v8VP5pc
         PaFZITnvImmrLevMtioG1MNQBOYfUUG1Dxqh3uax1Fx2/MtYE4XQzZMSW1OWEE++TPHn
         O/tw0NDfQLc3/lkQN2QfPovrwN1ASKSS6qJS99pWbpA4ptXIEuUVseaCQJVIHS24xJAc
         ce1WT2i1i/wnr+y8HKWbjTTgQopbvgDsG4qOrlThdvBPKwbRGFwXioCE7+zM7+bkxzp/
         ev1A==
X-Forwarded-Encrypted: i=1; AJvYcCXxRMHBE1gXL9qxAfxamhoMBtc2W+8siaJxdUUtx5zyPpViH8cdw6t/IN/Az937V5+YkS7iS6H76VLLXVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/hjRVQxCvXWYORZ6s/QWhCmLX4ih5EOyREZxTuAZ5HTyFWBEk
	KlhBlfnVAL/pQVD59cNQuHtVKyISCleZ3fnE/PI3zSJtkWU/uDne6UTewqnGe/vF36g=
X-Gm-Gg: ASbGncuqwh8qbg9phv3HwBW8I4DJQ8P3Z2RbhMvAih8C8pnJsX22aMhFEno8D704d2O
	/60ukbFVxsSpHIeUuhot5mnEna3oaaK+UWAfBt6xfuhkUVOVImyHQ52FeYbgApw72sShC9Ezlho
	VI2z/BxPhuHW0UgQHA1OCveMLTEla6/qtkJV16cyTkINgMhxBEVpxtV0QVYBTY7FLqOHmONQBSP
	JOB5cpraSg9hfKsGqipb1PcHOedH3/SO4PJWG6+0wYbNxohGLYPZ/6w52eBu2iewc58ZTGHYs3T
	kvG11uLeBCQzzggt2boOHIhugzMM4wAMKzrafRfatfe/Ayi0TzdPrGT9PqeiSwhqsywc8s9JG2b
	NpAngRJedEQ8NzwzzwIC3rC4r7baEKY/Gq+o=
X-Google-Smtp-Source: AGHT+IEI1vvxdVVtw24k3xjXm86y1FoYzkQAxQf+2Rv/Yd19jGEMG9C5oqEg531N9y5/GIYuWd0Wqg==
X-Received: by 2002:ac8:5ad4:0:b0:4a7:234b:222 with SMTP id d75a77b69052e-4a7f3e88976mr49122961cf.22.1750947519837;
        Thu, 26 Jun 2025 07:18:39 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:39 -0700 (PDT)
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
Subject: [PATCH v5 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 26 Jun 2025 09:18:24 -0500
Message-ID: <20250626141827.1140403-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
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

