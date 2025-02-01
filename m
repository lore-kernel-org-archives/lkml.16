Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8552139D1E;
	Sat,  1 Feb 2025 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738444798; cv=none; b=KB6mc7sscDmI4cPRKJDrBEffwbLhKpl+mgFlO7BFUbIeskpZ7tx7vRTSg1qZKL3s7stUjinJZqgN/Vb0682g5D/KFuvBRgDWRPMLE5wtEVUSU+CIhMOyX3dOkM4m//iYhPdMU4TRwoRRQZwOdJlQsLjsKczYVZQa2stFxCaHheI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738444798; c=relaxed/simple;
	bh=CCOSm0p/j/Xt4GDe3UZLlfY+jwVs30JiOGDTenrQFwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M0rtsDVCoYSXYY2q2FPpyhqECqMWYOIac0e6LsIvccY3PDGJmqZ3loQqOwfASj4uPOwCsBS59O364423Ur7D8SdJWndoQjd12sKqjMC7zyCKSXoaljP6VHaZ02f0YvorQsO9ouGtB9Gz8FOdN0ECPVWb6t9z0KMQFyJL2F5R+RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1teKtt-0000dw-00; Sat, 01 Feb 2025 22:19:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7425CC013E; Sat,  1 Feb 2025 22:19:23 +0100 (CET)
Date: Sat, 1 Feb 2025 22:19:23 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.14
Message-ID: <Z56P2zOAU8Sjm1a9@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit df1b8d6e89db0edd572a1e375f5d3dd5575b9a9b:

  MIPS: pci-legacy: Override pci_address_to_pio (2025-01-20 20:39:23 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.14_1

for you to fetch changes up to ec918a11e63856999b31705e81226dd7dc043e20:

  Revert "mips: fix shmctl/semctl/msgctl syscall for o32" (2025-01-31 09:28:38 +0100)

----------------------------------------------------------------
Revert commit breaking sysv ipc for o32 ABI

----------------------------------------------------------------
Thomas Bogendoerfer (1):
      Revert "mips: fix shmctl/semctl/msgctl syscall for o32"

 arch/mips/kernel/syscalls/syscall_o32.tbl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
