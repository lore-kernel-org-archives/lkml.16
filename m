Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4525822424C;
	Fri, 13 Jun 2025 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800788; cv=none; b=YvrgHcL+KlsClHLKTt6eYLb5ccjbFMrRY2JUJo4eKdox43m61JTIfPvJ/haJJwVuPKYtPrBU5MRQdejOdaIQ+5HfN6ZLFA3tlPKvrpYRZwUOQS86wlSW+gQSz2/mCC4mjut5wVSZzJfqIvbwEYHaFynCPWL4ZKuHUpUpnCQ0Ww4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800788; c=relaxed/simple;
	bh=0xchKgY4M6xINFB5T+Rczva1U/Kx+gZ+AwhGaDiKNHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KIxDUkx6jvcxznmDiY00paGzbqGe3xe8eZlQSYtE4Fp2INhGzpEwRcZUcCmxk2LKRvmfCUfyEVS/vxBE0+sP/XpgfMZg1EkG9LfLpAI0MWYYx4zykqUuez7XyYcrSaPab3xq5XpnQuznYr8zMUCXzZJhuZNdJqxnw+wZwsnmpBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdP8oQg4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdP8oQg4"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3138d31e40aso1920180a91.1;
        Fri, 13 Jun 2025 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749800785; x=1750405585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6bSQNVA5yuf9g//Y5ZRZfaI0JRcJqJDXAPJMrCnXWs=;
        b=bdP8oQg4+wrgBLYIi9DMnuRt2Tv29dxXwZwMpkmb8U1B0ijczXhoLaAUSxGdw6Qvhr
         fGpT9hQMZJ6StdYcl95ARhB9/kMq+NuFh4Cd/xMVwOUNyHK0coPdYC7OODAWxjgA50tx
         3o33toAm5G9bOzqUfAcJVyuPtPwGyS26GSHO3i2yOhI5YaeItR2jOyy8T/e67Nbj17NB
         BPnwjMLn4ZTa1hFlXhmFJr5YzUCQ2b5T/MzvNCq1ZldajCX8kcW96uMnHlq1jqOPGtNG
         gcv4b3hwVCMZOj9p9Rn39adzle74/rdnMvGNENGEREFFwwfGQRZkfitCP6gJFH2B+vZ4
         19vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749800785; x=1750405585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6bSQNVA5yuf9g//Y5ZRZfaI0JRcJqJDXAPJMrCnXWs=;
        b=d8AzBoT87Vq30PCDhg+9RD0ZlOqDaXyux4+0MXFkH739O5PkXmaCQXN+IctXP2DyCB
         YXZcPS8SSbvqriDFjGgE9qa3OsGTpaDiDAO2aEdalERSXmd4evAUmA7e4s5gY/9ocy26
         eeRSzolqQ/GhXYL+igBh4VQ2Q7sf4fV7BFiMLy1NvHs2KMCl4paugYInOtIWfkCGh6OL
         Ib7xHSIjQ7h4r+icicpMTirtzeGrpNEDWl8RYOy2L/pjfq7Y2F1+ULOGfTljpgmUFc3E
         gehngVSOa5/pkEy3iIdrPHcQhzLNTfIdwGSeQQduPmS0yRJJg67tzGLxcxA7UDs0cF8/
         JwjA==
X-Forwarded-Encrypted: i=1; AJvYcCW2txOwcUW6ydteYWmDYq+ZJh3JtFSwXEEvNUD7U52ihqqD/cMWS2FUm8v9qrwlO7kHuK/AVGDdmOD8MCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk7DqUJSohZUyvIhPHCUjq6tG8OJD+TdUJMtGm5ojhCkjSnHtZ
	8dcYgNsMmS4/AZ1poSqq3sTlAI69Ox6NBrx/12+I7yK/IwFnnPk4PsSg
X-Gm-Gg: ASbGncuHfDTS1TEmivb4DtYVCCe3t+g+c06snhLhvER7wCacYQe93F+K1stQwTzNbNc
	vSX41JUrFS+vxreCjCJD8/eRZPPSFsQ6OzLWAKDmLa7Bwz9ln7KZV3xDoW53amOf4tqE58xk11p
	tdaG2c2ra+0nchBvMVBCJJ1sdOzrD4IZ0v+dhaaDo5k81HoPQH1GM5PLVHxqwo0VBG4CjKVC/yi
	rR0R9qhVBY3YJdfPCw94Pq7pk0UJQ5Xa+atZA3s4zTfv+FjKaQkcQAb31Hij8OJeeE3XIgCKaqz
	fUSyzstTwGD6yxLCGsqjj1KMQnFuXd9jFAesRppuuftQ+WFV0lBXHdk2kCk9
