Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6516022CBF4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752241; cv=none; b=s5DzBE+iG2es3RAA8OnmIjdW+0QQyyCAcazCXEbYqPbn+tf6Ji4kdlWY44LEeXZXdga0YNSeDMJRqLBBd1+pvs3opfptvREv9mas2iwkj/Q2tIKRt60oGKJ9rd4JyPZSSYZgONT3iEPH024mzfO7dmGlW6g69fXFAhfOS2T+Cew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752241; c=relaxed/simple;
	bh=6sCJgvG7tZJmUd+2PnfjdU2N9mSb1iNsSFvFXCsfaBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HxYgh0crsIrNhrcDJC8H9z2/XtMqeN0TM1sC0sjSPm4idNj6ccXEilhxZTELJ8l/PtqD9r2JN8Bc82lzHZLcYad0K61f10ImSOaX94t/JMUelt8mrqQ6dZ7S0oWqak6lzF/Ou8Z8jIfK0DMW3K4Y8CqsjQjSe39eOhqlwvdjrFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bIVx7oKS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G3s2tQ3j; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bIVx7oKS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G3s2tQ3j"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eQcZKQYBYXGRaHFwdEq4cJ9Sg3Z+taWpDdyrdREQug=;
	b=bIVx7oKSlzhSlwIGhQTvmKWDxnJKmftqUPqDzE+qHjg3ec0n+5tqPkTo+1wSb5jKHsJaEN
	5sV/ASAHF62BrUjRrWMoQEqzX3iuIe2EADBMEi7VO4BXgH6hv5buOdzolMicOkOmg/fv9K
	tln88aH6lZ6Gp7nR6IWe12ckcRwoim8Vsr5R3w/RrgFdtFRJa3GYpcgrBFZv8M8LLW0nCV
	vhcHprH517X4vjCBKnucuJZZhCGzqLj2iIRyR9MxMka55oX6WUCRciNJANNbMMmJDUe7l/
	g0sC0TTpX1uWPAc+28UtAyW9sr4pCxUilbeyA4eSHn44vvYegAkLoCiU3jJ/JQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eQcZKQYBYXGRaHFwdEq4cJ9Sg3Z+taWpDdyrdREQug=;
	b=G3s2tQ3jWiIMoDps7TJe48oTI6YNqLk6mwIeBd7O/hpQ/rcHs8vCL79sQDkZqewoVHy4vg
	Kbr4uy9l3nmiXVBQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 04/24] tcp: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:24 +0100
Message-Id: <a16c227cc6882d8aecf658e6a7e38b74e7fd7573.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
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
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/ipv4/tcp_timer.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
index b412ed88ccd9..e7a75afa995d 100644
--- a/net/ipv4/tcp_timer.c
+++ b/net/ipv4/tcp_timer.c
@@ -884,11 +884,9 @@ void tcp_init_xmit_timers(struct sock *sk)
 {
 	inet_csk_init_xmit_timers(sk, &tcp_write_timer, &tcp_delack_timer,
 				  &tcp_keepalive_timer);
-	hrtimer_init(&tcp_sk(sk)->pacing_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_ABS_PINNED_SOFT);
-	tcp_sk(sk)->pacing_timer.function =3D tcp_pace_kick;
+	hrtimer_setup(&tcp_sk(sk)->pacing_timer, tcp_pace_kick, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_ABS_PINNED_SOFT);
=20
-	hrtimer_init(&tcp_sk(sk)->compressed_ack_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL_PINNED_SOFT);
-	tcp_sk(sk)->compressed_ack_timer.function =3D tcp_compressed_ack_kick;
+	hrtimer_setup(&tcp_sk(sk)->compressed_ack_timer, tcp_compressed_ack_kick,=
 CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL_PINNED_SOFT);
 }
--=20
2.39.5

