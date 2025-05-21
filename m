Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6E6264A92;
	Wed, 21 May 2025 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829171; cv=none; b=uKRLv1LeVLvbAcZ/lTSaEYL8ByWe+T//oxLvreDUhzjFX4t2zSqKsI2hK67B/pchuUrvphJU2UpPhAOlvkkTdWCmzVMHji686zZYRMoFrtlyZUy0z1QFouXNTjIS4zQdaTA71QvJXHynCG1rXv6XQR1KR43Xf/FLyK6IGGsv3HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829171; c=relaxed/simple;
	bh=J0Z5CM/92zYxMiCiOjIvjio1VdqUB3Ixw5gwWOzOYJM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ZbHf7Ifukrb0/M10hHwr2Q9ZzKhPPUS5qFAjAn3s0uAWPl44ouw5giQ21WIJALn2GO0R9UnT0sYQFmoDpwbXVcYNWW7JDlqpVHm2v+OFqMMPUTEJiEhMQzwRq1BBCh552fujOzXeJtBnGWqv1aXzRCza2GraW4HUQRozC9ksRyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eukAFENx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fn1TyqBh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eukAFENx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fn1TyqBh"
Date: Wed, 21 May 2025 12:06:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747829167;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WdGXdGPWc2jlOudrRQaLvNRdFXGUIq/mK7OmjCQES0=;
	b=eukAFENxUwpiUbomRTg1mjEqe/UQ3sMhNOjgFP0hLVSj9Qp9Bu7te1piYzfTetMuJAgFU1
	YjLDYIbw0k2M5Wqx3ZFNljQBsN/swX6SjMZV6z8NLkXxDjYw1hEvBdFfRCkXST4ZlG1Bas
	vewGw0i618tYz+OwNhdb8cTQ7QEjLz8+IiYpPZIVr0spkSdXv+fIP8c355I4t7HDM89N0l
	aVSw3j7Q4o9acVYiBTcb/REbm/ittu6Z6YyMZmO2mY7M8aTUKUbfzRIe9yK/AIw7jeKqz/
	d7hxocv9nRI5Da55o/iFlAdX/gvcBowOyZfLr94neL2ZYgJORb0QtYEvXmRg2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747829167;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WdGXdGPWc2jlOudrRQaLvNRdFXGUIq/mK7OmjCQES0=;
	b=fn1TyqBhcSJxvil/oKTEFDAj6HH5Xt+8cX4QAnW9wZfCLhXoSCzaPLFRhXIrmO+A7QexUj
	sdirOD9Rqwa7ErCg==
From: "tip-bot2 for Sebastian Andrzej Siewior" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/futex] futex: Correct the kernedoc return value for
 futex_wait_setup().
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, andrealmeid@igalia.com,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250517151455.1065363-6-bigeasy@linutronix.de>
References: <20250517151455.1065363-6-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <174782916686.406.18111680517101107267.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/futex branch of tip:

Commit-ID:     73c6c02b4febbb2c2761e559f31af8c7b87e81a5
Gitweb:        https://git.kernel.org/tip/73c6c02b4febbb2c2761e559f31af8c7b87=
e81a5
Author:        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
AuthorDate:    Sat, 17 May 2025 17:14:55 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 21 May 2025 13:57:41 +02:00

futex: Correct the kernedoc return value for futex_wait_setup().

The kerneldoc for futex_wait_setup() states it can return "0" or "<1".
This isn't true because the error case is "<0" not less than 1.

Document that <0 is returned on error. Drop the possible return values
and state possible reasons.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Link: https://lore.kernel.org/r/20250517151455.1065363-6-bigeasy@linutronix.de
---
 kernel/futex/waitwake.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index b3738fb..e2bbe55 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -585,7 +585,8 @@ int futex_wait_multiple(struct futex_vector *vs, unsigned=
 int count,
  *
  * Return:
  *  -  0 - uaddr contains val and hb has been locked;
- *  - <1 - -EFAULT or -EWOULDBLOCK (uaddr does not contain val) and hb is un=
locked
+ *  - <0 - On error and the hb is unlocked. A possible reason: the uaddr can=
 not
+ *	   be read, does not contain the expected value or is not properly aligne=
d.
  */
 int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
 		     struct futex_q *q, union futex_key *key2,
