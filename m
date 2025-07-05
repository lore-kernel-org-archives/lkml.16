Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AC270EAA;
	Sat,  5 Jul 2025 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751698849; cv=none; b=mbF6m60omZGPkwXbXWRz6f8DTkRb653e59BqnYBY/FR1OEFEj6S+HUQKxhZ9tEAkZYpb4tfPcpwRMYN7cWRojJO5BQEHVWg2nVRYZizPjtpwDs35HbvBcgFfbm/7xyYsrIJqskDHJil6HoIDGocjDRsLQKPjj0PqzojALbe6nPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751698849; c=relaxed/simple;
	bh=rETZsfngqmmN90ykm2NkuROGwa4V9+J8RRntzVKVSLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJYHIzZ8L4mA6gnDjdfBm341iHfwmKTABBOlnveXmNB6h5juvEv0IDIGydV/yc4bdCYQ1hY+ktORTw2z+Gn17RrJdi6RcgVw0/L/HXdVxDwN6DMrMYkPUM7l5MxNTH1/NjGxk7uwgiH/KFOYVFA7sT1XYkWEfjqTr1cjVAxK+ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltdFPkLI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltdFPkLI"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73c17c770a7so2006470b3a.2;
        Sat, 05 Jul 2025 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751698846; x=1752303646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUe303juQ2kTWpF4ztu8Lsf2D2p4Rsxu4X9YMR2l3sI=;
        b=ltdFPkLIxJmMg9R7v2Pr2XS+v1Lg02V7xx97rz183zlac2Mc03sdqHt6oIebfhN6aR
         5+EvM+XPgMHOd0BJavX60MWsOAnNc9u0myhUxoq94NYq2Yd4c34P4F8lc/0XYLOHhYOc
         GDRtZtS68UV1UUGZqjrdvPki/9nl1O8Es0Gx4gCo9hW61M+bz+FAxHdA3ejuaGYetgZ2
         QNQUSnCXYbwMF5dGvYMCvAea1gPqE0CjqbKP0IXgQDSaLhJcfmVQtccVB5VZiNoyklw5
         po5k+403wJxJLY38i+D7rapBPrhK5QIrk5FFhQa7cJR/ssWS+JYgMkf4PIJ9gZqAZmAU
         qGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751698846; x=1752303646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUe303juQ2kTWpF4ztu8Lsf2D2p4Rsxu4X9YMR2l3sI=;
        b=DZworbyduO7YWDiaF/mVWqemi0/eKhRqLJt0LAbUdB8iZEBvg2H3lrCdvVGNYdEzXt
         ms8BAhCitU6WEZA1TaM3zdxEVFqNkYRxIpMhkwfnJMuHevcJ7rX+0A7aZIpZf3uYyuOC
         hc+WmWM81bFoLjolQhlBTlc5sep+4Xe5ozwMafaNp/epY58sxJ69sUYwkDt2pLGbQAqA
         71gWeGi4vFyaFSf/hhwHfej0CkLVsyA99j3tmEZ4FMc9Y+qzLJ/6ani/6e8mo1kgVlQ+
         J3anGTCPSCcNa2eo43XnRMyy04+IhRoc2vrQr9WpTRFapL4Ca5tOfmzky75Ly+gwdUfe
         8G+g==
X-Forwarded-Encrypted: i=1; AJvYcCWsM2ubqWH+H+plQm38icSpDebgMSlR+oX5dAyMOsYy8BDgIteH71gwT60P/3vVQJUoG5/WFjy7vdl7/ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ0VFOAuAT542aAkeGBiY/tM7PxChN5OEz939QeeNcRWlGfRhC
	gdkGTCKWdk/UQcBpNCHI+cx7XGj8+48CXy32kfmSkZpopmzAHfTtCOmZLsEqGCThQlxrkA==
X-Gm-Gg: ASbGnct2/REsiib04rxSMNma3G9CJZrgstNhRWko2MEQQBuXiQj8J2MtQ2n3E8CD2mk
	xn/4LcHZhmUn2dmV4LvwrMPqe6fGlT6kciLnF94E43kE56+ketAJhEI3FJJAuggWpxryQdWw5Mf
	DJx/eXuzq0Hk8aWtOS68dKnDGU5S0PXfDOeLK03XzmRfHmMZNDkmnRAaloMbTz7sphQjWcWXSak
	ln0YMJkBzKZWVwt+oz7dd8MO0PsYChy7LZJ6lsR3z7dDpaMDe2H15u0YHhUqKV7rRkdyzyvghOh
	fXJUCS4saZ8tvy1adpiZn9PIkW2EKZIny2XzToZZxGRlh+yFfR9e62I6zHvVJ+IUX+D2fnUuHCZ
	2yDu5qbg=
