Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AD521C18C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786091; cv=none; b=mERadDteWt67JnEL0rC6vvWEn6q/hD1jqug4ql5RlCRPU4dgiJ+nTIglgCMxoyK7qNYzbwxIUnnKz3l0FVGdgnSXaHTAz9F+8UgUJ6icKzQkLZUv/5HvD5fcURFWUkdz895mrGolUKrx/IgcKxA0dEmCMqDxunUh1foRDHy/wVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786091; c=relaxed/simple;
	bh=hrukEFpy9+Jy1KGZ/zOcraALjOes3wwq2y1IvPEmVgU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ik5G/SpUNNTLgxr2SlD5LiInf25tLANMmgmCEuPM/IU6LlEO8Rt4e8jOTU7PxuXqFzb3E0ygKwmKaQ3FyZhG+MVokg3b9j3WLuPSaM4LF9uHrXPiOjiBJh7FHkvSh69G8oakLfOVFsXcFbDCqM3Emsjr5aXiQUDdYS3EcnGFN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufgNuT2+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufgNuT2+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58293C4CEDD;
	Fri,  4 Apr 2025 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743786091;
	bh=hrukEFpy9+Jy1KGZ/zOcraALjOes3wwq2y1IvPEmVgU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ufgNuT2+Z8pW6YujcnmcUxLdRXczWBB80yEixaJhbST/+tLYkJb53knCzWV6Iw/gD
	 3INbTLIB6yb9GJmnJfKosKhxtUnfy7tBVEc3Zk+Hh7x8s/zgkfMLw5BqT7LgbGjY2S
	 JqI7l1zcNfxqtx2FXxzb4dwo4wO/dA5bDmAy8W4nu54u5Vd5PGzvk97+v6n7ZKI8YW
	 QA2Jt5g50vWleSs/PstgmY4BzLfEHB/ngFGAXrAVIlvTWcgFmiz2T7dbh6zQITc5Sp
	 zyrxzUmUGpMzaBeunkbyf5Lm71EfKDgmB5YP52M11JBlyqtsdNpMQUls0uEIkYoeTy
	 Kv0AKK6iac/nQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE9833822D28;
	Fri,  4 Apr 2025 17:02:09 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
References: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-mw1
X-PR-Tracked-Commit-Id: 3eb64093f533a29d3291a463fd65126bf430ba60
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a1d8ababde685a77fd4fd61e58f973cbdf29f8c
Message-Id: <174378612858.3331400.13861432422726874558.pr-tracker-bot@kernel.org>
Date: Fri, 04 Apr 2025 17:02:08 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 04 Apr 2025 08:58:06 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a1d8ababde685a77fd4fd61e58f973cbdf29f8c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
