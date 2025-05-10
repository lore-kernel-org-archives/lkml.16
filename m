Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381BC248F70;
	Sat, 10 May 2025 16:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746894503; cv=none; b=g09G27dtXQ6fy85miLdDBDmbiBz7t8sp5qgTxgCQdfXzMchNB9DSl//TP9VlTfCbKKaC4sCzB9qBn1JeixVYOFhLL7Z+QN/6Zq45QT4AExHlSF/K9P8d8eIpYahi1DuokmfHQ87BMA/70BX/1Cs4hEA2HuzNZ0rDW1QTluGqSD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746894503; c=relaxed/simple;
	bh=TrRptewLPqNhyP1j3J06G3w44PnJgDo8YWj9Vta6S6M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oQDC+fLhwd4Bb4ho32zf/hs2sG2W49RMfR5ry+LH7XfBjjybCC3za8lZ3ubdP1W5PGFVR5EFlz04Q86jj+xTq6hFWs2/uviSauBUhP/PzpndJ6Oe9lMPRaKP5Ohcx6vrK6fvNH2uSFtdHlxGg4A6Z32qJAJ8K0gz7qvyQORZaNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cthBKlYM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cthBKlYM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3BDC4CEE2;
	Sat, 10 May 2025 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746894502;
	bh=TrRptewLPqNhyP1j3J06G3w44PnJgDo8YWj9Vta6S6M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cthBKlYMko07OGW5engMdKhDKPJVy6L/KTdRspoiVhMzfum+NCw92qCaNOXGHDCl3
	 qrN1T/LG8MmklYaca/a3CSVqVXYRfuABfCiMbIdMPNdTpmJOD9YncnV1XgdfeK+a2E
	 rDTNlBUk4EELDuEK9twisy+CZ6E1fOF+cQnQStdIFTcG4EUmr3DdUeU+hosxs2leRB
	 UzJHATTxcttN/dhCfaTfaICfdXNty5VSU8+tbUC9eBUcutq8WPiPU/OTmfVIMRjNsw
	 oZHqVF6I/XcjDEfzKvv525yDLtit1pv2dnz0O88hK8fXt1hfWJL+HkxAiYoTw0zpTU
	 HYM4oNgvr4z7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ADD3822D42;
	Sat, 10 May 2025 16:29:02 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aB9aZjUU3BShkFyd@kroah.com>
References: <aB9aZjUU3BShkFyd@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <aB9aZjUU3BShkFyd@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.15-rc6
X-PR-Tracked-Commit-Id: c6e8d85fafa7193613db37da29c0e8d6e2515b13
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 067dd5875d9cdc86c8db6671c695be4f72692196
Message-Id: <174689454079.4001425.6247198798243308382.pr-tracker-bot@kernel.org>
Date: Sat, 10 May 2025 16:29:00 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 May 2025 15:53:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/067dd5875d9cdc86c8db6671c695be4f72692196

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
