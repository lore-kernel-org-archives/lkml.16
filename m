Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E50A2367A3
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626128; cv=none; b=QD3d6mwADA4S3iu7745fi3TE4igkxPlfjkoi9ZLcLfWHbQGeWd94vQ3fVLzWXEoL5Mi+NB5L+CP/F6/1Q8+rs5aV463LdJaE6AMjulARcQvJ4SKqM/bW+Jup8viBfiSYEKSa7GZByguqt7iEufHB+zTQdT6pYePkpe4ZWcucZB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626128; c=relaxed/simple;
	bh=CJv8XeOaSKZzbDemQJTWvxURny5ID3w1oNu4bbHZXW4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dVdY0kzjyzXeaDddReERXVKvQJBa8E7FEbZZNXzuoyI+02yRl771aRnOLFP4NA2XqAkuAXVT92Y5Ua9QcV8yGBDb1h5ezvK8Pk/Z/yvkqCd40zu3K8Z7cVPWAC877JdvbwjC3616UEmmQACJcDxqrnlssALoeiFoYgjzHxwfPVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfEtLLet; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfEtLLet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BE3C4CEE9;
	Fri, 30 May 2025 17:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748626127;
	bh=CJv8XeOaSKZzbDemQJTWvxURny5ID3w1oNu4bbHZXW4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pfEtLLetyNELDcHHLdNITaCvubl6PlNBeheb1Uao6S2/VqLEJE4zmN9Vre7WU0G0u
	 EFzU94T2UTG3utPFAxrl+i6zeBR8lP3jYgJbFxMoksKrv6KvhSDCjQt1Q6p4aZwe98
	 PQpeLpeqfWwMAhHR8jo2SCr/FrBPzoeuvVxuhf5+KS+QOY7uLw17KqguJr0HdidcU+
	 fg7gfzbamf2D8Ugp22K/nIa/I7eiLJLCF39ubsW9JugiKM0sQ195nFoUpjSdDT2OJT
	 f5ESLNx4/2FjLbEaQ2pamj32CaKyLN4wunoxpjkdLs1eHKa25H483KoYNVaE0NuaXo
	 2zxaZFbPQ8Pag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E0439F1DF2;
	Fri, 30 May 2025 17:29:22 +0000 (UTC)
Subject: Re: [GIT PULL] f2fs update for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDjQtZy0oknTlgmG@google.com>
References: <aDjQtZy0oknTlgmG@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDjQtZy0oknTlgmG@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.16-rc1
X-PR-Tracked-Commit-Id: 9883494c45a13dc88d27dde4f988c04823b42a2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d8441523f21375b11a4593a2d89942b407bcb44f
Message-Id: <174862616107.4033976.5337363842507357181.pr-tracker-bot@kernel.org>
Date: Fri, 30 May 2025 17:29:21 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 29 May 2025 21:25:09 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d8441523f21375b11a4593a2d89942b407bcb44f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
