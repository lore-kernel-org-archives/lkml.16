Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28A2D540A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749597615; cv=none; b=f44mVi3ag4VpmaIdF+uGfYYSaKgDidLgfTYi8B5+jJluajOf2SYVfGrNgJ/qBQwTmOqQvZkztpRTHYxa9jWNI1Ip5UVf4Gkd8NqbLXyhd6dE+ld9LP8yFXHN3X+8A1OWyd7IVhj4nxPDG8Z97CqwYe5vGniAQcQ37qnYNYYT6M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749597615; c=relaxed/simple;
	bh=p9aKJqud9RPGUf6Wxhg6SVrztt6IbydiB5KcKa8G5Ro=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=m7vuDv7FvZWSHA08JlMutOoEeoj/G3c132X6HYhLvf0yTHJ9JoPuxaVVgPCayqI8/Ckl0OKpRciS1siHPyov7bsSRfm4zO0iHfZd89R0hpvvkRSg9BA8pnEUYB92HhUDK0IThQOL9LQvrPw74T9JauBaphlMgK0M9zzpKNQzveE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ocACGQd+; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ocACGQd+"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311f4f2e6baso6404360a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749597613; x=1750202413; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZPjLY2mM4L86u9ZjSVjk1YzN2wRc/83Yq2+tB5bYN0=;
        b=ocACGQd+o8OzZeG7t4Us7EiriNHs/eFftpiGR8Ej/46czzuKbFvPMgxYi8xqHV5QQk
         MtCsngFAlyZwanM9eP+gprsrXxUqoXTWSgtppT6G+pI7t+Xdg3lVxQ6LFG9KWnnB+Cd+
         JYSYoUkApffdasCqpunxO/QRrAMzxAutksNOktPm483DOU2iiNHtG1g5ASTyOw8b+DKs
         GrH44d3VwAWhEV2B6RmxeFtzue6L1GNMxmQK02xU2sT33Q7/zSf+b9If7rbDH7oXVEIi
         NjodAgD45IsvmKm48ncaiZDAb2yfZ/1ZuUNHmRIge5LC5n8cw68W/zoqS/MdKc3rRDX7
         TInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749597613; x=1750202413;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZPjLY2mM4L86u9ZjSVjk1YzN2wRc/83Yq2+tB5bYN0=;
        b=hndFLvzXbsk8KsjWkAY5WyYgC4/jB+TYnFWRhEoDxWLPiJgV/Aksh2sHQpBIvX65ho
         K4vYrqTS8Tl1s9s5DVyCunFpWzY9aA6KDoZ/X1E0dUQTUy+K5LOeZy7tlstIj+Qrkjc9
         ixNrYKh1NCbWJr7hzFAqTpNw1hKfQ13ZDnNBL02xB7K3s/Hd+G/1Olv5MrY+Ev+WXuH7
         p7yGZCodRnLB2ojKhvsw38Z2xIh05CFcSh0Hp/H1zFJK3eutpo2KZFdyeD+hriY74dFn
         58PpzBkVBsxA689CvNdt5+ZJZ/Ly+aJS/EyOuRHA9rbYHZJZNpiBzfDg80cxi3i6QQ1L
         5KJg==
X-Forwarded-Encrypted: i=1; AJvYcCUb0CqMMxOS9bpzWjI/NF2K10+JNi6jqrWEGf6Jd8gnaeTwrfdY9sDJVfuKlJTCqBzJl0+mJpWADHx6CL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJDFfcg2UGqkI8nVDShKZw5Z6WFPQOw0AKZiKvPqf+U8Gf8YAv
	TbVy5b8GO4D5HKpUZdiRZ9h6HJIL8bVP2WIa7y+8ZJH2RsZLmbshJiJsFhFKIgcUqQckv1Xxobf
	tjHhhpw==
X-Google-Smtp-Source: AGHT+IHMsJP22tXC45lUB8bXPeYj5teOCFoLNUprGp6l4PmXTAgs0Ik/+qVXzVGfqBDDly8tAhipWg1QI+k=
X-Received: from pjbsz14.prod.google.com ([2002:a17:90b:2d4e:b0:311:d264:6f5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35d2:b0:312:e9d:4002
 with SMTP id 98e67ed59e1d1-313af1ddd30mr1583512a91.28.1749597613006; Tue, 10
 Jun 2025 16:20:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 16:20:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610232010.162191-1-seanjc@google.com>
Subject: [PATCH v6 0/8] KVM: VMX: Preserve host's DEBUGCTL.FREEZE_IN_SMM
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Preserve the host's FREEZE_IN_SMM setting by stuffing GUEST_DEBUGCTL, so that
SMM activity doesn't bleed into PMU events while running the guest.

Along the way, enforce the supported set of DEBUGCTL bits when processing
vmcs12.GUEST_DEBUGCTL, as KVM can't rely on hardware to reject an MSR value
that is supported in hardware.

To minimize the probability of the nVMX fix breaking existing setups, allow
the guest to use DEBUGCTL.RTM_DEBUG if RTM is exposed to the guest.

v6:
 - WARN in tdx_vcpu_run() if KVM requests DR6 load.
 - Ignore unsupported-but-suppressed DEBUGCTL bits when doing consistency
   check on vmcs12.
 - Add support for DEBUGCTL.RTM_DEBUG.
 - Use accessors in all paths.
 - Add a dedicated vmx_reload_guest_debugctl().

v5: https://lore.kernel.org/all/20250522005555.55705-1-mlevitsk@redhat.com

Maxim Levitsky (3):
  KVM: nVMX: Check vmcs12->guest_ia32_debugctl on nested VM-Enter
  KVM: VMX: Wrap all accesses to IA32_DEBUGCTL with getter/setter APIs
  KVM: VMX: Preserve host's DEBUGCTLMSR_FREEZE_IN_SMM while running the
    guest

Sean Christopherson (5):
  KVM: TDX: Use kvm_arch_vcpu.host_debugctl to restore the host's
    DEBUGCTL
  KVM: x86: Convert vcpu_run()'s immediate exit param into a generic
    bitmap
  KVM: x86: Drop kvm_x86_ops.set_dr6() in favor of a new KVM_RUN flag
  KVM: VMX: Allow guest to set DEBUGCTL.RTM_DEBUG if RTM is supported
  KVM: VMX: Extract checking of guest's DEBUGCTL into helper

 arch/x86/include/asm/kvm-x86-ops.h |  1 -
 arch/x86/include/asm/kvm_host.h    | 15 ++++++--
 arch/x86/include/asm/msr-index.h   |  1 +
 arch/x86/kvm/svm/svm.c             | 14 ++++----
 arch/x86/kvm/vmx/common.h          |  2 --
 arch/x86/kvm/vmx/main.c            | 17 +++------
 arch/x86/kvm/vmx/nested.c          | 21 ++++++++---
 arch/x86/kvm/vmx/pmu_intel.c       |  8 ++---
 arch/x86/kvm/vmx/tdx.c             | 24 ++++++-------
 arch/x86/kvm/vmx/vmx.c             | 57 ++++++++++++++++++------------
 arch/x86/kvm/vmx/vmx.h             | 26 ++++++++++++++
 arch/x86/kvm/vmx/x86_ops.h         |  4 +--
 arch/x86/kvm/x86.c                 | 25 ++++++++++---
 13 files changed, 140 insertions(+), 75 deletions(-)


base-commit: 61374cc145f4a56377eaf87c7409a97ec7a34041
-- 
2.50.0.rc0.642.g800a2b2222-goog

