Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137F22BEC34
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771667; cv=none; b=sQyB0ohGgy4wMBR2kTqckzq24PhYuYvy8XZkSdH+BxC3fXdZb8btA6KZVOlDIfi1+WW7PCrPnSnPVlSUWSaLigzsCxSwHH21+gEmjY3b2VtP6wj1IFj+i4sko6RFeEJ6T//e+p83EMERdLzWYt4OB/QKGY6c8+YOp2s5+48wyak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771667; c=relaxed/simple;
	bh=X4xlyQaHMo4/qPZW0pe1QbwgIaRSmVa2bwIHDGXuiJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ws4MBihi4P3a9E2YKqg58qDUtqSUDLy4ozcwOWjvc20M9oKA1y0WGu9F4HU1YmnhozeC9kw/axc0QveFP5Fqkpra1ZOs0FloEFenFhBzz0ZjJWCdJHS2ynMD8lvUSlLyYU8fPcpIInsadPiSlULHofUI+zNUmeX2D9+cvkv5n3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BGVvmmUX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BGVvmmUX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso45783185e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771664; x=1751376464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViGLyGNizy0QYTUZPxOkCsquGI3jEpcpF5BqlIQ29KU=;
        b=BGVvmmUXxu61biyixbuAKdRVcFcPBW7CXW3jdfLnpvS0EmOgn9hT4+rRZNL3b8n2+W
         FyV4sxl2VB5CZiY+fIBrBgzmUpCDzWo9v444/7iv2IBK8vKNMUKyetIswkLGsmqej3nG
         +JfsieGn6Wrd3o0Fc09vU/2aEu1as4Ym1R1tkGmkEDgTSy4WfS75LjwAnx6DSKske6w3
         YcgnCZnoq+ovgr3fP+aG3W6XfLJCLxdQr4iM8UTqP5cGoWw8rYGex2tXFCmVE3AbRCew
         esaNNBLfBxn0jDHjZegiLoKiexqSmVopBoCZTLX5zs/pK1I2vfuz7nV7XycvvJU7dIHv
         6O9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771664; x=1751376464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViGLyGNizy0QYTUZPxOkCsquGI3jEpcpF5BqlIQ29KU=;
        b=DD3bTaDGUdeTztKIbHW3B4xDd4GLL5U4EYhXFQoMRXQSi4Pfqr3UkmMgde6BJkQHYQ
         6qkHSwcahjNOBIjcZx0CUItM27ShCqP79LSoDXp2tGQmvd8udub0Kn9yytTCN5TJJh8D
         PPdXNKYNzoigLfAWd0OlX26NatgCERy1S6pXfgWuSVhAkS0Z4lOE89rtj4BM3qHls68L
         rntVeNuJ6Y2foJpEWpueU29BhkYLFIROEZ8UrTbqXFrW95JMtlmWMTmtuDwc5FIx1KMu
         Vc8EtGPDZFk8VC+BKZ/AlTAbtPLIgG3cSSWsjNTRsIeTvNOKMBGV7YVasjNn1uXCNtcw
         EZQw==
X-Gm-Message-State: AOJu0YyjSgwqX8Ud9i/ziTQ2bvi6ZHC8e905/9JPDqhvDQZf9fh1bTne
	JNJQKdwlqX9ddWdWNcOlWec3zalPFGZU5og18Gg4OpjvtUZ95CjRr1fPa3zvMQrIo7M=
X-Gm-Gg: ASbGncsUttRkblYMpg/Obcty7WCkfi33Fh55LKaiuZLaa1k+LJjZGuAAf7d4TS+PnAv
	K/DRF0BEq5zFSQYm9nzzM+TncvVe1vxYrEhzJjVu8dudJIwLgfERd/nt1nKOo27CllzyaGHsUxu
	siCcODP3x8dsNvpmo56X95HF9FZgEngTCgVTviiANpUalMuidbhYdnYU8zXfEF7+bD7l9ra3ilf
	WPr4s3fOV3BwND+hR+zTB+83JqcbnN6dswTnThHa2uSejYfylSfC9hZU8/h3+OnZWhKoNZcbstx
	Cw36vyVg4u3M7UJtcbBt7Zre2NF5go1MTsFbKHM8Q6NdqLJO6FJ9uxw=
X-Google-Smtp-Source: AGHT+IFwjNIBSxB9Djyxg2017jgPe5XpKG4RaoQZrleIYKZHPAg5xyhP5XJ1Bsc4wsjkuIZtWkx4jQ==
X-Received: by 2002:a05:600c:468e:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-453653c7fa9mr168724465e9.0.1750771664123;
        Tue, 24 Jun 2025 06:27:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:33 +0200
Subject: [PATCH 1/8] gpio: generic: add new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-1-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5912;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2Uvp/eEX5AyqzsuezJXXZ3qeRTnZz6y52I85deQ4hAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfLSTWdicAH2z0FU6X8jtwrvLIVkLujkFEax
 HAoM2ed9rGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnywAKCRARpy6gFHHX
 comsD/4lv3zDlkdjytyax7HaFblg0ADAsFlGDJo7wfFtQ62gWvl2FsoaHfUixcQPK2Av9g1jWbK
 CqNDXGKfbbNCNk5C1oxsj9jzsuqTIq2om2ot/JSH8YMf4bXljUnhrFD3DsY87AKnOsz/+prDt+m
 FT9w8FCypP0H2S0PvTnzAYtCThw7H/SyWBcf8Jst3Qhyi6XAb6xGGMyuznevtPKD1HOMSNLm0gK
 KhLZMcDFm3LPNZg6BIFa7OsE7zuqtSjQdrTAaumRNfjphmRgZT8lYJcfvAHAq7M70pecFNzUA49
 RCII9hn28meXXt2f1VPaua7Ze8z+NbzBw2kySmsWqu3beUbSh5I4GrtdOseZ1lb7plJgVo3zIxG
 aU+FWKN3DfVTE6aGD+LQUYs2MYvU/3fhOw7t9KR727eA5CqLo3EuUAeljDrhFhZpU1kPDq1U+Ti
 C1RqhgOQ4d0KY5d/7w+5IlDqMaugQM/pgjuos28/TNEGtHyzZhF7cKC0MZodyjCyPiUYCbdMs6l
 GZ/BZW4ikpSnvtC07UyOyo79eM9PEgimXIAlaMnmY7cadC+YroPAIhXnUFljr/0j2KeCsY+lynM
 0u5i7VknNFbDxIMxKvNjT1t2zaoJ7HDtvZCi0nFgUoCSMzRWo0/zkoctMEWWbppHVR4HW9NDyE3
 wxGKbw2Si8fB1iw==
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

