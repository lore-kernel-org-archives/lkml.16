Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020B23A578
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752430; cv=none; b=OSYe+xhN2VgNKvq1ljkPzJkmFpiDiMp4mle18ht6MV3My1sL+CfU9DRf2rbUxDqGbFBzzSzvTQi5JH6OOBsHX11BnWyWViAY7mu50jZH6w8FmZEMZgGDc7TzLpWa6DmKiBNWyFupSQPJBcwfl6RI8LgEpHI7qLUStVH0s8kPxtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752430; c=relaxed/simple;
	bh=qjj7QTjN0JQEfpvGir8AMOKa51Z/zGUhegFk2vIHiJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eYh4hM6FhF1VO+XtcoAtIc+w2TJ4xnBlQeGntdHs7jrBKGwOsGSy++uXGrC9dew6Rm3/6797R9wA2016bYyKj3Hm6h5HVj4s39s+dSvudA+hwxW5ejD7p87YYrQQCqltE8ZwJ3ACnUTpENRLDwFLBHhN0DO/a9ysXqhK/Mul8Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IJLpAxM0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xloWB3JC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IJLpAxM0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xloWB3JC"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xkbgVNW2zHU50lrtVMoPPpUuWMccik3qKj1ZAWAip0=;
	b=IJLpAxM0hU3gxbubD86UzXy7xgc2ba9hb1Ax8yq+vaS/nQbz+YbXdRZASrc6ADxmfITzDz
	nzX/csq+p3g/NM3Ag6la4Shf+ms7xlaP9U2ztK6300ZnwSMTs+KjLWj48y58ctuCxq/aAk
	YXn5W5GdtEBT2TPCBzH6cdQwfbEHdPrpFV/5nMvXIkU78YT5hWFtUmhpG+vV2yHrdd986I
	vvxrhDkFe4hAU7vKeNhflip+3+N2yIOaijI71t729NuwBUbaIMr5NBvZqxXdJjEIuqa5s2
	y0hAd5Eq7FhVjTcIsMQ4z+LVyD4nsU4+eqrhdmxYss9RY5xvsFrRoJbPnKwEww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xkbgVNW2zHU50lrtVMoPPpUuWMccik3qKj1ZAWAip0=;
	b=xloWB3JCct6cAkPoZkDqhxadOemgeNjgwGK+klrzEw4xHClY4oBYuW7nThntRw4ytMxMd/
	HCZ8sY01GZx4RbAA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH v2 42/45] RDMA: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:30 +0100
Message-Id: <37bd6895bb946f6d785ab5fe32f1a6f4b9e77c26.1738746904.git.namcao@linutronix.de>
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

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
---
 drivers/infiniband/hw/hfi1/init.c | 5 ++---
 drivers/infiniband/sw/rdmavt/qp.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/init.c b/drivers/infiniband/hw/hfi1=
/init.c
index cbac4a442d9e..d6fbd9c2b8b4 100644
--- a/drivers/infiniband/hw/hfi1/init.c
+++ b/drivers/infiniband/hw/hfi1/init.c
@@ -635,12 +635,11 @@ void hfi1_init_pportdata(struct pci_dev *pdev, struct=
 hfi1_pportdata *ppd,
 	spin_lock_init(&ppd->cca_timer_lock);
=20
 	for (i =3D 0; i < OPA_MAX_SLS; i++) {
-		hrtimer_init(&ppd->cca_timer[i].hrtimer, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_REL);
 		ppd->cca_timer[i].ppd =3D ppd;
 		ppd->cca_timer[i].sl =3D i;
 		ppd->cca_timer[i].ccti =3D 0;
-		ppd->cca_timer[i].hrtimer.function =3D cca_timer_fn;
+		hrtimer_setup(&ppd->cca_timer[i].hrtimer, cca_timer_fn, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL);
 	}
=20
 	ppd->cc_max_table_entries =3D IB_CC_TABLE_CAP_DEFAULT;
diff --git a/drivers/infiniband/sw/rdmavt/qp.c b/drivers/infiniband/sw/rdma=
vt/qp.c
index e6203e26cc06..614009fb9632 100644
--- a/drivers/infiniband/sw/rdmavt/qp.c
+++ b/drivers/infiniband/sw/rdmavt/qp.c
@@ -1107,9 +1107,8 @@ int rvt_create_qp(struct ib_qp *ibqp, struct ib_qp_in=
it_attr *init_attr,
 		}
 		/* initialize timers needed for rc qp */
 		timer_setup(&qp->s_timer, rvt_rc_timeout, 0);
-		hrtimer_init(&qp->s_rnr_timer, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_REL);
-		qp->s_rnr_timer.function =3D rvt_rc_rnr_retry;
+		hrtimer_setup(&qp->s_rnr_timer, rvt_rc_rnr_retry, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL);
=20
 		/*
 		 * Driver needs to set up it's private QP structure and do any
--=20
2.39.5

