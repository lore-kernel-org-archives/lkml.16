Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CEB28BAB0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341126; cv=none; b=mlAEmcX3UaWy7N7pThRR7FxBB1QJe+QtT9dfarrJ7SPeJe8vt1h6u8dsjAfbwBUCouC1YYIeqbG6SRWQwsmOR5w2BP+PB9Uoe1CNaQ+KLPlspLuZef/DEBB1VVHAz5NO+RrNNVvyQ6IvbonWoBUREmJMkQWh5+bjfp/D0KT2g1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341126; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXelymK1m6CCqWsZ1jjBvag+i1tyjiBGA5KQbU7bS1UseyZeQjnmVzNjQLsRmBETYKXrWo/mogzlAjulj6eExC9tQgTuA7UtbW6dGF68S++AImy+UKPT19P7vyaMCHmEKxW2LKxiDmBy8pd0rXsTBbkp5e+UvEBshhqJxQQcZfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AyIkTgJt; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AyIkTgJt"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-86d1131551eso22296839f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341123; x=1750945923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=AyIkTgJt6+PqSYaQWVu0lx23DQRgEYfHG8YmYUNMGm/40fm91nnfgCLUnksJyUUDca
         Pa+VZG6tnUN/N4UnbhmfI0hmBHxpmK9itvWStnEMjzSMgGH0Ojkj6mr5OgiKBzkQc1aQ
         ut4VkJLEj+6eqwCFQ6f2ugrYYgDXf6k+ZGKshthbADfkd5qBsbRa9zT4wqj7+gs9wOKv
         2qiJCWjymZinkP+lVwXEmfu91GH9o2j68ABmGIYo/4YbEfC+iSfotrTFHFBQsZZod/8e
         mOv/j/aWfjUvWkWnLe0ow2svO03olhoHjTvJSUxfOZHuIu34czmrIYLxtU4n1Xcg1cey
         BnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341123; x=1750945923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=xSPlOTiPsy30zFq5TVxOweKtu8mRj6GWRCpzrDN+J16xOwZzpfIOZoP6HWBIXBuZMh
         ZonuHiSwBgPf6yZ+rQzAH59fDybqhZDWRkaoXohyZv+uCAAemVyK8NREXULAzxdtwS3j
         esrp/DVMkPwqNZ/+a1R+sbOp/q4ZjghcmbbvmXNCfeVtUYMYT5gaSGiSfqTt7RKo3jmt
         7bMqrpKOImXa/bhDSqCxRdy+CSg2+fRiw3iHO6M8MZtLDpvAtHiCwoX/uzQkof+yNd0g
         TEl5hkMPDUSEmXb3OywkicviuYD1OjJiL7B7dOCHJLY4PXNLlFp8MSPQtV0JtbPzFbmU
         /znA==
X-Forwarded-Encrypted: i=1; AJvYcCW/aARYdu/eOBfYWqmUoEVV6yUjaqZXBqU0b6nD/V/Fa6R4eCuHErMh82Zx6SJ06GYAc/sJpgd8SmrS/sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEa1+KksblmMUKdpDclWCG0lmumjCp9rbOy/4KY3QonTgV8zoa
	qWCEyoDzyv3CvMxR2u0obUif1A4qYjJ2+flo6SUJH86AbClAaJ+LUhCPLU4SdVAV4FQ=
X-Gm-Gg: ASbGncs+/5HB1hGzAD8auLbhij0ldlQWLruHVO6NkiZvfmTmE9hzic4YI7Ev3BYY20J
	6mdP8owHdPYDpY4jf7SKWDdrJ3JtIhJFRDFGb6juF7l+FauDKMCA3BwrP+Qms7nC64hVJF/aGLU
	p4VAsEVDSxEuJXULsp7G1QB1SMgpa4sHJXI2Y6eCYAOpkIo0etaWvrzLou8LpRtPBgHkq7Fuojh
	NDI4WFo/5wGXuceNkPcX5JAnpsRIvuA21X4poYq1Y1d1gb3SMT8+ZMYuTuyi9KkopXrehDq5VcV
	rfAqFc67erCivnDdrHiu+EN9XGZnkXXjUixCxjEb68qXlgFnXMccWOZGlmowmGNT/dsXJmbMFHf
	iTzomZUx29y2fcqmXMZCbnW6oQG2kYWt9JMdQipAZTQ==
X-Google-Smtp-Source: AGHT+IExem0l4ezDbiC0YunjYTLQzP9AWFOBkBc8gw8zgbBmASiZICSB36WYhCAntpWfGoVKA6+PlQ==
X-Received: by 2002:a05:6e02:1a8a:b0:3dd:ebb4:bcd8 with SMTP id e9e14a558f8ab-3de07c5cc98mr247003285ab.9.1750341122994;
        Thu, 19 Jun 2025 06:52:02 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:52:02 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] riscv: dts: spacemit: define regulator constraints
Date: Thu, 19 Jun 2025 08:51:50 -0500
Message-ID: <20250619135151.3206258-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
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

