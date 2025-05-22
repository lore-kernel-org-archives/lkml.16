Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B142D3238
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956384; cv=none; b=eLsRkr12vk7A8HoaJ1iJG9jHuP7DpCL7QbjaORnklRF6fEHBsEYzxrW4SKO2xTyJCYf3HreZbGUo7pLwp1QpX3mDdWMdaCTRMvCoVg1ijJs6cwenMmACijFBntePX09BXsgCxufVjL+Rmkz5M9ooegWK0pKqx9bb7eO9zaiKjag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956384; c=relaxed/simple;
	bh=gvU0uMFD6Kovn+U10/vBvR06A23qjRw3z0F47+AnYRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JzsmlWxt42ETUv0owf8Gsqf72POnZJxHkNoZw/jnqr+HGSsNpf9hgCz8+XwMWKnHUhJDWYyovpsGQJ6aD+ReZtvTiKCF7XYtrnIx/CjI0N/aRvATXPhtMRHyCnoI94YIxdcXna6DBPPe4s5WQUCuxbrCS4lviGDHsEr75YMaVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=b63uANoc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="b63uANoc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-44b1ff82597so5900495e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956379; x=1748561179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7dqPj/4OqgIxw+lFGbLNi9FTj66PFQpLla1/LzexBE=;
        b=b63uANocjbw2DlX6gKABD7uEtcoltWcGw0+N9eNwN4iO7rZVS2HD4tbB3AGa+T46vp
         c3Ky51leopP15UA8k2KML7fx0wc8eSA2SyFcJHIVZz33rwRDt9NUUVAGoaMaR18fIFgp
         We3e7Oo005yhV2lphcjgylsn/zhe+iq9omK+HU+58XcaS6IYJP/iR3UZgF5WZF5VFhVY
         bluhkSh4BgzpXtSZ7At/Q2vo7n9Krvz+fn5QTc24bJ9nwMWwzaEVkxboGDM5jm7PQho5
         6Ub9ECCLqfNJCKow5YQw7xAx5+X4RGyxONQaAzG8xoeT0WtZ0CpCRjDypw3Efwo+mG9u
         aYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956379; x=1748561179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7dqPj/4OqgIxw+lFGbLNi9FTj66PFQpLla1/LzexBE=;
        b=smK3ikqW1Ran0DWn1pdoe7HEFKJRCYaq4DJMaBSkIUFiYTRk+aZzw7XDI4u6IILb69
         VESotuO7O+yEkEsfjgT9weoqs4yolFjwv4nMunKxJgaEgtw5Ufh4sY9yIYt49xzUdie9
         OLN/S9t+hwCX9gx84izTSk4B+sy5lUss9Ehh2AK88bYcApI9yG8910MuKJyRAMsayj6t
         yuS2DnlWHChbaa8Be9yBeHD7n19AZU2dqsrg6uf4gXSYVgFg9QLM92W8GL2SIsIgi2tC
         Jd4gT0z2PEXa8kQlFzTWyHFEmzCW0ESLn1sjdjpNzhuyFvadqBC0IJf6zfeqGm46caW/
         Crfg==
X-Forwarded-Encrypted: i=1; AJvYcCVVJ9pBkoF7eyfyIz/kEr67t1F2xzVhrx8extTcY4DRlty0hAlc34ZX1yTiQTRglwJmiRhut9/2CbBJw1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YymSOC+OIiMn5JlpQZBqCItS+3oKFfNnTdLoU1XQ0XtO5SnyBFr
	2SwPTHl2MMDHBdPuN+8br3jcnmca1O8h7ESyeEoyvBnA3IRA0kVUyjdYutWMQ8c6W4g=
X-Gm-Gg: ASbGncsFEuLv6Yty6xRuBG/yRyPJ3XDxdpxed+EIYNuT6hZ33qwVEC/1Sv0nxQhRuae
	vRMVeNJkJrJErwjlsFKYDQkQWSNQ/esGutF9qFuSn9jN1GwR2vTSyaSNcDvvf42syt+1YpR1WYn
	FQzKAkLIYFjesqI+XpYSUVJ1b/fYEqHbh9s2jxNk8By2VoYHcMDoRrwchuCqFz8uQCcr7bPmvTC
	PIC5ZYUGrIvucS/6V2OwLPb/Pu5OQM7T0goJvfZ6EtAmqVOOuHy7kEG9O7xlktrr/q/0rtH/9Oz
	c3mt3UPfAg8TJ4i0m6EEX3tO8uTGidg4Bzl8qeDk3T1hl9L/VQawVA==
X-Google-Smtp-Source: AGHT+IFXXmQbzS5vqDGu4y4TwQnk0EiK4CC5C6meSlb8RPETRBYPhp8qkAqi3TzGPklrLZOBPgJ0mA==
X-Received: by 2002:a05:600c:64c6:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-44b6d1d44aemr7930635e9.10.1747956379233;
        Thu, 22 May 2025 16:26:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:19 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 23 May 2025 00:25:09 +0100
Subject: [PATCH v3 3/7] riscv: Add Control Transfer Records extension
 parsing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-b4-ctr_upstream_v3-v3-3-ad355304ba1c@rivosinc.com>
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=2624;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=gvU0uMFD6Kovn+U10/vBvR06A23qjRw3z0F47+AnYRQ=;
 b=pyfnCvhX86bz9z1y3qjxlNR2g5lGOH2Tq7LR0ghQj5QSvYJrDGwpQ/jbb4U4sW1BvShvZvEdX
 QqJA4YOOC0EDUOV9duD2meq3fYPM1ise96t5o6riam+ED3WjJWGTHfg
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=

Adding CTR extension in ISA extension map to lookup for extension
availability.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index fa5e01bcb990ec26a2681916be6f9b27262a0add..9b88dfd0e53c7070793ec71d363f8cd46ea43b92 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -105,6 +105,8 @@
 #define RISCV_ISA_EXT_SMCNTRPMF         96
 #define RISCV_ISA_EXT_SSCCFG            97
 #define RISCV_ISA_EXT_SMCDELEG          98
+#define RISCV_ISA_EXT_SMCTR             99
+#define RISCV_ISA_EXT_SSCTR             100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -115,11 +117,13 @@
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SMCTR
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SSCTR
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f72552adb257681c35a9f94ad5bbf7165fb93945..7fcbde89e4b9ee55b30b27f5b93e33dbe8f9ce58 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -419,6 +419,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 				      riscv_ext_smcdeleg_validate),
 	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
+	__RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
@@ -426,6 +427,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv_ext_ssccfg_validate),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
+	__RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),

-- 
2.43.0

