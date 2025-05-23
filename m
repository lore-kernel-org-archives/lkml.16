Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C8A297126
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017518; cv=none; b=LIw/rbkTotZCMmG+zpJSddHrcUtemI2ZMHDvPQesea3HSZ73PBGYL8+NHGl9OLMEIoWozTy9Ps6R+yoWhVe/ZtdIJc5v7F4n5GIOAZ9e0Oloep/XEFsr2wFcO4Jafu0IvEeEINfW+zqnANDg5DYejP5K2H0cAdXauEEgIAdq/ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017518; c=relaxed/simple;
	bh=V401EgHVE78JUYmYU948oRUbRI9ZKADht4kST8jBJXo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YFPIk6T0Kl9s8OQQQNbLjxDhrF0vqLTgtqH7QywUXLQ3WT04DKLuFCSzV6i6yE/xd5+xvVmEPxyHbHn2FN7yqJALMac+a81uz/RQ/wyqeY0yiQ0pHKMwNJDjmPhYJIJ9uQkj9/GfbVdlZ6+8mjSqiMgh5k+nqvKqihztibba2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UJl6um9Y; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UJl6um9Y"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e78145dc4so124656a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748017515; x=1748622315; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fp5iNCuCvsDrxTMi6sCpDlvK9G322dljoTXNpRNareg=;
        b=UJl6um9Y5qDIc3+6ipGqPAXKUoH7egecNWxGNjs2/k34YXJoZ/52We/8XRvreE+9zW
         M+T3uHtcFKcFUmzQyT2QtcIlrpnVxzs8WKiDJw5arZ0dG7ZUltagWrI26iZ9YOM12rTs
         94cizvo3XdghGhfjFMctHBOHijss/glzSp0qvXcbkkvGCh2OhMTycfGf8xDX+nNkgrH4
         1swngHH6yJ7oTh4EZA8Yn7J0ujdAIpPL/VpQ3sZQkMtJFU+LCO95V4753LiF7O1Mt+wx
         MoutczI/5YXXyCknG2tFJ3tJz3yIhst63k6TuUM8og5bt3NLwVvXYxLzQh9mqAu6+c78
         bqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017515; x=1748622315;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp5iNCuCvsDrxTMi6sCpDlvK9G322dljoTXNpRNareg=;
        b=XSoHSlt9W/HZDZlB+pOvWiSFcfEbTEaUr5x5J6T3hQus5XAOT6FUKAGJotMbkFhdPA
         RkB+Kyf+fxfvf3T2jBxA+hZPuyBhje9rK8FJQBXgGGwq0ca2jVEJ6qk79qJlxon3eij0
         f998Y4do2zNevrTwBRYo4cNJWjdvoRmA4vd0qYLaAvmBMgdz7d33fEtIqbNt8Id5TTMU
         wTu/Du3ve5PyxQ0tuSTx0TPAqa/Wsqdl9rtbEdFa78VItush/1e+SxC8cHNIzUJRHRJM
         TtVwr4k4wmk2mqXIkiyVrqgAfEsMrorae8uBTgpFOkLmj91KVzAKv+Nj5ooSAwZExLl3
         QhGw==
X-Forwarded-Encrypted: i=1; AJvYcCUJTZThGDF2J604lRjK7PQoMIcdX8KiH85e8JbSrwtjU0a0tS0clIh90u1SvDAdHScICpN5Fzl6lcMQN2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHy+Z/rfArZsqz62Zb3kkLEMHJbpKFaLhfVF9LXSh3Z7ZX66tf
	aES/0YPhtKKRB9ze8xacKKg61CqPgqAS5grATwfJwlfbPdrcsTbDHnfrbiuQyQzs2fn9+7mbFa0
	1YqQQEA==
X-Google-Smtp-Source: AGHT+IHdDr07A7qyjR+jCdfmBGyg58wYOy0S5EE7ElsmvZQs+jFmS79API67vRpUyXcIngY3yRb6Bdoa6xw=
X-Received: from pjbsu5.prod.google.com ([2002:a17:90b:5345:b0:30a:4874:5389])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d888:b0:30e:823f:ef3c
 with SMTP id 98e67ed59e1d1-30e823ff09dmr48347056a91.25.1748017515105; Fri, 23
 May 2025 09:25:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 23 May 2025 09:25:02 -0700
