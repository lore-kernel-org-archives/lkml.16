Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC7220E03C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750622127; cv=none; b=SEu6JbuSdI4rbiCEPgmcTnWZr2mSjimIG/IkRqcZ0CoxWrpGCPQoQol74Hgu9b4RkYRODbFIDejfSGMPH3DKd5vWaMcK3gcW9r9f5XADZI4sBIdo1nWBDA0/Ip2L1YLO4UCSInA0H6Jwm2xec5WwneJLn19/lwiypGJKhBl/XbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750622127; c=relaxed/simple;
	bh=31ha5P7yt8mSj3o1eo0os+GeIomJXlnsvwWVKtBHEdQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=X9RHIAxpJecEazqkVMfQUPfitzs8W3Ab4L6sVwImJoBJO9bem+hxk/Y3tajakyZXpfS5t/xvXhIM3MqH7BkcO62Wrl3xzc4NhEYov56obclc4jRqh31gidPlAG4QAE3uTKsDLx8fW/vumy8AhOTzMpEhBtFcMH+5PRHLMEOmy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjOEihci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjOEihci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9C8C4CEE3;
	Sun, 22 Jun 2025 19:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750622127;
	bh=31ha5P7yt8mSj3o1eo0os+GeIomJXlnsvwWVKtBHEdQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AjOEihciHNZdescRaWSeivxi4oIdocdpoHP8sYTdaAD+01qxkxfi9zw0DfMlvbnG4
	 5MnRBxFY1uAijV9q5DCaN73HyzjNGoOXzB2rr39njHopgeRUt+/fjfNmpuJYY5Qw23
	 E/brhbtGFleWJDnyC33hrVfjlY1KeNblWlPlZm6c5pbaB4Zus0Axsr85R78YaTu70W
	 DRbsgibtH2HCXHtIxEKlWGBSa9p924j13jmNnqY5pI2BVApyo7OFpUBpBR0+MOcgrG
	 8Rrr+PvCBFp3sWHFw1PP0XgloBynfmUf6QTFNf1H70qY98twl3lFDdaFwzzIbs5biL
	 n0Ih8YOvxiauw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB3139FEB77;
	Sun, 22 Jun 2025 19:55:55 +0000 (UTC)
Subject: Re: [GIT PULL] perf/urgent for v6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250622082410.GAaFe9qrdzd8fnFnMg@fat_crate.local>
References: <20250622082410.GAaFe9qrdzd8fnFnMg@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250622082410.GAaFe9qrdzd8fnFnMg@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/perf_urgent_for_v6.16_rc3
X-PR-Tracked-Commit-Id: b0823d5fbacb1c551d793cbfe7af24e0d1fa45ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 17ef32ae66b1afc9fa6dbea40eb18a13edba9c31
Message-Id: <175062215435.2132065.62039798520250365.pr-tracker-bot@kernel.org>
Date: Sun, 22 Jun 2025 19:55:54 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 22 Jun 2025 10:24:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/perf_urgent_for_v6.16_rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/17ef32ae66b1afc9fa6dbea40eb18a13edba9c31

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
