Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558DE22CBD8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752420; cv=none; b=DJH4hqSM7NMw+wnODfKVzJvRF/h+BStqsVzRdJo3y2FdV8JM/TSfAkk9dLuOK+NRkzD6xCqpwTnT/7Re7+DgLqYrSn4OH+EnSwQf93CH7sOhuCwDEhNRt1tm/s1zHi4/QnfiOEvyBBYdH77RyGgjY5QknphwPXy7oo1KhQ/mNY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752420; c=relaxed/simple;
	bh=Vy6Rsev/QMn8DRiiVr7pziovYcOCdMou1+YHVrIMG58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=elZR6vddz/5+NqlRL0ae9kf6lpoY63QIjU9iXD51TkekD4iJ1j1c6uD3lKdZJZZFJ1AQPRIG3ho4TglsgNaTrPxYAgJJjnQJu/p0gwdI9TuF9VlntRICQLd/j6e+D1OM2+7BbRAAM5JzPSxTPPAX8s11dWLgf1goPg3qClgrPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4eRoUe7V; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UncooJiC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4eRoUe7V";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UncooJiC"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZkOLTG5yvAUe+G33zkzjKGm4+r+tPlAbm66+s9eFE0=;
	b=4eRoUe7VYpMEQuvJd6BxqDlJaEBhDj+NjAwGGNvVHGrY+hE0SaWXWLXqx9Nr8oiCQPfP6+
	3LnRNW60w//qvTv5NoxGgbhm8MZiecvROX/ZhiT/iuYQW4Daud8pPF7G6wFsJc/+iYSmNV
	qVOjV3CHbDjVaALu1OQFPajnhSUXbcuXPgJF6pNjLvv0WzBGfANDoRK/WECDS6/KkqGmnz
	FhSoEzt8KmgPj224hxLsyqyxkldyv5bxcaPMmlGFvkuBHFUB0aFXxRdWpFlFJkB8xWIGNy
	ZUgk+nT6HksttEaK+3DPHHpV5z0B00cjOIeAbFYKh+W/XKRAuVvdPIkKQZ+Grg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZkOLTG5yvAUe+G33zkzjKGm4+r+tPlAbm66+s9eFE0=;
	b=UncooJiC+v7d/t5tSNVr6cW27S64ZugOHA+NKrTq69kbLd+gI0K8K10QNiU1sXgHaG5OCw
	B8LmcJ/3nSBfmbBA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 11/45] serial: sh-sci: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:59 +0100
Message-Id: <c21664d013015584aebbb6bb8cedd748182cb551.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
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

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/sh-sci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index b1ea48f38248..b72c3bc19bfa 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1702,8 +1702,7 @@ static void sci_request_dma(struct uart_port *port)
 			dma +=3D s->buf_len_rx;
 		}
=20
-		hrtimer_init(&s->rx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		s->rx_timer.function =3D sci_dma_rx_timer_fn;
+		hrtimer_setup(&s->rx_timer, sci_dma_rx_timer_fn, CLOCK_MONOTONIC, HRTIME=
R_MODE_REL);
=20
 		s->chan_rx_saved =3D s->chan_rx =3D chan;
=20
--=20
2.39.5

