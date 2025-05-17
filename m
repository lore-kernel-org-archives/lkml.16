Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82FE1862;
	Sat, 17 May 2025 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499198; cv=none; b=eGXIN92wH5CXW3cfRBRypKuKoBZbU+18PeVs6vWIhFjWaMIr47j9elRkqGqcBicJp+d/hIOBmbhBC40AqvXznht8qUwQnfHDzZPUsuNEQig+a+XZ6BzQQ3tKtHmEOkJDyB31slmp90j8Hnx6xw0ZExpc+l2Kh9Xz/H01Wc1Q/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499198; c=relaxed/simple;
	bh=kyBMaskyMKoaSNhOg1I4qiUjOokqtWYO2fx4uUXyNB8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GDSM/JgfsDDILJhl2PERXfUAwSXfvK21ldaRgubgyE1wFV+ripVWgUXJRJr7L8RsEdTfp6mN4yYiSNUfQ1CpfeH8ESCKyYJAjesUSriiLTsRLgdsvmxLkndxpBUgidkdEzgJc8N3TG/p2QqrYFxtlJPjk4ve9SNjDcTkMyd1z7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4mSvVHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4mSvVHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96812C4CEE3;
	Sat, 17 May 2025 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747499198;
	bh=kyBMaskyMKoaSNhOg1I4qiUjOokqtWYO2fx4uUXyNB8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=q4mSvVHztAgwCPMiE4M3/Vl8J6QXRNUeZ+ZTq0EEinVl20BQbk8lCOr0I8t3Qdw6Q
	 ypJpjYI802wA9I/FLCKl56sxvVzagODAmssoc0VVKXUl/umDnPjWWCNr5cbYzluVst
	 gT2ioCm5sHvrGaTwfNsrX+mZvytcaX/ZU55Z/EBF5BcxZu9SxOocDnB/gbKNGr506R
	 Oo7O23jNnxfSKYWnajqJhRtXOoc5xrfxz0yDOVuhiyzlXSNtmwcMnm9cCkhFC4h3mw
	 3G1xYqsT07DkwABVb9kdXcd7aKc5Fo7hzYjp5FIqQnzgGTGn0sp9RPW/q55jONR6Jw
	 IeQRj5gVnHueA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 72885380DBE1;
	Sat, 17 May 2025 16:27:16 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250517091817.3490818-1-chenhuacai@loongson.cn>
References: <20250517091817.3490818-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <loongarch.lists.linux.dev>
X-PR-Tracked-Message-Id: <20250517091817.3490818-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.15-2
X-PR-Tracked-Commit-Id: 12614f794274f63fbdfe76771b2b332077d63848
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c586c97dd84a4d1c8df38171dc715f6241c7e6a3
Message-Id: <174749923489.101931.3380478972230753488.pr-tracker-bot@kernel.org>
Date: Sat, 17 May 2025 16:27:14 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 May 2025 17:18:17 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c586c97dd84a4d1c8df38171dc715f6241c7e6a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
