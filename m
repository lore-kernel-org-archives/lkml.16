Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0D128DF0E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153912; cv=none; b=PBM/jdbN98gRitE9F/4u7wygrmYqmAJqb3RBkA2ETScO5PuDnL4EFrtdrP/iH7jjhpUpBAdBwv6VajBjegsrUSg7iJJzvrKU6lbBRRMQWqKJ+g1AlX2SheCk6bZ0GL2+lv25LMLud7IOLFRuXA8+JiXxLFS3RkguDpq3nJDzYFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153912; c=relaxed/simple;
	bh=RcZzjfbX3puoN0l0SuXE8X3V8BVXm+FxxK0G7lqM4z8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jlFWDp9HhhqJCn9GE4cGXaodMUJhAbPSwUBO+SB0BAST0msqgCKuPhJSmN/hscbHsn1tIzqVdeeXOX8wQasbgR+Q5xFQCW9JUprGxLSJb545UoFVEbgChlKgQT9q9WHfe/0jMmIxb5wUVEfdYRCWPdtltd0DBcL6mNXlZm+hO6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVeIbSW8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVeIbSW8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0384CC4CEED;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=RcZzjfbX3puoN0l0SuXE8X3V8BVXm+FxxK0G7lqM4z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVeIbSW8TnkKNmuUizY8RG+l6Zonk3cN72jhwf9HqSXsapUKLlJ8AwnqBF8PdLSK2
	 RNVRdIhNl3pFvXk27FMO+0e9Q3tBJJ4bxDEO9MSVfUSADpgt7y00e79e8kATICEZye
	 /+FTm7r3OuG7Ylo1gwiI5LYo8nAUGhGsnCYPDivZm8EJa3S2JiT3AjR4mvdhkFdsyP
	 CvXB/RWkWiGC12sPNmN6vkSUw6Qy788qBtezjaBjmI5sZhP59ypUmaqe9RfNDuTMyh
	 7cIJ302UJ9x9j9JEkmZYDmBhA/C8dQFgNAfL0EOlMAlHbIa7sILgVtQBpGkbb1Hgqw
	 gSNgGsHdXCnCw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXm-00EaLc-0g;
	Tue, 13 May 2025 17:31:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 1/5] genirq/msi: Add .msi_teardown() callback as the reverse of .msi_prepare()
Date: Tue, 13 May 2025 17:31:40 +0100
Message-Id: <20250513163144.2215824-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513163144.2215824-1-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lpieralisi@kernel.org, sascha.bischoff@arm.com, timothy.hayes@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

While the MSI ops do have a .msi_prepare() callback that is
responsible for setting up the relevant (usually per-device)
allocation, there is no callback reversing this setup.

For this purpose, add .msi_teardown() callback.

In order to avoid breaking the ITS driver that suffers from related
issues, do not call the call back just yet.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/msi.h | 10 ++++++++--
 kernel/irq/msi.c    |  8 ++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 8c0ec9fc05a39..63c23003ec9b7 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -423,6 +423,7 @@ struct msi_domain_info;
  * @msi_init:		Domain specific init function for MSI interrupts
  * @msi_free:		Domain specific function to free a MSI interrupts
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
+ * @msi_teardown:	Reverse the effects of @msi_prepare
  * @prepare_desc:	Optional function to prepare the allocated MSI descriptor
  *			in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
@@ -438,8 +439,9 @@ struct msi_domain_info;
  * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
  * irqdomain.
  *
- * @msi_check, @msi_prepare, @prepare_desc and @set_desc are callbacks used by the
- * msi_domain_alloc/free_irqs*() variants.
+ * @msi_check, @msi_prepare, @msi_teardown, @prepare_desc and
+ * @set_desc are callbacks used by the msi_domain_alloc/free_irqs*()
+ * variants.
  *
  * @domain_alloc_irqs, @domain_free_irqs can be used to override the
  * default allocation/free functions (__msi_domain_alloc/free_irqs). This
@@ -461,6 +463,8 @@ struct msi_domain_ops {
 	int		(*msi_prepare)(struct irq_domain *domain,
 				       struct device *dev, int nvec,
 				       msi_alloc_info_t *arg);
+	void		(*msi_teardown)(struct irq_domain *domain,
+					msi_alloc_info_t *arg);
 	void		(*prepare_desc)(struct irq_domain *domain, msi_alloc_info_t *arg,
 					struct msi_desc *desc);
 	void		(*set_desc)(msi_alloc_info_t *arg,
@@ -489,6 +493,7 @@ struct msi_domain_ops {
  * @handler:		Optional: associated interrupt flow handler
  * @handler_data:	Optional: associated interrupt flow handler data
  * @handler_name:	Optional: associated interrupt flow handler name
+ * @alloc_data:		Optional: associated interrupt allocation data
  * @data:		Optional: domain specific data
  */
 struct msi_domain_info {
@@ -501,6 +506,7 @@ struct msi_domain_info {
 	irq_flow_handler_t		handler;
 	void				*handler_data;
 	const char			*handler_name;
+	msi_alloc_info_t		*alloc_data;
 	void				*data;
 };
 
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 2b3ef2333dbc8..a3b34c3c599be 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -795,6 +795,11 @@ static int msi_domain_ops_prepare(struct irq_domain *domain, struct device *dev,
 	return 0;
 }
 
+static void msi_domain_ops_teardown(struct irq_domain *domain,
+				    msi_alloc_info_t *arg)
+{
+}
+
 static void msi_domain_ops_set_desc(msi_alloc_info_t *arg,
 				    struct msi_desc *desc)
 {
@@ -820,6 +825,7 @@ static struct msi_domain_ops msi_domain_ops_default = {
 	.get_hwirq		= msi_domain_ops_get_hwirq,
 	.msi_init		= msi_domain_ops_init,
 	.msi_prepare		= msi_domain_ops_prepare,
+	.msi_teardown		= msi_domain_ops_teardown,
 	.set_desc		= msi_domain_ops_set_desc,
 };
 
@@ -841,6 +847,8 @@ static void msi_domain_update_dom_ops(struct msi_domain_info *info)
 		ops->msi_init = msi_domain_ops_default.msi_init;
 	if (ops->msi_prepare == NULL)
 		ops->msi_prepare = msi_domain_ops_default.msi_prepare;
+	if (ops->msi_teardown == NULL)
+		ops->msi_teardown = msi_domain_ops_default.msi_teardown;
 	if (ops->set_desc == NULL)
 		ops->set_desc = msi_domain_ops_default.set_desc;
 }
-- 
2.39.2

