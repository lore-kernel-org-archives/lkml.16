Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58AC2D78A;
	Sun,  1 Jun 2025 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748793892; cv=none; b=QI7zPmZcVisAAEdssZ+HwAaGb27CyCXyFcfWsj4I/+XUTl16UTsAoqAWwn9RMofCyrv2D2Q+g+Nv65PryV/cdONEOv1OimdqbREd/PzMEMo6ajSP82P8wJ/SYPfic6+QFXWMAZ7vF8S17xt3ZcqWWtMc7TsfN7dwetDpPXJX/gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748793892; c=relaxed/simple;
	bh=REd8+0zDQNAgzAtduffv2g2avquwAQ6hy2XjZB38oHQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SvXUnDVD8HSuwIzO/nBq3M5OVBtMyB+MHok6icUPZ3s1d8gc+Ae347R0Ii6ssPHgF1mURnBPY7UAIyevAxeGTYnC1Ao4LUSRAGnxKLno9g9VumS79k0UctC9E4AOi2H134/ZQAKbKfYTX4dhH9upz9Aq2xvH7i4dvdjXhREd7jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdvJMwI3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdvJMwI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CA5C4CEE7;
	Sun,  1 Jun 2025 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748793892;
	bh=REd8+0zDQNAgzAtduffv2g2avquwAQ6hy2XjZB38oHQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cdvJMwI31DbAxd7z1vAbSyidhdlFtQitAa6ZGBK/Fx0lXUZfi6Urn/C9SVQ8DKbCk
	 EcyPh7oFc9QPHfCux1Z5Bp4+0hYVYLeQNAhaTNM7B8Q1hx6kjaQzVhgvxTUB12tdw9
	 aqKp1MEMN84fOYSEWNpqYPwtlbCrh+tjqX41Lo3GUuQwTrlq+4bVF2Rc+OBf1ji0p+
	 2OdjDMTxlDdL/ZFdizOdCYJWN0KGNsG8WsZt7H/J+Gf4sSXVf5/k6G+fmYxQuXuWfj
	 F253dGmDJTX9SvqUxUir80hTJfoOBrfnuzGNLw/wCG18SeME1Wct/SBY5mvH8qxGlS
	 ItxSbXoMzOMgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE01A380AA7C;
	Sun,  1 Jun 2025 16:05:26 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes and updates for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDv5G-QGm102O5nO@p100>
References: <aDv5G-QGm102O5nO@p100>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDv5G-QGm102O5nO@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.16-rc1
X-PR-Tracked-Commit-Id: 213205889d5ffc19cb8df06aa6778b2d4724c887
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f563ba4ac68a4dfdfb37baa24ff1a4f917e9ffe7
Message-Id: <174879392530.436212.829179203207556225.pr-tracker-bot@kernel.org>
Date: Sun, 01 Jun 2025 16:05:25 +0000
To: Helge Deller <deller@gmx.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 1 Jun 2025 08:54:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f563ba4ac68a4dfdfb37baa24ff1a4f917e9ffe7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
