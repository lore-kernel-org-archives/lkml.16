Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D6627A466
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537470; cv=none; b=LmzNemAL01p2h8lRyGiYnd8rZywd/ZcFxgjPChiojuiVSEHRDa8lrvGGG5+AvhW4iK9crzjwkh0hAyCdvNydcTuDjunBq89NUEQ0/gBaSy09gvlJGmN9dHsWa8qxUfh/DjxfSoH/cDP1bIbKiE11Wk/pApgmd0b2K4uGlxNmLxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537470; c=relaxed/simple;
	bh=umYRAyNxgl2HYZ7p2KaVACmUzc1HewJ2ITDuB+SFwwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X5bNKvRSns7NsRzWVaY3QAOFvfvF4kAvRRoLQHBR12hgGkEVoaZmpD0oPExJ5wqPY5947OHxEkkNFsCGWIwBw5MraNsQxn5aiBkIpUqNsZyCH0rAGfu3JhaZvcDQ4qSOQTf+ge8z3tc2Dm4bikJm25du+qcpeFouPZ1QbMTZRnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j84L7aFG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WNqWkLXY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j84L7aFG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WNqWkLXY"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746537466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=n+g6kuADuy3iLk0jzc62Nn4MXtrU99gjHVGmhzoZ3Ss=;
	b=j84L7aFGpDub3We+tUZ1Qm/FcRD8Kwd687Pfsc5NB36n3uzGlSBZeITd/NalH85+rJ31DT
	qIzI5aPzLoFp2WWgttpF41c6G5lbHf+WMzvrwcqwsxySC3lVtNR6zA8lu6vDzB/pqI+X7+
	xqtd21PfgKOMOnMwkYHvkLheE47XR/K8cOtZU09sniFaTfEPNIiDg2N+iugnLPRJIVw2s+
	bBU9qHX67BeB+5dNrre4y0NmeAdj15CyeRsijsP0dIfRLgeOU3LLQg+yXfYPquUzgGg3vA
	xCKPCG2/W4pQZgY59cCb7k3RWx8yNy7f6hyKb5lNhzrpLbnlRXKb3/9lYk8kRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746537466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=n+g6kuADuy3iLk0jzc62Nn4MXtrU99gjHVGmhzoZ3Ss=;
	b=WNqWkLXYdnRfOmVT4DA+bDxtmfjXozNOqXsSuiXfNsKqjxftLVydAkFjmjA29/hVebAZdf
	khX+6IEcFRcSLzCA==
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Caleb James DeLisle
 <cjd@cjdns.fr>
Subject: [PATCH] irqchip/econet-en751221: Switch to irq_domain_create_linear()
Date: Tue, 06 May 2025 15:17:46 +0200
Message-ID: <877c2top39.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

irq_domain_add_linear() is about to be removed. Switch to
irq_domain_create_linear().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/irqchip/irq-econet-en751221.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/irqchip/irq-econet-en751221.c
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -286,7 +286,8 @@ static int __init econet_intc_of_init(st
 
 	econet_mask_all();
 
-	domain = irq_domain_add_linear(node, IRQ_COUNT, &econet_domain_ops, NULL);
+	domain = irq_domain_create_linear(of_node_to_fwnode(node), IRQ_COUNT,
+					  &econet_domain_ops, NULL);
 	if (!domain) {
 		pr_err("%pOF: Failed to add irqdomain\n", node);
 		ret = -ENOMEM;
