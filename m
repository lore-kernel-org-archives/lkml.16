Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A325C21C18D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751081277; cv=none; b=pmcZE1+dprGmEG+5tXrlzl+QCL8b8BqijHpe+e962NMn45jz16cTn+6LaUKLbjlI0bdaEJm0e3OeRKfckUxTvdOqs7AsvFJ/Zz63b+MZ8HScC/RlhBrTsIYMJ6AHtz5n6kydsv85BKlMcZaikVKrpHyi8EjnArajLrrzQ3WKL20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751081277; c=relaxed/simple;
	bh=yZkMuMNgz2W3Jj5uAWkrAjOssfmfYf0vHHTK7Tli594=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZtlmYwXTApX+lw9+4JRWw9zAASbGJ+3X/mcVkfrL/K2DKR6Huua847Ix+CY558uhJ0Y7VtcakkVNGuUoJ/tTFaqzOZ140S5MfspCZOzb8NL8Qifv18G5i9GPTtiEH1D5NqPeT9y12lfUzHtGHV53lnNRNp8GshTuXxwAHtWtg5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+VZ3aCe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+VZ3aCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86429C4CEE3;
	Sat, 28 Jun 2025 03:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751081277;
	bh=yZkMuMNgz2W3Jj5uAWkrAjOssfmfYf0vHHTK7Tli594=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=m+VZ3aCeYgEon3GFD36ok8Bs6wAuE1a+kGs0HvEpUPR38PNM7S7HjL/9joK3e1Kxq
	 K9wEsw85HGQFy4uRw9HHfLuQA57TuU/b0QnkW3u67pqGXFH4Vca5qoXq9w83l3Guz1
	 rbB/1TybCtdK6wOHGrknEbKlPjz7RGx4Psw9/gyhiwtBb7e6vxWSbeFup3Rh8swhm9
	 PxqR/u/sK8ZraoAysa/CKc58YV/ib0pu+4c2yJT/XXvBkCth8PsMr9XT4/9BUdEpEq
	 LKO0PQ7ZQPz/fwUrfk4UUpyvjuNhoYxlC19mwTehoOavO8Tf4k9sJ7eEkCZVUlyP/7
	 2rD6a54GyBtbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0238111CE;
	Sat, 28 Jun 2025 03:28:24 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzQhY_VeMkfYO8ZsUYdOrL9bAofZVUHKckjP2zPj_5Q2g@mail.gmail.com>
References: <CAPM=9tzQhY_VeMkfYO8ZsUYdOrL9bAofZVUHKckjP2zPj_5Q2g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzQhY_VeMkfYO8ZsUYdOrL9bAofZVUHKckjP2zPj_5Q2g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-28
X-PR-Tracked-Commit-Id: 9fbceb37c95939182e1409211447a1d3f3db9274
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7abdafd2343ab199367c8243d6a5f06a9aa6976b
Message-Id: <175108130337.2124567.16052817178780470142.pr-tracker-bot@kernel.org>
Date: Sat, 28 Jun 2025 03:28:23 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 28 Jun 2025 07:05:56 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7abdafd2343ab199367c8243d6a5f06a9aa6976b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
