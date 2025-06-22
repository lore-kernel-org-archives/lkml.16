Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CED1FDE1E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750622128; cv=none; b=gJcK0iIBblPDTtwgFlacsRCGus3Lxk3EHXiEENGucFwDuBNkLK6XQtRC7i9rwIeKWGhmhHMFaArqyZgJm/Cak4TdWL6ZvGQdvYDwTbw0v4wuzSA67Eln2z74+DxrWCLx9HLNSKmKmHvYR6E6Am3spvAl8kFGHeEjeOacS0IF6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750622128; c=relaxed/simple;
	bh=QhEdZjVd9ecKizYpVsQKkPxSau1CY3uNeimZhhYF/mg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mIdBIo1I2DK2rCNGYoJPxzOFe+lZV+9aXKezIsL3HqzTrFPFlLxXTOSKihffGnrCTt94FjPSbtEVmzO/GyphlayW7kvlYLmOGwQq4ZO1sSG8WtHdCIdMf8Ao9TLN8P1HfcrfxkT4FRLY2ESV/t3oGxAaJafLRC4ehdHLIJ0LSRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/aLXZ0/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/aLXZ0/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B36C4CEF1;
	Sun, 22 Jun 2025 19:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750622128;
	bh=QhEdZjVd9ecKizYpVsQKkPxSau1CY3uNeimZhhYF/mg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=E/aLXZ0/4M0YnkUwVk2lAHcapEHcqRMtDRYSv3pzX3KiaE372qZKQ/2UbKmAcog48
	 7Qorlf7pgF4JMbS7ABRXdgSM5Cch4URGrfIGGQ3b7Xlsj7VywmhhlQbw1W0wnxZTad
	 4da7Kica8vJAzyYjFn07u108m0gqnG3PiC4L8WI26BXzdDdRQ6dZBtQahofdX8LoG0
	 iH4s8wiejYo5TtMaikxuPZtiEFnxKqwpRwp7tFg5HmJvfQvKP/rbCP6Qt3pu1HcAEv
	 jrkrSlMAdM5s9KlnkfnLuMWtuH85nXgk7iivdOv9QnF0FJtlNjOw0cdfEf8wvjvHYg
	 dm1ImrCBrsJOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A0F39FEB77;
	Sun, 22 Jun 2025 19:55:57 +0000 (UTC)
Subject: Re: [GIT PULL] x86/urgent for v6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250622084137.GAaFfBwdb_Ei3zCHN_@fat_crate.local>
References: <20250622084137.GAaFfBwdb_Ei3zCHN_@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250622084137.GAaFfBwdb_Ei3zCHN_@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_urgent_for_v6.16_rc3
X-PR-Tracked-Commit-Id: 2aebf5ee43bf0ed225a09a30cf515d9f2813b759
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c00eca95a9a20e662bd290c3ef3f2e07dfa9baa
Message-Id: <175062215582.2132065.4123475755951690195.pr-tracker-bot@kernel.org>
Date: Sun, 22 Jun 2025 19:55:55 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 22 Jun 2025 10:41:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_urgent_for_v6.16_rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c00eca95a9a20e662bd290c3ef3f2e07dfa9baa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
