Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D2A22ACD6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751992; cv=none; b=tp8M+o92AjuZuau0rFBwUvVum9Rp43cE5K5MT/yIRK//ZH1MIZnxRsitCblWr1UFwZFQTRbU2FwAYEKuvEteR0uiB0uU9MJ2ZMmBiLDGVBAU5dqNmVu6Zbp8FlFdnpqTQiXPCr/48NWOkV57BCMwLN8rbANaP/nlsoC2+aYZEp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751992; c=relaxed/simple;
	bh=sCZ6I4Qi6WTLwAq9rmMOuKNKx7qQHIUNw2SqagyKnJo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=re76FhwmgFQ8l1DGN7HdN52ks29s0xpwtdRkI717i3GQzG94GXyere2uxwYRxaHxT96q92qTnuRAdfx4nXUb4RqCs/dr9zhH/nGqMBqt5jQ83iEhHygrJklHqv+SeCLOYbXIAmsKPs2C9UT6GSqHC4K21uUfmKgklmWG6U0OqEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cNGxS1k1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZkxQvHMs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cNGxS1k1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZkxQvHMs"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bh36yyrgh2CvM85DSHJ1cdFb/MUta87+n929i888dTw=;
	b=cNGxS1k1DrhblODHunFopuW5qbx2jSAs+9ZA9YK8UtS57SJjWn2n3+3/y5/YJiaFLgZfm2
	e9zNMClwyM5pN+Z97vW2QxGQ8+nJsQUGH3CXBeCJwdrYDQyuZZHbCRQJWyTJnMX4Z62CJ5
	NaRTMy3dZfsfgckskFa9OnYbOUgRHsUv7jlhRQh2wOvdo0ZjnLy2/dXdZdKeN8jXYWow1C
	S6LHiHXgSco4gPImGVryANGBtKOlzt2Y1bqYDvTmnzk0rQr0meH+zQRx02hfqQodJob4j7
	sn3+HiowMc4foKzjde6dxhyZgXHPZhsD6dBhpjzF8ZvMcEvCRnHaNaehjkB6iQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bh36yyrgh2CvM85DSHJ1cdFb/MUta87+n929i888dTw=;
	b=ZkxQvHMsw+qHvLNKUx/kn9HeMsOcrGJpvbyXdZOQlPoipBnmRQWRoErT1wQTlT0khDEvsL
	DwOIAHkm/mVatSCA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v2 03/31] KVM: s390: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:47 +0100
Message-Id: <637865c62963fb8cddf6c4368ca12434988a8c27.1738746821.git.namcao@linutronix.de>
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
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
---
 arch/s390/kvm/interrupt.c | 3 +--
 arch/s390/kvm/kvm-s390.c  | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index d4f031e086fc..11a33fa21dfd 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -3171,8 +3171,7 @@ void kvm_s390_gisa_init(struct kvm *kvm)
 	gi->alert.mask =3D 0;
 	spin_lock_init(&gi->alert.ref_lock);
 	gi->expires =3D 50 * 1000; /* 50 usec */
-	hrtimer_init(&gi->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	gi->timer.function =3D gisa_vcpu_kicker;
+	hrtimer_setup(&gi->timer, gisa_vcpu_kicker, CLOCK_MONOTONIC, HRTIMER_MODE=
_REL);
 	memset(gi->origin, 0, sizeof(struct kvm_s390_gisa));
 	gi->origin->next_alert =3D (u32)virt_to_phys(gi->origin);
 	VM_EVENT(kvm, 3, "gisa 0x%pK initialized", gi->origin);
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index d8080c27d45b..a0ef902c7a3d 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -3930,8 +3930,8 @@ static int kvm_s390_vcpu_setup(struct kvm_vcpu *vcpu)
 		if (rc)
 			return rc;
 	}
-	hrtimer_init(&vcpu->arch.ckc_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	vcpu->arch.ckc_timer.function =3D kvm_s390_idle_wakeup;
+	hrtimer_setup(&vcpu->arch.ckc_timer, kvm_s390_idle_wakeup, CLOCK_MONOTONI=
C,
+		      HRTIMER_MODE_REL);
=20
 	vcpu->arch.sie_block->hpid =3D HPID_KVM;
=20
--=20
2.39.5

