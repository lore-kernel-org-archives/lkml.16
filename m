Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1D28F4
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 07:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746342543; cv=none; b=JoqGQwgtJzWzRshMQwXNA/6m6h44/5w0yYsHM51479UJwxdXKmaS/vWfquTpKnefzlXwLs5ldAMXVOPvmTQiDSu+XhrshhsdCy/GFyol3JtgBEghfu29NTP/M5zi789XVj9C6s8vAS6wJL+cWEI2Z8AkLDjHV34DGkB7EJCEpuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746342543; c=relaxed/simple;
	bh=pZgJCbZnVUtxjFS6QDPyjouCfl2NRq914v1aU8b8mhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ma8N9iG05Blb+ovrhvT/bbecXS3wLg7/mAhNlewZuTH8SBHo+FqCdXTCpmxczfUSeq93LBgTPGrAYVWfr9BSfS0Amzj0V/mbZdzSRPYif7wJKDEHjItOOOAH6jNPLwVhQ2ip+7ZbBF9lcRCI9oXUGp5ZJPvngYYZo4/hoCboOOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGdT06Ea; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGdT06Ea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D00C4CEE7;
	Sun,  4 May 2025 07:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746342542;
	bh=pZgJCbZnVUtxjFS6QDPyjouCfl2NRq914v1aU8b8mhI=;
	h=Date:From:To:Cc:Subject:From;
	b=UGdT06EaTjvoFusAskJ+QA0tZtQh9iYEc/UzfUXDILZBdYwf526pF91cf0DuEBj01
	 SpBYQL/vhwShbJeYePjr2PMmm0CmckHRGpr7qsaD6Ngc1NnoEckjioAhyxv93GFIQq
	 9Jz1C0LPCsIFAvFLkEVClOhQutosr6dQ63JaUP6YOAkaQNS+FDo4XIGHpHgMYR8HkJ
	 CrvWyJvZOZiKRz2j+tg9Blq3fkzU/2/N1oqe0YbMO+aWe8H86SYFJ5fVuUEVTradVi
	 uuvICtey4z+NWoIwjYn/+Zunmng9HsAXAv2yuBP7JmB2cZ7MwGxglGUIaPZoV3dWdq
	 kHkyZSvGGcBNg==
Date: Sun, 4 May 2025 09:08:29 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [GIT PULL] IRQ fixes
Message-ID: <aBcSbcZPNZjW89mn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest irq/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-05-04

   # HEAD: 38a05c0b87833f5b188ae43b428b1f792df2b384 irqchip/qcom-mpm: Prevent crash when trying to handle non-wake GPIOs

Two fixes:

 - Prevent NULL pointer dereference in msi_domain_debug_show()

 - Fix crash in the qcom-mpm irqchip driver when configuring
   interrupts for non-wake GPIOs

 Thanks,

	Ingo

------------------>
Andrew Jones (1):
      genirq/msi: Prevent NULL pointer dereference in msi_domain_debug_show()

Stephan Gerhold (1):
      irqchip/qcom-mpm: Prevent crash when trying to handle non-wake GPIOs


 drivers/irqchip/irq-qcom-mpm.c | 3 +++
 kernel/irq/msi.c               | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 7942d8eb3d00..f772deb9cba5 100644
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
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 5c8d43cdb0a3..c05ba7ca00fa 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -761,7 +761,7 @@ static int msi_domain_translate(struct irq_domain *domain, struct irq_fwspec *fw
 static void msi_domain_debug_show(struct seq_file *m, struct irq_domain *d,
 				  struct irq_data *irqd, int ind)
 {
-	struct msi_desc *desc = irq_data_get_msi_desc(irqd);
+	struct msi_desc *desc = irqd ? irq_data_get_msi_desc(irqd) : NULL;
 
 	if (!desc)
 		return;
