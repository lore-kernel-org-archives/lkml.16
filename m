Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03811C75E2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104178; cv=none; b=PKwhpgZJrGqUUINn/dcv5BLJDBERorjP1mkZ9kZKnVX7GT1+PWl3eheBxikgQkehbvhJovuXy2A+MhVXMngCU0Ymv/K/iQmJv7Ywm3ySYL1R7t7OLtGCAsreUPYsaf434KbFnZwfjgGCPCr7Z4lirQhoQfykeIyYrbSxa5xorZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104178; c=relaxed/simple;
	bh=lADlo4V1a03EPhWe2c//gfMZE1TxUc6AVp1nzH2o+xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqyDGSydHhU4rxaZ3dUwiJDS751//hx7btjtP3Boa/kDKIceAxpvZJG31xoLkgD+SKkdByCmJPVauyF0AFZCr3GhrfPjakrRzU3LX+b1lBLTOq8JWF2E3LFXPRsx3Eayj9czHThOJmcw4OXZwXnu01NGZ/hw16rjFkm7K61qiCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vWQhcYAB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vWQhcYAB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so2208628a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104175; x=1743708975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNiDOpzl6VVeJNgjlyJ9nrrgFT7wIm7QDa1NpBXt1X8=;
        b=vWQhcYABUuZduRtg3+Y6XvbEJJ6Apl3UwocRUFru799z/D1KGOJtZoi70/FyLMGWZB
         KJpwxv7S8s5shZ6lcK8tTqy9CETfqwnOxUaVPe2OkY2FpyVumcmpCfmV4NNIo16clnSw
         mcfwWD1AhBw7F0iLoSwEHRN0129HODMsLX8tycuJXe2NJmTfXpnwRDuypW6tOZgtuulk
         lKEwAgX7dSG6lHWx2Nak0cw1StUUYbQVzLyUHEx1cVd8755mSGX8SRw2QRgQ+1KO7frc
         qQu1X9cOYn1e+4mR5vXXPqZgnC8XOsgglPPgQ+ddP/Kq+sA45UhnjmbBoNiwpzVkZ2FD
         ezmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104175; x=1743708975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNiDOpzl6VVeJNgjlyJ9nrrgFT7wIm7QDa1NpBXt1X8=;
        b=E67a5bh3KHVraw3faJGwBvgeROfSsp4CM5nlTrHpgrMhKa0TRHijH6yKZ5cXsOyCPa
         AIJ9DMPOLcES4xlvYIm3NjiVY/9gtHlJS2lmTz9ntIstIGnSwOrLWoEchOxZoeTeZSnK
         IxAd/rG9GOJ4VeA+wA1UKUmE7K2Fzw884XSmUUroS4Ki/zgEAxVeHzu0sP6beZp/FueR
         z6reZdsYTDbslvPvnVCljE6AYzP2hajAzpi8w7yX6JpgBEin9DeHcYIJWao0sHTh+qeN
         vwb2LI47ZpQ8Qx3iSu/kAA2gYyiP/B3sGPw5xbfGIVp2U+5/x/qjIENG5t42kSbdLLmU
         qrKg==
X-Forwarded-Encrypted: i=1; AJvYcCUQK3EcQqxoeE/3wJiTn0/NhvhSH+rXhoOffHYYkfK9D9MI2mKn+yW68Dc/pDQAjK9bDnDgkgle4qodip0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmEpunVmcUwUldIjfHBuVp9UeDIZhpWmD1A4BaJbZz26+Zt6V6
	4fZVJ6Jd2eoht0Ixx4tLf7XCZam1lsWBMGUXgGFBWfhENoQm37tDrZfxtn1wXis=
