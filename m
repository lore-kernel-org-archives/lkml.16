Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241417A2EA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519766; cv=none; b=HEVFbXbSticFkkj1L74rSBnvqzWDNzcScEwe1CcEoxAJEtk6FKLzN3deMZxHAt1BupLn1ImBIOaC634eJwAnuYikenlu2lZTGOfZq7wWDjYiWEWw5WHcQ9tcPqvQxirhXU6wQUU0chzM3uskcVv146mW5XKEZMMAhp5MeysdOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519766; c=relaxed/simple;
	bh=5NC/31HeV/bFV7gPszc2SfNMbyljqfXDlZ++AHm2h2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOGAN5sLCykNF+ct1vEf4Q58mj/8QN5UhlSLsctbTMbsznRgpFW+ODz3hPxksazrBGt5Xh0O9mOkCbR0ipGnKK3J6q7yLW/OrBi/MfissXFif6c6j+8CdJWxV6HwRtiDnDdHcxYZDZljWv4GUJhS8qk6rB5mBJL0oYMTgxJYnZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUHxgDqF; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUHxgDqF"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b07d607dc83so1194084a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519764; x=1746124564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=;
        b=BUHxgDqFmDt+10L419rtHDEvjDQfqDYxsrGkiVY6w1HBCzA+gT7QcTkZiXDBgJlGpj
         GFv8B/4SwNeXL5TLfy/nFLx3+Qqp6DMMwEqz/kavzbxsIVjj2OuZzNxKHAFvOukvnK48
         Qwoj4SiO8aXNVP0pix+e2uIArJJvPZxeVQg8RYwyQUuzpZblOnD5XopCLBtnYInckSeG
         uyBWaOBJEgUMZWn+QbiNUyXeENPg7kU052pUGi/RgzbTCTbEk+4hK7gbOZnrdLNpezjH
         F8y2zLUOls15US50t7BC1fvBNM/VCFz/IaS3YsbSX1Yn321ZqqW9fbu7f0vD5rR0PPAV
         kgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519764; x=1746124564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=;
        b=lt0SAsUIHvHFSuicMt3QfEhb9SkAkc1qZeB9njVCyRp5ZxNehTqrU5425UcM5yYB/U
         r8S3BxvhvrNYSWke/LjiHqkEEcmmCS8LI0pKR2z7PvaUmyswsNYtCzAW3i3JdLiBrDNU
         DiFVmRN41kvKknhXuYrfsGAimg74cX3w8NWHyGwMkRv61us2LQvyUQkzvgJxIbpw6pLU
         XdUNaMmplUmywS7UohUxZ4Etq2piBJPo1lnW8Mya/rDEbf8F7WACi0adJXJe/MLef0TX
         aJwCVZ6q1gxRUaeND8t+GNzcm4+OXTeEiSmeuNo8tKjvfFDOc2nfjmIiqlRYqWUwOwr5
         0jVg==
X-Gm-Message-State: AOJu0Yz2lbzIWhf5OdbjxJNxOysZQVExJvJhuHXXM2FoqV7sH3e/5INe
	sFuUalZtjY4yge9K9qyCKANWTGJP3df+AgIpYXY8KWKnztD2FSEZQZDhy/zq9qs=
X-Gm-Gg: ASbGncuOLpQZDZ1q/2Q5THx0/uNRzbM32+A+rFVpgZFeeI971aNmy+gNPkkaJk2cB5z
	qotNrMzIw9qqs9ur2ClaUIQZWtnHqlC+Cgu5TiXPgIyUqhXgYNC6p5gHxvlzlzttmE46rbObY4K
	dTWGZmvSDr3gyzqgxOSvbFSTK1uJ0RbuOj2HTFaXFjWCkAbMxUX5GIL+1vdi1qUbqJuGjeom9gs
	U8ns3r2+xfpimhzTVHcmKK4+xIq/q8xtI0OBWwDPxMm5G057S5+GPUwdCmOCj9ZqTL0dMhgSdoH
	hSwbbJmvLzFlgXNv6jPJ51xMZ/5HU32izuTbp/L9daoHGgRDJiPdLbjqcl0L+Kk=
X-Google-Smtp-Source: AGHT+IGCSXn9IY6DXLjgv7TaEaRMForSpf5piyeU0bRjjr8ZKnekj7GpjXcUSx9E35YhE6n9xka1lw==
X-Received: by 2002:a17:90b:51c7:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-309f56b5079mr982684a91.24.1745519764364;
        Thu, 24 Apr 2025 11:36:04 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:36:03 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:43 +0400
Subject: [PATCH 2/5] irqchip: vt8500: Drop redundant copy of the device
 node pointer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-2-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=1647;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=5NC/31HeV/bFV7gPszc2SfNMbyljqfXDlZ++AHm2h2E=;
 b=KLGt7ovQtPKKPs+n2tdAi90cNKFX2aFELZydig0i1+axAIZqPnlWa8YajigkPInouyOgxQr5I
 ZSDurVYZrEVB2wrj7T47o8y8Z4ZWfgawNj4g915UIT0Bga4Dlb2dIQi
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

