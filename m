Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5901DD9AD
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220669; cv=none; b=iUlxRZ7fclCT+N+5tLdB7uM/nrKMSjhQjZIYcoZRLnXCFq4eb2aFLOUVjYRc6R6dFDyu5Rta/AXkfLUfSMDuU92+++ahgRPKrgQKwQ7EaZ9F1hiIkBoL7M5AmPQwofnE4huzNUiZn8Sf6ErIiqI8S9AeffmD779IYSEgJMNM7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220669; c=relaxed/simple;
	bh=hDXm/uhWEmdQBNQ8soMkU9ZN5LUg87/FOyGF0UA8V7I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cFVs3jDyaqgKndo/sRNcTA5p86PR9Ddszc3NhDaQwc0QKxm3UKmxfDAj1Cvo1G7dErDjF++ovW0otddJqCQN96ymGvmHJhHZfTvN7PqcAQxDT+Igl3+DIcbV4rEx0y7iIaNt2PeDlVZUP2QEA/YGtB56ISTz9n1BL5V4xBapPaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2hiw6wfh; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2hiw6wfh"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so2637938a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220667; x=1750825467; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o+4MhBpXw5c8zk/u/yk4K4au/XOsEIuLkOFNvyDX6c8=;
        b=2hiw6wfhgjD/KUDvnrRyt9gGydniTbj3q0yYDOuOiNYusGXtg7QYPvEI615J2t4ETT
         w40cM+iUdGHaUVVAEowLbS8S9YmKv9Jw7f5fvymBt94DOEZN3wi7YyosIpgH2XhDegYa
         8LXXVyWlL3CfUFCEuIGdsCeIgzHIIF6+4Pz/A3f+Z4gJI5+LeKucr6rLVJfO/leTIqSm
         rvaC5ZHtsiUxWdKuU8YSG03GLI8fH9FOPKuMujDwyM4j5A6ALtd1GummFjlPFXHjWpfr
         Mp2TfntCAOBZkNbE71F20dCobE0DSpzCwwbROuirwWAFTYo4LOxjfp+3InDsYeWgaMOQ
         9HRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220667; x=1750825467;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+4MhBpXw5c8zk/u/yk4K4au/XOsEIuLkOFNvyDX6c8=;
        b=NPNT+SQi/LI6hpN/3ZAYeCCYwVI1QaXQIn9JKRwnl+NT87EYcR9cO12YxRp8uDk+jr
         v8IKDKwvKVy6PktmKf0OH5cd1+sS3bUGx3eEZ14UuJmO2lO49fN/JMvibZ7dRt5QLy4U
         7iMxZVDWdkYWwIxvOURHbPUsonBPHYXx6VpQltdwipEf/9q+t0nMoV/MzkZNVlhGQDuM
         jLbohfORflfDH8BoWVd0bKgxgyvCgwtzrKLzkiv4/JYaEENiliH9HJBvXB+XpXnguvv7
         XBV2bV8HvLCRh7TyEKfxqw47p78GCc9Ri39CM1ancHR7PyJ0eEo7QQymU8AjuyRiH37n
         z4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8CL6KRZW4zaQvHAqp7FKz6kWMlKLXpKzwNkKqFF2DiIKGU7T/qlMilWmleEfv+8w4GLjAU/O6nXROqE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YysCaVER68wF4wiqaZSKp2/JnXEhcFr9Cxew9CY3AhmCutaAvXz
	E6i0/uv8lfZRQ9Sc1oHM0vzdYUMNjC1cBEnudNX9mWBGvEuUyajVirUdWCgBuNgCarlzYNqg4lu
	uddctjMWwUe6IvYaxvh5f2Q==
X-Google-Smtp-Source: AGHT+IHFJYTSQ+MOybbax7YIQAP8zvSWneLdYPGOi/sm7TwaiipF7EkJnEgPUroMKspYYgWLmDMNWsXPyfYM7Kzw
X-Received: from pjbta6.prod.google.com ([2002:a17:90b:4ec6:b0:312:4b0b:a94])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c8d:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-313f1d580e2mr27031305a91.17.1750220667431;
 Tue, 17 Jun 2025 21:24:27 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:09 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-1-jthoughton@google.com>
Subject: [PATCH v3 00/15] KVM: Introduce KVM Userfault
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Sean, Paolo, Oliver, + others,

Here is a v3 of KVM Userfault. Thanks for all the feedback on the v2,
Sean. I realize it has been 6 months since the v2; I hope that isn't an
issue.

I am working on the QEMU side of the changes as I get time. Let me know
if it's important for me to send those patches out for this series to be
merged.

Be aware that this series will have non-trivial conflicts with Fuad's
user mapping support for guest_memfd series[1]. For example, for the
arm64 change he is making, the newly introduced gmem_abort() would need
to be enlightened to handle KVM Userfault exits.

Changelog:
v2[2]->v3:
- Pull in Sean's changes to genericize struct kvm_page_fault and use it
  for arm64. Many of these patches now have Sean's SoB.
- Pull in Sean's small rename and squashing of the main patches.
- Add kvm_arch_userfault_enabled() in place of calling
  kvm_arch_flush_shadow_memslot() directly from generic code.
- Pull in Xin Li's documentation section number fix for
  KVM_CAP_ARM_WRITABLE_IMP_ID_REGS[3].
