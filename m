Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A320F13B59B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745167629; cv=none; b=qc2gjCmD5DnhABxxmVdloQJJS4vxkBky69i+iTFfY1A7KUUKljBXdXpxtiGoBnll+gfqHfdeddOTdkMqh9kyGV6FotSWO2LeK+1QRRdZpz3FhfI5wzTllCTSB5RmEi+JTUU7wfk0XI63mSU5PaN9PPFaUt4593fEdcOSGWwXutU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745167629; c=relaxed/simple;
	bh=jw9mSXaSb8FkMjdI56LA8aM3DWQo/jKSuByNH7raB1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNq2y+/dCC5nbP1XRpmqdtXZfQ8Nonttssq3u/I61UQlfQ1ZZQ97kJo5uHsaBjRtayYZ5YhSznGQpfx/15EGO8EVu/PRP2Cnlal8VrbUiBD4V5RUdDI6TCz8EW7bneSGJv3k3KmixdLUqVrV/EFFlLTMggKTmqXn3o5JVFOWIDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=kbkDROuK; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="kbkDROuK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=AVzeLTBgvSZ63EokZGXCQzmrJuI7kMjaxV7jaOwo6l8=; b=kbkDROuK2iaqLC/j
	JQL8IioyqlRtER/kq3JdxIIgbwI8VP/awhCWLTmM1tQOhZRd8s83aajGr0LaiPlVsDqTiu2y7ON7B
	LD0LT/3R0Lbk43gr5ziPQGsN+2j69SnNokbNUJn5lAtshw2gvL0ufMAfJJf0D+1CmyWflQX3lassJ
	ndPWm+wmPDhrD873R7Ea0zVuZBUqzwjVNsK1TqJlLtgrk8XhE5gjM8ksUhQVAh5THCpuOaFSOfeGB
	yxusPiymk/Cj7/mgtev8tPd2m3DSoAEr31mQWzPJi/RhIDuv+gYpDygbtUlO2qXaWzUCwU5jZv5mj
	FruSwcojKAOvwLu3JQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u6Xon-00CjIK-00;
	Sun, 20 Apr 2025 16:46:57 +0000
From: linux@treblig.org
To: tglx@linutronix.de,
	piliu@redhat.com
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] genirq: Remove unused  remove_percpu_irq
Date: Sun, 20 Apr 2025 17:46:56 +0100
Message-ID: <20250420164656.112641-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

remove_percpu_irq() has been unused since it was added in 2011 by
commit 31d9d9b6d830 ("genirq: Add support for per-cpu dev_id interrupts")

Remove it.
(I see Pingfan Liu tried to remove it as part of a series exactly
3 years ago, but don't see anything about why it didn't happen).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/linux/irq.h |  1 -
 kernel/irq/manage.c | 15 ---------------
 2 files changed, 16 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index dd5df1e2d032..d8554da1b226 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -597,7 +597,6 @@ enum {
 
 struct irqaction;
 extern int setup_percpu_irq(unsigned int irq, struct irqaction *new);
-extern void remove_percpu_irq(unsigned int irq, struct irqaction *act);
 
 #ifdef CONFIG_DEPRECATED_IRQ_CPU_ONOFFLINE
 extern void irq_cpu_online(void);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 753eef8e041c..30652434724d 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2497,21 +2497,6 @@ static struct irqaction *__free_percpu_irq(unsigned int irq, void __percpu *dev_
 	return NULL;
 }
 
-/**
- *	remove_percpu_irq - free a per-cpu interrupt
- *	@irq: Interrupt line to free
- *	@act: irqaction for the interrupt
- *
- * Used to remove interrupts statically setup by the early boot process.
- */
-void remove_percpu_irq(unsigned int irq, struct irqaction *act)
-{
-	struct irq_desc *desc = irq_to_desc(irq);
-
-	if (desc && irq_settings_is_per_cpu_devid(desc))
-	    __free_percpu_irq(irq, act->percpu_dev_id);
-}
-
 /**
  *	free_percpu_irq - free an interrupt allocated with request_percpu_irq
  *	@irq: Interrupt line to free
-- 
2.49.0

