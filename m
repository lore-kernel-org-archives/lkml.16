Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2AB22B5B7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751991; cv=none; b=tsDtygp7I/RrSGiZnKPo8lKV5OZOAFjkBwcDj2FHqbd4Q1HmcxWdOJG4ywDwuV3nBNGSsq5HM7Pd14AaAqJ7OfOww1kYbAoLMTPXWvN7zAM1cMF3N08Wie8ui+9BiO02oO40sLk20/Fy5//qdPLoMD4snhFphl65EwQJPPXGqCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751991; c=relaxed/simple;
	bh=lkioxytLyLOzlOCjq4kLo9WqwgcRQ4LKdz7AwPmGvks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QxB2cWmdCMqNbksDdczS8fRKUfmS3RX39/Wv430TTq/nQcvuHm8QVMs5Hg0UjjV7SBwlTQNdT2q8yFV+EFNLZ9nN+35wyEk1F5dHSnqtzxoby0Q9OHP90LD5xRYl6s+L6i3yD/dpwzYtb7t0PLWb5kPNC3PiNAwKPuCy6su2enI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EZIf0rR5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Oyk2ReUq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EZIf0rR5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Oyk2ReUq"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RC09dGl/tBzE6mq76ewmtaQViiiepnE+GfeDm6vi4MA=;
	b=EZIf0rR5GQRc3vs5DtYzAk+OMzsHVTsSFW34m2BZAp4igw5qgT6we4toMefjkUBmFmy4f5
	A56WN+O92BkDG9YcaLOGNLDxwwmvPEJms7w+d1LvPgPCAVv/sz/y1Ks4oP03hNsGYQh8OK
	vQGAIwfKV8vj7OD3bx2lz2xHYFwjl2RZJPQmFF7ObfGaoTWQQd46oSRxn2tZUNJ0+LiHSA
	N/0bBWdhk5MOrmNfcJ2b8dKY1He2yqICfc5FBLsjkuHbpfl1iu4cue1yZbwAG3jdFd0I9N
	eaxpbKK6kOjU3hh1lP7SOCy1jrJla8SilLPijl4fNoUCmEzEH69suO8/7DvKIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RC09dGl/tBzE6mq76ewmtaQViiiepnE+GfeDm6vi4MA=;
	b=Oyk2ReUq3iQZWuOshWMH2Db69B5KYKHchzBcWn7uweX8cjTYGSo4okdu8lQRZB9Od4U5jT
	8EOnRG2FzGLnQwBw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 05/31] KVM: arm64: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:49 +0100
Message-Id: <59f527713562ad491df7c216eeee0378e0eb2402.1738746821.git.namcao@linutronix.de>
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

Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/arm64/kvm/arch_timer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index d3d243366536..8b1fe7c47d65 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1099,8 +1099,7 @@ static void timer_context_init(struct kvm_vcpu *vcpu,=
 int timerid)
 	else
 		ctxt->offset.vm_offset =3D &kvm->arch.timer_data.poffset;
=20
-	hrtimer_init(&ctxt->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
-	ctxt->hrtimer.function =3D kvm_hrtimer_expire;
+	hrtimer_setup(&ctxt->hrtimer, kvm_hrtimer_expire, CLOCK_MONOTONIC, HRTIME=
R_MODE_ABS_HARD);
=20
 	switch (timerid) {
 	case TIMER_PTIMER:
@@ -1127,8 +1126,8 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
 		timer_set_offset(vcpu_ptimer(vcpu), 0);
 	}
=20
-	hrtimer_init(&timer->bg_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
-	timer->bg_timer.function =3D kvm_bg_timer_expire;
+	hrtimer_setup(&timer->bg_timer, kvm_bg_timer_expire, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_ABS_HARD);
 }
=20
 void kvm_timer_init_vm(struct kvm *kvm)
--=20
2.39.5

