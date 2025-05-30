Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21A17A31B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748582683; cv=none; b=UXNAyGpO53YrltDRxKN++nL9u2WaE9Aoo/mmvP2oapV9Dc6tnGkGowkPy2J2v+qsrYflZ/xsprfGickQ2vJqQ/UsYnY5nbVrquS18/2XKFhZVNabtb7rUNfDKUy/xPv1z9CnEArw6ve1bRSowEuBNlalrFHYOb3rT0bX/8wBlc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748582683; c=relaxed/simple;
	bh=qkrxszcRnHzHyhcdeloIqyPPrCq4si6191FJ1aDomLU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bV90uP16UetGOW8ltD7uqZBzLW+uzfQfeIVz2fnqMP4fjUHf5PM4aNhvnyfFQcKjI2pavCpcVMUnGs+lpMSJXpqfhNhDZbi0ZIiFzVBSegMTHfz7PtB0jNStqGgRPf99pDiaYV4zA+ybHyu4hiJghihPqFBa4s6zqgoTLJCA3Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SD3aTT5I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SD3aTT5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29119C4CEE9;
	Fri, 30 May 2025 05:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748582683;
	bh=qkrxszcRnHzHyhcdeloIqyPPrCq4si6191FJ1aDomLU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SD3aTT5IIGxNAPlnW3Jis4ZhrNs3YWTA1Zt2B8wgKxcO2aW4RhRMjLYc919v3LUjP
	 t0KdzH7xbJgALFuxlSUz8pwbA5fhSbDzogkM8VgoY0kRTkz1eHZDrYd+xpN45yfPqT
	 Ibc3cB6Wz+wxjnLbx37yR+DeYR0oFihgN/hY1kf52olKqI3igNROtGjypDX8LAy7Gi
	 h6+FfYJkPsfc9/20ej3MZWCRsJ/K9l3JNFIpdp5YajutfiBEpwWHFhNenLZb6CZ9rX
	 7GfrgQNVgOluQC/DZI6XH1zUXcGo8Xfs4ZfEhaWros7TyDbY3LQbtrpw99HZoKY2TQ
	 uiuFg37cHt17g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1DF39F1DEE;
	Fri, 30 May 2025 05:25:17 +0000 (UTC)
Subject: Re: [GIT PULL] tracing/tools: Updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250528185608.1e195e94@gandalf.local.home>
References: <20250528185608.1e195e94@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250528185608.1e195e94@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-tools-v6.16
X-PR-Tracked-Commit-Id: 8020361d51eea5145402e450d91b083bccdcd874
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 472c5f736b54c476c9bfaa0258c4c07fc6ddeea4
Message-Id: <174858271648.3833287.2774382762939188122.pr-tracker-bot@kernel.org>
Date: Fri, 30 May 2025 05:25:16 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Costa Shulyupin <costa.shul@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, Tomas Glozar <tglozar@redhat.com>, John Kacur <jkacur@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 28 May 2025 18:56:08 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-tools-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/472c5f736b54c476c9bfaa0258c4c07fc6ddeea4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
