Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECCC28003A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366750; cv=none; b=KxMLGw1VOjlRTu/xutX6Fxdo0uIYLH6o0tTPXfNlBgiflPj0bs7+deQfrWLNkPwq1jVt0kblJ00DeloxpAWc2E6fh4yRarfU0YORbAyLWctQpGAuiRVFUSZAJyPbqi9sB+wY2FT9FfrEaX1qN+lpSKhOojbKMAcHZrGOjLdKkxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366750; c=relaxed/simple;
	bh=M6zaRHmn24hE8wCR3jkOrcp+ps9eLYKDkzAsPWPihhI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Kj64Hfn0YRKnz1+efqocGTrGfQA5QB5ntTz4TFuqcSxOQO0jXwtW6w/GoMNkwPFEN1duZ6Te6fnKeugyQqRNxY/vIMtNmvHPjt90ggs34p1gRF7+IfcJsFIrlBQSuE5/+eM/feasGXq9Lj4ROZtyqGe/lIQ/oLeL6lN5jDJjp4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKS5CRwW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKS5CRwW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32739C4CEEA;
	Tue, 27 May 2025 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748366750;
	bh=M6zaRHmn24hE8wCR3jkOrcp+ps9eLYKDkzAsPWPihhI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZKS5CRwW5d0yQ0EXbcQW5l4zzMjQwLheQJQgH8w9dQV8MgpYOg0iY19ft0biMVX6j
	 Ey1YIvOYEsDExPbCZq2VwB5UQ7y06jepmbcb6z8MbGK5SI40gKOlRvV+Fp4SMgdLAi
	 sJ+VDZd5R3c7UxKqUOhttwQd7AZbtesLFZBI0f0RFt2b4gwYw7Jd+fq5djCvotTzPQ
	 FaPfZ2BcwFT/fHbmYPN0xpkFt24rsfXQK7rtSedsxd6Cm8uQsL1i3r06bSX9rbfXLb
	 hQtBl0qi2Y90A9Euzh2tDvNlKhWDZ3ua3+k0tFSk4LyP0YRZf1yG9j5EspEywPzX8d
	 JFx+Q30rqlPkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD93380AAE2;
	Tue, 27 May 2025 17:26:25 +0000 (UTC)
Subject: Re: [GIT PULL] x86/mtrr for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250526180750.GAaDSt9noFCkmXjlGt@fat_crate.local>
References: <20250526180750.GAaDSt9noFCkmXjlGt@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250526180750.GAaDSt9noFCkmXjlGt@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_mtrr_for_v6.16_rc1
X-PR-Tracked-Commit-Id: 824c6384e8d9275d4ec7204f3f79a4ac6bc10379
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 350a604221d252e7431649353dd600e42bc9e944
Message-Id: <174836678438.1718433.1125678185862842391.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 17:26:24 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 20:07:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_mtrr_for_v6.16_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/350a604221d252e7431649353dd600e42bc9e944

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
