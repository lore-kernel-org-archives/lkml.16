Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC151367
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 06:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276444; cv=none; b=hx1lMn2GG3Gqm/ANZarkL050DbB5i+bj0N3EXNmM8J8yDgf8h/jqEuNBeRXF9UBDso8J2ZF//JcwnwFBKuRQJZo1+UZNG5INv1sA7R0ExllbiAUD147ytnxtmDPf1RuqrGhz2BCgh2GHJfM4e60irGwVGqnVLVeovHfYl9u5xVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276444; c=relaxed/simple;
	bh=c4ttB+zRKBNf4BiiSWRF4nKnYoZONPlcPWNC7u2QuFs=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=mvT9u6plsnqDxOmtQRLo7CKfH3bbXnIOx9egrsU594/wVgBx1H2eaBoVxCGbzRicL6R7uH5+OC6ekusbV0G4Zcad/M5t/38x9cDe37NThTlvrx1Z5NGR8/Pxai92+WEswBD4zu8zOTwa/f66l9QaiM+1bt0+XzgaySdXsjQfOEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 26749298565;
	Sat,  7 Jun 2025 07:59:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id azAygTOnLH8o; Sat,  7 Jun 2025 07:59:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C748A298566;
	Sat,  7 Jun 2025 07:59:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id D7REw3I2mWVN; Sat,  7 Jun 2025 07:59:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A4254298565;
	Sat,  7 Jun 2025 07:59:51 +0200 (CEST)
Date: Sat, 7 Jun 2025 07:59:51 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2 and UBIFS fixes for v6.16-rc1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139 (Linux)/8.8.12_GA_3809)
Thread-Index: 6RWfHAlZCt5fxVFhT6XPyoY6x8qpSQ==
Thread-Topic: JFFS2 and UBIFS fixes for v6.16-rc1

Linus,

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.16-rc1

for you to fetch changes up to 2b6d96503255a3ed676cd70f8368870c6d6a25c6:

  jffs2: check jffs2_prealloc_raw_node_refs() result in few other places (2025-05-22 20:54:38 +0200)

----------------------------------------------------------------
This pull request contains the following fixes for JFFS2 and UBIFS:

JFFS2:
	- Correctly check return code of jffs2_prealloc_raw_node_refs()

UBIFS:
	- Spelling fixes

----------------------------------------------------------------
Artem Sadovnikov (1):
      jffs2: check that raw node were preallocated before writing summary

Fedor Pchelkin (1):
      jffs2: check jffs2_prealloc_raw_node_refs() result in few other places

Thorsten Blum (1):
      ubifs: Fix grammar in error message

 fs/jffs2/erase.c   | 4 +++-
 fs/jffs2/scan.c    | 4 +++-
 fs/jffs2/summary.c | 7 ++++++-
 fs/ubifs/journal.c | 2 +-
 4 files changed, 13 insertions(+), 4 deletions(-)
