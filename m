Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D014E22CBDE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751995; cv=none; b=jFO99eXB4r8SPFzZe0NEZ7L89uIVzaEjDwLB/zlX1cDANeh05sCGBCoKRlYDpYbBh7juQFRNCH0wfdSRMnww9KBvRtr7O7dD3fmbA25X0a2MclTIcx5eG37u8P782VkZWnwOTInzb4sqyBUveKD355rNNh67MJygWbxTTmFkyF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751995; c=relaxed/simple;
	bh=aI9capqMT/movR6q5LrdvKkRWo1xK8Pz4BBkZC9Ixm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u1an9YMmksc1/YoFB3RGv2t9q5te7jxYk7XiYmW+X9Wdh0PsScQ33RV5mpxNb7WPHBpeNG5N3P8WJHfNg2iM7LgPZnZOyJpiZgcoI90F+tr2m0ARNTilWtmId/UPbyFHneddoZ1OhkWQ1beBSRCsq7vAeq9RFC2R+VghmseWaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HVcd4JB+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=upMpXhW7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HVcd4JB+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="upMpXhW7"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vm3nYOWTnE711510Flxu5XSa1LkABAv3jwTcasCXcLA=;
	b=HVcd4JB+7vM1giYr/3wgLGjYwIftPwFsHAEUCTj1nlR3t2oiL5XLBBUlSpiMQ/140d4S5+
	9+/DjHbsrE3MR7vvJU2l1w96LAHpaZsNWH4jEne+a61IsxMveO2Y4beBMPIdueJOPMJ9T7
	O90UuEp8QyTmroU7ZtEwb6x5hvLo4JclAlejtrj5f87Mgh8Dix3MmnVZlG1XwEJF906Mv2
	vB0+7z2tA3TqJDrUkq8LBWdud1v42nlUaKaFSDLfRGq7f6EK0J5iBCyFkq/eiFTjsgmh5h
	OPcniJXpW3Xz41PSjgqzt4YpJpEdTTo82GVa7qH3V+vMItZfbPJkAZsLs1LZtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vm3nYOWTnE711510Flxu5XSa1LkABAv3jwTcasCXcLA=;
	b=upMpXhW7e0wn9eYJoM8ZFNsMoULi4JBw+YsmizyhMEbj497uF4cb6ot6oXaFRxTM5ZKhdJ
	xXula0+DxP9qGTCA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH v2 14/31] mm/slab: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:58 +0100
Message-Id: <030065d66630068f788caf9df15756fad404e754.1738746821.git.namcao@linutronix.de>
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

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 mm/slab_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 4030907b6b7d..59578dafbf37 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1887,8 +1887,8 @@ run_page_cache_worker(struct kfree_rcu_cpu *krcp)
 				&krcp->page_cache_work,
 					msecs_to_jiffies(rcu_delay_page_cache_fill_msec));
 		} else {
-			hrtimer_init(&krcp->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-			krcp->hrtimer.function =3D schedule_page_work_fn;
+			hrtimer_setup(&krcp->hrtimer, schedule_page_work_fn, CLOCK_MONOTONIC,
+				      HRTIMER_MODE_REL);
 			hrtimer_start(&krcp->hrtimer, 0, HRTIMER_MODE_REL);
 		}
 	}
--=20
2.39.5