X-Gm-Gg: ASbGncsBzhM1Lp6M+wC7vVOHegQ3mtnBOLHGHV7qsYRwqBejMrrFvEAvcamcOAyqssC
	Z1p5BB5xcUPvO/0Lpp3/J1Deat9e8Fs9rWS2RuRKhp1vE8Pd2vhAiufGJOfX6k0mrMOynbqYiZG
	eWvnQt2wz62MTG3P3s69EYs4r4JbDCDmeLTIXLvAkoRNfewNTgGdvJ85zM5Nf5xk+KfSclEhsSS
	aXDPKt7nYA8hJcCMwI1amYN3RHIAORwWmuPVOm49rHmqfZNFB+Kyrs3+HAdWrcbku0Sss8DL2np
	7LWEm3Zeqd0389FllvmSBRRsEJMjhGvK4Ymp6z8OZq/cQyaNMi/LLC6uQg==
X-Google-Smtp-Source: AGHT+IE+y9OOA1EBKtpBON1MPRGyOf1+3dniyWNGs1euEGYpPv+8H/XM0XTNXU8WsHLC0qF7ObKE3w==
X-Received: by 2002:a17:90a:d44f:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-303a7d6a7ffmr7665632a91.10.1743104174834;
        Thu, 27 Mar 2025 12:36:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:43 -0700
Subject: [PATCH v5 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-counter_delegation-v5-2-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds definitions of new CSRs and bits defined in Sxcsrind ISA
extension. These CSR enables indirect accesses mechanism to access
any CSRs in M-, S-, and VS-mode. The range of the select values
and ireg will be define by the ISA extension using Sxcsrind extension.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Reviewed-by: Clément Léger <cleger@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 6fed42e37705..bce56a83c384 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -333,6 +333,12 @@
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151
+/* Supervisor-Level Window to Indirectly Accessed Registers (Sxcsrind) */
+#define CSR_SIREG2		0x152
+#define CSR_SIREG3		0x153
+#define CSR_SIREG4		0x155
+#define CSR_SIREG5		0x156
+#define CSR_SIREG6		0x157
 
 /* Supervisor-Level Interrupts (AIA) */
 #define CSR_STOPEI		0x15c
@@ -380,6 +386,14 @@
 /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
 #define CSR_VSISELECT		0x250
 #define CSR_VSIREG		0x251
+/*
+ * VS-Level Window to Indirectly Accessed Registers (H-extension with Sxcsrind)
+ */
+#define CSR_VSIREG2		0x252
+#define CSR_VSIREG3		0x253
+#define CSR_VSIREG4		0x255
+#define CSR_VSIREG5		0x256
+#define CSR_VISREG6		0x257
 
 /* VS-Level Interrupts (H-extension with AIA) */
 #define CSR_VSTOPEI		0x25c
@@ -422,6 +436,12 @@
 /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_MISELECT		0x350
 #define CSR_MIREG		0x351
+/* Machine-Level Window to Indirectly Accessed Registers (Sxcsrind) */
+#define CSR_MIREG2		0x352
+#define CSR_MIREG3		0x353
+#define CSR_MIREG4		0x355
+#define CSR_MIREG5		0x356
+#define CSR_MIREG6		0x357
 
 /* Machine-Level Interrupts (AIA) */
 #define CSR_MTOPEI		0x35c
@@ -467,6 +487,11 @@
 # define CSR_IEH		CSR_MIEH
 # define CSR_ISELECT	CSR_MISELECT
 # define CSR_IREG	CSR_MIREG
+# define CSR_IREG2	CSR_MIREG2
+# define CSR_IREG3	CSR_MIREG3
+# define CSR_IREG4	CSR_MIREG4
+# define CSR_IREG5	CSR_MIREG5
+# define CSR_IREG6	CSR_MIREG6
 # define CSR_IPH		CSR_MIPH
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
@@ -492,6 +517,11 @@
 # define CSR_IEH		CSR_SIEH
 # define CSR_ISELECT	CSR_SISELECT
 # define CSR_IREG	CSR_SIREG
+# define CSR_IREG2	CSR_SIREG2
+# define CSR_IREG3	CSR_SIREG3
+# define CSR_IREG4	CSR_SIREG4
+# define CSR_IREG5	CSR_SIREG5
+# define CSR_IREG6	CSR_SIREG6
 # define CSR_IPH		CSR_SIPH
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI

-- 
2.43.0

