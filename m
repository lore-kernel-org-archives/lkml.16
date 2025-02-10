Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506B264609
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221553; cv=none; b=PqBgiaDSYHscAcLoE7oARz3EyjLSR7GQPiuF/DnjL1D1FAoagvxj3x56z+6Q4MTzRJ9L09Rwf2BSreT8N8fR/UwuX60RWozs10BoWN4y4NkdfzmjLETSzsBCMjQmTqLPzQ529HpH5DKYWXGVv7tPgv5NBbSZiZQELZ5kJhYHrGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221553; c=relaxed/simple;
	bh=aeLMu63AaX0zDTcKET6zr61yPiW61Ut4P2Xn82kYvpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uBc280UuPSK/eQcsl06ifIuWvmiV1Lkackd2wf6EIGot7OxZzP2XpMF0qTmF6f0rMzpBArT2JABmJa03f88Nj/SnAwlf+3r5CoJRm02CHEy/Z9tdDlGCBYEE3caEg5ZOWYlSHIMOdOPoDMcK3SB3Nt6feF12WinWIHDcGFQWAxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQt1WdcV; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQt1WdcV"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de4a8b4f86so5387948a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739221550; x=1739826350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJt3g3FcMy/shHNHpxjZN7o0n8OkVp8j3W33PvCdaZ4=;
        b=KQt1WdcV8nI1Jr/SgbuaPYmaNgdEli6VQwceWLT+WtmGl6xFCeUvyd3t+IstSPhyYf
         UUFIjEonRv1wEqbvXAxAFLXfwjGVCyfu9g6AbtNiepJ31UzeCOMhFgXUbrptqpfwHYl3
         egNbmS++VoruX84M6Z5SSgLm2j+a9emCS1cCQsM2vjuoQ0XBo5dMMu5kFC/GtQWRDuJC
         XZw3Qq6NTzVnB/KGpRhTWz46yL3TzjbI88e+MH4QRMKFKF2RFH9Qt35pKC5iBf7vEIS/
         H8vRPiO9OJBXe/qfQHPEaf3NPIBi+yNWPDGgR4w8zLxbxLv8Km55VK42qOoQ0BBpkN/4
         Atrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739221550; x=1739826350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJt3g3FcMy/shHNHpxjZN7o0n8OkVp8j3W33PvCdaZ4=;
        b=U99UBNYvDusw8OlPgeKcJwXFbpSjZkg2gaWZLJ0pSYNBsd6AMOSkcPeK1w7hRkfmSR
         ikYjuJ0CJdEFdPJqIyIokCUl5cy8O0X8y7ntblP0dK6Ow0K5EXp0mhPA9ZYVWMW7RfBm
         xpQ1KxzdNWOkw+cGBDSaXSXFPNoGct2LK0SDinZn/Aiug01SMjYvFiXCJ20RtHMPeYV0
         2bT7q1+LG5hXGA4vMOV4M4CgW6XOEtBV9hOO4QBTmDguGlRoQ7KyMOcQYcVR3Zi9qRFv
         N2fHpLyQaxSc8fJCGUjlT+w1vvPLPlSWWkd/XvbQrZB9+ixG40DcNMEse63+sQNM/pXV
         h5Yg==
X-Gm-Message-State: AOJu0YzwEY9aW3SGlcdgcWEtd7FwkiS3iLzADbJMGBbMPzzqgHfJLJe0
	wTHSsb/kf7RZrh9Y4J5z2WHOX0USirYUwT9AVmeD+5rZW4NrhP6u
X-Gm-Gg: ASbGnct0MM8QPXiOGzyPp6s1d9m6iYi7u1weWdrH9YibXHRQtfMRRCmuGPkOhP133fk
	XUF/gIqFwe2jqgNsjBTO4p2FAqqLaeakezYeKE8OPzu6hb6oqvNLexv40kAVU4d2L+oOTr6x/rT
	cE8wVozKiyTwiJpc/qH/WK9ZLRF2qRd/CgewwksfHcujA3qlQSvNK9afvs1l0Qskn9HaPYb1hPm
	4gx/ykrlhCGKXr+TXbMar1h2LeldJiyTpKiSKjNF3fM2nbx4hPLMynJq3IJcWIA2zOvj3hHtcFr
	/LAEDo3RDKvrrWpLBgxBN5VNDuu5hswPgQ==
X-Google-Smtp-Source: AGHT+IE/8iTwEZeYIL1zRK2NXyILwRelcUdNGmCFOZu6HI1meOC7C5tWlVty9cOfvOq/a7sQSKHzqg==
X-Received: by 2002:a05:6402:2383:b0:5dc:7fbe:7313 with SMTP id 4fb4d7f45d1cf-5de44feb7bfmr17113030a12.6.1739221549705;
        Mon, 10 Feb 2025 13:05:49 -0800 (PST)
Received: from f.. (cst-prg-84-201.cust.vodafone.cz. [46.135.84.201])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4c9b890dsm6887267a12.56.2025.02.10.13.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:05:48 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: kees@kernel.org,
	luto@amacapital.net,
	wad@chromium.org
Cc: linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH] seccomp: avoid the lock trip in seccomp_filter_release in common case
Date: Mon, 10 Feb 2025 22:05:41 +0100
Message-ID: <20250210210541.867037-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vast majority of threads don't have any seccomp filters, all while the
lock taken here is shared between all threads in given process and
frequently used.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---

Here is a splat from parallel thread creation/destruction within onep
rocess:

bpftrace -e 'kprobe:__pv_queued_spin_lock_slowpath { @[kstack()] = count(); }'

[snip]
@[
    __pv_queued_spin_lock_slowpath+5
    _raw_spin_lock_irq+42
    seccomp_filter_release+32
    do_exit+286
    __x64_sys_exit+27
    x64_sys_call+4703
    do_syscall_64+82
    entry_SYSCALL_64_after_hwframe+118
]: 475601
@[
    __pv_queued_spin_lock_slowpath+5
    _raw_spin_lock_irq+42
    acct_collect+77
    do_exit+1380
    __x64_sys_exit+27
    x64_sys_call+4703
    do_syscall_64+82
    entry_SYSCALL_64_after_hwframe+118
]: 478335
@[
    __pv_queued_spin_lock_slowpath+5
    _raw_spin_lock_irq+42
    sigprocmask+106
    __x64_sys_rt_sigprocmask+121
    do_syscall_64+82
    entry_SYSCALL_64_after_hwframe+118
]: 1825572

There are more spots which take the same lock, with seccomp being top 3.

I could not be bothered to bench before/after, but I can do it if you
insist. The fact that this codepath is a factor can be seen above.

This is a minor patch, I'm not going to insist on it.

To my reading seccomp only ever gets populated for current, so this
should be perfectly safe to test on exit without any synchronisation.

This may need a data_race annotation if some tooling decides to protest.

 kernel/seccomp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 7bbb408431eb..c839674966e2 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -576,6 +576,9 @@ void seccomp_filter_release(struct task_struct *tsk)
 	if (WARN_ON((tsk->flags & PF_EXITING) == 0))
 		return;
 
+	if (tsk->seccomp.filter == NULL)
+		return;
+
 	spin_lock_irq(&tsk->sighand->siglock);
 	orig = tsk->seccomp.filter;
 	/* Detach task from its filter tree. */
-- 
2.43.0

