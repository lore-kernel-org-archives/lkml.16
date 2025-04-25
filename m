Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A298F221D9E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745613399; cv=none; b=oMcf+oVC2jxTtsYvXA1FQYCQ7+QstcVZDX81C3Z598+LSRaLY5woNDFaQXbxUwCe1kzslhhii7AO/yMmYyItIECaLLJd9YiKwaVh9e7FEDi6tV6FyXK7d0WSsYCycYEjJPoSFLq9USM0cZhab3EvM1ohiaDD2jVlfpXZgarYCpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745613399; c=relaxed/simple;
	bh=Rzq4XA1U5ldshJH+ZeoXIXefN8TwuJz3r/HHAYi9wpo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VWs35AMJGOVOGdkgQkuZK0iIZlQ0aG8FHtUr0ud4tg1GCm/k4Oh2VXIj2PCq0+WEG6/BSHGEp+3tOzw0cCFzkJoCqgIsFJIxUCDZsGu0E9Fp9246KYFQQaY4aYubINu9nf9Ap2n01Zgoi+gjeW/hUgQg3a+srGXEuM841yYAETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzwYynDu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzwYynDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1CAC4CEE4;
	Fri, 25 Apr 2025 20:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745613399;
	bh=Rzq4XA1U5ldshJH+ZeoXIXefN8TwuJz3r/HHAYi9wpo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kzwYynDuQ88aNaoxwVqL4kE5jwpzfrmncO0Y5A5OYC7vXlQKGDLky0XnwKM5lPnEI
	 N8gpzTnUPePViXWqEGb00sNQ09u3RCGg22/mTYHdpSg3B5HCMGLisLJxjy0BoX+9yj
	 kxna7Sxxn4pnSp6ICRC5Ye1DMf7Pt1cyjgRDpZHlontDkfNUMVjCzVl2LvptxDS/kM
	 OT+56ikUC6ByUMKCIHxc4nDNyj1CdOeP8WfUXn/FBgloZdtQtp4Dumrxknr/lkdjv9
	 O8rhSk7ijnEJ4StPTMNfPuevxswxt778OMru6fZxfms9y1gw0vEpxCLzIpqTVpIPlR
	 zishIMZOASD7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2D8380CFD7;
	Fri, 25 Apr 2025 20:37:18 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.15-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-c76c6281-8851-4a75-8e4b-21762027369b@palmer-ri-x1c9>
References: <mhng-c76c6281-8851-4a75-8e4b-21762027369b@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-c76c6281-8851-4a75-8e4b-21762027369b@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc4
X-PR-Tracked-Commit-Id: 7d1d19a11cfbfd8bae1d89cc010b2cc397cd0c48
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c3137514f1f13532bec4083832e7b95b90b73abc
Message-Id: <174561343743.3832758.15145450281474649322.pr-tracker-bot@kernel.org>
Date: Fri, 25 Apr 2025 20:37:17 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 25 Apr 2025 09:58:58 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c3137514f1f13532bec4083832e7b95b90b73abc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