v1[4]->v2:
- For arm64, no longer zap stage 2 when disabling KVM_MEM_USERFAULT
  (thanks Oliver).
- Fix the userfault_bitmap validation and casts (thanks kernel test
  robot).
- Fix _Atomic cast for the userfault bitmap in the selftest (thanks
  kernel test robot).
- Pick up Reviewed-by on doc changes (thanks Bagas).

Below is the cover letter from v1, mostly unchanged:

Please see the RFC[5] for the problem description. In summary,
guest_memfd VMs have no mechanism for doing post-copy live migration.
KVM Userfault provides such a mechanism.

There is a second problem that KVM Userfault solves: userfaultfd-based
post-copy doesn't scale very well. KVM Userfault when used with
userfaultfd can scale much better in the common case that most post-copy
demand fetches are a result of vCPU access violations. This is a
continuation of the solution Anish was working on[6]. This aspect of
KVM Userfault is important for userfaultfd-based live migration when
scaling up to hundreds of vCPUs with ~30us network latency for a
PAGE_SIZE demand-fetch.

The implementation in this series is version than the RFC[5]. It adds...
 1. a new memslot flag is added: KVM_MEM_USERFAULT,
 2. a new parameter, userfault_bitmap, into struct kvm_memory_slot,
 3. a new KVM_RUN exit reason: KVM_MEMORY_EXIT_FLAG_USERFAULT,
 4. a new KVM capability KVM_CAP_USERFAULT.

KVM Userfault does not attempt to catch KVM's own accesses to guest
memory. That is left up to userfaultfd.

When enabling KVM_MEM_USERFAULT for a memslot, the second-stage mappings
are zapped, and new faults will check `userfault_bitmap` to see if the
fault should exit to userspace.

When KVM_MEM_USERFAULT is enabled, only PAGE_SIZE mappings are
permitted.

When disabling KVM_MEM_USERFAULT, huge mappings will be reconstructed
consistent with dirty log disabling. So on x86, huge mappings will be
reconstructed, but on arm64, they won't be.

KVM Userfault is not compatible with async page faults. Nikita has
proposed a new implementation of async page faults that is more
userspace-driven that *is* compatible with KVM Userfault[7].

See v1 for more performance details[4]. They are unchanged in this
version.

This series is based on the latest kvm-x86/next.

[1]: https://lore.kernel.org/kvm/20250611133330.1514028-1-tabba@google.com/
[2]: https://lore.kernel.org/kvm/20250109204929.1106563-1-jthoughton@google.com/
[3]: https://lore.kernel.org/kvm/20250414165146.2279450-1-xin@zytor.com/
[4]: https://lore.kernel.org/kvm/20241204191349.1730936-1-jthoughton@google.com/
[5]: https://lore.kernel.org/kvm/20240710234222.2333120-1-jthoughton@google.com/
[6]: https://lore.kernel.org/all/20240215235405.368539-1-amoorthy@google.com/
[7]: https://lore.kernel.org/kvm/20241118123948.4796-1-kalyazin@amazon.com/#t

James Houghton (11):
  KVM: Add common infrastructure for KVM Userfaults
  KVM: x86: Add support for KVM userfault exits
  KVM: arm64: Add support for KVM userfault exits
  KVM: Enable and advertise support for KVM userfault exits
  KVM: selftests: Fix vm_mem_region_set_flags docstring
  KVM: selftests: Fix prefault_mem logic
  KVM: selftests: Add va_start/end into uffd_desc
  KVM: selftests: Add KVM Userfault mode to demand_paging_test
  KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
  KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd toggle tests
  KVM: Documentation: Add KVM_CAP_USERFAULT and KVM_MEM_USERFAULT
    details

Sean Christopherson (3):
  KVM: x86/mmu: Move "struct kvm_page_fault" definition to
    asm/kvm_host.h
  KVM: arm64: Add "struct kvm_page_fault" to gather common fault
    variables
  KVM: arm64: x86: Require "struct kvm_page_fault" for memory fault
    exits

Xin Li (Intel) (1):
  KVM: Documentation: Fix section number for
    KVM_CAP_ARM_WRITABLE_IMP_ID_REGS

 Documentation/virt/kvm/api.rst                |  35 ++++-
 arch/arm64/include/asm/kvm_host.h             |   9 ++
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          |  48 +++---
 arch/x86/include/asm/kvm_host.h               |  68 +++++++-
 arch/x86/kvm/Kconfig                          |   1 +
 arch/x86/kvm/mmu/mmu.c                        |  13 +-
 arch/x86/kvm/mmu/mmu_internal.h               |  77 +---------
 arch/x86/kvm/x86.c                            |  27 ++--
 include/linux/kvm_host.h                      |  49 +++++-
 include/uapi/linux/kvm.h                      |   6 +-
 .../selftests/kvm/demand_paging_test.c        | 145 ++++++++++++++++--
 .../testing/selftests/kvm/include/kvm_util.h  |   5 +
 .../selftests/kvm/include/userfaultfd_util.h  |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  42 ++++-
 .../selftests/kvm/lib/userfaultfd_util.c      |   2 +
 .../selftests/kvm/set_memory_region_test.c    |  33 ++++
 virt/kvm/Kconfig                              |   3 +
 virt/kvm/kvm_main.c                           |  57 ++++++-
 19 files changed, 489 insertions(+), 134 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.50.0.rc2.692.g299adb8693-goog

