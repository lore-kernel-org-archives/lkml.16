Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8627FB31
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535603; cv=none; b=hlQ2i2YVFjXcR7pF2c8CaalwnYmeWhNlZcsz88QLm/JjobNo60sAigCjVxI/h26KC7pNVVtzBBrroA/162nKkYgczSRZTFfX9kfc8qa+4XWsYVqg5aoKip9tIC8Yfnd26GkPEdsoQ8zhqisoufOoWg3GcCeC+vy1Mip/5XWdGCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535603; c=relaxed/simple;
	bh=5NC/31HeV/bFV7gPszc2SfNMbyljqfXDlZ++AHm2h2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eTl0vwFcSnQ4FTi6BxMy9gEPUPNQVtEYqgzw96cy+1yzGMfc6Z42R1XAjOlG6Lm/EfzA80mnj6CvIFNtBAhGcTbwvj+om19djx7UzlhiuWyOXy4yNCHrzO63dI8CyHuZCnl2aOf5S3yLM48jft9nkMZtT0uNGyUPeVtkrdXh2w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDVjKQcQ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDVjKQcQ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7394945d37eso4628008b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535601; x=1747140401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=;
        b=BDVjKQcQPkjc2yg/lQY14CX8xY1XoKovfmB2JNKL+dIV5k3QtiNrIT4zmq9qOnksRK
         TRg+v000d2hu/hcmXR6hJ2NVRgCoZRwMRtc5TD/Atd4kypVd7KxS70XRueTHF7p45lLQ
         R/P6CSr4Xd+dl6/2LzYV4pk2AKXLRaYrSzd3Euic1jihyXBaAPsbArDlq2EkHihR3HSZ
         xnkyHA4q828kCPuRS3LsV7qXvBa7PUGbRVt2hbp7KLAkepnU8yht12jC6sG4Mhb60DAg
         v8bMnmiWpG/L1OKm96GMsjdcI6d/fFX/zLmpkjRD0ARiOQIem4ibyDvE4BPPCyW6c/YJ
         EP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535601; x=1747140401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=;
        b=VPobOLZtdAcMI5x3+lXIeMjVtfKuMm8LjQI++mZBOS2LZY2P94JNEPrUfOkNf+cAaR
         be7BDSMoBDteiPd9cGV8E63KqMjAyqqLorSHQXeWnpe592F1B/GnBtaT0zlQvxLF1dvr
         v9zCt8JnUhVlJdZP48YrFGfpksntAEeqNjOf8C7R+vOlsPdiKKKalSMLtmn1A91Rc2FQ
         2gTBdrKFF4WX4/VMIpjdMaHeZ5Lnz9QqHTH0LNOZpA6YrYMTX+7FP0tntHeWqJd/WsW2
         YPoyOZHnERtCW2rz+y1M0gQ+/BqyxHglrCV3rmcoJ3MGvVSlR89MSKf3DCb+AOqXfq8D
         LsBQ==
X-Gm-Message-State: AOJu0YxoJRk5vUNz33Vc2FCpJhNz1vGi4SVuOj/RwHLGauhsBYuhbvLn
	Cvc0P5/lLT2ngIuOLWBR8nHMRVgxF9glsD62jb092wfUQ4DYsZa4
X-Gm-Gg: ASbGnct0ynSs/QXD5sfRAB4vUTk+S1jp1nQdL21S9GjzReL46de8JErMAWjn1fxQVM+
	zns5zm1+f8Dz98FAMOk6e/tdS2zP8lQXPf42rw4O9d9kdug/gtSyoJKxGtLRVdHeYPIQZ0ieK7S
	/n/Mncz+jKEyIWyiJugsKcmNOuCKzBKVYHQenIhsuqaUdI2mrkiabQt/KN2Z/BQqXpv7Kl/lnx3
	plwqohQEzTI6s8qx+5KoDPtFWCRdYnFerVMDk7h8khTlN/lq2jy/zMrte9vcp2StM7/cuyFX4cj
	8f2yMptQUUsAomLiaJiJcBQbouItCGOqv6UUyv0iQuQa79Qt8idA
X-Google-Smtp-Source: AGHT+IGowFY2MVMfbMWWSCYh2dopuWBl9OWrkFvlshF/0V06/C6EkV/6AUrpLqlxmj7eZ06nAxOmnA==
X-Received: by 2002:a05:6a00:369b:b0:740:3830:4119 with SMTP id d2e1a72fcca58-7406f177d74mr15436359b3a.18.1746535601545;
        Tue, 06 May 2025 05:46:41 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:41 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:15 +0400
Subject: [PATCH v2 2/5] irqchip/irq-vt8500: Drop redundant copy of the
 device node pointer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-2-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=1647;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=5NC/31HeV/bFV7gPszc2SfNMbyljqfXDlZ++AHm2h2E=;
 b=lRrzoWPpBic995ZB7JmJ6Ikfz+jrP3eE9vsH/Q6Qh/pbqxKJe4IhEQmlHSrYNkspNch4vwfRJ
 ttjdF0YlCrnD5uvwEo+6nFtUAU/mjGobOQfWkrw2RxQBHyvpt1N8WhD
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Inside vt8500_irq_init, np is the same as node. Drop it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index d0580f6577c88ffd7e374d640418d1fc23db623e..6d46e1a0fda953d76679ad2318674fdf0a977f0b 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -191,7 +191,6 @@ static int __init vt8500_irq_init(struct device_node *node,
 				  struct device_node *parent)
 {
 	int irq, i;
-	struct device_node *np = node;
 
 	if (active_cnt == VT8500_INTC_MAX) {
 		pr_err("%s: Interrupt controllers > VT8500_INTC_MAX\n",
@@ -199,7 +198,7 @@ static int __init vt8500_irq_init(struct device_node *node,
 		goto out;
 	}
 
-	intc[active_cnt].base = of_iomap(np, 0);
+	intc[active_cnt].base = of_iomap(node, 0);
 	intc[active_cnt].domain = irq_domain_add_linear(node, 64,
 			&vt8500_irq_domain_ops,	&intc[active_cnt]);
 
@@ -222,16 +221,16 @@ static int __init vt8500_irq_init(struct device_node *node,
 	active_cnt++;
 
 	/* check if this is a slaved controller */
-	if (of_irq_count(np) != 0) {
+	if (of_irq_count(node) != 0) {
 		/* check that we have the correct number of interrupts */
-		if (of_irq_count(np) != 8) {
+		if (of_irq_count(node) != 8) {
 			pr_err("%s: Incorrect IRQ map for slaved controller\n",
 					__func__);
 			return -EINVAL;
 		}
 
 		for (i = 0; i < 8; i++) {
-			irq = irq_of_parse_and_map(np, i);
+			irq = irq_of_parse_and_map(node, i);
 			enable_irq(irq);
 		}
 

-- 
2.49.0

