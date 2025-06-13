Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9562828DEE7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 22:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749853480; cv=none; b=X0Ih9W86m1mVKRYbxgdBxZBEz1+N6Ip+srD4LOeV17YLewJQ5s7nG1x++6HH366FdGBxY2GgsIGY8aaCxt4Bmtbzmvb5sCmUF9HnYp3Km++D+gL38u2lr/xzetOA3pVG04pN5cwY9L+rfNp+kKgx0V8VWpfvcwz0PjWN12QlM/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749853480; c=relaxed/simple;
	bh=iAiXbggyWiGI0ioNYNwEycoE8HyP8uw4mXPc+k3TuM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LXQfQhJujnPxY9uuPEfANL4p5wb8SpQukfTp8mzNo0xXWRgeD2dhAyGxabc95/08Gb0XDFnLZTQiFB3Ri9Q/BTiHoQlNIEi5ZxvMuCq6pdQiO6eeuQDc66UzOIF4k5wR2fH24tUpir2EqpQsunsV41+hcoDojZaw4xdnqYk/JAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AJOv8mRX; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJOv8mRX"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-740774348f6so2334971b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749853477; x=1750458277; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0YOAxGP+nhc8ChKM+S2z9sIC/KGH663HFb+/wtYtlnY=;
        b=AJOv8mRXmAln9yfTXD82sf8YMbrouEOsZp+n39gEliebib9jzxT5TBB9A4JYr98kLm
         b+cqMLZZPmdNv91YbWlmxy690ZgXVcpY2Sv8HKS1bs3FkdB1YNbUj2eoeDyUUF3ZM69V
         yPGBBycE11ptOnAeMB36fGZOUulP2uNOO+S4vw/OAS8LfZfGafluYfjCUI2xTfk2PeTX
         0HFy9bi3R4CRNhVet1DhXE+NddDK1qbYvKxazd1+Y9yh11mOrB3jqnKvFVlEsUrXLOnT
         w7XDPlETGdQWlcb4OgU/+DmQbBqjJ5Nbmf72shEiuOH4WhXnQL5lNKI0MOyWlrc6nUmt
         CI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749853477; x=1750458277;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0YOAxGP+nhc8ChKM+S2z9sIC/KGH663HFb+/wtYtlnY=;
        b=TnhyeCXxek1i5MN1Eiwtruvq6tG5RLvPkLhu6YjdtQKW8SGRiZeLpm8bnusSi1rAbB
         6z7s+AjOUCWSEPqeHhqlq/qMkBB7Ip4StdRGX9b/qcECE48qn7KQESri/7fy+8rgyZPA
         FP+oEkrsg6+Cu14ZhzQOMm95y6WbNKBCGyVLE0TQBmeV3Bg4PSwo3NzID76LrXxnx5cH
         m/o0EUXXqLrPut9z3GM9osjN1uY+qcAyd5HGT3OpU+XfShAc/By65Le9CbQWX3VW7x++
         +L9Jyoy40xLtl4kGLqWS0nSCwT2t9ot1YiFUdEkDJa4wm+puEUxkykGNen78s4qV1WPA
         /dSg==
X-Forwarded-Encrypted: i=1; AJvYcCW8MGMT4oCJ9dbrrLfjdUZ8M4W4c/AY6xS8vzMX/eYSGBMfisUxxmTOfbULL3vyO+mptmI9/VI8mLQXrYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSe6glLh8YVsSiCHBM2sTaAZGgZQHetbQMtKpL/bs3PZ3GoNPH
	IUKxZegbCywP6aqDvIeA8PgJ4749QrxROwM6AfmyiN6io6xiJcs/4RyVWMp1E8mvK0QhLB4fH93
	Vs4NVQQ==
