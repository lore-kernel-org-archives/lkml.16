Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40361197A92
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739005987; cv=none; b=KLbMgvxAclPr2BJ7Fj4k+CqXl4HL5hhpwwhg59z/3d58l1am+2n5yoHIPjyebinVWQG8ZcHn1oTutXwadOD9yIhioiv6+hBq4nHkxmEPnAaj9JfLws0FlLPZaiYWRwZ2hjdr+xylBEAZ/rrWvnDy8jkywKZWtLk3mETwzu5AMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739005987; c=relaxed/simple;
	bh=pywsn+2Sqcpd7QK6cQ8v9f3/7UWjf0kz5BDQesfAOGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sO6XvlAsdst4ZulljbMyCc8zvTv42TdxT8IERslfOIzvZgBoGxWvSgsHTUgrJqxBRI0p2PkY6EftPPZ7PmZZXhkq82ndc0L6O2cMHxn69Fofi2lcteBos0eCmM1LI/Iv4YQq9Hoh+pn3jpZs16moeoa+wbhgAWQ9hvnZA0mPI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spPRHZ5y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spPRHZ5y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136A4C4CED6;
	Sat,  8 Feb 2025 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739005986;
	bh=pywsn+2Sqcpd7QK6cQ8v9f3/7UWjf0kz5BDQesfAOGc=;
	h=Date:From:To:Cc:Subject:From;
	b=spPRHZ5yMud2HOv1WLVl/G2NogGX4krB3Su6rU8jZ0WjW6uUtGHu3gFc3BMFNwRQT
	 ovjFRgfD1yA4/p6e9aIuB5CFCv5EGJDwo1FxJTwdWLF13ifDgqO5Wb4QMib6ngjrv8
	 B8it4qMWI52M4KTtIHRWpC9XpTNTO75AdY7IOPwIWNn5ALPooEoU5RgvTyuMZqZIVf
	 QW/uoQ3Wpv9sfSCVNEDmDjsondqbcP9Yw9ykSZWNa0ShwzQ58fSiOoZd4INX83HRDT
	 TBJJtVQl0V+4vjZCIz4fnYw3GzzxZjN+zhQbWGLjH40zESuRTTXSKRgAQ/dEWV/Ehw
	 uN9y7V4ET5ISA==
Date: Sat, 8 Feb 2025 10:12:54 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Andrew Morton <akpm@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [GIT PULL] IRQ fix
Message-ID: <Z6cgFhA0239YtIvU@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-02-08

   # HEAD: 29a61a1f40637ae010b828745fb41f60301c3a3d genirq: Remove leading space from irq_chip::irq_print_chip() callbacks

Further fix a double-spaces-printed procps genirq output formatting
regression caused by an optimization.

 Thanks,

	Ingo

------------------>
Geert Uytterhoeven (1):
      genirq: Remove leading space from irq_chip::irq_print_chip() callbacks


 arch/powerpc/sysdev/fsl_msi.c          | 2 +-
 drivers/bus/moxtet.c                   | 2 +-
 drivers/irqchip/irq-partition-percpu.c | 2 +-
 drivers/soc/qcom/smp2p.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 1aa0cb097c9c..7b9a5ea9cad9 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -75,7 +75,7 @@ static void fsl_msi_print_chip(struct irq_data *irqd, struct seq_file *p)
 	srs = (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK;
 	cascade_virq = msi_data->cascade_array[srs]->virq;
 
-	seq_printf(p, " fsl-msi-%d", cascade_virq);
+	seq_printf(p, "fsl-msi-%d", cascade_virq);
 }
 
 
diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
index 6276551d7968..1e57ebfb7622 100644
--- a/drivers/bus/moxtet.c
+++ b/drivers/bus/moxtet.c
@@ -657,7 +657,7 @@ static void moxtet_irq_print_chip(struct irq_data *d, struct seq_file *p)
 
 	id = moxtet->modules[pos->idx];
 
-	seq_printf(p, " moxtet-%s.%i#%i", mox_module_name(id), pos->idx,
+	seq_printf(p, "moxtet-%s.%i#%i", mox_module_name(id), pos->idx,
 		   pos->bit);
 }
 
diff --git a/drivers/irqchip/irq-partition-percpu.c b/drivers/irqchip/irq-partition-percpu.c
index 8e76d2913e6b..4441ffe149ea 100644
--- a/drivers/irqchip/irq-partition-percpu.c
+++ b/drivers/irqchip/irq-partition-percpu.c
@@ -98,7 +98,7 @@ static void partition_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
 	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
 
-	seq_printf(p, " %5s-%lu", chip->name, data->hwirq);
+	seq_printf(p, "%5s-%lu", chip->name, data->hwirq);
 }
 
 static struct irq_chip partition_irq_chip = {
diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 4783ab1adb8d..a3e88ced328a 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -365,7 +365,7 @@ static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
 {
 	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
 
-	seq_printf(p, " %8s", dev_name(entry->smp2p->dev));
+	seq_printf(p, "%8s", dev_name(entry->smp2p->dev));
 }
 
 static struct irq_chip smp2p_irq_chip = {
