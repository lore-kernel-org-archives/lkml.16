Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED624C671
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739222868; cv=none; b=fu1CIka4P7ZqhuBQy1AK6kVd7FU+mQTucz1ElfiU0lxUPm+MmGPB6nQFTwt97zPsiVehv2mq4n/XVP1N71GI4W4RgFgsm/SWvSdc+/pI9lkpLz9yPMjB+j6D2g+z8S5nL17fdAhbZGhVeP9Tj55kL5bDjmb1X5X1EIfX6kGpye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739222868; c=relaxed/simple;
	bh=s5MWA/KSzvHvAzpKfg9uxF2a7Wa1wO5hWQ48cIfWj58=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lxE7sRy4pnfPkzRDozZwh51EggDCmpDvvUwNZLhKu8pgvtdT36fIDOwHY/I+jQSsIpamETq+0ke4ozL4P6wa/5eFgoQjgOQRtNw60RfyVzZ8Q+dxW4vGWH8oXbVnOCtiMnS4gtHktUYOdA185FKuSM04IQNrycvJD4J+kNG3cAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lkba1sJj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lkba1sJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DD1C4CEE4;
	Mon, 10 Feb 2025 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739222867;
	bh=s5MWA/KSzvHvAzpKfg9uxF2a7Wa1wO5hWQ48cIfWj58=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Lkba1sJjHc6aDNm8o9izyO/sB1BgmiYVqqPUQ+2Vgs6vxvw0Le7mZ75BU+g6n215M
	 DEs6OAqHIh9UWt+8kePDQlfHitDwwtJ1GHcc2892X9OZ3+3pTJ4iSzpDqHY8SXAIJ2
	 UlF7B3SuKHGTY3Bt+RVIY3PaCmZ4oPSNMcK43V5gso0unelI7AIGUXkgOV37eYBrPy
	 3Otx176RhkzoatVSueaUDPHFVZHJr/8h8a4O6+CQv3orPpy/Z7CxuTPpLVMjB4ishW
	 RDxju/8yReqHMFyEz289rW0emISG2hwrQaXYpV6XmhRwdZAjKkcs1vouAa9GPlnbWx
	 gqA5EVU4Ko5pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE283380AA66;
	Mon, 10 Feb 2025 21:28:17 +0000 (UTC)
Subject: Re: [GIT PULL] HID fixes for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <p38o7633-64s6-8os0-p7or-2n96o2n97qq6@xreary.bet>
References: <p38o7633-64s6-8os0-p7or-2n96o2n97qq6@xreary.bet>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <p38o7633-64s6-8os0-p7or-2n96o2n97qq6@xreary.bet>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025021001
X-PR-Tracked-Commit-Id: b051ffa2aeb2a60e092387b6fb2af1ad42f51a3c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 58c9bf3363e596d744f56616d407278ef5f97f5a
Message-Id: <173922289615.3879151.2869975147385398692.pr-tracker-bot@kernel.org>
Date: Mon, 10 Feb 2025 21:28:16 +0000
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 10 Feb 2025 09:10:11 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025021001

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/58c9bf3363e596d744f56616d407278ef5f97f5a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
