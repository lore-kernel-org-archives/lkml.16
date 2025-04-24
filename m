Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C7728EA4A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519783; cv=none; b=Nv+mjBAmle8ZfPP4wgOkt/zvxroARaCvr37jX0oDlZFV/x/bUtpPjRJYe0WQPCfUHAnZUV7bA527YYl3ReVerGOZWGyJQlrqwsPIDu4Nbg2HhTY3H8XdB0COoSXmDYDQw53ks9e0ej3W4flOjZDh3eEVcWtTH4GFxxcbI5mVjss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519783; c=relaxed/simple;
	bh=ZvhDtpu1XnYczmFh42T13jRZysqmiKlyJitHmezAOec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNMbV9cbSYrvX/aJdygtBP9OyNAWdJ2F4X+XUDBZgvisSEMhIopNoe2WKAILFVe8POfi5pYfsw3MG1M4/l8QOOWp+2nC4QqoRtoNAYQItJXE68XPV4Mih3LI1STu0XLAZqs6X7SbcV+W6Msa473ACxTckKFGo7OrHe56vcXHTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT3jF2I4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT3jF2I4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fd89d036so18209835ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519781; x=1746124581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=;
        b=cT3jF2I4SedIegVrGt9jCeA7HeQkWeqDxpNw67UxUwTRj4lYwKwtrF85yHDTf9xT5t
         5WR6BqGLoUIpYobinQ9LCrvFX3thwgm0qram7zt2eJH7va38ovrDWaKyiOhw5jKVOOxx
         ptRAxQY9K7mGCzcj77nhmGY7BMh2qadC50ceaeb/RLnxawlTLU+DccjlTa2Y0v+htzKs
         U9OxBjO6yJv5jXM31QtqbNi7+4OgQIsVaJRtdGNP89pch+TwYtw+fifVR6tf2C07M/NV
         w1SzuH4vLpT0Tbwrc/xtT9+MarQQGPUVUixOHlsdr2y+tUcSZODOpWYx31vjUME8u2Be
         mzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519781; x=1746124581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=;
        b=Z2qpSZ+yTLerAPY6LxvYrDOaeR+ykovYW6lSn31H7EwWzbeI/bJM79ACeZIEzxDFys
         jJhi/GvhDkN5cPcJZx1aKNNlaplrDuOiRNU2ZBpMHJ9Wpg7WfI+cXTBOgHxu/6wUybuw
         NsOVc1jSXgniN7Mefr8OklvFDqJNOwKgqP9kQfnZV3OIqGsoFF/wWkNBWP5FcfOIatke
         W4JK9+6kfLSxFv8rWPMjuQ/KJI5O+rljNZRt9QE6aH9Kbyy36pc8FB0LHHDL4EfXjkbo
         8zsoRAaE6QG84ad2aI9cdHQdqT0WoKgawtujgs9C2Tb6DioVKAuKuiKKdJ2DIT73ieo+
         ETZA==
X-Gm-Message-State: AOJu0Yz5ghVhTKiLlS5LgmmZOMg2sokTMuub/GcdQcVcOjwLuw9D5IR6
	IKsyd39R+qeudwWAlEEcFuQppCN6daFA3vQTYQ9uSyC+TEAX/7AilCbno4cPfcU=
X-Gm-Gg: ASbGncs+oBAVKYJWZz0gKJCVbDtjt3bzO5048bMjlLhZTRLvnE+DBpIpGPEPNPadoKl
	WJKYo/pstrTSpopLgSeblD+FmJX8C3lLTlB9fSv6sb6bXy+FR6QC4mxcPNCpxCD+UJQOY7InTZw
	fG5DL7dxj62F3F3ivAwjHetehwC1CtpviOjHF2+Ixh7HBD1ReOUlAYpjNIDscfR7zFs5zZlZwCC
	Lluhky1RY0OIBFGzMBT8IzDNoqEC9CEvNkoJoaaciWDVZmTTOtZUqEXWNsMZVkfa+G0xrWbzJSA
	RyGt5HYDXdAtlWMFUKNVgVK7qAlzaWhXvKfiBh6plLAWoQIKLeXW
