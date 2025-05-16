Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD3B28002F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431344; cv=none; b=mE/4mm8TjHwrhdjF/NGKmf+MScKgUvDiJStOo/RS7VcO9ABQ3rB4RsUNplicCFiag78Ltjo/yQY/vevzBe2wqcQfNsGTuvBaLAePrONDDAHMqmiEMERtE2prbdyi3OMWxaod6eqompMcFDv3aVoji7wI3DwYCskWg7Ehjh7DqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431344; c=relaxed/simple;
	bh=hPL5e/P/cV9diBrTyzd7jSCS8KcQA3rmpSv703Ir/mA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nDtFQ1Kaivn2MHnb6RpOmW4GzZI9oobYCsER40nfdHu+rfMUNJk2zh/Y+O/K8YrSVjQhBZgVJsGu8rhrCzWctUVNqocVJgbnu8IWAMRt1xr32D9OYGihz4KVIzm/j0BB3SQvJK1uzX/tWIyfWatHfDWXMpvncJsvgcarC0mAy24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fKNYuCzp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fKNYuCzp"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30e9b2e7a34so308671a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747431342; x=1748036142; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNHr7Po9X4IY3i+xCFCFaGljs9bw7WMHVo7Wciw81Ak=;
        b=fKNYuCzptjRrJ/2VP6KkiDeawUaee+ngU3wTPYo+etQBz9sTgYegt6ZKemaHZIGWNT
         //QGsxD7NrmLeaNcNFMKxTa9Q3Bd/oTChsf4VZpy/21rxpGiv9R8ehrau+lkA2B0TC8y
         ARd+Zz1InG+Ox0Er5HQ4V+7FATYeF2ZCVx3UjhOzYMVvpaltNvQHT9/H7dCrr09N7jMn
         M96IZT9bB7j/4vipVdL0Y29HCbdt5bBkS5B7l4nhAdpzSzMN+mMFlproe6yCuiqbqXtr
         rteNfmfkjiXAG90ZoJKgnwQs9V+dcmOjJ3dkhH7L0yx4NvlkGrPTvI7oi1hjfm11gxFR
         7lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431342; x=1748036142;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNHr7Po9X4IY3i+xCFCFaGljs9bw7WMHVo7Wciw81Ak=;
        b=Lay30SviUhmh1NDdyY4XjnxQiuDB9LstxHyl4omTI23coU8oUHinSUWuI8F/hywc/d
         FLrAM3lNj+4SX9a6nueIIR14lcHsLTaN7G7PX2RDPjb0sOuVRsAW/FCQGT5JVyR3H1bl
         c9YIzj7pl7U9UnrNAOk8TF7EOu5Lts0HW0CQYFnGhcitJDuqUW1u7L6jtr6Uzkstt7H2
         8N8XxheHJjoRkFzHjp9Nth2al+LGWOOKoia+zhwSs1T75RPdE0k6jpKTZLJsDXrmX4K8
         y5m9Awjj+y23kaKV+tx8mMobyiT7upIJ4x0JeacAFtQYdd1VpjMiO8oyoe/LJYxY5/8e
         wtlA==
X-Forwarded-Encrypted: i=1; AJvYcCVzfaQuRHtbTF48ER/hlcgqsjkS47xRiFNfnogI/d4vGooJS3fWnLvDzxI+o2UVtb8YfdmpT/B8psqQ84Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBv1klmRdqrilZ4p9rVnSkNpskgWK+oWnk9pHFPWbSqXuKglhv
	iel07iDL3WBSug0jugBi2HZMaKeP7LKaiaOTkmMf2KHvNIOwp0DftqIHxxDvL3xM7tS6qhJYl0f
	ljc7rPA==
X-Google-Smtp-Source: AGHT+IG+XyFJvw9Pd7od/AslUHXgv3/EqoXQrpwCSuULnqlUWxViE7nATwFTEJvFMOEYURtUCNEgKSxbh84=
X-Received: from pjbsy8.prod.google.com ([2002:a17:90b:2d08:b0:30e:65cf:2614])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c05:b0:2ff:5ec1:6c6a
 with SMTP id 98e67ed59e1d1-30e7d55ba27mr7784969a91.18.1747431342299; Fri, 16
 May 2025 14:35:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 14:35:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516213540.2546077-1-seanjc@google.com>
Subject: [PATCH v3 0/6]  KVM: Dirty ring fixes and cleanups
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Xu <peterx@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	James Houghton <jthoughton@google.com>, Sean Christopherson <seanjc@google.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>
Content-Type: text/plain; charset="UTF-8"

Fix issues with dirty ring harvesting where KVM doesn't bound the processing
of entries in any way, which allows userspace to keep KVM in a tight loop
indefinitely.

E.g.

        struct kvm_dirty_gfn *dirty_gfns = vcpu_map_dirty_ring(vcpu);

        if (fork()) {
                int r;

                for (;;) {
                        r = kvm_vm_reset_dirty_ring(vcpu->vm);
                        if (r)
                                printf("RESET %d dirty ring entries\n", r);
                }
        } else {
                int i;

                for (i = 0; i < test_dirty_ring_count; i++) {
                        dirty_gfns[i].slot = TEST_MEM_SLOT_INDEX;
                        dirty_gfns[i].offset = (i * 64) % host_num_pages;
                }

                for (;;) {
                        for (i = 0; i < test_dirty_ring_count; i++)
                                WRITE_ONCE(dirty_gfns[i].flags, KVM_DIRTY_GFN_F_RESET);
                }
        }

Patches 1-3 address that class of bugs.  Patches 4-6 are cleanups.

v3:
 - Fix typos (I apparently can't spell opportunistically to save my life).
   [Binbin, James]
 - Clean up stale comments. [Binbin]
 - Collect reviews. [James, Pankaj]
 - Add a lockdep assertion on slots_lock, along with a comment. [James]

v2:
 - https://lore.kernel.org/all/20250508141012.1411952-1-seanjc@google.com
 - Expand on comments in dirty ring harvesting code. [Yan]

v1: https://lore.kernel.org/all/20250111010409.1252942-1-seanjc@google.com

Sean Christopherson (6):
  KVM: Bound the number of dirty ring entries in a single reset at
    INT_MAX
  KVM: Bail from the dirty ring reset flow if a signal is pending
  KVM: Conditionally reschedule when resetting the dirty ring
  KVM: Check for empty mask of harvested dirty ring entries in caller
  KVM: Use mask of harvested dirty ring entries to coalesce dirty ring
    resets
  KVM: Assert that slots_lock is held when resetting per-vCPU dirty
    rings

 include/linux/kvm_dirty_ring.h |  18 ++----
 virt/kvm/dirty_ring.c          | 111 +++++++++++++++++++++++----------
 virt/kvm/kvm_main.c            |   9 ++-
 3 files changed, 89 insertions(+), 49 deletions(-)


base-commit: 7ef51a41466bc846ad794d505e2e34ff97157f7f
-- 
2.49.0.1112.g889b7c5bd8-goog

