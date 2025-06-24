Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C019426E14C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807868; cv=none; b=DA7xD3e6vwkhEUTMbN1RKCc4gIvcxbtEfutRpd9CsIYuTOOXssMoaFnZsrGxI1xhCupILm+AcqVUV1N35H/nW4EG7awk88BM41NZHApFnT3mgCkHDxXxjXXVGAQx3SOe5wh6l9ULdm0ToXNf5V6QAZzadr632/djqqegANRRyU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807868; c=relaxed/simple;
	bh=nX0YHqLfleKwgIkQRR7zhOtfTngLBmfTmLBeKNNNlEE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iAxEqNBzlYQSuy49qFPFoLumE1uADoA/lTgfZAjr/CO2tyYDayegpfjqRFtHt+Ce9POkspMvOvgAXyHWo4+l9/VL0dKa0bsK2wa+wNpymSrdSWAJ6sF6QOWGYXhwW0TvPfQVP2a4cv4JEmsEVPlq26ha/ddwyL1qL6weyh1lsIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2TC6O+zQ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2TC6O+zQ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3138e65efe2so883128a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750807866; x=1751412666; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/hcbVM3hgEz99lahHzlfgB8IEMKnnphGvT38Gwa/j0=;
        b=2TC6O+zQBDMKTLEHc7NlNjSwCu4fdZiDiuopWC1IHdW9W19w2bwNtvSvbDOm8DJpV2
         r4BZ9pQTRmWWiRNx/xpKy7PgUS6RUq1EMBDIRLb6rYOih+9STBxvHjIGwinq+/Sbnwwi
         jfsWXR62O2TZiVl9BevkMRhS51wcIE2CvKG5XjhNhnuuq9nJc+UhYqqgJ6+Zwap7D0pr
         8ipYIV9R/xVhT6tau2XiWQSWCEFhqX3yXzSuZnonwYmAgtRjTeTQQxuIue81LucGcly3
         AfviJrrPPUb2W2WqbvmkNyBB34+fGUX+QNxHgEgW4+fRjLutxkU5xqdfG+nUEwZDjwgy
         LmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807866; x=1751412666;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/hcbVM3hgEz99lahHzlfgB8IEMKnnphGvT38Gwa/j0=;
        b=wfgaVk6T/p4XZwKyWcO5qIWSAvNi/7dk+AbKkmEauWRdAemnBAI+RRRoGSLIC7nN2b
         1xWF95ab62d3maY+6N5C06L0+FZTwgax/LYxxi6B1ubCVC+qsd9Uw77UrAeeel3U1+hK
         PKkMIcuiY5al+LM+WdbXfCO2SH9qX4TlbL8B0Nuw7qyoPdN8m7AG/FrWeHgGg9R76Z8V
         JV4q/cPc8FnriTu3qYyAWgU7Usm3ikuX2SLouv5Ds/ZfHCfAB/1OFQMtM8C4uN2iCaVx
         btrA3zMbrsTrb0/ol21+4RjOIKpg0ZK5519/OwLCTRbdGr9s24bJ8ybS0/yGq1GLKghB
         y9kA==
X-Gm-Message-State: AOJu0Yzai0WsNvMl5XDNiOevylTQkzKYIPseRgDEFnq4aYNSLIu82aD/
	AmpSJEoFgus8pBu+5B7l2Z+j/RxKRhBPo+egxkZ3soRNbqVbMwf/m3vwSAH/NVDs1VBFScwxmnS
	+XGKJDw==
