Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4260424E014
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535598; cv=none; b=WqpSrXKUnejs5XRD+cUp7DX060PwkZ627hwaS2EEIPlptZN+hU/lGWQDHtR2CHxpfdVmJekL2/3EVb0flfFaRMjOx4zjBVLMzW7TsoiJZsgDO4CNsbAsd5Sq3/+zx+B2u/sqAFs0vAjazmbqbYgPDx+r7iMUOWiezzjxsoxnLbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535598; c=relaxed/simple;
	bh=tSGH2p1izsSzRGjyaTk9F2yB01tgjf//IQcyliOLsVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l11Xwa4jx8gvlhykm+sqhhiX3x2TC0Svd/+lo+4FwCXNzMh+OYWVOxlcU3+Zc9VntdT+QV0M6QathSLcTnxhzwxLUkc3WNFb7nBJQrxVC1hhLkXx0dLz9JOWt+mTkJ57XuBXJ/wNyfZw4WdSSsBuUTIGSZxsWE7xPiLksXQ2GSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiVIrrKm; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiVIrrKm"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7369ce5d323so5001490b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535596; x=1747140396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=;
        b=CiVIrrKmo9YcgNzVr0TUoIsw7l2oGPfSW2RdKLqESowdu5y2nYjl895VbuQOU2Nrg2
         4jJ237iup+mPJCsjZI1iv2o3glsuaJRSMYMzf3XyZf9DgVQAUahWQd+dSFq05bR23yOZ
         TBYA5K62BFfLAzbijQ8CMw9W2xmFdYPxarDe4cbuvp7gOaqaGCxfNFThTwgygqVtHGue
         jN90CZi/iPWrLxA4DrOtg1iVuuOhriLBCDaH8UBbn5NIOk4u7ssJCQMZIl95p0tjLlPz
         jlSLJsBpVllVY0cVIxrQDxNS44aQQa0BSXX9lexWGhitouqpppHeVWiw8uIJQ4kgpI3s
         StBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535596; x=1747140396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=;
        b=dibLYlGmdDedxyEYjcb3JI9Q3w63L9mp3j+hM+o5scoiElJhGsMF//Xb57qYjVcx/R
         Zy74Mdl0c5QJv+byWGy8ia0mp+XoAjGszs0lPF2xcGiVdMyHF7uRtNw3APGBvM30ZnTP
         W1Rpe1yquLnegumN/zIc81LouwDpvz6ej93tyny1hknzzd/F3qL6IztL5SezlL8NXKVM
         uUOxX/LZ1/LBJh0zI5nnZZ693qUPXgd+jal0c6AtYF8YQwwFvB8JUVkd3yJqxnWZ/+0H
         sEKQdpkR0YbQN9lRIxFUJwJlakygwZDbCQHYmoqgv7apCcXa7vCQ+IHhKzV4zJgDSeNk
         C3UQ==
X-Gm-Message-State: AOJu0YybBHyVNLbqdTPj2qEIirkClbSTvn8N2T4GBn3SNpK8gSnQGCNS
	10mQL31f2HcWNUN2ciPk28jfooL6eBCNPVzOD1iCq4NXNVXTXMAa
X-Gm-Gg: ASbGnctF5hRO1Gm8GswFgyd1JEe95pg2MQWhz8lSvVWhqqj8x61m9tdSL4z1E1CzEEn
	IpsXLuGOFah7P+M/SeBgWMaH6YqJGpI2mIEYgfiPIYcYO8w3+U/cb5DwMfhQk4v5DSvZHDfMsWc
	sLqiT35qaT5pJ6L67SeS2BkLdTzRVBNkkqmeJ0UoZ+6xxZ/9LchW9EsQKc4zRUnAPwtmdCV8DYc
	HA9/a3gGtFZcI+NBBPoMVGT1mZ5oZNrLObWlE7NPszUVHrOaLWaRjtj0jnTEp3kR33IaudPyc5F
	V2nNV1gsdUkgi/ceAXphVgnf9iFkkWAAQhwB38xIONxqd6okhOyv
X-Google-Smtp-Source: AGHT+IH17mxLxSA2PPD32ssm2/FIfNgX6IYtN/NMQKdYqAS/9zwe1/azeH9miKCZC0U7mivk5kWCBg==
X-Received: by 2002:a05:6a00:4090:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-7406f08b86cmr14867749b3a.5.1746535596522;
        Tue, 06 May 2025 05:46:36 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:36 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:14 +0400
Subject: [PATCH v2 1/5] irqchip/irq-vt8500: Split up ack/mask functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-1-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=2522;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=tSGH2p1izsSzRGjyaTk9F2yB01tgjf//IQcyliOLsVk=;
 b=zVTy0eAGf0nk6m25bKp+JZivOS1zpVtPTNs2BF9o/WLAqfw+yjEJaO9aqqF27dhamda08FM6t
 Ltl37TGFCdGBhdQJeaN2ER//sDC67QV5qkPi8RmmBuK7+Um6FH4JdV+
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

