Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B45224B03
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184968; cv=none; b=EeDli9GhwnXt7BnvRrl1mgywMGD4gIZOHabPVd6/OPIWbdkG3C0sPsoWubgnvPyHdci5MFUg3QZW4O6QK2Xz43D/Oe94K2XSeVV1KPE8S0cSk7Eltvunh6LTq9TGTvvg1wR2SRxW0qJfXbFvmBb9/JHk/TUX2HoNd4nHVeOEgMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184968; c=relaxed/simple;
	bh=3TIzpFAkAwmJ5Ai0fCUIFb6sFww9WxO8C3aUIXLL09Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oZORr+F1R521wLfqPyUxhGXD2/yIfa3LI3a1duA/vzwBbd7hD94x79PEpeZxgYuWRT/UDH5cxvuelZRsJZBOa1TeaZ+FHJKAKwInLH8quIfmDW4g40tb5J98BOOna4riTvCot4PHpgOJPKqWv4E0CcwFecoOUNtoj+QDhREChRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bme3YeOH; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bme3YeOH"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso2779851a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 04:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746184964; x=1746789764; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqfMYbE/OTW0Ee2/eXWBsydPJFNpOPTDdKFpdPQUKCU=;
        b=bme3YeOH4T0dKwoFVPaW3wQmL/VfgooS8sXnpgXTyv9/ToHEKcDLOCV5ARQVLHNEve
         6VKK2yRN8rtfkDUQs+v69zLC+5ZTzessxATcekMH0gQ2WcrfYHpCeWKi7jIo8iaqY7UE
         lEsxtg1niy4HOo3sL3HL188gvz00Ez5kTKm2qQm3xAZOJr65GWm3cB4gCyU+q8ADMe3f
         f2KbkUBdsHsSQEhkbXux0fqcWRzk8Xc5/zLdGicsoV0nGFwzIasXVGDLTml8npblT8SY
         mVMlIL+kkhaZ0xWGBHzU8P2oGjuubM3CiybW0Pb2txJ+7zu8n5r9ZQJqcnXflyRztBBi
         h1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746184964; x=1746789764;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqfMYbE/OTW0Ee2/eXWBsydPJFNpOPTDdKFpdPQUKCU=;
        b=BuygIBwj6DlfODRbySc5HQvBfBCea+g3h1/euB82zFxQbb9IRQcIA0h9w6t6E40G9A
         fEtUQvpUNY/e+KgZt2ykbTqXTJsuYz1rSf2qyK5om0JkN4e1Mu8nmHZpXM+at50Ce5qb
         GVBFEf4ygomrvXquUCShREQajNYVOpdSR0O/XXFdoZIaugFZlr0lWTmOgeGMPFGPoLdq
         030O9+679ssREwo5eqOrWEPTVmGd1rvvKPTA53IQB7dsdcXtCy19bF5wifgYb5wwu/8n
         /mJtFTuGibECEa2tC91iv4Ad1YNhVrOdRC9avZfs1JGYqdDUd3qm1xfw0c+LB5fPcLR5
         9jgg==
X-Forwarded-Encrypted: i=1; AJvYcCWwqHUnaYeI4s0KGm6RGP2UwXj/OZmFl1Py4LHqcBNkDwdT6sZEtbabfbAFO0ru20GqyFEAk3LYoQSrG08=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWYBHD94+mUpKo1YmjCexn0dpMNZLfTupIDE50iT/0CaxR5KCv
	4p3zchZZqwDLIVvdZXqR9huzuKg6JDHYPcZ4RwgQOdcdQXPh2Uso3/RWDQJ+NW5/WZTBaoSKrFp
	f
X-Gm-Gg: ASbGncu+3dsZ5jvzbreVxt0X9IUfDyfuuNNH3v06zbDoiMaVJO2W7eilzKVPxOccgee
	bLw0aDO83zF8R0slREpEFwfXrbwNj/wtKtFPgACD8oD8S7SJfVva7UsD4HfH4zojjRAM+jLNHmQ
	0mkHVb8bff8mCg5QO05ajP+KBtrlWCW5+hiSs90s2Nr8lDii4ujKrYNdsu3fwNFNM0xc1uNc5Jb
	300yWtSioSBjU6ATnYyunpXK6VLMm9hBMBWao7QgJA8jA4GD6CPScoCj9Ri83PmUQc7XQ1ErcPJ
	H65s6y5ZW1FsE9jJLYThr2tN/+kYq01pt3+hH02YpXbp1nDrlBOgZxo=
