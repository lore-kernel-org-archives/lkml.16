Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D461624FE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748392201; cv=none; b=na274VPnQatceO7DdlU3snUKKvTIw1A/Enp4fgt71azGkihH7IDLfRBb8uwJ01OimW7JYyh7CeEd4IZ3jj4C6ZPsIPVUw2v431tbvhdKRXZ1GN27DqzgXdRDp1vNmTfZMEtiacoi6CR5H3GcOPZMZhN+uhWz3l8sASEU4TJN9Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748392201; c=relaxed/simple;
	bh=IvcGAhjhityj059H/fy91SvEKaTqOQ+POEHivVkXffA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JgEWCpEuRZ0/3rbHFp5Iq8K+JQfe++VvCqlxhDAJMmMX+1azwyUU5nUTRt6nCOIoHxSVtVs5E6Xi+CJz109TrDDYWenu8+/gQDkfXhbD+FP8gFgA3M++JAUvk4jEFhrJkQ0Wcm7aMj7ob9zcGMFE1sDmOw3AkliD9skxemOaqGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRBkOxCc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRBkOxCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BFEC4CEEE;
	Wed, 28 May 2025 00:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748392201;
	bh=IvcGAhjhityj059H/fy91SvEKaTqOQ+POEHivVkXffA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VRBkOxCc+9s3tVRB1DBGgEcbJa3Qnk6Bq+tTeHvDhAb5MaOwBi9uaJkk0qz2g5fge
	 OVxfhEPjzzMlTHoX9jWdiUofufwKTAhBnYBWExqSckl689H0iumheTrD/nSQydqIOQ
	 EV+b3SsvG7wlWDWDSroE1JS7LayHGqAb0/bMxbTq6D4kVouR+/d5KiFeBbrSyLRkad
	 xp85KjJbRSHfuiwmDj7AKP6nPUiJV3SOcgU1xh+2Vl74Cl912JtDX3kFQ2LiXXpg8D
	 lxWm5KEl8akoy7YcKll2ucBZ2ibA8eiMjqskYgpwE2R6pQE5QdERY/Zi2N9GJRKcfJ
	 3YgBSLDNaoL3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC35739F1DE2;
	Wed, 28 May 2025 00:30:36 +0000 (UTC)
Subject: Re: [GIT PULL] regmap updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <4d6be2993d367094dcf8e574ee49b317.broonie@kernel.org>
References: <4d6be2993d367094dcf8e574ee49b317.broonie@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <4d6be2993d367094dcf8e574ee49b317.broonie@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v6.16
X-PR-Tracked-Commit-Id: 1c12fbdf40e17df2efc24bf2009a0c3bfa75bfa7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c971f11dbf1bff3d1226b92015302326c7c292c3
Message-Id: <174839223619.1837144.536068555112214402.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 00:30:36 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 11:29:47 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c971f11dbf1bff3d1226b92015302326c7c292c3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
