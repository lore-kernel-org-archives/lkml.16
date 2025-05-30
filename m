Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5402020B215
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748582687; cv=none; b=LKPrIpHIMLsbVcJxW7yUfyf9lC53j+ThcJiRDYGtDOrn3IZ/WnVk19iO3Ze0crhF/GPT3S4zMKBebHbfm1CFF74GGSGF6/tYlt801kEN96YyX7SvProe3EPOJSWC+S00CX2O0zqBcUbeABDWP1en3dBd9vjbcDb1pIhv6ySTChc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748582687; c=relaxed/simple;
	bh=3ixiEf3q/CdnM4E2LpDgxuvHbUuk5c9Jk7gu3E/Eqxo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gAwuMTZkGN4EqznGxutQ6pMPLeQ64PS1ObUxHmy1drszF9oZT9g1E0qt3L01GdOdwIkcKxXBdiXNBQ+XtMx0heyTtjwPSreNfZeDZkgjHB6+KS0XeBLdbHLhkW7MoT0vZYf2tU4m4u2bvi+BvA8PR0QbAj9GBMiUm0Ua+5kGDRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oj+ejfYq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oj+ejfYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27006C4CEEE;
	Fri, 30 May 2025 05:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748582687;
	bh=3ixiEf3q/CdnM4E2LpDgxuvHbUuk5c9Jk7gu3E/Eqxo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oj+ejfYqLF0sd3lpmNd7DuGLQlADU5WWPQL1Rthln86kWEGUlxB31xEh66R6bFARZ
	 xxW6hnRzVX3Tw1UnLaWmpDAKge97+dsmQ52RGgVCox7sN+21X7wMjP+8R8ZT07XUyO
	 r3uE+HD759f6UdOFP8mglNNoV2LhA5Fn+vp73stVLZ5ricgvk/wA9QbXV9UwSU0gwG
	 OHfMVUULTz4MlQl2+VAmEKJOpr67QtJlsLYCxN6yEUfB8H2+/dyA21j0knAPZHY5+p
	 2tjVX/JoiLVuUixnirI1X1B/RpY5Mfq6GReRIgPhbEnKcHydSJNNdlZQwl/BpO5pAX
	 gT3Mji9dVPEeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB01839F1DEE;
	Fri, 30 May 2025 05:25:21 +0000 (UTC)
Subject: Re: [GIT PULL] x86/sgx for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250529180352.1935517-1-dave.hansen@linux.intel.com>
References: <20250529180352.1935517-1-dave.hansen@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250529180352.1935517-1-dave.hansen@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_sgx_for_6.16-rc1
X-PR-Tracked-Commit-Id: ed16618c380c32c68c06186d0ccbb0d5e0586e59
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bbd9c366bfb2723435e82717ebbb3398f93a1f63
Message-Id: <174858272053.3833287.11419782199505864465.pr-tracker-bot@kernel.org>
Date: Fri, 30 May 2025 05:25:20 +0000
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 29 May 2025 11:03:52 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_sgx_for_6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bbd9c366bfb2723435e82717ebbb3398f93a1f63

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
