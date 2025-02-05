Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE61922E3E1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752247; cv=none; b=sUXlL9BNiQ1jmwCQcyWyBfgMPuc8bdY1R7TjzQuyku/6sh/ULVlkQde5tZUv+1mujY+V4WbRp3sfJehhm487zLy8OmHSMXQM8np9Hh00oAF6rxlr1SYgCaWTpTYEVr1sBLTQQF2L4hFe1rUvHg8fo+mFnUp5LC2LNrYEzJNZOBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752247; c=relaxed/simple;
	bh=OcgxTMkYzu0ag8WJQYBKRWxgz+q/5RYCbC1oVO5V7uU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lvmAsn4l8zB2WiicNDfukInYf23zkO5EIg2086OYdtZjxchD6jzLm5eRUa04Pf6LXRsuc7BITl6hAH8EKlCkO8GgDEIKFawwCiafbkWxu5RF6u2tZesY3HuBMv8YzXSimo5rx6cLudFS93XZgOdEiOl66AE4WBhtugBLpVJ/dCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lcnZN1tD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KUPHA5Yw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lcnZN1tD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KUPHA5Yw"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fILhM7WaudL/ImWto4sWqtAsT0INOvcTAczJC457l1k=;
	b=lcnZN1tDsHDxngQ9Xrzv6hL5SPepoJSRL8BfTlceu6+G5XyJmuivE5UqCIttuJOVVixEL2
	i6OLioat56maLbbWQ3vn3wp+rZ1jNc0cVqlGypygbHDM0/9NqUTm/1fCUe+VWyUIr2fuCs
	pbidiKhYF0JY9H54Wzs2b4uz1FnjGRWBbfzpiN4eg7Li9lb38az6so9Y47AP41UTv1jVTU
	AbUby/z/JUFvcSxLUCmrEJTI48EHskWbn2q8Kf0cu+EEPlDhB++fnXEnVfe5KHoy3jW27e
	YpmsfG+xkMpSJFSjsFyFy5W2aFc5qakb7+P+gGbMQr/ChMdMhri+kQzjuybLWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fILhM7WaudL/ImWto4sWqtAsT0INOvcTAczJC457l1k=;
	b=KUPHA5Yw0zqLEkXawpQsLgdYg0D2UMx2GxTELpseuzJNuLjjDpsUm/halfDdUzKBZhDJ4T
	yZ/IS8AAvnmjVoAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 14/24] net: mvpp2: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:34 +0100
Message-Id: <44e2ebca1a3c1b90213cdb79f7a19ebe0ae70510.1738746872.git.namcao@linutronix.de>
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
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/=
ethernet/marvell/mvpp2/mvpp2_main.c
index dd76c1b7ed3a..3c7b43712d25 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -6985,9 +6985,8 @@ static int mvpp2_port_probe(struct platform_device *p=
dev,
 		for (thread =3D 0; thread < priv->nthreads; thread++) {
 			port_pcpu =3D per_cpu_ptr(port->pcpu, thread);
=20
-			hrtimer_init(&port_pcpu->tx_done_timer, CLOCK_MONOTONIC,
-				     HRTIMER_MODE_REL_PINNED_SOFT);
-			port_pcpu->tx_done_timer.function =3D mvpp2_hr_timer_cb;
+			hrtimer_setup(&port_pcpu->tx_done_timer, mvpp2_hr_timer_cb, CLOCK_MONOT=
ONIC,
+				      HRTIMER_MODE_REL_PINNED_SOFT);
 			port_pcpu->timer_scheduled =3D false;
 			port_pcpu->dev =3D dev;
 		}
--=20
2.39.5

