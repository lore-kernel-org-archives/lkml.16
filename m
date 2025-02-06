Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D122578E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738826601; cv=none; b=px2SPmY/kkk6fG/uOru20/PA3Sq4BIeUznOHqwzSQ0rxTkmA19Rav3T1pC9c60PQHtnMoWVUumld6SQwzb9sj4lmj+EZiAUTvb7WZuoKneedIIpnXNHC16AZfYOIs8VIXnN88ZbuTOExCi8GyTEqCDO/2U837We0i22eBrg8pr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738826601; c=relaxed/simple;
	bh=hzkWzrZhdLH2L+/RPmEjSy5uk16599o4D5Gvc9VuIq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRzOLEOeursQqXMSxo9TR0u5vZpdKI7UyoId4OoWCVov1HZBY//5zgMme8o8KDlQ2xNFRE5dHNtOvbAmVlBqbUilNbELvBaYCet8MiYHm/lEHqdvD5VFMLx4vv7vOo/9H3bdg9QhIZFEnPYNtJgwBuw4OQalNAiMMakpGfhWRSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=18xfzOwg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="18xfzOwg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f9da2a7004so816728a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826599; x=1739431399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpU79JAmkI/euhUSjfGzozskMgtqeVAFHucAlKFsR6c=;
        b=18xfzOwgiTAph019Os2RjSGB4bqk/Zly0kQilZC8ZsxM92N9d/FCnNAMt1keefAkBc
         I7lEYrHqubcHdr0sPRWqXDL1jprPjstgyewBLjrno0KlXs27Q+Gu5z4iU1lHqUqL83Dm
         ZH8sgbHPhQf5pyHgFWKQp1XrdfgiqVbf3F8fUWQlkXsRXHv7TY3QGHsM075CBC42x5VG
         T/Lbae/+9w8aoVy+qzsoW9/79ff18+g4OLaNe//KzBFjaiiJWZXkCwB25eeqWSb8meSk
         n8r9raHXRvVdrQ6FltYIVXBPqa07PPVqCSmlqLZg4Pl/+4MSzfKZhxosIdVZ2G3k1iH/
         Qdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826599; x=1739431399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpU79JAmkI/euhUSjfGzozskMgtqeVAFHucAlKFsR6c=;
        b=sZUfLT/CKsbhuCB3yT7pVA6xaD+Lvu4XkBkoWOC50mle8Aoq+r0JJfLIBDsxL065yI
         oQFPISRNGn5Odw/uIT3RRgR0DPemkd/f7tAydz8R5leP/giHmbsEH5rQ2gdy9rvDJrJj
         SjeEh2LqOjD1a9NfFGQG97qaSAPIBeFLcndttaD1lkSUrNrOgz8vMaUucaajbZUZGP7L
         7nTdQZz3U4bmgPE9kb6XQWg3rqSxaVcpDDEzR2pKI1kgWFDnKGxejwvyycB0mH92QCcZ
         ITDhwU1NycnzbbER/jBYYhdbZ5Mb8XpqznPbnqBkT3WNqCOR+luRrHs8+yd+UrB8Lth7
         8OEw==
X-Forwarded-Encrypted: i=1; AJvYcCUAx3hOquO3td5ZrVT8HeHM3+jTtOfhvSH2ReodQnvdUn2Zc42q1Tv0FVxyAop7D5MIibMP5cTSkR5smI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJcsRqVEL3cjBEfPDSjOJzqnDG3K3li1SxZdKXT+4em3Qot4M
	hz3ixHn2NRJn8GCuId6NUUrf85hANFFROpqIWQ2vSi+Q/W5uVSzUaVv2JGXj1vg=
X-Gm-Gg: ASbGncuJ6k0DGuoZD7G17nYTsJihZZwgGKBBSNQshFyw4Tam9gvMROFUyAurhsY5Y83
	R+Ysy4oIMXw4VXU0vTenTNqAkPz4F9R0AeF6fNIOMG4nElRpQHGE4jdUb5jvJE2ToRXb9RAxRvZ
	8/hOKScXHoGuGDL9g3/xCwglfkuYecHq4vKvRuFSarzdWvWV0Sv3V3hLWPIxRTXyAUOQBvv21EG
	zoXwrner8SIbs0zWv92lA+/9j9vurwfUHsmj4hD6l8QWF06sxXeXIWrfuJpr8/DGNjZu9GOhEUJ
	3j1RARbv33cG1h0YNDBnYEq1Dp+1
X-Google-Smtp-Source: AGHT+IESyqIBQACISlQQVueV5obgLnnWc+HDOijngEV9yfltfz+MqhbZ4NE+KJYEXiM6dtB0C1mfdQ==
X-Received: by 2002:a17:90b:3d91:b0:2ee:d824:b594 with SMTP id 98e67ed59e1d1-2f9e083cd43mr8885048a91.31.1738826598796;
        Wed, 05 Feb 2025 23:23:18 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:07 -0800
Subject: [PATCH v4 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds definitions of new CSRs and bits defined in Sxcsrind ISA
extension. These CSR enables indirect accesses mechanism to access
any CSRs in M-, S-, and VS-mode. The range of the select values
and ireg will be define by the ISA extension using Sxcsrind extension.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 37bdea65bbd8..2ad2d492e6b4 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -318,6 +318,12 @@
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
@@ -365,6 +371,14 @@
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
@@ -407,6 +421,12 @@
 /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_MISELECT		0x350
 #define CSR_MIREG		0x351
+/* Machine-Level Window to Indrecitly Accessed Registers (Sxcsrind) */
+#define CSR_MIREG2		0x352
+#define CSR_MIREG3		0x353
+#define CSR_MIREG4		0x355
+#define CSR_MIREG5		0x356
+#define CSR_MIREG6		0x357
 
 /* Machine-Level Interrupts (AIA) */
 #define CSR_MTOPEI		0x35c
@@ -452,6 +472,11 @@
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
@@ -477,6 +502,11 @@
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

