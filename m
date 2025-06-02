Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DC6252903
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748904309; cv=none; b=X5hGcpXM9QRRQtWV+xG6FYQ5tl5AgTY9m/gZkUgmmpzBXlK/yL/5qwR2tvUPY+eidVodCIOBP+Hpb7oFf27b8Lf/RjaOupnY91ZxNN0K8DxHWk11pWtxXL/k4rJPCcqMeBk8Xg5fAQTSsXhN9CEc67njub5eQztUSTWso7Y+/tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748904309; c=relaxed/simple;
	bh=cHJ+n8+ixzML87cQwRjrwn9HWLqbtUUZBNZACj+qBTA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SCqRq3OGG9kLQl+M6SeDCb0wbnGg7wq2CuDZZNI53Rn85/Mk/xM7ynGGIsCB+sfqSv4iJncORiKUe78dhMK7WWOWOxlU4gdHZpPUsBRU3eNYLlW2+kZtW+YKzJIzuPo6lSkrMWHwyZNec/hYSI7h78nyX1x0t2MI7v/w4VlkIfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fldt5TQv; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fldt5TQv"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2349498f00eso44260345ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748904305; x=1749509105; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=es5D/XIQXmP5Ejw8maAr25agbXq6WSuGhw7Rb+o7DrM=;
        b=Fldt5TQvn4GA+GzOqyovaT6IzuEw4G5USUwfN29fhP/cwUARAhTDvcJSoUQ4A5dbtO
         Aj2ivS6zoJp3+wpKM/uD/PvioGdQA/Zaz2MBhkU+HaaWIGXNw8TVHOPLD9kn8Fz5u5Qr
         VkXCydonxDQ/akHFcVwyP/6NUDAeE5UCSqrk08ITXdE+1/o+oISpS4zO0QQordPpko5w
         Nfq3RkPJQNeTCftCRUhMILB+GOrzp8xyy+YGawILyNHHQqIzKAbwGNJPxVMxIXWbyHN4
         cQIzxjZN9GBL3eEErmYiXcL54GJbgXPzCgpuFjqLnx8eQZitH7i94GDOAqGVCvNbgLCP
         JQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748904305; x=1749509105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=es5D/XIQXmP5Ejw8maAr25agbXq6WSuGhw7Rb+o7DrM=;
        b=S53gBGnU32+INZ591XxAFRLw5C6UfohLg/eF+rnPtC5KC56tHKPznqFHWvcHM8LWK6
         jT3u8J8vfIIjq43SEgr2i/HAVUN2ZsQoCVZZoOk6znch6ZFIFMGX9Zgzl4whiDsXfYYs
         lXN9U3K3y6zCME7D4H8rr1vX9aHO13zPvuuTqK3InMLswEf1efFDKEGiBPJz858ywdBv
         a4oqW8ahdNMEqXlivUA1ap10+UFzU39VBWdsJ6hlpzgAek1LGAW0+bZJkC/P/aZpKNPH
         TKoFbY/sUMyhfWgIqlE4gu1ELL99cFaL2Pbkz73VaYP1lXEtvXr/aFrbZhxC+HYJuHM/
         HoYw==
X-Forwarded-Encrypted: i=1; AJvYcCXjyza/DPD5QlrwDrLaIYaZdp/lQtDtpw9o3wHHyiVU/5dSbTITL0d7uWTKEgX2oBvs4/bMAHCJFqXVfVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxSmCpYxFe8Gm6R9bs0aASveJo0+PQxkr2yRmSp29dG1mZm6cv
	AwlPlWMqNonFiRCm3BHRmARkdfCkW+u3aA7sC2qDK0sryHsFCFFrwN3pz24TUZQQ/16/Zs1gZba
	zA2czWA==
