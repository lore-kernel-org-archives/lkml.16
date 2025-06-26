Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED12EACFE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949285; cv=none; b=W45qQcSOJ3/jCFP/zYK5SBfRZXAava0Hkf+L2FQFS60hLRBfe5W/KBCfVVCicGQaendRAIBshIkasAWTkiYjPh/z8jKittFZ/zPOCvlFf4WptCpxeqpZSrF0jKLR5qBdAT0ofB1+i4Uo9EfvNjSxQeRGRHO2HrVCkhYr2rtfHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949285; c=relaxed/simple;
	bh=Gw6oESqEtUagNvs16cTDAdMssYECfjXbtoCncm/B7Rc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d2vasO+Y8Teo+dXk6j+3LxVOCRxmbebC9eU9GADG1kTncVMmCJchk2xhUFBRj0s9z7toLDszTH1n37M5rGJmoxYwnMpcc7kG6Dc+jgTVtd6o82TH97kX90oC+VAe6BC7yeY1rEnInmEiw9/Jr6689DJjBrfcaj4E1xbLgfE5dMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dkL6SNg1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N7DjUNXQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dkL6SNg1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N7DjUNXQ"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K8YPmhgd7GRWdTq4p5rz0ar2G7c+A7AteQJ8okEmiyU=;
	b=dkL6SNg1bPhA+biVVEeT8puaUIOg12+2SWQ7defQnHIGc9BDeWFkd1ctQ0gUNZYvNeApXP
	WKdDIs2QCoBK41hm/zn/jYT5Vh/jWy8U1ZykAdAolO8k+m2uoPgkAaXngSTm1YfYg9VL4s
	xKAITZgt8HJDg6q2TgfDS7EgorR3Kwo4z0iVceePevM56nPtvaBhlcsdz/rHvth0L7ZdkE
	lbHZiKhiM7y6T0d9NmsJ/FVmQYenLVaAs4br1GynVIFVRHhjwLnOaOXbrqcBiUzasF0T56
	F5wOZLlxBTirOCSLMJKWgpboqFAeZRPNL+frv5rz2eVmsW136HWHf72DD07kSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K8YPmhgd7GRWdTq4p5rz0ar2G7c+A7AteQJ8okEmiyU=;
	b=N7DjUNXQqh1nFLJCr+LThRh/bbiQX23ScEPQDSYJRD73sjpRqG1FOEFxPcaMl51rLMgJX1
	kQa/d6OKtvnYh4Bw==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/3] powerpc: Cleanup and convert to MSI parent domain
Date: Thu, 26 Jun 2025 16:47:39 +0200
Message-Id: <cover.1750861319.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The initial implementation of PCI/MSI interrupt domains in the hierarchical
interrupt domain model used a shortcut by providing a global PCI/MSI
domain.

This works because the PCI/MSI[X] hardware is standardized and uniform, but
it violates the basic design principle of hierarchical interrupt domains:
Each hardware block involved in the interrupt delivery chain should have a
separate interrupt domain.

For PCI/MSI[X], the interrupt controller is per PCI device and not a global
made-up entity.

Unsurprisingly, the shortcut turned out to have downsides as it does not
allow dynamic allocation of interrupt vectors after initialization and it
prevents supporting IMS on PCI. For further details, see:

https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/

The solution is implementing per device MSI domains, this means the
entities which provide global PCI/MSI domain so far have to implement MSI
parent domain functionality instead.

This series:

   - Untangle XIVE driver from Powernv and Pseries drivers

   - Convert the Powernv and Pseries drivers to implement MSI parent domain
     functionality

Nam Cao (3):
  powerpc/xive: Untangle xive from child interrupt controller drivers
  powerpc/powernv/pci: Switch to use msi_create_parent_irq_domain()
  powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()

 arch/powerpc/include/asm/pci-bridge.h     |   2 -
 arch/powerpc/include/asm/xive.h           |   1 -
 arch/powerpc/platforms/powernv/Kconfig    |   1 +
 arch/powerpc/platforms/powernv/pci-ioda.c |  96 ++++++-----------
 arch/powerpc/platforms/pseries/Kconfig    |   1 +
 arch/powerpc/platforms/pseries/msi.c      | 124 ++++++++--------------
 arch/powerpc/sysdev/xive/common.c         |  63 ++++++-----
 7 files changed, 113 insertions(+), 175 deletions(-)

--=20
2.39.5

