Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E709122DFBA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752933; cv=none; b=l6ZyESI1uoIWpCFJWX1QyIc7+m0WaDAwPEgvr1F6gv6eBTnAurrMJq9+YHtvnRqVghbdUUR+hNI1tJ502X8e3qAD0AgUXG6QmY8IdXmEWCCmc8o0K1xJpgxUHxVv/0zpxQms88dMAX+kaRs7GLmHcByem6ovW+f+NjxQDMU5Wmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752933; c=relaxed/simple;
	bh=+BQ0KwyiPKvaJ9UAVGGIhitG05ADENZrMDkUT3gVugk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j9KsKPDViXri5THg878/z+RlZqIH8vX9+NZDSnEDW0n22pW5qk5Br8Quhml8t3lBURCKThV6rp14PJrIXVoXfEHb7YZKDiEbofK1ndNz/iq6KbPvbEuq+wTLrRadtxwaSFt7Yi1NHh+uPzTepDn2eT1EXGU41DUR4SqnD+gCoyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iZEWG5To; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kEgJncZh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iZEWG5To";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kEgJncZh"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWfoZkSisdqMRbj+fTmgh5Ti8j758+enCkqKof8DO70=;
	b=iZEWG5TocI1YAYLCGRwz8OBrsW4U96K+8eWWyFxgfQa5lNba1QDQmNcSE33b8PSXk66KeP
	sDGReng1iWdqYlDejBXRqZI5eLDne6brq0gvM5cpbPL0PCDk72P6DBVWjbDcH8a9npr3ko
	VhTX6DGmG7nYiTM7LTEs08v92OWTmbJP5jT4EMz932ky0tgy68fCvPJcDbkuI0BN5EvNCj
	iJLKeqglB+ObRRkJZXlCWLVGRoP4ZrUsOsKe5doKS5hSYzgAmCNMOcaGq5hyaPbiiWPuDl
	kADGMLOO30d0vzyZW1/tg77BGTkYEcuU3J6u1HElCvHyxHu5GwyHdd+6+Ze84w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWfoZkSisdqMRbj+fTmgh5Ti8j758+enCkqKof8DO70=;
	b=kEgJncZhPK6ZwqlwU/A86iCCs/SquYFMafeh3sxsNu+IXQiBYflC1GQEw9H2cKsSUYnRGa
	QyB4r57pdULKhzBA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 02/12] hrtimers: Switch to use __htimer_setup()
Date: Wed,  5 Feb 2025 11:55:11 +0100
Message-Id: <d9a45a51b6a8aa0045310d63f73753bf6b33f385.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

__hrtimer_init_sleeper() calls __hrtimer_init() and also setups the
callback function. But there is already __hrtimer_setup() which does both
actions.

Switch to use __hrtimer_setup() to simplify the code.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 kernel/time/hrtimer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 6474089f65fb..d3e02c771b39 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2066,8 +2066,7 @@ static void __hrtimer_init_sleeper(struct hrtimer_sle=
eper *sl,
 			mode |=3D HRTIMER_MODE_HARD;
 	}
=20
-	__hrtimer_init(&sl->timer, clock_id, mode);
-	sl->timer.function =3D hrtimer_wakeup;
+	__hrtimer_setup(&sl->timer, hrtimer_wakeup, clock_id, mode);
 	sl->task =3D current;
 }
=20
--=20
2.39.5

