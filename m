Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2E02820D0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638667; cv=none; b=HCwpEAyzFSJzfozorKukmPXWEFnek6pxh7SjQB9n9fcAo/uvX/ghTfa1pmwDIZsfxwElRUndPxF6gCFgSPI/EIcePHjG/XE1CUlwAnAj4XW6pWqLgkQdNVeWE8EZ7R+dR4y8PChj6/ymoKvcyeF/jDA0KDe7S4T0VShf2zn/SFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638667; c=relaxed/simple;
	bh=aePQDmv3vLF644T6pCevC7rrNkNKgmE/HhtuoHVGd6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jlbRDAFjLh4gV8KXMZu3I9vwpdQqGJb7wB0SwFpM6Sn73DN6W9wvJvjCoud/RrPLk8i71Fmh16Z2SYZ3pLZTyWzOshTj7oHZ6ZkIOmcBVn2kep00G8S/dQKFdXwdqA/NS+2SCkIU5znlHWpYFNCiQNtCp2PP3lOOO3PxrGOmMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7/252Z7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7/252Z7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709ABC4CEF2;
	Wed, 11 Jun 2025 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638667;
	bh=aePQDmv3vLF644T6pCevC7rrNkNKgmE/HhtuoHVGd6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H7/252Z7e6XikFFlKorcfZWK16QErKTQIA6Ip2UJcjszjubJXCDyvx3BynLlZVUBU
	 PETetc41Ntg3af/UfoUr2/EvhgjfQf9HwD+sx4MNmV1vpxn+gdDSzITwKEz7j1LMmX
	 8N1IBx1jgYrXdAZJTFIvpNtBwV/MjO2mRXnEyQpxenHkW757u1ycJCRKURra3zqPOc
	 2GvoCmXv7dxgJeCtG2qMzQJ8pWuW3abVqpPvpX+xO5BJImwMw9ipmclm63ybJ2EFvd
	 b78Cb6IKXrCasFMik8FHe5FMtK1B9mXykhYSxpH9g9CDNR5LchQiFARnR3ulKKcxK6
	 UCFX8V9G/bQjw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] misc: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:42 +0200
Message-ID: <20250611104348.192092-14-jirislaby@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/hi6421v600-irq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/hi6421v600-irq.c b/drivers/misc/hi6421v600-irq.c
index 187c5bc91e31..5ba40222eb12 100644
--- a/drivers/misc/hi6421v600-irq.c
+++ b/drivers/misc/hi6421v600-irq.c
@@ -214,7 +214,6 @@ static void hi6421v600_irq_init(struct hi6421v600_irq *priv)
 static int hi6421v600_irq_probe(struct platform_device *pdev)
 {
 	struct device *pmic_dev = pdev->dev.parent;
-	struct device_node *np = pmic_dev->of_node;
 	struct platform_device *pmic_pdev;
 	struct device *dev = &pdev->dev;
 	struct hi6421v600_irq *priv;
@@ -254,8 +253,7 @@ static int hi6421v600_irq_probe(struct platform_device *pdev)
 	if (!priv->irqs)
 		return -ENOMEM;
 
-	priv->domain = irq_domain_create_simple(of_fwnode_handle(np),
-						PMIC_IRQ_LIST_MAX, 0,
+	priv->domain = irq_domain_create_simple(dev_fwnode(pmic_dev), PMIC_IRQ_LIST_MAX, 0,
 						&hi6421v600_domain_ops, priv);
 	if (!priv->domain) {
 		dev_err(dev, "Failed to create IRQ domain\n");
-- 
2.49.0

