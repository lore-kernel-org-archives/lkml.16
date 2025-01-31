Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61517591
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738290751; cv=none; b=swtuVYqE+uq7cU3O33ITMEECIJQk4UNqj+5250YxtJjRNSNeQxYk4FVYiKWiZNy6Rfvje2MD2ARHWwURGTeBmQD5tRHGVQbamaP3sY7oIMXPvLeb2Rw5kD80Di5sAzbGqj9+pNx2jUbAGBj3Trnl90ao/hr1Gq/3145tvfFiG/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738290751; c=relaxed/simple;
	bh=wABDeHVWymComfutt2oFV3JySJRzgDzssEeOPfSSw+Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eQsP6D0FQp1BUwZjnv1QpI286qqTgtRonPZm8afMqWtWZgPPAmcAZPK7Ftielwo04cu0f4b0KjCe54DYv9u1qYv0xU65Aun1BpiehintcSnelFtc2aW03QLoIz2KeezseVItM3ceubnxNPBIY/bQ7VSZ5tt3Yj0VJxSedb7D4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol/q+Mfl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol/q+Mfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4BAC4CED2;
	Fri, 31 Jan 2025 02:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738290751;
	bh=wABDeHVWymComfutt2oFV3JySJRzgDzssEeOPfSSw+Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ol/q+MflHGFyU0rLfjCqCneQPina4/2Zb9oyPShy2FORSqBZvEFMTDoaezGMsyTfZ
	 0p8BsIBeP74IXEBALNL3siSWvRSeB8pcpzbKC7qt/Dr1Tw/1YsZE85CFIoqej142FM
	 EIX7NXM5e92FMXayLPWmXy2+LO/yrJasY5GtKS/360g/ePjuSGr6gyEJNlEu8Bqn6t
	 lfu37I60Cj+6nTJgRASwQYdvPvlAS30S2S0gpcCEfeghq7UbufldTrBLQws+4Bxw5k
	 mu0M534b1XLazM55WxLJGqXQnNjBKVqsdoWW868tM98rcxT1uCf5n/kdD5D79j7dqS
	 kB1KlreFBtXUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE43380AA66;
	Fri, 31 Jan 2025 02:32:58 +0000 (UTC)
Subject: Re: [GIT PULL] UBI and UBIFS changes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <98948953.304331862.1738275096021.JavaMail.zimbra@nod.at>
References: <98948953.304331862.1738275096021.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <98948953.304331862.1738275096021.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.14-rc1
X-PR-Tracked-Commit-Id: 69146a8c893f734cefaac0af6f917f894f29077e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 350130afc22bd083ea18e17452dd3979c88b08ff
Message-Id: <173829077764.1153141.17167800027303105924.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 02:32:57 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Jan 2025 23:11:36 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/350130afc22bd083ea18e17452dd3979c88b08ff

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
