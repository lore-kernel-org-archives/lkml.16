Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CB022FDE3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752936; cv=none; b=QTRfFrHxW1AWCRdtkoNEgkpHFJDzccMiCOw0LS3d+dbK7iWTs2VGezQyQ16lwmXIePVb5VQeBc1H5BEX09uzmIRMGN3T821CaqsQxpSmPrtwD2yQQHFA4TLnOCBPrumHrq3Hyx9Z6kttnuXXeun6kmeXXMY0iC4y7gj2B7LB9RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752936; c=relaxed/simple;
	bh=hV2OVty6T8JpGJbk80pZc8kKWSJ5y/s242EHcqK3Mng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RXquKpNy+ROOI72E++oz4GyVJFs0fd2eViEFCUfEGRCHWjpq8SqsKwHvGGE747gk23ixrJCvms4krtYU6CZIGT3esqfY8ge8VaoaXuVVQ43GOxPQytxncsyONLR9ZaJLg2+J+fUxmW63erZ5383O6DhkviJVpMSTKWzeOlIJLsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RYjANvzO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vJW5NiXm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RYjANvzO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vJW5NiXm"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GS438I1KkkYYbfmv3T8S42vDtz8635M+U6FrnsOAbKU=;
	b=RYjANvzOf3wojFKhyYgNzFc+myf9O2y2iusqSDXAZ4CYDyT9s7zeqbutRF6UiOX84PSg8q
	2gXjAC9xUyX/TaQWNX5Y66FET74LsaUtiDrq2VQWJvHiHzrNipJsG8Q1OHvvUhPQ70OIBK
	ezcI9n9yCub1L0x5UwkI92BfFA0aH5G+bJHvv+GVO/SDfMU2qrRSd2HFgfccEVNp6AlXLM
	8QD1LEE6Y26K4qhZOqqxyyy1ZMHPJMm75GHdBeCDKVQEkCFqE2pEM0qFsAqmUUx9QWdUrD
	9tQBnHPacyd/quFTJ2GizJGkwAFUp+zUgQZOX3go6NC8rPmy5oJsCEv0MOjkQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GS438I1KkkYYbfmv3T8S42vDtz8635M+U6FrnsOAbKU=;
	b=vJW5NiXmpVTm4qtX5E7TjuNMzoUKvFXkZeeJWIY2zXqNVt0eWdqMgvHf2vCRjhpSJd9vci
	UgRbrKjTma+Xq0DQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 05/12] io_uring: Use helper function hrtimer_update_function()
Date: Wed,  5 Feb 2025 11:55:14 +0100
Message-Id: <9b33f490fb1d207d3918ef5e116dc3412ae35c1e.1738746927.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746927.git.namcao@linutronix.de>
References: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The field 'function' of struct hrtimer should not be changed directly, as
the write is lockless and a concurrent timer expiry might end up using the
wrong function pointer.

Switch to use hrtimer_update_function() which also performs runtime checks
that it is safe to modify the callback.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index ceacf6230e34..936f8b4106cf 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2421,7 +2421,7 @@ static enum hrtimer_restart io_cqring_min_timer_wakeu=
p(struct hrtimer *timer)
 			goto out_wake;
 	}
=20
-	iowq->t.function =3D io_cqring_timer_wakeup;
+	hrtimer_update_function(&iowq->t, io_cqring_timer_wakeup);
 	hrtimer_set_expires(timer, iowq->timeout);
 	return HRTIMER_RESTART;
 out_wake:
--=20
2.39.5

