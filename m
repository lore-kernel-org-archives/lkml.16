Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA222B5B2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751990; cv=none; b=tZXhGHOne5whnh1BcpFaQt0urK7F6YBG6HVl3JAbzFK+vDcsJD3vQaFjJMtel2hW7uIdPjCJ/8k1vM2U6+uHTsPfbev3/A8cm3YCImCEGq3ZwMJFgYV5BNm1BfeLVwLZMijkqEgNyrfyyuk9s+03RwywAKumRJGqP/Re8GFi2Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751990; c=relaxed/simple;
	bh=PI6SlgGHXumEGQioc2qYh37cEpy3enZH8/Xqp8isHN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hr7SWbKVklkm/LVXjwkzVQ4tTYx+Jzq9M2vUUe7DcoqVT0qzXLv5FxeIhW43IMVEnb+YZCiecmmFHZEkPJxdmIOkeS8GaNv7CqcOfrblZpnjg1RIZTPALrKFjfNoyG8ELZZxeGaUiIhZQmcnVKdbDUBZBpZc206orolIstx/8EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IrFIuli7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8JBr2HBp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IrFIuli7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8JBr2HBp"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZNTRP4aCpWMyie9jqscX4bbK//gd9aCHPJa4jd+gz0=;
	b=IrFIuli7jJ6jOIaYbf9StyM+k+8GW4BlJvS/CCAl/iMzRGCSUq6q+N8TsyIbvynu0VSOR5
	m7bbkbPC6t9i2i9thwoAJ5oGDlKKiMlPWvVCUZ14KaMfB177YrNhLS+bQhK1PTULBPiqww
	6ZhtV2xLYYFJELKSBtg42Vp3iGYHnVVPNzNsUJfeZRUe/aRYFdYB5U7Ntt6cL+MicfZ6us
	avd0dSFrufBhwXvCCdGgfsgYkgzjR/qXK1hIYf27QZWg0XUKnF6BtvJfUmujk+I4tmXF89
	HUVL82mHPiTsPa0Zwhc6lqP6lBL6Jof2jdNsMNsaRO4EC5LHnYN4IIN32i5ZTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZNTRP4aCpWMyie9jqscX4bbK//gd9aCHPJa4jd+gz0=;
	b=8JBr2HBpWwDNGIcJJPzgCcVzfCkR5XfibwEE3BkEYWD0ZGHQI2wZJ9CSkjk+l+wvluQcz+
	H1RCof6ob9aP9vBQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v2 01/31] KVM: MIPS: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:45 +0100
Message-Id: <34004267eba24388fb50ef6de1b8dd7addba6475.1738746821.git.namcao@linutronix.de>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kvm/mips.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 60b43ea85c12..cef3c423a41a 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -288,9 +288,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (err)
 		return err;
=20
-	hrtimer_init(&vcpu->arch.comparecount_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
-	vcpu->arch.comparecount_timer.function =3D kvm_mips_comparecount_wakeup;
+	hrtimer_setup(&vcpu->arch.comparecount_timer, kvm_mips_comparecount_wakeu=
p, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
 	/*
 	 * Allocate space for host mode exception handlers that handle
--=20
2.39.5

