Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0534627933F;
	Wed, 14 May 2025 15:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235804; cv=none; b=XRQLSOmWvuDWccrE3cplv8Cv1Hiw83cO/2RsWc33rUnacWGN+N1CONaC1DHpA/cpwM/aI316INkvutCV4DY463kcxgTpu9USAnMrY9/Ggol1EsXg/Aa6bBC3e7sjTW7678170LikoOl6xsxHu10vwTUSWbD702zeXoTeGiVx+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235804; c=relaxed/simple;
	bh=ZjTUJgXb/Z16RKS4w3eXAIMk6s5AqARyc0t/4/x9CRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAF04PNTlvPxLaVS+GUb9qWEQczeFcQIqjRGMd9e17Q3VOvQe3ByOnt8AejWTY0oS5eLA7WQ6utE8KTfiFgsSqVKIvH2cDDtyaIU7PXAOTbU5Go2kvEm/Up8mgQb9IstfnIWYAXz+aGbuwUnBj992FtUnDWFy23XQLuu7ZkUvH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJltzV88; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJltzV88"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22fac0694aaso53097835ad.1;
        Wed, 14 May 2025 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235800; x=1747840600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk63sxs2U7qcH/1MxMeZqMavzt0+9Gyw14EWY4Q3d8I=;
        b=iJltzV88R+p14yrfoW4Gc/wTitSQ4cCuK3pdyKJzyfgMokTRXDMY30CzeVZ+L8JHuj
         hmUvhyVvU/lPhGD0/8XipYbpGkRv4AHjDsZFEq1PwjKiZb/KfjTopPILXH1sSW+qZ0zy
         VocidTMkrMo7ak5o4QpmLarjdFTdM7YHKS+JyFq5ecLD98P9x3qjfID41RjppnvCbC15
         kQ1xMRxvjERcoEnUOJa/7AdzyOnJpv09JHhW+LNdz1/dx9ugrIL8WknW+aBSrD/Inri0
         WyRa5hHOtJUgz8rCARdfD7wcVQlqZYajKJtCjT4C3BnUL3h5rhkK/XpJZ8YKGs1W/sLq
         khpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235800; x=1747840600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk63sxs2U7qcH/1MxMeZqMavzt0+9Gyw14EWY4Q3d8I=;
        b=gt6LK2BFW/SEydpveljAkFdalyu5SRBG3wFRaPA2/827vnfyQkV/kE1fHeUVzUCoZI
         ALZ/doaC4cmLOI06tGHG2c4+qjwlPMm+tU9PoQBFHq6zdDQqKZWoimEZGmb0Ccm1ogf6
         s6D4B8MU3zETgoU1g0/CBr0DW4YFm7mqZUhlW/viXyojrXkyHO3tibuAxbfU0i+W0Zq2
         4ZeP6iOWAo1lry3blOv1BEtV6mebUCj94q6/JOjH2aLpPTHONvWPtm+sSRC9K6mQ0b0E
         Fi57MZ4j+G5qmmGzgZ7tJ8LEAq3qnAXG10lFjgHsmQuTFnTl9tU4ztxYpcSNXwWKAwoO
         8uhg==
X-Forwarded-Encrypted: i=1; AJvYcCVQZhFMAXwZwroxBNpgrytVNLYhHn8R9JQbEfPBL8vS87dF5cuCUQytvZDtD4kF7JU99bqMJiTjedgjZBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyXPfpTz6exNvkgp7O0sbGrhempwVcwXSTIpq+SkP4KabMoti4
	rffx4+HbxlEBT5Fq5iqmnkbrwabZQKWrLgCMRAw1hruhVWq3M3xQqdpp3UEfylxMqg==
X-Gm-Gg: ASbGnct21jO8vXX/ihXskAhata1BgHy8Chyj1YuSbRsm6nGVx6eQIia82jrWhVsZhuG
	jTiTFqITUqYOEQiOh8IAJhEd6BgxCA9AnFIYh+dkxybLH7hUTIgKEau+wCDAWRSGY35wPYV/GNO
	5pPKSwTOxQ/oXxKyPn3tisUC733YISfbsrWsYcwjjTSyWXJZGNGsnTOgPqc7t1Db9pjhsh9m1fk
	Z4xCb23iBTOnibvmOh3up9qsdvU8pH9fZ4wVsHbyts62wbRnJ3wM98xmzovzCzyEhO/MA9FWvUB
	hL2qC0kjMEZrHa3UN7sdh7zdUtPypMQaiHuAklNjyyyUiDBEyFREAgZEce5T6Q==
