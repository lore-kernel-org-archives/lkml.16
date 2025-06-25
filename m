Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66D2DA758
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869696; cv=none; b=uK5LrTBgc6SJTUa0nLTXG+QfOM+FYqJWpmsUMNdgvFgduSTI3Qu07/cL5MlEXNXNlrCM4vbbIuEVFFR7/u+MfaeevE9hMSAgzAdiclsU6w2TvtFMNEdyNzJUGq5+Agz8LPTM2Cn9vptAbm2Im2j0WF4ojahwIOazF3hauHjFAME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869696; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsppyE8LovcnIVMy/lSxmlPPa22iDVITTe3JhZDjjlPFe6rMYbfCua3sJmPg/BBGJk0wmMa5D97eywX68Lg7rf9wNBd3M8z+no5QxAigWouyfvVVa4xQ9h1QhQ5n5HOjGRJl+Hs/Yzl0j4719Qw97GtjRtEHCPvrInn0moeNXPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DFqDV4Q3; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DFqDV4Q3"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so13003485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869694; x=1751474494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=DFqDV4Q3V8IqvSZ3b8O0CKY5QOM/L3X1DXhBB9GMYB6Ysd6k0KA79ezzjkNZYpGAUb
         yijEHKF0pcljeO16eGdkwSgyddV82dmiNWDKXWq0c3fclmslOWR8yL2rCa/Xq+jAZTIm
         aJHiG5Han0ewY5b0MHoertvT7miFrF2RW/k3Z93dFZIGytNtYquGJLjn+nwwcBCWM8eX
         Jwuibok3Mgf0YmsmXZwjL1jv4c+cqEHKg7OouLp5309EjRmMeDOt0Jo0nyPSea4C76jj
         er93y/+Ght9ZBlB5CUYbaYpr3smWes9hBs/2bvSkUcXjcBKmj2UeEhrNJaZYhQ9+Cp/T
         FUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869694; x=1751474494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=hYuGWxoEZwXfR2kpTbo4Sn2OMRpbI2Lk3ufIAuxgslCE6s49/ALQt5ywSOZ+Ea+omu
         Jx1Hq7L5wO4couGTaiR3agn4eN8mjeHMNucF6ErMjsYxlujhVgDIu2XxPsnJ0p3rq/4Z
         1hSrptwn9Y86Plnp90wTeLNZePStsjL3etfLeRMmU8/wYTFI8PeRF+6e1KjZUza+EhUt
         E4i0VdQjbMHdrN51cVzeZGzDB4E1MeuBDz9vObxIOYUX3ywRsC50+fT2mkS03Mn+sdMR
         Hrw4dRxSHfvKqHTeukEQlcjJ2kSSwfoXbJoKnAXCvcvjoh6cAq7oT1YwD3mwbKluDVvx
         hakA==
X-Forwarded-Encrypted: i=1; AJvYcCVR4VZSHZqs9t/eK02UKgIHdnLR5iN67Zmw5ApnXPy9nouEHYuq1a5druPFhmJqGgIND+RSiCJyKZ0jRq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW9VZWfkIgEtbMk54pOpiEV6S4Vi6zZOZ9fp1qY2zj+Ql5h4Ui
	yBRJMBT0uqIEImvmaFhcnCPvbNQ6IRQGhzIf5Vp3sVB2gHv1JYIO0HndNV1UgpYQsRU=
X-Gm-Gg: ASbGncvAU0Oj9nGoxcJs9K7WIvz6hHLaPjNOaufVX81hFgONvbqNwcaZwtOYW1NZcrk
	FY1mBHbtB7BTginWbZrL9UFWiyhXqrdUvoW68iX8Cs4l7u1y1Yeerl9BWrXeJmDhXeEKNV7qjIe
	/p+05MuOxtDf4u4MWVJfIjjr2KJejpYmwGJFoUka19kb+VIRjNcWL57Ezh0oNtADOhEHJz3E0b+
	mfrziKzeIsMztifnebt/a+7JwEHOCXuxl6eBKwA/21tiVBY5nibu3vc7wDaKIiY14o4WqGGmjUs
	sPIt7D+pDkympXq5yYt24u/2Q6hM4u5tBSJKRNxR6F33pn25hs4zvXLNjnqi9DWKgVlO1APqKZq
	HgmTiPT3NNmPnYndN4Mss8z8hdL+en+cuQaE=
X-Google-Smtp-Source: AGHT+IEBC2FuiYFCeaShYjBDomZFTypEHYThHwPRfGEGQQlsuc51Pdbq0Cxqjxbh0A1N+hYJdQQ/fw==
X-Received: by 2002:a05:620a:1996:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d43bb7e163mr36774985a.4.1750869693713;
        Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] riscv: dts: spacemit: define regulator constraints
Date: Wed, 25 Jun 2025 11:41:18 -0500
Message-ID: <20250625164119.1068842-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.45.2

