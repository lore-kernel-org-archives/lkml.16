Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076272D3228
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956383; cv=none; b=WV3LBVJXLhKqEkUOWOUSQF4wgi4Mqp/fUQrCyoRQfV1fuygMVw1ndn/eCnrzJvdVcXbA2wdIhf8CfdjwdHZqjS39cMBYlBwls6Y8ubhHPnE31QQbIqLZxrZ0FYQdXMr1kcSd+iNHO5mZ9gagQiNvpoX11VTDa0UACFOXgieAfHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956383; c=relaxed/simple;
	bh=FOp1y09/3SytdmvNsRNI8bjrwNGWBMKFRpE30aP/AEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVoP4b8AH1CfP6pJXYSicAcTHQ9cnnkmxOrfCxxk/aNa2rgJ0ARQdI1hnNUskbldROzzXz/yf2BNkERxmnHqu5KjK7v/YQhPoxATXXZSbtAwjBHuKPyNn1C3ElkERJ3RWUFr2bVIDwzhYUI1H6xBmrTBh0xpL2gZKa8qdu66gl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bA0WeckT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bA0WeckT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a36748920cso5714977f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956378; x=1748561178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l53aiezq63VwGVulH0Yi9XQBVwtNa/T40ZWDbw9c1U8=;
        b=bA0WeckTYVEWROV07KpSEjHgHCe9Eb64CmQKTSE7au1aVTCdlYWjCoYVWYZtDMQaDi
         OawMgvVRGhOgbvVS40NDYKjp4q0JjcmHXnPMWacBV0SKr75pxXPtKafmaWPgc2M6BQcu
         gz6FdUmbYQKUWIrq6aFYxeinnSD5WU0AQaEQT5Rjl6LwfhGwNDDlVV9BQfqSeD+BRda9
         RNpC0EE400ByWQ115BLULyZbXEzpUHWExkf2JKeUJOqgXBOYR9rH4HK+UwcPcAwtl+SG
         C0oYGxvat2jXdHS10CDpvBhDTEcLf+YiW2ikU2KfwNxYDycEFk2ACkD2v6xHbjtKcrMf
         ZtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956378; x=1748561178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l53aiezq63VwGVulH0Yi9XQBVwtNa/T40ZWDbw9c1U8=;
        b=l2ZSEUezrqvfLredNCUG9DhcpQ/gl88/uuSuYwLFZTB1bio179l/foqhrdRqHEgKp0
         XzBofc4nHICizgm0ODSiGiBnoW2cN8ZlsB1jbQwo+Swaz32hq0PBqA3cWZ/44J6Ssa3n
         r1nzoznKWl208wDp2/J934hVpyedrZX8H5Jqcr2aWGpM8s9YQbx+Q9T9j/6mqgcVKwuD
         awea4ZmGPZb4qHjePUq3AIxE/y7I5gFsBTIqPaLxZrWS3saMq1WQ85mJHkfsUlQtmf8B
         IflEb5AWzoKHhVOBfp0rilfX+oSoUKpgWCchkNISVDiQtud7mUDM8388fiKV9PW2f/8I
         qgJg==
X-Forwarded-Encrypted: i=1; AJvYcCW65Xx9ft4QisD4VwZ9Do5IWzEtwFvpcj+NRhFJ/obTonmEW07Oh1Brm8L2nTFyCG/o8slz6KkSbl7p/iY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywahs+qyIZCja4MYJ08pmCz9zpA5mg9nCQuDHwZhbTZa0lOf+Tp
	RMuiBhGDsQgiv7h81EdZfPvBjx6SuiM/eNNwHpdpy/n7Ne+ebkCytR747/AVnDvTVaQ=
X-Gm-Gg: ASbGncvCK7Cw8go1B0jhoyfES53uSLQsaRzholdl3UK+SDRWTqaSt5i5ca9RKaCnS9z
	cS7uFPO2jQxQvfdrJ0cH8WoUYWnFA7bbCd8EeFBgBYkfBxZ/9NUsnGnCYNuvHmrPti36E6/u7jw
	3+W0EuqMPwOw5FFTYpR7vUvxQRwHKMcW50uBxy5EWRXnk0kcZfx8kHnbcXbb1kLlTQvYqXz+iF0
	0UI2nd111mAxRBYmX5kIdi8WyH75PvOLPmyZzWYH2H+cOJjIbCMi4GDNbtHJ/+SSvpE/MKxCRHb
	Gs+d5DCMVG2ghfmfYP9Xd9Z0PHkF8M0Lb6p6n9IPVYfvNGyXIlekrQ==
X-Google-Smtp-Source: AGHT+IHAmL4SGVYuRfQdx4Te1SZB2AHBQgY26GyZwg325ZZdeZGi5gjiCaXcu6MypqA+Dk0jD2u8ww==
X-Received: by 2002:a05:6000:2903:b0:3a3:6f26:5816 with SMTP id ffacd0b85a97d-3a36f265984mr15292194f8f.36.1747956378244;
        Thu, 22 May 2025 16:26:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:18 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 23 May 2025 00:25:08 +0100
Subject: [PATCH v3 2/7] riscv: pmu: Add Control transfer records CSR
 definations.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-b4-ctr_upstream_v3-v3-2-ad355304ba1c@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=3834;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=FOp1y09/3SytdmvNsRNI8bjrwNGWBMKFRpE30aP/AEg=;
 b=VAKiiJbUQk/CKnHQk537iR4eh6srfGqgxMprrnILqLhhp+3+U+RkJeqfMk302Xmwyi5fnxrYd
 Ogwp9C565GICK4Ub/rWcyt+4/fWPFEieJZE2YOTuQ8gYHwDi31VfK57
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=

