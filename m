Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736A829A3CE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714083; cv=none; b=SvX+VPkH+hkJWJAsfTfRzVQkq+2WmgxaaEYZpoFfA79e2Rtr3qVoBiUxJ3i+bK8VqLgYv9Ro1QBiBYDK1GRA9c5nSm1K+fyWgHB2u37V153XgkcXj2uuAo45112lOObSvaPSWtDTmEKfQ6iWviwPqE5t7p1+uGNkj1pbvIF+Wr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714083; c=relaxed/simple;
	bh=FSX8SbdRKPNp84bkmuiN4rStU0bu5akTlewHxkcc4YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tFLP8S053nXG4Ve17VXwi/d7c8eJEkvEUkQNAz9Gt9phdNDDd2/lkYUl+M/L1q9lX6DurZ7fNml+APO4MhiY1Q3upDpmmNduBfhj3uzguYCmixhWeQRPgVIVy1P080VXCXS5rD25LWPdLTF5XzwkUHtKgBP/sF1Qa1rJd/HDeOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNbP0vZE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNbP0vZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BD1C4CEDD;
	Tue, 15 Apr 2025 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744714082;
	bh=FSX8SbdRKPNp84bkmuiN4rStU0bu5akTlewHxkcc4YE=;
	h=From:To:Cc:Subject:Date:From;
	b=kNbP0vZEpWv+6Ckavd6b7H5jnyW4qFM7eSPPIzxN8LygQQ8+QgSJ99C65SJTwk48B
	 HbnNv2Y9Lvphx8Nvh/lkr9L5SS0WzxKYXXsOZIbzuW4Wsf1irjWV8J1l9x6ubOSMnv
	 zkcsAA7mWRIkgjFKq7acfwJX/I9n0W9qJglh99C7WgJuHMpz2IZDfDEqHIMIZNUHa5
	 nJvQKt0z1hiVbMj7sQNUtXVU8WKj1t2krYH56FpIVXVnT1KJNtx9eN/ZUzoy9zogr9
	 1o0wdqyDp8Z16fNX9+wSoBuKdvUhE92Sdwuax1vphTnOgCmi2IMJZ9JXqS5TcC+u0J
	 kIR9NmgsXysyA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: maddy@linux.ibm.com
Cc: tglx@linutronix.de,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] irqdomain: ppc: Switch to of_fwnode_handle()
Date: Tue, 15 Apr 2025 12:47:58 +0200
Message-ID: <20250415104758.106890-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
defined of_fwnode_handle(). The former is in the process of being
removed, so use the latter instead.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
This is an indepent patch, please apply directly.

The patch was previously a part of a large series [1], but I would like
maintainers to feed the independent parts through their trees.

[1] https://lore.kernel.org/all/20250319092951.37667-1-jirislaby@kernel.org/
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 2 +-
 arch/powerpc/platforms/pseries/msi.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index ae4b549b5ca0..d8ccf2c9b98a 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1897,7 +1897,7 @@ static int __init pnv_msi_allocate_domains(struct pci_controller *hose, unsigned
 		return -ENOMEM;
 	}
 
-	hose->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(hose->dn),
+	hose->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(hose->dn),
 						     &pnv_msi_domain_info,
 						     hose->dev_domain);
 	if (!hose->msi_domain) {
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index f9d80111c322..5b191f70c088 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -628,7 +628,7 @@ static int __pseries_msi_allocate_domains(struct pci_controller *phb,
 		return -ENOMEM;
 	}
 
-	phb->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(phb->dn),
+	phb->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(phb->dn),
 						    &pseries_msi_domain_info,
 						    phb->dev_domain);
 	if (!phb->msi_domain) {
-- 
2.49.0

