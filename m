Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F9378F4C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751081270; cv=none; b=L6Pvwf+nwv4swnaKiE4yBxFhrp4YxjmdqlG9EBV3GCvlJynEt80qeAVx7aXVyph3okk0OF9qomhoBt8Ax4BgXIqGgXeufWMqNGQcNwrbI/xl4dJSS1dU/vXd148dJTzIZ/GuYyhnwRsozLVHQdglibvSdIKheL/DIawGIeOKp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751081270; c=relaxed/simple;
	bh=eyN09f6agasIjyIGn0PvrLqzYBaVsILorewmF9S/a7k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rdTXy6ESuwstTAW5qPbsjXYDP/pqcSVdgRr+hcPPFvUHNJ9C6wh0c45eLKqC/sfIpg/yw3jnwM6jYRlgwz1+U42ZEnffkNXFdjG82l7Kr+XYQ29vNIQnbNgiMt49l8hmgALDQMHXlJ/Ler6IOdUCzqzsUXm1L1pFeHekzbxF6UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8syE+jL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8syE+jL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BE7C4CEE3;
	Sat, 28 Jun 2025 03:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751081270;
	bh=eyN09f6agasIjyIGn0PvrLqzYBaVsILorewmF9S/a7k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=g8syE+jL495WtonCyadJy8AkQhXOWQHKDUpSfyhgc6EkcpSU2fE237e8nOlG0Nc9C
	 Bhdnq+bkQou5LiZozkJCW5CXUUACl3B8fEjETCiZi5pliPelAZRjRmOsxCUWiy0jAC
	 gfQ/2X6tuWDHFK+n9af0H3oxe+iP22QksnkbvgCp8xDX0Hwzt/YVoOxGw5NyjODwFe
	 MHWND29fERTJ63idJ7e5FuCphvG8bqLcWKLGvIEoZXLZVX37DIkedGf/IKtSpHBOcw
	 Qq9E0If4CYTuglAZYVwlItdiPGJ59tFzoHebkawrHAlG/26VDND3zpv//9CkklkEVa
	 XjfShesU2nZbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E6338111CE;
	Sat, 28 Jun 2025 03:28:17 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-BFF0FF2C-E730-45D5-8E5F-48D03E841EB2@palmerdabbelt-mac>
References: <mhng-BFF0FF2C-E730-45D5-8E5F-48D03E841EB2@palmerdabbelt-mac>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-BFF0FF2C-E730-45D5-8E5F-48D03E841EB2@palmerdabbelt-mac>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc4
X-PR-Tracked-Commit-Id: c5136add3f9b4c23b8bbe5f4d722c95d4cfb936e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 867b9987a30b7f68a6e9e89d3670730692222a4a
Message-Id: <175108129566.2124567.15448935827502013374.pr-tracker-bot@kernel.org>
Date: Sat, 28 Jun 2025 03:28:15 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 27 Jun 2025 12:56:49 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/867b9987a30b7f68a6e9e89d3670730692222a4a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
