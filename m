Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABEA2882A0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638680; cv=none; b=Q+tQKO61imchAM1ZmEK4KP+eUwg/N84ItbHaCP3f+EYT2TDVJkwXkHibcBG/KFy/mGlv10j6tqyWQ7Z0BRSellBqgQb8tDm0liqeFCxO8Gwp7FLGCjkHGLWbJWTlnVhula5PFstS8iP0yopHcqWEeeq+tJ0A3Hot62yTtSCQA5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638680; c=relaxed/simple;
	bh=ZGWucHB5ib9wIAmp+jltch//8y7Q7viWPh80fKN9NEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ughcT3DFvIzU2p6Q/D3X7J1AXA25V7wmKqBRSaxK7C6Jmsk+XzYaU2sEzcOF1ftnBra7hdJClTohlEpNz5dCXywvQBr2GPGJ/MG8HmdiNUb9VBUX7bDlcNqS2Miou69hvGGJr/cGl7obIcR5OyvBqKFB7hbrEmNBRe7TDsu+k6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhsYik8E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhsYik8E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5719C4CEEE;
	Wed, 11 Jun 2025 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638679;
	bh=ZGWucHB5ib9wIAmp+jltch//8y7Q7viWPh80fKN9NEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LhsYik8EhyigmtOGF6QcBgTDeKZHxEMMLt01kP8lidZNhRcxt5/67UUrWaFHYZnAA
	 6V18JRPBo6/RIBKNPTSzOphjCGUoCz7GZtlneY/db20sVfLopbgIIfYAc9v94LRo3u
	 LCNUSx0lL+UeP1Z7w7XfVY/kQVbma5K3WcbtFa6sShDzWJDXOzKlHd4aev+pL/hQ0P
	 qsVPazrv73CJqua21HgSs8PFmUcu6aw8TsI0cjJbqBRPPzuNfS+6eqHvfOc34UlQ5O
	 3b5pRSQfWSXnCXsS4h+NJy6iHOWTQCwYtKry2lIp7MxfEQh+x4touAeqJAqtn6iqFg
	 y0fVVC4DW18Ug==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:46 +0200
Message-ID: <20250611104348.192092-18-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/8xx/cpm1-ic.c | 3 +--
 arch/powerpc/sysdev/fsl_msi.c        | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1-ic.c b/arch/powerpc/platforms/8xx/cpm1-ic.c
index a49d4a9ab3bc..3292071e4da3 100644
--- a/arch/powerpc/platforms/8xx/cpm1-ic.c
+++ b/arch/powerpc/platforms/8xx/cpm1-ic.c
@@ -110,8 +110,7 @@ static int cpm_pic_probe(struct platform_device *pdev)
 
 	out_be32(&data->reg->cpic_cimr, 0);
 
-	data->host = irq_domain_create_linear(of_fwnode_handle(dev->of_node),
-					      64, &cpm_pic_host_ops, data);
+	data->host = irq_domain_create_linear(dev_fwnode(dev), 64, &cpm_pic_host_ops, data);
 	if (!data->host)
 		return -ENODEV;
 
diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 4fe8a7b1b288..2a007bfb038d 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -412,9 +412,8 @@ static int fsl_of_msi_probe(struct platform_device *dev)
 	}
 	platform_set_drvdata(dev, msi);
 
-	msi->irqhost = irq_domain_create_linear(of_fwnode_handle(dev->dev.of_node),
-				      NR_MSI_IRQS_MAX, &fsl_msi_host_ops, msi);
-
+	msi->irqhost = irq_domain_create_linear(dev_fwnode(&dev->dev), NR_MSI_IRQS_MAX,
+						&fsl_msi_host_ops, msi);
 	if (msi->irqhost == NULL) {
 		dev_err(&dev->dev, "No memory for MSI irqhost\n");
 		err = -ENOMEM;
-- 
2.49.0

