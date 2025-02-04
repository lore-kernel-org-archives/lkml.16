Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CD41547D8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695528; cv=none; b=IUFOKgUyfjDzrIbW6/9UwlTg6EwOSilz1/vALo6Q70NejzbIiXxur7HnDDU/epNdOviOYXwLlUsvNJAsC3jIfERi3WU2EAPLLu3ckEX8Vq/ibEl9RyE7E2n6dv2StaFifZc3PD7kAGNUK/7AE7izRF5HTNRpTBJq9JwXjjgwqLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695528; c=relaxed/simple;
	bh=0L5bryRXiPggJfKO3hVYa1P/qcyKedAdEoWCu8CBI2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UoKhRMX/goYI5DR9H3MSi+dTo5q5/tXQNW1w/MYFcG7bB7VHE3sfwDQGEri9a/pKt5773E5zMDdnd5wmPF+FRvch3xrwzz8KDeo8XW3KeT/kxr2AAQLNZGW6YR1K3/Xml5hZBdZoB4iTZ2TiZ9jc1YM5BziT8F7gcCHDkt91iM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIzml+NZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIzml+NZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12502C4CEDF;
	Tue,  4 Feb 2025 18:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738695527;
	bh=0L5bryRXiPggJfKO3hVYa1P/qcyKedAdEoWCu8CBI2E=;
	h=Date:From:To:Cc:Subject:From;
	b=jIzml+NZJqQFWxZsuDvuIQmOtWKlfCnn/FTS4hQfx8eAmQcAGvKub6HLUdL7x26Az
	 9kjG4NQJ2OrU3t1BGHc7CHW3P/rChBw2DCybbOwTrwMwg49z+wNOaaRZCPM8qRxs2b
	 WbgwhEIXwxWq8wuPe0iHnZwZfWq6t6Zji/kmFQ8Itnw85M9QVPNXmX/2xF0lqT/ZhX
	 DVynD3rN0omDz+N8ARvk8A0PsuQWDwDlg/s6+8vPPvJm+sO2IOCqTUcGo1dv1e6g0U
	 ZOzaWDyLyt/hnVx4IEKvSrCHgi2Gwc5h8D6SkLDJoHiYZEmUa3BGRXt6bceZtuvoUp
	 gyHVjpq+lm7Ow==
Date: Tue, 4 Feb 2025 19:58:44 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [GIT PULL] kthreads fixes for v6.14-rc2
Message-ID: <Z6JjZMdbDoAX_AVW@pavilion.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git tags/kthreads-fixes-2025-02-04

for you to fetch changes up to 1b0332a42656b798bea867631d739de023633ec6:

  kthread: Fix return value on kzalloc() failure in kthread_affine_preferred() (2025-02-04 01:42:27 +0100)

----------------------------------------------------------------
Fixes for kthreads

- Properly handle return value when allocation fails for the preferred
  affinity.

----------------------------------------------------------------
Yu-Chun Lin (1):
      kthread: Fix return value on kzalloc() failure in kthread_affine_preferred()

 kernel/kthread.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
