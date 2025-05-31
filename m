Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BB323E330
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705411; cv=none; b=RLAsNHTDNh7mWRmxFIFFxdMDnRp59aZrwEU+pXr0HDIF0B0kx9UdkFI6xds8l3Rck3wFktas5HGUclVWcPgALIBCyyM/5MhQcFo0raa7tEhOVYw2Q86J4R65dAYYRDjIeA9+FVQQ+RR0NfUdfBdTgs7+NFfp+4GrejJghTrCb3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705411; c=relaxed/simple;
	bh=8WIVGSreGVenL0bh0jXMVo9HrtbPl5Nlrt4rMb9d1TY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TnSGrXX+JoWtqJlBhsPQVlsBSBsWqLffMdR7rut1MQIu7z4dB4oOPXNFWf/c6ipODwpuD4lkNBjtKNXrKXLMSdwTgnTgrzCr/rc81+LFfr+zFung5+aWxhhqMCthla+9GFK0HANQLsEqGCB+iQUBdL9jH9rACN2HCZxTS5uHssI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYQHXFBi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYQHXFBi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4496CC4CEE3;
	Sat, 31 May 2025 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705411;
	bh=8WIVGSreGVenL0bh0jXMVo9HrtbPl5Nlrt4rMb9d1TY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZYQHXFBis5MrCEFvmspre2o1A/Wr1MlyK+yKuLroLE/GyZm7aDRSa+yziMTA4KCvO
	 CWeY997jWXmdviOKS2uciZ9Enfi0I1olM9R/S5O/gSPcyvRsD6NWwecirbL+Jh83sC
	 ICPNJXjS0PZB46Vwt8SuQ7tFlwknPC2tpaWUdLtEjqDG3EEuYhWy1dOS2pjInXVqy+
	 b3kIcntxkXM09oVRaUNgDf4swtgsTMzZXaDXddwh0UeHBxyPPNUU3nM3TQ9WqhO46j
	 +wGk4GTSMhePYqO+nvpxvthw0URGJrk6W6kyqbNtAGEg16jUurh/lCO3lss18vZzxx
	 WBpRcIBojihRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE04A380AA70;
	Sat, 31 May 2025 15:30:45 +0000 (UTC)
Subject: Re: [GIT PULL] arch/microblaze patches for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <379179de-2d0f-4a0a-9534-46b10d254e40@monstr.eu>
References: <379179de-2d0f-4a0a-9534-46b10d254e40@monstr.eu>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <379179de-2d0f-4a0a-9534-46b10d254e40@monstr.eu>
X-PR-Tracked-Remote: git://git.monstr.eu/linux-2.6-microblaze.git tags/microblaze-v6.16
X-PR-Tracked-Commit-Id: 52b70e5b605c38996b74788a140702e69f34d2e1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 03ebff0c837b3636f0a33901e9b2cd66a13f5f3b
Message-Id: <174870544425.163157.17780236236108380821.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:44 +0000
To: Michal Simek <monstr@monstr.eu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 30 May 2025 08:10:25 +0200:

> git://git.monstr.eu/linux-2.6-microblaze.git tags/microblaze-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/03ebff0c837b3636f0a33901e9b2cd66a13f5f3b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
