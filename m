Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A5722DFAD
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751999; cv=none; b=rQwcQ/qohkF0OSbQ3c1P6VpI+nOnKoK3M9uyNLnu9wEGodbQonso9hvH9/5WxbPatUzQkA0JG57j9dKbvh1Gs5xo4qpC9SeVLkwdqMx3EJrph1a525Q/uloiJJacK2SNPCqobV8OVbme3DcMWoJJt3MEbRqd4bMN/zBz+srDOuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751999; c=relaxed/simple;
	bh=umj4jcpv/MLsNTN8pIO0bwuiPCTcD0wPH4TbqZTwuEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M9PxG1Y/vy86YN89hnM7UGTuxvwEAXgLJ9fF/pv4DX74emq758YsVfP1qOHyNABL/Kk3NAtLBdgVv58l8cGK/jwn1SSnbJ8Ge0rHTZAj0/APWWPgKczaaiIudut2MT7sjzF2QXIswMmqWis1pyHJO6zfOFXjC1C+aqWwa3iIU3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=efG+0M74; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sFMCbW54; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="efG+0M74";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sFMCbW54"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKM/bZYQdTtqH4O/ElpgLxsoHAAVdtMhyNG3BFK3cuY=;
	b=efG+0M743tbmHcUi/oFcmIVsvXUibuy2ehBXg+Ea5HoIh3e84pLOa3ex4KofVXkCbrEZx3
	CM5EXfKfocQ99QyxxcCO71Cxt4S9OamjnfmYuqC0IxvszHlJjk53rKVeP1QplO5uzZ2NEJ
	PmWS4kn9r4C7qopHCyxE+aJ07DEAkLFasZaRWENYKEvMbJn4sN6zRPvZZpk/+BISADUFWa
	6mEMmh71fm44/fHZyzunOxHQ0Sbhr1QF8v5Ai5JgAuuItB6kmApu/cxeHk+yIzaG3yx0RZ
	kcRiAvGNRF/bqM4qKP2baKZdWc6h5MwV3gHoBLWLa6C+ILvpvjzhaRScTvLfEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKM/bZYQdTtqH4O/ElpgLxsoHAAVdtMhyNG3BFK3cuY=;
	b=sFMCbW54tZHNGR+Wk6V7lpMyw+wiKiVmp4LvgT24txMIhk+hPbTM8oGNhzrdZ6tduNF35D
	ZkNofqdtmjX+ElAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 27/31] blk_iocost: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:11 +0100
Message-Id: <196d487c925411923a2d59d4bf5e366b9dac2747.1738746821.git.namcao@linutronix.de>
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
Cc: Jens Axboe <axboe@kernel.dk>
---
 block/blk-iocost.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/blk-iocost.c b/block/blk-iocost.c
index 65a1d4427ccf..ed11438eb4be 100644
--- a/block/blk-iocost.c
+++ b/block/blk-iocost.c
@@ -3004,8 +3004,7 @@ static void ioc_pd_init(struct blkg_policy_data *pd)
 	iocg->hweight_inuse =3D WEIGHT_ONE;
=20
 	init_waitqueue_head(&iocg->waitq);
-	hrtimer_init(&iocg->waitq_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	iocg->waitq_timer.function =3D iocg_waitq_timer_fn;
+	hrtimer_setup(&iocg->waitq_timer, iocg_waitq_timer_fn, CLOCK_MONOTONIC, H=
RTIMER_MODE_ABS);
=20
 	iocg->level =3D blkg->blkcg->css.cgroup->level;
=20
--=20
2.39.5

