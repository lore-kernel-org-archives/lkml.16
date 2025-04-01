Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C0B20C477
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525795; cv=none; b=uNffRp4oj6IJHYqIkPXRebS4tKVE4BmyjaupayfHtdvoDHd1neET2D74UWtlhzdw+CcW28WieNRZ9K2jNWU3m5bm4VlghBRq929B+akqcObztKmgoDx9zgPT+s6rzq2tIYGPbiCtRq3RZS0VzFOc57fWJGpBocdksSTP+B9o0ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525795; c=relaxed/simple;
	bh=M2TWGxm2NnULLddMhVhPkqPLLNeRUG1H8C4s84FThmU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jjEA3ScKukIeTsowX0us4TlauRzASWblES/4e4K8pq2U31KlI56KUEQaY31/tRHz1vXUFdx0fwMnQ1Kj5C9AUSVxMFq3XBqTdR8rleNlLQCT1tAJjoGfC8jx/AufToMS2/RZCcfAB7u+vHQ96q1W7K/5vpqXN1yCeelYRuM5JwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NcZQotf7; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NcZQotf7"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224364f2492so100046825ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743525794; x=1744130594; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUK/6WGgSJ/C4fjzbbO0q/5WO+lyppJyX3j10SVag1Y=;
        b=NcZQotf7j27GUQOvVdAb/vG8T6lvb5ReHuVA1DeI28ozGxYYzoymTG1AoW20OlTYa2
         ceVgq3d0CHQ5f+3byczq7H4is0bz8LecbGZ626idV4E+hYrCVgOSH91W6nD7JeGUhNXb
         BWP7ssORJE8aeYxjrkKjW9/khxPLuol4b2GYpZhrlQjnlNNcOXKAF0AzNzr+xD4GBHW4
         GCMPk0wR0iH0VW5H3gXft7QZ5AaTQ1ediHQ48FEugQ0uuCXxedKvvYPhvHiv+VlvHpVD
         SpmVaHhzcmpfL3b0TljmEMnUGBOmJ7CH71dOU6iamm7/j7ptxX2rtm/a606yanCwJzZU
         75qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525794; x=1744130594;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUK/6WGgSJ/C4fjzbbO0q/5WO+lyppJyX3j10SVag1Y=;
        b=Zgs8yeciF5yZLjJ3svJgmyoGzVlaOeWOSsAu/J0lLRHuAN27YZ7l3XOouXcAiFExpD
         btY5PMMcV2Jj74802M4Ha9kwo6M6E1Y+G2nULve9K23S2f7IkPDpHBCGpXFGEpaGmVpt
         VgOcK+rRdaiHtKNYnn93blRszcV6JkwMXkJezoC4T8oflFERqsFFZYuKw86mt9fGevhX
         0gWUfQ+BZOjg1WZyUpODIfRURy9HBJMfO9sJFX70qOWlyKyztTz+srUuASvF9qfloeK2
         U5QJ2bM+wfYVFHvunePIy4lxMNp6iBgnc/7gb426jDDqwKMn5t9hGY23CfuUoG2oVIOj
         Os9w==
X-Gm-Message-State: AOJu0YxMICRqvHLy+ssWhwrPV6h5vQHcDkLa/HZLZUORAn6O7qJfzwk1
	XRo7Gi8Q8jadbK1CfYi9ItuhM95BWA7WQblNtJpyX5+lTrpAsNQoSvxhw99ONSoG9DKSZmV+rMk
	28g==
X-Google-Smtp-Source: AGHT+IH5cSz/o1O5v0jybOuWyQZ2DFWw5DlZufPEuiMUgV19rvAjQSX5gNGvM0NBycvX5iYtLbhVUResHeo=
X-Received: from pfih11.prod.google.com ([2002:a05:6a00:218b:b0:736:79d0:fd28])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e541:b0:21f:3e2d:7d42
 with SMTP id d9443c01a7336-2292f9773b4mr180796675ad.23.1743525793742; Tue, 01
 Apr 2025 09:43:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 09:34:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401163447.846608-1-seanjc@google.com>
Subject: [PATCH v2 0/8] x86/irq: KVM: Optimize KVM's PIR harvesting
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Optimizing KVM's PIR harvesting using the same techniques as posted MSIs,
most notably to use 8-byte accesses on 64-bit kernels (/facepalm).

Fix a few warts along the way, and finish up by adding a helper to dedup
the PIR harvesting code between KVM and posted MSIs.

v2:
 - Collect a review. [tglx]
 - Use an "unsigned long" with a bitwise-OR to gather PIR. [tglx]

v1: https://lore.kernel.org/all/20250315030630.2371712-1-seanjc@google.com

Sean Christopherson (8):
  x86/irq: Ensure initial PIR loads are performed exactly once
  x86/irq: Track if IRQ was found in PIR during initial loop (to load
    PIR vals)
  KVM: VMX: Ensure vIRR isn't reloaded at odd times when sync'ing PIR
  x86/irq: KVM: Track PIR bitmap as an "unsigned long" array
  KVM: VMX: Process PIR using 64-bit accesses on 64-bit kernels
  KVM: VMX: Isolate pure loads from atomic XCHG when processing PIR
  KVM: VMX: Use arch_xchg() when processing PIR to avoid instrumentation
  x86/irq: KVM: Add helper for harvesting PIR to deduplicate KVM and
    posted MSIs

 arch/x86/include/asm/posted_intr.h | 78 +++++++++++++++++++++++++++---
 arch/x86/kernel/irq.c              | 63 ++++--------------------
 arch/x86/kvm/lapic.c               | 20 ++++----
 arch/x86/kvm/lapic.h               |  4 +-
 arch/x86/kvm/vmx/posted_intr.h     |  2 +-
 5 files changed, 95 insertions(+), 72 deletions(-)


base-commit: 782f9feaa9517caf33186dcdd6b50a8f770ed29b
-- 
2.49.0.472.ge94155a9ec-goog

