Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11C52BF016
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097507; cv=none; b=sliGJ5qL29OtlOkKpk204lXmNb78/WNUut4cdQS3J4/m4in/b8rody4pEJYVvtJRTBUDvzPyJVxSxk/xP49qEjBacL/lJ1pwbTFLauNhGKkn8cnMpMvQ7KaCwXDnUoYzciH8ph4nGrvfY8SWsOdvUHlYfGUI6ta6xx+DOUfVb/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097507; c=relaxed/simple;
	bh=GcubAK2X5FhvX3lKn31wF5WScXm/MYVsYGhQM9zkOGI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mMvv7i4+TqFwhf8W0Tu1U4ymJSzhBeAWCfHdRzMWtXCWiviUiq7aQ/IAKJcg9NU0g2W8toJrjgK612aTQ17fpLTTONAiAtQBbO7AChbtamI/yiEXA8TcND0Bxg3IysL5PQwse3fyFgi6WrFfUXNHPo7Ohm/VvaMUn3J+pIxa5nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zEPEQBKd; arc=none smtp.client-ip=209.85.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zEPEQBKd"
Received: by mail-vk1-f202.google.com with SMTP id 71dfb90a1353d-52af857ae54so1253124e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750097505; x=1750702305; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pigkyW7BcI5mVhb+n24BJs2W1x6DRYe3DJp6TE42oBU=;
        b=zEPEQBKdr1Kkvc66JXmCRnuvjhgen1eYdEDfc0i9VLLbIrTQoHENRxpf5tRrIKkrOi
         vxFIJiHSRgfazvIJZ+zNDLUuwTpDylKWNX9gt4pI/B4nqoTicOimCwYYHkVqwMM0dZFS
         Glt4t6ZajPeRL/KiO9jhvqc9HRhUKQmF35hE7j/46+xuC6LTg+mJJcR/E3kCYnOPtmZ1
         fyyWM60AXmX7teAoHMSq1qfM/z5L1pkcRpKaADz6NF4lZvn+gUeEhylZ4NDNCy1pt1pA
         +rYrLV7ZEx6J6IW7SBkPurkZA8c5+EtA2+GjOejOszxN0Nx/CYEem/+hSAoiTbsqHS+8
         gkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097505; x=1750702305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pigkyW7BcI5mVhb+n24BJs2W1x6DRYe3DJp6TE42oBU=;
        b=GmoVfSVplByvMdHvN+GeFoB5Tpcu+qqFUmK7thU2z964ICUYMJbUJFMKDwvhxoeltK
         3K6Z0A1M9TBH6Q/gtp2AEADLImqtP3qY+BpMGdzlRgTC0jSugcgJNS3VxawZ1fkPiMmi
         RIjHPlbOmNYMwftwqvpg7dRmYGc30oe/94gO575EDXpc1l+9V4nvtJoSSzF6BJLuMMwn
         wRYirsmypidQKlyPB5+KhHN6jrV03lpWv7zDEhiKZeuGIreNATSqy+TBI44gJU13BVpD
         0kGYyC+GWJtStagtDt/cQ6iimcoTgcDxv1QRs2C1lMIClghVrzzNp6XZqe3ADYTbpVeK
         PDGA==
X-Forwarded-Encrypted: i=1; AJvYcCWycSFCr+B7ESSUdqfiR+KPBaHYNc1tuMcq6Aze2lEj95FP1LqSy/NLPnH6cVVhEf5+yrauAioBXLQ5bJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/z4reT6sXkO3XeC6MxrfPONJu2zh9ABMd3eNjCcb4i0G69wct
	wUQhmiB4/X/7aOjXaFvm1zrz3N+A2XzacQXM7HkopaDYWudoP6oUS5JVfWwQv/ruL3zgBOainyy
	GvRQFma/t+nrFToMWr3T2nA==
X-Google-Smtp-Source: AGHT+IFZXqypOEwxBtiFkSoL0Ikspp8t9OtsymhRtCWrWcv9rJUKo8igKv++c/FKV95j2ID8qgoztEyOhECx1j5T
X-Received: from vkbej10.prod.google.com ([2002:a05:6122:270a:b0:530:2c3a:a725])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:1b06:b0:531:172b:afe9 with SMTP id 71dfb90a1353d-53149927135mr7044462e0c.2.1750097504989;
 Mon, 16 Jun 2025 11:11:44 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:11:44 +0000
In-Reply-To: <202506142129.ClBlxdtW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <202506142129.ClBlxdtW-lkp@intel.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250616181144.2874709-1-jthoughton@google.com>
Subject: Re: [PATCH v4 3/7] KVM: x86/mmu: Recover TDP MMU NX huge pages using
 MMU read lock
From: James Houghton <jthoughton@google.com>
To: lkp@intel.com, pbonzini@redhat.com, seanjc@google.com
Cc: dmatlack@google.com, jthoughton@google.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, vipinsh@google.com
Content-Type: text/plain; charset="UTF-8"

