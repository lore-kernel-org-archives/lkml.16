Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2242E7648;
	Sat, 14 Jun 2025 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924622; cv=none; b=UO1Azn+CWD2MinR7ypPy2G+oCwaNipt6/Z9tNbjC9x4nZCtR7H6Cen1QMF2/8qZGJ4RuJYig/bhJ4qv/HfCWF5m3ibGMtKGUl7TRPV+ilmdakX+zGhD2UxocmVq7JZqtj1Al/YrxgJT9yaXKSQMYWOlhUelbKgY+0N4WkW6G/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924622; c=relaxed/simple;
	bh=FHh45ILD5svi+ELzeEk1u8q9WosFDgK9rivXkzMrLNY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NXPlWxyvMQlbXHF93OqEX4FELQIU5qcxilC6eegSmiQIeM43nUoqiY1j7gsI1arTSEVjqWQJllr1joHen+d4l/uwWKJLsUP32HvxlURX/sHwJhbTBfSU5gLF+4h5xPa5CIvkY0l6bDTEVz3k/46pgWvECoLPsg/Vw1LQapXV9xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkCYzoDj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkCYzoDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56210C4CEEB;
	Sat, 14 Jun 2025 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749924622;
	bh=FHh45ILD5svi+ELzeEk1u8q9WosFDgK9rivXkzMrLNY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HkCYzoDj5FvvEU8R9NX6b8jCa/OE6fvJjTRiF6Ij79xc+03BFOiSDmOm/zjGpNEaV
	 BlgbhcO5QmW8r3go+z+61BWMGdvXt+sdTB4RscGnuVXhJJSmeTEGc/+DYa+0qbriXr
	 TUDe1rF1XqPwuA3kIkphYNH+Ur2HyFgR/FcXbmIN8zbuH5qP5TcDwH/WjwKxq1P5gW
	 54XUApYkTFkPqrfu3fJj72M4wRK0UdlKDtB6KtHtOL1zpS9OR2WuS/fRF5mezuaGpu
	 Iz3JdVz9/l9vg+c5BdAp8oH71d3RJKQMEWi12zDxOxx/EZzHS1PQqrSI6mlP+6I6iO
	 HlRqBOUVU2C0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD7B380AAD0;
	Sat, 14 Jun 2025 18:10:52 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250614093653.1431306-1-ojeda@kernel.org>
References: <20250614093653.1431306-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250614093653.1431306-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.16
X-PR-Tracked-Commit-Id: 5b2d595efbfc9c46823bdb9ef11e1f9fa46adf9d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 588adb24b757d5d9a438056ac0347d8b3ac38dde
Message-Id: <174992465161.1140315.14423855215288352110.pr-tracker-bot@kernel.org>
Date: Sat, 14 Jun 2025 18:10:51 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 14 Jun 2025 11:36:53 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/588adb24b757d5d9a438056ac0347d8b3ac38dde

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
