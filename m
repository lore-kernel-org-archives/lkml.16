Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4711F3FF8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750517008; cv=none; b=uwsYp5Kw38IEyJDs45nBjDng0qwLv6FtHJMQWboWBVdRpJaqtS5HPJpTbQbED8iJl8jIWo5f60050a10ERvSBwJs7cUenCAojwDoQMbyUxoci7zLfO3UibRt1lqJ7G8qx3W3t1vbVr906l+AuMaeZB1ZfiTQsB+C9j+YfJXrngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750517008; c=relaxed/simple;
	bh=QA1Q+5+OWk/IBpt41mmGU0DCfYU/ArkXG9Bg8q8JztA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YomQc99nI/Jgce5M0hH+VHdcqgdYzvXJFLKOcVXIpYKy6bPVOROJBmduQrCGzEWno0cMWR3fbV6C42Q0wt14Fa1Kpi9+COa486LkT7DMHyTiX7t+ZtsTtScFZKI+z1TZzIJUH6oKKrAXNy5XRtcl3CGtB2GZyz5SdPWnyIaOut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+zbLIzO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+zbLIzO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B6BC4CEEF;
	Sat, 21 Jun 2025 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750517008;
	bh=QA1Q+5+OWk/IBpt41mmGU0DCfYU/ArkXG9Bg8q8JztA=;
	h=Date:From:To:Cc:Subject:From;
	b=b+zbLIzO0J43borKo00gg/t7mXtKgxU+nMX3NcYdJjwofllG/aH0hfnNLZSfe4eDd
	 4hgyW6f5NPADqWQ3g+72XTI2wfFeR8c3/OXS86H9cbGMdj+xZm3fQCvN0Ov+OXd2xQ
	 FfhGj/k2ry7Hq4N+roflpX09RICkA2+g+AtSKK5QpHS63DkznSNG0ZtBC/vAx5PRH3
	 790rsxUf5i+6y3eFLOLUiKgwvIy73he1HYs1nWptwJiDsL/x9XwgU/SFQuI+w+N0Dk
	 ZSnGWWax9t6Ba354tWmpiWrTIrEhJQu+M7LYpgGxTpOvl2g1ADEjFvTdDvPPKilHrR
	 9nLfN0P2nQv6Q==
Date: Sat, 21 Jun 2025 22:43:23 +0800
From: Gao Xiang <xiang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Tatsuyuki Ishi <ishitatsuyuki@google.com>,
	Hongbo Li <lihongbo22@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [GIT PULL] erofs fixes for 6.16-rc3
Message-ID: <aFbFC3q0SNO7ZkQi@debian>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Tatsuyuki Ishi <ishitatsuyuki@google.com>,
	Hongbo Li <lihongbo22@huawei.com>, Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Could you consider those fixes for 6.16-rc3?

A few miscellaneous fixes are as shown below..

Thanks,
Gao Xiang

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.16-rc3-fixes

for you to fetch changes up to 417b8af2e30d7f131682a893ad79c506fd39c624:

  erofs: remove a superfluous check for encoded extents (2025-06-20 23:41:12 +0800)

----------------------------------------------------------------
Changes since the last update:

 - Use the mounter’s credentials for file-backed mounts to resolve
   Android SELinux permission issues;

 - Remove the unused trace event `erofs_destroy_inode`;

 - Error out on crafted out-of-file-range encoded extents;

 - Remove an incorrect check for encoded extents.

----------------------------------------------------------------
Gao Xiang (3):
      erofs: remove unused trace event erofs_destroy_inode
      erofs: refuse crafted out-of-file-range encoded extents
      erofs: remove a superfluous check for encoded extents

Tatsuyuki Ishi (1):
      erofs: impersonate the opener's credentials when accessing backing file

 fs/erofs/fileio.c            |  3 +++
 fs/erofs/zmap.c              | 10 ++++------
 include/trace/events/erofs.h | 18 ------------------
 3 files changed, 7 insertions(+), 24 deletions(-)

