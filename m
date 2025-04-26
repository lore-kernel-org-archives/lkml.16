Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CDE25D919;
	Sat, 26 Apr 2025 17:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745687108; cv=none; b=fjU1MSenayQYAb+Ayts+JL7Ep6KG/KXCPdrLcQJLP4PPcLyUSSygu4iOVV87+oZ8TiLWP2WWPIdxMYGBiwmZTffV//9Kda6NbgMr74rJnh5Gj4A97vsPz9AK5RZ4RRJj22Melvdq2qmFb3XDhKHQj/woVEftd+eStbcjSdJXorU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745687108; c=relaxed/simple;
	bh=2oAqj/LWYQDAxKQEhHlUzD+MafDqPmD1Lo/MLkLkVgA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YFA634Hc6av/xd0cFldmXL731gJXoKn5XkcsJ5SblaN8VdIjI7eiwB7FeI6iGWXYvMOSJRkp1AnZB+hLourQPk/FgC4Br+aIQ+Dz1l32yYX8Lo9tLy+TP/HOPkQhLe3qz+YcfY8md92z5ZC+NfQ3FtN2M2tZq7op2hgSrpGlrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3ndKIiQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3ndKIiQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E846DC4CEEC;
	Sat, 26 Apr 2025 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745687108;
	bh=2oAqj/LWYQDAxKQEhHlUzD+MafDqPmD1Lo/MLkLkVgA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h3ndKIiQ4bjgnz4MKF4t4cMHS8o2mhuoa3mx5r3DMD26eSxeiqS3cMtLBCsSqT+ox
	 v+pksHsIsYFNbUiV3xyxo2TNR5mZD0TC/mLUozxlKBv2U8EGogotRnRZb3XNhLufG2
	 v/50qoEw+pYEMGt+Q8VUJo3v0xF99NZHmoQNyG6L6cEY8Tyo1IpTK3uc1mwW1XJ0Kz
	 Tw/0lhZ+jQQe6h5wQGZBPpJTpw02g0f2YTKE4bIV3ied419Bc+bgoJoIbXoBmo+Tws
	 9s/2JsepnvrIZYY/vExpShUBHOjytOFy5//vPKSjcP++mMM+Sb0MSwypPyQLYl16kE
	 OHb5AotePW38g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB08138111CC;
	Sat, 26 Apr 2025 17:05:47 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.15-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250426102259.1232395-1-chenhuacai@loongson.cn>
References: <20250426102259.1232395-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20250426102259.1232395-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.15-1
X-PR-Tracked-Commit-Id: 5add0dbbebd60628b55e5eb8426612dedab7311a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e742bd199092e4991b559ca63d565457b519153a
Message-Id: <174568714668.4031081.7018730487305431889.pr-tracker-bot@kernel.org>
Date: Sat, 26 Apr 2025 17:05:46 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Apr 2025 18:22:59 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e742bd199092e4991b559ca63d565457b519153a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
