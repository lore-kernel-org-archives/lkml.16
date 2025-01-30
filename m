Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9470D12E7E
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275683; cv=none; b=fv019aGvyaRuFc8nrL7nFO/y0tFVWPe5gDPWS084GzVKGJUejH/sr8zf6TxaW0xACuBQx8VbSipA5v5zlNcZXOt+JeDdJPP5WD5kmy6bkTMogUEAkOrh+ag4gyU7GibRHfrQYW9r6nZcF9Z24uTI1pObdU6vVxgbfAF0dtaZxYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275683; c=relaxed/simple;
	bh=ELbQ4YDrkYQeKh40+Z7X0Ljik3YvVYwJXhLrugv0UnU=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=SkZHPJk6OWpLBkCPz01z/Rr6XaqRophvI69+WfmkIGMV7JLvSota/hKRb/KUc/mHO/E/7XLbghbWHLbW9uhCkH77OzKUQWjL7TUiAk1/PReVGdUx4i6XHrmSb59/DjbIOm7x2TwocIf+4EwX+Ovs9Ebub4Ml7hroC2WsLGNyCyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7B4D12D9984;
	Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id awUR3DSUSUg4; Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 217512D99A1;
	Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pWl294mpN631; Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0BEC02D9984;
	Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Date: Thu, 30 Jan 2025 23:11:36 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <98948953.304331862.1738275096021.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI and UBIFS changes for v6.14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Index: V3EMhxVU1TKFaFfcr9R/3kCFiwG74w==
Thread-Topic: UBI and UBIFS changes for v6.14

Linus,

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.14-rc1

for you to fetch changes up to 69146a8c893f734cefaac0af6f917f894f29077e:

  ubi: ubi_get_ec_info: Fix compiling error 'cast specifies array type' (2025-01-20 09:09:24 +0100)

----------------------------------------------------------------
This pull request contains updates for UBI and UBIFS:

UBI:
- New interface to dump detailed erase counters
- Fixes around wear-leveling

UBIFS:
- Minor cleanups
- Fix for TNC dumping code

----------------------------------------------------------------
Denis Arefev (1):
      ubi: Add a check for ubi_num

Pintu Kumar (2):
      ubifs: dump_lpt_leb: remove return at end of void function
      ubifs: ubifs_dump_leb: remove return from end of void function

Rickard Andersson (2):
      ubi: Expose interface for detailed erase counters
      ubi: Implement ioctl for detailed erase counters

Zhihao Cheng (2):
      ubi: Revert "ubi: wl: Close down wear-leveling before nand is suspended"
      ubi: ubi_get_ec_info: Fix compiling error 'cast specifies array type'

pangliyuan (1):
      ubifs: skip dumping tnc tree when zroot is null

 drivers/mtd/ubi/build.c     |  2 +-
 drivers/mtd/ubi/cdev.c      | 70 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h       |  2 --
 drivers/mtd/ubi/wl.c        | 21 --------------
 fs/ubifs/debug.c            | 23 ++++++++-------
 fs/ubifs/lpt_commit.c       |  1 -
 include/uapi/mtd/ubi-user.h | 33 +++++++++++++++++++++
 7 files changed, 117 insertions(+), 35 deletions(-)
