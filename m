Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E888924EA9D;
	Sat,  5 Jul 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751698841; cv=none; b=jGE4YChiY9WTOL3f11MF8lSuNaNJbaDvfRA11I10ruJoz8UbB/2NvvoqYQa7BEtVmgWWsU1slK7QWUjjtpDqrQGJz0Q4Mc8wA5BZpMY9WxnyUDzM3KJ2QfHO99974bblUhYmYkj5g4TkPO/88x7lcgSy+xv/ciJUxQUYTXgp7Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751698841; c=relaxed/simple;
	bh=/WJiRTCSm96nY9WOHNWzq+2VV2Bp7eRo9QFUJtU+SRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhI8B6h4skX+S8g+uhd6GXNv0j8MhPGVNbEO+PE462H34JgYg0DW2p8MRTC+1fYwfaAXyKvPa1K2zoWISBG6RvZymPwBQNydUdvBvpbI79i6qiyXDwxW8X1hikRASb+X7J4/2kQDzSw9RnFyj5y/IalZhlTDvwPf6fvVIbAwkhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbKzElsx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbKzElsx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73c17c770a7so2006389b3a.2;
        Sat, 05 Jul 2025 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751698839; x=1752303639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTx7oByNoaRpTz1pbQv/1Mm+GNKbP+dY0+my8EU/ptI=;
        b=WbKzElsxHcJbadpDb0ZxTrpC8gjVKJmthk9PiKVLXOmMpjdLBHPVLoM33rxYN+/qKm
         DRxy99fYhtTjsaPX7pVpbIpX8wQK6TRath0Vb3AUWBdd4XHFegMrxJ2tgcvNHw6d6Lhb
         jGhECscm6WtnOja4/c452Ktj90L+zxD5g/XWDGI6kNHRJCoSjBs195JWrmib+Vl5AUtK
         ubbkU7FplGjopiTnOr+X7QBKx9oZa1xviCWxX1n2rqlyQYLE/rJEHi3cwefgzNXhNPiH
         ymjbQ+KscKmBMj/T5OCk8s92ysNXSOvpH4SypOmkKXiQMylTcazxSBTFrMeWlWm4nhoz
         XUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751698839; x=1752303639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTx7oByNoaRpTz1pbQv/1Mm+GNKbP+dY0+my8EU/ptI=;
        b=WJIOdQIe+U3y9G/UIugs2YoKjupT75NMqTv1GxaIdankx4YJZtkwsD67vx7ONgckqO
         QCeLvxKZhCw2fBbLufwnBM6Iy1WcrgDr6GaTjRl5i5xzLK3d9AmF8nbhlC3oCCOBOxvl
         OwA/nCffh3idUuQjjQZ+9LTNSy3X3BUwp/n9VuO+MUSXsaBlSDkp4y0PyxBlY+OLw5Mf
         4FHNp9kBxDXVp1Z3h6ONCw3rF5n2zcYGnp6jQZpvDS8q8aDUHPZ1xwndxMnrFUjCeFta
         /JjeubSk+nK6z++2qzbE5sVEGqUVqIEQQcubarUZ7J2B28f/8SDpa2YRaOxRzQ6941OT
         MjuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYuIGQqx3O1KfqbUn0FvjDm2mwtbGMzIX458XQqeHN39MDQIwNeJ65CB9YidkRuSDdLkmCBg3oYdyzHl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx58my+b8N7BuWV5UJ7A7jP15KH3lZjnNdOOiX9YXd80FnOONqv
	p8YlDAYWMaZyVWmd4D8jSla2gUCM3VhsrGxPH+5nRtIeZ1hzxOq710JUSzhvOicE0E81sA==
X-Gm-Gg: ASbGnct+Jf7A4r61PQCMIh0cyO7BgBuS6yyLGQhn5Im8PdPMTY8erRhyVHR1TRI+xTr
	hDZU0vY+W73YMRBXeHpN6WA9oT8fU97RBVhbhgVGfdq8Xv8qjuCafQdpY9WQ2uYKfFjmol1iNYk
	jjChRC7aAH8HA14iT1Dxb/5YXj6cZh80FYZwvJoj7JnZI7IR4YyYryog4LNweNKnVQY5CrgrxMf
	GGlZogAGzmjE1SlGWORS9IO3Tqe5dkTz18gkCoFNfywqDF7/bexrYnuoQZD1U8fjjejfLRkglka
	wqHWn0SvAHo8HrgU+TnhSTvI/MeeDqibE0FEMSrokeXJi5GW3n4O/FwAbcVYEZ0vnJbMx5pLeCD
	jOAzRodg=
X-Google-Smtp-Source: AGHT+IGX776vW2Zw2OpGliUjZ09QSdX2YeCa9viCLCI4+gFiyDSmHsIT+9hEBSUL2O7xuFV6cCY/wg==
X-Received: by 2002:a05:6a00:1307:b0:748:f750:14c6 with SMTP id d2e1a72fcca58-74ce8ab16e8mr6475374b3a.14.1751698838434;
        Sat, 05 Jul 2025 00:00:38 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce43d5186sm3638341b3a.169.2025.07.05.00.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:00:38 -0700 (PDT)
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
Subject: [PATCH v3 1/3] riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
Date: Sat,  5 Jul 2025 15:00:12 +0800
Message-ID: <915bef0530dee6c8bc0ae473837a4bd6786fa4fb.1751698574.git.rabenda.cn@gmail.com>
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

