Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1A13B7AE;
	Wed, 30 Apr 2025 01:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976442; cv=none; b=By++3j00nMMqkOhirm+kW5oeloqcI+mHypMvzoTtj36LzX21hVvJF5U5bn5ympk/M4YluayxwQbxsEM/NWNjKwex+jfc6TK46cfztVhS1hsR1YbG6wzUSHgsHGfoNiSih2LAm4zOGHnDG0SgaVvJb8HkpagulN8q4oexrMpNmT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976442; c=relaxed/simple;
	bh=2b6fezA0gilfiSeHncEqwYlp53zZMto5w/gMbbLyOGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JG6u9SBSLjXNb4k956JpjbdyDjy6nDcqeJJkz+dYn0dwBIUvX5FgIGbgb2JIquHThgzem2oouECFLg+oINyKIKqQ8EIHtv8pBCwgaWdMS1+E2KNeasmXkdMGBOdERPZcRAfU1WqlJ6M/CW5rh4B/NBoQVvE2eP7bWnYDkYgunKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c96cdNGt; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c96cdNGt"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f2b04a6169so73856886d6.1;
        Tue, 29 Apr 2025 18:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976438; x=1746581238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orpHQEMmNk+tEK2xMIKeEAE44ZnWvB5Dmosx1GmhpwY=;
        b=c96cdNGtjw3tb7lLk+m7lYQDSXh4y3+F4ZZ3SgA4kj5hwP1d6hi2F0EBk6VFLXErlz
         X1gJxEgnhIVDwEzglgfYZ68ckwM5sYOCaDQV+vYAEYCwC1MC0aWCeKQl6isNZsDirJXX
         joh8pB3DkZKeeGNRAaagAvJhT84zF3lUzcPrUcMVtVqHzwfoA1MGSNTiqmavlDfqWI98
         RbNqT15cGJJxCZ0a1ksCDE3VVcHnuy15o9vwJUqFayVHIU3gckoMcyz0pKpUIDOpcx2C
         DCyEqQ8qoSkOkOC8FnUkd0NqYhnjANOp9h2F7/qlDb7fSGwj+9fm/k5gckL7cGlAW+s4
         P+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976438; x=1746581238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orpHQEMmNk+tEK2xMIKeEAE44ZnWvB5Dmosx1GmhpwY=;
        b=vUdgmOJX2/7+TtfV21U7dyRWqQ3RC2RgSwC5VO7RlFmbJ92a1VHSYZ4kPnMZkUzNid
         abvQlTHy5m8Khw6AHgmsP/2CQpahyIA0nZI78OX6k1GLd4RMoTkShIVhURaPBd5zLSoU
         +kRv590SnlyJp1A3x8vPGwFkZ7xL7TtAnYkZWcIZwV+0uaM4CriTO02fEFR6EfnVamnj
         PokrWNKysORfXVnFb81xVNeaKLk6/hOWtUILTyJec5dionV+i+mh1ABhi/S/37lYfMW8
         fjmZPxudJufXF0Tx4lCjB1N4fXDvl/C5fxDIlksDvWjP78mVtpKp235ZFelKJ2L58+Vc
         NpUA==
X-Forwarded-Encrypted: i=1; AJvYcCVxgYAVTqKWTPntDrHOnVVZvOP9IoPwi6Mvkw+hcB5yRclXIWygh14HWTUf4WECm6RceKIONmftyRv3v8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTtOUpjU/lVQMZWwgTIXhfotBWYwwmPb5jyaoUnrGS/CPq4Nrq
	aHppF8J4URBoNZe9UYW0q5AdMXr6ltW0e1rRRSP5rNhbdmfN4xGm
X-Gm-Gg: ASbGnctFiCs7ptwbK/6wzPsatb3U8oKGkQhC6C7Jlb+YTZC6AldTIf2K6elSMuLR0s+
	hQH/pdAL8AcfbXcxJWsWtmg4F/u+KcMtEBrs09UAzGeJX0DkzxI2EU1+6WIn4IQc50MSiMgEOi9
	RvSCvYaKpULIXTpdJtBPo538lduMq+upb3/8S8TjAZhq0niWl1oxV3I/b/bw6W9guqXM+Is5+I3
	r4HmHcH9ZffSTrY9hmtuPaNx/8MqFGEsJUZTCh2NYrhyPowhUCFCQ5oyVV4AAZERIn51HfS58q8
	75iO3kLEWtDNKGWb
X-Google-Smtp-Source: AGHT+IG5DRNOVSoHk6dnbQr8qugQsnAj2sLbMuWUDrmOn3IKUQ4BY0+JJwN+xKvvekVcatvxNq51sQ==
X-Received: by 2002:a05:6214:21ea:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6f4fe116d0fmr17281516d6.32.1745976438475;
        Tue, 29 Apr 2025 18:27:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe85d875sm2414586d6.107.2025.04.29.18.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:18 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/4] riscv: dts: sophgo: Move riscv cpu definition to a separate file
Date: Wed, 30 Apr 2025 09:26:51 +0800
Message-ID: <20250430012654.235830-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As sg2000 and sg2002 can boot from an arm a53 core, it is not
suitable to left the riscv cpu definition in the common peripheral
header.

Move the riscv related device into a separate header file, so the
arm subsystem can reuse the common peripheral header.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi     |  1 +
 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi | 36 +++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi     |  1 +
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi      | 29 -----------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi      |  1 +
 5 files changed, 39 insertions(+), 29 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index fc9e6b56790f..91bf4563e1f9 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
+#include "cv180x-cpus.dtsi"
 #include "cv18xx.dtsi"
 
 / {
diff --git a/arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi b/arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
new file mode 100644
index 000000000000..93fd9e47a195
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+/ {
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <25000000>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index fcea4376fb79..cc094b3f585f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
+#include "cv180x-cpus.dtsi"
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"
 
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 805b694aa814..a4f957302094 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -12,35 +12,6 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	cpus: cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <25000000>;
-
-		cpu0: cpu@0 {
-			compatible = "thead,c906", "riscv";
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-block-size = <64>;
-			d-cache-sets = <512>;
-			d-cache-size = <65536>;
-			i-cache-block-size = <64>;
-			i-cache-sets = <128>;
-			i-cache-size = <32768>;
-			mmu-type = "riscv,sv39";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
-
-			cpu0_intc: interrupt-controller {
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-				#interrupt-cells = <1>;
-			};
-		};
-	};
-
 	osc: oscillator {
 		compatible = "fixed-clock";
 		clock-output-names = "osc_25m";
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index df133831bd3e..6f02de9b0982 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
+#include "cv180x-cpus.dtsi"
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"
 
-- 
2.49.0

