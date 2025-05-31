Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FAB24113A;
	Sat, 31 May 2025 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705420; cv=none; b=WOmnjDc2fVqA0il3fx6uKkZl1a4NY8HVawPXZuCyORZ+FEA41JgpYEtkUkOutEWrIc79X4aGk2slIJCXLOUtYYg8OOzEdwFbsmv9mtbN/AtvCTmv8Kex45TpN+5pGPrgzKVEyba6l4FDWiu1ZzUvWEc24j5SnvESBaH6Vle6HsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705420; c=relaxed/simple;
	bh=aSKBR3OAdZzFDbue9Xcbehqpq5MXM8tMVL4HWVjGvRg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CBJqhQ1Ujq6PVufbvZTCY867UakfMF4WBDCiXshExgk6XmjlYq25vIKrYHIHAtTajUyGmuwhFhYNDSOusNgnaEriQ9npe0W4N+ownvd+qE4d3yEvIChSou5AoVT8ZUVq41xeiDATXd+8W6UCh10ytuZ4SPTnxMZ9X+NQgvU8ixA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiebD5/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiebD5/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A53C4CEEE;
	Sat, 31 May 2025 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705420;
	bh=aSKBR3OAdZzFDbue9Xcbehqpq5MXM8tMVL4HWVjGvRg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TiebD5/Yxe2n6WnCnmLQMq58d5Yk0/NkRa5HdrJDqLTNYhDdMTV9EOvQ8ZJ6g+pHD
	 M45uvg5Mia3W3QS6xrQyvyN1G5Sr5KdmSNieBR3bYaI8Ld0lxSkdV0GrNyoAdq0SfX
	 4YwPlrnAybSSALNY0Be/mCbGzh++7I+zVCuLpd+bNpJTlad3nMfwtnfZPHqoYnQfp8
	 +y9RK9QKeBl/YGY3pB4tyfhsL3NPzAGT3oXMlxiNGHOYLEakM0e1JLRRUwuU409rD7
	 DPSs4Z6xY1981Kxgxe/I271wwAJqheNnfKcEvI5owCTAsPAb1xTdfOXEoZpuPCAsXd
	 LzQgyBZvBpKcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE052380AA70;
	Sat, 31 May 2025 15:30:54 +0000 (UTC)
Subject: Re: [GIT PULL 3/5] soc: defconfig updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <70c2f540-d534-4b17-8daf-4409845f3a5d@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <70c2f540-d534-4b17-8daf-4409845f3a5d@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <70c2f540-d534-4b17-8daf-4409845f3a5d@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.16
X-PR-Tracked-Commit-Id: ae006498a0723e1cbb14fb7c56a1fa4642791897
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f79749a8e42b3a6dcb980e87f3ef752962b9f094
Message-Id: <174870545315.163157.15508675521389745146.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:53 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 31 May 2025 11:05:53 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f79749a8e42b3a6dcb980e87f3ef752962b9f094

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
