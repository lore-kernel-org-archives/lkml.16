Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55097219A70;
	Fri,  4 Apr 2025 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786086; cv=none; b=lS/RSb5T0xPSAPYjZX4U2LFP0mZzN9TeYTxM9uYb7F1Ec358Hfpcpf+cO3PgKlVsV3RWMTuRpz7tAOnl83dNkPJU8sjyHIsSgoym5OxRZhe2y7BJ/q8g/8ao00hpoPnffVSJCJ0onuyBJZY2FvR2UB78dCn2NinqDtb/i+LqBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786086; c=relaxed/simple;
	bh=fPKF0CxXU2Uv6kLj5mDfrzpPbWjy8diOjL4HXn3bI1k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LDGlx2vFNq7dBHKqPqvowQu1zuGh+gTCqMC2d2GNIjir9pbmG8unitKRg2MefIYaEofq6bO7eg+ggNUayiKLIiEC32rq0goph1axMK8VO++/nEhHznTZvk503U5qmcLsm9VFsuqwrIJKJB3x2yzKkNbDAa4lQwA1JnM2J7R0s6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMqcUL2u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMqcUL2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E94CC4CEE8;
	Fri,  4 Apr 2025 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743786086;
	bh=fPKF0CxXU2Uv6kLj5mDfrzpPbWjy8diOjL4HXn3bI1k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cMqcUL2uqF/mD7zKF82T830ofXpIUorFSOFfzBaReUVsIb+GuhFNu3oND183czgB1
	 zD40L0e8lcm3exfpHIBkj2G5y7wY6JV03Rz/z/oVz7hJCIz/iNU/8h/Cdm7xipltLu
	 PFTBBJwTw0GMEHBdewSkRWRr7FMPJvnPM0DF+AHMMrVSi2Ww887xOxtdOj9FcRZPNy
	 LlUoEeS5tVAlxfuGR8gh2izBmjTgfPlcFeiFsjOugqbJdaCScEJkq9Kh0Duu0YehAE
	 K0Md4MqtkqIqCAqtTFvxNKU3+Gg8RnHy550zVPiU9e82UfBVev63HqGxBNZwAuEsGf
	 /c7yaiVcmdxjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 714953822D28;
	Fri,  4 Apr 2025 17:02:04 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.15-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250404173920-315358368@linux.intel.com>
References: <pdx86-pr-20250404173920-315358368@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250404173920-315358368@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-2
X-PR-Tracked-Commit-Id: 566d3a52b8f618d22664171633d7106a630f46b9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ebd68d978bb784c284c60970a6e2d36e2434a6e
Message-Id: <174378612316.3331400.8396366043102299966.pr-tracker-bot@kernel.org>
Date: Fri, 04 Apr 2025 17:02:03 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 04 Apr 2025 17:39:20 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ebd68d978bb784c284c60970a6e2d36e2434a6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
