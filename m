Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7045A2459D1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448140; cv=none; b=Bnr4cLd3kcWclxK6tIvj1Gml0LHdhO8ktSs+WGbD+YguZ0pgZc8naqRuY/U7MnuKoRkIiA90mteOC1SH4kD2n0VLlvNxRUe3WEJkVyk+eQNcJeNRi3mafkLsafs/+Flb9wkXpjUvFG2hMd3e9yVjHyFKrCSyXyqnL4UkUFGASlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448140; c=relaxed/simple;
	bh=y8+ZGCw9wnewLNofUvKWCpB47AebmN2nx7KegRySQ0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ft0lxDCFlg2BJ1iuZVo1NjPVPElyTqGkQcwjdY4GrNEvSm0/4+aspFzYhwrrtIlTiBFDHxcuQSVi/Pdnd0pwcBbqfGNuWxG6g9rDFQ33WW9KY1tIMNMuwGpYVxdvlomnrz6vEeK4X4uMthdq2JzwWGeN0iO14F/nQecK+3Bqy0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HneRPIMv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HneRPIMv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so4282588f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448136; x=1752052936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQ4953DYX730X6Pl4pCdKBLcok8eGFLQghf6CkEicDE=;
        b=HneRPIMvBEKgCOJlSmfAw4EgjCkUiWqZEVWILflgY0/uUtYeVvRkQtrcHONADXCNoO
         tRXbYV0lWC5Qwgk9gGcd2bd0TAjZ3GMPNhOIPxjdckuZW7V/dl7FEr4NK5fqa8g50MPh
         GdHqgC1zAt5eJYWneb0iHqX3kLqpn/YQZ5P7ZPemDnq8JSCJ+uT1qDW1IhoBqU7GoF2j
         AhsrFvef6QZCmpPpenlgf10l4WvggcD2H5fKcr1yNqWk/6j3vXB4tuVCO7JBSrMSD3iz
         QunFjKRVtrMNTZWtMo0qWwxCQIy0SPHKETxvNO44NQmHTTGb4dRNanBFJJV/ow0nlX0M
         kL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448136; x=1752052936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQ4953DYX730X6Pl4pCdKBLcok8eGFLQghf6CkEicDE=;
        b=sbLMpRC6uKLh+NOxg5foh6n05MFoKknspOW+0DoRlM5CquOkgtOAWwtWdbRFiXc3xA
         BirxUEr/Ddn43ugRW/IGczivAAG9E6/WjJ8PJYeR8elnlG6PAbtiwmw/3xvV8N45NGPn
         mrUqeQosIrNLZosu0zDSmeYZ2vdAf7JQL4AgNcM1zCjmYGUGigneMr+XTeEilm7N+eLG
         X0dklrqOzUlYdUr+uF2Rxpp/2pwSIgBO9p7GAOMAT3AijHbDOrFUqhh4zYukl8gNRQLM
         rxqsNiEuYelIymewULfUnJtkOYaNxiE8eUN56UuTnF6xEDrF0+O4pFNbT/qJ1ItN2lzV
         dpcQ==
X-Gm-Message-State: AOJu0YyqoAN+zT+gbArqoa9TdzLZL7Ti+Z/7wSo+HAhd46ENXHT5pEgO
	0COxQPnTeOqB2qkpy+3em/KGAOHYJUNdigGEd9F4FURml2kY8KKZsULK8+ZNKzJuY4Y=
X-Gm-Gg: ASbGncvqPqd0wCjDi9zdC7rAVy2n9FiGHsmI3CeVkqSV/QdWJqlF1r3cz2DIJrr+60r
	niY130etS4NeUyn6AHs7XJe6S8uQaktKAsKh5j3TF4GEpXBb5lYSmZyuyMY4Q+G32BXpSqJQ9Aa
	MoOR3ytVaz5sFp6QQWysXILuBBPKki7fudI1ars3piJiqJQ2judpkDBY3mA050YJ/bKAoYZoTcO
	11iLfVi1WLEFYq+O1FH1lSuSKnMuSb5h54qltkTTnXfAOfTGTj8SUogLsgrI2ZjiDJWGkiGEoY2
	5wU5+hpSAtLb2G78pI75SGs4gxCkRNsf9UE+V0SFUfIPrKcTgyJF+g==
