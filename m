Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD720E318
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605597; cv=none; b=kag/FMBefRRlRnYvfYHTi8tcgM3HwcrFInsPeYHRlvikIpq35b9vme1w8b1BsAsLBqLbhXNMT/hTJS+r2iauGAZWa72XxUg9E1ZBMmt1L6FeODqKspPPamI7phlAyB4NwxUjXgB0vux3jKaKRUkK2JXcgpv3v37DVc/zemsrR3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605597; c=relaxed/simple;
	bh=p+vb/4LrcQYinfMiZygVvzzmpsr0pYRX+xrgPR11LF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wy7n6I10135lG7KMgZVZ2TzKSOlI6W8xJLMwjVAkIsNGtc7uy2JuOfcTClUMTsw7VN1W3DNYB4jduG56DcIS7q/K04WZjwJazKrX48o5Jli+17S/3u4FWqFCYozrgblQdbicqvQTbWc6RwPokNQ6uLgLs8gqI/YisN8qxReZryI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=cKrSjLXV; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="cKrSjLXV"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YmvQz07qWzlgTx8;
	Mon,  3 Feb 2025 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738605590; x=1741197591; bh=9/Ehz
	fW5WqP1iGnzNxLuo995d6qSb9YLWFVdeHbzPN0=; b=cKrSjLXVr98oTbmdsddhV
	eWXtyRhRaSnf9//ed9q/07aHYhJhIA1udKHrEOXCytdOhJm2kfGt6AHVMAPbZlHw
	KZy5i2lBrwWN/0FFqCuLKw+NVenoBMYu9iiBtL+CCnX45UmH8HoLmIxd9/4sOJKG
	EoLTDTWgX4D9aGVvxnJ9E2oDFkB5TGNrReJCO3wQkOoL3QidfCsl1TvsD39hwoTu
	0HljwmKLibzTf2WJ8lCXkjWL+XfnEEc2v2rDT1+sz76lbKrImOhbD4D5bdWOt7oX
	2Cw2rgcL46czxTAuYrkVdGsUdIfBh29wwPXezcAMk6XnNZoK2jNqZCNoB306X2aR
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id t96Ei3ApHuLY; Mon,  3 Feb 2025 17:59:50 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YmvQs0YgtzlgTxB;
	Mon,  3 Feb 2025 17:59:48 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH 5/5] irq: Simplify gpiochip_add_data()
Date: Mon,  3 Feb 2025 09:59:39 -0800
Message-ID: <20250203175939.3133477-6-bvanassche@acm.org>
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

Because of patch "irqdesc: Use dynamic lockdep keys for interrupt
descriptors", the 'lock_key' and 'request_key' members of
gpiochip_add_data_with_key() and devm_gpiochip_add_data_with_key() are no
longer used. Hence, remove the gpiochip_add_data() and
devm_gpiochip_add_data() macros, remove the 'lock_key' and 'request_key'
arguments and remove the _with_key suffix from the two aforementioned
functions.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpio/gpiolib-devres.c | 12 ++++--------
 drivers/gpio/gpiolib.c        | 24 ++++++------------------
 include/linux/gpio/driver.h   | 27 +++------------------------
 3 files changed, 13 insertions(+), 50 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.=
c
index 08205f355ceb..70f0c60c0b1c 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -366,12 +366,10 @@ static void devm_gpio_chip_release(void *data)
 }
=20
 /**
- * devm_gpiochip_add_data_with_key() - Resource managed gpiochip_add_dat=
a_with_key()
+ * devm_gpiochip_add_data() - Resource managed gpiochip_add_data()
  * @dev: pointer to the device that gpio_chip belongs to.
  * @gc: the GPIO chip to register
  * @data: driver-private data associated with this chip
- * @lock_key: lockdep class for IRQ lock
- * @request_key: lockdep class for IRQ request
  *
  * Context: potentially before irqs will work
  *
@@ -382,16 +380,14 @@ static void devm_gpio_chip_release(void *data)
  * gc->base is invalid or already associated with a different chip.
  * Otherwise it returns zero as a success code.
  */
-int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip=
 *gc, void *data,
-				    struct lock_class_key *lock_key,
-				    struct lock_class_key *request_key)
+int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc, voi=
d *data)
 {
 	int ret;
=20
-	ret =3D gpiochip_add_data_with_key(gc, data, lock_key, request_key);
+	ret =3D gpiochip_add_data(gc, data);
 	if (ret < 0)
 		return ret;
=20
 	return devm_add_action_or_reset(dev, devm_gpio_chip_release, gc);
 }
-EXPORT_SYMBOL_GPL(devm_gpiochip_add_data_with_key);
+EXPORT_SYMBOL_GPL(devm_gpiochip_add_data);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 940d3f980457..2aac9660b86b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -93,9 +93,7 @@ static LIST_HEAD(gpio_machine_hogs);
 const char *const gpio_suffixes[] =3D { "gpios", "gpio", NULL };
=20
 static void gpiochip_free_hogs(struct gpio_chip *gc);