X-Google-Smtp-Source: AGHT+IFVhGXwVJA7GfrR5d/GNxff5+t7Oq4qT9e9svGDPhwAwhC/g6DCMDDErxKEOnsLKP7tWLY0Hw==
X-Received: by 2002:a17:902:ccc7:b0:223:5a6e:b2c with SMTP id d9443c01a7336-23198125a4amr56343115ad.17.1747235799045;
        Wed, 14 May 2025 08:16:39 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75468besm100576155ad.3.2025.05.14.08.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:16:38 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Date: Wed, 14 May 2025 23:15:52 +0800
Message-ID: <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747235487.git.rabenda.cn@gmail.com>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sg2042 support Zfh ISA extension [1].

Link: https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1737721869472/%E7%8E%84%E9%93%81C910%E4%B8%8EC920R1S6%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C%28xrvm%29_20250124.pdf [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 256 ++++++++++----------
 1 file changed, 128 insertions(+), 128 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index f483f62ab0c4..8dd1a3c60bc4 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -256,11 +256,11 @@ core3 {
 		cpu0: cpu@0 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <0>;
@@ -283,11 +283,11 @@ cpu0_intc: interrupt-controller {
 		cpu1: cpu@1 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <1>;
@@ -310,11 +310,11 @@ cpu1_intc: interrupt-controller {
 		cpu2: cpu@2 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <2>;
@@ -337,11 +337,11 @@ cpu2_intc: interrupt-controller {
 		cpu3: cpu@3 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <3>;
@@ -364,11 +364,11 @@ cpu3_intc: interrupt-controller {
 		cpu4: cpu@4 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <4>;
@@ -391,11 +391,11 @@ cpu4_intc: interrupt-controller {
 		cpu5: cpu@5 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <5>;
@@ -418,11 +418,11 @@ cpu5_intc: interrupt-controller {
 		cpu6: cpu@6 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <6>;
@@ -445,11 +445,11 @@ cpu6_intc: interrupt-controller {
 		cpu7: cpu@7 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <7>;
@@ -472,11 +472,11 @@ cpu7_intc: interrupt-controller {
 		cpu8: cpu@8 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <8>;
@@ -499,11 +499,11 @@ cpu8_intc: interrupt-controller {
 		cpu9: cpu@9 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <9>;
@@ -526,11 +526,11 @@ cpu9_intc: interrupt-controller {
 		cpu10: cpu@10 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <10>;
@@ -553,11 +553,11 @@ cpu10_intc: interrupt-controller {
 		cpu11: cpu@11 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <11>;
@@ -580,11 +580,11 @@ cpu11_intc: interrupt-controller {
 		cpu12: cpu@12 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <12>;
@@ -607,11 +607,11 @@ cpu12_intc: interrupt-controller {
 		cpu13: cpu@13 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <13>;
@@ -634,11 +634,11 @@ cpu13_intc: interrupt-controller {
 		cpu14: cpu@14 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <14>;
@@ -661,11 +661,11 @@ cpu14_intc: interrupt-controller {
 		cpu15: cpu@15 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <15>;
@@ -688,11 +688,11 @@ cpu15_intc: interrupt-controller {
 		cpu16: cpu@16 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <16>;
@@ -715,11 +715,11 @@ cpu16_intc: interrupt-controller {
 		cpu17: cpu@17 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <17>;
@@ -742,11 +742,11 @@ cpu17_intc: interrupt-controller {
 		cpu18: cpu@18 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <18>;
@@ -769,11 +769,11 @@ cpu18_intc: interrupt-controller {
 		cpu19: cpu@19 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <19>;
@@ -796,11 +796,11 @@ cpu19_intc: interrupt-controller {
 		cpu20: cpu@20 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <20>;
@@ -823,11 +823,11 @@ cpu20_intc: interrupt-controller {
 		cpu21: cpu@21 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <21>;
@@ -850,11 +850,11 @@ cpu21_intc: interrupt-controller {
 		cpu22: cpu@22 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <22>;
@@ -877,11 +877,11 @@ cpu22_intc: interrupt-controller {
 		cpu23: cpu@23 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <23>;
@@ -904,11 +904,11 @@ cpu23_intc: interrupt-controller {
 		cpu24: cpu@24 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <24>;
@@ -931,11 +931,11 @@ cpu24_intc: interrupt-controller {
 		cpu25: cpu@25 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <25>;
@@ -958,11 +958,11 @@ cpu25_intc: interrupt-controller {
 		cpu26: cpu@26 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <26>;
@@ -985,11 +985,11 @@ cpu26_intc: interrupt-controller {
 		cpu27: cpu@27 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <27>;
@@ -1012,11 +1012,11 @@ cpu27_intc: interrupt-controller {
 		cpu28: cpu@28 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <28>;
@@ -1039,11 +1039,11 @@ cpu28_intc: interrupt-controller {
 		cpu29: cpu@29 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <29>;
@@ -1066,11 +1066,11 @@ cpu29_intc: interrupt-controller {
 		cpu30: cpu@30 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <30>;
@@ -1093,11 +1093,11 @@ cpu30_intc: interrupt-controller {
 		cpu31: cpu@31 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <31>;
@@ -1120,11 +1120,11 @@ cpu31_intc: interrupt-controller {
 		cpu32: cpu@32 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <32>;
@@ -1147,11 +1147,11 @@ cpu32_intc: interrupt-controller {
 		cpu33: cpu@33 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <33>;
@@ -1174,11 +1174,11 @@ cpu33_intc: interrupt-controller {
 		cpu34: cpu@34 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <34>;
@@ -1201,11 +1201,11 @@ cpu34_intc: interrupt-controller {
 		cpu35: cpu@35 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <35>;
@@ -1228,11 +1228,11 @@ cpu35_intc: interrupt-controller {
 		cpu36: cpu@36 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <36>;
@@ -1255,11 +1255,11 @@ cpu36_intc: interrupt-controller {
 		cpu37: cpu@37 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <37>;
@@ -1282,11 +1282,11 @@ cpu37_intc: interrupt-controller {
 		cpu38: cpu@38 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <38>;
@@ -1309,11 +1309,11 @@ cpu38_intc: interrupt-controller {
 		cpu39: cpu@39 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <39>;
@@ -1336,11 +1336,11 @@ cpu39_intc: interrupt-controller {
 		cpu40: cpu@40 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <40>;
@@ -1363,11 +1363,11 @@ cpu40_intc: interrupt-controller {
 		cpu41: cpu@41 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <41>;
@@ -1390,11 +1390,11 @@ cpu41_intc: interrupt-controller {
 		cpu42: cpu@42 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <42>;
@@ -1417,11 +1417,11 @@ cpu42_intc: interrupt-controller {
 		cpu43: cpu@43 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <43>;
@@ -1444,11 +1444,11 @@ cpu43_intc: interrupt-controller {
 		cpu44: cpu@44 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <44>;
@@ -1471,11 +1471,11 @@ cpu44_intc: interrupt-controller {
 		cpu45: cpu@45 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <45>;
@@ -1498,11 +1498,11 @@ cpu45_intc: interrupt-controller {
 		cpu46: cpu@46 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <46>;
@@ -1525,11 +1525,11 @@ cpu46_intc: interrupt-controller {
 		cpu47: cpu@47 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <47>;
@@ -1552,11 +1552,11 @@ cpu47_intc: interrupt-controller {
 		cpu48: cpu@48 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <48>;
@@ -1579,11 +1579,11 @@ cpu48_intc: interrupt-controller {
 		cpu49: cpu@49 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <49>;
@@ -1606,11 +1606,11 @@ cpu49_intc: interrupt-controller {
 		cpu50: cpu@50 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <50>;
@@ -1633,11 +1633,11 @@ cpu50_intc: interrupt-controller {
 		cpu51: cpu@51 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <51>;
@@ -1660,11 +1660,11 @@ cpu51_intc: interrupt-controller {
 		cpu52: cpu@52 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <52>;
@@ -1687,11 +1687,11 @@ cpu52_intc: interrupt-controller {
 		cpu53: cpu@53 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <53>;
@@ -1714,11 +1714,11 @@ cpu53_intc: interrupt-controller {
 		cpu54: cpu@54 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <54>;
@@ -1741,11 +1741,11 @@ cpu54_intc: interrupt-controller {
 		cpu55: cpu@55 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <55>;
@@ -1768,11 +1768,11 @@ cpu55_intc: interrupt-controller {
 		cpu56: cpu@56 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <56>;
@@ -1795,11 +1795,11 @@ cpu56_intc: interrupt-controller {
 		cpu57: cpu@57 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <57>;
@@ -1822,11 +1822,11 @@ cpu57_intc: interrupt-controller {
 		cpu58: cpu@58 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <58>;
@@ -1849,11 +1849,11 @@ cpu58_intc: interrupt-controller {
 		cpu59: cpu@59 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <59>;
@@ -1876,11 +1876,11 @@ cpu59_intc: interrupt-controller {
 		cpu60: cpu@60 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <60>;
@@ -1903,11 +1903,11 @@ cpu60_intc: interrupt-controller {
 		cpu61: cpu@61 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <61>;
@@ -1930,11 +1930,11 @@ cpu61_intc: interrupt-controller {
 		cpu62: cpu@62 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <62>;
@@ -1957,11 +1957,11 @@ cpu62_intc: interrupt-controller {
 		cpu63: cpu@63 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <63>;
-- 
2.47.2

