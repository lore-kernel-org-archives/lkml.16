Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1083720D505
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743532633; cv=none; b=gUksft0S1C1Hn+LFsXV8piZm0MaS4bv4gutNF0AyJur/pbSkcBS3ohHvwzkkl12Nx3fIrPlunzPYAE17NdmvAUm3DGfoluvj2RdnxhFqXqjAFg0L1cnFqRbmtbTJstAqxTFODxT1kP2lJMhwa2zBraz6Xryjk6tyOkoy5/ilRoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743532633; c=relaxed/simple;
	bh=dN2j7w9qcQA+1038+6GfWuI51GpGJCtnMZs2if3a+Q8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ys/KclWmkKz9UR116WAzA7vXnNfOZ3Td48GtHfq0cXhgVA7GXwwbPs19sihAaOcz0VKPu2xVced+pKTCJ0nWWnlkkPmXmotERjPAIAJ2yq3AGeqSWnsoIvzU5xtTACH0EKVD/hyUgFH8h5DuYkfOjX5wWGG7BhZh4uw/ZcaR35M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZNn9fW4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZNn9fW4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72B6C4CEE4;
	Tue,  1 Apr 2025 18:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743532632;
	bh=dN2j7w9qcQA+1038+6GfWuI51GpGJCtnMZs2if3a+Q8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rZNn9fW4+0RTuq+XykENK7yz4C6hSZVJmGs7Yin6u7yVXmhRJSd9W/jvF0AyugdE0
	 WzPh6Gm31Z9Adn/4LzjYtB1k8T175j0sPdOa/08Rgo3AuMAPP5pP7YKT/0CQk5zONB
	 fdGO6ORDzrKNzFrC5taS8DCLw3HfuTlDqDuxJNB6EPxZPeUATZDIN5gzjQbTEJBoCw
	 qkbrQPO46nDl4W6260wnFAZI00aZga7INl1EgC1mdU2oOX/sQhkvktkOetNJJEgjhx
	 xrawuuXf2UTbLKQ5Bn8Ow1XVpOsoZqdJ11iYjJmLHEAj7+0aJ5VG/z9bBYui2tnREw
	 ASl6Z2M/rO7fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2A2380AA66;
	Tue,  1 Apr 2025 18:37:50 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core updates for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-mM2UCJNwRiUcaF@kroah.com>
References: <Z-mM2UCJNwRiUcaF@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-mM2UCJNwRiUcaF@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/driver-core-6.15-rc1
X-PR-Tracked-Commit-Id: 51d0de7596a458096756c895cfed6bc4a7ecac10
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2cd5769fb0b78b8ef583ab4c0015c2c48d525dac
Message-Id: <174353266956.872225.6078499491526269424.pr-tracker-bot@kernel.org>
Date: Tue, 01 Apr 2025 18:37:49 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Mar 2025 20:26:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/driver-core-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2cd5769fb0b78b8ef583ab4c0015c2c48d525dac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
