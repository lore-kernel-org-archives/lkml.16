Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D77E1E008B;
	Sat, 19 Apr 2025 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745083303; cv=none; b=QLIst0b+67lWBHVnpR2Mgv2OvqQi9FmbSQPklqpY0CH5Wc/qB2ZJ5pSY++TujumG1hIP55LPNUvOUNMKXOJedE6icgs/YKdR9Xj1YsUP9YfmDLm8cL72HYIDORSJ2qR8yvkDJFDS2zDViacudfzIjxn4y5ubALsQEjMLoB9yqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745083303; c=relaxed/simple;
	bh=+BCt3t5TWyJT0FYoqeLVbp9fL0datUCvWdzofDG5obs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Os5K5EibvbmVQM2rgqG7FAo9XMuVa4MSuavtqkcigYjfR0feOCtW7h7XAzNqyh5MDIbRjVMbzKQ1vM/P+cXrL15uE0RmU3zDNIw1qcakO+1ZwBbaRqTgKRtTorBIzjzpNpu3WCGHt8giu0cPv8CYPhSVH+gajFoFIY9hw1fBVW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPTrNj22; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPTrNj22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AB5C4CEE7;
	Sat, 19 Apr 2025 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745083303;
	bh=+BCt3t5TWyJT0FYoqeLVbp9fL0datUCvWdzofDG5obs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EPTrNj22J/JjFhOKGKDkKxptr1tO0IClHaQBbN6Ofp1aMEfDlstBwbr3isP1CRmPj
	 V6nwEKGBYDTgUjNsSXfvH1RLx9lIl5sx0wg5breeZflS63OJ72srt7GgnfO2lMr1nJ
	 CNmRjtXnRRgdjdMnEyoso4dTOXUnUfqYJkgDYSJBhP8vyDWx6JHdCSFHCMnjbRMaZs
	 J/cdajaAujJikM4jncBh4LDAx8USseqFGHvgTa44OR7ZvLo63EqKNBrLl/ZM6ZDC7t
	 8aqfDFHZSmRK0mPhouhi+DeI1n0kU/ivjOTR1UrHzZS/eDkh2Xj5NpyMua4m4rBXZ7
	 8OWleySUo+Fvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710C03806642;
	Sat, 19 Apr 2025 17:22:22 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250419103443.3004008-1-ojeda@kernel.org>
References: <20250419103443.3004008-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250419103443.3004008-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.15
X-PR-Tracked-Commit-Id: c1b4071ec3a6a594df6c49bf8f04a60a88072525
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0bd2f269ae892ce7283fee8fcfe2c6c971d871bc
Message-Id: <174508334110.507729.6005080639617361030.pr-tracker-bot@kernel.org>
Date: Sat, 19 Apr 2025 17:22:21 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 19 Apr 2025 12:34:43 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0bd2f269ae892ce7283fee8fcfe2c6c971d871bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
