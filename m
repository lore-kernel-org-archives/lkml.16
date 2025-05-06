Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80180280310
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535619; cv=none; b=sA3hOH0LxWKbZkVs44LHRF4aeZ/zk8EU9MBjCaeqZYAcW78KL0jF2I6XwL+Z+JTV1SJoxiIT75CIzKLUDBc4zkpd2xGCyI3epAgrGmmebT1WByeERSP+XnxOgSkVKRC3ycU7WMj4bxHUELRcd8l2pMMn79/6XjFkbECl1cp+NEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535619; c=relaxed/simple;
	bh=ZvhDtpu1XnYczmFh42T13jRZysqmiKlyJitHmezAOec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/Hb2HXhv7EmCM61OvzuAih3pUVPIppEnvaZ0Ft5FD26lvNmjldoeD7NV8mgvtqvP4bxXEMOfOt4qCangYWav1y4hlfv4StYPR7ZGL22+QzZkJ/XK4nzFAvVIDypdhCPfR9Li2CbHEcw1t6FYDgDEv21I1YnTqxb6M7pgBbSL/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcXbBczt; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcXbBczt"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso5887434b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535616; x=1747140416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=;
        b=BcXbBcztr8QbXuWR/84Nvb2NZZjRWpJbdhvL7wxN1tiubv8VMpgZKvGmUE4c7xlrKb
         NcdPngVYEHE35T+OM1Zwf22AFJHvO2NBipA5wVW3U5+wAb6dm4vBphSwwwz9Ao/hTWkl
         nJQJMdtSrP5AQMt71BwOxDc0Iuvbn+Vbimr1RvXc4IEclxuKPF/BwZOtT4cWibD653M1
         MayOlzOwhI3B7maueWvQdOlS4QXOu9gS+IgxqKRNhgFLqii6tRO6c0Y6auXPBmeVGWY7
         +3a7E9Mp+WhARLwpqFl5HZDterhV6J5xoloKN0Y1PZ3ejebDHpV/fGkpqabvfrgGJTfM
         nzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535616; x=1747140416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=;
        b=VheHRWBP2PR7JLEcNS00nJOa4JW9q4w8zUxCxhiy7MLPX8vIzOR4Pb/+QybGFyTacY
         xNeVBvz55V8br0e4TbA2dYnBVTbhDiXsPxa7S+av2shG0TlKulrGB57RJyZOxkkyXV8A
         bHBiga5ts5/Ec7Mq3fvbDtpSmJlWFjfz/U3VaMrn43Ay/dwdf86zVcIZMEpOSk2P9w3A
         oQBlmDgRP5q0YwiFLFzfx8Z+bWCNANMlj0dzgvFwQDz4EXf7W3mPlAu7tyo3Gu6Iyq//
         KutDqKAX2hNBhCsDVuTccI68gydleFjpsYZhsdkCzYa6HY/2rEK6k35TeCNBoG9PK6k1
         MEZg==
X-Gm-Message-State: AOJu0YxP7g/ee5tGiU7pQkBcmItbiOHPH5d7JapmQ2n1XVeX0PmIBVXs
	auh4KnDgLRLVANxDNDnBSXd4NIX67uWcd3qbAZvQEWxhaL06uftc/t3IUGuRUSg=
X-Gm-Gg: ASbGnctWfX1w4voWV0tlDtVQDNiOO87Kbw4mCOEyC6uZ8k+Z1R9LYQU7lOxun8KhjJs
	rV7LBg9gwNpEakJlXDcM5nebNB905j5Qf2aKQKnz19yXsX9q5OIs3QAV0D99rpcSbeocDQygTKa
	JF7bTcny4EyvnRb8J134C1yl6V2g894hAQwWY6QREDGM4J32NrDBNt91iTmPQMt8mcwFwbpoQ9i
	lN9RjVO/yKAj33BBIUt6lYRpS+8cux5ZBXndkZ4BSYGURPqeasFgyeYTcI+y8nVmZ3Lbjv0Xq/4
	/SK4eqy9WRy3y1q5PreZDmVXF2LN03AlR7Vgp6p9px6rj8qPk9qM
X-Google-Smtp-Source: AGHT+IGNnSAXy5brjBvE4/Ufe8niP9wxz79TSWuqxShduDXk0L8S+++Yl5TbcxjPSKCoiJ99zpb4Bw==
X-Received: by 2002:a05:6a00:414a:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-740919e8b75mr3877019b3a.12.1746535616578;
        Tue, 06 May 2025 05:46:56 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:56 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:18 +0400
Subject: [PATCH v2 5/5] irqchip/irq-vt8500: Use fewer global variables and
 add error handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-5-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=3067;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=ZvhDtpu1XnYczmFh42T13jRZysqmiKlyJitHmezAOec=;
 b=hopGDJ1av82b4uhMrK9KRsi9pPIm+0cG0QqUktUu2DfKw/R0jeG+0DfJ8Ha+Nagjm+pp4HA8t
 y3nQTlp2jYaA7ESiaGbw4sOF+uoJcaOmN3h2V2rK4i48cwtMykjaPTe
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

