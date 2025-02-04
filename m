Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14631216E2C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696370; cv=none; b=Pmcq1N93Wn17kUuNpyep5lrSnYhGdrZa1E+MFSZNFMs3ATTnCzh4PaWKciUY6K9YhivQEAb4CxYlb2Nsjrf6pvx6ikxgDP+o6Af0F5lwgTmJn0ijGiw1fDy7uc328/L0g3w+FdD7Opix/DrCK6Eo1L4ldRaUkqZPtrUGVvBrnU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696370; c=relaxed/simple;
	bh=+eUkCXqjeetptEAoJ8LYOBsCPeBg5ZDUnUSIodp9i1Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NcAnQo9P3slO7Hu1xJmoj6ivmsA6Dn+F6KjJCqMjpBaCucjFPqqu5aXfoRrZdrn1TKgzX7d2kzjNl/Av/5UDHSPsYsrIucDQqT2BF0iUKxdG5yW2EdFS5/zevQnnAHa2u1mbZwKein3Rwp/0BudqcBMpRinW+Pr3J3IBypXPBeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWGfr2HX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWGfr2HX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF06C4CEDF;
	Tue,  4 Feb 2025 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738696369;
	bh=+eUkCXqjeetptEAoJ8LYOBsCPeBg5ZDUnUSIodp9i1Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YWGfr2HXqGbdNt2jn9UxpZtspMUoPpSHcKgrktys3lTRr5ckbRIfWdlmYJN2Dc2r0
	 s0E6l9u7I/I3aVfqedQWnp0iuINMHn9PU9d767GOSKGyA2v/KE0GT/Ho2rD8qj0O9s
	 wqX7y7bTtPn8n/U+BDCytRB1Tp1uqWcA0tiaOFb+OjLz/acLCwJy19lG4LlNfQEmLh
	 rARFr5frSVs7WLHNcs5h+rPRNXXNrfGkRXjcSX5qK4S14GkFnk4Kf4RgUxis4zVdX+
	 27sViKwI6iEBKGh9sy60JT3xdYWDQyZRpDM1vn2NhqXAomjHcySbGDRpH4akJEM4+e
	 jHckOiOk80bkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB412380AA7E;
	Tue,  4 Feb 2025 19:13:17 +0000 (UTC)
Subject: Re: [GIT PULL] kthreads fixes for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z6JjZMdbDoAX_AVW@pavilion.home>
References: <Z6JjZMdbDoAX_AVW@pavilion.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z6JjZMdbDoAX_AVW@pavilion.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git tags/kthreads-fixes-2025-02-04
X-PR-Tracked-Commit-Id: 1b0332a42656b798bea867631d739de023633ec6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c8c229261f14159b54b9a32f12e5fa89d88b905
Message-Id: <173869639640.112423.9639488032271923329.pr-tracker-bot@kernel.org>
Date: Tue, 04 Feb 2025 19:13:16 +0000
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 4 Feb 2025 19:58:44 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git tags/kthreads-fixes-2025-02-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c8c229261f14159b54b9a32f12e5fa89d88b905

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
