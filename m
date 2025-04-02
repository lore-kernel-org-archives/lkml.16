Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C6C1C7009
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743616072; cv=none; b=d+8AEeFvxrIQBfAqQF2JK22POK0Yx3UDf7P8mY9xSWUJL8HHMyiXwNCjplKikbUmEs/XM4QAaGBpd2vQq72y1IBt52Q/KPmAZCI47FYOaL7g8ZCEgvS92uYR4K962Wm9+yBNcECOdOoOgMypWLxBYsjg4/5hMRZxLdFtXD7t3CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743616072; c=relaxed/simple;
	bh=flLWv8/ciXvp8xuYDt8RX2w6aZ7Q6GUJUqaZWArWix0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pSrgkqd7Cr3Gc1LfmKbX+nUlSkUpCePfVQNKX2WF9EIqBgVI9l5WRV7/9vcn0wfjacPbxBaPOsgKhTld7UlJvga3/EKRsj/wpoxGgxfND32esZpgOIoaidQb56vpu7AdzLhvqhrQqlFqqxjdeR7+fI2ILP11p2tnkdNOzTU+pzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHdwYXkF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHdwYXkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B4BC4CEDD;
	Wed,  2 Apr 2025 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743616071;
	bh=flLWv8/ciXvp8xuYDt8RX2w6aZ7Q6GUJUqaZWArWix0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WHdwYXkF8HFWmtHkdyFgnHF0LlvcGaxVCMyHxQA5kdjm2a2z+lDp0AXDC8/hanHH3
	 71SGbkz6V94k6RXOsRVB+rvZHX6/mpKGxrAWGdYY+m5uRa+y+IKxpTtRum5F/x/otb
	 6omikJXydOpSxx8872sK9SvBbt1KDdu36eKShOKM8ILF7vSfTYvTuZ39WibW3lNNCF
	 gm6fjm4C/QsNRZkqC3dBTLdbJnDSsZufOup709DaSib46nCNntf77KEdp8UJfMuGnP
	 Tr0y7LRVPvonUyE+0npi9jh2Md+GLHZ2lRtcGHRwT1tJQaXoMcGXtTdmd3mMGCkH8g
	 sQMDmU/eoNsTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB056380DBDE;
	Wed,  2 Apr 2025 17:48:29 +0000 (UTC)
Subject: Re: [GIT PULL] objtool fixes and updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-cSQXJKMyBSfAAc@gmail.com>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-cSQXJKMyBSfAAc@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-03-28
X-PR-Tracked-Commit-Id: ae958b12940bcd4ffa32c44684e4f2878bc5e140
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55c78035a1a8dfb05f1472018ce2a651701adb7d
Message-Id: <174361610861.1617726.13227313749369813988.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 17:48:28 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 22:18:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-03-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55c78035a1a8dfb05f1472018ce2a651701adb7d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