X-Google-Smtp-Source: AGHT+IFy+dbKnRMVyYVM9ja1MDJ2jsqlQp/nEGAueozbl8hzF+fw2nR7L/R/qjacSv5mPDCxKpcWjQ==
X-Received: by 2002:a05:6000:248a:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3b1f7ae6ee0mr1649457f8f.14.1751448135688;
        Wed, 02 Jul 2025 02:22:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:08 +0200
Subject: [PATCH v2 1/8] gpio: generic: add new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-1-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5967;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pB2Xuhhwxk5LYCzli8T80nbGaaOUFOOv5AWJwibECv4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEU/2fp9wrpMS14IJmNecxSGbWX4sGcofEa
 IgAdrNk+BiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 cjPgEADBIdI3NwEpid9TDAiABxWhTsVPd5UOMc7dqo1CxnLpB1ra9kx2TuHCGnyaefSiKZAqbOx
 ZYT9begIVywJahkysJ+PDjKI6FLO/TNG1YfDJiQ2mHq6KVfeKAGMZaAQrQzq9ApQcKAO4nPkUht
 w2XSSsz84qOuBO2EGMt/U3z2YS3b7eJMPEK4zgdSFUO+OP+nEttwWrn/t4s7cO40TfhvjYCLLeu
 vfrcWLovH97g55wx7fyJtWTimMHX4WbLSc+xikqtN6JXMJY+4Kk1wfWYeKnpOl0HnekJfEnHUqi
 0AUbPcd1V+hCc71mnIbX6erwQH/FcPKI+XPnU1fLhMoMaAs8wDKf7WT8DXyQrK4+Ov4JcjV6jh1
 25YWIAT2JDTZFlZnUoKDX6mj086XBsUNxaZixzt0OBmBCSJ53+ORQKqDbYqwocOPEhQ0+T0Sert
 gbhX1YkvDimVnt7lOEWw+qjfTGS49ULiBjr/0sLlAWqSRKVDskKD2cqQMqDuQohmBk7v4Pd4mj+
 p22ivAuf2iVnrLoyEr+QiBELgFhPlKRfeRVZ5wtZwompJ6OaMZgqRTUJlh1DWwNTe/oQH7haCPh
 BHYs0xbiubt880Od0nrMgvFPonaX+K+D3YV7g7jnlnjzZNX1o/MMirclzFYGXRCb42NIWd/KY7I
 041ci388PceItXQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in removing the fields specific to the gpio-mmio
module from struct gpio_chip, we introduce a new set of generic GPIO
chip interfaces that are meant to replace the existing bgpio_ ones.

The new initialization function - gpio_generic_chip_init() - takes a
configuration structure as argument instead of 9 separate parameters.
This will allow easy extension if needed in the future. We hide the
locking details behind a set of helpers in order to be able to move the
raw spinlock out of struct gpio_chip without the users noticing.

