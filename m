Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0268A22C35B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751995; cv=none; b=jHHR2FXjEAud/3fEK4A7sjh3HXDOr9cfPsaBD9DZ06dFRjqqY/J3+V/v9Xm4iK6M8hgIeI8KksoPcNAhSkaho35oi9LcazYmH/tIQDoU59LbJO9TWhu7IPh7ow6J1+T9F8BiHGK+hO76swppfk3/FFsegTzGSo06MAPYzfLocZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751995; c=relaxed/simple;
	bh=ojoy9w3w2u/V0fNWANgt4dHWQoOsPR1wrw23CSoaDzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JGXJqkdDa4Iy4Exjzg7ZUISTAt9bI5jVWJJTX8SOCVHhprSM6C7E6dbgU1aOKyQ1pRrmm5WiIIGEnkcX0nCpB8sRS0/5fEZL7mW20zdR5GZ438zJkvQXO9W/jXPwheIbuPX/XOFxUKApMy72NyFEcCtMlrjXiOi8+2dKATxpTp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZAubTgJ9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ihEiI6e0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZAubTgJ9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ihEiI6e0"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/84tRkM7FzLld2Jf1WWyNlKNjtaLhR1cHHFsiaB9AQ=;
	b=ZAubTgJ997563ddWkC4Xho9K6Ep85CpuYvYV1KQ6HxNFaxFug1Kjl87u8wSN3AUw7v0oPG
	gZ8f6dIqmYqdHDmhPXesrUlQE1JmJ6l/KCmovxNwTHfaqVk5JySit90BnI3puypUQ2Q8cb
	Pu7BzZd8DdbRQViITopgJD6P3chvMIcGhNz5/XW5U8m7D+jLDU72la/mR6gRjH98bZWtI3
	p9WkTMWc/5s0TeFjzpqNigSyHVLZ638+OGvnKIxbksIGn31hNksqe5Q73uvnmzEJgJHS2O
	T5pp0jS49Kt/VT0ZFDskImoQahZIFpnyRolSfZ1wvc1+lbIEHOP9Mt8YcYFKYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/84tRkM7FzLld2Jf1WWyNlKNjtaLhR1cHHFsiaB9AQ=;
	b=ihEiI6e0PQJ7jEJKbDc1m8PvJsgY5sjCJ7Kp3GpJ2+vldKUWW3PuKGQb6WWhy7FUPqRq04
	+M9PjUCXGTay6QDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 10/31] powerpc/watchdog: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:54 +0100
Message-Id: <099ebf6d352094a56e22fdfe76582b50f8fd6029.1738746821.git.namcao@linutronix.de>
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
 arch/powerpc/kernel/watchdog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 8c464a5d8246..2429cb1c7baa 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -495,8 +495,7 @@ static void start_watchdog(void *arg)
=20
 	*this_cpu_ptr(&wd_timer_tb) =3D get_tb();
=20
-	hrtimer_init(hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	hrtimer->function =3D watchdog_timer_fn;
+	hrtimer_setup(hrtimer, watchdog_timer_fn, CLOCK_MONOTONIC, HRTIMER_MODE_R=
EL);
 	hrtimer_start(hrtimer, ms_to_ktime(wd_timer_period_ms),
 		      HRTIMER_MODE_REL_PINNED);
 }
--=20
2.39.5

