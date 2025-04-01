Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37B320E6E3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524288; cv=none; b=i6wTu70NadTUS8krmbGGUK8YcQWkIF1+YPTA0s9/dmET9ccgMoyZw08sK8rOBt5y7E1KReqvePbJXW3H4tMxUwULRB0c3xANt3aQpQbwPu3t4FEQ9lS8VJ+vHcV7FDPgmPSieTgpryWqOJk0bUGxc3nMkVk0tnVXBp+OC2qW8Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524288; c=relaxed/simple;
	bh=hXiSfRIVnp1UtOUy68VQPv8Grqb6r0Y/djWDcu8Iitk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=P+qCkSWSvmvMGgfwtUBo65/8SLdgqAn3m4T3iut/ba2b8WjkG4sLiiBJ2X32Yu6kk5JpSxhIzlVyVPanA3SCB7qOFrrXD378b4f5MulzrQUGy+lDkkJT+E8PziRBxzdBHiCSyroIJdcdmPDqhGP7Qr9Kv3eTBF8mJrnojXaCXNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LtjzqS6b; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LtjzqS6b"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2265a09dbfcso7065115ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743524286; x=1744129086; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19naIH9ug+/5n2RgKxWoWgHuCCiFZRtWAHL+JgKgjpg=;
        b=LtjzqS6bXsNpdQdWRC3nH5VvgLcaN4Stgm3Uw5GMkaeW48jDGoN2dqMC44JJdQ6SX2
         mnB7GeouBTz1DHgA7EkGRTIlgcySxNU+8t7F7X2R2ZTgVZ2Yn8JkjE5LVswGmvzzBoPo
         aIAGXh7pa/cSGHTKb7u2N94+aUUW8MhgDR84hxA4fyILFq1oJw6i1mqc8892lp4eLng4
         kgYbMUvxaeohovfI/+gnlYi9CfkjObCXocazTSjttFUyEGt3pyPol+3zlj/375xKjAai
         cq7vXLGyqeBrCivBzZgAVDZg6CyukzQ//ddDae+/1k0DrDcX439130hZVnB/9FWpnlzS
         kzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524286; x=1744129086;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19naIH9ug+/5n2RgKxWoWgHuCCiFZRtWAHL+JgKgjpg=;
        b=ShSkG/R4fzqzgfgQlFdKp0exfXP44kTudaiuk/YeIOCAyIeGKe1WybHrdC3xeEIYmj
         iXXGAwNguwNhf9dSQ7WdrxsBILE2zKHhy+l0Sxx9MhlPeTs9Hpu2WF8R/avT/UaeNedC
         3FqSqVdX7UHmYOH/dEc5jmKTgNd9yOhGAKnxL74vEuzpIunEA8z2EHoUGOOC5wt2qCth
         5aM+U3MDk6GsdsPQKCXg4Zzo6yzhiWFlZxNNyd+29D2fASM8MnvU0qPZD6MQOKOegX2s
         jBRmIeeSj1krCqn8/sbnTX3yWDyUnmEj2YJDg6vSBtAJ57YijFgGIyiqp3jP0rz0LQta
         qd/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBb6WmNVOJNVP03+ggPAGRJ35BE8ZrmWDHbzjtCMB40Gp1Gl0w59PqJ1BKp3HX1MknXHdqhZ1rpRbjmcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6CPAgOHv9FnpTW06YavtitGa8dvHQzv3QHbquptG0Ls8iiMnn
	ybiZvzouKteYkEoITT3GpMGFGsHHSWjG2PW/2tl1C8WqqJIQfZs82Y2z8wX+hE9Y5udX5S/01eW
	ivQ==
X-Google-Smtp-Source: AGHT+IH0/xa6d9xPOKkCBD1Yeu+PE6hNBcgyDq3oVyckCsne8CfiJBk02Muz1N6KD7o9AzA0IRG6b4ZAGcY=
X-Received: from pfbki6.prod.google.com ([2002:a05:6a00:9486:b0:736:38eb:5860])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88d0:0:b0:731:737c:3224
 with SMTP id d2e1a72fcca58-739803b3f12mr19203881b3a.10.1743524286111; Tue, 01
 Apr 2025 09:18:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 09:18:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401161804.842968-1-seanjc@google.com>
Subject: [PATCH v3 0/3] KVM: x86: Add a module param for device posted IRQs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a module param, enable_device_posted_irqs, to control and enumerate
KVM support for device posted IRQs.

v3:
 - Put the module param in vendor code to avoid issue with reloading vendor
   modules, and to match enable_apicv (and enable_ipiv in the future).
 - Fix a shortlog typo. [Jim]

v2:
 - https://lore.kernel.org/all/20250320142022.766201-1-seanjc@google.com
 - Add prep patches to use kvm_arch_has_irq_bypass() in vendor code when
   querying support IRQ bypass, a.k.a. device posted IRQs, so as not to
   unexpectedly introduce a (desired) dependency on enable_apicv. [Yosry]
 - Use "&=" when constraining enable_device_posted_irqs based on APICv
   and IOMMU posting support. [Yosry]

v1: https://lore.kernel.org/all/20250315025615.2367411-1-seanjc@google.com

Sean Christopherson (3):
  KVM: VMX: Don't send UNBLOCK when starting device assignment without
    APICv
  KVM: SVM: Don't update IRTEs if APICv/AVIC is disabled
  KVM: x86: Add module param to control and enumerate device posted IRQs

 arch/x86/include/asm/kvm_host.h | 1 +
 arch/x86/kvm/svm/avic.c         | 3 +--
 arch/x86/kvm/svm/svm.c          | 2 ++
 arch/x86/kvm/vmx/posted_intr.c  | 7 +++----
 arch/x86/kvm/vmx/vmx.c          | 2 ++
 arch/x86/kvm/x86.c              | 9 ++++++++-
 6 files changed, 17 insertions(+), 7 deletions(-)


base-commit: 782f9feaa9517caf33186dcdd6b50a8f770ed29b
-- 
2.49.0.472.ge94155a9ec-goog

