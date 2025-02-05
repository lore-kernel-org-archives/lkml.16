Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D022DFA7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751999; cv=none; b=Z74+e2JEIS6M/7vYhmE1BYIDZXO+tVon0s2brPp45JVpjE+mpzsonv01F/vhr4/Q4BGwIJlQ5oVsVHntt0WqP2tDGJOXB4b3bhUaVmq5Qb/9HnvoMmGBE5zKSA4fBW2WXlBw8SmcJ1y+0q28U2XQsiHYQ4SeXVuQPUUM4PotQ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751999; c=relaxed/simple;
	bh=7uVrsBENQjyE8JBIUS16xu+0TE6BodeWyO/rAxQCkC8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b8/CW7rAZWCHdMRikZtVBYlWAhW9DKnhH5Lilu0MSZeSAz+dCr2s6sOYf8mYDEdCfSnk8hVVLNoAkUbldyr6aCW72hQ3MZYnPs4SShSKVA8PRxwz/+sIsWBnrcnk3MKqZC4Ty7R1XPXqITQcsoD+MAu4IFUPJANrpOYd9gHnyEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XNu4iNS5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wOBFfdLT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XNu4iNS5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wOBFfdLT"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=obyB+yvY2qjQDUyuUkgTMZqn84tctt91SdNK4ny0zHw=;
	b=XNu4iNS5OQuUVwwhW1WaqAg2awHUZEYHiqRCtw97ju9WMybqLWA+E1iyTTeLPf6SH5W2UB
	yt8f0kFQxu4qEdFkplEf7QIjMJXGFBCeB0g9uKF9WxvoW2ccX6o9H7PDkWYYVnIEFy0um5
	6w8NQrDFJp0Ydrweku9Q8hIF+1pJnkOtEIej6qXqa+q2XqxKqaEFLtqhnSYdQj6ASvvgTk
	ynT1DWNbjW6v63RCkK0wDDl0kDTN0UJlccNtQo7dT44fkvfUG/WpvEI7M2jetLDf1IKusZ
	BdhxqTbECY6OEE4oUEkLuqV3ZqNXRZu0ZHUT3Tx+K7/7qG67Y07n2EyXu8Nn2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=obyB+yvY2qjQDUyuUkgTMZqn84tctt91SdNK4ny0zHw=;
	b=wOBFfdLTl/Rz0Ljd4qVhUukn1huRCHAvUIWRddjTOQ1VQUyLgkPAcJG8V98SIflPaaGiTf
	NB8kz1c+QwVttcBg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 22/31] ubifs: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:06 +0100
Message-Id: <f5767e50aaa2935b3e4a0e9cf1bc4365d6b0c1a0.1738746821.git.namcao@linutronix.de>
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
Cc: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/io.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 01d8eb170382..a79f229df475 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -1179,8 +1179,7 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubif=
s_wbuf *wbuf)
 	wbuf->c =3D c;
 	wbuf->next_ino =3D 0;
=20
-	hrtimer_init(&wbuf->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	wbuf->timer.function =3D wbuf_timer_callback_nolock;
+	hrtimer_setup(&wbuf->timer, wbuf_timer_callback_nolock, CLOCK_MONOTONIC, =
HRTIMER_MODE_REL);
 	return 0;
 }
=20
--=20
2.39.5

