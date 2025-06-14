Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9816B1F941
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 01:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749865047; cv=none; b=ra8WFFT/EoWgGhKUuMfmBPucMgMFV8A92CSc2jTwBrEjgkFvJzZSq75eTuiys3j4WNhOeOBrQYvvDfCEY9RkbNCr4Vs0XPuIOzgyoC/nIhaA0zVJKu6XrZFiSFvN0fhw630Q1bIaIr0kVXAppNe8M5MkeDbqIQ02Cptl/YyX7ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749865047; c=relaxed/simple;
	bh=PANyOgUMpQ57aspGiqpd5eJuxrd70tbjfiIkPaHQ3T0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eN1tV5qYDsaQc/sUFtxRWo8OS8d9vhpsMY+fRp15Zp5fvw08jtg2kenxJv3t6G5kK+PlhWSJ++LYjNmKJO4MTHaFQN6yuUg+5kLu5wz4x+0LaYgkdjjvpZZZzgVwKsnkCu+6vm0CL01IybSmEfP65k2lOz6TDNKWK/hsR28vU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLXHYMnj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLXHYMnj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D66C4CEE3;
	Sat, 14 Jun 2025 01:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749865047;
	bh=PANyOgUMpQ57aspGiqpd5eJuxrd70tbjfiIkPaHQ3T0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sLXHYMnjnNyWxnWhEG0P1mQDbFLUfmq5ZVqqGkJ18DdyrtxCiLgut6hgvWcy3mwwq
	 jGl1mVtkDTpRIQzFQNLOd4hKG0CZZaL7CmrQsDVLj7ITxHScoucdNJctzkJ89xojfR
	 V7GQAhzqhD6KC6PU+dbLbebx7a3ZIilK1UDuwbuqaVmBSKheFJX6+rT2gWDePdK2aG
	 K8SbHXxmRGXkROjKov8KYnFN8ckwRnJduSOTROU2/6Gmhtz8kt9dWGu5v4TkBvVLPM
	 DQFM6TdmQZK5Ygs08TWP2T50oswtIeSJzu9xluvd7GYu4ELX20QN5u8MqQLNhB37a3
	 VNJreWjtCLvzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DDB380AAD0;
	Sat, 14 Jun 2025 01:37:58 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twFdWPhCA7-6yY27xkdnecxRJXOF5Ni8iDc9Oa5QOtukw@mail.gmail.com>
References: <CAPM=9twFdWPhCA7-6yY27xkdnecxRJXOF5Ni8iDc9Oa5QOtukw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twFdWPhCA7-6yY27xkdnecxRJXOF5Ni8iDc9Oa5QOtukw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-14
X-PR-Tracked-Commit-Id: 1364af9cb2c5716f1905113cc84ff77ddf16a22e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25294cb8a404e8116eecaf2f151ee2fd6c17fb9b
Message-Id: <174986507674.952904.9196591912805895656.pr-tracker-bot@kernel.org>
Date: Sat, 14 Jun 2025 01:37:56 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 14 Jun 2025 06:42:46 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25294cb8a404e8116eecaf2f151ee2fd6c17fb9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
