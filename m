Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A77B211478
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743132367; cv=none; b=D6M0oduqZGsFATpdax6CydoAwH0tMJ3Y7SXl9vS3rXFuKIyT3eGVOAnqJKXVk0Ng12M9fYidAp4q+C9I2w6/6ngnj+TnfBO3piGe4fThdJo7G8kNhZ0CyX6DKgi4VoMjHyxUE+M1FT5RUOLRyL2E9T5dKtU39oBLVBqXcOBmkzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743132367; c=relaxed/simple;
	bh=rnfP8vqCbMABGaplMmCx0GcjL/Pxu/7rMdpg0X70dlY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lzIxmYYNz8iMSpKlG66qCPXZAdmaJM7PxBpryEIGOtzZ6luKFsQ5GMjn1Y9NVAlX2mRk6Gn6K3L4tukA5H2uJxuKIily9aM2FWWRM+i2B84O3zhS+CmM/p4sdNcxfx31JoPioYem884hUgYMPtpVGXJ32FSW2ApHAK/rm3p9p8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebJRRSHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebJRRSHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF87C4CEEB;
	Fri, 28 Mar 2025 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743132367;
	bh=rnfP8vqCbMABGaplMmCx0GcjL/Pxu/7rMdpg0X70dlY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ebJRRSHOkVmVZczP1qCxqRGJV5RCo3zXuXMGK61IcD9z3qhZsvVsEMPX0ptZYBsWK
	 FFaf3tEOX/yk0cUfeBuiJOhZAQZ2FKEA55UA8kH5Xih+dFiLEW4axxBYpBdvx9+YdG
	 lfIxpexeO6KjU6yKLsHPlvv6K87E+hQs0feSEBRN1WCHRhQnQL5WKqUIu5n5fhwqBK
	 Fq9Iv+KZclLvNxpm3+CNCYFYvCSIj420cLMWmPIbxRQSOhm6xhMRF0HtV1bN1+fowT
	 OjSFupmiiNd9xcTGnaRaR4+aeygmU51ZFSMbpJiOAP2MN/25/ZEcLUZyJ22oGtmNNh
	 S9S2jiKN3Yx1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE71380AAEB;
	Fri, 28 Mar 2025 03:26:44 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <2fff6b84-52af-4320-8c8e-9aca1c009127@linux.ibm.com>
References: <2fff6b84-52af-4320-8c8e-9aca1c009127@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <2fff6b84-52af-4320-8c8e-9aca1c009127@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-1
X-PR-Tracked-Commit-Id: 861efb8a48ee8b73ae4e8817509cd4e82fd52bc4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b667acd69e316c2ed1b47e5dcd9d093be4a843f
Message-Id: <174313240323.2338593.17266673695538541862.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 03:26:43 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, adubey@linux.ibm.com, amachhiw@linux.ibm.com, arnd@arndb.de, atrajeev@linux.ibm.com, avnish@linux.ibm.com, christophe.leroy@csgroup.eu, gautam@linux.ibm.com, gbatra@linux.ibm.com, jk@ozlabs.org, kjain@linux.ibm.com, kuba@kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, paulus@ozlabs.org, robh@kernel.org, schwab@linux-m68k.org, segher@kernel.crashing.org, sourabhjain@linux.ibm.com, tglx@linutronix.de, vaibhav@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 08:22:36 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b667acd69e316c2ed1b47e5dcd9d093be4a843f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
