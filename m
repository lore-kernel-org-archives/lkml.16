Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1423C4F9;
	Wed, 11 Jun 2025 08:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630371; cv=none; b=GetfkovuTA6/zbZEoxeb66iTasS27v1czq1A8celrElUOIKr8GyX91ul3vujSFA4F+t+R0GdQlBEJnDzo3K56yrHPomA2QWMH8BKtINFu34z55ZtyvbYt82xnNlKtnX4o4HsIGgiRqHVGloesBvnotNygjvjk61jTEoUbUOgS9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630371; c=relaxed/simple;
	bh=labKHwmoz65gG16kG5cJ8rbFXt/yG0jM37DHW0myKog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMStMnDHrs0DmMPl5Yb3WjrTW1P5ct8U/fKGiWTLIaBnlUbVP0/SilDKZyX91939jJw38dbBNO4IDNzqZX+cluyS4IL1Eot90cLtrW4fRe14H/8D8CPhX4J2FYqSime7hqjWJNggVKcBJ0Ipqn9UvoMFODSAi+IBjZ7On9IFDr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPP9QqLK; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPP9QqLK"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a58f79d6e9so70177931cf.2;
        Wed, 11 Jun 2025 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630369; x=1750235169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtdf9qP9cVV8qWLubtpWpim66gLvZ/7SjvLD52kK9W0=;
        b=JPP9QqLKEgmfFRBVA6iiFN3LZ/VrBQIyChYnzk7/bC+QfbtMTOsna/gRsMsou8L0C0
         4XmIqHSk77HbGgESw1b8JrKydXP8hhsTSCMbYrDAlJjvhq4ZovocQinRFPmoM148TQt/
         69itES73pljnBmisprJFVqTnPaNQziSEbjsq2T6lsNW6eBlbk0P/ssQWcDXEkq1vALd8
         v148jO1uIbxrFQUVnV/tlpLvnaOglue4QUPU3i1TQshd+j3uhIP3nJt2Ynx+xwQ15mh5
         Y1PnK+iAUzqNHvbyE1Z/SYp5OTA5Zm3wVklQa1ej9OQX3NaGq/WzqccqFxZUKs9qHhgy
         ZEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630369; x=1750235169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mtdf9qP9cVV8qWLubtpWpim66gLvZ/7SjvLD52kK9W0=;
        b=CZ5u69CVr8n/qlYVwbKrVYIddtBcmElzujJH4cl6hxZ6+p/wK8CmjHnrb08RRLCYUr
         IOGg2eLrdC3YH+e6UNX0j2lIfFdqvnwIdkuC4ADAQtdiwJSzu7xvv3eaWufnXArsHnHW
         pXLVEA145nPsY1Hk3nLW8LQEZHmQWWH/pwpm708quloEXxouPMY69C7H/wqHItBMEhNi
         P6k88njrdfxWff7ThlPppPXcdustosp99gF01ZPKmEbjInAZEH0RlbUBRuEEdAWomiOo
         oDDAgWhUUQHVcZOXtUBuUjmE1I9Y3QPX0b6P/r/Sy0t7qRTCBrd5aTyDh6qochvPR10S
         iH3w==
X-Forwarded-Encrypted: i=1; AJvYcCWOqG1xUxqlxlqMhDy0IZbKZLuKfga3QypspVeMmbOhRkGxFswW2GKso3dUiE9u5hlIRKaXRZYtR162tBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH/hTLy2s3FMGrW5+2B/8Vz/1bKyBvnidhd0L1sOkbeAow+YVX
	tcL4fpl5fB7yWZPlSjv53PN2hGvpla4HBUfu1uhQjel27Azu9ImzXlix
X-Gm-Gg: ASbGnctTjbNwjHST3FIdn1N8f9PPFdlV7ujXs1peSlYbxlGgrmI6ZEcHzuBki7b6MTP
	x/inc2V4549i0TRWPpjDlibBOtVRHSdCUV7sW9Bc5/yUmO7AsjjOqAn3u6Ea9Rzb9dufyH1gyR/
	s2rKMdWgq9lESS9tCMtBotyiFJ8t4Y3740mdcJxf5Dt0FDn0MX6529nRrPMMOgYANI7E6tCoab5
	N8jjj3MRpfcG+kUz8lVLcWYNvm343SdyQCrANgqc1RI8tRHYw0METlSBx+bl/LeILp49m/OQbHJ
	BWouv8K//Djb3MlVK37mQdmUUf9tAzm/nPh/3g==
X-Google-Smtp-Source: AGHT+IH0qLFsfBv1pQpQxKIbPeTxFHffMKW+/k5Ks09G+LGGw9rZi9lUb697yViqAisSUqzJw3Gi1Q==
X-Received: by 2002:a05:620a:1721:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7d3a8804592mr364704585a.10.1749630368821;
        Wed, 11 Jun 2025 01:26:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d250d7c399sm831902985a.24.2025.06.11.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Wed, 11 Jun 2025 16:24:50 +0800
Message-ID: <20250611082452.1218817-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 929864ba1b26..65eceaa5d2f8 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -25,6 +25,32 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
+		syscon: syscon@3000000 {
+			compatible = "sophgo,cv1800b-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usbphy: phy@48 {
+				compatible = "sophgo,cv1800b-usb2-phy";
+				reg = <0x48 0x4>;
+				#phy-cells = <0>;
+				clocks = <&clk CLK_USB_125M>,
+					 <&clk CLK_USB_33K>,
+					 <&clk CLK_USB_12M>;
+				clock-names = "app", "stb", "lpm";
+				resets = <&rst RST_COMBO_PHY0>;
+			};
+
+			dmamux: dma-router@154 {
+				compatible = "sophgo,cv1800b-dmamux";
+				reg = <0x154 0x8>, <0x298 0x4>;
+				#dma-cells = <2>;
+				dma-masters = <&dmac>;
+			};
+		};
+
 		rst: reset-controller@3003000 {
 			compatible = "sophgo,cv1800b-reset";
 			reg = <0x3003000 0x1000>;
-- 
2.49.0

