Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF74262811;
	Fri,  9 May 2025 22:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828723; cv=none; b=dg9qNFugX7uQODIBWDe2M90rGS7gpmLNzdlnflkZvp+2sFupoHzZZYapT/rUIEhPQthUJsdB78FsZqllOSrBf2cIuBMgZbmB5P0Go+txOnzSuZoi5FfqDyXm7RlPmQO6h0FOm3l2rgzJqNnzf9l2redE6p8wqy0G1ASqfi4Uge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828723; c=relaxed/simple;
	bh=7HQK7FNdKAI2D20WtjwlaNU89QVTPuS1iaSEGLcUYo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7AGZLAcW3ZSQWiJt1/lR94fBDa78jsb/oJqKcwgat7fkX56PZYtQZbOwg8Ap0fXBgbZpMoz9ISkMjwwu+NZf0qTB0rS4/Oxwyq9VYTRKRfxNuf+xiYm5g9LB83Uerv+d+qf9qBwchOJi6/anN3YltgP7gDE/fhMAU9oV6nh8So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jy+Yqn+y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jy+Yqn+y"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22fb33898bbso28876795ad.3;
        Fri, 09 May 2025 15:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746828720; x=1747433520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glYaQ+8ykeBVPRQT67U74pQanA3HmPOVGdvLtrPlCwM=;
        b=jy+Yqn+yVumW+luNBPcm+xtnWWlncqD+myuHkx30+CdUIsBXGuZTDrmQ8Lqh2qC6cf
         PSMlDO4BB81Xv/QATk/OV+XOAONh/xtKYKTUTVFxKe5akiJX+PF+7Dx3UKZukoJrravV
         eN50W9On/7OwcoRq50I47fgjOfdpO/ssRrJWLWPV6jVV8Aqf/ZeTV3MQzOX74m4J8XYg
         jHKDQuFoS0vg7oNLMeCanpwG/fsZEzX8E8uKRUIii/1c2cO581J0t4U6DqKphnf/RCiG
         CmR3g2MwygUxr8U63skLL3pojJGnxl8OdIdtct1CsDim46OWSMmJ3vBs06BpDp/EKoXE
         oQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746828720; x=1747433520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glYaQ+8ykeBVPRQT67U74pQanA3HmPOVGdvLtrPlCwM=;
        b=X8ImfXMkhBzVherkKcNiqZScuYJNU/+NYVj0q6JrocaBHV3uAqqpHrqYKhO8HIBf1J
         VzO3ofFphalFvAnETku6yEwG46aG6b3cQgt5o4fuQei3cbqA5OUKQP8+iUH5N4s2f6LZ
         nMkpWU4wMFBVdEd4F73NzYHGtWgApYkLtYP/dXNrfvrAuWg/4HrDm4oEHrLjf+cAs5Dc
         lWpYO+M42cWF7u/3jthRVKTO7n3ElYnWx2pwcaPJUbK5povsip3J3YfmkLe/+9wlAQog
         6gmufrZUBkcTggwYTLjOg8neXTJ8G6JerB3DhbwiUstyPDQi7xsiS3efQeFxNoKDWv7R
         z7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpvitU+dUXY41zb12xY7nHfrJYcCgsyt91rpVdjUa5FPXtDGPSc+GZzRVJYb52RMFldombO5Js/avWGW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAsTx52SxWGCvFaW+eOTCzZE6BG2vgnJ8sCFvhDKwIl8Fmb324
	cspAz3sd3WwyuLNPKxMxmVLc8xQc1Chx6E81YvwFBf7bvHenTjYl+l6fSccV8Bv5rQ==
X-Gm-Gg: ASbGncsGcdjvIimmgj0rcK7ZVRXeZMhBY65xS8EOTe6kFKZs9TpdwDd97QF75QXzj/Q
	S6DwiIDXbOnwI5s72ZnFayC7tCZFlBgKqm9aRsIFQjhSYSBTJM4H/FgthA09y0tOlZi/eS95RO2
	L+EM3swe1F/Dj1+1C9qatk+S7JooJRJ3M8Aar/Ic77mX0LN1RV3RPBqOGiLV9FFrAbwl/Xh7L8M
	fq2mQc/Jnh6tWccYDRcqvmDy8GEtftMhO3Sc+HhHlcbLnS3lTlTGpORBk8JvvAathhpwP3qf59Q
	ywAZU7NHxL5D7Ps49BVHNwGjDUh/2dp2ONsmqUTSVVOKWrBtzyV12K+zvh9Tkg==
X-Google-Smtp-Source: AGHT+IGomqi7LcwdEug+MQmZvtVGb0K68dtH4COGYBJ7wH9HjSmxIBZairVzSd6EM/wwv5UVekYMXw==
X-Received: by 2002:a17:903:2448:b0:22f:af3f:bf22 with SMTP id d9443c01a7336-22fc91a7289mr62204895ad.42.1746828719256;
        Fri, 09 May 2025 15:11:59 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7b2a004sm22510225ad.106.2025.05.09.15.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:11:58 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: sophgo: add ziccrse for sg2042
