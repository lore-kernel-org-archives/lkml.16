Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C346236A9E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752428; cv=none; b=rno+BuafkPB6frXcuH0UYtPjgn5D6N++C+Rc33CCpqKKRZIDHT2FRt+Zd2gWhD16eohinyB5ZCKj4FH+gLFhJDLvxj3h737AUV3q3srCEQWcPlBa8LOYR2z46EoiyWkyRQQ0cVZZfpdWVLukGd0ICDlFOOUzzQn2Yezx3hpQYNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752428; c=relaxed/simple;
	bh=LhDJ2dWnNlrjrCuXiD0RHqTFfK590AExB3NNRRld7WE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RPb4HMCY6W5E28F+E9lk2Vsl6wJre/rHamOM4QAIqirqXyl4N8A/+ynga1OxkbjTkOoetUUKa2zpdx3zbDa96omE8KpUL+a7GKl4qoGnhrkoOYkU7KcVPMUZvRH+qi802MfnIZ3sGmC8cmgpJKIpDZupU1g54WOArmW3hAPNnA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Dw0EC/HZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fDf5enej; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Dw0EC/HZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fDf5enej"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMp8IZm9wwaUxvFRFgmz5genTLj6SdAv4afa2x4sF9E=;
	b=Dw0EC/HZTemfVjuowL3DpubDNMPdNiJDD9dySnwtGqUsnn96MLEXFM3qwUrwpzESr01lLH
	LRXUFpDkV8nIO77VChCGdmqDBqUHpqFNxk8Qqypzv/5fniXjjYRr7sTmzAz/js56dFCAq5
	51y0nBsU30/SOc2rt5W2Wi6D0JrawXoGBBA8ady+hAL0GZePV0D9N+G3Rg4Cp8n+8v96lA
	Q3hHeQkwNuavscE2hxoX4isZ7aqFF44WivYOLNne7Ihq9XjU0T89da5numg43HYjCk6CLk
	D4HoXtFM8lL7CzUH+5VVX9SSHnFusgV/rvHfPUscpFZwHOxphy5ecZyPj7siAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMp8IZm9wwaUxvFRFgmz5genTLj6SdAv4afa2x4sF9E=;
	b=fDf5enejvOQBlzN/B50myOQY7vwKHGYOR3OX2o0qSj06GiQiCpIhlFhEU3ypuyhjJ+ItUS
	QX6q9PZVY23oWlDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2 37/45] drm/msm: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:25 +0100
Message-Id: <2689e1ad4105f415ce8cd9e426873d9ac479dc36.1738746904.git.namcao@linutronix.de>
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
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/msm/msm_fence.c    | 3 +--
 drivers/gpu/drm/msm/msm_io_utils.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fenc=
e.c
index 1a5d4f1c8b42..d41e5a6bbee0 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -65,8 +65,7 @@ msm_fence_context_alloc(struct drm_device *dev, volatile =
uint32_t *fenceptr,
 	fctx->completed_fence =3D fctx->last_fence;
 	*fctx->fenceptr =3D fctx->last_fence;
=20
-	hrtimer_init(&fctx->deadline_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	fctx->deadline_timer.function =3D deadline_timer;
+	hrtimer_setup(&fctx->deadline_timer, deadline_timer, CLOCK_MONOTONIC, HRT=
IMER_MODE_ABS);
=20
 	kthread_init_work(&fctx->deadline_work, deadline_work);
=20
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_i=
o_utils.c
index afedd61c3e28..a6efe1eac271 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -135,8 +135,7 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *wor=
k,
 			   clockid_t clock_id,
 			   enum hrtimer_mode mode)
 {
-	hrtimer_init(&work->timer, clock_id, mode);
-	work->timer.function =3D msm_hrtimer_worktimer;
+	hrtimer_setup(&work->timer, msm_hrtimer_worktimer, clock_id, mode);
 	work->worker =3D worker;
 	kthread_init_work(&work->work, fn);
 }
--=20
2.39.5

