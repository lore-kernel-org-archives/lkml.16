Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC41E3DF8
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738180814; cv=none; b=tvSPVEyWh9fxAMjkBmOnii0bCXBXc3WoJp7ZC/0U3TyhvrryG7VPr5sdxdRVnoxT/TDxXy4kfhtnWBdL0kARJkAlWQ2s3MaEN7O8kAM+0o329hgQlZCA+3W95MW9hcpEY44iI16QJ5YhXEqKjTVCfMXF0WcIFrr3I4VaElwPH0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738180814; c=relaxed/simple;
	bh=Y9xOHmepnHKaNLHl5vxoRMlwDYXAT1Be7xFmIInfsTE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZQ7r+UdTz8fxi9f8X1wte8TwtLBpFlkXttlE2bWpTd6ETNYl/CqOxDAXQWwLWQ6ldaGupoK8A9x70LynB3kf4rHCMZBkYJenF1P3GBtHhqtzWACegjaqWLUMDLIEj33uTGYQykfccpMaW1WdAwCxZS9Jacv6TLmd9CRdaxT1ZqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyX/XsSx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyX/XsSx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F530C4CEE7;
	Wed, 29 Jan 2025 20:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738180814;
	bh=Y9xOHmepnHKaNLHl5vxoRMlwDYXAT1Be7xFmIInfsTE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iyX/XsSxG4n12poWbo2tWmh/0DOca1wKhdZz4TbPScZRWs9w50WIUUeI19OZ01yHo
	 Gx3B1A2V9QcqlPvL4MKcJNyShDGbhLRnGNYvlCRTy+JKbR5X8eKLRPjNUGLwjpgiTB
	 7SYMWv/xL/4M4KyvCtWqYrI2Qdid2/ZoPlkr97MHWUB2sr/fVR67AaIi6BXkT/nIaD
	 v4kRoNda1A6aRQ9vWwuRv+0fgbtNFtQjJbKLQGLnadx6OvF8WZPPSGcsqlzbpRzm7Y
	 l5o7VODPMapQTGs6Pv0uoKi2bGKUzvOwPdnmYUPD/Ecox/21z46yGoUm00rstcOa3w
	 3EQahftyLqLGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 65A78380AA67;
	Wed, 29 Jan 2025 20:00:41 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.14-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <776f5a39-c901-4565-aae6-448489d570bc@linux.ibm.com>
References: <776f5a39-c901-4565-aae6-448489d570bc@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <776f5a39-c901-4565-aae6-448489d570bc@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-2
X-PR-Tracked-Commit-Id: 17391cb2613b82f8c405570fea605af3255ff8d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aa5216a2b06594c558942d491cf71af76d34521e
Message-Id: <173818084007.411204.16541597794305494255.pr-tracker-bot@kernel.org>
Date: Wed, 29 Jan 2025 20:00:40 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, nnmlinux@linux.ibm.com, sbhat@linux.ibm.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 29 Jan 2025 19:06:18 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aa5216a2b06594c558942d491cf71af76d34521e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