X-Google-Smtp-Source: AGHT+IEG4ySO61nALgKV504s0vrLcREUCHNaRNPV9vncPPjzO9OYiaX9hNkokJESRsJyikQZ0Bfs+A==
X-Received: by 2002:a05:6a00:8588:b0:74a:e29c:287d with SMTP id d2e1a72fcca58-74ce8ab165fmr7169945b3a.11.1751698845795;
        Sat, 05 Jul 2025 00:00:45 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce43d5186sm3638341b3a.169.2025.07.05.00.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:00:45 -0700 (PDT)
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
Subject: [PATCH v3 3/3] riscv: dts: sophgo: add zfh for sg2042
Date: Sat,  5 Jul 2025 15:00:14 +0800
Message-ID: <bcaf5684c614959f49a9770bf3cd41096cee5fe6.1751698574.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751698574.git.rabenda.cn@gmail.com>
References: <cover.1751698574.git.rabenda.cn@gmail.com>
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
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 128 ++++++++++----------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index f483f62ab0c4..77ded5304272 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -260,7 +260,7 @@ cpu0: cpu@0 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <0>;
@@ -287,7 +287,7 @@ cpu1: cpu@1 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <1>;
@@ -314,7 +314,7 @@ cpu2: cpu@2 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <2>;
@@ -341,7 +341,7 @@ cpu3: cpu@3 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <3>;
@@ -368,7 +368,7 @@ cpu4: cpu@4 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <4>;
@@ -395,7 +395,7 @@ cpu5: cpu@5 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <5>;
@@ -422,7 +422,7 @@ cpu6: cpu@6 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <6>;
@@ -449,7 +449,7 @@ cpu7: cpu@7 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <7>;
@@ -476,7 +476,7 @@ cpu8: cpu@8 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <8>;
@@ -503,7 +503,7 @@ cpu9: cpu@9 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <9>;
@@ -530,7 +530,7 @@ cpu10: cpu@10 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <10>;
@@ -557,7 +557,7 @@ cpu11: cpu@11 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <11>;
@@ -584,7 +584,7 @@ cpu12: cpu@12 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <12>;
@@ -611,7 +611,7 @@ cpu13: cpu@13 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <13>;
@@ -638,7 +638,7 @@ cpu14: cpu@14 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <14>;
@@ -665,7 +665,7 @@ cpu15: cpu@15 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <15>;
@@ -692,7 +692,7 @@ cpu16: cpu@16 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <16>;
@@ -719,7 +719,7 @@ cpu17: cpu@17 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <17>;
@@ -746,7 +746,7 @@ cpu18: cpu@18 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <18>;
@@ -773,7 +773,7 @@ cpu19: cpu@19 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <19>;
@@ -800,7 +800,7 @@ cpu20: cpu@20 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <20>;
@@ -827,7 +827,7 @@ cpu21: cpu@21 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <21>;
@@ -854,7 +854,7 @@ cpu22: cpu@22 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <22>;
@@ -881,7 +881,7 @@ cpu23: cpu@23 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <23>;
@@ -908,7 +908,7 @@ cpu24: cpu@24 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <24>;
@@ -935,7 +935,7 @@ cpu25: cpu@25 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <25>;
@@ -962,7 +962,7 @@ cpu26: cpu@26 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <26>;
@@ -989,7 +989,7 @@ cpu27: cpu@27 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <27>;
@@ -1016,7 +1016,7 @@ cpu28: cpu@28 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <28>;
@@ -1043,7 +1043,7 @@ cpu29: cpu@29 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <29>;
@@ -1070,7 +1070,7 @@ cpu30: cpu@30 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <30>;
@@ -1097,7 +1097,7 @@ cpu31: cpu@31 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <31>;
@@ -1124,7 +1124,7 @@ cpu32: cpu@32 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <32>;
@@ -1151,7 +1151,7 @@ cpu33: cpu@33 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <33>;
@@ -1178,7 +1178,7 @@ cpu34: cpu@34 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <34>;
@@ -1205,7 +1205,7 @@ cpu35: cpu@35 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <35>;
@@ -1232,7 +1232,7 @@ cpu36: cpu@36 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <36>;
@@ -1259,7 +1259,7 @@ cpu37: cpu@37 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <37>;
@@ -1286,7 +1286,7 @@ cpu38: cpu@38 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <38>;
@@ -1313,7 +1313,7 @@ cpu39: cpu@39 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <39>;
@@ -1340,7 +1340,7 @@ cpu40: cpu@40 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <40>;
@@ -1367,7 +1367,7 @@ cpu41: cpu@41 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <41>;
@@ -1394,7 +1394,7 @@ cpu42: cpu@42 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <42>;
@@ -1421,7 +1421,7 @@ cpu43: cpu@43 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <43>;
@@ -1448,7 +1448,7 @@ cpu44: cpu@44 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <44>;
@@ -1475,7 +1475,7 @@ cpu45: cpu@45 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <45>;
@@ -1502,7 +1502,7 @@ cpu46: cpu@46 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <46>;
@@ -1529,7 +1529,7 @@ cpu47: cpu@47 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <47>;
@@ -1556,7 +1556,7 @@ cpu48: cpu@48 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <48>;
@@ -1583,7 +1583,7 @@ cpu49: cpu@49 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <49>;
@@ -1610,7 +1610,7 @@ cpu50: cpu@50 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <50>;
@@ -1637,7 +1637,7 @@ cpu51: cpu@51 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <51>;
@@ -1664,7 +1664,7 @@ cpu52: cpu@52 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <52>;
@@ -1691,7 +1691,7 @@ cpu53: cpu@53 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <53>;
@@ -1718,7 +1718,7 @@ cpu54: cpu@54 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <54>;
@@ -1745,7 +1745,7 @@ cpu55: cpu@55 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <55>;
@@ -1772,7 +1772,7 @@ cpu56: cpu@56 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <56>;
@@ -1799,7 +1799,7 @@ cpu57: cpu@57 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <57>;
@@ -1826,7 +1826,7 @@ cpu58: cpu@58 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <58>;
@@ -1853,7 +1853,7 @@ cpu59: cpu@59 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <59>;
@@ -1880,7 +1880,7 @@ cpu60: cpu@60 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <60>;
@@ -1907,7 +1907,7 @@ cpu61: cpu@61 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <61>;
@@ -1934,7 +1934,7 @@ cpu62: cpu@62 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <62>;
@@ -1961,7 +1961,7 @@ cpu63: cpu@63 {
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

