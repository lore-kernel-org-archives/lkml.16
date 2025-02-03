Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B120E02B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605596; cv=none; b=EQp8Laqdy8hu+0iiHTvQuw6BfLhdd0UPe5gjjB/3LnKjKmhciMNO4EsfMmQ96SW7pl1MDXRxZrExfWfFOcCvPjS8nnFfMAnvprtH5WRmBIClFn7TZNZ+OOHLph2poHVnuE0qPnIHGsRAHxEUYlaGeNPwCyAxJGUDEwgSkR9cHKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605596; c=relaxed/simple;
	bh=eTTFqS+FDBJgjyjeK2bhzgwwvjc0AwSc9SD+ozwgRWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emoMgsQ6MVRvY81vLyUbpBFgQWuWYfz8hjTenZVIJRNLDxibN9cVvXu9xrw2KghyGieMC3Wcf1bFyusGzfp65KUFsTcsTLmUlJcFV+FdiQyJ8gI8ktif776UhUYofCXGxExTN6gnIx4g5Ipp6KzSpZoJ3VtRwaHGIUyAdRyVJJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Faut5tUz; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Faut5tUz"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YmvQw17y6zlgTwv;
	Mon,  3 Feb 2025 17:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738605589; x=1741197590; bh=oKpq2
	crbPKDeRxiU8ifsMb+U1BdvlgaZko0DJia2ShQ=; b=Faut5tUz59TGdNzyLIR3v
	SBqAr6IlZUPaBCP+6S9mZDvwBw4+R4CggDg6/Hyx4SJUwFMEAYINM5z0MyJpM1XX
	juS53iCKQ2LfmH6zyiCkdZZGT1uXX/U009fxdM5EqelC4eZ9lcDMDWHyUGMqRX5b
	+ED8h/LeUnr9OrcL2jccoNGo1q0QUkjPllSSJz3pb7tcguy14tCdsxVw13OgCrtH
	dZ7EkduzLgeNcye8RZBds+50H/6fAg2j7ehfZZuVj/1CWGdhB8SyJDogeNi3Qkf3
	QyWo4yStMiXmf2xE6RJrERoTTE+7cUh9/46k9jzpzq2D+ApFQ6MlgDWpJSLXpJeN
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Co10pm0A-LOp; Mon,  3 Feb 2025 17:59:49 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YmvQq6hlRzlgTx8;
	Mon,  3 Feb 2025 17:59:47 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH 4/5] irq: Remove the IRQ_GC_INIT_NESTED_LOCK flag
Date: Mon,  3 Feb 2025 09:59:38 -0800
Message-ID: <20250203175939.3133477-5-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250203175939.3133477-1-bvanassche@acm.org>
References: <20250203175939.3133477-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Remove the IRQ_GC_INIT_NESTED_LOCK flag since the previous patch removed
all code that tests this flag.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpio/gpio-mxc.c            | 3 +--
 drivers/gpio/gpio-mxs.c            | 3 +--
 drivers/irqchip/irq-imgpdc.c       | 3 +--
 drivers/irqchip/irq-renesas-irqc.c | 2 +-
 include/linux/irq.h                | 4 ----
 5 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 619b6fb9d833..403e76d283a9 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -369,8 +369,7 @@ static int mxc_gpio_init_gc(struct mxc_gpio_port *por=
t, int irq_base)
 	ct->regs.ack =3D GPIO_ISR;
 	ct->regs.mask =3D GPIO_IMR;
=20
-	rv =3D devm_irq_setup_generic_chip(port->dev, gc, IRQ_MSK(32),
-					 IRQ_GC_INIT_NESTED_LOCK,
+	rv =3D devm_irq_setup_generic_chip(port->dev, gc, IRQ_MSK(32), 0,
 					 IRQ_NOREQUEST, 0);
=20
 	return rv;
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 024ad077e98d..81f48727bff9 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -221,8 +221,7 @@ static int mxs_gpio_init_gc(struct mxs_gpio_port *por=
t, int irq_base)
 	ct->regs.disable =3D PINCTRL_IRQEN(port) + MXS_CLR;
 	ct->handler =3D handle_level_irq;
=20
-	rv =3D devm_irq_setup_generic_chip(port->dev, gc, IRQ_MSK(32),
-					 IRQ_GC_INIT_NESTED_LOCK,
+	rv =3D devm_irq_setup_generic_chip(port->dev, gc, IRQ_MSK(32), 0,
 					 IRQ_NOREQUEST, 0);
=20
 	return rv;
diff --git a/drivers/irqchip/irq-imgpdc.c b/drivers/irqchip/irq-imgpdc.c
index 85f80bac0961..c6bb50af2bb3 100644
--- a/drivers/irqchip/irq-imgpdc.c
+++ b/drivers/irqchip/irq-imgpdc.c
@@ -385,8 +385,7 @@ static int pdc_intc_probe(struct platform_device *pde=
v)
 	 * The second one for syswake irqs (edge and level chip types)
 	 */
 	ret =3D irq_alloc_domain_generic_chips(priv->domain, 8, 2, "pdc",
-					     handle_level_irq, 0, 0,
-					     IRQ_GC_INIT_NESTED_LOCK);
+					     handle_level_irq, 0, 0, 0);
 	if (ret)
 		goto err_generic;
=20
diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-ren=
esas-irqc.c
index cbce8ffc7de4..7ecd51e90daa 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -178,7 +178,7 @@ static int irqc_probe(struct platform_device *pdev)
=20
 	ret =3D irq_alloc_domain_generic_chips(p->irq_domain, p->number_of_irqs=
,
 					     1, "irqc", handle_level_irq,
-					     0, 0, IRQ_GC_INIT_NESTED_LOCK);
+					     0, 0, 0);
 	if (ret) {
 		dev_err(dev, "cannot allocate generic chip\n");
 		goto err_remove_domain;
diff --git a/include/linux/irq.h b/include/linux/irq.h
index 8daa17f0107a..c297fdeb61c6 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1073,16 +1073,12 @@ struct irq_chip_generic {
 /**
  * enum irq_gc_flags - Initialization flags for generic irq chips
  * @IRQ_GC_INIT_MASK_CACHE:	Initialize the mask_cache by reading mask re=
g
- * @IRQ_GC_INIT_NESTED_LOCK:	Set the lock class of the irqs to nested fo=
r
- *				irq chips which need to call irq_set_wake() on
- *				the parent irq. Usually GPIO implementations
  * @IRQ_GC_MASK_CACHE_PER_TYPE:	Mask cache is chip type private
  * @IRQ_GC_NO_MASK:		Do not calculate irq_data->mask
  * @IRQ_GC_BE_IO:		Use big-endian register accesses (default: LE)
  */
 enum irq_gc_flags {
 	IRQ_GC_INIT_MASK_CACHE		=3D 1 << 0,
-	IRQ_GC_INIT_NESTED_LOCK		=3D 1 << 1,
 	IRQ_GC_MASK_CACHE_PER_TYPE	=3D 1 << 2,
 	IRQ_GC_NO_MASK			=3D 1 << 3,
 	IRQ_GC_BE_IO			=3D 1 << 4,