X-Google-Smtp-Source: AGHT+IE5DKMTZ/Y1JF/S+V7Q6g/TvZjqYCJtT/RyfdfuMTJoNC4s3Q+8zpU/RDdVs0vFu6gjt1uFaFkf04U=
X-Received: from ploz16.prod.google.com ([2002:a17:902:8f90:b0:234:aa6d:999d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74a:b0:215:ba2b:cd55
 with SMTP id d9443c01a7336-235c9d68357mr3835205ad.2.1748904304932; Mon, 02
 Jun 2025 15:45:04 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon,  2 Jun 2025 15:44:58 -0700
In-Reply-To: <20250602224459.41505-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602224459.41505-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602224459.41505-2-seanjc@google.com>
Subject: [PATCH 1/2] KVM: SVM: Reject SEV{-ES} intra host migration if vCPU
 creation is in-flight
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, James Houghton <jthoughton@google.com>, 
	Peter Gonda <pgonda@google.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Reject migration of SEV{-ES} state if either the source or destination VM
is actively creating a vCPU, i.e. if kvm_vm_ioctl_create_vcpu() is in the
section between incrementing created_vcpus and online_vcpus.  The bulk of
vCPU creation runs _outside_ of kvm->lock to allow creating multiple vCPUs
in parallel, and so sev_info.es_active can get toggled from false=>true in
the destination VM after (or during) svm_vcpu_create(), resulting in an
SEV{-ES} VM effectively having a non-SEV{-ES} vCPU.

The issue manifests most visibly as a crash when trying to free a vCPU's
NULL VMSA page in an SEV-ES VM, but any number of things can go wrong.

  BUG: unable to handle page fault for address: ffffebde00000000
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
  CPU: 227 UID: 0 PID: 64063 Comm: syz.5.60023 Tainted: G     U     O        6.15.0-smp-DEV #2 NONE
  Tainted: [U]=USER, [O]=OOT_MODULE
  Hardware name: Google, Inc. Arcadia_IT_80/Arcadia_IT_80, BIOS 12.52.0-0 10/28/2024
  RIP: 0010:constant_test_bit arch/x86/include/asm/bitops.h:206 [inline]
  RIP: 0010:arch_test_bit arch/x86/include/asm/bitops.h:238 [inline]
  RIP: 0010:_test_bit include/asm-generic/bitops/instrumented-non-atomic.h:142 [inline]
  RIP: 0010:PageHead include/linux/page-flags.h:866 [inline]
  RIP: 0010:___free_pages+0x3e/0x120 mm/page_alloc.c:5067
  Code: <49> f7 06 40 00 00 00 75 05 45 31 ff eb 0c 66 90 4c 89 f0 4c 39 f0
  RSP: 0018:ffff8984551978d0 EFLAGS: 00010246
  RAX: 0000777f80000001 RBX: 0000000000000000 RCX: ffffffff918aeb98
  RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffebde00000000
  RBP: 0000000000000000 R08: ffffebde00000007 R09: 1ffffd7bc0000000
  R10: dffffc0000000000 R11: fffff97bc0000001 R12: dffffc0000000000
  R13: ffff8983e19751a8 R14: ffffebde00000000 R15: 1ffffd7bc0000000
  FS:  0000000000000000(0000) GS:ffff89ee661d3000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: ffffebde00000000 CR3: 000000793ceaa000 CR4: 0000000000350ef0
  DR0: 0000000000000000 DR1: 0000000000000b5f DR2: 0000000000000000
  DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
  Call Trace:
   <TASK>
   sev_free_vcpu+0x413/0x630 arch/x86/kvm/svm/sev.c:3169
   svm_vcpu_free+0x13a/0x2a0 arch/x86/kvm/svm/svm.c:1515
   kvm_arch_vcpu_destroy+0x6a/0x1d0 arch/x86/kvm/x86.c:12396
   kvm_vcpu_destroy virt/kvm/kvm_main.c:470 [inline]
   kvm_destroy_vcpus+0xd1/0x300 virt/kvm/kvm_main.c:490
   kvm_arch_destroy_vm+0x636/0x820 arch/x86/kvm/x86.c:12895
   kvm_put_kvm+0xb8e/0xfb0 virt/kvm/kvm_main.c:1310
   kvm_vm_release+0x48/0x60 virt/kvm/kvm_main.c:1369
   __fput+0x3e4/0x9e0 fs/file_table.c:465
   task_work_run+0x1a9/0x220 kernel/task_work.c:227
   exit_task_work include/linux/task_work.h:40 [inline]
   do_exit+0x7f0/0x25b0 kernel/exit.c:953
   do_group_exit+0x203/0x2d0 kernel/exit.c:1102
   get_signal+0x1357/0x1480 kernel/signal.c:3034
   arch_do_signal_or_restart+0x40/0x690 arch/x86/kernel/signal.c:337
   exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
   exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
   __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
   syscall_exit_to_user_mode+0x67/0xb0 kernel/entry/common.c:218
   do_syscall_64+0x7c/0x150 arch/x86/entry/syscall_64.c:100
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
  RIP: 0033:0x7f87a898e969
   </TASK>
  Modules linked in: gq(O)
  gsmi: Log Shutdown Reason 0x03
  CR2: ffffebde00000000
  ---[ end trace 0000000000000000 ]---

Deliberately don't check for a NULL VMSA when freeing the vCPU, as crashing
the host is likely desirable due to the VMSA being consumed by hardware.
E.g. if KVM manages to allow VMRUN on the vCPU, hardware may read/write a
bogus VMSA page.  Accessing PFN 0 is "fine"-ish now that it's sequestered
away thanks to L1TF, but panicking in this scenario is preferable to
potentially running with corrupted state.

Reported-by: Alexander Potapenko <glider@google.com>
Tested-by: Alexander Potapenko <glider@google.com>
Fixes: 0b020f5af092 ("KVM: SEV: Add support for SEV-ES intra host migration")
Fixes: b56639318bb2 ("KVM: SEV: Add support for SEV intra host migration")
Cc: stable@vger.kernel.org
Cc: James Houghton <jthoughton@google.com>
Cc: Peter Gonda <pgonda@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a7a7dc507336..93d899454535 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2032,6 +2032,10 @@ static int sev_check_source_vcpus(struct kvm *dst, struct kvm *src)
 	struct kvm_vcpu *src_vcpu;
 	unsigned long i;
 
+	if (src->created_vcpus != atomic_read(&src->online_vcpus) ||
+	    dst->created_vcpus != atomic_read(&dst->online_vcpus))
+		return -EINVAL;
+
 	if (!sev_es_guest(src))
 		return 0;
 
-- 
2.49.0.1204.g71687c7c1d-goog

