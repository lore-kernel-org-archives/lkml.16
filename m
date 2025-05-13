Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800811E9B0B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126063; cv=none; b=JZkig46ezj3BgNyXzZPU7JonkpFx+l4j2nmEPydKN7BsuDwjijdrSs1JFFRfDFRAw/G5POyfO+pLS1bBPuBBm3sGMZmPaD/hC6O0+XdlGv8mpmc1Gu4Xq5+XLnMO3eWhypBfMejNomBP1Vw+b5MfeIGc2X4maJmUP/7GvTqvBEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126063; c=relaxed/simple;
	bh=LdDOStlFVvIDUfNsM3hWLZteIFQtkvyFNlNBrZuVu+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DuFxU45iIqTENqLOOpH9CS9g1aMLaqtjONaxw9NxTCFm0vv6eRzBDJ4GXUgMNCbKrJ9egckw3SUcN1VMCILFgJ9gK7xREQJ03jUSnZU7rYxoGBI6GWWZrS398sGOxqVzfez7yatn48I8Sx8Q/6abC+P3Fus9U53BplUE2/fAJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4WeCYj3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4WeCYj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC1DC4CEE4;
	Tue, 13 May 2025 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747126063;
	bh=LdDOStlFVvIDUfNsM3hWLZteIFQtkvyFNlNBrZuVu+I=;
	h=From:To:Cc:Subject:Date:From;
	b=h4WeCYj325jxeyVdlF3OwaoQfhp5WFr0LroOT55me+5uYHiRHUDS7cRtODd/blODp
	 F06DMTxYCD0tkykYaWO9u7sTcMC9cTRUHj20rks2YwLdZjyGN65hoR+8jKDyjDGAV3
	 GAgscikP63QckfnYfNRZvDeDnLPxYy3qX7XIY7MlW9JNFzI73EZiFj0+ucQ2eUoqMg
	 g0jCkuUnrhXRv9fSCOOHv0QaCqaWoUQci/UOxqcUiAGO+yFTOTCUIic6WJz2w1Jv+x
	 cq3WIblzDWQdYpt+H1CqhY+L/HpOGg9TPMrXusBYibPWnaWq+blixh6iQMsbjPKgmz
	 0EhJfR3lrCpxA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: [PATCH] irqchip/econet-en751221: Switch to of_fwnode_handle()
Date: Tue, 13 May 2025 10:47:39 +0200
Message-ID: <20250513084739.2611747-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is an irqdomain's reimplementation of the
"officially" defined of_fwnode_handle(). The former is in the process of
being removed, so use the latter instead.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
 drivers/irqchip/irq-econet-en751221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
index fd65dfe54ce9..d83d5eb12795 100644
--- a/drivers/irqchip/irq-econet-en751221.c
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -286,7 +286,7 @@ static int __init econet_intc_of_init(struct device_node *node, struct device_no
 
 	econet_mask_all();
 
-	domain = irq_domain_create_linear(of_node_to_fwnode(node), IRQ_COUNT,
+	domain = irq_domain_create_linear(of_fwnode_handle(node), IRQ_COUNT,
 					  &econet_domain_ops, NULL);
 	if (!domain) {
 		pr_err("%pOF: Failed to add irqdomain\n", node);
-- 
2.49.0

