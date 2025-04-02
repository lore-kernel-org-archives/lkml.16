Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B4F19E826
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625779; cv=none; b=BgI2Muqf3ToqNEkJgrhsVEwRsFEPfdSiBy+sq/95TSpq4CopMjnFsthr7mvok+2J2/WJxaAgKHPxE70R21CeDUBkvv4bCd9FrhLXpUETWV6+ffCWn47gjVSyGgtqTFP89BksYNcmKwhyprpUaE9fOkU3kordEtCEJ60rGmqF3eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625779; c=relaxed/simple;
	bh=sGiYg3z/tFgNP8/WeX2yozEZiRzk47zD4QucahjSTzs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FZn20G843B9ijQ90aJh+8vai8GTPK3KChDyPQLe6B1G89gXHnI8EXp0twQqu1wbsPmV9nUAq8/kKOZnR6331eGBjedCgeTOxGxEdB2gw9ttFQIRmmaWRgKqSs+nAnBDVVHxTc/PMVzg56Bb9wmVRD7KZ+cprf2BgJA1+y5noSCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnZkSB/7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnZkSB/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1851AC4CEDD;
	Wed,  2 Apr 2025 20:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743625779;
	bh=sGiYg3z/tFgNP8/WeX2yozEZiRzk47zD4QucahjSTzs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZnZkSB/74Ls5R4iJsmRMHuLbE92jjVw+CBPZqqRaNyHF1nCVgqv43Nf4/samwkh35
	 fJ5bxCzgK2LNh+mVebmnygkw4l3hYrXIQ5dER0EabI92wJLNORI9YMTHAo35sU/wZ2
	 gPISmu0Bzt2jpHp445UKvl+8N/QtOVyQeGpb2/Ars7TFpLq84EF27llsAp9AyTU9QX
	 9UE4jhNhy8hVP9CSnWF+ficX3SoLMRHhFMvUunLpnYs1FMk6Tku9E/n+hBGOrS3IPp
	 xjd6oo2E80WhnITklYXR55NxiF0ah/1Svts/ykQ2P2pK0M2cKnKovAwzXIO2CHYvSy
	 vmQPPqldS1YWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34412380665A;
	Wed,  2 Apr 2025 20:30:17 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zfgyivld.fsf@mpe.ellerman.id.au>
References: <87zfgyivld.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87zfgyivld.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-2
X-PR-Tracked-Commit-Id: 892c4e465c360d07f529bc3668fde7cbd4ea6b32
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a87d6bb6fd274cde3bf217a821153714374198f
Message-Id: <174362581579.1664588.10759501812226685205.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 20:30:15 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, naveen@kernel.org, npiggin@gmail.com, ajd@linux.ibm.com, christophe.leroy@csgroup.eu, fbarrat@linux.ibm.com, linux-kernel@vger.kernel.org, martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 02 Apr 2025 23:41:50 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a87d6bb6fd274cde3bf217a821153714374198f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