-static int gpiochip_add_irqchip(struct gpio_chip *gc,
-				struct lock_class_key *lock_key,
-				struct lock_class_key *request_key);
+static int gpiochip_add_irqchip(struct gpio_chip *gc);
 static void gpiochip_irqchip_remove(struct gpio_chip *gc);
 static int gpiochip_irqchip_init_hw(struct gpio_chip *gc);
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gc);
@@ -916,9 +914,7 @@ int gpiochip_get_ngpios(struct gpio_chip *gc, struct =
device *dev)
 }
 EXPORT_SYMBOL_GPL(gpiochip_get_ngpios);
=20
-int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
-			       struct lock_class_key *lock_key,
-			       struct lock_class_key *request_key)
+int gpiochip_add_data(struct gpio_chip *gc, void *data)
 {
 	struct gpio_device *gdev;
 	unsigned int desc_index;
@@ -1085,7 +1081,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc=
, void *data,
 	if (ret)
 		goto err_remove_irqchip_mask;
=20
-	ret =3D gpiochip_add_irqchip(gc, lock_key, request_key);
+	ret =3D gpiochip_add_irqchip(gc);
 	if (ret)
 		goto err_remove_irqchip_mask;
=20
@@ -1148,7 +1144,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc=
, void *data,
 	}
 	return ret;
 }
-EXPORT_SYMBOL_GPL(gpiochip_add_data_with_key);
+EXPORT_SYMBOL_GPL(gpiochip_add_data);
=20
 /**
  * gpiochip_remove() - unregister a gpio_chip
@@ -1930,15 +1926,11 @@ static int gpiochip_irqchip_add_allocated_domain(=
struct gpio_chip *gc,
 /**
  * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
  * @gc: the GPIO chip to add the IRQ chip to
- * @lock_key: lockdep class for IRQ lock
- * @request_key: lockdep class for IRQ request
  *
  * Returns:
  * 0 on success, or a negative errno on failure.
  */
-static int gpiochip_add_irqchip(struct gpio_chip *gc,
-				struct lock_class_key *lock_key,
-				struct lock_class_key *request_key)
+static int gpiochip_add_irqchip(struct gpio_chip *gc)
 {
 	struct fwnode_handle *fwnode =3D dev_fwnode(&gc->gpiodev->dev);
 	struct irq_chip *irqchip =3D gc->irq.chip;
@@ -1967,8 +1959,6 @@ static int gpiochip_add_irqchip(struct gpio_chip *g=
c,
 		type =3D IRQ_TYPE_NONE;
=20
 	gc->irq.default_type =3D type;
-	gc->irq.lock_key =3D lock_key;
-	gc->irq.request_key =3D request_key;
=20
 	/* If a parent irqdomain is provided, let's build a hierarchy */
 	if (gpiochip_hierarchy_is_hierarchical(gc)) {
@@ -2083,9 +2073,7 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_domain);
=20
 #else /* CONFIG_GPIOLIB_IRQCHIP */
=20
-static inline int gpiochip_add_irqchip(struct gpio_chip *gc,
-				       struct lock_class_key *lock_key,
-				       struct lock_class_key *request_key)
+static inline int gpiochip_add_irqchip(struct gpio_chip *gc)
 {
 	return 0;
 }
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 087a295a5480..ef39e60a0849 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -572,9 +572,7 @@ DEFINE_CLASS(_gpiochip_for_each_data,
 	for_each_requested_gpio_in_range(chip, i, 0, chip->ngpio, label)
=20
 /* add/remove chips */
-int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
-			       struct lock_class_key *lock_key,
-			       struct lock_class_key *request_key);
+int gpiochip_add_data(struct gpio_chip *gc, void *data);
=20
 /**
  * gpiochip_add_data() - register a gpio_chip
@@ -599,29 +597,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc=
, void *data,
  * gc->base is invalid or already associated with a different chip.
  * Otherwise it returns zero as a success code.
  */
-#ifdef CONFIG_LOCKDEP
-#define gpiochip_add_data(gc, data) ({		\
-		static struct lock_class_key lock_key;	\
-		static struct lock_class_key request_key;	  \
-		gpiochip_add_data_with_key(gc, data, &lock_key, \
-					   &request_key);	  \
-	})
-#define devm_gpiochip_add_data(dev, gc, data) ({ \
-		static struct lock_class_key lock_key;	\
-		static struct lock_class_key request_key;	  \
-		devm_gpiochip_add_data_with_key(dev, gc, data, &lock_key, \
-					   &request_key);	  \
-	})
-#else
-#define gpiochip_add_data(gc, data) gpiochip_add_data_with_key(gc, data,=
 NULL, NULL)
-#define devm_gpiochip_add_data(dev, gc, data) \
-	devm_gpiochip_add_data_with_key(dev, gc, data, NULL, NULL)
-#endif /* CONFIG_LOCKDEP */
=20
 void gpiochip_remove(struct gpio_chip *gc);
-int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip=
 *gc,
-				    void *data, struct lock_class_key *lock_key,
-				    struct lock_class_key *request_key);
+int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
+			   void *data);
=20
 struct gpio_device *gpio_device_find(const void *data,
 				int (*match)(struct gpio_chip *gc,
