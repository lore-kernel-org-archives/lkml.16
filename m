Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591B2219E8
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981327; cv=none; b=eleyAhVecWA+xem8Nz2sltJqjEkxajRkuoKOesgzNbDBDF+FyMjh6Sp/4KFqU6B6jU64NB8KGPEN1ujUKntCHCEJoH46kMCsfKGggCOlnhyjJ/hd/tg9CUUf8GZUhcUOiRFwJv1947Opitov2JBg9UIjOMbgc7Yf3foEgqQgjCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981327; c=relaxed/simple;
	bh=GaOQnEbLL9GZs6ot00bxwo1vTakAiiwicLKpRgJPfmY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aj8mc9EiDxfcWpPIh/H9/skrlIauGhpf0GA/7G57WuDijQ5niCy6gBWODz1+2qtmwiiAaGZcO/Pi4EeMrwG3Vv7+q8SxoTOATMl10Cpf5NY156JE4zh+vazp9OCmpch8pidC2KpAyqH8NX8XvTzv6r0o7/7fdmrlgsy3jFd/BT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTTKFRdM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTTKFRdM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22E4C4CEE7;
	Sun, 11 May 2025 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746981327;
	bh=GaOQnEbLL9GZs6ot00bxwo1vTakAiiwicLKpRgJPfmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fTTKFRdM3VnzPD88jFOf2OV/Rw99Y5XQlU1eZ6IgHDHKwj6ZnakTwEXRbIWvqGMFQ
	 qJsyHuz6iw2qAOIeJylFbITR9Ls2d3geAGDGwJ4aQLjQGYG7vNLm96albse7nEdLje
	 wESOJmauQV1z8L3epNxV85hxSCVp2SC3PZAf+jtlWoSQjlnab9xG+JXr/jnGJNteL2
	 67f2x0zVBwuUb/m+3LMKlsu80JJGqH2Tn9l+nZ2yt7oqTtCFV/xt3zDU2vnlus6pCI
	 guT6JyN6qv6lvLzDPrJarxXzRgSlp6ZE6yPZ3qx6yibhOD9KkfLsLK+RyTxXZeb0EC
	 TksPyGnhgkvgA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uE9e8-00Dt22-L7;
	Sun, 11 May 2025 17:35:24 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH 1/4] genirq/msi: Add .msi_teardown() callback as the reverse of .msi_prepare()
Date: Sun, 11 May 2025 17:35:17 +0100
Message-Id: <20250511163520.1307654-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250511163520.1307654-1-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
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
allocation, we don't have a callback reversing this setup.

For this purpose, let's a .msi_teardown() callback. This is
reliying on the msi_domain_info structure having a non-NULL
alloc_data field.

Nobody is populating this field yet, so there is no change
in behaviour yet.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/msi.h | 10 ++++++++--
 kernel/irq/msi.c    | 12 ++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 86e42742fd0fb..0a44a2cba3105 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -420,6 +420,7 @@ struct msi_domain_info;
  * @msi_init:		Domain specific init function for MSI interrupts
  * @msi_free:		Domain specific function to free a MSI interrupts
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
+ * @msi_teardown:	Reverse the effects of @msi_prepare
  * @prepare_desc:	Optional function to prepare the allocated MSI descriptor
  *			in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
@@ -435,8 +436,9 @@ struct msi_domain_info;
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
@@ -458,6 +460,8 @@ struct msi_domain_ops {
 	int		(*msi_prepare)(struct irq_domain *domain,
 				       struct device *dev, int nvec,
 				       msi_alloc_info_t *arg);
+	void		(*msi_teardown)(struct irq_domain *domain,
+					msi_alloc_info_t *arg);
 	void		(*prepare_desc)(struct irq_domain *domain, msi_alloc_info_t *arg,
 					struct msi_desc *desc);
 	void		(*set_desc)(msi_alloc_info_t *arg,
@@ -486,6 +490,7 @@ struct msi_domain_ops {
  * @handler:		Optional: associated interrupt flow handler
  * @handler_data:	Optional: associated interrupt flow handler data
  * @handler_name:	Optional: associated interrupt flow handler name
+ * @alloc_data:		Optional: associated interrupt allocation data
  * @data:		Optional: domain specific data
  */
 struct msi_domain_info {
@@ -498,6 +503,7 @@ struct msi_domain_info {
 	irq_flow_handler_t		handler;
 	void				*handler_data;
 	const char			*handler_name;
+	msi_alloc_info_t		*alloc_data;
 	void				*data;
 };
 
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index c05ba7ca00faa..a65ccf19b15d9 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -796,6 +796,11 @@ static int msi_domain_ops_prepare(struct irq_domain *domain, struct device *dev,
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
@@ -821,6 +826,7 @@ static struct msi_domain_ops msi_domain_ops_default = {
 	.get_hwirq		= msi_domain_ops_get_hwirq,
 	.msi_init		= msi_domain_ops_init,
 	.msi_prepare		= msi_domain_ops_prepare,
+	.msi_teardown		= msi_domain_ops_teardown,
 	.set_desc		= msi_domain_ops_set_desc,
 };
 
@@ -842,6 +848,8 @@ static void msi_domain_update_dom_ops(struct msi_domain_info *info)
 		ops->msi_init = msi_domain_ops_default.msi_init;
 	if (ops->msi_prepare == NULL)
 		ops->msi_prepare = msi_domain_ops_default.msi_prepare;
+	if (ops->msi_teardown == NULL)
+		ops->msi_teardown = msi_domain_ops_default.msi_teardown;
 	if (ops->set_desc == NULL)
 		ops->set_desc = msi_domain_ops_default.set_desc;
 }
@@ -1088,6 +1096,10 @@ void msi_remove_device_irq_domain(struct device *dev, unsigned int domid)
 
 	dev->msi.data->__domains[domid].domain = NULL;
 	info = domain->host_data;
+
+	if (info->alloc_data)
+		info->ops->msi_teardown(domain, info->alloc_data);
+
 	if (irq_domain_is_msi_device(domain))
 		fwnode = domain->fwnode;
 	irq_domain_remove(domain);
-- 
2.39.2

