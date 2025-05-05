Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE14F17C98
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746466312; cv=none; b=eXa9k07EzOiY/yWM5TgIsdr8zDf+94I0wfcYAV2nDyhouIis2ENFu71O+eo+0Ewmj0sl0rlD73ShYjz/7heKMiT6kdqLVZoyAZxASB7FVoXclgX3Mgj9iNKVJ/JM6cAwPz7kfoNLz96Rh4FQw/HuF8RMpOAEsf+6SjSQDPPGT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746466312; c=relaxed/simple;
	bh=kdADjjFy+mNmxeZsV/v3n+fXiF9baLpep1/olt+IprM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oQrLrF1qP1NFPZqufbY3Ok1A3Raw47gV/rHfvNRSoBRjNRKbzb9K31mO3W9qwxaOUwGT7zYC8G48B5Ye3l38XZLaL5e0VG8dI+8rWwp0Zq0Px8gxSK5D+owNKCxhWr1GFEqnuymH9Gtcj64mZ560XsRjRWZg94UTwkRNMsbwIVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEVU4yZr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEVU4yZr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF0BC4CEE4;
	Mon,  5 May 2025 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746466312;
	bh=kdADjjFy+mNmxeZsV/v3n+fXiF9baLpep1/olt+IprM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IEVU4yZrXD8Nlfi+yScIuMiWZDlpwzZ7tZopYV979Eyr0PJNLh+b1FwYeIkK5Vu3R
	 PVzYDjiECT0qDxzbEGw+KGL/bQ1VdzQep8e82MsPRIQbuoWlgmcG1isclLLbbjHgcV
	 tAcuI9s4SctP4/SocIYiavjaPsPFah67idcGr9+sUHGXFD2VHgvQUnIU7B00bvL0wc
	 ub86hTZVWhq26evXKZJze1e0Udx9J28Ypu/wvjtOdFGnR2ljN3qdKLWl6raw1ekuLb
	 KnUPmlIJ85kdcedVc0cWZhSCRoicYdp2AbJR7w1TAvspWyuVMcWzhPIKH9nyrtnNas
	 1JbEdSEsuqICA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE0239D60BC;
	Mon,  5 May 2025 17:32:32 +0000 (UTC)
Subject: Re: [GIT PULL] uml 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250505081753.12266-3-johannes@sipsolutions.net>
References: <20250505081753.12266-3-johannes@sipsolutions.net>
X-PR-Tracked-List-Id: <linux-um.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250505081753.12266-3-johannes@sipsolutions.net>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-linux-6.15-rc6
X-PR-Tracked-Commit-Id: 68025adfc13e6cd15eebe2293f77659f47daf13b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 01f95500a162fca88cefab9ed64ceded5afabc12
Message-Id: <174646635166.836049.1116985620593938370.pr-tracker-bot@kernel.org>
Date: Mon, 05 May 2025 17:32:31 +0000
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  5 May 2025 10:15:32 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-linux-6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/01f95500a162fca88cefab9ed64ceded5afabc12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
