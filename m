Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A64F25A620
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848526; cv=none; b=LEx2X8363J/oRn88evEJqUX6ybqps3IPYm2TeAb90vcJVN4kz+VavsRo/7uiscIpHnLZXa4Q3mKaBWre9rQwAGIf73JjGHrcMJ5k1f7gzzYXkV/xDXz/dmA5OhwnVuiYic9NbqwDZdaq6VjB5hceIIDfYXEbVW1uEe+Y31i3gRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848526; c=relaxed/simple;
	bh=OIllGYSRU0SJagDHwnIsOjgKnsaQsAcmzSKro1vqi5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2o3tehTAO638I5A5CmGqpgjhhtoHuH84B2WsqSM3zP5c8A3vdvHXSeqasigsRP4c2eddWgFzbFsI1djjO2D26ergjUZ3bQ9NfAw8m/T8S2hIi6CybRAg7kc2y14JZFJUs0Zyd4akszmaqw5XIyajmXBZl6rvzHqEfdBblkIsiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Dz6Vluvr; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Dz6Vluvr"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ddca4ce408so10072925ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848523; x=1750453323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gD7pkEGUFZ2r04BWnG63uJj9JKyQG3lB1lEXTm5IZo=;
        b=Dz6VluvrM1hykyqlUNUI/954JuMPmKJy/Z0SmRnX8t1Rrn+amy2NGV0ELcBChICYIT
         8bUERs5y2MGql4CXas1Xjb5zeUdc3VUTZFpmJ4vTxJIpYEwIcahMXQBc1SyeE29w6Vip
         ptXoq/SEkiFNOWIgjrXk2a0Rt2CChYGupHMd+ClZWZIc4aHN31hGWm+VpNXyaIuPAEe9
         dLEJle9KauOikUkuOARMa1kgDlYTQtCpcmtq77ygnMYfJLetmLZ0cic/QJqPEFxrCUjm
         lZj3qbY0CL7W6ZDmHXQ5x9rg3WKgK+OsvO2PU0T8j40anakF4Fo9UkRZMDVBnqn1I+az
         j2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848523; x=1750453323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gD7pkEGUFZ2r04BWnG63uJj9JKyQG3lB1lEXTm5IZo=;
        b=IMEG/vJsVIM1rzk+0eVqCXBiTN8cU1HcA9klycfhtSDCGaVMQAbJj0Rzc8uVHBleD4
         UMXpa8Y7Zkqad1eVGWLaEpV50JXHZTMgfRcngSYbCNNN0q3wYzB0T9zmTJ4oRUxdZ3XF
         aiT6kmsjY8Pcak8qvJ+SUjKhb96zEco12Txl1maqglFt6nubMH5/d7L3C47hr1e3XZ3d
         +B1x7axs3zdLPDwEqGgldaERX4nK3Yv+2qxPDK+wpxI8igRfDb1PWCPiexMbFyC7sOpj
         /IAWoDjMhC74tR/7S0ZWrNYPOhuqOO4YCc+rHbNsesUUDrw4/ByGySTlioVDnp373k/x
         DwdA==
X-Forwarded-Encrypted: i=1; AJvYcCVBQGkyXaUXKWC1WcGVSFuEZ7KAucj+Lbmi9K5z+VXssf1H36j5p2wzJ6h0gJ0HDLRsc0fodvn5z0ct9+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOiEt4r/1grvz31Eps6YYErwdFswlrZo1HT6mloQkoVSR9HKIK
	Vm209WBzX6thgAVjgXV0ZUDblPXhAv6ezawQ32qY6teczva39O+aVexmzd+FbNSxA2A=
X-Gm-Gg: ASbGncswf3gtKIDnydYKhPi8RBYpAN2UoHETqIA3igcCbKUlGwIuZhRxxPKNh7dzyOP
	4HZiAWmcFO3vMupBKdB1M+80LUlO0lSn1KvqqvOnvne7W5qQi74B4pY4NtjYQDp82gPhHT9EQo4
	N37osGtyraSlMALNDbeJ7b5m16YqaxJiQzemO2DZUXFEtKNfr/Dby+n4p6RGVK8xVpE+Xx48/TN
	7JCeXGGrS/Dk1fduXqTV/0QBFjlEkvM9HaJx7QpHdFKMT5qtJFHjJXdpL5zSSm/2RVtF6GLNWwo
	xy9S+GUB6wzVCqLzYB5i56bMVvSdvMT/C/DEUpyS4Flqw6Tsdp+MRQVzXNAdWx7GbkVZu+lBDja
	TFIKzPP1nkriGD1ZWTDpcpfCqtpVY8Jk=
X-Google-Smtp-Source: AGHT+IHXDat6NE+msKniBMkBKXzQ5OntQfEKX4Deb7fPFCE8SSfiXNxgPbBb3SmZKFUe07JWv37/DA==
X-Received: by 2002:a05:6e02:194f:b0:3dd:ebb5:5370 with SMTP id e9e14a558f8ab-3de07d3404bmr14113915ab.22.1749848523112;
        Fri, 13 Jun 2025 14:02:03 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:02:02 -0700 (PDT)
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
Subject: [PATCH 6/6] riscv: dts: spacemit: define regulator constraints
Date: Fri, 13 Jun 2025 16:01:49 -0500
Message-ID: <20250613210150.1468845-7-elder@riscstar.com>
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

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 8003c8173a2aa..0f9a7f7a6c8b6 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -60,7 +60,111 @@ pmic@41 {
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

