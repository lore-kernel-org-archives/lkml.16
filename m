Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4590C149DE8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665442; cv=none; b=JNEhoZnlfBtcdtaJnnCO7XdFJnOMNcZXw9mNsXG2qFYmmVuhRiKHrATfPob9u/1h5YShcUC2lUprYJ+MLLBnm3EYicgoqgs1tWOiy4FL55lugaLXS3Bs0acCZQNdtplASX3UvSc4QDHJ2aApJRBJF4RvbVh8TVr/KSXpJLxHDgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665442; c=relaxed/simple;
	bh=JpG0TVH7o5hYGKTlyJ7wDmM8k3gWEA+t5X14wbOj5Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BM6iGw1I8Gn74tiXXPYUGPlmin9/mN2r+j+il/O2KO53190AbkbF8ZzfOnUoM86pYUo3k5x/MTonlidAi+u+7iWEs1lr2k4wyvPea+WenXmGsTLsPNl0ys8urmVoOt82R4OsqH6qLcVENPT/FstJSUe4y/L2TLRQJsNTSAbt0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HRxVBijj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HRxVBijj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so39352835e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750665440; x=1751270240; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4J3K8EC+GT5avh/9JC/MK0evJSsQ8ZpHFi3OiY5eVA=;
        b=HRxVBijjt4cTGP+oi1TYtoT+cTRAIhA3uqQwrBK3CP3W8rdrQTLkQ/4NyMJSKufS7t
         2LIBSByI569zAqo7B3ofR71CwAgCrydcarJiDx29tnfUAWnzpzrO2rgEfTS8Q9x2/hq4
         fCp2aTP8VQX9IFSpk/kyL26EG4Ei+NAvqaSE05dekWq93FFyxmcmjrUYc1ag5ZRRtPVJ
         igr3cdp+TAJ/WrEPC7eKHQa/FbHHZgNXHR01pMRIeg/yR9HCnhw3RjjM6BGPya6/3yHT
         vfLsmm9TwRN8HX8C/8P6zIpcb88LptBABWyAXUJY9eTvqr4bi9c6z1iGQKlWJcdoEJPt
         5Sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665440; x=1751270240;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4J3K8EC+GT5avh/9JC/MK0evJSsQ8ZpHFi3OiY5eVA=;
        b=hcUDv6ZY9VSPlukkMs4aj0uq2HhSWIsIzRfCW0acciYaTLRoFXyhA5nPMbqydwlXy+
         gQbEOXNAhWlQlPQdbQT3SPrFTZV6jchI3xqgpjvAH+fid4rLbQoLAiHbTPdE7sEAM4dE
         zNCC1b5MNfw9MqeKvo/35RxWBmMfNLOpGx7FhjSiI0QveOdwj2uiE8/uzSE/zkb2ymc6
         Mg3opy0VvXDGgcHovsWSKg1uxpJQaG9GoNnXtivSXjZKI5WxOIcUe/ydnZpTsE9bpeVx
         e5yn/lfHM9qiL3fxjmSmJErOcr76tyLp08RsXSo/CUY+tjmsjoYw0nsoUul+dx7otAko
         pkvw==
X-Forwarded-Encrypted: i=1; AJvYcCVLjiFSdCCKaUqmVdGrwyEXZ2OugctTUBKAbF+JXdm7qUIdwybL1vz00YnZAZzUJAhit+mKmmgXu9hEmE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/nbSXctpCFDI5fhdeqrI98ewGneyCTFFElDq8AQV2zv+1pd+
	/Y3QzLEVxSXFgHStQ/8aaopifWvNGL7+CstnbzGvkWltyCgnvKCsFqpiCI558KW+efU=
X-Gm-Gg: ASbGnctPuU7JBoWRx4O3ZLAhgxadU1aubnFPqta4sSv0/3NPk8I91NkQeKjRIl0ZApj
	kd4DjHOD04M+fsOFRRYWqs+aFcHA9u+z9TUuZ9sTtDHhik+4RupUycvf9uTd4TahI7IpM1591am
	LQo++0zBNg6uzu3mDLulXkgo1LOaMRLBPswv9i+Xz741FdTDKPstlXTSqxOweFRoXoTyqSxkt5l
	OvM9wZwUfp8jvZGJgT50ttmkWgYcTB4m1rZWP51FtGw7ZwkdOlgIJmKbgVZ7HCyyJZOwwjXcDDD
	b8jr7srhbsPre5sFyk5cXg6EGjll/cozZLuUQBBNHUfh0EoFutsBKeA=