X-Google-Smtp-Source: AGHT+IFOA5I0fytY1fxsbAPIcxCuXX1tMxsiYvby57eByHBNqJwSR1UKppPsacZEWlYJTkj1qwxGne4E8Ak=
X-Received: from pjbhl6.prod.google.com ([2002:a17:90b:1346:b0:311:e71e:3fb9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d008:b0:312:1b53:5e98
 with SMTP id 98e67ed59e1d1-315f26c401fmr891263a91.34.1750807865998; Tue, 24
 Jun 2025 16:31:05 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:31:04 -0700
In-Reply-To: <20250530185239.2335185-3-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250530185239.2335185-1-jmattson@google.com> <20250530185239.2335185-3-jmattson@google.com>
Message-ID: <aFs1OL8QybDRUQkF@google.com>
Subject: Re: [PATCH v4 2/3] KVM: x86: Provide a capability to disable
 APERF/MPERF read intercepts
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 30, 2025, Jim Mattson wrote:
> @@ -7790,6 +7791,28 @@ all such vmexits.
>  
>  Do not enable KVM_FEATURE_PV_UNHALT if you disable HLT exits.
>  
> +Virtualizing the ``IA32_APERF`` and ``IA32_MPERF`` MSRs requires more
> +than just disabling APERF/MPERF exits. While both Intel and AMD
> +document strict usage conditions for these MSRs--emphasizing that only
> +the ratio of their deltas over a time interval (T0 to T1) is
> +architecturally defined--simply passing through the MSRs can still
> +produce an incorrect ratio.
> +
> +This erroneous ratio can occur if, between T0 and T1:
> +
> +1. The vCPU thread migrates between logical processors.
> +2. Live migration or suspend/resume operations take place.
> +3. Another task shares the vCPU's logical processor.
> +4. C-states lower thean C0 are emulated (e.g., via HLT interception).
> +5. The guest TSC frequency doesn't match the host TSC frequency.
> +
> +Due to these complexities, KVM does not automatically associate this
> +passthrough capability with the guest CPUID bit,
> +``CPUID.6:ECX.APERFMPERF[bit 0]``. Userspace VMMs that deem this
> +mechanism adequate for virtualizing the ``IA32_APERF`` and
> +``IA32_MPERF`` MSRs must set the guest CPUID bit explicitly.

Question: what do we want to do about nested?  Due to differences between SVM
and VMX at the time you posted your patches, this series _as posted_ will do
nested passthrough for SVM, but not VMX (before the MSR rework, SVM auto-merged
bitmaps for all MSRs in svm_direct_access_msrs).

As I've got it locally applied, neither SVM nor VMX will do passthrough to L2.
I'm leaning toward allowing full passthrough, because (a) it's easy, (b) I can't
think of any reason not to, and (c) SVM's semi-auto-merging logic means we could
*unintentinally* do full passthrough in the future, in the unlikely event that
KVM added passthrough support for an MSR in the same chunk as APERF and MPERF.

This would be the extent of the changes (I think, haven't tested yet).

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 749f7b866ac8..b7fd2e869998 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -194,7 +194,7 @@ void recalc_intercepts(struct vcpu_svm *svm)
  * Hardcode the capacity of the array based on the maximum number of _offsets_.
  * MSRs are batched together, so there are fewer offsets than MSRs.
  */
-static int nested_svm_msrpm_merge_offsets[6] __ro_after_init;
+static int nested_svm_msrpm_merge_offsets[7] __ro_after_init;
 static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
 typedef unsigned long nsvm_msrpm_merge_t;
 
@@ -216,6 +216,8 @@ int __init nested_svm_init_msrpm_merge_offsets(void)
                MSR_IA32_SPEC_CTRL,
                MSR_IA32_PRED_CMD,
                MSR_IA32_FLUSH_CMD,
+               MSR_IA32_APERF,
+               MSR_IA32_MPERF,
                MSR_IA32_LASTBRANCHFROMIP,
                MSR_IA32_LASTBRANCHTOIP,
                MSR_IA32_LASTINTFROMIP,
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index c69df3aba8d1..b8ea1969113d 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -715,6 +715,12 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
        nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
                                         MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
 
+       nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
+                                        MSR_IA32_APERF, MSR_TYPE_R);
+
+       nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
+                                        MSR_IA32_MPERF, MSR_TYPE_R);
+
        kvm_vcpu_unmap(vcpu, &map);
 
        vmx->nested.force_msr_bitmap_recalc = false;
