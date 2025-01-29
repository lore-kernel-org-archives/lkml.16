Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA501E25FA
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190522; cv=none; b=ZGrSlMVtEXecVE5ZoBVB2MzQQrLrXMjTNMv2FznjPuzFNC6lhCw3PGVoY3GEIah1wWePGOVxWsBwO6n33obA0D9ql83OIaawEG9DmngFjg6VOb26Q7Vv+2lFt3VWPL3uZCMWW8+ygxcUzSutWwhKjW9QpBvpTbuQ3S+G+rmurmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190522; c=relaxed/simple;
	bh=O5xd0aM04Pn5ORS1GeEWtmZNVegDzNN1WW3AgS2iPYI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cvTe+wEFgOkYOlv8x5cXa4imVypod/enPzGo44gdw3xHXvCIe9NTy8fdY+3dct7wC5W2kfpiNcAo3++X4hxMtDa8BPaSyQez9XwJSR/4xAhwI1jaVModzpdT9nDe4HPDWwm0uhb1IMZGw2e+8G3NbzRTlRs29SMgWm9SxR6U4yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/zMZ68r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/zMZ68r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EBACC4CED1;
	Wed, 29 Jan 2025 22:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738190522;
	bh=O5xd0aM04Pn5ORS1GeEWtmZNVegDzNN1WW3AgS2iPYI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=l/zMZ68rvulAZEDyhS67qE03bw2KQmgcGHqGdgVX1TAJEjw0NCebHzy5XMideko1a
	 67wXN1ueKS9FdDNYRXtA8kBzBOsjngC4W9qt4QTmSI5M5D228EnzQS2tCvA6TYxq2c
	 QiWWlsEmb3ZjjKExR7y5MmBVBjoe3ydHlv3VVKkrHUPRtyMhwSjU8t/6UHQ15GKVDk
	 0lmvCWBVwiJhdKTx++D8Zzbc/2EYBsCZ5OqfLKKH10Vkq3rN4jFj19LRpLBmr/cya6
	 spjKBM3dbwp9fVIb1HyOAzw/6BU7ie8hXSQXKZLjSNqld6fp+cUUO9hN5tniNm7W5G
	 /vn673VEVFkwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF1F380AA66;
	Wed, 29 Jan 2025 22:42:29 +0000 (UTC)
Subject: Re: [GIT PULL]: Generic phy updates for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5p1hicGLpzHpPJi@vaman>
References: <Z5p1hicGLpzHpPJi@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5p1hicGLpzHpPJi@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-for-6.14
X-PR-Tracked-Commit-Id: af1bc0ebe743d4c72f05a95efcc1c66043332be0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f10e7fb6a06bce4f81de5fd0f2f0390f99e89e4
Message-Id: <173819054819.449381.17144775018914786354.pr-tracker-bot@kernel.org>
Date: Wed, 29 Jan 2025 22:42:28 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Jan 2025 00:07:58 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-for-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f10e7fb6a06bce4f81de5fd0f2f0390f99e89e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
