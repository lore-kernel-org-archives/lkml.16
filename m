Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37041F1521;
	Wed,  2 Apr 2025 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625781; cv=none; b=tGJU7ZXNnTK7TtNIN3ANCzserv7RLsG9yENaLvlqtacoEZEMhFU072AoWq70ZB4DWY03SJZnsxqWcs2V2UUPtEhgFn0A3Zb6i+KWkhEZafCVeuJJHLC0bnmdq3dKhaUNVIsk5AczoPWoUSQIM0gDmWsxWLV+ZCVEyzN0j2u4YnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625781; c=relaxed/simple;
	bh=2xZiyApAQj6FWAXDa4C0e8IhwZeJzDAPI4MOaonkTI4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=t2Mu5nWpHA78Yy3IRICPpfrOVoal+L4et1uugjvcIvg6+xwQDCav/0cuF1GJ+raE9G1gdRrCDg8FLP5IdtzTgQQRzT15lsNQKK0Jz91hXH/WXC5AihGF8acI19OWPOaYuGlwUVSaxC0dWqEtEOocdD7N2n60ZiE1Bchg1e0q46U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aD3dbwl8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aD3dbwl8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17988C4CEDD;
	Wed,  2 Apr 2025 20:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743625781;
	bh=2xZiyApAQj6FWAXDa4C0e8IhwZeJzDAPI4MOaonkTI4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aD3dbwl89hO72bt86xs4Sa2+fmcv60TxKJK9AcnTIrWeMzQZB1ChJyMuLSu/dXS7O
	 MCjHWMemL7GWkj+wWagcRcGTt+E+aJzoYEyxF7B9Ceihfe3SfBdJDWv361uFS8DtdM
	 hsLaU2Hwy4E9ZTUz/iiG1rz66Mtzd4lyFMVdwQBU28joDj5qmC2u74+W5GXQBNoBp3
	 Fsg3/4dwjkGw8WF8FH44c2t6u0/6A84lZCuXBoFBua34TJ13owGC8cPboTdJ/351d8
	 yrBPqn9YJtSkh0H/vTYNu92cvILT3m/e9LyzIbRiHc12Xweo+XmEuZtAbsLzj9z2w+
	 sC3ZtH8nIyqpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 341AD380665A;
	Wed,  2 Apr 2025 20:30:19 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch changes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250401121945.3814892-1-chenhuacai@loongson.cn>
References: <20250401121945.3814892-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20250401121945.3814892-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-6.15
X-PR-Tracked-Commit-Id: 17ba839c3c6c95562f329340e67da432309dd0d4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c241cba196decd73b6959e851bfb71d0a1c1767
Message-Id: <174362581767.1664588.3464451912801210611.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 20:30:17 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue,  1 Apr 2025 20:19:44 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c241cba196decd73b6959e851bfb71d0a1c1767

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
