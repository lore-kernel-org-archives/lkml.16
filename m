Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C54C6C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959104; cv=none; b=BeOC6MWQLX9QOZreIez1+JQjN2FcCd/P2xPhoPjruRdDzxFL2rhKXfNt7W13qZMBkZtbdTjAG650Q6yIGduw1D6Q/0N8pECHdeHFnp23GTmI3Yh7Xo71Mtn4cB/URpODO8NMsngUIqDkS0nt8bnjIN1f6BAnBxSabsfzsz0jeA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959104; c=relaxed/simple;
	bh=sQw+ZBS7btddT1jEyQ0Mw2gQseAOEUbp2G/+0j/KjW4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ghu3C97B0wKV7/0SQkrnZqv5fINqmJ7XrULJs8TqGQYDTSxMI57NHIdIFnkQYO0uPFucCAklSSLVen7VNadkqY5gsZgkggEtZsGxJgtAGTRGqdql2pKWRvjlF0FR61+5CU2jjuKQXGVJClb/Ofkunog3BQ7sPe0eDOSL74dddj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fAky0Yo2; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fAky0Yo2"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3108d5156e8so3386230a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747959101; x=1748563901; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwOiWiUkW2WRC0f12oP0F8RtFJzWREDgIfvrDaq9yGs=;
        b=fAky0Yo2kTjLoeYgQGklIm0Wf1hvDPZClWzH/9kw/qpgkwAjewvVRhg7FBp3g20QVC
         GMpXOCmUecMHkofEtH+tVW7/s8fEZ1MK/82Srw3nGvdxClf580Ue3kJHpsVhaw5Vesiz
         MsfDJaams/Rgx985H52RbMAaem6ENaTNPBgWuCdvfHQLowGzG1bJYJcj4WRmoJj/ubcO
         NzCkxECUx+q4tfsyY7JK0VHHWhj2HLGBimvVngKh+SI0zZE25tLQ3Arr/8eekV64pNGS
         gW8ChPVrpTEv++jxQskxuLwUZJHzcVRpp7RzGggz78tqadj2uUMQdFJ3bHfd/+MKycLf
         D9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959101; x=1748563901;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwOiWiUkW2WRC0f12oP0F8RtFJzWREDgIfvrDaq9yGs=;
        b=oN7Ld66J/qDFvAtamCLKIS27jeaY6/AAeWxnt2dQ7s4pkjABMkhNzbrJng6QH8WJHK
         h31oTQYWp04OzI83lY9cMHzur1sQCwAd/DSS3w8YkMHirWdHBzgfsXHKSd3DhSMkd6Hp
         C/1hizmy/UKSYxD8HG3vzcid3uTs83ZQ7zG32Tr1RH6uneiqgWu1yevE8WR2QjSFJ4BC
         KLZV8F7Qj3ivw0HeU5tOM8h6BptEevv/Dhqt2ByokZWs7Nb2IzDvB8Jl5XebYxInhFMP
         cOHnf0PNQnXIdflYP1+sOc8ShgiTaRz6zUhTD8WlNPyKUxWVSNeSIvp5H2KI0ehV+c5j
         3Wlg==
X-Forwarded-Encrypted: i=1; AJvYcCV3hGoTC9qK7hm5BnGt9x/5DJmsqqu2yB8WwLSleKAxOM3rp42pwA32yaEoEMpik047zI/NazgkjR4JV2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzCghu136m1uA0xpfX+ZENaO4Fnucq4sohHE9MXE+UIsJRos7v
	KNzULiIGX0Fip+SpK95x0Gz0/6SMqEB7KRMecdqgiH0imXnJxvV/cTCOF/qWN5jxIr8Lcl2Zpk2
	Cwd6a2g==
X-Google-Smtp-Source: AGHT+IHfJRG6bZqXDGiQR0PkW8vISNvqIJt+BBS5L57W17F1JJXNfuZ6GkBx45/WIbeFHaWld6GcnrXttZg=
X-Received: from pjbqb9.prod.google.com ([2002:a17:90b:2809:b0:308:6685:55e6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c90:b0:2f2:a664:df1a
 with SMTP id 98e67ed59e1d1-310e96b5fb7mr1787280a91.2.1747959101663; Thu, 22
 May 2025 17:11:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:11:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523001138.3182794-1-seanjc@google.com>
Subject: [PATCH v4 0/4] KVM: x86: Dynamically allocate hashed page list
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"

Allocate the hashed list of shadow pages dynamically (separate from
struct kvm), and on-demand.  The hashed list is 32KiB, i.e. absolutely
belongs in a separate allocation, and is worth skipping if KVM isn't
shadowing guest PTEs for the VM.

I double checked that padding kvm_arch with a 4KiB array trips the assert,
but padding with 2KiB does not.  So knock on wood, I finally got the assert
right.  Maybe.

v4:
 - Use smp_store_release() and smp_load_acquire() instead of {READ,WRITE}_ONCE,
   and update the comments accordingly. [Paolo, James]
 - Move the kvm_tdx assert to tdx.c. [Paolo]
 - Fix the assertion, again.  [Vipin, in spirit if not in reality]
 - Add a patch to move TDX hardware setup to tdx.c.

v3:
 -  https://lore.kernel.org/all/20250516215422.2550669-1-seanjc@google.com
 - Add comments explaining the {READ,WRITE}_ONCE logic, and why it's safe
   to set the list outside of mmu_lock. [Vipin]
 - Make the assertions actually work. [Vipin]
 - Refine the assertions so they (hopefully) won't fail on kernels with
   a bunch of debug crud added.

v2:
 - https://lore.kernel.org/all/20250401155714.838398-1-seanjc@google.com
 - Actually defer allocation when using TDP MMU. [Vipin]
 - Free allocation on MMU teardown. [Vipin]

v1: https://lore.kernel.org/all/20250315024010.2360884-1-seanjc@google.com

Sean Christopherson (4):
  KVM: TDX: Move TDX hardware setup from main.c to tdx.c
  KVM: x86/mmu: Dynamically allocate shadow MMU's hashed page list
  KVM: x86: Use kvzalloc() to allocate VM struct
  KVM: x86/mmu: Defer allocation of shadow MMU's hashed page list

 arch/x86/include/asm/kvm_host.h |  6 +--
 arch/x86/kvm/mmu/mmu.c          | 75 ++++++++++++++++++++++++++++++---
 arch/x86/kvm/svm/svm.c          |  2 +
 arch/x86/kvm/vmx/main.c         | 36 +---------------
 arch/x86/kvm/vmx/tdx.c          | 47 +++++++++++++++------
 arch/x86/kvm/vmx/tdx.h          |  1 +
 arch/x86/kvm/vmx/vmx.c          |  2 +
 arch/x86/kvm/vmx/x86_ops.h      | 10 -----
 arch/x86/kvm/x86.c              |  5 ++-
 arch/x86/kvm/x86.h              | 22 ++++++++++
 10 files changed, 139 insertions(+), 67 deletions(-)


base-commit: 3f7b307757ecffc1c18ede9ee3cf9ce8101f3cc9
-- 
2.49.0.1151.ga128411c76-goog

