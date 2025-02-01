Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C917741
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738374922; cv=none; b=Vz1jURLnREzdoSC1VwuF9FqP6Q4fdTZTK9b1lT6S3R9qlJ6AyLg+gy9R+qjdRV9CXm2f9+9UmCDbk7Yq7gYJxnoas6rWsVljC0HVPYS27VX3jYBii6SEwbe8Wcm6RI2PjewT/mTPpFm50ATzNo+3qp2WXY3AdDiqHmMzDruRlCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738374922; c=relaxed/simple;
	bh=YIzF9/vgPVJyN2M73AHSdTChR/mPpNSYdk8TkASs6AU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Lqm8Bm14peZA/NTqG5MbCS/3RsUzSgU0QzONx1uM4YUq4dlYeq03OCAP8qY+KrNoGigPXCZNrdeY6vhGE84zfxZYHnyXB89LNYBwPWb3mHfEdywX0E7dsfNKt7WyHgmIGwmqpZLgI94PiL/65SO3Ub5qon0N8O+ckfmknbH8dlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i1K2GDV3; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i1K2GDV3"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2162259a5dcso83714915ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738374920; x=1738979720; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCQc2q0n8iaCKUseqDIQ7ox+aypKaYwwg2S2s/uaqm4=;
        b=i1K2GDV3iw3gi6BtHRXlYLTQZkAPSRX8xGKC/km/R480lY9tDLlvCP30Geikig9REH
         tNLj2M8MMFdgLtwSZ1AF5Yj945x8wLOcJCn6IsNK5BITBnUzGqs3Ux3G9j9sv6nB4SC6
         mXEZ60iGALk+zBblK4efyrmugm6VsGmXDw8e/awxLRSvpiW/o+1xqObH191OOVMj0nZN
         csMsyls8b6zlDp11Jb1cWWaLSIZPbi+F6ztrMrkGT7U5cDvLqN5Fl5OzGL4AkeYDGpxK
         L0nkniUYaFQqt3UnQw0KSBAuQQ0EH5YxD0wB7gabzaBP+nyVPR/OzRatCvD++8Oed/dH
         WKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738374920; x=1738979720;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCQc2q0n8iaCKUseqDIQ7ox+aypKaYwwg2S2s/uaqm4=;
        b=a6CvWbdtBWFr3KdrwGqMjlh2wdwj03bo+VxKURfYr4KhEQwSV3RM5y1x2zW8CpaYCS
         acojgByZuvnXME1qpAIkevW9wMJu6/E1d+rlDXhwEG5kOmY9tq9IFQSZl4kad9jyGcjb
         nc5Gs0aWqmhlpGSvtfnaby7YB7uipJvzv/YuBBHjA70QwOUaljX0RP12A/3BQb9qpvsq
         Yd5S2sdXe3w0aX2z/p8QocqDTQuHPkWA/BRrE/t0AQm6N6WEWLj2jDV21e8hp1IelszA
         6Jc3srO/MxcJ/FTb6rsGkD3Fujr2X4v++cONKIiBKOiYMEj1QWTXFCMvUFQWo9UiMVXn
         F3mA==
X-Forwarded-Encrypted: i=1; AJvYcCXaha/l9Gs2RW/7++YUIU4JDCUZumI6QriQIae3XTD0hQGLzJcbSWf3fFJ1hhmXm5/shYiWIxw6oPWmBMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgK7yqrw/mnw46L0wk4+h66B76vKugu+d+VPQjXpJ7xFJusN9
	g8t3Hh19GdufoCOwNE3/1YaAyb9NBwYEnK59m8wSN29wVtka0LqX71FGa32/O3eZjTxPDq/ZUOl
	OYA==
X-Google-Smtp-Source: AGHT+IGDqN6Rs+jw5khdspySFL4CJS9HjO7D386k56zEUbfyPxOceL+2AFJ49+g6jY6rA8O9kk15vSdmhIk=
X-Received: from pgwc23.prod.google.com ([2002:a65:66d7:0:b0:7fd:5835:26d1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:98c:b0:216:356b:2685
 with SMTP id d9443c01a7336-21dd7c4e433mr213647605ad.11.1738374920226; Fri, 31
 Jan 2025 17:55:20 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:55:07 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201015518.689704-1-seanjc@google.com>
Subject: [PATCH v2 00/11] KVM: x86: Fix emulation of (some) L2 instructions
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fix a variety of bugs related to emulating instructions on behalf of L2,
and (finally) add support for synthesizing nested VM-Exit to L1 when L1
wants to intercept an instruction (KVM currently injects a #UD into L2).

There's no real motivation behind this series.  I spotted the PAUSE_EXITING
vs. BUS_LOCK_DETECTION goof when sorting out a report/question about HLT
emulation in L2 doing weird things, and then stupidly thought "how hard can
it be to generate a VM-Exit?".  Turns out, not that hard, but definitely
a bit harder than I was anticipating due to the annoying RIP vs. next RIP
flaw.

Given that VMX has literally never done the right thing, and SVM was quite
broken since the beginning, I doubt anyone cares about this, but we have
the code, so why not...

Sean Christopherson (11):
  KVM: nVMX: Check PAUSE_EXITING, not BUS_LOCK_DETECTION, on PAUSE
    emulation
  KVM: nSVM: Pass next RIP, not current RIP, for nested VM-Exit on
    emulation
  KVM: nVMX: Allow emulating RDPID on behalf of L2
  KVM: nVMX: Emulate HLT in L2 if it's not intercepted
  KVM: nVMX: Consolidate missing X86EMUL_INTERCEPTED logic in L2
    emulation
  KVM: x86: Plumb the src/dst operand types through to
    .check_intercept()
  KVM: x86: Plumb the emulator's starting RIP into nested intercept
    checks
  KVM: x86: Add a #define for the architectural max instruction length
  KVM: nVMX: Allow the caller to provide instruction length on nested
    VM-Exit
  KVM: nVMX: Synthesize nested VM-Exit for supported emulation
    intercepts
  KVM: selftests: Add a nested (forced) emulation intercept test for x86

 arch/x86/kvm/emulate.c                        |   5 +-
 arch/x86/kvm/kvm_emulate.h                    |   7 +-
 arch/x86/kvm/trace.h                          |  14 +-
 arch/x86/kvm/vmx/nested.c                     |  14 +-
 arch/x86/kvm/vmx/nested.h                     |  22 ++-
 arch/x86/kvm/vmx/vmx.c                        | 102 ++++++++----
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/x86/nested_emulation_test.c | 146 ++++++++++++++++++
 8 files changed, 265 insertions(+), 46 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/nested_emulation_test.c


base-commit: eb723766b1030a23c38adf2348b7c3d1409d11f0
-- 
2.48.1.362.g079036d154-goog

