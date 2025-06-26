Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E8C22173F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750977107; cv=none; b=pukPoNS9m3hkTlcRNvaRADEeHFRHreD72YeE5vHJ1XfJSD42CrD8A7MoggVmgGXdE8EzR3J+bKlicZelnUYodhiwjb/Y8mshuIBidRUA12gWg11AVVjdqC3y7y4txH+A9BYwK52INvEz7d4szfK8CHn9HMQgeu42aCBAln3mqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750977107; c=relaxed/simple;
	bh=tg7yDN+hDXimXnXN0SHBQlZ1bjq9tztOAM6uN8bxq4w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uIJB8SUnKx+xkN8G4GJ0nHQanERTfNsYZITL0K29qBY04EAQcxjh/06t257T8KgLzIE9yIMUvktL7JCPUTYAfzJG5JdLScpjnoO+ag8tTvLhKDxdgv3iCQQnQ/2346phn/i6lGP1nxGxRDab2ttPWB+IeORrgM3oayi0T5+ebtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tUSJYN23; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tUSJYN23"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b34abbcdcf3so943051a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750977105; x=1751581905; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76WxR4y5iyuxTg472JdhnT6w9I2JTre3cbttFiZ6d3I=;
        b=tUSJYN23i1b9i/IZMYh4IwCGQwqfWDvXsggVybIbvKw37GYkrBYbA+s6Qc/MwoP9tT
         zVF6QUGhwyUBOeDiMTy0zA9Ooa25g0fSp5cINKZ488qQ6lOq7UCEMmWz5Q/dDNIiRzU2
         SVZnGM1vhAf/rrmb3trS+VKUKU7P0ybzckz+w/v30TYYSatP/nOHFwFQdzV7uEK4RrZv
         JcBYTvZLTe1mfKnA9g+uKJKQtrwL6bKwEOXRVgzgUgTPVsL0HKjnEi9fsHt2E91tjhU2
         GUn+U5qdgsUILEoQIgGLnkHyUnANxpOaSaVLyzQiPNKFcyz/SIbFnWojifvObnuBw9jU
         vV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750977105; x=1751581905;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76WxR4y5iyuxTg472JdhnT6w9I2JTre3cbttFiZ6d3I=;
        b=HoEgQH2q42Z1P25nZllAldQH1EPzjxsTb96a4lEP+Uq5sB4m46/5WkvQX1jJg1fq/u
         vjXQNi2D13UQTrMaug8Sj2l/GwYHajI3k16w6JlHQnfbsbpfrTmCO8osMy03kXbRNiWL
         1iZnToEUMcLSBoUzQQwc7iye79diSNwq7h4Xdb5J9L+E/T6X2tO4q7XsZT5DWXLrE/ri
         8ixuW1YH46UqC08YH4ooq3Tei7x1AJCW2wpnilQh6LQwZLCT+UMTuZVkZwpcv1JC4CGm
         anQWGvKGXQQLBgHP/1tkHGSo7ifXjpkJihfBIGUTMerIJ2AGPTV+Di/BlpLuHx+6Xrts
         AXyg==
X-Forwarded-Encrypted: i=1; AJvYcCXAx6rJ/aXdpg4tx0taJWhE1GPNo3Mg+D4fiMULXsL1pQKU5xzHvHcvE958aLR2Kz03KFdiUeuzGfou6nY=@vger.kernel.org
X-Gm-Message-State: AOJu0YySWFtQPP0q1VlYaWk0OiHI1vd5MXdMhk/UwamUZJLu+K6xBTeb
	vjxP2wDi5otdIBl4R2/RBJrMI0APtMKfz9kFHb9ONQr6NfbBm0PQY2qYafJMcZD2Fn+yPBQa42D
	BvF+G6Q==
X-Google-Smtp-Source: AGHT+IGzbfhHp80ZAoOSq0Oj3noG7KmGJrdhg4whfc7tjCxy1T3FjGMypuiQuR0b1TZFmxEZAjHwoLW4Trs=
X-Received: from pjbss13.prod.google.com ([2002:a17:90b:2ecd:b0:312:dbc:f731])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:278b:b0:316:d69d:49fb
 with SMTP id 98e67ed59e1d1-318c8edb091mr1098184a91.14.1750977104989; Thu, 26
 Jun 2025 15:31:44 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Jun 2025 15:31:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626223142.865249-1-seanjc@google.com>
