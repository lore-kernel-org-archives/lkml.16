Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BE323D28B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747432467; cv=none; b=ncPIXvOKUtGUY0evqpcZgk+WwwIamrKvC0upAUc/wSnhJjCU8Hxbg5tsIBijUWSv3UCg4GyZLJICBtSAdnmz/k4ty2nmtvB0wxwAIRpREbKp03eOLMbC+jF583WCjyDAgI8nu3XH5kxY9f+l1VH/FYVJGwZD/AI5hSAd5PQOoUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747432467; c=relaxed/simple;
	bh=0zsADKJxVwIFUmSHLVjOKFXmat6HPSmb5OA9Wtwd8rA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LTA9XNkADvxN1hOUejxeygA6pPxlP9QlgVjPPUzak7KGN+K0BvcFJewwP4vcAWfvomVZ7hq5RwcATOLQCDjdxCTwllAJ250REHQNW6X84AG5DPgN2ed/CwtL//0018yJJ9dqqjnXtb+Bvo3PvbYlpSVG9sSKNMlM1vlJ9u+s9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s2zOUJuz; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s2zOUJuz"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e74ee960aso1549505a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747432465; x=1748037265; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ay/c/8HgGCfoXVWQWviNjvFEW2ivvbN9Hc/VrbfvMuw=;
        b=s2zOUJuzT/I1mPqHlz0zkQHvszc9rLV8CA7DTLPtB47Mt6BsglyzNbXLnYCZHVSSz1
         Y/vJCCYvTK7eNmAHEYAj0nW33KQit/MBYsfCbqrEL/tVopttuM4KRNM+IyPfgsELr8ZT
         fSkDkwWWMnXr0i8Goi+doW5dhgavvLki1Sr3yJ3TPuowlAvWAjbRAcpdk9+lKejctVnh
         w8l2RchSm/nm0CoRTko5CE5VJ8xaElKcI7m7itvkStATyUK1Vx0FLyX0Wb4Ty+0SKmIF
         OT/ecr4Sxl2I7MZ4PNFLB1x05fxhNRqHrAJqeB7jIvKJC/6710qjomWFNkT1yV6ARvlZ
         iQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747432465; x=1748037265;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ay/c/8HgGCfoXVWQWviNjvFEW2ivvbN9Hc/VrbfvMuw=;
        b=YfxXuuCt+gFuVITJ1knW1WPPxkcXLLlDMGyjVsxuy08x9l3YEHkWf9wfrXbpI25CaV
         QSrYl/CYUkH1sc2Kw9yUVuJGb4DPR5sU86bIwei8BRqI21cP+rAg0JEFkuIf2sjGQk2Z
         uMPMK/yJZW2NvaNRdNNL+JjXHbIe49UICRw9kHu81pJpWIps6K8pvPfioCwSE9pHYAV3
         Znqhu6OM+hh1u/1dc/ywODxABOCAJtidFz29SSPNS8mY4kReJbAlhDezao258OznqvYX
         /GpawEE53whGN+QcSC5SE7Wt/tyXLk4WWZXbXHCX4y5jbPX2dKYiuh8meyUMefa22+9F
         K6TA==
X-Forwarded-Encrypted: i=1; AJvYcCWkAT88jLzLMgpVYevXcc6mffUDgfxMUqqUK53+puuI8ePh+UaAGGYviCVyJ59O4EN+q5OEq3Vmhds66+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1TSYGPK1ZLjPMG2AZeL6fuPRuB8rDsJMI/7NyroCkwiP1a8W6
	0CmvFa4dZP2BhZGbe99ooy/TEnbPSVbaNppXOUxm2ye+5wWFudyHrMFToKs3BylvH1BDBCY1vD2
	yns6yBA==
X-Google-Smtp-Source: AGHT+IGhgLTmrFuLhkwfrly44jet9mK5WGt/Lw9NMnlsI0AQKCCNMRchyWptk0nihj58pPwC8bfS2BkTJSY=
X-Received: from pjm14.prod.google.com ([2002:a17:90b:2fce:b0:2fa:15aa:4d2b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c90:b0:30e:37be:6963
 with SMTP id 98e67ed59e1d1-30e83228d1cmr6479817a91.29.1747432465446; Fri, 16
 May 2025 14:54:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 14:54:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516215422.2550669-1-seanjc@google.com>
Subject: [PATCH v3 0/3] KVM: x86: Dynamically allocate hashed page list
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Third times a charm!  Right?  Right!?!?

Allocate the hashed list of shadow pages dynamically (separate from
struct kvm), and on-demand.  The hashed list is 32KiB, i.e. absolutely
belongs in a separate allocation, and is worth skipping if KVM isn't
shadowing guest PTEs for the VM.

Side topic #1, a bunch of my measurements from v2 and ealier were "bad",
because I was using a PROVE_LOCKING=y kernel, which significantly inflates
the size of "struct kvm" in particular.

Side topic #2, I have a patch to dynamically allocate the memslots hash
tables (they're very conveniently either 2KiB or 4KiB in size for 64-bit
kernels), but I couldn't convince myself that the complexity is in any way
justified.  I did however account for the size of the hash tables in the
assertions, if only to document where a big chunk of the per-VM memory usage
is going.

Side topic #3, AFAIK, DEBUG_KERNEL=n builds are quite rare, so I'm banking
on build bots tripping the assert (I'll also add a DEBUG_KERNEL=n config to
my own testing, probably).

v3:
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

Sean Christopherson (3):
  KVM: x86/mmu: Dynamically allocate shadow MMU's hashed page list
  KVM: x86: Use kvzalloc() to allocate VM struct
  KVM: x86/mmu: Defer allocation of shadow MMU's hashed page list

 arch/x86/include/asm/kvm_host.h |  6 +--
 arch/x86/kvm/mmu/mmu.c          | 73 ++++++++++++++++++++++++++++++---
 arch/x86/kvm/svm/svm.c          |  2 +
 arch/x86/kvm/vmx/main.c         |  2 +
 arch/x86/kvm/vmx/vmx.c          |  2 +
 arch/x86/kvm/x86.c              |  5 ++-
 arch/x86/kvm/x86.h              | 22 ++++++++++
 7 files changed, 102 insertions(+), 10 deletions(-)


base-commit: 7ef51a41466bc846ad794d505e2e34ff97157f7f
-- 
2.49.0.1112.g889b7c5bd8-goog

