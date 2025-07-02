Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B0E2F6FBF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492239; cv=none; b=LCKdGR4DNSHVRk9d0klbzI8qRP0Ul9dOj0dqOanvcg7xDpIFphspyaWMrrTDgQqq4Yx+b8BrBl4OWXIw+Xvw4qt1OFnj08CEHeDXEFjx4ug4F/m3RKwOJK/BAznkCG21TypKlM6gmjwO7glukyXDS+VFHiTFc7RZnFoIVSN62AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492239; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emCLfl29XFr5D/58mz3JZWwymZTqD4qGC3tUR2Y1iusscRsNLvcPhYKCHWxKmDejarup7tpWSv8R08arNDB7NQntE+VHRVRu8G3QS2XM53akF2JN3soW9w47clFW6ETT3K/borqMRcYjgvE9e2iS9hGvxuLlZeLCkvEMBEuKBPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=C1vUAt5b; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="C1vUAt5b"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6facacf521eso67708096d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492236; x=1752097036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=C1vUAt5bv5ZHUHJDkCGlMOohr9JhS+7K12GTsoPqYO0ZRBjcZqhQbBfdYdOfxifVoI
         53BmBnwz/nvKLUx+g6VtgXtN9gkiqXaKg+vDY4vvlQq1PLWQxLSzxSSkLzBe1TPlNeFY
         azN/gekSac7uCuholHY7Ss5F/iW2lyA24u4D71BuXI7ZWZhWMKE3EOSmrXjn/6fgGgb0
         tPA6ZGZJ2pLicfKZ5ShvlKVKIOPFKaK+zAmeArEfo0cZYgIk5TD7eiITpTHan6r09UHx
         4AAgIxlMshaiObV/bWPEN0Uog11HsXvAVq/VY/bOhIFF0LMWyS04ryXd8xEpCYdKHsZa
         HdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492236; x=1752097036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=tHdZGDRRhw0siXJZI1wU9iAO5r8zYguBGCzdpNBISKU9SPOcCoHVXvN7wdDgSTaUEk
         n8Mj3uCv22n2ZWmcEIKv+KFo/PqdYkhCJBuDwbI5zJszRtYO6PiKq7nB3bbIi/5rRrsi
         DRNJhMuwh3IzRJCt3NNh+RlpHlCKI7BarI0ziyQhj7OAlvOg6DU/RiiJgUZoNLsKo9Ub
         c2fkwhJuZ9ivq25d/eL74aTkS87ovOeG3heIv7yEa8S1c66p50vuhZpyc39130OdNE3f
         uH7AFX+BH2CaG/3aO/EZ1u7nAX5ibOOBSoBD8XjJIu+bDyRM3RoYyzJxgiGrIcCLeRk8
         WgOw==
X-Forwarded-Encrypted: i=1; AJvYcCXOkHtbhmXZHErB811DChSp+zEo0+KXMosXEVAOjYapsYyvxFHwJWgTc1Tpc99R2p8tAm/a5ktO8G08rB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZ657Cm7lH44XJnk41y630bae+AJn8SVgwM+6PD8QJAg0NmLS
	rKTHdLuJh8oEme0dO65l9HEql8g1wzVS5fGmBWHoCLwvDKTRl0Pq8ygFTYn4ZyMb0t8=
X-Gm-Gg: ASbGncvUWu8w4HSiGZfESsucUT+Zlo7USpCGi6paGFQQ8YLX34dKpVaSUr1DFK1H8H9
	d1mgeEe/qaN+vdZiHBSmFdaKN22ChheXIBQMiChMvO26xUqtnnvvHjL5v4PlVV7bo0HJGtvurV9
	AZcKFbUS2R5DYjr12j3v5L3QrdVDdPPhON/u8Rve/KifYrFlrp4uxwNJ5Q+tzR707Nb55FPIKy9
	z5Kcxc474Uy0T6eAO8ASxi1+W9g2dfPyBVFKDVMKys5XV+tAP0+bcwfUe3oASd4559iwmBGijFB
	TdgLmjiwnsSmEbatpR4TpUKwHaBDBYqtS+avq/RL1pACh2EogCaEbJGSmKdM/oPfcO9cu8T8IEJ
	izE4DHuq9IJEFeCq1vIA5ayUB3zPYX7RTS4M=
X-Google-Smtp-Source: AGHT+IFxV9+ZN7uJ4WMWxTezGcNNpASYTQcL8SVuNk4Fu4L3dpgWRu5GuHXUlmrOxNtWzLXL7lsjgg==
X-Received: by 2002:a05:6214:3da1:b0:6fa:c31a:af20 with SMTP id 6a1803df08f44-702b1a53271mr61275056d6.5.1751492236287;
        Wed, 02 Jul 2025 14:37:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:16 -0700 (PDT)
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
Subject: [PATCH v7 8/8] riscv: dts: spacemit: define regulator constraints
Date: Wed,  2 Jul 2025 16:36:57 -0500
Message-ID: <20250702213658.545163-9-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
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

