Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B9C2063E3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591192; cv=none; b=V4UUkbXREdVas1CGyjbXHeLIuRYcEuvfXkBWFvZJexgQhbCqgWsjNfFG3yfFcYrh2n+su5YcJSKuC7T7v94bSLklxPQBioOOiQWDUIFSG1NEcvS+gOhJt8W8gKx4ziHUR/iTSLCU5mhdLwFRPaeHUU/c3VgNL0eVPUWqVIFJVkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591192; c=relaxed/simple;
	bh=kahJmMMuAdiqLs2rA484rWrUQ4drU0Xpd4m7TvAUT1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fH0KBsafVapXgCuPrsVvbDp5+fPP1unqJaXZ6v9IoX4sL6ZWGWdYgH9lopXSrW8Fwqmiqkm8arM8FcR/c3PXRx+n3FYtNqA6auIhbtOMy2J8qh/3pgnyApKX5615XjlCWWa6bNRkaApDDWu6orCu1ly4k0oUXfRRHwVcOTe58cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yuZ8RJ1W; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rQMLuiHu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yuZ8RJ1W";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rQMLuiHu"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pI2Iy/DyMXZ+IzQy/zbBGtQShR8KXyUna/Rvr4+O/+A=;
	b=yuZ8RJ1Wu56vHMyEPhds4tgsSYiAxQQZii8LDBbbyPmd6UeVUL8f606F2W/41pRVEKb3hp
	8Ppf/jHdBxURXSTp75GTvz/ctM+w9BIZggQCY74fU4L3UYa5n+91OGH5CnWbbnY1lJecU7
	5AvP2NSLEedvLtLTOwwG6T5/Ceg1kNVCvDuVpjrbY93mDS9kxmEEZXmt6V91DHT4w5HLeV
	4sfkGVnbdrNkO2uT+DyK3R2EB+EXg8GHWOvhKnlStQS40sLPUr9uAG+x7t6E2uqJJOILTH
	EbruP38D6Y5pObTIfO4+biPozL130BmGtwc+TalmA31PK18GiUFdV1kM3tF6+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pI2Iy/DyMXZ+IzQy/zbBGtQShR8KXyUna/Rvr4+O/+A=;
	b=rQMLuiHuRC3XIye6WcwOXXrW/X/DADGX6SqdZmkjtcfbvtYewEVchBElM58NJd3O/jL+sg
	52pu7yhYqXCkaNDw==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v8 09/15] futex: Re-evaluate the hash bucket after dropping the lock
Date: Mon,  3 Feb 2025 14:59:29 +0100
Message-ID: <20250203135935.440018-10-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In futex_requeue() and futex_wake_op() the hash bucket lock is
dropped in the failure paths for handling page faults and other
error scenarios. After that the code jumps back to retry_private
which relocks the hash bucket[s] under the assumption that the hash
bucket pointer which was retrieved via futex_hash() is still valid.

With resizable private hash buckets, that assumption is not longer
true as the waiters can be moved to a larger hash in the meantime.

Move the retry_private label above the hashing function to handle
this correctly.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/requeue.c  | 2 +-
 kernel/futex/waitwake.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index 217cec5c8302e..31ec543e7fdb3 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -443,10 +443,10 @@ int futex_requeue(u32 __user *uaddr1, unsigned int fl=
ags1,
 	if (requeue_pi && futex_match(&key1, &key2))
 		return -EINVAL;
=20
+retry_private:
 	hb1 =3D futex_hash(&key1);
 	hb2 =3D futex_hash(&key2);
=20
-retry_private:
 	futex_hb_waiters_inc(hb2);
 	double_lock_hb(hb1, hb2);
=20
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index 8027195802ca1..98409ba9605a8 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -266,10 +266,10 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int fl=
ags, u32 __user *uaddr2,
 	if (unlikely(ret !=3D 0))
 		return ret;
=20
+retry_private:
 	hb1 =3D futex_hash(&key1);
 	hb2 =3D futex_hash(&key2);
=20
-retry_private:
 	double_lock_hb(hb1, hb2);
 	op_ret =3D futex_atomic_op_inuser(op, uaddr2);
 	if (unlikely(op_ret < 0)) {
--=20
2.47.2

