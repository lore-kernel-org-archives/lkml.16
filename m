Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC33F17A2EA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519761; cv=none; b=ARzQrmZt61IKeK6/LF8YJs66YQT6KHLNHjq1pStc0vq1Bx8SbeA77GNXX1Re1UtAW3Z9nm5kqaS748EvebqN6ZTMDmb98kYOUUJyz5B9R3/rUGTFaQHtwQcuC7OSM3TJcHXZZ/j0C0kJQzbu5YWOCmhRQVNgywCLqBywXV1OABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519761; c=relaxed/simple;
	bh=tSGH2p1izsSzRGjyaTk9F2yB01tgjf//IQcyliOLsVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chjXzMdENZYpjzyleR4ecuundDavE9nNfmKrZyu/ybMmSQmwcDkiM1XI21aS0QGs5QFCME+ohclkMSmKhnnACFWn7Y9Ue4DQNKBn9f2KMlKrRiL9iQft84nDz/lQacl4WJ0csaX/48+iqshclPzThYV2B6XAcjR26jSdwfmvlJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUpGbwB0; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUpGbwB0"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso1733438a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519759; x=1746124559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=;
        b=BUpGbwB0ouFOo124bO+dXDlTFTt4NBdUBJcr3NFJRVHmjO4IHgMlcYHD98hOXvRvcW
         xwdInp3bnD75G4DQbAS+Fihrbc8q+0rKBiCHL8mGkNXOhCKhEUPZ2+7N3alh73VnnTmh
         /L9hScausx2v/m14c8qkMsVBEs+tR0laBp/OY/stcnQ1KJaIW/itrW8WyeZ9QOKdSNZp
         63XN3IIinOrE3/8v9uxJonfK6OX/U1B5mIf7sQShVU4+zAHaSGEiMxlvjnE3eoo9hYOf
         WxP3Uh5xYot4KSV6CPUbObdJhqqggfqkoXD6tIEkWGfuVKrA+kvnHfPvqw7dtFUTO6ju
         8qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519759; x=1746124559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=;
        b=FQsmNIo0cbsqkGcIqVXPQXLCW55TlsAOZJT4Soux6S0aZbRY2PpmMIAEi568UNoGro
         bNNoXhVVTziNcbQ9EhscyYzgFFbDEALjutQYrCId/mdHvHeVYb+vvSwU6hu31Okr78bs
         2vOtF8uKUn/CcV8nc5hLEW8e457IhCFhDZPRjcn+BqdsIVvtgfqVtZ9CdSN9IjepG7dY
         16FPRl3JrbMhPidE1JNI0KhGM0aoPIudjhGqCMb09HYSDZElh7TjZqx9OgnlF4Okhby3
         VKyNzYykyUxA9ECZtTKrHDrIZA/yzxst6goSdIDdIU7otgxGlgJOMLbu4XZuWX7aGlFm
         JetA==
X-Gm-Message-State: AOJu0YwOQsOT5hxvxnSA6q+yDoq3NYfsU+faUF7eOJt8YyFbffG/t4Ts
	/KKruFNu21TFkhtfvZNOazLaVjyppayBpssKVhyhRdXgNExnvmi1
X-Gm-Gg: ASbGncsWkMjuFf1DcmcVl2nIVhk9CJooLyd+/8dG6ApiLdP9Y5YSTYsNjTLlvmMtZ46
	WhLzYC3fbTip+L4LfdwwSQCMq8Mdt14G55JKSCfM446/OFRHDbXbt5gGW/18Sioq2TSll0IsErg
	2NvX7KYInS3xlJNR3e7zt7d7LcghxgOuiSYZAbL8nIWkIJURvnCh0yY6tOI5ZKkEnePuQz2JNcj
	GtJj9LdGjNxv/SIP7SPXqQ9h96FbDAm0JAU3lOFp0QsI3gq8wwDVWGY7ahvOS2P/tGr6kYVaKMU
	5yOOOufMznjKvjq62Wd1RAkJcd7eHntJJq1KiQJW0V9Rx5XRqh4e
