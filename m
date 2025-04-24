Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE420B7E1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479250; cv=none; b=TMTbuO50lZVchA7G3te9UX3wh9QC01Kl16Wq/00oo8Hi+yl3ZP0WoXMrZc3t/zQ2SZPn1IMfcbNGb4/RBGcGmRGo9fw+7KTcwqnRdzWCN4jI2he5Ouy2YC9MmQx+oRxFJ7SzfVrQgibzk434Wp8sh7xH5prZMChzSSlzoQa5YUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479250; c=relaxed/simple;
	bh=v0FhAahB+duYIk/hRzzymYIP6H63IhRuqMQn8myLUBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UjuUVtGYa65YwJInsrIsQYeq1Onm8kaKbAmbOy0PX0mdKeEh16Hh6k6udqtQceVzBlaQQfer1ee3AOS5siZMXGP1epRJczCkSdJVlpwXosFiCQOa/Pk/vucaQyF2QRX14KWiYg6m7UzkXvq7pVmnE9/4EGVGh/149usnDuNcQ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nbOHAEA9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nbOHAEA9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224341bbc1dso7698155ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479248; x=1746084048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ylYFmVRjBQGzrdqcn0JjhMraiDjYmLqBMrzaQkDTLs=;
        b=nbOHAEA9kkVtcPzENpnOz33i8q1/SegniPIQzU+Ufn1Fpui+DtmjOysVTgCeYPdhBx
         3gdzkjlIxOwo923bG539rY1GhStgMGqr4SQCDpF088c2nTUffyuub6zreme9KF7rWq38
         eBdd2F8lPnXw9fmTF8M2rdv1tgfn55SQEpJLT5w9lEs3+bph7ymts3gITcvA8eMGga0/
         lpTbYCaA2AIU7RaIJPn7h590oxgC7Uczh6IrCNSmidSARNPRzZ5UZrLh58Rh4TF2a7Sw
         +PkEDRa1fONdHbk7gNy4jIJgyVCmcM6CzQ42cEdZt2lLdmDQhwWU+7YhV7cn7fhD6FMb
         kv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479248; x=1746084048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ylYFmVRjBQGzrdqcn0JjhMraiDjYmLqBMrzaQkDTLs=;
        b=GrSF1Y//Uf4SloJXO8WTObLdc0wNvp4bA5od12oWcA7EbgauuQHBlcgzIUEZUHDReI
         N9ikkTJ3u8YAXTzuaU5VgXZkD6fvj6OABuDWAt1Oz2/5zJXdw8PYas6WazmIozzwqeXR
         /vCMMKIJCPrtVgLNjLRQkKU7kPEW/aDIS8hNq5zqHV2khf88ulzO/4eqQVlCCy4osLYi
         VCYeARH5Q7ewhc0xI6hzpSsQZbZBIozFnCL/CZJqpNe+N1ru3FRcfOHN4GmW04pLmRD6
         rMVLf+mQK7CnxD+SwXEf4TKoK1HJ/HJANaYJLDu8XZC49IFpy8Ezxfnknqvlnb/3igSI
         9g+Q==
X-Gm-Message-State: AOJu0YwESBlxEC/Hqp956NF3KbQL+9NfxV8iUyBngFccAj5KxiHVPhIB
	PslU5ymat+FGT3qg0Qh+cpohHgUjwDvrzv/dchrZr5f0W2KFhClgje/mSigwFNY=
X-Gm-Gg: ASbGncuZb1Q+i4/MP7rQtgljHNtTIsDH2ioscdaykS2JA4OMr80ZDFcQ4737+WsA4TD
	5d/8yc7LPlLN7RrJ6cVLaGYz7wSB3hLOssfXih0ucv7pYQrYJn18glkX+xvBjHavQlptFkNCfT7
	X3HnWkKYkKNj9y9am8L2mtx+GCx5hIlGhzSG5fdU2hm4dDVhBT2imqaHLRhfewYBhjnrkAPc0qa
	29XGXiVrQQZ5iGorMamqwZztCucygOCUDbyJc8MBMkLBIU4mmLUO/jVXXdDULcGNTrHTYSiTWTa
	cfG7Rj9BaGTY3glyq+e25gTAFm8sB/pQy/0yq3IbFw6jprtfO+9B1yfm3jj/aw==
X-Google-Smtp-Source: AGHT+IGjkr4vqGGtTUfWepy4/KRfgzZh10ROLBoP0JZSEZsJlQI5sONvd9/5VHsjRNPTvbU04z+xfg==
X-Received: by 2002:a17:902:f608:b0:223:3396:15e8 with SMTP id d9443c01a7336-22db3c0ec76mr25062265ad.22.1745479247872;
        Thu, 24 Apr 2025 00:20:47 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:47 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:23 -0700
Subject: [PATCH v13 08/28] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-v5_user_cfi_series-v13-8-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

pte_mkwrite creates PTEs with WRITE encodings for underlying arch.
Underlying arch can have two types of writeable mappings. One that can be
written using regular store instructions. Another one that can only be
written using specialized store instructions (like shadow stack stores).
pte_mkwrite can select write PTE encoding based on VMA range (i.e.
VM_SHADOW_STACK)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ede43185ffdf..ccd2fa34afb8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -416,6 +416,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -749,6 +753,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 4ae67324f992..be5d38546bb3 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -155,3 +155,20 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pte_mkwrite_shstk(pte);
+
+	return pte_mkwrite_novma(pte);
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pmd_mkwrite_shstk(pmd);
+
+	return pmd_mkwrite_novma(pmd);
+}
+

-- 
2.43.0