Subject: [GIT PULL] KVM: x86: Fixes for 6.16-rcN
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Please pull a random smattering of fixes for 6.16.  Note, the SEV-ES intra-host
migration commits received your "Queued, thanks", but they never showed up in
kvm.git.

Oh, and there's one more fix that is probably a candidate for 6.16, but I'm
waiting for a response from the submitter, as I think we can go with a more
targeted fix: https://lore.kernel.org/all/aFwLpyDYOsHUtCn-@google.com

The following changes since commit 28224ef02b56fceee2c161fe2a49a0bb197e44f5:

  KVM: TDX: Report supported optional TDVMCALLs in TDX capabilities (2025-06-20 14:20:20 -0400)

are available in the Git repository at:

  https://github.com/kvm-x86/linux.git tags/kvm-x86-fixes-6.16-rcN

for you to fetch changes up to fa787ac07b3ceb56dd88a62d1866038498e96230:

  KVM: x86/hyper-v: Skip non-canonical addresses during PV TLB flush (2025-06-25 09:15:24 -0700)

----------------------------------------------------------------
KVM x86 fixes for 6.16-rcN

 - Reject SEV{-ES} intra-host migration if one or more vCPUs are actively
   being created so as not to create a non-SEV{-ES} vCPU in an SEV{-ES} VM.

 - Use a pre-allocated, per-vCPU buffer for handling de-sparsified vCPU masks
   when emulating Hyper-V hypercalls to fix a "stack frame too large" issue.

 - Allow out-of-range/invalid Xen event channel ports when configuring IRQ
   routing to avoid dictating a specific ioctl() ordering to userspace.

 - Conditionally reschedule when setting memory attributes to avoid soft
   lockups when userspace converts huge swaths of memory to/from private.

 - Add back MWAIT as a required feature for the MONITOR/MWAIT selftest.

 - Add a missing field in struct sev_data_snp_launch_start that resulted in
   the guest-visible workarounds field being filled at the wrong offset.

 - Skip non-canonical address when processing Hyper-V PV TLB flushes to avoid
   VM-Fail on INVVPID.

----------------------------------------------------------------
Binbin Wu (1):
      Documentation: KVM: Fix unexpected unindent warnings

Chenyi Qiang (1):
      KVM: selftests: Add back the missing check of MONITOR/MWAIT availability

David Woodhouse (1):
      KVM: x86/xen: Allow 'out of range' event channel ports in IRQ routing table.

Liam Merwick (1):
      KVM: Allow CPU to reschedule while setting per-page memory attributes

Manuel Andreas (1):
      KVM: x86/hyper-v: Skip non-canonical addresses during PV TLB flush

Nikunj A Dadhania (1):
      KVM: SVM: Add missing member in SNP_LAUNCH_START command structure

Sean Christopherson (3):
      KVM: SVM: Reject SEV{-ES} intra host migration if vCPU creation is in-flight
      KVM: SVM: Initialize vmsa_pa in VMCB to INVALID_PAGE if VMSA page is NULL
      KVM: x86/hyper-v: Use preallocated per-vCPU buffer for de-sparsified vCPU masks

 Documentation/virt/kvm/api.rst                     | 28 +++++++++++-----------
 arch/x86/include/asm/kvm_host.h                    |  7 +++++-
 arch/x86/kvm/hyperv.c                              |  5 +++-
 arch/x86/kvm/svm/sev.c                             | 12 ++++++++--
 arch/x86/kvm/xen.c                                 | 15 ++++++++++--
 include/linux/psp-sev.h                            |  2 ++
 .../testing/selftests/kvm/x86/monitor_mwait_test.c |  1 +
 virt/kvm/kvm_main.c                                |  3 +++
 8 files changed, 53 insertions(+), 20 deletions(-)
