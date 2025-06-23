Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EF918B0F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702381; cv=none; b=WfaW4//fydRdPkgmMTjiDVXtbgo0VgdMCy5DHA+stxUhF4DMiW5Kk8oLMbZyMw3MV0lz6/kgLBHHLAw2l24oi0jL4BMAu6eXCLaDNM2+UbsSBuuZngxe52IVaoRzspBxWqTY1xnC31PUufAoF8iut8q2rdwAUNJGgv/XgSL0h6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702381; c=relaxed/simple;
	bh=2r8AGEzml7dStSkWcA1RXhJHy+aLxMei4ZIiS1vWtV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZhnBy95Mr9evQQ6+cHfAQN9cVJhWtuLv9ibQPB7i+AjxyrawNx1+BZn4a2aEZsCeqKPab5wcb5WhOvVM9gj5z49+sP35WymSMrKkpwLYJVYtMKvJi7cDeXHh8kr1iXVkM1AoKaBUPyprkUDNNBV5p6/ZrgwJlBTvYRxSQLXfWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+Awncck; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+Awncck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28C9C4CEEA;
	Mon, 23 Jun 2025 18:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750702381;
	bh=2r8AGEzml7dStSkWcA1RXhJHy+aLxMei4ZIiS1vWtV0=;
	h=Date:From:To:Cc:Subject:From;
	b=t+AwncckHlFw3XBGjdJZ8h206BNMFKf5xm3qTgA2hsZS7cXHnNgeabs7XqohYTtWG
	 swhlmD5ag4erhJfCPfQVWAhLRfKsOdE0LLWoP+ltytioqLCDBM97CLstEzbJUojhIJ
	 LQWp298elsTPp/pF4Z+ZZ3g/ezCBVOZCLjHzzR69cws6G3QmIFMUxoPKmlMZ3vEVsg
	 //60oYTAiNfOHfowteBAJ/+9VAQknF76CEh6pB7Rkl38wQmJc2PGH+WnIaPm3wgY/0
	 z6UpfAutV5Ac9+4K0e8hYotys7PgDkZbhXXP3OUoxCHq10Bly1pCyOx97tJXXr8RxP
	 HByclmhfDsMpQ==
Date: Mon, 23 Jun 2025 18:12:59 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Subject: [GIT PULL] f2fs fixes for 6.16-rc4
Message-ID: <aFmZKyrDBDzTzs4Q@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Could you please help mergint this bug fix series?

Thanks,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.16-rc4

for you to fetch changes up to ba8dac350faf16afc129ce6303ca4feaf083ccb1:

  f2fs: fix to zero post-eof page (2025-06-18 21:35:29 +0000)

----------------------------------------------------------------
f2fs-for-6.16-rc4

There are two bug fixes: 1) double-unlock introduced by the recent folio
conversion, 2) stale page content beyond eof complained by xfstests/generic/363.

----------------------------------------------------------------
Chao Yu (1):
      f2fs: fix to zero post-eof page

Matthew Wilcox (Oracle) (1):
      f2fs: Fix __write_node_folio() conversion

 fs/f2fs/file.c | 38 ++++++++++++++++++++++++++++++++++++++
 fs/f2fs/node.c |  1 -
 2 files changed, 38 insertions(+), 1 deletion(-)

