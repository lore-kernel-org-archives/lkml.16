Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243192750FD
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737721; cv=none; b=RnHrKp48p9rT2v80IFCXWEsQPrin2U8/76gS8eLpp2upWBr26sm8zpDh3pTjHK8UN9Enuwr6I+MYCuq9kAM4nLKOT1PY9HBiG7anD7j7APsoVC/9JecjjtgiE1IQOThKu1sdqd55a4GTGmIqVv9ySdgDMUkXANC76yCY+2efqaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737721; c=relaxed/simple;
	bh=vbW4J15gT0Anek7l1UlLR4VB3Z3pNTgkHhKTuT6ywMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N2polUxDSF9WsjWkllRQTMkrFsCMW1NLms5nqq4tW5NY1wTDoZwM6Z6QE1vdhOrVsUon58x25BwXn7TcSV6nD3nJxkWpHJxYr82YeOMbVug/2MirP7KFoJvTlHbdG9OxQvVixzKEWRZOGYwgsLd5bJsdPy+LYiME6PZB6Ku1jzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WOAIdj3j; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WOAIdj3j"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso11127985e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747737718; x=1748342518; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2i089Y2WwQ9qQU2NJo6zV7zkt8mG6d9ipwjqGuYXJek=;
        b=WOAIdj3j3nQceSYc6ecI4eOZCw+cCA68+Pesnwlr2A0hMWpm8ivfhZFWplC+p2/L/8
         Lh8yBZAGRrY4s0Mp4em0+lh6hJx/N1Dknom4joAnkNzJLRd5bk+eS0vrpVmx8hKCvWnk
         K/kPXfXUJs4uBiuBdhVh+RgiJnqvfUEm6Vt52JXu95sdtjUXjXnXwxENnMGIKC6/FXtL
         y2VAGNMRbYl7YLOFfJwRTMW1LdUYNBa+6Jw5uP62UWH8r0nx7Pk8RQF6Zq4F2pl6vonE
         nB4HY+6XF2Bmefh3OHGLMM9OELIPzCBoO0PfjJpr56T2nJFYw4sTCNYTrdfaSQEzqoxx
         bpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737718; x=1748342518;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2i089Y2WwQ9qQU2NJo6zV7zkt8mG6d9ipwjqGuYXJek=;
        b=U36NwFZRmWJbMD4reglhyl59W6k52j0tXhwShRgbIvaD7KdLqk3g+Zkz24tXLa4NVF
         3iCJQftwxhDRH1YBOnSrQ8nb4pdc124MptZyacOuiFKglTeV+U2gkP8G6QSbQnt+ot22
         Q/67wId7hcrY+AhAdmAXVxuAuHjtE9f58pSprBh4CGOdZej2DUfyeohTKpAEuFUjxH+3
         lmI6W3f4//b2q4VMRCD/bKVlAefsPUM3M+aIMS3qHRtj2jmLoK4eA9DJOt9UjP6X9T5A
         IWXqCNvi1/IGLM4UbE+yHqROSQg/vO9kW9bqqGjNEFl3npo4oe8vinI3JmUdszDrBeeg
         0dFg==
X-Gm-Message-State: AOJu0Yx/tQoThHv/rJUSiahuo0SugFglE+xhc12mUeGKP888nb8Ahf0k
	r7UGD8V4EBihnrd+6RELn5yfbxwG6FlBlMGvxDx8kJ1ReznuuBJ3l08Eoc2ejmf/Ry21MqIVVli
	/GLvsh3Qes7qBneWuUm855Q/PluMCVKtDy4IioXJXXSuE0o3Vc2pKtZSO+VxTDVviEm3511qSoF
	UBRILCh2YM4RDwNNQNYWR4lVl0uRKgMw6KLQ==
X-Google-Smtp-Source: AGHT+IFBU8TCAwpTPuGWuckj9SBjBaf7waNzV9OC3co6AKbdhaL4TZkNRZwAWSi7F8QhIX62Kn75NxdT
X-Received: from wmbfm26.prod.google.com ([2002:a05:600c:c1a:b0:442:f8e9:a2ac])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4706:b0:43c:f629:66f3
 with SMTP id 5b1f17b1804b1-442fd63b22cmr140816855e9.18.1747737718459; Tue, 20
 May 2025 03:41:58 -0700 (PDT)
Date: Tue, 20 May 2025 12:41:40 +0200
In-Reply-To: <20250520104138.2734372-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605; i=ardb@kernel.org;
 h=from:subject; bh=gDhtt2gsfPR+q9p6uoVx2wiSpQ+yOS3VasjQVtcD7TY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMnJjX9SePeX/u85N9le6jy7bg/6UjMvek6854f7tprn
 1/5S4ejo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEwkpIrhf6T7o+2qxTPMc34s
 /H8mevdUscnWWc96NIs3bzx27tbpHQIM/502GM4q+LSJe6qh16eUO28e7zXo12Jl2XvwefFb3vb cdBYA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250520104138.2734372-10-ardb+git@google.com>
Subject: [PATCH v5 1/7] x86/mm: Decouple MAX_PHYSMEM_BITS from LA57 state
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

As the Intel SDM states, MAXPHYADDR is up to 52 bits when running in
long mode, and this is independent from the number of levels of paging.
I.e., it is permitted for a 4-level hierarchy to use 52-bit output
addresses in the descriptors, both for next-level tables and for the
mappings themselves.

So set MAX_PHYSMEM_BITS to 52 in all cases for x86_64, and drop the
MAX_POSSIBLE_PHYSMEM_BITS definition, which becomes redundant as a
result.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/pgtable_64_types.h | 2 --
 arch/x86/include/asm/sparsemem.h        | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 4604f924d8b8..1481b234465a 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -56,8 +56,6 @@ extern unsigned int ptrs_per_p4d;
 #define P4D_SIZE		(_AC(1, UL) << P4D_SHIFT)
 #define P4D_MASK		(~(P4D_SIZE - 1))
 
-#define MAX_POSSIBLE_PHYSMEM_BITS	52
-
 /*
  * 3rd level page
  */
diff --git a/arch/x86/include/asm/sparsemem.h b/arch/x86/include/asm/sparsemem.h
index 3918c7a434f5..550b6d73ae22 100644
--- a/arch/x86/include/asm/sparsemem.h
+++ b/arch/x86/include/asm/sparsemem.h
@@ -26,7 +26,7 @@
 # endif
 #else /* CONFIG_X86_32 */
 # define SECTION_SIZE_BITS	27 /* matt - 128 is convenient right now */
-# define MAX_PHYSMEM_BITS	(pgtable_l5_enabled() ? 52 : 46)
+# define MAX_PHYSMEM_BITS	52
 #endif
 
 #endif /* CONFIG_SPARSEMEM */
-- 
2.49.0.1101.gccaa498523-goog