X-Google-Smtp-Source: AGHT+IGbqYy23e2CHK855fCtvAevGSzZ6YPVzXdykpUR9oW6FyFW+cX08H6Q7LBbZi1O5077fivPLdXXKLY=
X-Received: from pfbha10.prod.google.com ([2002:a05:6a00:850a:b0:746:1cdd:faa3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f95:b0:747:accb:773c
 with SMTP id d2e1a72fcca58-7489cfff3a7mr1243026b3a.13.1749853476803; Fri, 13
 Jun 2025 15:24:36 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:24:35 -0700
In-Reply-To: <CAJZ91LBYBVexcOpk6zqL=mup8VJ7RDEepHk+0Y_GDt5B2+8iyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250613111023.786265-1-abinashsinghlalotra@gmail.com>
 <aEwualvoLvbtbqef@google.com> <CAJZ91LBYBVexcOpk6zqL=mup8VJ7RDEepHk+0Y_GDt5B2+8iyg@mail.gmail.com>
Message-ID: <aEylI-O8kFnFHrOH@google.com>
Subject: Re: [RFC PATCH] KVM: x86: Dynamically allocate bitmap to fix
 -Wframe-larger-than error
From: Sean Christopherson <seanjc@google.com>
To: Abinash <abinashlalotra@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, vkuznets@redhat.com, 
	pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	avinashlalotra <abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 13, 2025, Abinash wrote:
> I am building the kernel WITH LLVM.
> KASAN is not enabled.
> CONFIG_FRAME_WARN=1024 (default) . I used defconfig -> my system config ->
> oldconfig to obtain the .config  .
> EXPERT=y So KVM_WERROR=y
> I think this warning is due to FRAME_WARN=1024 .

Well drat, it really is just KVM_MAX_NR_VCPUS=4096.  Luckily, it's quite easy to
fix (we already did this dance for the sparse_banks):

Side topic, please let me know if I got your name right for the Reported-by.

--
From: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Jun 2025 12:39:22 -0700
Subject: [PATCH] KVM: x86/hyper-v: Use preallocated per-vCPU buffer for
 de-sparsified vCPU masks

Use a preallocated per-vCPU bitmap for tracking the unpacked set of vCPUs
being targeted for Hyper-V's paravirt TLB flushing.  If KVM_MAX_NR_VCPUS
is set to 4096 (which is allowed even for MAXSMP=n builds), putting the
vCPU mask on-stack pushes kvm_hv_flush_tlb() past the default FRAME_WARN
limit.

  arch/x86/kvm/hyperv.c:2001:12: error: stack frame size (1288) exceeds limit (1024)
                                 in 'kvm_hv_flush_tlb' [-Werror,-Wframe-larger-than]
  2001 | static u64 kvm_hv_flush_tlb(struct kvm_vcpu *vcpu, struct kvm_hv_hcall *hc)
       |            ^
  1 error generated.

Note, sparse_banks was given the same treatment by commit 7d5e88d301f8
("KVM: x86: hyper-v: Use preallocated buffer in 'struct kvm_vcpu_hv'
instead of on-stack 'sparse_banks'"), for the exact same reason.

Reported-by: Abinash Lalotra <abinashsinghlalotra@gmail.com>
Closes: https://lore.kernel.org/all/20250613111023.786265-1-abinashsinghlalotra@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 7 ++++++-
 arch/x86/kvm/hyperv.c           | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 330cdcbed1a6..12edf36d4ed7 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -699,8 +699,13 @@ struct kvm_vcpu_hv {
 
 	struct kvm_vcpu_hv_tlb_flush_fifo tlb_flush_fifo[HV_NR_TLB_FLUSH_FIFOS];
 
-	/* Preallocated buffer for handling hypercalls passing sparse vCPU set */
+	/*
+	 * Preallocated buffers for handling hypercalls that pass sparse vCPU
+	 * sets (for high vCPU counts, they're too large to comfortably fit on
+	 * the stack).
+	 */
 	u64 sparse_banks[HV_MAX_SPARSE_VCPU_BANKS];
+	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
 
 	struct hv_vp_assist_page vp_assist_page;
 
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 24f0318c50d7..75221a11e15e 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -2001,11 +2001,11 @@ int kvm_hv_vcpu_flush_tlb(struct kvm_vcpu *vcpu)
 static u64 kvm_hv_flush_tlb(struct kvm_vcpu *vcpu, struct kvm_hv_hcall *hc)
 {
 	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);
+	unsigned long *vcpu_mask = hv_vcpu->vcpu_mask;
 	u64 *sparse_banks = hv_vcpu->sparse_banks;
 	struct kvm *kvm = vcpu->kvm;
 	struct hv_tlb_flush_ex flush_ex;
 	struct hv_tlb_flush flush;
-	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
 	struct kvm_vcpu_hv_tlb_flush_fifo *tlb_flush_fifo;
 	/*
 	 * Normally, there can be no more than 'KVM_HV_TLB_FLUSH_FIFO_SIZE'

base-commit: 61374cc145f4a56377eaf87c7409a97ec7a34041
--