Adding CSR defines for RISCV Control Transfer Records extension [0]
along with bit-field macros for each CSR.

[0]: https://github.com/riscv/riscv-control-transfer-records

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 83 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 8b2f5ae1d60efadbec90eab4b1a3637488a9431f..3aef621657603483e1cafd036f126692a731a333 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -331,6 +331,85 @@
 
 #define CSR_SCOUNTOVF		0xda0
 
+/* M-mode Control Transfer Records CSRs */
+#define CSR_MCTRCTL		0x34e
+
+/* S-mode Control Transfer Records CSRs */
+#define CSR_SCTRCTL		0x14e
+#define CSR_SCTRSTATUS		0x14f
+#define CSR_SCTRDEPTH		0x15f
+
+/* VS-mode Control Transfer Records CSRs */
+#define CSR_VSCTRCTL		0x24e
+
+/* xctrtl CSR bits. */
+#define CTRCTL_U_ENABLE		_AC(0x1, UL)
+#define CTRCTL_S_ENABLE		_AC(0x2, UL)
+#define CTRCTL_M_ENABLE		_AC(0x4, UL)
+#define CTRCTL_RASEMU		_AC(0x80, UL)
+#define CTRCTL_STE		_AC(0x100, UL)
+#define CTRCTL_MTE		_AC(0x200, UL)
+#define CTRCTL_BPFRZ		_AC(0x800, UL)
+#define CTRCTL_LCOFIFRZ		_AC(0x1000, UL)
+#define CTRCTL_EXCINH		_AC(0x200000000, UL)
+#define CTRCTL_INTRINH		_AC(0x400000000, UL)
+#define CTRCTL_TRETINH		_AC(0x800000000, UL)
+#define CTRCTL_NTBREN		_AC(0x1000000000, UL)
+#define CTRCTL_TKBRINH		_AC(0x2000000000, UL)
+#define CTRCTL_INDCALL_INH	_AC(0x10000000000, UL)
+#define CTRCTL_DIRCALL_INH	_AC(0x20000000000, UL)
+#define CTRCTL_INDJUMP_INH	_AC(0x40000000000, UL)
+#define CTRCTL_DIRJUMP_INH	_AC(0x80000000000, UL)
+#define CTRCTL_CORSWAP_INH	_AC(0x100000000000, UL)
+#define CTRCTL_RET_INH		_AC(0x200000000000, UL)
+#define CTRCTL_INDOJUMP_INH	_AC(0x400000000000, UL)
+#define CTRCTL_DIROJUMP_INH	_AC(0x800000000000, UL)
+
+/* sctrstatus CSR bits. */
+#define SCTRSTATUS_WRPTR_MASK	0xFF
+#define SCTRSTATUS_FROZEN	_AC(0x80000000, UL)
+
+#ifdef CONFIG_RISCV_M_MODE
+#define CTRCTL_KERNEL_ENABLE	CTRCTL_M_ENABLE
+#else
+#define CTRCTL_KERNEL_ENABLE	CTRCTL_S_ENABLE
+#endif
+
+/* sctrdepth CSR bits. */
+#define SCTRDEPTH_MASK		0x7
+
+#define SCTRDEPTH_MIN		0x0 /* 16 Entries. */
+#define SCTRDEPTH_MAX		0x4 /* 256 Entries. */
+
+/* ctrsource, ctrtarget and ctrdata CSR bits. */
+#define CTRSOURCE_VALID		0x1ULL
+#define CTRTARGET_MISP		0x1ULL
+
+#define CTRDATA_TYPE_MASK	0xF
+#define CTRDATA_CCV		0x8000
+#define CTRDATA_CCM_MASK	0xFFF0000
+#define CTRDATA_CCE_MASK	0xF0000000
+
+#define CTRDATA_TYPE_NONE			0
+#define CTRDATA_TYPE_EXCEPTION			1
+#define CTRDATA_TYPE_INTERRUPT			2
+#define CTRDATA_TYPE_TRAP_RET			3
+#define CTRDATA_TYPE_NONTAKEN_BRANCH		4
+#define CTRDATA_TYPE_TAKEN_BRANCH		5
+#define CTRDATA_TYPE_RESERVED_6			6
+#define CTRDATA_TYPE_RESERVED_7			7
+#define CTRDATA_TYPE_INDIRECT_CALL		8
+#define CTRDATA_TYPE_DIRECT_CALL		9
+#define CTRDATA_TYPE_INDIRECT_JUMP		10
+#define CTRDATA_TYPE_DIRECT_JUMP		11
+#define CTRDATA_TYPE_CO_ROUTINE_SWAP		12
+#define CTRDATA_TYPE_RETURN			13
+#define CTRDATA_TYPE_OTHER_INDIRECT_JUMP	14
+#define CTRDATA_TYPE_OTHER_DIRECT_JUMP		15
+
+#define CTR_ENTRIES_FIRST	0x200
+#define CTR_ENTRIES_LAST	0x2ff
+
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
@@ -523,6 +602,8 @@
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
 
+# define CSR_CTRCTL     CSR_MCTRCTL
+
 # define SR_IE		SR_MIE
 # define SR_PIE		SR_MPIE
 # define SR_PP		SR_MPP
@@ -553,6 +634,8 @@
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI
 
+# define CSR_CTRCTL     CSR_SCTRCTL
+
 # define SR_IE		SR_SIE
 # define SR_PIE		SR_SPIE
 # define SR_PP		SR_SPP

-- 
2.43.0

