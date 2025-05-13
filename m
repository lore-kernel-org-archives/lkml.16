Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F11A38E1
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153912; cv=none; b=aCP15tlvEMn/uCjUkEAbZdjbP+MO/OaM56k5dN62K5efaLvqBzQUQSdpi+D9W4KwHj4s00WakOkxfuEotVQsHLeOEwHcq3CSM87kljg9I9gTf/Jp/R7yKSQEImQeAoEqK3mEOA0PA2W248+3QHtdi/aO6GQ2ruJixHItd/22d34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153912; c=relaxed/simple;
	bh=5YnLuW4gz7cYBwmJ4dAR13BTuttnlScp3AJ2nVWpIOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OTBJglVWsBBnOMyhvtTMzVSEGDIaoXVd5b9FzJmTilMmorPv8b5CW8UH8DIKQMEn/FnGB0G1Uz358gJQmCX4CbHj7Dt3vWoiNKREBq3HtOnxM94d3DSCkL14lWacQo4Nl1YrwFPb5RYBYfmt35NqiPAlodnB9TpJLXtP+fpoT1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=md5u7IbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="md5u7IbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B35BC4CEF5;
	Tue, 13 May 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747153912;
	bh=5YnLuW4gz7cYBwmJ4dAR13BTuttnlScp3AJ2nVWpIOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=md5u7IbZqXvOU/Kx+Gy17zrOrU35ta7gml8kWoB5xRMwCAMx8uj3mYTrLLQMwNTMg
	 rlADE+MFc3dfObEs2QiRLKgr/r7Jr6GxlS24GMZgAOU1yyC+/z5dznGRGJ9LOFwZp9
	 3wTisr7Tr4EZQPyK+z3gGvqc5gYz6fX9et4LbVAMQe9y377hvtUKswz6eAKFVeXbFe
	 ir1oPkZhAcQ9EWuxL37my5rFeXWpfJLL4Dl6zZhj9vleNW0XowCRLv1L6pyLf16rCD
	 7HH27Wyy6xh3+U51T3wqgavV1GAYqw0+csEcxjV/vkhhcIF51Y+0raJvGNCHp9M7IZ
	 /D47zCDtyk14g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uEsXm-00EaLc-HK;
	Tue, 13 May 2025 17:31:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 4/5] genirq/msi: Engage the .msi_teardown() callback on domain removal
Date: Tue, 13 May 2025 17:31:43 +0100
Message-Id: <20250513163144.2215824-5-maz@kernel.org>
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

Kindly inform the MSI driver that we are tearing down the domain,
providing the allocation context previously populated on domain
creation.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 kernel/irq/msi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 07eb857efd15e..8f3d9f5ff1eb4 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1096,6 +1096,9 @@ void msi_remove_device_irq_domain(struct device *dev, unsigned int domid)
 
 	dev->msi.data->__domains[domid].domain = NULL;
 	info = domain->host_data;
+
+	info->ops->msi_teardown(domain, info->alloc_data);
+
 	if (irq_domain_is_msi_device(domain))
 		fwnode = domain->fwnode;
 	irq_domain_remove(domain);
-- 
2.39.2