For now, the new APIs just wrap the existing ones. Once all users have
been converted to the new interfaces, we'll pull them into gpio-mmio and
implement them in a backward-compatible way while also moving all fields
specific to the generic GPIO chip into struct gpio_generic_chip.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 120 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
new file mode 100644
index 0000000000000000000000000000000000000000..b511acd58ab0099b727bf929b7a4e9f9836cd5bc
--- /dev/null
+++ b/include/linux/gpio/generic.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_GPIO_GENERIC_H
+#define __LINUX_GPIO_GENERIC_H
+
+#include <linux/cleanup.h>
+#include <linux/gpio/driver.h>
+#include <linux/spinlock.h>
+
+struct device;
+
+/**
+ * struct gpio_generic_chip_config - Generic GPIO chip configuration data
+ * @dev: Parent device of the new GPIO chip (compulsory).
+ * @sz: Size (width) of the MMIO registers in bytes, typically 1, 2 or 4.
+ * @dat: MMIO address for the register to READ the value of the GPIO lines, it
+ *       is expected that a 1 in the corresponding bit in this register means
+ *       the line is asserted.
+ * @set: MMIO address for the register to SET the value of the GPIO lines, it
+ *       is expected that we write the line with 1 in this register to drive
+ *       the GPIO line high.
+ * @clr: MMIO address for the register to CLEAR the value of the GPIO lines,
+ *       it is expected that we write the line with 1 in this register to
+ *       drive the GPIO line low. It is allowed to leave this address as NULL,
+ *       in that case the SET register will be assumed to also clear the GPIO
+ *       lines, by actively writing the line with 0.
+ * @dirout: MMIO address for the register to set the line as OUTPUT. It is
+ *          assumed that setting a line to 1 in this register will turn that
+ *          line into an output line. Conversely, setting the line to 0 will
+ *          turn that line into an input.
+ * @dirin: MMIO address for the register to set this line as INPUT. It is
+ *         assumed that setting a line to 1 in this register will turn that
+ *         line into an input line. Conversely, setting the line to 0 will
+ *         turn that line into an output.
+ * @flags: Different flags that will affect the behaviour of the device, such
+ *         as endianness etc.
+ */
+struct gpio_generic_chip_config {
+	struct device *dev;
+	unsigned long sz;
+	void __iomem *dat;
+	void __iomem *set;
+	void __iomem *clr;
+	void __iomem *dirout;
+	void __iomem *dirin;
+	unsigned long flags;
+};
+
+/**
+ * struct gpio_generic_chip - Generic GPIO chip implementation.
+ * @gc: The underlying struct gpio_chip object, implementing low-level GPIO
+ *      chip routines.
+ */
+struct gpio_generic_chip {
+	struct gpio_chip gc;
+};
+
+/**
+ * gpio_generic_chip_init() - Initialize a generic GPIO chip.
+ * @chip: Generic GPIO chip to set up.
+ * @cfg: Generic GPIO chip configuration.
+ *
+ * Returns 0 on success, negative error number on failure.
+ */
+static inline int
+gpio_generic_chip_init(struct gpio_generic_chip *chip,
+		       const struct gpio_generic_chip_config *cfg)
+{
+	return bgpio_init(&chip->gc, cfg->dev, cfg->sz, cfg->dat, cfg->set,
+			  cfg->clr, cfg->dirout, cfg->dirin, cfg->flags);
+}
+
+/**
+ * gpio_generic_chip_set() - Set the GPIO line value of the generic GPIO chip.
+ * @chip: Generic GPIO chip to use.
+ * @offset: Hardware offset of the line to set.
+ * @value: New GPIO line value.
+ *
+ * Some modules using the generic GPIO chip, need to set line values in their
+ * direction setters but they don't have access to the gpio-mmio symbols so
+ * they use the function pointer in struct gpio_chip directly. This is not
+ * optimal and can lead to crashes at run-time in some instances. This wrapper
+ * provides a safe interface for users.
+ *
+ * Returns: 0 on success, negative error number of failure.
+ */
+static inline int
+gpio_generic_chip_set(struct gpio_generic_chip *chip, unsigned int offset,
+		      int value)
+{
+	if (WARN_ON(!chip->gc.set_rv))
+		return -EOPNOTSUPP;
+
+	return chip->gc.set_rv(&chip->gc, offset, value);
+}
+
+#define gpio_generic_chip_lock(gen_gc) \
+	raw_spin_lock(&(gen_gc)->gc.bgpio_lock)
+
+#define gpio_generic_chip_unlock(gen_gc) \
+	raw_spin_unlock(&(gen_gc)->gc.bgpio_lock)
+
+#define gpio_generic_chip_lock_irqsave(gen_gc, flags) \
+	raw_spin_lock_irqsave(&(gen_gc)->gc.bgpio_lock, flags)
+
+#define gpio_generic_chip_unlock_irqrestore(gen_gc, flags) \
+	raw_spin_unlock_irqrestore(&(gen_gc)->gc.bgpio_lock, flags)
+
+DEFINE_LOCK_GUARD_1(gpio_generic_lock,
+		    struct gpio_generic_chip,
+		    gpio_generic_chip_lock(_T->lock),
+		    gpio_generic_chip_unlock(_T->lock))
+
+DEFINE_LOCK_GUARD_1(gpio_generic_lock_irqsave,
+		    struct gpio_generic_chip,
+		    gpio_generic_chip_lock_irqsave(_T->lock, _T->flags),
+		    gpio_generic_chip_unlock_irqrestore(_T->lock, _T->flags),
+		    unsigned long flags)
+
+#endif /* __LINUX_GPIO_GENERIC_H */

-- 
2.48.1

