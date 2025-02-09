Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5E6FBF
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739089208; cv=none; b=YKdEmc6oyqxG0xYtLg8TcPjKwM/7xbEbBLg7Oqejf4lJ9a7wWDpvTYtXUDdxR9bF9l5iHPU/rVg2iEwrl9JaYGylRevAO8UKEK7oVvR0i8ouXz9wWT19A6QzAbIKo6hCxWNf3o44eUPJqJC+VckR7UV2sEnKMXsfee0oIqoXxPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739089208; c=relaxed/simple;
	bh=a4SRuZo+CUWEKo5tuIM5raEfCEuGHpIKNOfpt0vA6/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jLH8qz1nm1frDlchyCRYoE3w/mLA6Fd3ifynKahGMHjcvEplq07DZCax5tsE7DYH5a1cEJ/1IK1iDTNinZrCHP7zmrJTOxNsq//rrGbEvdu1NabVXSQaoHscOC4YuVH6jl6jwbnrMttWRPpbvIZWx7YM34CKwymZmm+RYJKJ9Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sjrCixX4; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sjrCixX4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739089198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+/UAtcwdNDbosvRuOX3rbZT3Z7BQiIpDmAOnfimnv2I=;
	b=sjrCixX4XSpZNuhF47M0iKpTrpvPoj0zFITezNGPRhO070FVrIx5IkL9O2QZMGPLktGSY4
	nPvtkPH/dsiZx+wwrWiyqVBuMMePEJsfQZNrnKuLOGseD35Kysur3mFcmwQC0ZMem7ZWJc
	i53WyJEYyyH0xsyzwD2wJWfe7gUs2kk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] scsi: aha1740: Use str_enabled_disabled() helper
Date: Sun,  9 Feb 2025 09:19:28 +0100
Message-ID: <20250209081928.3096-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Use pr_info() instead of printk(KERN_INFO) to silence multiple
checkpatch warnings.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/scsi/aha1740.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/aha1740.c b/drivers/scsi/aha1740.c
index be7ebbbb9ba8..c21286eaa8a1 100644
--- a/drivers/scsi/aha1740.c
+++ b/drivers/scsi/aha1740.c
@@ -114,9 +114,9 @@ static int aha1740_show_info(struct seq_file *m, struct Scsi_Host *shpnt)
 {
 	struct aha1740_hostdata *host = HOSTDATA(shpnt);
 	seq_printf(m, "aha174x at IO:%lx, IRQ %d, SLOT %d.\n"
-		      "Extended translation %sabled.\n",
+		      "Extended translation %s.\n",
 		      shpnt->io_port, shpnt->irq, host->edev->slot,
-		      host->translation ? "en" : "dis");
+		      str_enabled_disabled(host->translation));
 	return 0;
 }
 
@@ -578,10 +578,10 @@ static int aha1740_probe (struct device *dev)
 		outb(G2CNTRL_HRST, G2CNTRL(slotbase));
 		outb(0, G2CNTRL(slotbase));
 	}
-	printk(KERN_INFO "Configuring slot %d at IO:%x, IRQ %u (%s)\n",
-	       edev->slot, slotbase, irq_level, irq_type ? "edge" : "level");
-	printk(KERN_INFO "aha174x: Extended translation %sabled.\n",
-	       translation ? "en" : "dis");
+	pr_info("Configuring slot %d at IO:%x, IRQ %u (%s)\n",
+		edev->slot, slotbase, irq_level, irq_type ? "edge" : "level");
+	pr_info("aha174x: Extended translation %s.\n",
+		str_enabled_disabled(translation));
 	shpnt = scsi_host_alloc(&aha1740_template,
 			      sizeof(struct aha1740_hostdata));
 	if(shpnt == NULL)
-- 
2.48.1

