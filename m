Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9822F154
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752248; cv=none; b=iXpGIG+lCHaOKZ9vfWzQdtBEsHKN2jLDo9aPGD4BkJ0DBEAQXdZMx9M4zkgLK5GFgIJepifbkwXxd/EuBqE81C1SkPqvI4QlCYi5w5stSNTXjo/pOu2K46n7inEWF1zUUBqOB9TOzN2OfoUX7BRziAeq0dqqf9ptPZc2r3l4WlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752248; c=relaxed/simple;
	bh=p2zQdc/98oATUbsAE3vHMDv3QX9Fqow3DVjUVEqVFFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBJ5F/xzFYc8Mdh4lB2IyIARGxuwIWYu/MG5wdNUNKCrgOGfk87DSKqqd8ttLeu3oQm6pEhFr9NG+XbJkAsd4CS3ypF0bqJ+4+KiTGF0zKkZl+iqXzF9+16zFpmqr/VbwiEiSGNo3IjVn6YR0GkaNAasNmWYhxKiJk3+KC9C5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vrg7V0ab; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bAUBbKwj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vrg7V0ab";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bAUBbKwj"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SPTlKvgRUCafq/9FwoW27geyszg+WVRrGfLeG/pANI=;
	b=Vrg7V0abkEfw3lEA9C8yhx8XVh/ot8MS8wL3mfx74zZKhD/h7SNFyul+yk/dut0rZE8hmg
	TyKD9RcVWIgAW1KELLIbnTjblzQiy3sLq7rAvZr+4L6CgWteH86NSu9Feyh8Ygf3etd4Vr
	3iYXbq75npYgMV200QQU6IeSFd+UwuNUv77FxIixUGfo+KNsySB4kAGeGRryLeMWAgZAvq
	DLb3gGWGkujRTDdTwaeXPZf1dmmboOqrQ+fTIQKu/A8WLoyMTEdy0IMzcQ+U+px51gbqph
	WyZX2gqXGqLU3lm15rT8hhvAr1qEkRz0uRy3GXiFglcBCemaezwGqxJOcm/mQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SPTlKvgRUCafq/9FwoW27geyszg+WVRrGfLeG/pANI=;
	b=bAUBbKwjqNtNzSp1+JUNe9e2FCUMtB4GkbGkx8kt/3AUK8FTbiBUh0EzZFTaVKZiWYzw3A
	xNaFkg0wgGXuXKBw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 18/24] net: wwan: iosm: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:38 +0100
Message-Id: <e42d7d29879017d4b5ca9555f806e782658e3f21.1738746872.git.namcao@linutronix.de>
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
 drivers/net/wwan/iosm/iosm_ipc_imem.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/=
iosm_ipc_imem.c
index 829515a601b3..530a3ea47a1a 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c
@@ -1381,24 +1381,20 @@ struct iosm_imem *ipc_imem_init(struct iosm_pcie *p=
cie, unsigned int device_id,
 	/* The phase is set to power off. */
 	ipc_imem->phase =3D IPC_P_OFF;
=20
-	hrtimer_init(&ipc_imem->startup_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
-	ipc_imem->startup_timer.function =3D ipc_imem_startup_timer_cb;
+	hrtimer_setup(&ipc_imem->startup_timer, ipc_imem_startup_timer_cb, CLOCK_=
MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
-	hrtimer_init(&ipc_imem->tdupdate_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
-	ipc_imem->tdupdate_timer.function =3D ipc_imem_td_update_timer_cb;
+	hrtimer_setup(&ipc_imem->tdupdate_timer, ipc_imem_td_update_timer_cb, CLO=
CK_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
-	hrtimer_init(&ipc_imem->fast_update_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
-	ipc_imem->fast_update_timer.function =3D ipc_imem_fast_update_timer_cb;
+	hrtimer_setup(&ipc_imem->fast_update_timer, ipc_imem_fast_update_timer_cb=
, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
-	hrtimer_init(&ipc_imem->td_alloc_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
-	ipc_imem->td_alloc_timer.function =3D ipc_imem_td_alloc_timer_cb;
+	hrtimer_setup(&ipc_imem->td_alloc_timer, ipc_imem_td_alloc_timer_cb, CLOC=
K_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
-	hrtimer_init(&ipc_imem->adb_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	ipc_imem->adb_timer.function =3D ipc_imem_adb_timer_cb;
+	hrtimer_setup(&ipc_imem->adb_timer, ipc_imem_adb_timer_cb, CLOCK_MONOTONI=
C,
+		      HRTIMER_MODE_REL);
=20
 	if (ipc_imem_config(ipc_imem)) {
 		dev_err(ipc_imem->dev, "failed to initialize the imem");
--=20
2.39.5

