Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867EE2E4242
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034207; cv=none; b=WX3BnHLhLZYsSZpSZ1QOoqtQeInozy4uPRN4csjRzGvT2p6t0GwMS6e+utFeYDiWXFDRlcAu4rRlhOcD+lf6W6T3briCdxDF2RI4D0Ip3AadfDl6L9spkF3aHpT83xmTI7u0snSzPZI3RRXgbxv1nOkzTS4TUQokC7VCK3oeD7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034207; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoZLogxGJxwvar8AAW7ethsV3wm32QxlVvt/nBykRJFeVhGclfbHLaWa8nQOosg7sjCcCP1Q6YuX9+V/66BZoVCjQQTOGycEVgvhpnQ+VIRavcFQgTiBMz21D+cBJVsKehXVlZEtwYeHVORYUU42e3eIouz2sq7+t+g84S++ZFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dT+kvDuq; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dT+kvDuq"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d3900f90f6so215515885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034204; x=1751639004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=dT+kvDuqF1kfPGWN6JwDW+vev/qmOzlGa9RfYmZOsbIb38Eqfan9QVXZMZTveDhzzP
         yW4aJz9PcxsS0YdWHrkpomTRATIBHe3QqvgoSnyN5bbvokUnb/gvx4NhN6a0gma3yxJr
         6PIWbgCPszfeiLbki+XzYge16kwuUedMT1ii3hYJw6VUw8w0ILq3tcqnRKR/dkKqz3GU
         wH0zpxPCXkbCOPKr4IKTEtE4MjzuHkwj7PHnOQPLv1ulWVbaOP9Re78XD+GgIHHW4LjY
         1dQ1Si/RisDnIejzyuto2VC72ojx//yJ5V0BFbgWMrUI/uvufnYedKIBjqJFIcrtpZ9D
         eCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034204; x=1751639004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=LLKNN9Yw1HLU+zTzkWfi6Ee3evdy3GModaNiLZoDAtgmLCyoN5Rf5worypPvuJ0QeQ
         BAnHqPxnRN6tjvqAcVQs2GgrJ0mvvpQq7bRSZyMT1Ili2VbDIG4xQ5sTpDCDR1cAfpEM
         uAWU67pJAnaGZ+epMdKcOMWXwKAsytyPtxsy5SPVOJoFVU2u1ct8bmh/U8iYbqncTr8m
         t5nsZxuj1or0iRJQqS/xVp5/vlaPWaswe99KYmN14ZU0quM4VZ4stczJRlbsJNt6XRB2
         Rp7MNRrF4IppAT4nYU7BieM5Sb5g56G/AoDaPvyUhVtD08EIkFWG97bfC7h9U7KIfnp9
         TOhg==
X-Forwarded-Encrypted: i=1; AJvYcCWxwyN2XCvp0w3FjJJ2N8S//yUhyx2D+qLZ8a4n9jmwTHtwuDO7XlDMaKcbMkZ1K5WdVAJpyA/Edd7lLSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZz7uOIWilNKIdBZXP/cRF2FBh4A+sLiTSOJCD0N+EjCpiWPIP
	WL7qaeA+emDEdXXgqrV25ifvlylN+QXUEO18eoo4Y1JjR1/8qB53w1bcaS/o6oO9Y8U=
X-Gm-Gg: ASbGnctyV9psrFpzJQcUB19mY6S0O3HrxB7nPNgn+XcDXHrChVpSL7Mxwl0hMP4+6XA
	RIgX13eh5dYaz1RJj6W0/v0a7j61J+YqrKKpYlITAKHXjyvc/z9Fwq7w0J0a2J5DHgyguAuvrXP
	OXRLw4OF5W8ZgJGwyY6TewWl72TZH2+OQ5ccWIeWBskJxgGj7KvnsUlo4clb+pXjQDXq/9W1L+t
	iS/ptcvsJsvXpyObweMVzu3lhQXzHiD1ttknRssctRpHto3LFoAKBEgAZTS08Tdp0wFCLrf4gN4
	wabHf0FtPfE8gCk61cG7JmpLnYBAyIiHYjLSPbKUeHT6wv73pBvxc6Amhivu0yZ/66Dln7vczOw
	5WOrRZLPd1qUoI4wqyiL/9v/WtsmrDSMrVu7SvBf6uGwnWQ==
X-Google-Smtp-Source: AGHT+IEOMLIfoVtqd+xrDcmHNR6PL3WFi16wi4PjfJ1dVACxbcBTOICTcDqGxxibtiWpz5q9BS7ImA==
X-Received: by 2002:a05:620a:288c:b0:7d4:3d40:4a with SMTP id af79cd13be357-7d4439b8e6fmr452165885a.51.1751034204384;
        Fri, 27 Jun 2025 07:23:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:24 -0700 (PDT)
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
Subject: [PATCH v6 8/8] riscv: dts: spacemit: define regulator constraints
Date: Fri, 27 Jun 2025 09:23:07 -0500
Message-ID: <20250627142309.1444135-9-elder@riscstar.com>
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

