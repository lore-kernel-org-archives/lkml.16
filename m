Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA6528C2D0
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134735; cv=none; b=T02A3pVUmhnGDYpEOtOW0b2JldvN8j/PVosjcoXYvMb2opTvz646x2MGpJ4+FX8uoNBuw/Nw/6CGVlT2WnvhZYyaZ4RaUMZ9/pUooSL2Cyh4ZyTvxWIQ+qa/txgxjJSTMZpj0FvdORfTC7rVTRTwPVBmYgxWQ0TgwZhDgfe8uIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134735; c=relaxed/simple;
	bh=Zhxtw4SO7aK2WDdKFZdJ6jQZ39UBzSaBN1zdKJ8JqV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X3P7d96sNtv1FcffUhIwdZBRcfUT0PtdvcdjkG1WNyvCEFmOCMMvnUrP4e2TpMeUBZ0S3wpqpSKhpxUkSwpaVZJHzjD2LV4iVMhxxSjnHCWyRD4RxJn2uyZk8VkWI5QCrfgfoxcrp7lXMRXBTj2vyBwAR7EO7D0XAy9aA6/pBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pwxmHKYH; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pwxmHKYH"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a0b6cb5606so2451423f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747134732; x=1747739532; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPb+/2cCvFDpZsAPmT7NZHK5ljAWIgqQu8Z9jqyoi/w=;
        b=pwxmHKYHu/GXEotciPfuaD9Qo4S7Pm3lQDhMgo6eGEHwYHElQktFrMbU+n8/61Kqy6
         glMrWgvUeyd2iaSaXeffLunnyVzbi/7nq8GSu4j6Z9waLNsE4OKZzmKJgCf5Ku2cgJmj
         xq8k7DGj4ZsP3U30nZC0kp9JZjnkUfivKZ+NThfs6JZngW9sezJQJIfhPbXfRa9yIvD/
         4KRbXv7sSL+gZfMP69GGF9b/gD63IGrWPhcwqL4rpy/BDUdA5aHM/rUlHQ5YqAaeYiTq
         M9hggQ++mRXAyEb5xRlQlGp1Rckik8w6U45QcrEwDuQrmW+FKpzu4udSxMd+ZR4x2vSv
         JHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134732; x=1747739532;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPb+/2cCvFDpZsAPmT7NZHK5ljAWIgqQu8Z9jqyoi/w=;
        b=pN+CoBnrha8IfedNGn0amWTO0KSi2KMy1ymmJjSz86ao5f+c5kXCSWA1uLvIVRDMkn
         f0c8s6B36IYNSg9X8NukurFZ+/iudlNRd/AJ0zdVbZVIxQS6uFZoxj7CMTAaLCQCC5pm
         nJIYpNWBa19W8lLODyNNxTYhVrT0szlySlhR3sP4XtOZigYCPY1Jfx8BZNbZ66Bw8GCO
         cl/j9S7BQPN3AO13c/8w98Zze4kj51wiXehJIz9n4wIOVED0SoEsbKr5mKMN9U+gQget
         QR8r1JhLYJwGGGDb9vNfWzwNv0jkUPEIsbgv21BpcmYlDS2ea+sWcUe/gb50jBh+5PjH
         RV6w==
X-Gm-Message-State: AOJu0YwsReha6TPU9OgoSEKX1KtwjmW0yw/8bfGO4sxQ761GRNVapSib
	jABXAnxmA/ni4BvJrh9mWw6GW8D/kW8z3+gW7tB0LUoKiqMzbvPqwKFEw6+S7+YXfqew7/kIWRP
	VmfeK1GFYGNlEdlTT20YuJKNMHjL5hm9pK6YhwS1rpxbWVy54YwGQQQEuOeM22mPX6S9eh0zGQR
	p95D9OqMBNXqBnhq43fK03B9hJrhDhZw==
X-Google-Smtp-Source: AGHT+IEeQ0RtH/AvWRg0Hd+5L1HThkUD9VnsIM0XqHiZr7NQluCa4rbxX9PABd6/av4XKTxpIR7+T9nI
X-Received: from wrgb4.prod.google.com ([2002:a05:6000:3c4:b0:39a:bfde:20c2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4205:b0:3a0:8c45:d30e
 with SMTP id ffacd0b85a97d-3a1f6469589mr12214481f8f.35.1747134732583; Tue, 13
 May 2025 04:12:12 -0700 (PDT)
Date: Tue, 13 May 2025 13:11:59 +0200
In-Reply-To: <20250513111157.717727-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286; i=ardb@kernel.org;
 h=from:subject; bh=Bo0IJENrodyFP+G2e/kdJdC192ghpizsoVViW26/V9I=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNZ47+B22tTeQ0BL2MFnaNnmbk2v+7ae9NcNrhzx/R2z
 T1Ppco6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEROFzEydH8sVOEz8s/Mj3/o
 /XS/9VzWg1yvnl1l3nV2O8PcbYevmDMydBr7n3R9td0hzZ3RI/3G3JllHB+CZ7ZfnqNgtMOj/oo eEwA=
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513111157.717727-9-ardb+git@google.com>
Subject: [RFC PATCH v2 1/6] x86/boot: Defer initialization of VM space related
 global variables
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The global pseudo-constants page_offset_base, vmalloc_base and
vmemmap_base are not used extremely early during the boot, and cannot be
used safely until after the KASLR memory randomization code in
kernel_randomize_memory() executes, which may update their values.

So there is no point in setting these variables extremely early, and it
can wait until after the kernel itself is mapped and running from its
permanent virtual mapping.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/map_kernel.c | 3 ---
 arch/x86/kernel/head64.c           | 9 ++++++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 099ae2559336..905e8734b5a3 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -29,9 +29,6 @@ static inline bool check_la57_support(void)
 	__pgtable_l5_enabled	= 1;
 	pgdir_shift		= 48;
 	ptrs_per_p4d		= 512;
-	page_offset_base	= __PAGE_OFFSET_BASE_L5;
-	vmalloc_base		= __VMALLOC_BASE_L5;
-	vmemmap_base		= __VMEMMAP_BASE_L5;
 
 	return true;
 }
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 510fb41f55fc..14f7dda20954 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -62,13 +62,10 @@ EXPORT_SYMBOL(ptrs_per_p4d);
 #ifdef CONFIG_DYNAMIC_MEMORY_LAYOUT
 unsigned long page_offset_base __ro_after_init = __PAGE_OFFSET_BASE_L4;
 EXPORT_SYMBOL(page_offset_base);
-SYM_PIC_ALIAS(page_offset_base);
 unsigned long vmalloc_base __ro_after_init = __VMALLOC_BASE_L4;
 EXPORT_SYMBOL(vmalloc_base);
-SYM_PIC_ALIAS(vmalloc_base);
 unsigned long vmemmap_base __ro_after_init = __VMEMMAP_BASE_L4;
 EXPORT_SYMBOL(vmemmap_base);
-SYM_PIC_ALIAS(vmemmap_base);
 #endif
 
 /* Wipe all early page tables except for the kernel symbol map */
@@ -244,6 +241,12 @@ asmlinkage __visible void __init __noreturn x86_64_start_kernel(char * real_mode
 	/* Kill off the identity-map trampoline */
 	reset_early_page_tables();
 
+	if (pgtable_l5_enabled()) {
+		page_offset_base	= __PAGE_OFFSET_BASE_L5;
+		vmalloc_base		= __VMALLOC_BASE_L5;
+		vmemmap_base		= __VMEMMAP_BASE_L5;
+	}
+
 	clear_bss();
 
 	/*
-- 
2.49.0.1045.g170613ef41-goog