X-Google-Smtp-Source: AGHT+IE/gxqesZPpuSpIN9YQMeOhRUeTtIbXohHD7ehRoei/F2xO9sOHkPbQyCcWatrcW245gRHDJA==
X-Received: by 2002:a05:600c:4f03:b0:453:59c2:e4f8 with SMTP id 5b1f17b1804b1-4536be47f84mr49792615e9.1.1750665439386;
        Mon, 23 Jun 2025 00:57:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm137357405e9.26.2025.06.23.00.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:57:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 09:57:16 +0200
Subject: [PATCH v3] gpio: reg: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
X-B4-Tracking: v=1; b=H4sIANsIWWgC/4XOwQ6CMAyA4VcxO1uzDWTDk+9hPAzooIlhpCOLh
 vDuDk56MB7/Jv3aRURkwiguh0UwJooUxhzF8SDawY09AnW5hZb6LCtloJ8otANNEHEGTnsDKrR
 VaSpbl1rk1YnR03Nnb/fcA8U58Gu/ktQ2/QMmBRJqWRhZWKu809cHjY7DKXAvNjHpT6X+oeism
 NI1Pn/mm85+Keu6vgGnZt6j/wAAAA==
X-Change-ID: 20250617-gpiochip-set-rv-gpio-e1e864768942
To: Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5143;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lLhOgak40PJIlp4qXZpB5PtgchE8v4RW+AfzspDgfW0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWQjebwSYKRODNF6ffkD8Y0Xsldbfq9Th9cadk
 8wkq0H8st2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkI3gAKCRARpy6gFHHX
 cnUMEADJzJRf+T4MmU0THmF/3tcL0psBpJOxCYrvId0rmtoBbbzXTf7XOugf1B4ddxVCJUK4iUj
 9mwe1tF8Gu5HMkzF4D4o0bD+Rw5SXA3tIU5rdamdCU/F/nLImNKWyQ5LQ5A92KqM6utD7b3DI2l
 icX7jjplYWJi9il6wY6vUyOjHL55dZDYnoT7XQ0SweCXh1AJ679kemoXkOZmH+wjfezXUqu/TzA
 adRfIQrOaQXjEwPu6iiSakavB44gjop7QhTJoluM39h1gjIFywBEFEF803bUtHrb82GpQVc5wJP
 Sre91O+K4afyket/3zbJDW2wTrrAt7SZk7/Nt8gPQHwImVZwK0u20OfH5o39FIC/byWy7c+5433
 jnaBgPbQMbXBQzndvWoAIfe1KUCOMFauvbYdTYmFe1qG2IDlJtmswjwSrAFKrmfX9mWoM8DLG9A
 XpMfUDdTHAUtbsWR+B8t+QyeBDrYPTzOopOBimDr1hxE+UfshnY3CYSoliiYd8wZcjNALPxRae3
 wJ5Z//PLGsLhCPNkK3gEe/oHPJFVRKDF1yUpkIqwyL4FacyJMRxcCOXTlC317D9mu/y4ehokUC9
 KZHgvQUNViCknbvfetLLwlNQwQ66SWiJH2PsnqKwlh0RDwTRPyfh4GFBeKVpOULI7fTAMIGAzZE
 IVE8F5V6d0ECfwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the legacy generic
gpio-reg module to using them. We have to update the two legacy ARM
platforms that use it at the same time as they call the set_multiple()
callbacks directly (they shouldn't but it's old technical debt I
suppose).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This is the
last remaining patch from a bigger series that already went into
linux-next. The idea is for the ARM changes to be Acked by Arnd or
Russell and routed through the GPIO tree.
---
Changes in v3:
- also modify the callbacks used in legacy ARM platforms
- drop applied patches
- Link to v2: https://lore.kernel.org/r/20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org

Changes in v2:
- fix a NULL-pointer dereference in gpio-reg: use the correct function
  pointer when calling the setter callback directly
