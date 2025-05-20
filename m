Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BD127BF83
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737728; cv=none; b=Vh1VZK6GheZb0jYppRljl/U0GMOryj+SmVUaSGgECphCiCwT+OZGIHyAUaWShEo10zV05LUEnTtkW22iLlOoEwTiQXRFCzxKGEgT39i2EUl06r8Q730PCVgn1F24LpvrudkPlQvDzzLE9XAb2sWv0/6j2MYdvNuJ8oejJUf5pow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737728; c=relaxed/simple;
	bh=Q/7c3l+91pbtc17vrK7cILgBOCunvE8RUgZNX7LVw60=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pkviJtfDpxdargUZyvOZRYmtGUDblFvG7b3GgNHXgdeFSBzY9VFL14KR8rl+2ve+so/CKunNmmnOImn79WdMW8uXIuCQ0lP63i5EAHaba0H6XjFKJrU/M8wGEcHI3IvhAFWjRBw6VMYJffIc7FvQq45WjdQduegGfHwpABBDFOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YGaZYt0h; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YGaZYt0h"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a364d2d0efso1793234f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747737724; x=1748342524; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UzzgPYn9cxoLx+6WnOiRl/qSjy4IoyGOuShg+cjvCTg=;
        b=YGaZYt0hP7nfSfPrkla8NA4eEFz0fzVdtDC9AowwkKhI8J/YFCDxLF6dRKrhwfSevx
         dOWrpivwQB/EpkB5GLcYOA7KB/jvd1ZkKIPa7guSnX/Ra6NtKLlzYrHAQivcX3l7FIcP
         93SL6ToSE1wGzex1UoOTFZQjv5hisX37HczWBKCVLh/PxhbkQ0uBR3Sp93gwMohV7gmt
         O0LBhXjPgNQXt6Le4Ea9PqFqU2zEWT1Gp728hIH1T0hjad7YsL3Qoengfyea6jb754nL
         sGjSQKMcSv7ETMTb9m9Q1ERWC6uCKQ3tIhAvEEO+mLf44k+wxGOLaHSj0gpn4+jSwG+n
         uaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737724; x=1748342524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzzgPYn9cxoLx+6WnOiRl/qSjy4IoyGOuShg+cjvCTg=;
        b=Lck3jKm8REFd1Q8tB1a7vHplNZX5EERI49vK/1DipL564jitK9woevDHoRJB3XpzF1
         iq9YwH+NKv741nlGB88Lm6W7V7435iRaMgFwPde6taSIfJhcdbvcXIILr38hcv4Uo8D+
         mlerVZo21NfisJR0w9AzzEHJ8DWC4xfAS+xFS/k3p0mof65g7O7Y+J2SwC4l2jL0Kg0K
         IdW5t/KwgedsX11P7m+pylaJkkCgJ0GmePWuPyXzcziY/d4IQGd7mkDQ8oBv6Bum+vYG
         A6N5nEo5wT617gtVocgBWZueE7lTUzIlaa9V+kZIFu8pNqTn9usGcF3zJbY7pDDvvnxe
         G0Cw==
X-Gm-Message-State: AOJu0Yw+dMSCc5C+pN01cLLx1q9uWqWaNne0sMbZ/d/qY8h5heF0GZWx
	5A83PVvhXNy2TKgwyJccV926j67J40lrsl4HUSICAlpdaqlBZytk1up/FteU7X3mgx4+VTdz1jU
	TWcSjKDoIZcV/Xo3zzY7K7Y/pYqrzxCwcBWVjnDGgIzdPI1EqdgR7msiRoFwla16GU2knFxfek5
	ZLd3lcZrawpTaeRXUF89Yiq+bvMLFCXh+JBg==
X-Google-Smtp-Source: AGHT+IFsawcw2NGnFlpOSHlJWwHmRFAq5IgBEopLDgG3RYCT6XjQl9IYryczR3ia7dvV+MZIM+cYzQ5y
X-Received: from wmpz20.prod.google.com ([2002:a05:600c:a14:b0:440:6128:9422])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4201:b0:3a3:72e2:1e5b
 with SMTP id ffacd0b85a97d-3a372e21f5fmr4698777f8f.56.1747737724333; Tue, 20
 May 2025 03:42:04 -0700 (PDT)
Date: Tue, 20 May 2025 12:41:43 +0200
In-Reply-To: <20250520104138.2734372-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=ardb@kernel.org;
 h=from:subject; bh=anD6k9uPC5CYROI2u53OYyoXCysohBYXUpvvBhyybY0=;
 b=kA0DAAgWMG4JVi59LVwByyZiAGgsXGqgjrEYpWVcAACdt68sR/l4thpmMySNtnOUhoskFJTlV
 oh1BAAWCAAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmgsXGoACgkQMG4JVi59LVzfogEAtQ/5
 zN0YAmaIkdzsgmQRSKF3JXLZspUpf5e/18Da4+oBAMRfiLnDtg17pPfchGKoBNnqabrJxpVh9lY JomJ1eTQD
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250520104138.2734372-13-ardb+git@google.com>
Subject: [PATCH v5 4/7] x86/mm: Derive pgtable_l5_enabled() from pgdir_shift()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Instead of using two versions of pgtable_l5_enabled() which go out of
sync a few times during boot, use a single implementation, and base it
on pgdir_shift(), which can be accessed cheaply when running in the core
kernel.

This is the most efficient way to obtain this information without
relying on code patching, on which the 'late' implementation depends
today (via the ternary alternative in cpu_feature_enabled()).

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/pgtable_64_types.h | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index d8e39c479387..ed847a90cf4f 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -33,18 +33,8 @@ static __always_inline __attribute_const__ u8 pgdir_shift(void)
 }
 #endif /* pgdir_shift */
 
-#ifdef USE_EARLY_PGTABLE_L5
-/*
- * cpu_feature_enabled() is not available in early boot code.
- * Use variable instead.
- */
-static inline bool pgtable_l5_enabled(void)
-{
-	return __pgtable_l5_enabled;
-}
-#else
-#define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
-#endif /* USE_EARLY_PGTABLE_L5 */
+/* PGDIR shift == 39 -> L5 disabled, 48 -> L5 enabled */
+#define pgtable_l5_enabled() !(pgdir_shift() & 1)
 
 #endif	/* !__ASSEMBLER__ */
 
-- 
2.49.0.1101.gccaa498523-goog

