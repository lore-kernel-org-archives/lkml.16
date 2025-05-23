Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344FF272E68
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747978304; cv=none; b=qwfN0Lz7D+3Giw6su2WHCkeQa+E4RTdOSnC5DRgXjgFdNrNigTsyWSGAt8d5y8o72mwrM0SRRLjPPMLLzGMd7L8ebNPqIQ1yoGaJt0yB/YOcjmVz6o6kFUcZ9H4dm6jIc/cuTAIwbkf+JLkoOtlMqXHG8qPD1PNft8BUFAV7LJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747978304; c=relaxed/simple;
	bh=6epe1IklbdE30nYdZrV0ZHwki5ITawyBnbVBknH019E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqPVboHhIsfwEdcXLxmQf0SDqhSEnyh+oaC/xCkWoJjPslgWHaR3uAZIL8BGx2Znw+NpFC2AaFap+zm3lpD4I4AlN4xcLFfaUHAGGEO23DX/3e6RHUbLaoRS/2sWC8ggGqLmfZjLDT+7FIrfgAUrOcebQjUAl8XdJAqE/51ZACg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1HXJLE/l; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1HXJLE/l"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74267c68c11so7560848b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978302; x=1748583102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsODLDfRcPuDSErfbs+tzfaJx/MFrIF5cCrvvQql1Yk=;
        b=1HXJLE/lmFrk0jQ48fX7fjgd8gs812bh46rE/qHgjBhGkSTtMTWsvj/97G01EO8oJo
         aDy8vdWbt1u1pMMI78JVHw4/DZe3qOfxkHYbI9NghNxNt6hWDsyVbHciWWX/Lwy1zOM3
         k/RQSSakKo0qVpqiRbnrcSHSfJTxTSA4hm2uugvhYN9StO0Bj/l+xHRJfIQGP6AL2+ud
         4xbiWLWPlXjvOmvJW3TdbrZzKwLSDEy+3uH+uE39KWiodta0D3N3CQz9Vl3lSdGYkiAz
         IPf3eLuKV9Uhto6XlvzJQLoA9j0AwoBVdrX5OnvW7qIJUKFRyXQt/nthunWsguK3ZbYD
         GZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978302; x=1748583102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsODLDfRcPuDSErfbs+tzfaJx/MFrIF5cCrvvQql1Yk=;
        b=uSPtFr68M1fyx3cdUFKRc9tUAq6Qn9Don5E4vpr9RV0gVQgszw486EHYKB6MlZ9e9l
         5+5ryG3j+PTaBvlA+wuRezXSLSHJwcMB1LetDHNZweT2hwYP5nBKqLI6E7zXUka7ev2d
         PULYYibExhUVzBGiS9J95HLUwsKozS237V3SUJzkU9pLQcC1Uhyk3JyQBGycHDHtu/v/
         HmFS4O+x1jFVd6raD2SZ6RxM6ib0b0hLYiuGIwrXnMIj/Wi/NmLfifGlB4xt8FsUus7Y
         CgNMmGwSXQihMgagiOBt/6o/GutIezHyH24nVANT529q6TglvI2qgvpOFKa6YcBLkfXZ
         54NQ==
X-Gm-Message-State: AOJu0YxP0WxvViSV8dEf+PTuf3iRwy5Me6saAVhtuaS/VIniPuhU1pdR
	QzZ2WXsNpfMvjd6ZmYno3hWxtDGaLlVLahWNqqWp7XbG10x5wniUE7R+EoTM2Q+vRpo=
X-Gm-Gg: ASbGnctn5iT3x0UN/Eh86DWNRY2h9ZgQPnyod1xIClv0CVH9ad4B2eV0mhlBL1gLdFr
	N7tGXJAWjke5YKMhVR0qt9bCHMpxTGfQ6mFphxrfMURJt33t/CxVvA9OqcUSQBAT6/APHLJwF0J
	yZS7Ujk7g+v8KMNvC00PRBiCBYw8Blw0Jg4KeaSNj/BNckAbSNQSD/asyXSOLK8MQiBV5mm3H9t
	IOoQ8m1fO1JKgiFYnUwdc3GDVaDwlWYGNzpVDz8aQUuqhfEZqLWxQ9VUaBy46/LlPoOLJIJe7OD
	8up9i+JcQUHocCEuz9c70Nf7X2rgqdrLkscVEJ8zR1PQ5XpUSuNOdAyy4PNvnQ==
X-Google-Smtp-Source: AGHT+IGDLVr6ZJ9g2UKmuR3DGUz8wUaNVCkk9XGn0el3OWW6yYG/d5yInq98aQU+8QHvwqvNBOnbXw==
X-Received: by 2002:a05:6a00:399e:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-742acd726demr38701066b3a.21.1747978302507;
        Thu, 22 May 2025 22:31:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:42 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:12 -0700
Subject: [PATCH v16 09/27] riscv mmu: write protect and shadow stack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-v5_user_cfi_series-v16-9-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on shadow stack pages, clearing up W bit makes them XWR =
000. This will result in wrong PTE setting which says no perms but V=1 and
PFN field pointing to final page. Instead desired behavior is to turn it
into a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 60d4821627d2..4e3431ccf634 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -423,7 +423,7 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -624,7 +624,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t read_pte = READ_ONCE(*ptep);
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH

-- 
2.43.0

