Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A17231C88
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752425; cv=none; b=KH9dNmG9vJQYyYsAawwfkjbdvbhK3aje8ve1IkStO4CPjilLswkRqpufjcCd0grJHTBM/ugTtk9Y27SXt7VSn4450/ex4tgXllJAeIfKO0KCvytKkvfeKrM/uQwbA58A4lOVdE1QYQZwxroA+zXGgXkHO41VAWIcpY6ldHIcUDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752425; c=relaxed/simple;
	bh=2+AVOagAv9Wra+Daw7HSNCfiR+ud8KcVFtNDX2w1N2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uE5ZA4YoozSnbvjiriobW4/CrA/6AXhNF9/dvjGxviwN0cfnjTH4JM14vS7sJVmtiNpv6fIjf6tdVNsA1AxarJI9wrkBtV44fGQ/P9V8hFmfxsyO8R5/qZYjKcFyqPaHqzrmK/y0BmiYpHCd81qG2eMXfZ23QT1YUdZ7ESRoCfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PMC/eQUw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w60jytqP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PMC/eQUw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w60jytqP"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NV6PG0EvKYNo6jsyK94R/Nc6s8RtmSclnNRocz6VOi0=;
	b=PMC/eQUwMKyJquWaf2O3Ms87pm5Nocfi6yifGdAUe6gxSOr+E0EJxC8O3ll9Z6ae2zurMs
	Yv5bAh6ro6dfDHpQw+PUrDoL0kd/X+O3kIBerftMHM1smC8pLIHFCMqKGeGoTavQBzRIn2
	rgx7Bwgv1tbhK4shikDSfNFLT/K8YFh76NDqKQNzdz5e3YJUrb0nYKVN/osGWt4HFSKiH1
	EPRWrVwAPXLebjEP+wUtHaOLnTpXjXQb8Lt61nL1F1kGbZWahls+oaqrcMjGqAvuHMC0xA
	hilpsdhCtzgUJ8KJ7/sFQ37OJAyC5BEBv8zIppI6GAAFzrCGMYDif9uiDResdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NV6PG0EvKYNo6jsyK94R/Nc6s8RtmSclnNRocz6VOi0=;
	b=w60jytqPwduhDa9IZEhA10yxRy5sFNZ1ZKMQlSDyWAob3HSY/Z8orBZTvQNuBnPIDbXMS/
	5kqLUqszaVOiHfDA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 23/45] media: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:11 +0100
Message-Id: <c725ad8d0ecac3cf6bbc532af567e56d47a6b75c.1738746904.git.namcao@linutronix.de>
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

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-pin.c                     | 3 +--
 drivers/media/pci/cx88/cx88-input.c                  | 3 +--
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 4 ++--
 drivers/media/rc/pwm-ir-tx.c                         | 3 +--
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-=
pin.c
index a70451d99ebc..bebaa40e0eb5 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -1346,9 +1346,8 @@ struct cec_adapter *cec_pin_allocate_adapter(const st=
ruct cec_pin_ops *pin_ops,
 	if (pin =3D=3D NULL)
 		return ERR_PTR(-ENOMEM);
 	pin->ops =3D pin_ops;
-	hrtimer_init(&pin->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	atomic_set(&pin->work_pin_num_events, 0);
-	pin->timer.function =3D cec_pin_timer;
+	hrtimer_setup(&pin->timer, cec_pin_timer, CLOCK_MONOTONIC, HRTIMER_MODE_R=
EL);
 	init_waitqueue_head(&pin->kthread_waitq);
 	pin->tx_custom_low_usecs =3D CEC_TIM_CUSTOM_DEFAULT;
 	pin->tx_custom_high_usecs =3D CEC_TIM_CUSTOM_DEFAULT;
diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/c=
x88-input.c
index a04a1d33fadb..b9f2c14d62b4 100644
--- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -190,8 +190,7 @@ static int __cx88_ir_start(void *priv)
 	ir =3D core->ir;
=20
 	if (ir->polling) {
-		hrtimer_init(&ir->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		ir->timer.function =3D cx88_ir_work;
+		hrtimer_setup(&ir->timer, cx88_ir_work, CLOCK_MONOTONIC, HRTIMER_MODE_RE=
L);
 		hrtimer_start(&ir->timer,
 			      ktime_set(0, ir->polling * 1000000),
 			      HRTIMER_MODE_REL);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers=
/media/platform/chips-media/wave5/wave5-vpu.c
index d1320298a0f7..8479dc9c9a8f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -269,8 +269,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	dev->irq =3D platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling=
\n");
-		hrtimer_init(&dev->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
-		dev->hrtimer.function =3D &wave5_vpu_timer_callback;
+		hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_callback, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL_PINNED);
 		dev->worker =3D kthread_run_worker(0, "vpu_irq_thread");
 		if (IS_ERR(dev->worker)) {
 			dev_err(&pdev->dev, "failed to create vpu irq worker\n");
diff --git a/drivers/media/rc/pwm-ir-tx.c b/drivers/media/rc/pwm-ir-tx.c
index fe368aebbc13..84533fdd61aa 100644
--- a/drivers/media/rc/pwm-ir-tx.c
+++ b/drivers/media/rc/pwm-ir-tx.c
@@ -172,8 +172,7 @@ static int pwm_ir_probe(struct platform_device *pdev)
 		rcdev->tx_ir =3D pwm_ir_tx_sleep;
 	} else {
 		init_completion(&pwm_ir->tx_done);
-		hrtimer_init(&pwm_ir->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		pwm_ir->timer.function =3D pwm_ir_timer;
+		hrtimer_setup(&pwm_ir->timer, pwm_ir_timer, CLOCK_MONOTONIC, HRTIMER_MOD=
E_REL);
 		rcdev->tx_ir =3D pwm_ir_tx_atomic;
 	}
=20
--=20
2.39.5