- Link to v1: https://lore.kernel.org/r/20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org
---
 arch/arm/mach-sa1100/assabet.c  |  2 +-
 arch/arm/mach-sa1100/neponset.c |  2 +-
 drivers/gpio/gpio-reg.c         | 16 ++++++++++------
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 2b833aa0212b294eecd7a8177d58c7cb50fe6c61..bad8aa661e9d0998e8238b6559757ec83bff4cb1 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -80,7 +80,7 @@ void ASSABET_BCR_frob(unsigned int mask, unsigned int val)
 {
 	unsigned long m = mask, v = val;
 
-	assabet_bcr_gc->set_multiple(assabet_bcr_gc, &m, &v);
+	assabet_bcr_gc->set_multiple_rv(assabet_bcr_gc, &m, &v);
 }
 EXPORT_SYMBOL(ASSABET_BCR_frob);
 
diff --git a/arch/arm/mach-sa1100/neponset.c b/arch/arm/mach-sa1100/neponset.c
index 88fe79f0a4ed36a3bcae349fd037b52d0f9964d9..6516598c8a713bc5ca055be0934a03be73c07403 100644
--- a/arch/arm/mach-sa1100/neponset.c
+++ b/arch/arm/mach-sa1100/neponset.c
@@ -126,7 +126,7 @@ void neponset_ncr_frob(unsigned int mask, unsigned int val)
 	unsigned long m = mask, v = val;
 
 	if (nep)
-		n->gpio[0]->set_multiple(n->gpio[0], &m, &v);
+		n->gpio[0]->set_multiple_rv(n->gpio[0], &m, &v);
 	else
 		WARN(1, "nep unset\n");
 }
diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index 73c7260d89c083a702b1d914ddca7a573a37de4a..d8da99f973850e5f4afa36d97c685f477837e665 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -46,7 +46,7 @@ static int gpio_reg_direction_output(struct gpio_chip *gc, unsigned offset,
 	if (r->direction & BIT(offset))
 		return -ENOTSUPP;
 
-	gc->set(gc, offset, value);
+	gc->set_rv(gc, offset, value);
 	return 0;
 }
 
@@ -57,7 +57,7 @@ static int gpio_reg_direction_input(struct gpio_chip *gc, unsigned offset)
 	return r->direction & BIT(offset) ? 0 : -ENOTSUPP;
 }
 
-static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
+static int gpio_reg_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 	unsigned long flags;
@@ -72,6 +72,8 @@ static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
 	r->out = val;
 	writel_relaxed(val, r->reg);
 	spin_unlock_irqrestore(&r->lock, flags);
+
+	return 0;
 }
 
 static int gpio_reg_get(struct gpio_chip *gc, unsigned offset)
@@ -92,8 +94,8 @@ static int gpio_reg_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & mask);
 }
 
-static void gpio_reg_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-	unsigned long *bits)
+static int gpio_reg_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				 unsigned long *bits)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 	unsigned long flags;
@@ -102,6 +104,8 @@ static void gpio_reg_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	r->out = (r->out & ~*mask) | (*bits & *mask);
 	writel_relaxed(r->out, r->reg);
 	spin_unlock_irqrestore(&r->lock, flags);
+
+	return 0;
 }
 
 static int gpio_reg_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -157,9 +161,9 @@ struct gpio_chip *gpio_reg_init(struct device *dev, void __iomem *reg,
 	r->gc.get_direction = gpio_reg_get_direction;
 	r->gc.direction_input = gpio_reg_direction_input;
 	r->gc.direction_output = gpio_reg_direction_output;
-	r->gc.set = gpio_reg_set;
+	r->gc.set_rv = gpio_reg_set;
 	r->gc.get = gpio_reg_get;
-	r->gc.set_multiple = gpio_reg_set_multiple;
+	r->gc.set_multiple_rv = gpio_reg_set_multiple;
 	if (irqs)
 		r->gc.to_irq = gpio_reg_to_irq;
 	r->gc.base = base;

---
base-commit: cb908f3699fb137e28017a8fdf506c35762b3eb6
change-id: 20250617-gpiochip-set-rv-gpio-e1e864768942

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

