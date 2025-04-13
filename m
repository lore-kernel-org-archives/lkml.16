Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E761DDC12
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744563828; cv=none; b=T9VrrKaqki754vPIQcQ81LJaavw4JS02H0zW4h7C3Qye4ylhRD+MHTmhF4VpO8WYGBlvMUph8guUeok/OyILL2eaqvxWf53krnDCWri/b22HUSZs2ubXnGhmoin/zF0SEfqGptLCS1+ub2hQzOBUhaq0mG/b0zroOs3DQoAnL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744563828; c=relaxed/simple;
	bh=UCLYzL47JucMsbR6qTqiu+oRe6Ro+ITu9qTxJb4BOyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e86DLqVVKrXnDrxwYLXNkDPfKtoaqfYmeRw/I7q2bjFRuHRlHNW9JtP0o8uZ3udeAZv3x6pBLWIm8Bh1Hav9XffeO0S5CsytxZSQtWVkkImbm75I+eL6QORAEWuR41tqpFg5HNd08FPPCjgQJy8mxSan5gHbOwLepmp4P9NjcK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4kRDybo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4kRDybo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEA5C4CEDD;
	Sun, 13 Apr 2025 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744563828;
	bh=UCLYzL47JucMsbR6qTqiu+oRe6Ro+ITu9qTxJb4BOyY=;
	h=Date:From:To:Cc:Subject:From;
	b=J4kRDybo8oc+xF6r7cdvQt4PEcsHWIhJl9MowvOjAfZ2+gIvfCWyooEmO29ty9pQY
	 NSvtyHQwDtmcOhLfEGTnkpBSil/dQE1eFvJUImFrKMEVFgEy5LsOryquh6bNxnLmQU
	 SBD/B3sf4hiJbNAo0KJEJBrZndcWe8t8MjpM05XrgSCjiCCHwW9hjfkgsjqr7L74lb
	 9grqED8p1tVdR8As6wMx8KPQ/SRUCtyYuF8KYNQsgRE+xkpSdEjjdaXKUP5/NS1ZAa
	 MNOW25IENgkHyP4a/fR1HoRjHr/tkHvUM+UCqZyueO8bqg1hbfNJkK3GIGSE1bzlA7
	 k8DAYpTVzlj8A==
Date: Mon, 14 Apr 2025 01:03:42 +0800
From: Gao Xiang <xiang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Sheng Yong <shengyong1@xiaomi.com>, Bo Liu <liubo03@inspur.com>,
	Chao Yu <chao@kernel.org>
Subject: [GIT PULL] erofs fixes for 6.15-rc2
Message-ID: <Z/vubg+MYaiszHm2@debian>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Sheng Yong <shengyong1@xiaomi.com>, Bo Liu <liubo03@inspur.com>,
	Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

Could you consider those fixes for 6.15-rc2?

Just a few miscellaneous fixes as shown below..  All commits have been
in -next for a while and no potential merge conflicts is observed.

Thanks,
Gao Xiang

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.15-rc2-fixes

for you to fetch changes up to f5ffef9881a76764477978c39f1ad0136a4adcab:

  erofs: remove duplicate code (2025-04-10 14:24:05 +0800)

----------------------------------------------------------------
Changes since last update:

 - Properly handle errors when file-backed I/O fails.

 - Fix compilation issues on ARM platform (arm-linux-gnueabi);

 - Fix parsing of encoded extents;

 - Minor cleanup.

----------------------------------------------------------------
Bo Liu (1):
      erofs: remove duplicate code

Gao Xiang (2):
      erofs: add __packed annotation to union(__le16..)
      erofs: fix encoded extents handling

Sheng Yong (1):
      erofs: set error to bio if file-backed IO fails

 fs/erofs/erofs_fs.h | 8 ++++----
 fs/erofs/fileio.c   | 2 ++
 fs/erofs/zdata.c    | 1 -
 fs/erofs/zmap.c     | 5 +++--
 4 files changed, 9 insertions(+), 7 deletions(-)
