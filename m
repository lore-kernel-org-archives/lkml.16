Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CB7255F27
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972213; cv=none; b=su0eUJqGtnXY9/grLfYPtKhofgRanOM/sS+DcmfEkR8lKYvHOQpzYi9O9YKRz6VO0KZEVPZrwuFbg1SgpHqgF03TaoVXkSrYhLAoTvDyvr598fd9gOT2ikkN/qedSmwfTlhRGmhRDOOkuVoRj21S544IlbXW9GO5QhQpE06MzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972213; c=relaxed/simple;
	bh=botWNQij/L5jZa9ComPdhZ+E/aGmcXy6ciNlZPypsCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZroG+zDtYc5EMpcBghC/jeA9itkbC80HHfj/5tcVzhTpOnDSwe1/Kmr1vSsk3zGqDvFYq19QVTPypgOmdFdbk/s7+7az26JO0K9yEnsCLLZpnZY96F4DE7cqb2HtcpAonQiY7O5aQ7VVfqe63nGlIcatmKKtYxa8BPOEydkD4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QAPQrGCt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QAPQrGCt"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c33677183so70004235ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972211; x=1746577011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=QAPQrGCtsocsCJXp2akd2nkHWsE4YtVEH8c2xkjY2omoIEZcSOkJaIO055z5U1rU1J
         9UvcUR3UpEtG+3iZZd3GccK6u6EEatQpaS84gRPe7wewQG1UcBQUMLN9XnW9or0OzvIv
         2373qyfDdJWssVvmXVW0P5SgtPmKJlvyjQEAjQoyao9/U26+wHLuoTIPFJK6dv6k1zd7
         aD/h1hEvLdOAm+0dFgAugWqW/viZvxCnZF7aUCK/R3t2f08C96H9smjSFSf/5TqzWu/d
         m15M4Vz4w+DNEbchal9GAErfoTHqFM8hPl8cme4VTngTc2Wiq1x9ZKbM8NygRkJ/RiiE
         hFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972211; x=1746577011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=UIWPjy2laLKmcvyqis15Go47TcUhOcztTpVrYTMvSWf48eLZnLno1bGMjh8J64bQgV
         RMhI73SoGsm8noPauFc7Y7zr5lwOdfxTHEMzYpnBK4ap7+Hf1rw6N0QUf/E5fLxNrewZ
         jz5PT2F1Q3ZAHG2jlKfiqc7K4to/jCL6FJt2WvlfPS5YxFd29dxjb9eC9dzRvrl/SblT
         u7txnQO4PCAXGXUhWFJ+AA3FocW8sNMgc4B2lCZSAYp8KQpHKTJYusgey6sD8FhOjCpw
         pwJEJHyeq19/GF5X6/TnmPwyCWrfVABhp/3RyagVBwY5rSztgtSw+wEqNn02c7ZtuZHA
         UZ9A==
X-Gm-Message-State: AOJu0YxvPER0qA8jwg12W4+HekdQ8jkKnsw3Sd1SJq2oCTxaOYxKbIGG
	mIrhtH8Ksr2Y/KwbJsd61D6QXwdHK79NwhI5tv7K2iKCH9/DjFTLqt3FNkp3Cbs=
X-Gm-Gg: ASbGnctCmUvl5F+vtKyp7MuH1DpJfIwwN7sx/ITge5MRYnAtA3Di30EVooQFIPYgaLW
	Ic6g63ac9S1U0uGAeFS5x3Px876ZFkPxW+HhkrdAwm2QbkQ2LXhXmj8vzPF/EPNeuqr0mRLOUPO
	Lbe1aNcgNz/MbItoo+8zICinM5ASXud26khnUY3tofewf2nxbTJK27BmfWnSxRSPwHt3L+Bym6q
	Rpe/TsKVmouNuxtuL0bnP6OKgnn4uexSIsyyYxDKwu00Cpc6i9d05akVxS4woXTp4TtfGNPe6ky
	dsDEAENu6GTboUSYbmQ65XUmuEmODS2vAVs8k3AlD0Iyf7vhpbc=
X-Google-Smtp-Source: AGHT+IFy7GE6JtLObwZnxUszukpaDqp+5LC/aQlBmZqdBbVLTaJAIv9ljsO1vQI41frLcmnjPyCwjg==
X-Received: by 2002:a17:902:ce82:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22df57a6ee4mr7211325ad.17.1745972211261;
        Tue, 29 Apr 2025 17:16:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:50 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:25 -0700
Subject: [PATCH v14 08/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-v5_user_cfi_series-v14-8-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
index f21c888f59eb..60d4821627d2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -428,6 +428,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -778,6 +782,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
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

