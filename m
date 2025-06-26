Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F228BA9C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947525; cv=none; b=QhfgoKv42+AXTSqitxOhrkqxpC4S1Vdl2iCD8ycP8OWZr+0JCHZbpbe1lm2382Oc5Sou+XmXf5dFA1/S91wzJcB41XnNv8iOToSNFjEgmhhb8g31s8+/jG+2ESzq730Tf6jnN/FAu1bsGxT4sJJV8AbBYTpvu4JT8HxyHUdbqZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947525; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kszUhYqw+SVLrQRPvwvaaYH5QEkl9Ucq9c6w4M89YvdGjm1lD0v671gPR8D6XkKFHaf7F36UvbFiOfFC4Z5OKPbEnFqVA6FTgVoW2Rb/rYr9eNN9dGpyQpd9KPEa2kP7f5dRKVM2uhs7LVYcKtcNqtKoOEqaqK+WQgudx4EaVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=jcRmwtpR; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="jcRmwtpR"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a7f61ea32aso12248481cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947523; x=1751552323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=jcRmwtpRQYvRBdaWSI6AUZX0Sp3QQ5KS5wTfL0rIPXNv7ruckBNK5y4uG1Mgw7QVb1
         VhkRvJIHEBiqUl7BEBCUXhQGhM52HAg3sCqO1ocnZkt3hnW0+7v90wPz41V+P1K7GnY/
         oSseaNWvJaM+/tGsUwvuAlxXCLFYw9eWImniEGGZ9qE6STTd6j8QHqQOJmVKVycSOsjs
         I8hd/2IcGBUIvbbPUYjCqiLxDTAtLFHmXJBobplBdO7nBDabRo1MFVtYeuQMmuUXqQTM
         coDwKYOwm7lzDqMPaO1XzPyjnkGHKZd4+/K56K6MX6QPRTO/8/h06iI38XYkPzAzbzw/
         tnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947523; x=1751552323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=qZT7JqYp67uq9FZj0eRflx2xWNSmOFSWoRYi38khx+Ivpx/K/X2jCPRePGP922xa/1
         gH+vZIp6ci92u5gNapQ20JDkTxV7X8ZguVL53gQ9pdPSdjRJ5F8LhVJIuyjRWrmyWcVs
         s1YOcZ62UZcP2Dx1Y8jAYEUzTsH/Hw0PynYzLOQmbgr8crnkP9URRVCxY5ZHJ25dFLm7
         9yofiMUCAMPlYn5Q5M/8f/xcJvzo0FfnJ2Ys08f0xRTd7+KoqxZ24PUbfSxl5+bouy+t
         yWEak8xGoiqyGMmJj7moj5iRznnr5sXX0lpWMicOkRwckxlVZjwQHz5BiKqXNVd+4FiO
         fzLg==
X-Forwarded-Encrypted: i=1; AJvYcCX2msk+ONECgsfJ3LkyeQGgwxXmsgQne9Qvl3ZpJ1dZRnhEtYsIaJRJaV6JDOz7pB3pNU2Kx53somQP8TE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgx6+wfPMo67TuOoHWeqR223IL1lhty3Kc0dPwG//nFnW2/bTx
	o4EX/gd/GVdwPKVZFwKDzZvK923p0MeVBvx4jhLK0iUBSxKoMkJzpS/LWNDj6i8lpiM=
X-Gm-Gg: ASbGncvXXRVwnMRLNCieDbQ6jz6qw8vaYnpawEjLIGM7UJRe6+34JDLNKQdNhO8lZN3
	rS50Q7+P75Yd2jUvmYh8i9GT4odE9nOPTovU4gzkwSTqnNSyy5OT9iYvzVjKPq7h8T3bLNsjS8e
	4I52HWWnYKYylVUnEm2zE9Twqc9Jy6nCLMYEugjDPamM9iVhH9OIeyV8AS7hpBSxkFcU0Kbo239
	b4UhuTuE21wcM2EWavR5rqEdD1fsvzV5qyZuwYcE9NDu/UYdyfX7syyWYanGRvUYhzEDJpdn2TP
	d+qMt41N8PooMgrfsgE/dos2ybX86bxVL2OmhFSrQZELHbFzopXbQ7IOxYNhRrbCJhvSp/5sL9k
	IvN4E9n9a5cHuTWWGFeIvx/OJPe3JN7BKoFY=
X-Google-Smtp-Source: AGHT+IG0Rk7kT5PaDL3EOhOatM4r51p1IXWy9NzWq0w2KHZQHF1mWKjHXAOtLVKooNvRWcbRmq/RBg==
X-Received: by 2002:a05:622a:4015:b0:476:8cad:72e0 with SMTP id d75a77b69052e-4a7c067c552mr130102131cf.15.1750947522631;
        Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
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
Subject: [PATCH v5 7/7] riscv: dts: spacemit: define regulator constraints
Date: Thu, 26 Jun 2025 09:18:26 -0500
Message-ID: <20250626141827.1140403-8-elder@riscstar.com>
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

