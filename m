Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD39217664
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751991; cv=none; b=LFv/RAsXmrs+9McjTBRxNH482MPlNxue+aaIZxOs4Ab5y8T/0m9wS+wlxBCLLHiLQVurDAXLuZbrw9LMLbbTtjaswDqQYMQkxntb6VjFJaA5DHxXZSmThh/MZv9DH1eZlUTHRhM4NkIUYpB9XZTOa5Qdd9FP5+c3IQR5DAvQoEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751991; c=relaxed/simple;
	bh=0AlWFP+L6K9qFIBSCkQqCidKBd0B2mYor6Zzb97lT9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/Ab9vHSfnpeA/Mg7mt0zQ5OZdqPvFMtNOp1yr5MpTHccZ0WJb5eUc3PKzFAjgxOZlzwSjuV6j7aJSSVHqSJRy2hswyfrw23z7OsHTJHMYPFFoC27sdFSkHUDH//Td6V9u0WsELsv/ayvm3n8W7qf9yCbTIuFBlvituy4B+Z9Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dWvggchz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6JZrjuZw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dWvggchz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6JZrjuZw"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+ndonM9L8AOxEJ72Lht6K6TGb2Ee1D0iIWQ1eJaHvY=;
	b=dWvggchzxN1++UwiCAQx/eoqKi38f8Bs0YZw2mM/a3+0D15vpiD49iWF+PiE38YeyU9CLn
	0Diaf/bhJK97jCRXZ1PSnjsJ8h0oUuEnt6D4iFrxtdHbbgUCevzrxGaUA2W92KMQJjMQSU
	OebF2+mmY9Uxn/3XT4mBuYsi15sBfmF5g2kiq20cbNrob7akz7ci/9PlchUScbAjH49NXM
	Yq7kEKlhiXRPv+mGW3broypCgxAZbkglhF3gEGyDBtOTnvr5WGIHujMTczqOWIkiv8nP05
	PDhWSgDOgCOJK1khZ+CcoeJ8ye2gWs4VYDuRDEXL/yH92VWJq64+nKo6rJ0hgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+ndonM9L8AOxEJ72Lht6K6TGb2Ee1D0iIWQ1eJaHvY=;
	b=6JZrjuZwl6t1w4coKqVRAtTjelBHxVPgNZSDvFLQzMPKvMvYj9gsRGVrNsSAyHZvfrDInX
	NC3/YcNUlNzSaKAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 02/31] KVM: PPC: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:46 +0100
Message-Id: <a58c4f16b1cfba13f96201fda355553850a97562.1738746821.git.namcao@linutronix.de>
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
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/powerpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index ce1d91eed231..61f2b7e007fa 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -766,8 +766,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 {
 	int err;
=20
-	hrtimer_init(&vcpu->arch.dec_timer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
-	vcpu->arch.dec_timer.function =3D kvmppc_decrementer_wakeup;
+	hrtimer_setup(&vcpu->arch.dec_timer, kvmppc_decrementer_wakeup, CLOCK_REA=
LTIME,
+		      HRTIMER_MODE_ABS);
=20
 #ifdef CONFIG_KVM_EXIT_TIMING
 	mutex_init(&vcpu->arch.exit_timing_lock);
--=20
2.39.5

