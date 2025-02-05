Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C3722CBDF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751995; cv=none; b=PIHbvMKVO7tX6gzJqr0e3vWbCC1e+8TTH570Xyth/z6oreO9fMxmPuHaHXwQ8giV/UYl6pGSZE3LoqNnHsFMwKK60VQz7zXVX3Zfg+Sv0s6sYNKHKDuJ1F6B5KF0UMR15OPj3rr0NkUc7cwrZMlebbAEsCuPRGUzAsDH4mU0rk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751995; c=relaxed/simple;
	bh=DgOKrnnvYS6CflUo/6avDXxBGbItaK4hPVrRmFhsgMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pjSZE8FalzpUzMRIh1W16Dqk+nlK+g6Y/HMmRwXIJ6ZQ+UNdSibJ5yCA2JNsf5DGy5001cibE8iIbs2uzf657dIKmjq6NzvawERFZPusiLVtVIwnnKK1LolpycU37w3Wp8jbAp6x7CUOkMMCCPQ49gHSz2xC+d/O5bKBu1mxV/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qkowxeCe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GVmOSP12; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qkowxeCe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GVmOSP12"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZoRypk2La0UwOMOrnZ4ZH62e3tRQbToZGPXHQqsEkc=;
	b=qkowxeCe8djcXvZaA8kPL4rrH15zeZgEnbsSqimdwuMroFXM+5MEZAgJ7LOCESfLCaYhXp
	fj6qXeSRVct2g4zq0Gn+r/fi0VK7ViLpWJx8+Wn8MqwzbgGgntoNN4TWrpLp9aDbThk4lO
	DVlqtEIi38BZwdX19dnLRTHorPkzjHx3ZSGLLG32yYuloSWF0pU5V2uYgzJnOfOdDj/L60
	d6DUziaP1rLqZFrxS+fHC4vPpAp9IfvNSPapgaSPj2Hj4qgnd+XwMHMYdNi/qKXheHNnB2
	OcfSNFusaJBs94a9+Mq7ojVQIFSQlyYRDT+kJ2xZitohUfaSYAhUuSAYOzgKHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZoRypk2La0UwOMOrnZ4ZH62e3tRQbToZGPXHQqsEkc=;
	b=GVmOSP12ij9TPf+REFuwOnv+3FxiMghcJvy3nPjpwX281TfQfu0uQILxs2ngCaj2Qyz8uh
	q/pQ8o9PoCof7vDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 15/31] lib: test_objpool: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:59 +0100
Message-Id: <edc46fbf290b280ebe67bb0d21599c4c30716b68.1738746821.git.namcao@linutronix.de>
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
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/test_objpool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/test_objpool.c b/lib/test_objpool.c
index 896c0131c9a8..8f688187fa87 100644
--- a/lib/test_objpool.c
+++ b/lib/test_objpool.c
@@ -190,8 +190,7 @@ static int ot_init_hrtimer(struct ot_item *item, unsign=
ed long hrtimer)
 		return -ENOENT;
=20
 	item->hrtcycle =3D ktime_set(0, hrtimer * 1000000UL);
-	hrtimer_init(hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	hrt->function =3D ot_hrtimer_handler;
+	hrtimer_setup(hrt, ot_hrtimer_handler, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	return 0;
 }
=20
--=20
2.39.5