Date: Sat, 10 May 2025 06:11:23 +0800
Message-ID: <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746828006.git.rabenda.cn@gmail.com>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sg2042 support Ziccrse ISA extension [1].

Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 128 ++++++++++----------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index 927e0260acbd..04a6875574bb 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -259,7 +259,7 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <0>;
@@ -285,7 +285,7 @@ cpu1: cpu@1 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <1>;
@@ -311,7 +311,7 @@ cpu2: cpu@2 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <2>;
@@ -337,7 +337,7 @@ cpu3: cpu@3 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <3>;
@@ -363,7 +363,7 @@ cpu4: cpu@4 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <4>;
@@ -389,7 +389,7 @@ cpu5: cpu@5 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <5>;
@@ -415,7 +415,7 @@ cpu6: cpu@6 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <6>;
@@ -441,7 +441,7 @@ cpu7: cpu@7 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <7>;
@@ -467,7 +467,7 @@ cpu8: cpu@8 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <8>;
@@ -493,7 +493,7 @@ cpu9: cpu@9 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <9>;
@@ -519,7 +519,7 @@ cpu10: cpu@10 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <10>;
@@ -545,7 +545,7 @@ cpu11: cpu@11 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <11>;
@@ -571,7 +571,7 @@ cpu12: cpu@12 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <12>;
@@ -597,7 +597,7 @@ cpu13: cpu@13 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <13>;
@@ -623,7 +623,7 @@ cpu14: cpu@14 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <14>;
@@ -649,7 +649,7 @@ cpu15: cpu@15 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <15>;
@@ -675,7 +675,7 @@ cpu16: cpu@16 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <16>;
@@ -701,7 +701,7 @@ cpu17: cpu@17 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <17>;
@@ -727,7 +727,7 @@ cpu18: cpu@18 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <18>;
@@ -753,7 +753,7 @@ cpu19: cpu@19 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <19>;
@@ -779,7 +779,7 @@ cpu20: cpu@20 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <20>;
@@ -805,7 +805,7 @@ cpu21: cpu@21 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <21>;
@@ -831,7 +831,7 @@ cpu22: cpu@22 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <22>;
@@ -857,7 +857,7 @@ cpu23: cpu@23 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <23>;
@@ -883,7 +883,7 @@ cpu24: cpu@24 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <24>;
@@ -909,7 +909,7 @@ cpu25: cpu@25 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <25>;
@@ -935,7 +935,7 @@ cpu26: cpu@26 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <26>;
@@ -961,7 +961,7 @@ cpu27: cpu@27 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <27>;
@@ -987,7 +987,7 @@ cpu28: cpu@28 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <28>;
@@ -1013,7 +1013,7 @@ cpu29: cpu@29 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <29>;
@@ -1039,7 +1039,7 @@ cpu30: cpu@30 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <30>;
@@ -1065,7 +1065,7 @@ cpu31: cpu@31 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <31>;
@@ -1091,7 +1091,7 @@ cpu32: cpu@32 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <32>;
@@ -1117,7 +1117,7 @@ cpu33: cpu@33 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <33>;
@@ -1143,7 +1143,7 @@ cpu34: cpu@34 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <34>;
@@ -1169,7 +1169,7 @@ cpu35: cpu@35 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <35>;
@@ -1195,7 +1195,7 @@ cpu36: cpu@36 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <36>;
@@ -1221,7 +1221,7 @@ cpu37: cpu@37 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <37>;
@@ -1247,7 +1247,7 @@ cpu38: cpu@38 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <38>;
@@ -1273,7 +1273,7 @@ cpu39: cpu@39 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <39>;
@@ -1299,7 +1299,7 @@ cpu40: cpu@40 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <40>;
@@ -1325,7 +1325,7 @@ cpu41: cpu@41 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <41>;
@@ -1351,7 +1351,7 @@ cpu42: cpu@42 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <42>;
@@ -1377,7 +1377,7 @@ cpu43: cpu@43 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <43>;
@@ -1403,7 +1403,7 @@ cpu44: cpu@44 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <44>;
@@ -1429,7 +1429,7 @@ cpu45: cpu@45 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <45>;
@@ -1455,7 +1455,7 @@ cpu46: cpu@46 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <46>;
@@ -1481,7 +1481,7 @@ cpu47: cpu@47 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <47>;
@@ -1507,7 +1507,7 @@ cpu48: cpu@48 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <48>;
@@ -1533,7 +1533,7 @@ cpu49: cpu@49 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <49>;
@@ -1559,7 +1559,7 @@ cpu50: cpu@50 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <50>;
@@ -1585,7 +1585,7 @@ cpu51: cpu@51 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <51>;
@@ -1611,7 +1611,7 @@ cpu52: cpu@52 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <52>;
@@ -1637,7 +1637,7 @@ cpu53: cpu@53 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <53>;
@@ -1663,7 +1663,7 @@ cpu54: cpu@54 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <54>;
@@ -1689,7 +1689,7 @@ cpu55: cpu@55 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <55>;
@@ -1715,7 +1715,7 @@ cpu56: cpu@56 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <56>;
@@ -1741,7 +1741,7 @@ cpu57: cpu@57 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <57>;
@@ -1767,7 +1767,7 @@ cpu58: cpu@58 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <58>;
@@ -1793,7 +1793,7 @@ cpu59: cpu@59 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <59>;
@@ -1819,7 +1819,7 @@ cpu60: cpu@60 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <60>;
@@ -1845,7 +1845,7 @@ cpu61: cpu@61 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <61>;
@@ -1871,7 +1871,7 @@ cpu62: cpu@62 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <62>;
@@ -1897,7 +1897,7 @@ cpu63: cpu@63 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
+					       "ziccrse", "zicntr", "zicsr", "zifencei",
 					       "zihpm", "xtheadvector";
 			thead,vlenb = <128>;
 			reg = <63>;
-- 
2.47.2

