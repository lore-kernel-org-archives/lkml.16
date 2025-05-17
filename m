Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156E420A5EB
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499220; cv=none; b=hEB/VIZ0pB3l1gK7Xfy0G6E3m2FmgYWwpePeBvb9TXfRP2AN5AACJG5dcgIF/O/v+UbFmMVonYveAOM/6Ewh8SNkN7adEoWnzM0KaBYetiyAAQegxlo6xY/sQr54zW8rjTIjQ8uAyZ5wnk3QWbebkW12w5UDzbzYBiGM2FaXnQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499220; c=relaxed/simple;
	bh=RBCJMPPMC6AXZ6Up3tPXQf3auXL4n2QRV/SBqVY40Xk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NBgWDsBZ/EeAvOyCvY3DcqCratNz1M6S4766GEc4I5rChbM6Q6hAP0Kj69vFFt/NodNzxDy7IKARLJx7P2EnGp2vF1/GewRlc/dBDYTdJfr76RaxrdXg8zzog3sijQ+gNExOrG6jOCc8ExnJ2p4XgNTDqM0c6YS+RIgc2wJX3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTKxGlWh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTKxGlWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDAFC4CEE3;
	Sat, 17 May 2025 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747499219;
	bh=RBCJMPPMC6AXZ6Up3tPXQf3auXL4n2QRV/SBqVY40Xk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uTKxGlWhoICopX4RbIBZjg+zO5YBpStoaqEgYIS8fsi76EbG3Y7/66cvAz5lKBfDH
	 TmiNTZ304+3TAjqpo5hOYqtJmkDHy/+3DtMdR34b8YbjiLQf128nQLGDMZFHuoqhMC
	 uopmICQYffd9hYGkcT+IufpduIDO/rKPPmuhqrbyrArEooU9NYqxwt//X4cwg85WhQ
	 ZJqCrph15f6Upy2rIu2GcPW3ZbyH2gQ7P1ZzyJpI0XBGBJRsvBxRzabBCu3CLsBoX7
	 4PmzC13mvnCrBiMUO7KNjcmWziAW/7c01ZVAdm1c/NZPuzUXjQNFnKyrBZNR17p8S/
	 q5B+THt7DOr/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C20380DBE1;
	Sat, 17 May 2025 16:27:37 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCiQ_cORMK2bGXGW@gmail.com>
References: <aCiQ_cORMK2bGXGW@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCiQ_cORMK2bGXGW@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-05-17
X-PR-Tracked-Commit-Id: 08fb624802d8786253994d8ebdbbcdaa186f04f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 205b2bd7939cc126f445ce3010af22858c18ef1f
Message-Id: <174749925608.101931.15028255581126725605.pr-tracker-bot@kernel.org>
Date: Sat, 17 May 2025 16:27:36 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 May 2025 15:37:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-05-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/205b2bd7939cc126f445ce3010af22858c18ef1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