X-Google-Smtp-Source: AGHT+IEvTVhxG/HEpoGdmUvZL3DCkshSAemk2nnUG/eNuUy+xBFFooJCg81CWaxVrYyBfyYOjuULjA==
X-Received: by 2002:a17:90b:5252:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-309f554f7b3mr796266a91.21.1745519780757;
        Thu, 24 Apr 2025 11:36:20 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:36:20 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:46 +0400
Subject: [PATCH 5/5] irqchip: vt8500: Use fewer global variables and add
 error handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-5-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=3067;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=ZvhDtpu1XnYczmFh42T13jRZysqmiKlyJitHmezAOec=;
 b=bxYbJszU9Ih3oQcgQ22sUUyhzKZ5U10yKce/YCYZElGTjmrBbnI76TANVVuNwV0vHa5kjA9b1
 7cWE9X3r1hGBvTgGKCrfwBkIuYZXGepvyYgpJCikl4fZqwKysm70/vL
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Controller private data doesn't really need to be in a global
statically allocated array - kzalloc it per controller instead,
keeping only one pointer to the primary controller global.

While at that, also add proper error return statuses in the init
path and respective cleanup of resources on errors.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 49 +++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index aea43c838430d2a541aa9b3127a215531abecad8..0bf478c6541ede30719eb1e403d9cafe6474643a 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -64,9 +64,6 @@ struct vt8500_irq_data {
 	struct irq_domain	*domain;	/* Domain for this controller */
 };
 
-/* Global variable for accessing io-mem addresses */
-static struct vt8500_irq_data intc[VT8500_INTC_MAX];
-static u32 active_cnt = 0;
 /* Primary interrupt controller data */
 static struct vt8500_irq_data *primary_intc;
 
@@ -203,50 +200,56 @@ static void vt8500_handle_irq_chained(struct irq_desc *desc)
 static int __init vt8500_irq_init(struct device_node *node,
 				  struct device_node *parent)
 {
-	int irq, i;
+	struct vt8500_irq_data *intc;
+	int irq, i, ret = 0;
 
-	if (active_cnt == VT8500_INTC_MAX) {
-		pr_err("%s: Interrupt controllers > VT8500_INTC_MAX\n",
-								__func__);
-		goto out;
-	}
-
-	intc[active_cnt].base = of_iomap(node, 0);
-	intc[active_cnt].domain = irq_domain_add_linear(node, 64,
-			&vt8500_irq_domain_ops,	&intc[active_cnt]);
+	intc = kzalloc(sizeof(*intc), GFP_KERNEL);
+	if (!intc)
+		return -ENOMEM;
 
-	if (!intc[active_cnt].base) {
+	intc->base = of_iomap(node, 0);
+	if (!intc->base) {
 		pr_err("%s: Unable to map IO memory\n", __func__);
-		goto out;
+		ret = -ENOMEM;
+		goto err_free;
 	}
 
-	if (!intc[active_cnt].domain) {
+	intc->domain = irq_domain_add_linear(node,
+					     64,
+					     &vt8500_irq_domain_ops,
+					     intc);
+	if (!intc->domain) {
 		pr_err("%s: Unable to add irq domain!\n", __func__);
-		goto out;
+		ret = -ENOMEM;
+		goto err_unmap;
 	}
 
-	vt8500_init_irq_hw(intc[active_cnt].base);
+	vt8500_init_irq_hw(intc->base);
 
 	pr_info("vt8500-irq: Added interrupt controller\n");
 
-	active_cnt++;
-
 	/* check if this is a chained controller */
 	if (of_irq_count(node) != 0) {
 		for (i = 0; i < of_irq_count(node); i++) {
 			irq = irq_of_parse_and_map(node, i);
 			irq_set_chained_handler_and_data(irq,
 				vt8500_handle_irq_chained,
-				&intc[active_cnt]);
+				intc);
 		}
 
 		pr_info("vt8500-irq: Enabled slave->parent interrupts\n");
 	} else {
-		primary_intc = &intc[active_cnt];
+		primary_intc = intc;
 		set_handle_irq(vt8500_handle_irq);
 	}
-out:
+
 	return 0;
+
+err_unmap:
+	iounmap(intc->base);
+err_free:
+	kfree(intc);
+	return ret;
 }
 
 IRQCHIP_DECLARE(vt8500_irq, "via,vt8500-intc", vt8500_irq_init);

-- 
2.49.0

