Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD99D22C352
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752426; cv=none; b=NLBWlD+G1iT8Y+7aoYryGKJc3k85JNNJxWtHCKilTvy8uBNwS42rBdCAMUE+EEI7sfmacci0DtpZFk/UvOxWyC8UED6p0UfdecPem5+2TBeuosKjxEh8izB/fSNLj5kSqjdZba3665pU75BF0McOsLdEwpo0IqM/MOIHmc26ATI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752426; c=relaxed/simple;
	bh=Zsy15+u9563Uf83md82evxZVNbHG99m61yjPdr7luYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVdhr//AkXavBM0XJojPU7iY9FS2WyNATlMu9TwQAxk4w8b1dl8uN90F7hjEUa7Wy1Lt/Z/iPx2kVsM8+D0cf4N6sw4NT7fsuvEcgbvHHK7jPwG8cyorhC4dDqbubEXDMNThfWiLY1Gi0weUZvMFjlz2t3B+A6QLubwsIzceKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u/53eyTM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v+4muJMV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u/53eyTM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v+4muJMV"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7E8387BNF+Bhe+JKx5HB6LB3m0HelGQPRvQQfMKMkOE=;
	b=u/53eyTM3tgR28Q49yVf29PlVytH32NgJ7oMZI4f1FQKl9GDhKrSrQ1meQjkGaB/8/WMF7
	TTzCHfsIKCs1EtmvTe1NUX20ukg8mKQ6tJNrkFDAfAjai7FYThVHZJAZmhz/YFlYYfvfEi
	cUZ73DC5AcDczWFg4Ub96JNpA//Nc+fU7joGmxshFXh9TN//kNidbz8wNZ0n4iRf/+nzPg
	OPDUzElLp4XfbM03jh51n4KVcywNTJRXTf9N6T7N+Cx5qHjby9Ne9a0rhuowUjdW2bQZ+N
	f4AqpgiODqad4v9hNsnvPZJHURpQ7DykJ5Gaisz7e5epvaYlAtoyvqDV6NHJTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7E8387BNF+Bhe+JKx5HB6LB3m0HelGQPRvQQfMKMkOE=;
	b=v+4muJMVV3Ki12t0+rebP1jGsmRjXHOcMZOct6ll03OfQgc9lZtI2gmeHxrmtDh6VMWsQ6
	n2kPlymc3/UamuAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: [PATCH v2 29/45] stm class: heartbeat: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:17 +0100
Message-Id: <c822671342e6ca0437b25f8e24935f09821e389f.1738746904.git.namcao@linutronix.de>
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
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
---
 drivers/hwtracing/stm/heartbeat.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/stm/heartbeat.c b/drivers/hwtracing/stm/hear=
tbeat.c
index e9496fe97baa..495eb1dc8ac5 100644
--- a/drivers/hwtracing/stm/heartbeat.c
+++ b/drivers/hwtracing/stm/heartbeat.c
@@ -81,10 +81,8 @@ static int stm_heartbeat_init(void)
 		stm_heartbeat[i].data.type	=3D STM_USER;
 		stm_heartbeat[i].data.link	=3D stm_heartbeat_link;
 		stm_heartbeat[i].data.unlink	=3D stm_heartbeat_unlink;
-		hrtimer_init(&stm_heartbeat[i].hrtimer, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_ABS);
-		stm_heartbeat[i].hrtimer.function =3D
-			stm_heartbeat_hrtimer_handler;
+		hrtimer_setup(&stm_heartbeat[i].hrtimer, stm_heartbeat_hrtimer_handler,
+			      CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
=20
 		ret =3D stm_source_register_device(NULL, &stm_heartbeat[i].data);
 		if (ret)
--=20
2.39.5

