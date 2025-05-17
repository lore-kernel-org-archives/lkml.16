Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F4B23DE
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747489026; cv=none; b=I8RZeAwpRglnxuDLetBYDt+H+5wEJw1ucUA3hlkuCd8Bh+Bud1hVhtvAYvhYRwaffYANdNs/+ZcAvqzIrFtEvsNuE2fNrDw48ZF3q+G9kTzIae37cGalk6REBWx0FCG3qnjZsAMQ/AYMYThxIYWa+XaGDgEkMX8DXB/jK9JJtW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747489026; c=relaxed/simple;
	bh=pLrddiYWRWtWvhnzK+cAp6b661/n8AaStKDWnuEub0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4EjmnrOEB2MziBrQN99MeyQaPFLvxCyPUSITKKtovTYjP9uz4Fk01/XAFn4hiEcRAnGTMFD/cABxCMZZEzaWPzoPcdxFDtbqtSgqyiapfopHC8PgQ0CbN5xr5ytoywwblLlKdoxqJuC6D2TeV84hZZGYdWBS7uJwgU6569rXl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTLPOorM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTLPOorM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED06C4CEE3;
	Sat, 17 May 2025 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747489025;
	bh=pLrddiYWRWtWvhnzK+cAp6b661/n8AaStKDWnuEub0g=;
	h=Date:From:To:Cc:Subject:From;
	b=HTLPOorMyszoqlvFH4YPjNUkOUArAtunAJhRUAF+QLuZ2pNWrfxCOLBgkKqSk4cLP
	 G82EQofbeePs2cI6JrpFU83qtAgopn5SmK/G/ady3k9jIiP3XWzravYpL9OLZz7uxM
	 zF7u65e3Mm0vdlCp10mhwVX2juaaCfiPKfqWxSyG+B8x8EcY3Pp3ta0XwKVB/sTP6G
	 Kg6ml5a8Lf/0eGRSjdztFSx7TdYgyKYsf9kuBkxzNmy96zHK0E2TJFdi1Cosp8pLvj
	 sentDKmw6NOVNkobK0G1qq7jpEfvCNwLCJVZ/SZv2k53WFaaaFsqw+cOAzvHmNGwbE
	 BOsOJ4lMAPiKw==
Date: Sat, 17 May 2025 15:37:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [GIT PULL] IRQ fixes
Message-ID: <aCiQ_cORMK2bGXGW@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-05-17

   # HEAD: 08fb624802d8786253994d8ebdbbcdaa186f04f5 irqchip/riscv-imsic: Start local sync timer on correct CPU

Misc irqchip driver fixes:

 - Remove the MSI_CHIP_FLAG_SET_ACK flag from 5 irqchip drivers
   that did not require it.

 - Fix IRQ handling delays in the riscv-imsic irqchip driver

 Thanks,

	Ingo

------------------>
Andrew Bresticker (1):
      irqchip/riscv-imsic: Start local sync timer on correct CPU

Marc Zyngier (1):
      irqchip: Drop MSI_CHIP_FLAG_SET_ACK from unsuspecting MSI drivers


 drivers/irqchip/irq-gic-v2m.c               |  2 +-
 drivers/irqchip/irq-gic-v3-its-msi-parent.c |  2 +-
 drivers/irqchip/irq-gic-v3-mbi.c            |  2 +-
 drivers/irqchip/irq-mvebu-gicp.c            |  2 +-
 drivers/irqchip/irq-mvebu-odmi.c            |  2 +-
 drivers/irqchip/irq-riscv-imsic-state.c     | 10 +++++-----
 6 files changed, 10 insertions(+), 10 deletions(-)
