Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7066322C322
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751994; cv=none; b=BA/qHenzjw6rmkIf3eiugzXGB9j5ybvmHTjGnV5nih9Q0sC3uOv2lIZJ8K3RVoL+Qr7MC6dhp5drcI34+zGImctoCTKIRwGZf9JHJ/EeT+qVidwVzLZJHLkOdbaG0gZj+CbqO2RlDyYl4i/4cMopfy66+JVxzxjUSTw6ajL7nm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751994; c=relaxed/simple;
	bh=QIjdMhcXk3AaGSA9sCIuVEGRfUQxMwVR2twfx4ZqNE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=terKTVp6TR4DqtC/2HkKFsPvb5q5uQ7Z5WMkXiMrNbiRO30WnJeVf+5npaAQ6JBsHhpRnh8YzbRfpQGsvAPFPyha2ayFTHFEfrqtv+0gP/wQ/HODJH3ARYuTgitbhe2+LwDw0x1DUtpkK8+bq60zDYEdhhrJR5nxLZeJb/JVjFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j28ENCQ+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3Vcu4tnp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j28ENCQ+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3Vcu4tnp"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hloyeZK4o5RiVLme0GnbUDPJugjcXUmSipRi2u6gpRQ=;
	b=j28ENCQ+lx8d07J/jh7+2sxgs3iFFWlLrPXpuXPFcgj4FXF6rb1SMdVeKmcV2TqakhQQTG
	s3Z7xDF9Fet4rJzMEgxPjPd/P2w7o2taDJCcX0dchNyZ39eS7xCPIFLw1IcAqPvrowi6is
	pT4XhbE6o5YtFDI2hu4TyMqyYZP5d6exOdLg+Mf1kne5aA0tpaA3BDFnSUO++v7gsm5/ZM
	wHMFgteWlRSL1OOv+nQQlNogrXDt5WyfntLUea8MuTGcejls3E4Q/kQkeHtQqJrAtdRDTA
	8202uvliWLzEo4yXtwDi97e4Kr2iwN3hyzuv6bpmtIOg9Mdn9p4TZUUPexR2dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hloyeZK4o5RiVLme0GnbUDPJugjcXUmSipRi2u6gpRQ=;
	b=3Vcu4tnp8UL3xCb2LVl2mMqVFNyB0UuuFl3il+23M51Yn7Ns3AJSE0odr/JoPVJWAqJgBG
	lb75o7bWfguO7VDw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v2 06/31] LoongArch: KVM: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:50 +0100
Message-Id: <a5b1b53813a15a73afdfff6fbb4c9064fa582be1.1738746821.git.namcao@linutronix.de>
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
Cc: Huacai Chen <chenhuacai@kernel.org>
---
 arch/loongarch/kvm/vcpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index fb72095c8077..e721127c614e 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1459,8 +1459,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.vpid =3D 0;
 	vcpu->arch.flush_gpa =3D INVALID_GPA;
=20
-	hrtimer_init(&vcpu->arch.swtimer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_PINNE=
D_HARD);
-	vcpu->arch.swtimer.function =3D kvm_swtimer_wakeup;
+	hrtimer_setup(&vcpu->arch.swtimer, kvm_swtimer_wakeup, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_ABS_PINNED_HARD);
=20
 	vcpu->arch.handle_exit =3D kvm_handle_exit;
 	vcpu->arch.guest_eentry =3D (unsigned long)kvm_loongarch_ops->exc_entry;
--=20
2.39.5