X-Google-Smtp-Source: AGHT+IGhvBVIBFVtHBjng4vUf55rIcK1Nc7ggU/9+PFpPWuDtRvXkmQ3OGrZUveVFEdPd39HlFp12Q==
X-Received: by 2002:a17:907:6d14:b0:ac6:fec7:34dd with SMTP id a640c23a62f3a-ad17afbe974mr219003766b.52.1746184964389;
        Fri, 02 May 2025 04:22:44 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f2f:46a0:5bf3:f8f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a2b6esm36062166b.42.2025.05.02.04.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 04:22:44 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 02 May 2025 13:22:28 +0200
Subject: [PATCH] irqchip/qcom-mpm: Fix crash when trying to handle non-wake
 GPIOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-irq-qcom-mpm-fix-no-wake-v1-1-8a1eafcd28d4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPOqFGgC/x2MQQqAIBAAvxJ7bsE2guwr0SF0qyXUUqgg/HvSc
 RhmXkgchRMM1QuRL0kSfIGmrsBss18ZxRYGUtSpThFKPPE0waE7HC7yoA94zzuj7XXLjdbUWgU
 lPyIX/a/HKecP+M52P2oAAAA=
X-Change-ID: 20250502-irq-qcom-mpm-fix-no-wake-d893e19923d0
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

On Qualcomm chipsets not all GPIOs are wakeup capable. Those GPIOs do not
have a corresponding MPM pin and should not be handled inside the MPM
driver. The IRQ domain hierarchy is always applied, so we need to
explicitly disconnect the hierarchy for those. The pinctrl-msm driver marks
these with GPIO_NO_WAKE_IRQ. qcom-pdc has a check for this, but
irq-qcom-mpm is currently missing the check. This is causing crashes when
setting up interrupts for non-wake GPIOs, e.g.

 root@rb1:~# gpiomon -c gpiochip1 10
   irq: IRQ159: trimming hierarchy from :soc@0:interrupt-controller@f200000-1
   Unable to handle kernel paging request at virtual address ffff8000a1dc3820
   Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
   pc : mpm_set_type+0x80/0xcc
   lr : mpm_set_type+0x5c/0xcc
   Call trace:
    mpm_set_type+0x80/0xcc (P)
    qcom_mpm_set_type+0x64/0x158
    irq_chip_set_type_parent+0x20/0x38
    msm_gpio_irq_set_type+0x50/0x530
    __irq_set_trigger+0x60/0x184
    __setup_irq+0x304/0x6bc
    request_threaded_irq+0xc8/0x19c
    edge_detector_setup+0x260/0x364
    linereq_create+0x420/0x5a8
    gpio_ioctl+0x2d4/0x6c0

Fix this by copying the check for GPIO_NO_WAKE_IRQ from qcom-pdc.c, so that
MPM is removed entirely from the hierarchy for non-wake GPIOs.

Cc: stable@vger.kernel.org
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
Fixes: a6199bb514d8 ("irqchip: Add Qualcomm MPM controller driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/irqchip/irq-qcom-mpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 7942d8eb3d00eae5fa7e5718a05ef889bb8a82f0..f772deb9cba574b9f70649e1646f16a993eba58a 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -227,6 +227,9 @@ static int qcom_mpm_alloc(struct irq_domain *domain, unsigned int virq,
 	if (ret)
 		return ret;
 
+	if (pin == GPIO_NO_WAKE_IRQ)
+		return irq_domain_disconnect_hierarchy(domain, virq);
+
 	ret = irq_domain_set_hwirq_and_chip(domain, virq, pin,
 					    &qcom_mpm_chip, priv);
 	if (ret)

---
base-commit: e6a3fc4f10b872d02e25f83227e725c79b25d893
change-id: 20250502-irq-qcom-mpm-fix-no-wake-d893e19923d0

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

