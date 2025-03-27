Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC841D8DE1;
	Thu, 27 Mar 2025 20:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108452; cv=none; b=tgzFDA5gydnD0F2sj4idG1H0XhlPhYU6QJf4ak6h2StEDZKK9871lQ48U7kwmwWIs706QAQ3lkREZS2ssxjuLIZoAShh4DRgfrfdhAERUBzkDdInf5li07ry1A+NVUw69F3qMamSNRl65aKBm44dIq/j2jLMntingBnFd9zphOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108452; c=relaxed/simple;
	bh=hpopxnxIxkaLs/NJ4rsEggNKcggq61znnSUJWNFB/hk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uBd7K3GUKi/X5a/ZS0WhZaVH2GQH6fDxUgH92Pc68jRxn9oKhFMCr+nXsgbJmNYbruGZ6Z0LiQeQxc2vgijVBuR3FN2B3dbQv/2xAW/C4rIz0yr6OBuWhfeNS7okjALQLlKJGbqUb3nfQsh29tkZc+QGK1OK9XKvlpzUqkmmrco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwiqG0pd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwiqG0pd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D029AC4CEEA;
	Thu, 27 Mar 2025 20:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108451;
	bh=hpopxnxIxkaLs/NJ4rsEggNKcggq61znnSUJWNFB/hk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rwiqG0pdXcxLxqGpJZaZU3C8RcEDEHl+Lbx2a1+YuiBhVgFJVEn0dWcv+k3AC2zeq
	 lzlUyIJZNOPZdYfj7vbuugjWStLdhu96yfbq1nCc/0LcUeTDfDcnOxI4fKoyt/cfC3
	 zEuAN/d7ITuSmreQn9rT3Li2x/jq0eDzUm1c4kYtbmoCEdHeQxF5bYB4X2pSTAORDE
	 Yjxw6A5puRIWaLAhNkohiPVXGp+H9rOYaQ5eTnxoQB9uwAjqEYcQG6si/ieRfPjPFT
	 /7aXdVzwwzmEMVZBWCfxLbV9DTASPi9gaGQxYwEwG49w71N9oTro9K2NLFvTgRSctY
	 1GpQdMlhkOUmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FBF380AAFD;
	Thu, 27 Mar 2025 20:48:09 +0000 (UTC)
Subject: Re: [GIT PULL] dlm updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-GQbyqwct3BVdiH@redhat.com>
References: <Z-GQbyqwct3BVdiH@redhat.com>
X-PR-Tracked-List-Id: <gfs2.lists.linux.dev>
X-PR-Tracked-Message-Id: <Z-GQbyqwct3BVdiH@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.15
X-PR-Tracked-Commit-Id: 03d2b62208a336a3bb984b9465ef6d89a046ea22
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0de1e84263a2cc47fc642bcccee589a1e5220792
Message-Id: <174310848809.2212788.10948634388370481375.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 20:48:08 +0000
To: David Teigland <teigland@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, gfs2@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 24 Mar 2025 12:03:43 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0de1e84263a2cc47fc642bcccee589a1e5220792

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
