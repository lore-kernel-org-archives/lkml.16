Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9A2033A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 02:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743302305; cv=none; b=LdOJ+JmzC5i/JwsZIvRyst15YS5jfMJ+GbM4b1FTT/+mmf57mr3MpLrrW45vT+2VuhJJLezNxPpMXSrOQuU0jrnHzo05rEGVEiM3OELd5HcSp+m7FS2H7IqJ6dzsHEYTpw48YVljw5A2ddXnLTNMDAnmmX0U3NdzsjTU/7noGoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743302305; c=relaxed/simple;
	bh=OW1YpnBCQCPAWDhMDpl72owiE6DO66K++nIHB2UMsck=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AuZ6g4FXfMHnHcSubMlDdKM1z30H2uW0jHc80Z+COwb3kDeZakkwhtUHX2S72J5t2RHnN4kEGafBjGm1cZZgeKfAQ2ncOsGHbRxiHXn1nRzyuiAviIMIeOz+Ll0zIYo/JpVbkvvs69bl8ZtGnzX77xVafYG+x9flREzlXvKlX1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXPZACc6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXPZACc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB41C4CEE2;
	Sun, 30 Mar 2025 02:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743302305;
	bh=OW1YpnBCQCPAWDhMDpl72owiE6DO66K++nIHB2UMsck=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UXPZACc68HCbl/xz5XVA8BGPPjIcsfRmKqV1PbD43xm7wNMOZ8KlKdOYMk8iOSPMk
	 D0/N9hoYQP0uJQeGluWNPT94q30YqxAEqm9kkTFJ0YUItPz3AOalExcXQFkSKHEUBH
	 u6FHpcRWWbVd4S9bTL/CpK7YyK53b6s7Mp35vMMQXaYQeqtsD+iHFeBJfQCURDKXQa
	 yKbnOOILSOc3IHscLS8molPdVlDMsnFOMxgsN4NrFEeJo/zR1M4R2IRKhVK/HWkd1S
	 hK1VtTSQ/lGT5A8blptYBj0nN30CdTAEN0bN+irxr7FwWXCQMiDwikI6pnMFni/E1x
	 N/7bQQJLFXOvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF0E380AA7A;
	Sun, 30 Mar 2025 02:39:02 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY3nL=VjLZq_pDxQfr3m2-B78hiuJyEWhSNRU_zcjaQdKg@mail.gmail.com>
References: <CABb+yY3nL=VjLZq_pDxQfr3m2-B78hiuJyEWhSNRU_zcjaQdKg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CABb+yY3nL=VjLZq_pDxQfr3m2-B78hiuJyEWhSNRU_zcjaQdKg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.15
X-PR-Tracked-Commit-Id: 1ec12fd31ecc38e2a81a137be7eec5df51894bcc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
Message-Id: <174330234151.3338213.16025891843762658050.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 02:39:01 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 29 Mar 2025 18:57:34 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7f2ff7b6261742ed52aa973ccdf99151b7cc3a50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
