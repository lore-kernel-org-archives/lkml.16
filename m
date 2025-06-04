Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE00C20FA81
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057397; cv=none; b=KtZI/+KKCfj7ShnhAaD8IsM0Rw7umBNDBdNZd6aZCfNJN7SVQlahhYUqY2W6tyKBrk4BKQHS006Gy1CEBmotPVOJY0seAxsIMqQ0TcKV2vCKwK9gqsV2JKEiqG/ZRZSg08LwUMBy2slUNSvPfMQXy5Fl0srmpvPpTZbWIpdQEzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057397; c=relaxed/simple;
	bh=5l4eYXK/UGIl+TXQnZwANU66ClnBTNssKdiHYV/yMZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AiCzWriL1zXfKGzhOBkbuIhoVyP52dr9Q0f3cEZtJoJbw+owku8ZBh2wuzY7z6NCaxQliPgcOGTZhQZINEpCo63StdyrNLaHBxbsrSk6fCVHZkVfb7EQBCV0a6tHELHek50nXdz0GseBDg0+T54kNXNFyTIfsiw0dW1iwfbW3PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AFkwo8kR; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AFkwo8kR"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-311a6236effso64773a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057395; x=1749662195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=AFkwo8kRJMjud/rwko8n6NMqRVUEg5eXTYwB2mg8Sz38y1yTr6IMjHYWq7SBPzafXw
         9L4Y16FkzdBoBjQBMj0hUBCii6H73b8EmumPhqYXqRmqumJNeHQbYRLGesVMoj/+/3pO
         nw29qRumIb4h265dL1GE7Br6Seh1mfp80kLWtYdSXCGtp55Z3wmkmwzuos3JIk1UKxmf
         9T4LubxFNgMUyPBdmEL5zxLpYCCPOfVbirRBFV8uo4BweAsfYynFa8GF2xu32NZw5jIh
         zl1hitW5Z7vyEoGZOpfdcw3z2dw6fMbUdBGJldbL9Hg263zyU7iLQWUqh2D4Nu+d6bWZ
         LfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057395; x=1749662195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tvKQDIIBJb26wPDVIJoD2xzubcY8uay1NjKLxC4PFw=;
        b=TjWXLGfDaLtNFHGHYZ5kHyJPCOn5uRiKY0fDw2lIzydix+72b0UIarmJkBkWRD6ZkP
         80OxkHyk8fSa4cmv8O7pouyFu9z5+bXtLQZGSEEp88WUVED2dQi7zVjKOQjubUdLO7id
         02SjjPRnKw+7/w92mT79OdHGnsq6+8nOZnZMBh9gnfaHdJ2mjITmW4Yg6CqhXVtYltYm
         T0vPOjyYeNEWCHZsRjwfjprTlc5CPXYsc07zU92xu0QGDxZJQX4Y/s37nKmVcz60A/Dn
         z+33Z4BuatVBtBvl6gFHLuYcWwPRx0IEb0DZCTVPGFDri6mvtywj3GgW1xXFg5LXACIQ
         0cYg==
X-Gm-Message-State: AOJu0Yy38ehk6J+9MDjemHky+LMX0/coBTuct00VI/OnhEIm/qontrWa
	aQSaZXBUFnqnWorjVdufCL/nkeqwi5x98ccZOr+vK/yp06v3MISOD85mNvCbRgMkWps=
X-Gm-Gg: ASbGnctNFfQXXsiDLCwqLce/UvzP0UIjXTNsUNShIAyaGZLaW+ePH7A1ZhC2WKHUtIP
	971Q20WQFdbkQvPLIicq9ZOzN1BZaW4a4EOK3wgeuAamF2y+HkTnRJrEN9j8Qf+6modkBAsyLlC
	+FiFObpBrN2t9GnN2gTHY1CkLghu18cTtyD/LwCfhMRTykgzdsc4wCJC8yu4DbdIS7SjiOHhsGn
	Wb0tWrJAkO9O9LxsL99ckEwxqxLUI1i9m2Tbxx9Tu3mudlTgXimVwggjAFWCcjD3E57MYkBna5S
	w4btp4RSJyQDyr6LcgztvDX80l87ZppKkpo6v/XXgK5pkOkV/81XIwBYZfkJPAgMiyR2U47W
X-Google-Smtp-Source: AGHT+IG+Qv2DNy5GUYLSr8qaMd4z1JKIMYQvC0rcwVPQ/+dBpmSSBbz8jQQs3wb6D/V0cK/kK11nfA==
X-Received: by 2002:a17:90b:54cf:b0:311:c5d9:2c79 with SMTP id 98e67ed59e1d1-3130cd31ea9mr4868567a91.21.1749057395003;
        Wed, 04 Jun 2025 10:16:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:34 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:31 -0700
Subject: [PATCH v17 07/27] riscv/mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-v5_user_cfi_series-v17-7-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index dba257cc4e2d..f21c888f59eb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -433,6 +433,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -778,6 +783,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.43.0