The sg2042 SoCs support xtheadvector [1] so it can be included in the
devicetree. Also include vlenb for the cpu. And set vlenb=16 [2].

This can be tested by passing the "mitigations=off" kernel parameter.

Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-4-236c22791ef9@rivosinc.com/ [1]
Link: https://lore.kernel.org/linux-riscv/aCO44SAoS2kIP61r@ghost/ [2]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 192 +++++++++++++-------
 1 file changed, 128 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index b136b6c4128c..dcc984965b6b 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -260,7 +260,8 @@ cpu0: cpu@0 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -285,7 +286,8 @@ cpu1: cpu@1 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -310,7 +312,8 @@ cpu2: cpu@2 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -335,7 +338,8 @@ cpu3: cpu@3 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -360,7 +364,8 @@ cpu4: cpu@4 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <4>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -385,7 +390,8 @@ cpu5: cpu@5 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <5>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -410,7 +416,8 @@ cpu6: cpu@6 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <6>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -435,7 +442,8 @@ cpu7: cpu@7 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <7>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -460,7 +468,8 @@ cpu8: cpu@8 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <8>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -485,7 +494,8 @@ cpu9: cpu@9 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <9>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -510,7 +520,8 @@ cpu10: cpu@10 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <10>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -535,7 +546,8 @@ cpu11: cpu@11 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <11>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -560,7 +572,8 @@ cpu12: cpu@12 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <12>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -585,7 +598,8 @@ cpu13: cpu@13 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <13>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -610,7 +624,8 @@ cpu14: cpu@14 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <14>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -635,7 +650,8 @@ cpu15: cpu@15 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <15>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -660,7 +676,8 @@ cpu16: cpu@16 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <16>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -685,7 +702,8 @@ cpu17: cpu@17 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <17>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -710,7 +728,8 @@ cpu18: cpu@18 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <18>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -735,7 +754,8 @@ cpu19: cpu@19 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <19>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -760,7 +780,8 @@ cpu20: cpu@20 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <20>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -785,7 +806,8 @@ cpu21: cpu@21 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <21>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -810,7 +832,8 @@ cpu22: cpu@22 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <22>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -835,7 +858,8 @@ cpu23: cpu@23 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <23>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -860,7 +884,8 @@ cpu24: cpu@24 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <24>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -885,7 +910,8 @@ cpu25: cpu@25 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <25>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -910,7 +936,8 @@ cpu26: cpu@26 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <26>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -935,7 +962,8 @@ cpu27: cpu@27 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <27>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -960,7 +988,8 @@ cpu28: cpu@28 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <28>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -985,7 +1014,8 @@ cpu29: cpu@29 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <29>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1010,7 +1040,8 @@ cpu30: cpu@30 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <30>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1035,7 +1066,8 @@ cpu31: cpu@31 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <31>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1060,7 +1092,8 @@ cpu32: cpu@32 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <32>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1085,7 +1118,8 @@ cpu33: cpu@33 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <33>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1110,7 +1144,8 @@ cpu34: cpu@34 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <34>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1135,7 +1170,8 @@ cpu35: cpu@35 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <35>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1160,7 +1196,8 @@ cpu36: cpu@36 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <36>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1185,7 +1222,8 @@ cpu37: cpu@37 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <37>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1210,7 +1248,8 @@ cpu38: cpu@38 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <38>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1235,7 +1274,8 @@ cpu39: cpu@39 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <39>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1260,7 +1300,8 @@ cpu40: cpu@40 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <40>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1285,7 +1326,8 @@ cpu41: cpu@41 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <41>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1310,7 +1352,8 @@ cpu42: cpu@42 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <42>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1335,7 +1378,8 @@ cpu43: cpu@43 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <43>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1360,7 +1404,8 @@ cpu44: cpu@44 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <44>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1385,7 +1430,8 @@ cpu45: cpu@45 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <45>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1410,7 +1456,8 @@ cpu46: cpu@46 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <46>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1435,7 +1482,8 @@ cpu47: cpu@47 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <47>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1460,7 +1508,8 @@ cpu48: cpu@48 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <48>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1485,7 +1534,8 @@ cpu49: cpu@49 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <49>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1510,7 +1560,8 @@ cpu50: cpu@50 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <50>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1535,7 +1586,8 @@ cpu51: cpu@51 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <51>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1560,7 +1612,8 @@ cpu52: cpu@52 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <52>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1585,7 +1638,8 @@ cpu53: cpu@53 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <53>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1610,7 +1664,8 @@ cpu54: cpu@54 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <54>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1635,7 +1690,8 @@ cpu55: cpu@55 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <55>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1660,7 +1716,8 @@ cpu56: cpu@56 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <56>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1685,7 +1742,8 @@ cpu57: cpu@57 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <57>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1710,7 +1768,8 @@ cpu58: cpu@58 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <58>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1735,7 +1794,8 @@ cpu59: cpu@59 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <59>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1760,7 +1820,8 @@ cpu60: cpu@60 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <60>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1785,7 +1846,8 @@ cpu61: cpu@61 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <61>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1810,7 +1872,8 @@ cpu62: cpu@62 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <62>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1835,7 +1898,8 @@ cpu63: cpu@63 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <63>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
-- 
2.47.2

