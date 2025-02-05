Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D7222B5B6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751991; cv=none; b=k5ovDmvltiQ2m7dE9mG0nLJDxbkUBGjXpfwapEL3IIrJFHZfh/GjnTspFZeAKl8pqc4Nkm2oByujl6/AVfQKUFawHhhzZcyRa9n/0AayIRqNvayll9mJ78DoS/0d/HiRnisW0GmErhnmj0Uhrh2E/hotkPrA66CJV7nwkC5/qnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751991; c=relaxed/simple;
	bh=3SYRiNPmD3AWAyLMn2jU8DUNoACNnbgUi7Du+dwGfLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jDFwC43tLqVkabMtd0Mncj2ISA0uHeMab32oK5eHPYKOwR6vi87n8rbOq36PI7iCYv/2EJZkmHvwpKvKyPLBGHuseTdTPgJVcOPXh+R+KjvLkemyMu8zXEieLk4EgZR27w+iGzf61gxjYeBdm7CsK21wJwifZeOMdex+CsertDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WH3u3XQY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jfCkVTIN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WH3u3XQY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jfCkVTIN"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6aA5E3hNvEyqXjv+c2XoHGMcpM8KXV2NF/MaI1lk+8=;
	b=WH3u3XQYKplN1FC9PWlcgaIxAY1+ZlWFCHai++z9WVsiQg8QUZa9QmWeojMiM04IKKi4VC
	Z7v4pF9YXxnqwBbZcPxOTiZqI6ZYLEYfNTman5vekAgzo3qpNdc7AvUjIVLdPWYnzMrq0f
	mYcGe/TvDdcCwXT/XnyEAu57k28gJ+6AANMVNG+8nRBwxP9/4rkwsuMsI0lYjsdKu7YYFV
	e9Vc2mcofKZXNubL8DvAeLqw1NYm6V482pvm5/H7afVfhV90PUVn4XnXnCNovfbJFaC/WZ
	38HC7eEbyqmh/zFPOgNUs0DSntuSw6UPV7kjM3k18tL2IVP4ToITcBcpqgjI7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6aA5E3hNvEyqXjv+c2XoHGMcpM8KXV2NF/MaI1lk+8=;
	b=jfCkVTINVATvzz1JI9+icuzPcCoQXAnOog1NdyvYreH3evyrbVzH/rKUYF0ETF1I0w7POt
	w/IeIxciL/FR6vDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH v2 04/31] KVM: x86: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:48 +0100
Message-Id: <5051cfe7ed48ef9913bf2583eeca6795cb53d6ae.1738746821.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/hyperv.c     | 3 +--
 arch/x86/kvm/i8254.c      | 3 +--
 arch/x86/kvm/lapic.c      | 5 ++---
 arch/x86/kvm/vmx/nested.c | 5 ++---
 arch/x86/kvm/xen.c        | 4 ++--
 5 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 6a6dd5a84f22..eb9bca66bad0 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -952,8 +952,7 @@ static void stimer_init(struct kvm_vcpu_hv_stimer *stim=
er, int timer_index)
 {
 	memset(stimer, 0, sizeof(*stimer));
 	stimer->index =3D timer_index;
-	hrtimer_init(&stimer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	stimer->timer.function =3D stimer_timer_callback;
+	hrtimer_setup(&stimer->timer, stimer_timer_callback, CLOCK_MONOTONIC, HRT=
IMER_MODE_ABS);
 	stimer_prepare_msg(stimer);
 }
=20
diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index d7ab8780ab9e..739aa6c0d0c3 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -690,8 +690,7 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32 fla=
gs)
 	pit->kvm =3D kvm;
=20
 	pit_state =3D &pit->pit_state;
-	hrtimer_init(&pit_state->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	pit_state->timer.function =3D pit_timer_fn;
+	hrtimer_setup(&pit_state->timer, pit_timer_fn, CLOCK_MONOTONIC, HRTIMER_M=
ODE_ABS);
=20
 	pit_state->irq_ack_notifier.gsi =3D 0;
 	pit_state->irq_ack_notifier.irq_acked =3D kvm_pit_ack_irq;
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index a009c94c26c2..eb56cd989574 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2921,9 +2921,8 @@ int kvm_create_lapic(struct kvm_vcpu *vcpu)
=20
 	apic->nr_lvt_entries =3D kvm_apic_calc_nr_lvt_entries(vcpu);
=20
-	hrtimer_init(&apic->lapic_timer.timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_ABS_HARD);
-	apic->lapic_timer.timer.function =3D apic_timer_fn;
+	hrtimer_setup(&apic->lapic_timer.timer, apic_timer_fn, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_ABS_HARD);
 	if (lapic_timer_advance)
 		apic->lapic_timer.timer_advance_ns =3D LAPIC_TIMER_ADVANCE_NS_INIT;
=20
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 8a7af02d466e..ca18c3eec76d 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5316,9 +5316,8 @@ static int enter_vmx_operation(struct kvm_vcpu *vcpu)
 	if (enable_shadow_vmcs && !alloc_shadow_vmcs(vcpu))
 		goto out_shadow_vmcs;
=20
-	hrtimer_init(&vmx->nested.preemption_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_ABS_PINNED);
-	vmx->nested.preemption_timer.function =3D vmx_preemption_timer_fn;
+	hrtimer_setup(&vmx->nested.preemption_timer, vmx_preemption_timer_fn, CLO=
CK_MONOTONIC,
+		      HRTIMER_MODE_ABS_PINNED);
=20
 	vmx->nested.vpid02 =3D allocate_vpid();
=20
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index a909b817b9c0..1ac738dcf7a2 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -2225,8 +2225,8 @@ void kvm_xen_init_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.xen.poll_evtchn =3D 0;
=20
 	timer_setup(&vcpu->arch.xen.poll_timer, cancel_evtchn_poll, 0);
-	hrtimer_init(&vcpu->arch.xen.timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HAR=
D);
-	vcpu->arch.xen.timer.function =3D xen_timer_callback;
+	hrtimer_setup(&vcpu->arch.xen.timer, xen_timer_callback, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_ABS_HARD);
=20
 	kvm_gpc_init(&vcpu->arch.xen.runstate_cache, vcpu->kvm);
 	kvm_gpc_init(&vcpu->arch.xen.runstate2_cache, vcpu->kvm);
--=20
2.39.5