X-Google-Smtp-Source: AGHT+IHqbGl3wWMgKMlmkpO3aAqia2AmQFa51dP1SBJA6i6zMBE2cj8gi6+YiNddbtygRemvXRa73Q==
X-Received: by 2002:a17:90a:d006:b0:2ff:5ed8:83d1 with SMTP id 98e67ed59e1d1-309f555444amr889337a91.19.1745519759038;
        Thu, 24 Apr 2025 11:35:59 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:35:57 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:42 +0400
Subject: [PATCH 1/5] irqchip: vt8500: Split up ack/mask functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=2522;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=tSGH2p1izsSzRGjyaTk9F2yB01tgjf//IQcyliOLsVk=;
 b=j+S/3SxqUxx37jAiC0EshP0ayQNjwapgRbZyRm7sa+cleuMq8KQnMaIYOXEhj/xWPQ3KTGXJz
 oAig4ge8TpHDrfBhQtp3jRK2NDuBnwyAPWOKpax/mT0WqBUKfpoflGz
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Original vt8500_irq_mask function really did the ack for edge
triggered interrupts and the mask for level triggered interrupts.
Edge triggered interrupts never really got masked as a result,
and there was unnecessary reading of the status register before
the ack even though it's write-one-to-clear.

Split it up into a proper standalone vt8500_irq_ack and an
unconditional vt8500_irq_mask.

No Fixes tag added, as it has survived this way for 15 years and
nobody complained, so apparently nothing really used edge triggered
interrupts anyway.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index e17dd3a8c2d5a488fedfdea55de842177c314baa..d0580f6577c88ffd7e374d640418d1fc23db623e 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -67,25 +67,25 @@ struct vt8500_irq_data {
 static struct vt8500_irq_data intc[VT8500_INTC_MAX];
 static u32 active_cnt = 0;
 
-static void vt8500_irq_mask(struct irq_data *d)
+static void vt8500_irq_ack(struct irq_data *d)
 {
 	struct vt8500_irq_data *priv = d->domain->host_data;
 	void __iomem *base = priv->base;
 	void __iomem *stat_reg = base + VT8500_ICIS + (d->hwirq < 32 ? 0 : 4);
-	u8 edge, dctr;
-	u32 status;
-
-	edge = readb(base + VT8500_ICDC + d->hwirq) & VT8500_EDGE;
-	if (edge) {
-		status = readl(stat_reg);
-
-		status |= (1 << (d->hwirq & 0x1f));
-		writel(status, stat_reg);
-	} else {
-		dctr = readb(base + VT8500_ICDC + d->hwirq);
-		dctr &= ~VT8500_INT_ENABLE;
-		writeb(dctr, base + VT8500_ICDC + d->hwirq);
-	}
+	u32 status = (1 << (d->hwirq & 0x1f));
+
+	writel(status, stat_reg);
+}
+
+static void vt8500_irq_mask(struct irq_data *d)
+{
+	struct vt8500_irq_data *priv = d->domain->host_data;
+	void __iomem *base = priv->base;
+	u8 dctr;
+
+	dctr = readb(base + VT8500_ICDC + d->hwirq);
+	dctr &= ~VT8500_INT_ENABLE;
+	writeb(dctr, base + VT8500_ICDC + d->hwirq);
 }
 
 static void vt8500_irq_unmask(struct irq_data *d)
@@ -131,7 +131,7 @@ static int vt8500_irq_set_type(struct irq_data *d, unsigned int flow_type)
 
 static struct irq_chip vt8500_irq_chip = {
 	.name = "vt8500",
-	.irq_ack = vt8500_irq_mask,
+	.irq_ack = vt8500_irq_ack,
 	.irq_mask = vt8500_irq_mask,
 	.irq_unmask = vt8500_irq_unmask,
 	.irq_set_type = vt8500_irq_set_type,

-- 
2.49.0

