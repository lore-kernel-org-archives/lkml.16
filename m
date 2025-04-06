Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52D3218AC7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743955319; cv=none; b=OGVApFRgk1jCSAXyvW8D8r26gMrGpz5RArrykws1uPB939nG1GcQ3rLEY28ml/NkpkqJ78i6NPTFl3wlSh0c6QvrasITUfdpJvb+1WvEKco4CmhpUtf0lq4tZUZLIXR6Ajk9MyiruUOqF6nI/00J2yBpmKKE3mlMm8ZDR4JBHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743955319; c=relaxed/simple;
	bh=epkxkpMMAJLwiKLDABamciX6DYXq4ADL9brMG4mxfZM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cuzLvNiIe1dUE7CANd4YIP1CrveBIgqVFLb0HRwBCFwCWTYTgneD/Pi02akt7qpzF8jTOVJeXwhlIlUd2GGGTYTHMSdKTR2ErfLOBw+wozXsPwvyUk1UhwyMJfsrluDkUUzCewPTiKoJwvbdFiNF8By2hL9kf3JfIUxlPdTJBR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCueDb35; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCueDb35"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DE3C4CEE3;
	Sun,  6 Apr 2025 16:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743955318;
	bh=epkxkpMMAJLwiKLDABamciX6DYXq4ADL9brMG4mxfZM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hCueDb35aIbOpizN6hzQm5kVvRHUUiKVrJMWgpeOWl7WvfinWXWU0N3v0ydDVqjT8
	 85tVQPEgG941s1KkkIxeJVgGZ3DzSH75BpzuNaCCgU45wr5q8ca9bukR0ICByYr9YF
	 WW0TWxgwIeHnbnkboUXHpDxe4nCxEpdQgldDZWMskw7fwenTMYU8krLj+YzS7h6Mzx
	 K8PaZO4b5dCfBCASfkMa1fGNsZ/+jD0wmAPRpAO+xwbyXTN25100irmAPfZioQX33B
	 0MDCVKEzyZf8wIrcNk1yHWeF4zTOXp2QZrzFagNhF5jkn+UD2CfBhL9rvmJA40Ebat
	 aGSB/EPrWFI4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE1FC380AAF5;
	Sun,  6 Apr 2025 16:02:36 +0000 (UTC)
Subject: Re: [GIT pull] timers/urgent for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174393522830.2343710.9366104924015273132.tglx@xen13>
References: <174393522830.2343710.9366104924015273132.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174393522830.2343710.9366104924015273132.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-04-06
X-PR-Tracked-Commit-Id: 324a2219ba38b00ab0e53bd535782771ba9614b2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a91c49517de3445bc438d29a5bb481338817791e
Message-Id: <174395535529.3904920.9453298021971361619.pr-tracker-bot@kernel.org>
Date: Sun, 06 Apr 2025 16:02:35 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  6 Apr 2025 12:27:24 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-04-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a91c49517de3445bc438d29a5bb481338817791e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