> All errors (new ones prefixed by >>):
> 
>    arch/x86/kvm/mmu/mmu.c:7570:28: error: use of undeclared identifier 'KVM_TDP_MMU'
>     7570 |         bool is_tdp = mmu_type == KVM_TDP_MMU;
>          |                                   ^
> >> arch/x86/kvm/mmu/mmu.c:7594:25: error: no member named 'tdp_mmu_pages_lock' in 'struct kvm_arch'
>     7594 |                         spin_lock(&kvm->arch.tdp_mmu_pages_lock);
>          |                                    ~~~~~~~~~ ^
>    arch/x86/kvm/mmu/mmu.c:7597:28: error: no member named 'tdp_mmu_pages_lock' in 'struct kvm_arch'
>     7597 |                                 spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
>          |                                              ~~~~~~~~~ ^
>    arch/x86/kvm/mmu/mmu.c:7617:27: error: no member named 'tdp_mmu_pages_lock' in 'struct kvm_arch'
>     7617 |                         spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
>          |                                      ~~~~~~~~~ ^
>    4 errors generated.

Fixup for this below.

I also realized that the variable name `is_tdp` is bad/misleading, so I've
changed it to `is_tdp_mmu` as part of this fixup too. Sean/Paolo, let me know
if I should just go ahead and post the fixed series, given the size of this
fixup.

I don't really like having to #ifdef all the places where we take
tdp_mmu_pages_lock, but I couldn't find a way to avoid that. Even doing

  #ifndef CONFIG_X86_64
  #define is_tdp_mmu false
  #endif

didn't work. :(

Anyway, here's the fixup:

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 10ba328b664d7..7df1b4ead705b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -7564,10 +7564,10 @@ static bool kvm_mmu_sp_dirty_logging_enabled(struct kvm *kvm,
 }
 
 static void kvm_recover_nx_huge_pages(struct kvm *kvm,
-				      enum kvm_mmu_type mmu_type)
+				      const enum kvm_mmu_type mmu_type)
 {
 	unsigned long to_zap = nx_huge_pages_to_zap(kvm, mmu_type);
-	bool is_tdp = mmu_type == KVM_TDP_MMU;
+	bool is_tdp_mmu = mmu_type == KVM_TDP_MMU;
 	struct list_head *nx_huge_pages;
 	struct kvm_mmu_page *sp;
 	LIST_HEAD(invalid_list);
@@ -7577,7 +7577,7 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 	nx_huge_pages = &kvm->arch.possible_nx_huge_pages[mmu_type].pages;
 
 	rcu_idx = srcu_read_lock(&kvm->srcu);
-	if (is_tdp)
+	if (is_tdp_mmu)
 		read_lock(&kvm->mmu_lock);
 	else
 		write_lock(&kvm->mmu_lock);
@@ -7590,11 +7590,15 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 	rcu_read_lock();
 
 	for ( ; to_zap; --to_zap) {
-		if (is_tdp)
+#ifdef CONFIG_X86_64
+		if (is_tdp_mmu)
 			spin_lock(&kvm->arch.tdp_mmu_pages_lock);
+#endif
 		if (list_empty(nx_huge_pages)) {
-			if (is_tdp)
+#ifdef CONFIG_X86_64
+			if (is_tdp_mmu)
 				spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+#endif
 			break;
 		}
 
@@ -7613,8 +7617,10 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 
 		unaccount_nx_huge_page(kvm, sp);
 
-		if (is_tdp)
+#ifdef CONFIG_X86_64
+		if (is_tdp_mmu)
 			spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+#endif
 
 		/*
 		 * Do not attempt to recover any NX Huge Pages that are being
@@ -7624,7 +7630,7 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 		 * logging is disabled.
 		 */
 		if (!kvm_mmu_sp_dirty_logging_enabled(kvm, sp)) {
-			if (is_tdp)
+			if (is_tdp_mmu)
 				flush |= kvm_tdp_mmu_zap_possible_nx_huge_page(kvm, sp);
 			else
 				kvm_mmu_prepare_zap_page(kvm, sp, &invalid_list);
@@ -7637,7 +7643,7 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 			kvm_mmu_remote_flush_or_zap(kvm, &invalid_list, flush);
 			rcu_read_unlock();
 
-			if (is_tdp)
+			if (is_tdp_mmu)
 				cond_resched_rwlock_read(&kvm->mmu_lock);
 			else
 				cond_resched_rwlock_write(&kvm->mmu_lock);
@@ -7650,7 +7656,7 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 
 	rcu_read_unlock();
 
-	if (is_tdp)
+	if (is_tdp_mmu)
 		read_unlock(&kvm->mmu_lock);
 	else
 		write_unlock(&kvm->mmu_lock);
