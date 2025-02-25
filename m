Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C10520E70B
	for <linux-kernel@vger.kernel.org>; Tue, 25 Feb 2025 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503578; cv=none; b=Iyf1R5lZR9kayTOK6HQ+ZZniooqaWbEqnLky+OTTWenAiyPQY3L/lNuyShCfw7T3C10hTLHQSVNMBhQ/kTFRJxtBqb2uVvfc3nRUDjuPasmyLtuBG3kDSksvRH69Nbj1kikch7VKWciyiXN3uPauCfQylY643Lq4q5lJD7e2QhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503578; c=relaxed/simple;
	bh=YjEUZwsogp1BXu+m+BGgPWuKELg/DQ7OzuV1i8GVl4I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=t1g9j2gnDlDV3NyCS9DBQ0f1VNg6GWUuRP8KsWxbTD8s/FMlgb+T0mWDp5Cuv+CZ9X84Mx2UwOuhMgsxbP2A/PH2t2ln1S+SeKQ6vxNmczqpKtUPsqLWbtdCX0ivtQgo66RmoSjTqGjvHVqn6fA9vk7Dii9JmKSFFH1zTdQpGGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnUQt0r+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnUQt0r+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92410C4CEE2;
	Tue, 25 Feb 2025 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503577;
	bh=YjEUZwsogp1BXu+m+BGgPWuKELg/DQ7OzuV1i8GVl4I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FnUQt0r+xfs9pmhrbbR3tha+iad4eITPdLohj8Vo3/L4zs48UxngSZvX5rAxiEMju
	 9UYb4HWMpNlg29SGUreQpmbR4YxqfdYfIP9m1cmDniLJAblvMwnGSH7MDf2Etxp5le
	 9/GxTFliE7dL7Nt36Q7+VF9ChsIlcX3Vw+77qDA59xKY0vYboShicOlS71d2gxVOy/
	 G6lKXfR02IFyHcVd7GXH3yPAswYMifeyfGw6awRZY6kCugUTckKlNLUBZZYd4FmHuQ
	 B30a8HiXbLTPPWCacxs32TK9phtT6oudhdQ/JZ2QAX1txRM4VVXQpNbx3qI4kyYblk
	 qO1+wlmncsOrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BF6380CEE8;
	Tue, 25 Feb 2025 17:13:30 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.14-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-179f0b99-b80c-48dd-8eab-c795872207d0@palmer-ri-x1c9a>
References: <mhng-179f0b99-b80c-48dd-8eab-c795872207d0@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-179f0b99-b80c-48dd-8eab-c795872207d0@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-rc5
X-PR-Tracked-Commit-Id: 245aece3750d3692ae7a44516c1096936bded7ab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a1944bff54907a4e68f167dcdf772b1e4c3ce6d
Message-Id: <174050360902.52791.9049622524104197339.pr-tracker-bot@kernel.org>
Date: Tue, 25 Feb 2025 17:13:29 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 24 Feb 2025 09:46:58 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a1944bff54907a4e68f167dcdf772b1e4c3ce6d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
