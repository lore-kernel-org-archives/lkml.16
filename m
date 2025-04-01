Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA7020E718
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522559; cv=none; b=mdkhzdLo5dKdouZFLygmSPGQBgve++N3ZddzzYX47Kov1i+QLmcQJnxFYbLCE8uuyEGe3rxqqtqdrnh0lfkHSeXXQp8LV1eiCgPyn5Kbp4wy7AoYKo06oV1fvtER3QiDpCFWEOMGpyOsjA7qOXI4byD41Fi2uY8OApjcqOJYPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522559; c=relaxed/simple;
	bh=gLK58HHSD3/s9+5+CMqOiJMgocg0/qBgCo1ULcStcuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h4H5v9K6UuEFYKzg16oDh7Dm84jnI+1W5nHnce3kx9bQs37l9CbBNRVEsEm5s8/UYo5TZ8b4o2HzZ0vIhwqBGO7/QZUPFT9EhaN/oyq7dGg6VzDTuOFb7WtP0RzE4zk3JDmcBDF0iPbcZL9IE1LNCQLR7kG0nNvK6Y1BIKj+L0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XuZXeNoC; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XuZXeNoC"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-229668c8659so3283575ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743522557; x=1744127357; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=NEoKKraLkus5TSEUW8Vu6zSvk2yZjVwDVKYenBySZQo=;
        b=XuZXeNoCfaTQ9eqeARFWLaTlcWi1Fa5WDJBUDc06FWkCn+KB6/3sxTe8X0Nlq2NYCt
         EdjitEQtkHXzHyEVQMNMxpeuGJojXFddQ+LmmTiZgFZdyaEeoNIJ/A8mZu0Doc8IgXKL
         j4OrJ2iB8pK5kJJNE6HIVKgsaJcU4c2ljwEvsPHCAxsY3zxp5e5IrfkXfGQJp67DrXwD
         jgOXQxGj3KpL4XiS61UC3cAGW+Imbg0MoHrDxRLxiIdhYL6ConXV51UncSKsheIOMtx8
         OU25YjcZ8uK5jF5paGkmlznGjC7g05saOLEAzbXUnjy6eLzPM9Uzft1Ip2H7oEyJ9LQQ
         zmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522557; x=1744127357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEoKKraLkus5TSEUW8Vu6zSvk2yZjVwDVKYenBySZQo=;
        b=BOlmirOeWGsr3zBLp6eF0bM8yAeViw2EAEyCg5j7tTRgxLuBV8t45PnK+/KfLgrZ5Y
         AANO1+ce1zzEgwGZmZ6RpvXh3/eAYL1IV+BI/9dBXM6HRydCHqFBIka0sw5JCHcStOTj
         pS0N/jc2sQ3WsvvhZrbNlWMIdVGILGHQpcBYg1N0OhYnEElicELhuDCdMMN8l+KfInqX
         QAy3RQBv80vtb7yXU/0mEfioXKoLID9Q1ZeC1Gn2462CLSijq2oguHH3gYsPCbUPE2uI
         /Z10FzG8h4gOtkcq+jxY95sY1k7F6iIiKOTVDU7pmQ84VsbfKyU2n2sqj6Jqso0/lUcL
         qUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9khTBChivCOKjcjNV/uRmGUwruTOd5EY15gPQCSaR6PR6H/AwpCrCVRMg7uHpEUaKe2yBcIjAxa5pV/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8k/xe1T3xoq5s7jg6g4wHQdLS40m+UUaYBnB+PZla/DlsxT4
	JktqudqpTWQ8Ai14c1EyJXppTCwkHVVWyETb7RmlfybWdJCdIBUIvPKnUuqZu2CSRSkctXJeO9t
	uRQ==
