Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648102DCBF5
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 23:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748302228; cv=none; b=uSYpobZwkShOpf4b4ea7Dm3sklZzGNlBNJiNRvpUVI5Xof9BSm5TxBA82z3eXAKZvKAuhzJ0dvEmgvqQtJ6BKITYzVK8cDo+whcmQlHg9z6HDDXvxgjuFSPueJdf3+qp8t824srh5ribuep30XH48S1BBwC2AqLRBFHRfDvEfWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748302228; c=relaxed/simple;
	bh=N5CUa8ypZVGK202T5pSuu60121fD72SDFlmHZBEOizA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=I01d2ci8cIYkPw9vD37lH0hNskrMcaRJXm+hm1Sci+zfJ95l+gDwWTisEjdg9QmMutly9tCbPgulztRm+J0uZUGtLGCbX0h5T06taQqf7ezZSbmlufc0JWwkn/7+AGxCEWtLWtL5p3VgDnAahP2kKvoh0lJqqdrUkGUZ2f1/Ap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0tN42N9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0tN42N9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419BCC4CEE7;
	Mon, 26 May 2025 23:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748302228;
	bh=N5CUa8ypZVGK202T5pSuu60121fD72SDFlmHZBEOizA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q0tN42N93BF9hWGEpMAzm8kudGoAl57BKp0pGmSGB71cO9BAixqW6e4CRUE/51gvB
	 Is77A7/bL1HKv+I8VaHrL0ykPUAArfz+x/1LP/nPpUI8cWr43HvsAMR96yaovHsSxj
	 dckmsz3fCD3yiRXKO6RPXlI+EIsdvacg0w45ItY8W3CIWtyShxgu/ybG98MlEavMQu
	 wUybCOUZ44jvHDN6YmQp2yD8+EK+kr6I1/FhYaJkJm9iZa2pswt0UrZSqb0wGPiZAG
	 z4Kf4TPphheJCYubDGdW6ZHZVcnyRHCRcFD8pJr3hztjxq9zeIlMKpW6zoMDycUrIW
	 yVSG4Ivy1kMCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2813805D8E;
	Mon, 26 May 2025 23:31:03 +0000 (UTC)
Subject: Re: [GIT PULL] x86 core updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDL35MA4vH0wQ6Gb@gmail.com>
References: <aDL35MA4vH0wQ6Gb@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDL35MA4vH0wQ6Gb@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-core-2025-05-25
X-PR-Tracked-Commit-Id: 6a7c3c2606105a41dde81002c0037420bc1ddf00
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 785cdec46e9227f9433884ed3b436471e944007c
Message-Id: <174830226260.1090392.16650382099945108886.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 23:31:02 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave@sr71.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 12:58:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-core-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/785cdec46e9227f9433884ed3b436471e944007c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
