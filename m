Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9B322ACEE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718536; cv=none; b=L3k+AmG6U/UZ4c+r2h+5Jf4lvkgFCiI3wivRoRuZ8W8AQLI2Il8bRmEx/rHAdIn/bdMnv7+dtBsXw0LxHBz/6BADUHNwArOG1bA//zGpGus+uY03KBNLgSCNu6tuumaIxY0t3HrCf479EzVh4+pcy/yi+7DfHuq2ykJOudRK9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718536; c=relaxed/simple;
	bh=d4Cya/UiG1tB2moIkhGHDZ8HTCssqhlwu9hzntgTXwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgXwioe4VsQvGKYCkxIKFRNUYKrX3B3Qd4gdv81nxnfM5mHiwuvp9CVKLQZ9lW1qsDNxDg0kh17KIcOAvAdkuMS1omODZK/4ypQQetj31uVNUqLLy8ZVyIbgQ9FximH4aB1E6pW97h5RhC9m/vB5F2Y20BjOYYCxS7p0CBNvO0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=I+bIfjk1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="I+bIfjk1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2162c0f6a39so6259555ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718533; x=1739323333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjuyUsrRmjsdgE2eHiV1ew63cZ7gXvE8Gyqp5e7FHmI=;
        b=I+bIfjk1HpicG4fCzonsfvpWBOxSbVapXLnJVDfgToxhF7ndJKU90bjGHr1XtHxYYt
         sIlrTmtMcWGZN2X6uqNYmjCwugj67OvOCAI9a5kRcXVPbEWgo+XZ+pkJDuEAD8hpTJXE
         PIDjnOMkN8u3wSElyPo9vuW7U6GSDFuNgSy8/xRXHjKkO7Ay3UbAYlrf6b6USbeSh3Mf
         MljvrR5EfiJzbBdi2ZvbnCXSihYhwuUCpczMVuhQLrj2C0z1RYpLoh+JNR2/AKjrH0RD
         2zmT8ngmS6OOGkfb+eHECWOHAqUl9U6WoDybQxt6PniVZV4dF01qwRl6f5xPdznx9CQF
         jI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718533; x=1739323333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjuyUsrRmjsdgE2eHiV1ew63cZ7gXvE8Gyqp5e7FHmI=;
        b=vHroqzApJrbSjnnOYIp6tlz/LN4QGPI4uMHod+mYadyn6YTgz5m9UpPfnheTFf0WK7
         /N96XdMX7PqI4nKhI0LrQcZaGEEKVWr/uOwgRwE5Xe7tUBFijcOl4sL5ghfi8p5BtA3+
         lUsUTcGV1LRwYU4aaUyV2skoWsbirCj1f2EWwsTD/3MXCVWxP9S9eE48e3FX58HndWtZ
         AgqXBAwCPBLZsqHm2ISpVM/W/+Qa73UgRp3vbLoaqvBzKKUTUAaoBw5pGRTuGzaM/F+f
         rStke6SxSAgPFK2uwPSiWW8K7Z3tvMW775EnAD6Heqr+BU4iuO9X2CHamD7V2MyGQUlQ
         B4TA==
X-Gm-Message-State: AOJu0YxXR8JOHC34nRGHkHEI0JwhRJSs/8DI/SMkWNuRrOCjggAQVwVG
	lF5YARF3nGYeOUDbL57v6IqG/Clc6Al2fWIfdGUx8SeHsmAExq8lMLBKO3bydiQ=
X-Gm-Gg: ASbGncs1+KpTzQviH0nxEAZ4SxuyONMQynzQf3xAnh2DMkr+pMqOiAChisKsXbiuc1W
	9Sc9DD2yHCpcm/IPYWHXfRayUyqwVZ9aBiNcDW2qCBZXDWNECItwIJDTVQQUJ63cT8XVLJD0F3V
	xD0szdE3KffGokxgXMN5GM5xoAdJASEaWPu95xL8qDR4QA0dQJwGaKUSd4nE4615cHd6OjX45/z
	cgjPL6Hp5wXMt2STX61GHSrFDlZ+TcgtDS4eiz3IgZmg1Be6MnZ1eGqqDY9U36Ofw+ppnLDe/6E
	g4T+bXzmP8FuezxxDQ4IZaRL8A==
X-Google-Smtp-Source: AGHT+IHlwnAptZSky9Y1DYo277tRu5dBk5BHHEzzWIoM+u4E8FH3BeXq2ANIOmZF+k6xGQHG5TCG8g==
X-Received: by 2002:a05:6a00:2306:b0:725:4915:c10 with SMTP id d2e1a72fcca58-73027296652mr8559134b3a.10.1738718531190;
        Tue, 04 Feb 2025 17:22:11 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:10 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:56 -0800
Subject: [PATCH v9 09/26] riscv mmu: write protect and shadow stack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-v5_user_cfi_series-v9-9-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ccd2fa34afb8..54707686f042 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -411,7 +411,7 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -612,7 +612,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
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
2.34.1

