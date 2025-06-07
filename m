Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114EA43159
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 01:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749259049; cv=none; b=g320Qiq6QRTg+hv8w+FUJuqkoJyUPn68yu5B/+DWfs+0qfNt+6JNFD4a1kOTTXtATIJLiGiFekqVpA5tXE5KDqD+5/JI/QXzLBEXxlcOU7R5jWGe706HrIpppoaudM0mQipTKDQKfyf3djeK5mqhwJKNI/ax/g6EFHJieAxXuf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749259049; c=relaxed/simple;
	bh=v08Aw7fkhkxP9lYqVv4zou5EaTiB647fWqJLhmsAXxc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YxulIjusQ/yDHbenUSiefF7mv5eutBrjzZGvBC5B3kjd6tqhGZJ1ZmMWhG0J2uqZxNo15QNGosgn9V8Ql8Keg7ognpo3uvob/mILSkd6xNDP/6M2TI6Wlb0xZzmtT/vUSwOUvqj5OV5YiJNIzv7qeY6L/0nYAF7scFwAIojy/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6dgme4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6dgme4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5200C4CEEB;
	Sat,  7 Jun 2025 01:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749259048;
	bh=v08Aw7fkhkxP9lYqVv4zou5EaTiB647fWqJLhmsAXxc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p6dgme4ujY0zqsyQE/TdMcPz4kDXeOdT3gY73FapXi/DRRn04vOvCrzqfDdeblzUm
	 t7Af2lZOhitLpf/b3W+ylwyQ7bltSkI0i1qj5vKBj0/UVbNppjBZBlR9UITsFrTuSn
	 rO3kvOkyQKLgF8qLt70KdCEDgEkM3MsYDMh64v3opJB4XBh+qsgb4F2xtCFhK5eCCS
	 HOUnx/tTZFa4A6G8GZLTsAgS8H+LEavD/DHQ1oN81ycaYrfyGBlr4lRPPv4a2YKseK
	 D0x+Xs95zgnp8nOoNJXF61cWLam+NT2yHRdn/7bwJrRfFHLYhNkl1KQCPSDavMP3Bq
	 kp9hJ1ccF4ojw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCAE3822E05;
	Sat,  7 Jun 2025 01:18:01 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
References: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1
X-PR-Tracked-Commit-Id: 51f1b16367dfde89a4ef5bee2270f6a4d523ef3b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 119b1e61a769aa98e68599f44721661a4d8c55f3
Message-Id: <174925908025.4051830.16595083287705873176.pr-tracker-bot@kernel.org>
Date: Sat, 07 Jun 2025 01:18:00 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 06 Jun 2025 11:10:37 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/119b1e61a769aa98e68599f44721661a4d8c55f3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
