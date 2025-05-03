Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B1D1553A3
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 23:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746316581; cv=none; b=vEiRTwYSX2jOe3IztRMACsJhpG/zFsIVB8Hbbz1VUMl2bw+oe0ChOKJ5duNyWdrd/txw3FJTR2s2GVwvHWGponAVD+OP4PIDlzdWvyevV1sUCM+umgz4cpxmFwDbH8CEejRwurLBW1g7tN4xPyrCpsjKzprtPUydKvo3haFsDGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746316581; c=relaxed/simple;
	bh=NsbQ28AQYUMxdmDbRR+S3Im5XcudWRmv5nObzP+tmEY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ui+JH9vb+JfUscLw8QCFxI8WlkCzoXF2ohgFBzyqgZrQ4hrlKRfAKI9TagNo03ZWuF83IT974F8qtxuLgqrBT404m2/KNZWi92PaQUJv9Xs+7JmiuGf+oImue8eM9ZBq8NKgej+26VJkcSBakG4qI0s16617McOoeZGcbQB3aoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXTsGSMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXTsGSMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EA6C4CEE3;
	Sat,  3 May 2025 23:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746316581;
	bh=NsbQ28AQYUMxdmDbRR+S3Im5XcudWRmv5nObzP+tmEY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JXTsGSMWW75mWdsuVEvAt0GxIZxRodsruwZDIQ15EJdJvSk22x8gHuqVlAnqEJnvI
	 MMZEDsC/M43+UNWVY5imerpoVfZGWaA1qltxm5o9REUidDv2Fm2+o1BMx2SCI1xdew
	 GKX+8f60jD657bTQ/eMXouT9PP0G4lAe0P40r0keiHZzkB/RT3nFErmA7Mna0SIDSS
	 xAO2xpzTw89vVXIWFF2BIgcXX/8tJHPcDKkjMZk7OpMkGKw/gLN7FeLssAQY1ZBXRh
	 ZFFu8GIceOOxnQjMxD5px2h4pxufE+5LBJqgquAx7IB4rEg8uax5yHrZshjFso0O53
	 C1VZ1wVqA+YGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFF8380DBE9;
	Sat,  3 May 2025 23:57:00 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250503230151.2578203-1-cmarinas@kernel.org>
References: <20250503230151.2578203-1-cmarinas@kernel.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250503230151.2578203-1-cmarinas@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: fee4d171451c1ad9e8aaf65fc0ab7d143a33bd72
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
Message-Id: <174631661940.3942549.18022262367009295112.pr-tracker-bot@kernel.org>
Date: Sat, 03 May 2025 23:56:59 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  4 May 2025 00:01:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e8ab83e34bdc458b5cd77f201e4ed04807978fb1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
