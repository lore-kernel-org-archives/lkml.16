Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BC1E25EB
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748294369; cv=none; b=pe/BQWozMagHCS6MvT9xl4mcfNyOAzoyiMnBUEp9M6TYmWUoO2lfuialvdPThKzmQPdwqStY9uKd2/hwu+KGJPv6/TehjtcUUBy6Rk5l5wpd1wsLKT8qiyAj7hLG252uT3EgNgjXIaLPOCYUDSww4fRdY2MDFjPCS1J6fvdruuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748294369; c=relaxed/simple;
	bh=K+LQg1LQttFKAs79e3Wwkg8grS3r4IoL6BsKrP6Y9QU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YTZ+uxfDxWuAuRG0aR4x6YEI1kpCrNBWGo7P8sDS5yr6/vFpaUmE8/0fzG7L0UkYY3EjFh4AnajrDHTkeNsCNtwulqVTZFWb/OFNbkUH9w0/CgpV3VTqHBiVgj5PxbvUmomAo2c5KwctMa8+BIHhAuACtKPo/bO6xwwlbtoZInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mu4hIzw1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mu4hIzw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BE5C4CEEF;
	Mon, 26 May 2025 21:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748294369;
	bh=K+LQg1LQttFKAs79e3Wwkg8grS3r4IoL6BsKrP6Y9QU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mu4hIzw1eHBa8xwTk1c3icrTS9X6jR3AhT712yGOJqaR4fQ0s9yaTdYTojOn0oxUQ
	 f70gDk/8J9Y/dPPGXJXK6vwH/MLy6K0xpPcj/lcJL6ACIo8/kecW7O/lIFqRDpBzRn
	 lpAFIRQm8ph7CLhIZHvGBJ5KazBgBeFNAaGlSqZgsiiDup3X73il/RtW4FEO12hTYm
	 9HBvDbU5O39VJAHwNfzLJGaqch0Hc2cc9Xr1/Jha2oWEUkIs1AMLhRMBd/4iUslcjY
	 NGxuYNJlregbhLiQT0Ox/71N0MFE0XpBbxHjskGcSpANjrucbLCX5RB58dGbg5ncBz
	 dd2Gtnwf/dq1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 354D0380AAE2;
	Mon, 26 May 2025 21:20:05 +0000 (UTC)
Subject: Re: [GIT PULL] erofs updates for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDPu/jffhb499L49@debian>
References: <aDPu/jffhb499L49@debian>
X-PR-Tracked-List-Id: <linux-erofs.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <aDPu/jffhb499L49@debian>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.16-rc1
X-PR-Tracked-Commit-Id: b4a29efc51461edf1a02e9da656d4480cabd24b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79b98edf918e8146047e08817e2a42937428be02
Message-Id: <174829440407.1051981.9879376881607405870.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 21:20:04 +0000
To: Gao Xiang <xiang@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Hongbo Li <lihongbo22@huawei.com>, Sheng Yong <shengyong1@xiaomi.com>, Sandeep Dhavale <dhavale@google.com>, Bo Liu <liubo03@inspur.com>, Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 12:33:02 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79b98edf918e8146047e08817e2a42937428be02

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
