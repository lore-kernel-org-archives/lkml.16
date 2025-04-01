Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4521420C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537882; cv=none; b=T8grChb796rLwitg5sLzNqgEaD6GXscZzzMCWXaUzGqmm3hmzJ/okqCaboNQHX4/P1iaxaH3rcjvLEPaGIDeLksFQNzjGC+qDhNJrbTJn6Qs/cFYUCkKCinn/SprEU0fPba4SFfQ3huqcfsGRt45jJ/t3etV2Pn62+vMQcL/D8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537882; c=relaxed/simple;
	bh=tyI21eFxgwg/l41T88o5V3a4gRMVuj82ERizvReyAIU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IdiSI/ta8iQ2iQPICexf5sWOA4ITkbQHuckiIwJUyJSyiZ0Ip4tdRiYLu6JVcExbIkfmY6fKZ0rHMmFeOOhGti9uOdoD9DLEl9n5qSes5NG3pQXwihdwAIP1BF+GvvTqKyJQkioT/0AvGcGN+TIXZgY5lYi5+CRzOjlm2Rxa0Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzrA3OKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzrA3OKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE013C4CEE4;
	Tue,  1 Apr 2025 20:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743537881;
	bh=tyI21eFxgwg/l41T88o5V3a4gRMVuj82ERizvReyAIU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GzrA3OKDiLL6QNJupGAov6YPIgj6U39yS33lM9VAbKPLIAIxQlhUXIcTuabcgrV6r
	 A/D+wQOnRiKWnDN2tfDPBtB5jcRGwJVcKcnuPOAFcL3nIqWT2jMVVh6EoupEVGEIIW
	 btT6+yRN9PTmD+v21M6sWnTLTlnRUhrTLt+o8lZuLDZetgkuiVuGagGIK05RlYoDeo
	 gt0dSU9e6Ql9WizUdXXhOxNrbSJUAlozkJSujh6c69FXKVTpCLdZCVoSPb0o5F60bN
	 2dooBEAbjClFxgVN3HPk7odgoAT2yEL1nKI1s9qvJ5Az3hS5in1Ho8It50b1MlpYY0
	 RRYSeMWmhi9gw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACC0380AA66;
	Tue,  1 Apr 2025 20:05:19 +0000 (UTC)
Subject: Re: [GIT PULL]:  Dmaengine subystem updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z+pGJypbmzkaVhfz@vaman>
References: <Z+pGJypbmzkaVhfz@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z+pGJypbmzkaVhfz@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-6.15-rc1
X-PR-Tracked-Commit-Id: 6565439894570a07b00dba0b739729fe6b56fba4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
Message-Id: <174353791853.898575.4430846210425989144.pr-tracker-bot@kernel.org>
Date: Tue, 01 Apr 2025 20:05:18 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 31 Mar 2025 13:07:11 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/91e5bfe317d8f8471fbaa3e70cf66cae1314a516

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