X-Google-Smtp-Source: AGHT+IEHiqZU91BEWr689rdAeg1onprm20Y8mZ+dhE/6eZuFoYi2tnxp7zaqDSrxP6nriFmi39LU+A==
X-Received: by 2002:a17:90b:5627:b0:311:cc4e:516b with SMTP id 98e67ed59e1d1-313d9ed50camr2700296a91.32.1749800785347;
        Fri, 13 Jun 2025 00:46:25 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365dea88d2sm8545225ad.148.2025.06.13.00.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:46:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size property
Date: Fri, 13 Jun 2025 15:45:12 +0800
Message-ID: <20250613074513.1683624-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel complains no "riscv,cbop-block-size" and disables the Zicbop
extension. Add the missing property to keep it functional.

Fixes: ae5bac370ed4 ("riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 64 +++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 2a4267078ce6..6a35ed8f253c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -38,6 +38,7 @@ cpu0: cpu@0 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu0_intc: interrupt-controller {
@@ -73,6 +74,7 @@ cpu1: cpu@1 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu1_intc: interrupt-controller {
@@ -108,6 +110,7 @@ cpu2: cpu@2 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu2_intc: interrupt-controller {
@@ -143,6 +146,7 @@ cpu3: cpu@3 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu3_intc: interrupt-controller {
@@ -178,6 +182,7 @@ cpu4: cpu@4 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu4_intc: interrupt-controller {
@@ -213,6 +218,7 @@ cpu5: cpu@5 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu5_intc: interrupt-controller {
@@ -248,6 +254,7 @@ cpu6: cpu@6 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu6_intc: interrupt-controller {
@@ -283,6 +290,7 @@ cpu7: cpu@7 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu7_intc: interrupt-controller {
@@ -318,6 +326,7 @@ cpu8: cpu@8 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu8_intc: interrupt-controller {
@@ -353,6 +362,7 @@ cpu9: cpu@9 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu9_intc: interrupt-controller {
@@ -388,6 +398,7 @@ cpu10: cpu@10 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu10_intc: interrupt-controller {
@@ -423,6 +434,7 @@ cpu11: cpu@11 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu11_intc: interrupt-controller {
@@ -458,6 +470,7 @@ cpu12: cpu@12 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu12_intc: interrupt-controller {
@@ -493,6 +506,7 @@ cpu13: cpu@13 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu13_intc: interrupt-controller {
@@ -528,6 +542,7 @@ cpu14: cpu@14 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu14_intc: interrupt-controller {
@@ -563,6 +578,7 @@ cpu15: cpu@15 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu15_intc: interrupt-controller {
@@ -598,6 +614,7 @@ cpu16: cpu@16 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu16_intc: interrupt-controller {
@@ -633,6 +650,7 @@ cpu17: cpu@17 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu17_intc: interrupt-controller {
@@ -668,6 +686,7 @@ cpu18: cpu@18 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu18_intc: interrupt-controller {
@@ -703,6 +722,7 @@ cpu19: cpu@19 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu19_intc: interrupt-controller {
@@ -738,6 +758,7 @@ cpu20: cpu@20 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu20_intc: interrupt-controller {
@@ -773,6 +794,7 @@ cpu21: cpu@21 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu21_intc: interrupt-controller {
@@ -808,6 +830,7 @@ cpu22: cpu@22 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu22_intc: interrupt-controller {
@@ -843,6 +866,7 @@ cpu23: cpu@23 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu23_intc: interrupt-controller {
@@ -878,6 +902,7 @@ cpu24: cpu@24 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu24_intc: interrupt-controller {
@@ -913,6 +938,7 @@ cpu25: cpu@25 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu25_intc: interrupt-controller {
@@ -948,6 +974,7 @@ cpu26: cpu@26 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu26_intc: interrupt-controller {
@@ -983,6 +1010,7 @@ cpu27: cpu@27 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu27_intc: interrupt-controller {
@@ -1018,6 +1046,7 @@ cpu28: cpu@28 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu28_intc: interrupt-controller {
@@ -1053,6 +1082,7 @@ cpu29: cpu@29 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu29_intc: interrupt-controller {
@@ -1088,6 +1118,7 @@ cpu30: cpu@30 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu30_intc: interrupt-controller {
@@ -1123,6 +1154,7 @@ cpu31: cpu@31 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu31_intc: interrupt-controller {
@@ -1158,6 +1190,7 @@ cpu32: cpu@32 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu32_intc: interrupt-controller {
@@ -1193,6 +1226,7 @@ cpu33: cpu@33 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu33_intc: interrupt-controller {
@@ -1228,6 +1262,7 @@ cpu34: cpu@34 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu34_intc: interrupt-controller {
@@ -1263,6 +1298,7 @@ cpu35: cpu@35 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu35_intc: interrupt-controller {
@@ -1298,6 +1334,7 @@ cpu36: cpu@36 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu36_intc: interrupt-controller {
@@ -1333,6 +1370,7 @@ cpu37: cpu@37 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu37_intc: interrupt-controller {
@@ -1368,6 +1406,7 @@ cpu38: cpu@38 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu38_intc: interrupt-controller {
@@ -1403,6 +1442,7 @@ cpu39: cpu@39 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu39_intc: interrupt-controller {
@@ -1438,6 +1478,7 @@ cpu40: cpu@40 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu40_intc: interrupt-controller {
@@ -1473,6 +1514,7 @@ cpu41: cpu@41 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu41_intc: interrupt-controller {
@@ -1508,6 +1550,7 @@ cpu42: cpu@42 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu42_intc: interrupt-controller {
@@ -1543,6 +1586,7 @@ cpu43: cpu@43 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu43_intc: interrupt-controller {
@@ -1578,6 +1622,7 @@ cpu44: cpu@44 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu44_intc: interrupt-controller {
@@ -1613,6 +1658,7 @@ cpu45: cpu@45 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu45_intc: interrupt-controller {
@@ -1648,6 +1694,7 @@ cpu46: cpu@46 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu46_intc: interrupt-controller {
@@ -1683,6 +1730,7 @@ cpu47: cpu@47 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu47_intc: interrupt-controller {
@@ -1718,6 +1766,7 @@ cpu48: cpu@48 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu48_intc: interrupt-controller {
@@ -1753,6 +1802,7 @@ cpu49: cpu@49 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu49_intc: interrupt-controller {
@@ -1788,6 +1838,7 @@ cpu50: cpu@50 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu50_intc: interrupt-controller {
@@ -1823,6 +1874,7 @@ cpu51: cpu@51 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu51_intc: interrupt-controller {
@@ -1858,6 +1910,7 @@ cpu52: cpu@52 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu52_intc: interrupt-controller {
@@ -1893,6 +1946,7 @@ cpu53: cpu@53 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu53_intc: interrupt-controller {
@@ -1928,6 +1982,7 @@ cpu54: cpu@54 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu54_intc: interrupt-controller {
@@ -1963,6 +2018,7 @@ cpu55: cpu@55 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu55_intc: interrupt-controller {
@@ -1998,6 +2054,7 @@ cpu56: cpu@56 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu56_intc: interrupt-controller {
@@ -2033,6 +2090,7 @@ cpu57: cpu@57 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu57_intc: interrupt-controller {
@@ -2068,6 +2126,7 @@ cpu58: cpu@58 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu58_intc: interrupt-controller {
@@ -2103,6 +2162,7 @@ cpu59: cpu@59 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu59_intc: interrupt-controller {
@@ -2138,6 +2198,7 @@ cpu60: cpu@60 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu60_intc: interrupt-controller {
@@ -2173,6 +2234,7 @@ cpu61: cpu@61 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu61_intc: interrupt-controller {
@@ -2208,6 +2270,7 @@ cpu62: cpu@62 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu62_intc: interrupt-controller {
@@ -2243,6 +2306,7 @@ cpu63: cpu@63 {
 					       "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin";
 			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
 
 			cpu63_intc: interrupt-controller {
-- 
2.49.0

