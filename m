Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFFF23AB81
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676619; cv=none; b=tFfXq48b7F5dxZhmw3tBJ+jhEWUOv8iPYSPoZcdL28rJOyAefD7H9HFsRuPCmOzGIZGXLVrVcSD7ZMF6gmWn0mnJTdaVePz5TbIOfaxFn0K1lHxSeNWMD8UtKqMUvb+EKMK1dBDU4TBkW5rrgpAgH2epvPfZqIjVGKJaG7EFf2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676619; c=relaxed/simple;
	bh=1J2BNASlNa1Dhe5jluI1gAN0W9RVPLyHfYbBUQPkC54=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jv9cAXIaWfyhP4jHzF6szEUxcWuf5Qm64CuJ4B617Ze/NfNHSdcIADtWC8nGaeW4ty1zbrzKnHQOil5QqWF+nPm93muqb2W7RVygUX5/vESj1mxCNnHJi4jNeVIIbGAkykI3t8PE9GZ6kVNwzyZ7QRkPEel6/elP+iXBkiI2dU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tX0dj0C6; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tX0dj0C6"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7377139d8b1so226611b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749676617; x=1750281417; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JVZUY5qeKcLxvon3A1qgzFOnqGD8w3UB+MEi0rObhNA=;
        b=tX0dj0C6FlJ+8eMNwdZODidXdYTeEqpSRvjX9G1HOn1NuSC4Z0Zn3+2CocNpvgyFJ/
         4ddOneDuYzDCBy6xehXPXgZaK5cxZ+41J+tUNhynqUKn0agFJ4SAO1DV6EsEY8zXt7kr
         wvfXG4/jMJrHxtfE7tjOC/2kwmEVrI1vh3aaR/ZvZObH7Z8uYnXePADn0bh+SU0qe6wp
         iLJL+YvTz+oj7v/eMnu70WaJ522v6jI/BK0/1ZO8aGDiOwNEmIkAdNuXW6NAB4ye+tgo
         pMkS41hMyBeHWl6Nh47llY/7Mtl3gPshfdtNc321TLrH4M17R7m7XVBswzhEK/d7rzlp
         H8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749676617; x=1750281417;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVZUY5qeKcLxvon3A1qgzFOnqGD8w3UB+MEi0rObhNA=;
        b=lfDCMYBEnh7C0nyHPoYqH6NZxnCLgnt8tfDASIucfanSCbpVG2pZfz/3NIomAu0kxi
         i8CKlbgxRuNM+qGaOXvkSq+a068GFwOhbE3us+ou6mwcre2s8tsdMiSVtqRSIjmSMwWa
         5zevHd6sUQIwNFA5Jz0QEVexZXY1KYFFl122uf3m6SCZCOoQBWFUb+XEaJsY6J2Si+RT
         /iDPAtvotl9gfp5s4hekOEyfYQv10sMKeu5SAgbY/cyl2KY110XjyXDXl0u/JP6P1NM0
         hn3dfZDWSMJWHHAwgFOmUD4oRp3kRnbVRiLfF9q6TxmTOeapDQ+jGTDpO1Dd25CLAVj5
         6+4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjshHPKIOPsJjNgJMP2vnW1nFx8ujr2O+xkpQOD6lVfUdcMUwdW48cFg4Yl2sorb0KogW51qOv1unK2ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGx2zw4fNaM1VfDy/V8AodSPX4rqgf+K0G4iTCZ3RS0JrLDL1W
	NS2TJIdcZsEM9pgEd4RiULYKughdAnt317uAVnTaWLNaGQnvJkdVaM5Uy49qY/sXpypqTCnFioa
	qzPjCmxHkvw==
