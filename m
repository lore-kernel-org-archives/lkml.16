Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD67826A1C4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638633; cv=none; b=Y8H3H5PFrlXpnyy2ekytcik3uQbPYl4p/1pn5X+YWJNpsnP9osGV3pdK5gM99AzxC8YLganBLUqaUCteVkIwj+tNr6CH1AzBlyNdbYkOIWZdp+Kchbrp2WOklDXEjO2ZAZSDFYytFPkvCZoYGZn2jqoZy727xm7QWe1IvkNmtCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638633; c=relaxed/simple;
	bh=jCop8Em/VhvQJwJg17vxsjPM0aE8TVob063utNOdWNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cms/0/uAksaCsjtQ4EWeVm3z58cUjRRn+kYhD4ihmcGtXdWMDYzJKnAP0rJxldZ8le65JIWIsCF+f9iH3u9e6yxSMxyTyP7MBAt3Sl44vPXIf1DkS1ujhjqT5s3KhArcCe/vQXZqaYFojcZZRcCtU5sqfSEymcWsmzIBRfdO46g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdsyrHkC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdsyrHkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5770BC4CEF2;
	Wed, 11 Jun 2025 10:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638633;
	bh=jCop8Em/VhvQJwJg17vxsjPM0aE8TVob063utNOdWNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VdsyrHkC/0xu5eFFwkBxgpBSK5HtBt/GLMpzsWn87plHyHnBl+/tJUKEmssQ81VZV
	 ljky0x7/5kM/UrFJNOXDdhacoq9jpxockfV/bHmjRSyRj++9ZOEK7C+00uZswobvrJ
	 Vuyia3kgOhNrqaKQ2j5NqSxMVpRbGdD8mFpJtgAk3XQN0aZR4UbiKILgT2lx2v6YKf
	 0TfAtZA2uk3ZbXlz77lIygS6I8+zMwHm46hzh39YCeJHFmzAfu8bwvJCU7SD8b/S3k
	 jtX14CtUE9A0BoUJFvxMRUwPb2eTU9wJJpX5BLlA/4L8v3HTpr8aVdK4keGQACI8Lr
	 U4GbFQlCabSTg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	Arnd Bergmann <arnd@arndb.de>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] pci: altera: remove unused 'node' variable
Date: Wed, 11 Jun 2025 12:43:30 +0200
Message-ID: <20250611104348.192092-2-jirislaby@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

This variable is only used when CONFIG_OF is enabled:

drivers/pci/controller/pcie-altera.c: In function 'altera_pcie_init_irq_domain':
drivers/pci/controller/pcie-altera.c:855:29: error: unused variable 'node' [-Werror=unused-variable]
  855 |         struct device_node *node = dev->of_node;

Use dev_fwnode() in place of of_node_to_fwnode() to avoid this.

----
I checked the other PCI host bridge drivers as well, this is the
only one with that problem.

Fixes: bbc94e6f72f2 ("PCI: Switch to irq_domain_create_linear()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
 drivers/pci/controller/pcie-altera.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 0fc77176a52e..3dbb7adc421c 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -852,10 +852,9 @@ static void aglx_isr(struct irq_desc *desc)
 static int altera_pcie_init_irq_domain(struct altera_pcie *pcie)
 {
 	struct device *dev = &pcie->pdev->dev;
-	struct device_node *node = dev->of_node;
 
 	/* Setup INTx */
-	pcie->irq_domain = irq_domain_create_linear(of_fwnode_handle(node), PCI_NUM_INTX,
+	pcie->irq_domain = irq_domain_create_linear(dev_fwnode(dev), PCI_NUM_INTX,
 					&intx_domain_ops, pcie);
 	if (!pcie->irq_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
-- 
2.49.0