In-Reply-To: <20250523162504.3281680-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523162504.3281680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523162504.3281680-6-seanjc@google.com>
Subject: [GIT PULL] KVM: x86: SVM changes for 6.16
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

A variety of SEV changes, and support for BUS_LOCK_EXIT (Bus Lock Threshold).

The following changes since commit 45eb29140e68ffe8e93a5471006858a018480a45:

  Merge branch 'kvm-fixes-6.15-rc4' into HEAD (2025-04-24 13:39:34 -0400)

are available in the Git repository at:

  https://github.com/kvm-x86/linux.git tags/kvm-x86-svm-6.16

for you to fetch changes up to 72df72e1c6ddfb6e0c2bce174d5879bc095540c8:

  KVM: selftests: Add test to verify KVM_CAP_X86_BUS_LOCK_EXIT (2025-05-19 11:05:19 -0700)

----------------------------------------------------------------
KVM SVM changes for 6.16:

 - Wait for target vCPU to acknowledge KVM_REQ_UPDATE_PROTECTED_GUEST_STATE to
   fix a race between AP destroy and VMRUN.

 - Decrypt and dump the VMSA in dump_vmcb() if debugging enabled for the VM.

 - Add support for ALLOWED_SEV_FEATURES.

 - Add #VMGEXIT to the set of handlers special cased for CONFIG_RETPOLINE=y.

 - Treat DEBUGCTL[5:2] as reserved to pave the way for virtualizing features
   that utilize those bits.

 - Don't account temporary allocations in sev_send_update_data().

 - Add support for KVM_CAP_X86_BUS_LOCK_EXIT on SVM, via Bus Lock Threshold.

----------------------------------------------------------------
Kim Phillips (1):
      KVM: SEV: Configure "ALLOWED_SEV_FEATURES" VMCB Field

Kishon Vijay Abraham I (1):
      x86/cpufeatures: Add "Allowed SEV Features" Feature

Manali Shukla (3):
      KVM: x86: Make kvm_pio_request.linear_rip a common field for user exits
      x86/cpufeatures: Add CPUID feature bit for the Bus Lock Threshold
      KVM: SVM: Add support for KVM_CAP_X86_BUS_LOCK_EXIT on SVM CPUs

Nikunj A Dadhania (2):
      KVM: SVM: Add architectural definitions/assets for Bus Lock Threshold
      KVM: selftests: Add test to verify KVM_CAP_X86_BUS_LOCK_EXIT

Peng Hao (2):
      KVM: SVM: avoid frequency indirect calls
      x86/sev: Remove unnecessary GFP_KERNEL_ACCOUNT for temporary variables

Sean Christopherson (1):
      KVM: SVM: Treat DEBUGCTL[5:2] as reserved

Tom Lendacky (6):
      KVM: SVM: Fix SNP AP destroy race with VMRUN
      KVM: SVM: Decrypt SEV VMSA in dump_vmcb() if debugging is enabled
      KVM: SVM: Dump guest register state in dump_vmcb()
      KVM: SVM: Add the type of VM for which the VMCB/VMSA is being dumped
      KVM: SVM: Include the vCPU ID when dumping a VMCB
      KVM: SVM: Add a mutex to dump_vmcb() to prevent concurrent output

 Documentation/virt/kvm/api.rst                     |   5 +
 arch/x86/include/asm/cpufeatures.h                 |   2 +
 arch/x86/include/asm/kvm_host.h                    |   5 +-
 arch/x86/include/asm/svm.h                         |  10 +-
 arch/x86/include/uapi/asm/svm.h                    |   2 +
 arch/x86/kvm/svm/nested.c                          |  34 ++++++
 arch/x86/kvm/svm/sev.c                             | 113 ++++++++++++++++-
 arch/x86/kvm/svm/svm.c                             | 135 +++++++++++++++++++--
 arch/x86/kvm/svm/svm.h                             |  12 ++
 arch/x86/kvm/x86.c                                 |   8 +-
 include/linux/kvm_host.h                           |  19 ++-
 tools/testing/selftests/kvm/Makefile.kvm           |   1 +
 tools/testing/selftests/kvm/x86/kvm_buslock_test.c | 135 +++++++++++++++++++++
 virt/kvm/kvm_main.c                                |  19 ++-
 14 files changed, 469 insertions(+), 31 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/kvm_buslock_test.c