X-Google-Smtp-Source: AGHT+IGbhkLRRFTUQ7bxiQyU2fg0e5+VIELmG5bgHhONmz/4t+jU7czIP6A4Q16LN9DgWQLrpb52LAhd85I=
X-Received: from pfbjw37.prod.google.com ([2002:a05:6a00:92a5:b0:736:6fb6:7fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce09:b0:224:10a2:cae1
 with SMTP id d9443c01a7336-2292f9df155mr209876235ad.37.1743522556908; Tue, 01
 Apr 2025 08:49:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 08:47:27 -0700
In-Reply-To: <20250401154727.835231-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401154727.835231-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401154727.835231-3-seanjc@google.com>
Subject: [PATCH 2/2] KVM: VMX: Use separate subclasses for PI wakeup lock to
 squash false positive
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Yan Zhao <yan.y.zhao@intel.com>

Use a separate subclass when acquiring KVM's per-CPU posted interrupts
wakeup lock in the scheduled out path, i.e. when adding a vCPU on the list
of vCPUs to wake, to workaround a false positive deadlock.

  Chain exists of:
   &p->pi_lock --> &rq->__lock --> &per_cpu(wakeup_vcpus_on_cpu_lock, cpu)

  Possible unsafe locking scenario:

        CPU0                CPU1
        ----                ----
   lock(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
                            lock(&rq->__lock);
                            lock(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
   lock(&p->pi_lock);

  *** DEADLOCK ***

In the wakeup handler, the callchain is *always*:

  sysvec_kvm_posted_intr_wakeup_ipi()
  |
  --> pi_wakeup_handler()
      |
      --> kvm_vcpu_wake_up()
          |
          --> try_to_wake_up(),

and the lock order is:

  &per_cpu(wakeup_vcpus_on_cpu_lock, cpu) --> &p->pi_lock.

For the schedule out path, the callchain is always (for all intents and
purposes; if the kernel is preemptible, kvm_sched_out() can be called from
something other than schedule(), but the beginning of the callchain will
be the same point in vcpu_block()):

  vcpu_block()
  |
  --> schedule()
      |
      --> kvm_sched_out()
          |
          --> vmx_vcpu_put()
              |
              --> vmx_vcpu_pi_put()
                  |
                  --> pi_enable_wakeup_handler()

and the lock order is:

  &rq->__lock --> &per_cpu(wakeup_vcpus_on_cpu_lock, cpu)

I.e. lockdep sees AB+BC ordering for schedule out, and CA ordering for
wakeup, and complains about the A=>C versus C=>A inversion.  In practice,
deadlock can't occur between schedule out and the wakeup handler as they
are mutually exclusive.  The entirely of the schedule out code that runs
with the problematic scheduler locks held, does so with IRQs disabled,
i.e. can't run concurrently with the wakeup handler.

Use a subclass instead disabling lockdep entirely, and tell lockdep that
both subclasses are being acquired when loading a vCPU, as the sched_out
and sched_in paths are NOT mutually exclusive, e.g.

      CPU 0                 CPU 1
  ---------------     ---------------
  vCPU0 sched_out
  vCPU1 sched_in
  vCPU1 sched_out      vCPU 0 sched_in

where vCPU0's sched_in may race with vCPU1's sched_out, on CPU 0's wakeup
list+lock.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 840d435229a8..51116fe69a50 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -31,6 +31,8 @@ static DEFINE_PER_CPU(struct list_head, wakeup_vcpus_on_cpu);
  */
 static DEFINE_PER_CPU(raw_spinlock_t, wakeup_vcpus_on_cpu_lock);
 
+#define PI_LOCK_SCHED_OUT SINGLE_DEPTH_NESTING
+
 static inline struct pi_desc *vcpu_to_pi_desc(struct kvm_vcpu *vcpu)
 {
 	return &(to_vmx(vcpu)->pi_desc);
@@ -89,9 +91,20 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 	 * current pCPU if the task was migrated.
 	 */
 	if (pi_desc->nv == POSTED_INTR_WAKEUP_VECTOR) {
-		raw_spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
+		raw_spinlock_t *spinlock = &per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu);
+
+		/*
+		 * In addition to taking the wakeup lock for the regular/IRQ
+		 * context, tell lockdep it is being taken for the "sched out"
+		 * context as well.  vCPU loads happens in task context, and
+		 * this is taking the lock of the *previous* CPU, i.e. can race
+		 * with both the scheduler and the wakeup handler.
+		 */
+		raw_spin_lock(spinlock);
+		spin_acquire(&spinlock->dep_map, PI_LOCK_SCHED_OUT, 0, _RET_IP_);
 		list_del(&vmx->pi_wakeup_list);
-		raw_spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
+		spin_release(&spinlock->dep_map, _RET_IP_);
+		raw_spin_unlock(spinlock);
 	}
 
 	dest = cpu_physical_id(cpu);
@@ -151,7 +164,20 @@ static void pi_enable_wakeup_handler(struct kvm_vcpu *vcpu)
 
 	lockdep_assert_irqs_disabled();
 
-	raw_spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
+	/*
+	 * Acquire the wakeup lock using the "sched out" context to workaround
+	 * a lockdep false positive.  When this is called, schedule() holds
+	 * various per-CPU scheduler locks.  When the wakeup handler runs, it
+	 * holds this CPU's wakeup lock while calling try_to_wake_up(), which
+	 * can eventually take the aforementioned scheduler locks, which causes
+	 * lockdep to assume there is deadlock.
+	 *
+	 * Deadlock can't actually occur because IRQs are disabled for the
+	 * entirety of the sched_out critical section, i.e. the wakeup handler
+	 * can't run while the scheduler locks are held.
+	 */
+	raw_spin_lock_nested(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu),
+			     PI_LOCK_SCHED_OUT);
 	list_add_tail(&vmx->pi_wakeup_list,
 		      &per_cpu(wakeup_vcpus_on_cpu, vcpu->cpu));
 	raw_spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
-- 
2.49.0.472.ge94155a9ec-goog

