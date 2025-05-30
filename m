Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59449278E7A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748631172; cv=none; b=KdpMtdciKB0NQeuGB9kgEgYQ8FJ87QsCYs5eri0todJlk6hEo0EL98x6qv7OYBC/TWfa9qClg5LOneaD83+FK1gQDIobPi8+N1Znt0eeCi745g4NoUacjxd+ewQqJiUA2aseGo8idRs7tReb+aGejTAlW6e6lykruaIOTqRRXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748631172; c=relaxed/simple;
	bh=DOB8fqOOZ+nSh40yrnI3oifjq6hR5ylYBAFURXRDnh8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pC1V/wckzlnUoBKInxKRBhsTUm/REd11OOJPNke/M8no6lYF8mm74qwTqGSdFpPfsb4T4r8ff6vQcFJMFssOWeYnAcVxNdcbZsMy2OMAODUQAwzYpVEzcu7P94Gpy9XOBbsCoKfKdZslgTwYMVjQza3gMf1eo3nMPstTfQF+sno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2IIVqNFT; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2IIVqNFT"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b269789425bso2325200a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748631170; x=1749235970; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uUv/RTjh91CEtJSYSuz7ab6/srgFsjOXdoBg1u5u6t4=;
        b=2IIVqNFTEF+PaIPWeiynwhvTGj0gBkWM548mfFdhq4BKGzg4eZWfhuutxboT+udVJi
         WWVsU2RVxDia2JxI0d1ziH69uNXG1m1EWU5q1sr4Yg4JYCqqo5wqihwC6lPmVjVl14/W
         2i5VXCnFyPQaeUA1W7MCrNaaGXMv/kgHa21l8Z4QXes3iykd3XtByT5Ww/FomUSPZHSa
         m6PzHoRGpnDDOtEfQaOcqlMAzCaObK7EQ+p82+dxrSeQbEaYpEgwXUulfnfHA/M1uWUq
         K2m2L/ilkUXqtgKnNM67uD2eyEOS6KeaD9OHfE37pJHOkyR7hHyKzYIcVEhpYWQLO0uo
         LB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748631170; x=1749235970;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUv/RTjh91CEtJSYSuz7ab6/srgFsjOXdoBg1u5u6t4=;
        b=h11zUQBc8SgWZ/+v23qAoyzgNw99MeZIqNsAt34Fn/5kmPD8fZZqgTIEDR6d1YEkSM
         GQuTcNY0oKFXcMppJuVpG0jti0mGFTaqbzDzJc5kgp9KsodN2pi8szF4dDqG91OzgzNo
         iYImm9RV7R8T0kDI2PlxY1PcsZrrDaFYvF40KAiX7cNjLPhxcTNE+44BFqntWuzHDxJ/
         pMLoKOaNC5AR9VQ7IQNub6fOkJ8q0YsmF1rzGWFIrSixzLLcmCsJgdSkXf8a22yRTGvu
         KwTAAYh1E8IBuxTVOgIpX7ACAX0TUwyq+K1cRZzZJODJi7if899HbJmmT77zi4345M/d
         DR3A==
X-Gm-Message-State: AOJu0YzVY6JHbbdrjTQuSJOwCROqEKs4ouC7DSm2uv1FdageO0DcnjpQ
	0ux8xBgXKiRnZTNHnPmKjb0msE2/tnDuG2dUEYRHro2HwYDfmMzZfPyuRhu0c8x4eFHRFrYibpj
	L9USodCDKGRlt8P1enMcUeZx3YykPt70OHM2mt50I/CdGqzHfYi0GB0m3R1Cg3S628dfdjKEL8Y
	vOG/mQFrapdBI8p4c27A96qE534bUcAZgtYvr7wcPiAuqp8F3ApLFsRg4=
X-Google-Smtp-Source: AGHT+IGwdiKLI1x4pb5kVZDwHzn2zgcS8gBEAXzxms3PRqiHevVl6CoD0Ciw3kXlOHxiRZmo6nvYLya7fcOefw==
X-Received: from pjbnw2.prod.google.com ([2002:a17:90b:2542:b0:2f9:dc36:b11])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:ec8b:b0:312:1c83:58ea with SMTP id 98e67ed59e1d1-31241511fcemr8333346a91.14.1748631170549;
 Fri, 30 May 2025 11:52:50 -0700 (PDT)
Date: Fri, 30 May 2025 11:52:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250530185239.2335185-1-jmattson@google.com>
Subject: [PATCH v4 0/3] KVM: x86: Provide a capability to disable APERF/MPERF
 read intercepts
From: Jim Mattson <jmattson@google.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow a guest to read IA32_APERF and IA32_MPERF, so that it can
determine the effective frequency multiplier for the physical LPU.

Commit b51700632e0e ("KVM: X86: Provide a capability to disable cstate
msr read intercepts") allowed the userspace VMM to grant a guest read
access to four core C-state residency MSRs. Do the same for IA32_APERF
and IA32_MPERF.

While this isn't sufficient to claim support for
CPUID.6:ECX.APERFMPERF[bit 0], it may suffice in a sufficiently
restricted environment (i.e. vCPUs pinned to LPUs, no TSC multiplier,
and no suspend/resume).

v1 -> v2: Add {IA32_APERF,IA32_MPERF} to vmx_possible_passthrough_msrs[]
v2 -> v3: Add a selftest
v3 -> v4: Collect all disabled_exit flags in a u64 [Sean]
          Improve documentation [Sean]
	  Add pin_task_to_one_cpu() to kvm selftests library [Sean]


Jim Mattson (3):
  KVM: x86: Replace growing set of *_in_guest bools with a u64
  KVM: x86: Provide a capability to disable APERF/MPERF read intercepts
  KVM: selftests: Test behavior of KVM_X86_DISABLE_EXITS_APERFMPERF

 Documentation/virt/kvm/api.rst                |  23 +++
 arch/x86/include/asm/kvm_host.h               |   5 +-
 arch/x86/kvm/svm/svm.c                        |   9 +-
 arch/x86/kvm/svm/svm.h                        |   2 +-
 arch/x86/kvm/vmx/vmx.c                        |   8 +-
 arch/x86/kvm/vmx/vmx.h                        |   2 +-
 arch/x86/kvm/x86.c                            |  16 ++-
 arch/x86/kvm/x86.h                            |  18 ++-
 include/uapi/linux/kvm.h                      |   1 +
 tools/include/uapi/linux/kvm.h                |   1 +
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/include/kvm_util.h  |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  17 +++
 .../selftests/kvm/x86/aperfmperf_test.c       | 132 ++++++++++++++++++
 14 files changed, 220 insertions(+), 17 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/aperfmperf_test.c

-- 
2.49.0.1204.g71687c7c1d-goog

