Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83B326FA5D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406645; cv=none; b=dMEl2e/MsSFnvmzsdZa8yYCYW4iE6ByRcYlPde6veRvXiqODoTI4iTDGIEYmlRaNgGgx1ZZH5Nc5wqSVgj2mMQx+hpHtm7jiIeBZBWD5133GCaI/XQyy3QiOoKdWzdp6hM/fKDnxc0PcL/+mt3XC1oHmUOpOhn2VFV1krLGl2uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406645; c=relaxed/simple;
	bh=gGpYZxg5+AcETpfTWoUQvD57ks0/PH9h0iv3aCMiNUs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YLK9Sj0YG1Cnbew20cOvqCHIbUWqfVP6Ik/JKRCwJOamN/J5y6w2LuAqv5RTE/RfGMtB/hOvOFmcWq/XMMuFNWv9K2rHwhsRbl/cAiHXbSYEha8W/W9GkWM3pAiVCBz6T/8wujbZ+xCYCIzactDKnCMBXYN5M6IygX5J8WDIsgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vk+S5nBm; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vk+S5nBm"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so3754125e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406641; x=1746011441; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dz/mDOsr201xeCvIvk7JY8XBjobiOcX7m1b5fgok938=;
        b=Vk+S5nBmnvYcMq/+QZ51hg1zQ0dkZjyVylJRmDqevQYAKVRSQ/ObEbcy43U/w5hyH1
         PJX/Nzg/dS9CUbdTULwlihq5mqOsgrgTtRE4aLYq5fbQ07a1DTBTPwOh1MWZvuTdfrJw
         HzfN7UvN5PKKpP0wgkiGJGVwokVtSDI3shvSPDct3abWXrjFu8nXh17Csfrzz3l6o6NB
         uwX+Mz6phmjJBbWg9WK2SzRPEfqVoSMRIRBmI8OPsdcaLy6CHeyEpiQHjF4B1y9PBoTQ
         y6+gJ5VAqTsl12dMC94eLFnufwX23N2TmEmSU7GkBhn2sxA4EvmxnJoa1GUxuvJ3w9Bv
         3dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406641; x=1746011441;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dz/mDOsr201xeCvIvk7JY8XBjobiOcX7m1b5fgok938=;
        b=o/djrGIc9nfowBCVkZyMC5Rgt+wJLyuvLanX+Gy8Cl5xKnuxdSGKv8wsbh+C8EnLio
         A5rmQZuENsLr4fT2LRQ/upr+plDKQsBbFoyx9mMMaxThTU1xaYfAmxnPc9F+VYAPtKvJ
         RZkZ05KT7DcO2jfBM3QYoLqiBoGG+AC4ZY2BsvyHMitWhgK9XU2C68xCCx4rb27O1VBm
         TbjPzhtjnKASr9mY6y02BNLcP27BOow673aP6v8n9BYvldacqtY9mNqKzO8GRd8HYGkh
         qRle4ICG21cfAwhYvxmg9gwpZEwhCJD6NKEE71H/v9Un1UZcWl9yWImTJDU4Z2KG79cS
         TTYw==
X-Gm-Message-State: AOJu0YywvwNlcVshHxsx2T1I0D6f1rMqUeKqYsu3nKzpIPALPgzRHhnq
	yHpqgoQfNlMLeOlBnNj8OGQBdegGTkvffpyH7SOXin0nZ0rANHqszVF9XWnW8IfEWgPok+madtn
	a/xcUmuvs0wYtxK2EC8JbOcN6TMN9Bks9UzvCUvAhcciPCt8ioi7w9nwXi5Zh5h7OHcHpfg59nZ
	netrIrAHKLO9ZphaUxpUtbE+uH5vicKQ==
X-Google-Smtp-Source: AGHT+IEU8MjGPKd0fdUWKptTodlDCfOm2x9U6kS3lSYO3BEh+tOROAdF34OcxpgYDHbvwNsdgPECV1c2
X-Received: from wmrn7.prod.google.com ([2002:a05:600c:5007:b0:43c:f6c0:3375])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c08a:b0:439:873a:1114
 with SMTP id 5b1f17b1804b1-44091eee173mr16483325e9.6.1745406641365; Wed, 23
 Apr 2025 04:10:41 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:52 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=ardb@kernel.org;
 h=from:subject; bh=JADx/rxGDZiU/7QnFcGFPRIEIAFKDCf42sLIuHIBDFs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPjVO/0SN3k1VX+rVe+Xlw/+/h/XhbP4pfP/CMuZ905/
 mHigYvzO0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEbsozMuyaINSpLWn0wOSZ
 NFNjR/iRwOjMucd2N9pcmhb1RtTw2i1GhhubucRe7Rde/8h5TkmVfovHS5fzvyvjG867bNkXoTs vgwkA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-16-ardb+git@google.com>
Subject: [RFC PATCH PoC 03/11] x86/boot: Disregard __supported_pte_mask in __startup_64()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

__supported_pte_mask is statically initialized to U64_MAX and never
assigned until long after the startup code executes that creates the
initial page tables. So applying the mask is unnecessary, and can be
avoided.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/map_kernel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 0eac3f17dbd3..099ae2559336 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -179,8 +179,6 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	pud[(i + 1) % PTRS_PER_PUD] = (pudval_t)pmd + pgtable_flags;
 
 	pmd_entry = __PAGE_KERNEL_LARGE_EXEC & ~_PAGE_GLOBAL;
-	/* Filter out unsupported __PAGE_KERNEL_* bits: */
-	pmd_entry &= __supported_pte_mask;
 	pmd_entry += sme_get_me_mask();
 	pmd_entry +=  physaddr;
 
-- 
2.49.0.805.g082f7c87e0-goog

