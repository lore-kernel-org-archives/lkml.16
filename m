Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705EE22C321
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751994; cv=none; b=L5fq9zQV/u0QfFJAiqO0OvabPaOagEN3kGtiFNS57GZzADQ/9tdNcTNdX9zGu042IOhS3oxwuF9ZlER26Lkqd83FxZSruA2qDOpzi9WpBF1A7bd1npSLoxMqgg87DJPVM9s5JYczbyFMG60IX2E1AsplsTbla8Y2Z8j6Mx1ZZ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751994; c=relaxed/simple;
	bh=+5MF1gZblDfbJX6Ub6UjJL8Dsye2HajJO7xW7GGMnZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BhsUbshrxm0cPmSmzttlo6J14XKp266jxAZA6G6G+W3otJgEX8vECevlYO9SCmOEIJ60aCsh4KpT8e7e16jTxT4RChSmwu8TmmLLUQvDd7qGIRWWX9NkGnUKPpNiwmjRBPvaYgHTLT7YfJxPl0tWWfbc5TihU+fTLgGGqOfW0gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BRmmv4Ze; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3L9C+qi2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BRmmv4Ze";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3L9C+qi2"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6iU7/Sp5boVxyMgMrHuBvSPIlUirr0pttNKb2ZMRC0=;
	b=BRmmv4ZeWeipc46SLvuYZsdxWS98+esD2moSexyECgOEpDWc174ABw/qU5hINWWTVPP4N3
	wT99jlmlGvy3QsokxFifF+nc2ZwoCbODYg55K3QoPQXESaqEOalo0+WDYQUHClROnkSmZF
	DODcN5xr5D2CpQFoyAq5blztflE9u2e7QLKd5cY5HwcA6aZBzy9I0sCDF85HGOC70yU8pV
	aT4hsDxaI9Btju4WBbNhwJKWesAach4M193vF1D4kP15A7fwuFq4b4miGrVIx2i6aYQU4I
	D0ucjvJBcOsh8eWSgCnv0ZOxdz/sd/sxq9E9wCK6uwFqu1GgUh+O8xJUK9wruQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6iU7/Sp5boVxyMgMrHuBvSPIlUirr0pttNKb2ZMRC0=;
	b=3L9C+qi2fKE8c6b3+SYIjCzyO3+egzjS+IwG6eHFo9mF1txI2NdGIYbzCllqv5aLZNTrnd
	xumx8kv+eJiNaDBg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 07/31] riscv: kvm: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:51 +0100
Message-Id: <d5ededf778f59f2fc38ff4276fb7f4c893e4142c.1738746821.git.namcao@linutronix.de>
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
Cc: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/vcpu_timer.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 96e7a4e463f7..ff672fa71fcc 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -248,18 +248,19 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu)
 	if (t->init_done)
 		return -EINVAL;
=20
-	hrtimer_init(&t->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	t->init_done =3D true;
 	t->next_set =3D false;
=20
 	/* Enable sstc for every vcpu if available in hardware */
 	if (riscv_isa_extension_available(NULL, SSTC)) {
 		t->sstc_enabled =3D true;
-		t->hrt.function =3D kvm_riscv_vcpu_vstimer_expired;
+		hrtimer_setup(&t->hrt, kvm_riscv_vcpu_vstimer_expired, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL);
 		t->timer_next_event =3D kvm_riscv_vcpu_update_vstimecmp;
 	} else {
 		t->sstc_enabled =3D false;
-		t->hrt.function =3D kvm_riscv_vcpu_hrtimer_expired;
+		hrtimer_setup(&t->hrt, kvm_riscv_vcpu_hrtimer_expired, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL);
 		t->timer_next_event =3D kvm_riscv_vcpu_update_hrtimer;
 	}
=20
--=20
2.39.5

