Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BA122B5B6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751997; cv=none; b=BkBpnfJf2wOUwZcocgFpxgjLMEpB7ahmum+8fc/2ltphF9VyXjJJFn6frjTUL6VNy2NuNwwCg6F2DBIzc/wCVojnlrP421z1G0JZLUeqTG63KyPppJxN3rUXiVxAGbu+pVq9LUy7kkPni2liqtu2H5B+mqKfjp4r8IQmUExCZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751997; c=relaxed/simple;
	bh=7GUBoYMSq5znok224ISB6WAhFMAf727Cfbtk/NMb1QY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=scwfrhATX6ZiGWFPhIekGLjmSuQUGKBhrTFFT7LZNvVBg7yCkxDjCryG9u69rraI+a0DmTuLUEt/qpJd9d4ypqPObq+sso9I0o/ecl2KruoWWO1jKe+waS4ADyIhzZcCT1DbNKvTPp2S419EJ+5s1BfEeN6+KORMK2Gm0v9+uhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JY748rx+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JnCyxEW2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JY748rx+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JnCyxEW2"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fyDjhJUuIm8B4iVIaKBKH/sSiyImu7CJ1Rqr4iuPoXI=;
	b=JY748rx+WYJjMtGSK2+5psjyyWC33xJNM5GqaPPnPmNINOCRqVCJwJyFZ8RsxpQmSGSxLM
	KDvScTkdeE1F6eQ0KBiuxvZdtzF1VP9Bu4Z2n95ErB98MtmFgDGMMizcdfixtgJCuv202C
	GfM2DOmTgo8toHXZII5c2O1U/O3eZoRFUbFvme+NwcI3b0aLqUefAnnKpknsUYPYzL7KWX
	lEe+LUZonHiKlhVPKBKp07zzk2PdX72FuOTt4yhus3AZASoIayaPAry52ErdAPH7WY0TWw
	hAWdmtJZcWg79U/1fl7LnDZa8CtKgib0eYP66TrwGd+VN4ogBgDty/Ka2PiU6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fyDjhJUuIm8B4iVIaKBKH/sSiyImu7CJ1Rqr4iuPoXI=;
	b=JnCyxEW2DeVlZr6BbopHc/LUPNn7QkLaELPNn8/9a8XQULxuGjpPkQ6KEdWCjDFLSwWNby
	ddVdbuWqaYqMClAA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH v2 17/31] fork: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:01 +0100
Message-Id: <174111145b945391e48936d6debcd43caec3e406.1738746821.git.namcao@linutronix.de>
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
Cc: Oleg Nesterov <oleg@redhat.com>
---
 kernel/fork.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 735405a9c5f3..e27fe5d5a15c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1891,8 +1891,7 @@ static int copy_signal(unsigned long clone_flags, str=
uct task_struct *tsk)
 #ifdef CONFIG_POSIX_TIMERS
 	INIT_HLIST_HEAD(&sig->posix_timers);
 	INIT_HLIST_HEAD(&sig->ignored_posix_timers);
-	hrtimer_init(&sig->real_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	sig->real_timer.function =3D it_real_fn;
+	hrtimer_setup(&sig->real_timer, it_real_fn, CLOCK_MONOTONIC, HRTIMER_MODE=
_REL);
 #endif
=20
 	task_lock(current->group_leader);
--=20
2.39.5

