Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4E74437C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745604077; cv=none; b=ji89FPbCLej2UOv6E+CV/2VTVcL7hXaxu63D5Udy2cStfLVm4BHJdLvCFt9R6aWvfIM/h0Km+sIa34uiIRjP+fnzUh0YtCE//E5U6AJthj8XJX1m79AK84gIFQPiJwzqVF5VF4NdvGVnXtjoCsitPUdNTOECRNHZsvXXGhO/ulU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745604077; c=relaxed/simple;
	bh=l9l0F/UrIHUi6wfIdhCD2O82TOlPoDwaIgADTH0vFSo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M+u0z2niS2t5c5VHMWNmC+a5xGJXo39dMODzVMkZLDAjhBLIuPY+Dw5UnNZOGSCmcohpgWQmt6+jXrWxMRBBCmIa6cRA5iQxn/gfaueVvnVgOTRUNV8s732zdGRCybyNBclHH0PHhe+Rk5pqyeeKaRqfqWiqnFmlqz7xQXFDZ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmQm/EgT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmQm/EgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AB5C4CEE9;
	Fri, 25 Apr 2025 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745604077;
	bh=l9l0F/UrIHUi6wfIdhCD2O82TOlPoDwaIgADTH0vFSo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UmQm/EgTbP8RqlR2eYgUqymn2/sYrXYXmdR65OnCQsISE0sV8oeOJ9my3EsU1JKgw
	 uYecAZRI8aMMEmMKgSLnt8lWU3vogKy/hYn+G8SK6ERShZq2l+rfJV+cuxfsOuhLrx
	 3y/ZDVKhsFC35AaNID9q870Yx0klOBYDNgJtbuI+3UuvRQg82mxuwgTLAWigTvlRFj
	 9aiRiJwPCFsI9xbpcbmnI+BkZsg2A7pK4c05t+OfxXZ75DqM491EOfldF3xiFvr9Jz
	 NfrMUNaRVLbwCLqWXlYD+EmL+gMMYMfSbRxq7pZFTFBC3+IzSc41qlXrLMDzWmyNBd
	 e4Bi6XfiZZQVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 712F6380CFD7;
	Fri, 25 Apr 2025 18:01:57 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 6.15-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAuSi9YCYEN46yXf@kroah.com>
References: <aAuSi9YCYEN46yXf@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAuSi9YCYEN46yXf@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.15-rc4
X-PR-Tracked-Commit-Id: b9792abb76ae1649080b8d48092c52e24c7bbdc2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3ae7f5093e4f10fd3fa4666b89509a9895e290e2
Message-Id: <174560411613.3790119.11724331085583387615.pr-tracker-bot@kernel.org>
Date: Fri, 25 Apr 2025 18:01:56 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 25 Apr 2025 15:47:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.15-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3ae7f5093e4f10fd3fa4666b89509a9895e290e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
