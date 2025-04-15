Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8137297A43
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714037; cv=none; b=SHpk/Z8zGElGFxrS5EoznonLWo3IKzk4+00uyJqY/E7Tzk2h80obrGPyZD0Ftwxz/nmb3Ne/PcIkxWvb0zOo94WpuEajqVOR677smO0Tp0qU+SOUUCVrWrz0egIeJrA06kQBnDOTVWVU3PBf/uEV6Kc5ImXmelHWUK03drppuFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714037; c=relaxed/simple;
	bh=Qr5jAtX5LdltRj0+jBrQD2OFGLWc+8yqyC9x+FYYSN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A45bJAtQsJknbsKiCB0DudTHzRRbW76WfoqZ3KDh0AqhOFa1D+oFcS62kaczPaAW6ep9pCyWj+mT9P8I8zWSMDB2u8mqQ8qso3ShTTOYlC9ayw69AamPW52jOcsai6GjquOZRNoyxf4zyeb7k6ZAuHlUt8yprBsoDoH2T6idSrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChHfftTj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChHfftTj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C8BC4CEDD;
	Tue, 15 Apr 2025 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744714037;
	bh=Qr5jAtX5LdltRj0+jBrQD2OFGLWc+8yqyC9x+FYYSN4=;
	h=From:To:Cc:Subject:Date:From;
	b=ChHfftTja9fjpy6EIp5fzmOJuuqZtwU53iYcFKmVecsT5TiEKetxAjCSZDj4RoxRH
	 YAsKBjQhoqwi/zdKr4z4ub0P+/sVGXTj5BjbmdC12CtFiJRH9jw6WAxZr8yNS8s1cQ
	 sWxbD5NeTHcg/NnD/Yk9ktLdivlRvJl11NLyi+X/jjk1Xl0SU8+c3kxFYvjlVxdg+Q
	 GW0qp7L0+vadG3Lv5bMV49w6pr4McDuwScdfRTS9YmflDM6N9cjhTq3c+1TD4Wu5Sj
	 xEciLvAHnXqol6pKt1N8CXsUU5ndjuSjcstYqq37VFJ/RjQzZztRivlc1KKM/pXAXu
	 E5lSXNwveKa2A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: richard@nod.at
Cc: tglx@linutronix.de,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: [PATCH] irqdomain: um: use irq_domain_create_linear() helper
Date: Tue, 15 Apr 2025 12:47:13 +0200
Message-ID: <20250415104713.106819-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

um_pci_init() open-codes what the irq_domain_create_linear() helper
does already. Use the helper instead of open-coding it.

This needs retval checking modification.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org

---
This is an indepent patch, please apply directly.

The patch was previously a part of a large series [1], but I would like
maintainers to feed the independent parts through their trees.

[1] https://lore.kernel.org/all/20250319092951.37667-1-jirislaby@kernel.org/

[v2]
This is new in v2.
---
 arch/um/drivers/virt-pci.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
index b83b5a765d4e..0fe207ca4b72 100644
--- a/arch/um/drivers/virt-pci.c
+++ b/arch/um/drivers/virt-pci.c
@@ -538,11 +538,6 @@ void um_pci_platform_device_unregister(struct um_pci_device *dev)
 
 static int __init um_pci_init(void)
 {
-	struct irq_domain_info inner_domain_info = {
-		.size		= MAX_MSI_VECTORS,
-		.hwirq_max	= MAX_MSI_VECTORS,
-		.ops		= &um_pci_inner_domain_ops,
-	};
 	int err, i;
 
 	WARN_ON(logic_iomem_add_region(&virt_cfgspace_resource,
@@ -564,10 +559,10 @@ static int __init um_pci_init(void)
 		goto free;
 	}
 
-	inner_domain_info.fwnode = um_pci_fwnode;
-	um_pci_inner_domain = irq_domain_instantiate(&inner_domain_info);
-	if (IS_ERR(um_pci_inner_domain)) {
-		err = PTR_ERR(um_pci_inner_domain);
+	um_pci_inner_domain = irq_domain_create_linear(um_pci_fwnode, MAX_MSI_VECTORS,
+						       &um_pci_inner_domain_ops, NULL);
+	if (!um_pci_inner_domain) {
+		err = -ENOMEM;
 		goto free;
 	}
 
@@ -602,7 +597,7 @@ static int __init um_pci_init(void)
 	return 0;
 
 free:
-	if (!IS_ERR_OR_NULL(um_pci_inner_domain))
+	if (um_pci_inner_domain)
 		irq_domain_remove(um_pci_inner_domain);
 	if (um_pci_fwnode)
 		irq_domain_free_fwnode(um_pci_fwnode);
-- 
2.49.0

