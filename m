Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D3538FA3
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373348; cv=none; b=ap9r+ysOHsbWoOkpsfMSxbRLbJomuswKK5wMpCR8WCu+0sqbyE8YWXwzy0LneC6n1Y5B7bIf9CLFQ6lYfr5EsspfKU0e66rni3u4Grhstw8nqlDxV98mkazmd5WaHGl8j0avtwl1uuly64RkxueoLzgHrc7JP9vwoby2+7nn/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373348; c=relaxed/simple;
	bh=SpVIqG0mFa2jfTzzNyCYGdB1l6HNNt3btuEg0gV3Fy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rX75QeNV4HsSPwczGDXpd2oZOpDl/J6E93mzglaJw9Yv/WG1x3pKd8xxf4f7h0IvyNUk7bnzL+x7VZOsiHASDNH7w+y7qZ8x3U698yOL77weocPIotoa4H9LUZrXcBhsl+bvhpbtocEmAp7IB5SLOtFHcwrxqmyC530Z8EThMp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jU612YZ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jU612YZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B0DC4CEED;
	Tue, 27 May 2025 19:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748373347;
	bh=SpVIqG0mFa2jfTzzNyCYGdB1l6HNNt3btuEg0gV3Fy4=;
	h=Date:From:To:Cc:Subject:From;
	b=jU612YZ+ljNv09Q9R4tVgTFBDSCkpt9fBp1S/3C/GfpZ5BhPbd4iLT7xzn/jM//3D
	 Je5uSDgmtjVyvXSG4/t1Com+gkybmoZJv0/qIEgU2HttAxig6chy9foTr8cWNnVGbF
	 2EIlm+eDWC8y14ePfs1t6dFeZCviS5HGBRYB04L3Mjxbx4Fa6mcb2IOMEdf41980Eo
	 WZFmNtAY3SNllj1qTfAr+eh8sUYe+vz0hNBgZFezIc5fJDJSp9KkBUU8ZfX4qwCelv
	 BUnh8W1G+YDCUurQeG7gCuEmAZiktGhF5kR+Uk5JJYSyJWtZo5wUj4Pk+55onP3SBi
	 91x57chXELuug==
Date: Tue, 27 May 2025 09:15:46 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>
Subject: [GIT PULL] workqueue: Changes for v6.16
Message-ID: <aDYPYnzk3zsrCFYn@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git/ tags/wq-for-6.16

for you to fetch changes up to 23227e71b69af95e421e263302d13f426c548155:

  workqueue: fix typo in comment (2025-05-05 13:43:16 -1000)

----------------------------------------------------------------
workqueue: Changes for v6.16

Fix statistic update race condition and a couple documentation updates.

----------------------------------------------------------------
Guan-Chun Wu (1):
      workqueue: fix typo in comment

Jiayuan Chen (1):
      workqueue: Fix race condition in wq->stats incrementation

Philipp Stanner (1):
      workqueue: Better document teardown for delayed_work

 include/linux/workqueue.h |  2 +-
 kernel/workqueue.c        | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
tejun