X-Google-Smtp-Source: AGHT+IEJ/qdunyiMvwsT10mftztZECZsqDYMcHYykS/gDMvyJ2du0eMtdA6wuu+sltqOX8qT0k9ifIs5X5dW
X-Received: from pfble12.prod.google.com ([2002:a05:6a00:4fcc:b0:746:1d26:e8c8])
 (user=afranji job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:394b:b0:21f:775d:107e
 with SMTP id adf61e73a8af0-21f9b9f75ebmr370105637.17.1749676617125; Wed, 11
 Jun 2025 14:16:57 -0700 (PDT)
Date: Wed, 11 Jun 2025 21:16:28 +0000
In-Reply-To: <cover.1749672978.git.afranji@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1749672978.git.afranji@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <884dc45a13920578973d5628c7cad79d8d50b7a2.1749672978.git.afranji@google.com>
Subject: [RFC PATCH v2 01/10] KVM: Split tdp_mmu_pages to mirror and direct counters
From: Ryan Afranji <afranji@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org
Cc: sagis@google.com, bp@alien8.de, chao.p.peng@linux.intel.com, 
	dave.hansen@linux.intel.com, dmatlack@google.com, erdemaktas@google.com, 
	isaku.yamahata@intel.com, kai.huang@intel.com, mingo@redhat.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@linutronix.de, 
	zhi.wang.linux@gmail.com, ackerleytng@google.com, andrew.jones@linux.dev, 
	david@redhat.com, hpa@zytor.com, kirill.shutemov@linux.intel.com, 
	linux-kselftest@vger.kernel.org, tabba@google.com, vannapurve@google.com, 
	yan.y.zhao@intel.com, rick.p.edgecombe@intel.com, 
	Ryan Afranji <afranji@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Sagi Shahar <sagis@google.com>

tdp_mmu_pages counts all the active pages used by the mmu. When we
transfer the state during intra-host migration we need to transfer the
mirror pages but not the direct ones. The direct pages are going to
be re-faulted as needed on the destination, but that approach doesn't
work for mirrored pages which stores information in the secure EPT.

Keeping them in separate counters makes this transfer more efficient.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Ryan Afranji <afranji@google.com>
---
 arch/x86/include/asm/kvm_host.h |  7 +++++--
 arch/x86/kvm/mmu/tdp_mmu.c      | 11 +++++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 999872c13722..b9966394acda 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1484,10 +1484,13 @@ struct kvm_arch {
 #ifdef CONFIG_X86_64
 #ifdef CONFIG_KVM_PROVE_MMU
 	/*
-	 * The number of TDP MMU pages across all roots.  Used only to sanity
-	 * check that KVM isn't leaking TDP MMU pages.
+	 * The number of non-mirrored TDP MMU pages across all roots.
+	 * Used only to sanity check that KVM isn't leaking TDP MMU pages.
 	 */
 	atomic64_t tdp_mmu_pages;
+
+	/* Same as tdp_mmu_pages but only for mirror pages. */
+	atomic64_t tdp_mirror_mmu_pages;
 #endif
 
 	/*
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7f3d7229b2c1..115af5e4c5ed 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -42,6 +42,7 @@ void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm)
 
 #ifdef CONFIG_KVM_PROVE_MMU
 	KVM_MMU_WARN_ON(atomic64_read(&kvm->arch.tdp_mmu_pages));
+	KVM_MMU_WARN_ON(atomic64_read(&kvm->arch.tdp_mirror_mmu_pages));
 #endif
 	WARN_ON(!list_empty(&kvm->arch.tdp_mmu_roots));
 
@@ -328,7 +329,10 @@ static void tdp_account_mmu_page(struct kvm *kvm, struct kvm_mmu_page *sp)
 {
 	kvm_account_pgtable_pages((void *)sp->spt, +1);
 #ifdef CONFIG_KVM_PROVE_MMU
-	atomic64_inc(&kvm->arch.tdp_mmu_pages);
+	if (sp->role.is_mirror)
+		atomic64_inc(&kvm->arch.tdp_mirror_mmu_pages);
+	else
+		atomic64_inc(&kvm->arch.tdp_mmu_pages);
 #endif
 }
 
@@ -336,7 +340,10 @@ static void tdp_unaccount_mmu_page(struct kvm *kvm, struct kvm_mmu_page *sp)
 {
 	kvm_account_pgtable_pages((void *)sp->spt, -1);
 #ifdef CONFIG_KVM_PROVE_MMU
-	atomic64_dec(&kvm->arch.tdp_mmu_pages);
+	if (sp->role.is_mirror)
+		atomic64_dec(&kvm->arch.tdp_mirror_mmu_pages);
+	else
+		atomic64_dec(&kvm->arch.tdp_mmu_pages);
 #endif
 }
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog

