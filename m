Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB13189B91
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743127166; cv=none; b=RUnDRf8P1KFGX4shnfw+ubpxNhW9lBNBlMto3vjcl8ZORa4ZAx2rmzqATh4uRlyWl43xdEq2dtvjL9VA6w6wW7BHEerStHncUfFhRCwmWd+lwEibW4fvcV1mgQe6k7yx2MAHjGNbRF0NCcCxV+69qoU2wwCk/NcFC4sj6DDb+yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743127166; c=relaxed/simple;
	bh=ZC3CkRANeR3gpGcL0mKhAIzmnq96ttYT3GFOvZO+14k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PuqOpzCXDK7ZkFrJbrfuKjtJr1+JpS7UKsLhF2JbuGWz9wXnh/d/53Rf8PJ8E3G0graEkVLIUnD+C7l3VwnQ7OTakY1kxIcecfUI5dd4HWPDBaBdVpLNoA3bLN2G9NzNckr0p9AsVnNrV2Hy7tfLMiY8+7P/inYttG0MRICVMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsqtZ21V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsqtZ21V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD0BC4CEDD;
	Fri, 28 Mar 2025 01:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743127165;
	bh=ZC3CkRANeR3gpGcL0mKhAIzmnq96ttYT3GFOvZO+14k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dsqtZ21V11TtE5SeUkUQz0+NKClzuzG5ynvqKxAkuMJPwj1Q3OxsS0MvdmeP+dGCi
	 rSxlJ/h9MmMAHoZZoglgNiZ0/mtnAJP5ULLZzrhn18LtRpSpqye6dUisT5Xq0i547E
	 9sz8yykTEBD2Tby6tWOuMifkDZb/i8414nRIgF22eTcHs/rnHnXeXTr8iDPQP2XlOm
	 Sm5LKiTeFskHNgNAzCOEtDD5cGTfxI15RdmyUS3pJERPUqV3uMHIHqZMUfpJ6liCbF
	 Z27ZUzioc/bNpGh33S97tq01gPtwC6I3SsTtfhCdi9KAVe1rPq9MnKx3AubrxfspcB
	 S9/9xRbax0cEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34228380AAEB;
	Fri, 28 Mar 2025 02:00:03 +0000 (UTC)
Subject: Re: [GIT PULL] ktest: Update for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250327125814.63968c3a@gandalf.local.home>
References: <20250327125814.63968c3a@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250327125814.63968c3a@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git ktest-v6.15
X-PR-Tracked-Commit-Id: 5a1bed232781d356f842576daacc260f0d0c8d2e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 68f090f09b7241a2f019191c5c737741f13a5c17
Message-Id: <174312720208.2314285.9764497139996694000.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 02:00:02 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, John 'Warthog9' Hawley <warthog9@kernel.org>, Ayush Jain <Ayush.jain3@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Mar 2025 12:58:14 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git ktest-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/68f090f09b7241a2f019191c5c737741f13a5c17

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
