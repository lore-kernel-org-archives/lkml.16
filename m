Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5841401B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750380782; cv=none; b=dWOQrg91nzEkoTflDmhsVfrmOQnKvKM4+vgkWYDsaTuOnWMYf8gwsbwvj/kemwSszxkxtWsfK9cmyLQ8aofgdqzlbhni9YC/Lk0jbZtdvmNhbPCYu3DIFVRG37Aq35KCWbVqkcTf8rkh6VKyoEzu+po7mTh8GQ0Ttg7VGDCzQo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750380782; c=relaxed/simple;
	bh=KMV3dW8HC38d5i9agGuE+KaXNI2HOuqRwF2chf2+njU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fJvmkmS885OGt3foZQfR/6bVd5XYO2u8vpKZ5DR2g+/RJ6MgdzGQKo0TpCzdE3ix2u6Ge3LYmWxeFYSb1UH3HRGalNNtKf1Ti/1E0YhArmrpFumy9E6xmEVIEA309QpO/8IZQEjri2SZ23DKXCVikiiBmcyhKP3zgqE0wQ3iSpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfGy/5yJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfGy/5yJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBBCC4CEEA;
	Fri, 20 Jun 2025 00:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750380782;
	bh=KMV3dW8HC38d5i9agGuE+KaXNI2HOuqRwF2chf2+njU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CfGy/5yJ9HANgI74J5/Nkuly/ZApaeGyY+FulMjRapaTl3JxF59kPlJKjlpV8V9h0
	 zXu1iSIU1VxOYMcPSQ1BZvO8uw6+uB/IH3SOoQ7UlZq7G2uhfKS4QPhpu2gcOvHOIC
	 oD5zwdoqofwNl4aBzfhFHT1lT1UcmaxfNaGWxaRSogKXMwhl1yVdD+2Tn6FaKTOK67
	 FVyi150XpC2+op9HGCIeIGQ4suzInRqD1lI8JIIC1RcVZ7gYD29WvXzb6g4ycwlmT9
	 2YVmP5L3qddyicVGqtLbseVzguIkPn+EMc7oBBOZETLpyhkQ3o2fqioaV6wsaSXxFO
	 VECsT8YjO75Mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BF438111DD;
	Fri, 20 Jun 2025 00:53:31 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v6.16-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <dad88a06b17b2b7e6c0146ab9292cb18.broonie@kernel.org>
References: <dad88a06b17b2b7e6c0146ab9292cb18.broonie@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <dad88a06b17b2b7e6c0146ab9292cb18.broonie@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-rc2
X-PR-Tracked-Commit-Id: 8acfb165a492251a08a22a4fa6497a131e8c2609
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e0990236bbdc96440bfc4a5b24b5dd811fd2210d
Message-Id: <175038081008.1034889.6592649481514103216.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jun 2025 00:53:30 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 20 Jun 2025 00:37:19 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e0990236bbdc96440bfc4a5b24b5dd811fd2210d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
