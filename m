Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2081CA84
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738372826; cv=none; b=SIf0+aljxYz+2E1WnwdPZzeXJ5Vm6Rn6R6mWCUH3P3Yzn3FpapKAz+PvXzX3IfXqtZLO0TDv2VUXOZh6DF5PAKa5xWJUPSiM8R9f0nRDp+kVMZnmtRLoRTj9M+H1F4ogyM8jPzlZUTkNlKFXU75lcx2g/zhOqAt4sdxdxu0JJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738372826; c=relaxed/simple;
	bh=NXgDPJZdQekbNQeOIUHV73YrU86x4U5bFf5xBK8Fzmw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Pe0GLx2uMAEQV8EPxZ7tZ/LY8lnJIj4AabqfGxeMd44TR2oKagR46RQgz5U0HrU50e+urmO1/zRaXnLQ1AzhxRXHKk5UWULjHFW0fm7pw9ECvlTlwxOjlMq7QVX6JYwTPTPHUUnHckC6THOe3JFGcNsxDKvizJ3A6Q8C6WULEzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VB49wPQE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VB49wPQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA34C4CED1;
	Sat,  1 Feb 2025 01:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738372825;
	bh=NXgDPJZdQekbNQeOIUHV73YrU86x4U5bFf5xBK8Fzmw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VB49wPQEG0mp82NKD+dDd5lNwE/uU0F++4nB/BuqnYdwKMCX+S/sSxmyNCZiP5g0Y
	 7M00+IJcARXOJctuBLk1kS0vVn79zyEFErcI/vBAhxkmM+6hCndsAl/ZilvN1wvTIK
	 2dNQq/MA5zibRy1+lLqHazb1GjK+waGF+NuTE8njhX+LLzJ8lL3SGZHIhW4JDKKkcY
	 bpnR4iLzROy1/ESPqvCPtII74zhz1V/rh7vsS0hm54f7dpeJlVyomo+0eEiBIVUZEy
	 xNkkE3u3R1GG6FGSu17uLKZPVDLSoUS0I1UsCOeI1JnaQV2BTmF7tHnvNZ3ACG41Jy
	 /pfdkMjWQbx5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7125D380AA7D;
	Sat,  1 Feb 2025 01:20:53 +0000 (UTC)
Subject: Re: [GIT PULL] hardening updates for v6.14-rc1 (fix1)
From: pr-tracker-bot@kernel.org
In-Reply-To: <202501311331.B5B6D45@keescook>
References: <202501311331.B5B6D45@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202501311331.B5B6D45@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.14-rc1-fix1
X-PR-Tracked-Commit-Id: dce4aab8441d285b9a78b33753e0bf583c1320ee
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 73512f2a0b5c0531a9882e459ee3cd99396478b8
Message-Id: <173837285208.1781434.4793191732543969414.pr-tracker-bot@kernel.org>
Date: Sat, 01 Feb 2025 01:20:52 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>, Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jan 2025 13:38:58 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.14-rc1-fix1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/73512f2a0b5c0531a9882e459ee3cd99396478b8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
