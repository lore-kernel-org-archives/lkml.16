Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F03157465
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765387; cv=none; b=O5NKNB4nd2p2I0LCVJpQhy7TlkinIM2FRhYzQJvvGzuN3agxCQHq/pb5e3+yVwSp6G5QIHqSsS8vNMDnPNih9E0zDvu7r0VEDOnkFx4u78b/gBWrPTqYCly2G2Usn6JOwNn5dPjZT3mbVLGcy/+W6UXb87SPSOD1m2CduhoUO1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765387; c=relaxed/simple;
	bh=pYXgZHe/oKWOjdZSRZOrEvpK9jXW8SUBiB8CdVACYGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FEl5UVGG6coiGn4DimnG/Y9W6wS90puGMYcqmx9afN9EzTO79TKe+osA5J3hi5mEBZcfRvd3VPXMu/8gwZMagHK897J8gqm+1hvGMoucU52z3jp1A5Kw0EPOqvvSWJIaXQ8uUBZ4fu81lHE5UHYsG8aycdaFTCgu50ddOIiziZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by andre.telenet-ops.be with cmsmtp
	id 9qNz2E0013f221S01qNzia; Wed, 05 Feb 2025 15:23:03 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfgIg-0000000FvzO-3MeQ;
	Wed, 05 Feb 2025 15:22:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfgIs-00000006bFa-3Ylm;
	Wed, 05 Feb 2025 15:22:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	David Wang <00107082@163.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] genirq: Remove leading space from .irq_print_chip() callbacks
Date: Wed,  5 Feb 2025 15:22:56 +0100
Message-ID: <893f7e9646d8933cd6786d5a1ef3eb076d263768.1738764803.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The space separator was factored out from the multiple chip name prints,
but several irq_chip.irq_print_chip() callbacks still print a leading
space.  Remove the superfluous double spaces.

Fixes: 9d9f204bdf7243bf ("genirq/proc: Add missing space separator back")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/powerpc/sysdev/fsl_msi.c          | 2 +-
 drivers/bus/moxtet.c                   | 2 +-
 drivers/irqchip/irq-partition-percpu.c | 2 +-
 drivers/soc/qcom/smp2p.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 1aa0cb097c9c9d7c..7b9a5ea9cad9d3c7 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -75,7 +75,7 @@ static void fsl_msi_print_chip(struct irq_data *irqd, struct seq_file *p)
 	srs = (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK;
 	cascade_virq = msi_data->cascade_array[srs]->virq;
 
-	seq_printf(p, " fsl-msi-%d", cascade_virq);
+	seq_printf(p, "fsl-msi-%d", cascade_virq);
 }
 
 
diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
index 6276551d79680e85..1e57ebfb76229aa0 100644
--- a/drivers/bus/moxtet.c
+++ b/drivers/bus/moxtet.c
@@ -657,7 +657,7 @@ static void moxtet_irq_print_chip(struct irq_data *d, struct seq_file *p)
 
 	id = moxtet->modules[pos->idx];
 
-	seq_printf(p, " moxtet-%s.%i#%i", mox_module_name(id), pos->idx,
+	seq_printf(p, "moxtet-%s.%i#%i", mox_module_name(id), pos->idx,
 		   pos->bit);
 }
 
diff --git a/drivers/irqchip/irq-partition-percpu.c b/drivers/irqchip/irq-partition-percpu.c
index 8e76d2913e6bebbf..4441ffe149ea0d96 100644
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
index 4783ab1adb8d953b..a3e88ced328a91f1 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -365,7 +365,7 @@ static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
 {
 	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
 
-	seq_printf(p, " %8s", dev_name(entry->smp2p->dev));
+	seq_printf(p, "%8s", dev_name(entry->smp2p->dev));
 }
 
 static struct irq_chip smp2p_irq_chip = {
-- 
2.43.0

