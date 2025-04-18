Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4759522F155
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008022; cv=none; b=MvJ0cY+mKhz1nRj+0Tlfp/oOMyyhiEORcvFAM5f2km4nbAHtAWAno9vJ6ruaDqWR7TvAPPN0nZJkNhohnnBH7vdqWPmd7my5rAGooLNS4Ouselg6phAG//W9SIyLZN/bwL9ZLMs8yK3ZSoJZgXCRdwuAgdQBTsEDjnrkk8u8Q28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008022; c=relaxed/simple;
	bh=k58UFn+1yoolFQn6J1ycHW2hqc/wIWr0PcZBHMmyIoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QfOoqHNEIbfm3CQc3KHLnPaNUlp7rFmQw3xejq3jk2acLmRpCmRS+yDUuK4pfwGzX3jkgO8SjpTaRScL+nNV+0sfH6aDiPg+yABsqXovTrsnkAL6DPn/+bsaWOEARkGfwCT1lHtLcf0wrn7+75xNPy81sx2UYETk/l60/F8z2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7YyPepL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7YyPepL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23BCC4CEED;
	Fri, 18 Apr 2025 20:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008022;
	bh=k58UFn+1yoolFQn6J1ycHW2hqc/wIWr0PcZBHMmyIoQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Q7YyPepLpGhypqUVzr+7ekObxnmX3axxNDkifsJu2HvLLkN+0yV0oJpN12vNMTr08
	 OAb7y0Y35GY3QqiXQ0poEmFQX90BykhtgvFiey9CB2aAtWOUtl+fH5vcPUwjOHedLz
	 u8h3SRKASK1OUMwKD0+nkSw5+6Ub/kg8zTLt+U59j3YSxvvLuDmo1h+TeriW1h4nf4
	 846mglLC1jsPC5S+0WzwwA1kXZEjqnvGgstZf5FJfEfThyda3ZFmkDgo44RUYPbfss
	 IkglbKJVihbaWskvNhwfeAEpLjAmFnptzOypyU+lCWE7tQ/Tr3+3AfQggNYe9/ljX5
	 zl8oGikogqu3g==
Date: Fri, 18 Apr 2025 22:26:58 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Andrew Morton <akpm@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [GIT PULL] IRQ fixes
Message-ID: <aAK1klVICYVVm8IJ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest irq/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-18

   # HEAD: 9b3ae50cb902322a2b5922b9fcf8132d9b4c2a24 irqchip/irq-bcm2712-mip: Enable driver when ARCH_BCM2835 is enabled

Miscellaneous fixes:

 - Fix BCM2712 irqchip driver Kconfig dependencies
   required on the Raspberry PI5

 - Fix spurious interrupts on RZ/G3E SMARC EVK systems

 - Fix crash regression on Sun/NIU hardware

 - Apply MSI driver quirk for Sun Neptune chips

 Thanks,

	Ingo

------------------>
Biju Das (1):
      irqchip/renesas-rzv2h: Prevent TINT spurious interrupt

Jonathan Currier (2):
      PCI/MSI: Add an option to write MSIX ENTRY_DATA before any reads
      net/niu: Niu requires MSIX ENTRY_DATA fields touch before entry reads

Peter Robinson (1):
      irqchip/irq-bcm2712-mip: Enable driver when ARCH_BCM2835 is enabled


 drivers/irqchip/Kconfig             | 4 ++--
 drivers/irqchip/irq-renesas-rzv2h.c | 8 ++++++++
 drivers/net/ethernet/sun/niu.c      | 2 ++
 drivers/pci/msi/msi.c               | 3 +++
 include/linux/pci.h                 | 2 ++
 5 files changed, 17 insertions(+), 2 deletions(-)
