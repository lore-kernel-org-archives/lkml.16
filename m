Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79120283CA0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749597616; cv=none; b=em3RfW7R/doc2SN+z1HMIbzVqcrcyO3ALGUBRqrTVNMieiBbnYW4PXykxP318AzIk+jhmXbw59ZQBpFCNcv6jAITL2cmKemRGtA3GI5zb4Sx+tRY4XhINwyB6ak9NoOTR+Je2OwEZ4VbImr1k4Trqq5hAVSDRQ28ZfpjAJpj3N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749597616; c=relaxed/simple;
	bh=MmISEUVAZkAYO+3tppVzE59BztQ7B47DiT8C5/3AK3I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=giiiMfKFZQ4zOCLLh5rvsH6F/OoTuOHlBZwrW2n0kbUEVGwSdI33J0H74KNVYWWrrZvZvDLaEYh3IGMzVbMaGIzMrk/bLp1W1EckK/6tdTy8Vx9jRHZhXSTYze2xpiqvz4mzUMPE97dIhDA2xgFytyCjHxeDl1UNtLxOnVFR0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wAJhDQJG; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wAJhDQJG"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b0e0c573531so3632272a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749597615; x=1750202415; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku4Jlo0vfxtFTgd99p+Ks+SleUGyUmQc0U3V1r1cPLo=;
        b=wAJhDQJGBwDbE/mLGnLGJr2k7bjlRThyjy2hh1U/WTtSNHd8b7HVCxvsaLXt8Es7za
         5CH1Ff9naNoOJpq1BLvI1LyN+RzryjyhKXj5LqDlrzPIMNoFJPpDcjZM4oWT+gYb9Bq2
         3tGIrBxhHhJtB51V/s/iUnYuyz/RtYnZhL8Bf7qu56+miOmJhuRv0/UkRDDiENcqtm6y
         r4+EPPPZqnEnIvSaHspgvzXjqbCqpUSqluuspkx8FIJy/FKEozBfYK+mO/MNJ1WWsmHe
         0XhFZIL6Pl7+lv+ABwuAng8WstexBomyQpGgLP0sevA5jG8QhrICj63vIglQg8nEVKCG
         ud+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749597615; x=1750202415;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ku4Jlo0vfxtFTgd99p+Ks+SleUGyUmQc0U3V1r1cPLo=;
        b=MFFigkYdPCSxdZ7c9QC6PRoKDbHq24RwVIiHk0aYnZsUXDUHeuD6icauW+iJXw44/u
         /AQdIhzYt3K+HMYGevZEiNui3gf6CYb30frHFP07nmULHilZHysUrZ+KI5W4bQzoTym6
         Li3BOY7WRUEVI9YTZBsKB2svr0gDBgXuA2jtg1xgnbfpcrbI7z6Z1YFv7bZwZFpzlvqg
         9pT7QprDVcp4T6N2RKdrCxFcGy4UOMkrH/ao/YNN5z8/Ik0jwGff8e47pQYqozqH4K6C
         JE0sm7qwKx/ZPLfgcizyFKciJ29i/+YW2LR+d2NtW/zhi1srhZ1hW68j476xQu96M+H1
         C0pw==
X-Forwarded-Encrypted: i=1; AJvYcCUpmyoWNU0mTxlPOFObUqIxFy7rc0qlkqmnWmMMWijdTSZ7ZrxkohZbt+ED1eiH+meK7CIyyP4RVUYK9iI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1GQwLE392TbULogtbQUkAKmVAHmcGea/pWo2/dcjb9ZQR8dTM
	eitj3/nvLNYzJVYtnbLnVw/PpnCPT0VKnkJDC3jlOYRlaP04HxYq8CZX4oDGUVjWsCqwbKS4aLS
	Ek3gbvQ==
X-Google-Smtp-Source: AGHT+IHskFiLR9R0/+qB03P2oZJfiwIk2UJIC6FsIlh4oCPhGlI2xBclplA11XHeDq3Z7tAlav5E6cfk8vE=
X-Received: from pjbos11.prod.google.com ([2002:a17:90b:1ccb:b0:311:4201:4021])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c4f:b0:311:e8cc:425d
 with SMTP id 98e67ed59e1d1-313af11cbb2mr1636619a91.10.1749597614808; Tue, 10
 Jun 2025 16:20:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 16:20:03 -0700
In-Reply-To: <20250610232010.162191-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610232010.162191-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610232010.162191-2-seanjc@google.com>
Subject: [PATCH v6 1/8] KVM: TDX: Use kvm_arch_vcpu.host_debugctl to restore
 the host's DEBUGCTL
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Use the kvm_arch_vcpu.host_debugctl snapshot to restore DEBUGCTL after
running a TD vCPU.  The final TDX series rebase was mishandled, likely due
to commit fb71c7959356 ("KVM: x86: Snapshot the host's DEBUGCTL in common
x86") deleting the same line of code from vmx.h, i.e. creating a semantic
conflict of sorts, but no syntactic conflict.

Using the version in kvm_vcpu_arch picks up the ulong => u64 fix (which
isn't relevant to TDX) as well as the IRQ fix from commit 189ecdb3e112
("KVM: x86: Snapshot the host's DEBUGCTL after disabling IRQs").

Link: https://lore.kernel.org/all/20250307212053.2948340-10-pbonzini@redhat.com
Cc: Adrian Hunter <adrian.hunter@intel.com>
Fixes: 8af099037527 ("KVM: TDX: Save and restore IA32_DEBUGCTL")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/common.h | 2 --
 arch/x86/kvm/vmx/tdx.c    | 6 ++----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/common.h b/arch/x86/kvm/vmx/common.h
index a0c5e8781c33..bc5ece76533a 100644
--- a/arch/x86/kvm/vmx/common.h
+++ b/arch/x86/kvm/vmx/common.h
@@ -53,8 +53,6 @@ struct vcpu_vt {
 #ifdef CONFIG_X86_64
 	u64		msr_host_kernel_gs_base;
 #endif
-
-	unsigned long	host_debugctlmsr;
 };
 
 #ifdef CONFIG_KVM_INTEL_TDX
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b952bc673271..3cfe89aad68e 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -778,8 +778,6 @@ void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
 	else
 		vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
 
-	vt->host_debugctlmsr = get_debugctlmsr();
-
 	vt->guest_state_loaded = true;
 }
 
@@ -1055,8 +1053,8 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, bool force_immediate_exit)
 
 	tdx_vcpu_enter_exit(vcpu);
 
-	if (vt->host_debugctlmsr & ~TDX_DEBUGCTL_PRESERVED)
-		update_debugctlmsr(vt->host_debugctlmsr);
+	if (vcpu->arch.host_debugctl & ~TDX_DEBUGCTL_PRESERVED)
+		update_debugctlmsr(vcpu->arch.host_debugctl);
 
 	tdx_load_host_xsave_state(vcpu);
 	tdx->guest_entered = true;
-- 
2.50.0.rc0.642.g800a2b2222-goog

