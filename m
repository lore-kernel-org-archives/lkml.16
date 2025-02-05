Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E42623A58D
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752430; cv=none; b=CerD9OCLQEpq7oKrS/zkX9pK8mb/cPbZdPO6bTYI2UNAbzlz4jC6M5htHK7kKyJhCxVknJ6vBIEBDdhe4mY4n1B1v4NM2da1IPO8So84PG2XmvjuAbBHnhpdUzAeZo35AAohb2fv7dcUipHKIHixjNatMth0itkTsoUjBzdASM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752430; c=relaxed/simple;
	bh=6gyVfc9YT9K9XE5HuqAO+Ehf/vRd5tfwbetFB1Bie4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UNDBeWsaZuTnAUJxtenWtkx7yVpplXc8PeJ3eu6XHC5sIBCY6gyzLbEtumhn7Vb7O6tSDBoaGiMbMMSyNBho/DXX06Fya3PWFyD5qQRs1HO01NBOMxwtgT2UT20buIs+TqIMn+qfppmpCPVmm9BHSNJ67eY+gvA9z8rmfHRn+cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ve9gsEkN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G3n2zMVt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ve9gsEkN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G3n2zMVt"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RexfgyQiaO2DZFgKT52XT9v0CgK6EZGqRaKJOG68cgQ=;
	b=Ve9gsEkNIgbvKBaE3EUwuZ4Svjd895uCVqUzC5LWb/sEH+lzJOmHI5XrESnl+MumzrolF8
	5HDR20l2ximG6Gxf5N8PPFxGLvGc/BNgIvN9xVjrG7xK2uzy+TG1fDyggK8zrFG7t15dXA
	P/oY3vNmniJ/b1aRkEH6xyVPdQ9IjOvflHZSW67VDtkBF3nS0nWLej5YogkEqb5MHmigLW
	tjyzHoHMN6NlgTci2UqZ7WuuIaijvGB9yyHINwEvezSzg+J7ybL4lX4FPaJXcAQ4c6bYLE
	StromYYnr5pjIi11KEy4mp4vdK4+DapjNiibYVszVjrAdPXUjIcXPGy28nYsPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RexfgyQiaO2DZFgKT52XT9v0CgK6EZGqRaKJOG68cgQ=;
	b=G3n2zMVtQ3W7H2g6s/g9EBePXw+AfF/ha1bvvTByRP2eKqByM2So0jWiC8CrJqZZOFCE+P
	MetdrYWMKmeLFLBg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v2 43/45] pwm: gpio: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:31 +0100
Message-Id: <7b7115da84372a49e36a0ac1a5ce553129c3ce0b.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: "Uwe Kleine-K=C3=B6nig" <ukleinek@kernel.org>
---
 drivers/pwm/pwm-gpio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-gpio.c b/drivers/pwm/pwm-gpio.c
index 9f8884ac7504..5f4edeb394a9 100644
--- a/drivers/pwm/pwm-gpio.c
+++ b/drivers/pwm/pwm-gpio.c
@@ -207,13 +207,12 @@ static int pwm_gpio_probe(struct platform_device *pde=
v)
 	chip->ops =3D &pwm_gpio_ops;
 	chip->atomic =3D true;
=20
-	hrtimer_init(&gpwm->gpio_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	hrtimer_setup(&gpwm->gpio_timer, pwm_gpio_timer, CLOCK_MONOTONIC, HRTIMER=
_MODE_REL);
+
 	ret =3D devm_add_action_or_reset(dev, pwm_gpio_disable_hrtimer, gpwm);
 	if (ret)
 		return ret;
=20
-	gpwm->gpio_timer.function =3D pwm_gpio_timer;
-
 	ret =3D pwmchip_add(chip);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "could not add pwmchip\n");
--=20
2.39.5

