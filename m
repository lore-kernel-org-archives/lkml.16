Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2705522CBF1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752240; cv=none; b=NbKVbjxmk8bBxDsQ9++y7Kkes/D/SJVtbVkwhSdv6tycylbEBbrbD81NaYqrg5qcLsMMeGPNT/a5jNvNY4Ko3mSN5kiknr8df63ZP1AFIW7qUp/AmKefw51CEd1mn5uZ4x7JLzKNOu5hsGx7GKlykaC/eprnRU/HPIKxO89UZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752240; c=relaxed/simple;
	bh=+JdS25xk+TqOfQJHkLDT0aZEdhXfu19wKe+qt+LGE3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K4je/3Kb6ZFEl5n0u9vPcVLP75sqdG7xuiJIA0J5gEZ6wOFCyI8jNkZkTFw0R5SVMFgNULO8uj/dyUh3iC0s5BFyJLsdSFNnfUx9K/rDhLKJDRy7+1p8x0IvjdJb4XX/5rW9kYm5HVdJvkagEv7srd+PBLQpT1uxfpuV8S3tRbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tHKQBygT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MFO20ue/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tHKQBygT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MFO20ue/"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UujHhq6YPDPotMt/DdpLHs0nbxctZ3RHVGws7AIL4Tw=;
	b=tHKQBygTwdLu0Lq5EUJloPF9BuuoHBXM044qPqQyBdlAkxfwt89Udu8O89YxTyu8620PWi
	gr6xaWrkncfv8fpn9TaclLLTMFiEVTABXHsdJ1fGuOJWHm053Pth17l9f/Yu9LaFIxlmzF
	lAdBjtg3DuUml4kU+rHfdpdGoDD0z33Y7BcdHFLh5W8KSjGDC5yL8iTuZ3+zzZYyxEoiiW
	VogoTim++oMUsI8uOrkzhHj9gDN5oZxwW1hWvRI59APmie22lmVeVUXwr7SfIU2sO3z0Ry
	XoVZf+xIz2EypLAhC+DzHV2RHD8pqSZK+0nHH8yNrSAgg4KStUYf8QIdkW93oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UujHhq6YPDPotMt/DdpLHs0nbxctZ3RHVGws7AIL4Tw=;
	b=MFO20ue/r9//pAnZM9IC5qcgdW+XArcRAepk4U96EJLir0xS1e5BM1akE6XgrRfFEyTZta
	BRyDsk2jx7RM9SBA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 01/24] netdev: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:21 +0100
Message-Id: <861d9b287f2b5206b853dbcc0f302127f2a7f8ac.1738746872.git.namcao@linutronix.de>
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
 net/core/dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index c0021cbd28fc..cae7fd3e5089 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6931,8 +6931,7 @@ void netif_napi_add_weight_locked(struct net_device *=
dev,
=20
 	INIT_LIST_HEAD(&napi->poll_list);
 	INIT_HLIST_NODE(&napi->napi_hash_node);
-	hrtimer_init(&napi->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
-	napi->timer.function =3D napi_watchdog;
+	hrtimer_setup(&napi->timer, napi_watchdog, CLOCK_MONOTONIC, HRTIMER_MODE_=
REL_PINNED);
 	init_gro_hash(napi);
 	napi->skb =3D NULL;
 	INIT_LIST_HEAD(&napi->rx_list);
--=20
2.39.5

