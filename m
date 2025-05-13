Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6A41F0E50
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165920; cv=none; b=BY91vGaX60OSYGzfVDOIDijTlav29E3DuWmRaPKcmybNyHBpKf6U7/p0iRDa7kqHge0sbYt32HCa140CS836IRAXJn5CpfvkLT03ZW3W4qleYtIv5dRrx5tzMDydURVXNFCaL8/bbm4j9ZhN0Xy+rucNqYWTddwv6ymw1nUSj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165920; c=relaxed/simple;
	bh=BmP4sjdlnLVzDfJQ+Xio1A2TiBwS9TDlGhBRIXPWUmw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UwbukVKJPLhD6nKxQz/CRIhlrd3Uzi2B2Pg1+UX8q4oKwVldeJydRi63Bu1R84gXEFoXFY0Ju2M8QDmXtTFkE8jIxbsnZdHRyB86IHUP882YboN/eN8Au4Nr36+0rN/j3GxCa3IrU7zgfZT5NHgfpZrDAfslbA3h2ABAvLWo8r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjiLQDBS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjiLQDBS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45209C4CEE4;
	Tue, 13 May 2025 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747165920;
	bh=BmP4sjdlnLVzDfJQ+Xio1A2TiBwS9TDlGhBRIXPWUmw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XjiLQDBSUhbBQMLr/wUzEdVBy6KdAZ4s1O0+0lt/qCbTqP73NFi4H4OP7guNVj/DR
	 o3XDpOHoA6kzEBs99uT0hKDpp0GpD8C+lxDOZGuRYo1/8kIRsiEC9It+Lk+kAhJxj5
	 zu5yd1rmsRZhsPhoEhKT8K7xsqB49CS5JdICCm60ULMU2X+ILeWD7GB5PPA2f7pYQK
	 srYtx3GokMRB75knCuvIiyjR57AgcVNgi223yjR3/ZoBYUd9bsZLd9J1KZqN08LEaA
	 dGH0B9IjdDCYtf1rbaRip8lKDtiZDvwUcBdMDeFNKvX6dUbBV0GdKsxv9miQCdzbeA
	 XtA01lY0As7iw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB14B380DBE8;
	Tue, 13 May 2025 19:52:38 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Fixes for v6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250514000144.f10ca2b6b996e10c6ff177d6@kernel.org>
References: <20250514000144.f10ca2b6b996e10c6ff177d6@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250514000144.f10ca2b6b996e10c6ff177d6@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v6.15-rc6
X-PR-Tracked-Commit-Id: fd837de3c9cb1a162c69bc1fb1f438467fe7f2f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
Message-Id: <174716595753.1774750.17717611983817031051.pr-tracker-bot@kernel.org>
Date: Tue, 13 May 2025 19:52:37 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Paul Cacheux <paulcacheux@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 14 May 2025 00:01:44 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-fixes-v6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/405e6c37c89ef0df2bfc7a988820a3df22dacb1b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
