Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996AA238178
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751215195; cv=none; b=dYFe6khXABORvy8FjkwL3pPVWDF9oC4X4LhWxxnrtrZ9OkrbQJz1zcXjaRH+WbNg+vhqsUpgg+bdklf3eDlRF/Eqs2X9n4vyZc72/5owvDMK0XXN6EJREINMJA7GcuWrq0rek7H5fSP6EOO4B/xoYXloLP6wHjZRYoEyfcgaZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751215195; c=relaxed/simple;
	bh=V2jS5WLTRZpI099dHiBbufHaDKoyWY5XTQ0Hoq1hIJ4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=EVfNDTsepaRjpPkyfTNRfXCX/InePrioFhQCHP/8qHfiyL1T+UMQRHGq2IAnmoRdFVZIUsd9796OGENKjbIJoE6ateuFFu+UYvb6DGPF6bSWB5uXOLa3oOM1t4DzYKVqgDyr0b+xcY6F5U5Dv5ekJic2qkyfQ6vMfmVi759CbqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNpU1os3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNpU1os3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75775C4CEEB;
	Sun, 29 Jun 2025 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751215195;
	bh=V2jS5WLTRZpI099dHiBbufHaDKoyWY5XTQ0Hoq1hIJ4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DNpU1os3OF5shjIQIviQEVLJVhCrQXKKHvqSgms4yVD2LV3INxfDjH7Mh7eVt1zgs
	 4INHHHWU0wuVFEfkWwdFWNemnEeI6LRNFxqNobYUOnNTCS5hF42rTpJZNmLqR7/WyC
	 oHaQuKCuw0vONz7PPMlU20SnqEkyyYoDJ8Qxe+ycMDeT0GaxAg5Gmqi04gTiWgyCD8
	 A2liD7/3yuKdeR99XJln3/byAShkdo4dJrtXq0njgbOQZz1x1X2mGQHWWvDt1o7PCg
	 bRURgZ+u+UAnTSMPpu22oTbCTeMh7cHe6Hcogp12Kms32rjT9sa6D/O5nNOEkWyCVs
	 mbv3f34bSDCdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BDC38111CE;
	Sun, 29 Jun 2025 16:40:22 +0000 (UTC)
Subject: Re: [GIT PULL] locking/urgent for v6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250629084453.GAaGD9BXtjCpASAyfJ@fat_crate.local>
References: <20250629084453.GAaGD9BXtjCpASAyfJ@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250629084453.GAaGD9BXtjCpASAyfJ@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/locking_urgent_for_v6.16_rc4
X-PR-Tracked-Commit-Id: a24cc6ce1933eade12aa2b9859de0fcd2dac2c06
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 753a0f61b9091536425d656c145881b70eb402f7
Message-Id: <175121522084.2432237.5775718147863453649.pr-tracker-bot@kernel.org>
Date: Sun, 29 Jun 2025 16:40:20 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 29 Jun 2025 10:44:53 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/locking_urgent_for_v6.16_rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/753a0f61b9091536425d656c145881b70eb402f7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
