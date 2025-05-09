Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAF1220F30;
	Fri,  9 May 2025 21:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825500; cv=none; b=Vbh2UP74sFfbE5cA3cxXp1O5ZqPMONmCbqSZS1x5oJKq0nzrO7Mpc0E+3CRUE3UVp8Xc7JBilk63z16L0l5eUwH8LeRALf7njmFJVr3/HIy4yqAyizHBsq9rb5DGywXWcQUnKomK1vVapbh8tmrA/5GD89UYAgWTqyt/MmiY23U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825500; c=relaxed/simple;
	bh=KklXG3/pmNj7Q72o6zPjuVP/skTgmTtjxrJiU77O/Lw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=A+F8TpmCc7SaI5cYuwJwr9tnxb+zYPJCqO7N/+Q7GRaD6FKkqoGOY2TI4RJHdKDgXU9r7hjBEXq3lUKkASTD68mhELY9/sLx63zCg6yPqgjF+JYQCdU2nnbgdDG2x+1TK6PCPpn4pDgyGJCSLc8gtASy4nc4lsDXR/vtBjWHJ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8qb40o5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8qb40o5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A08C4CEE4;
	Fri,  9 May 2025 21:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746825499;
	bh=KklXG3/pmNj7Q72o6zPjuVP/skTgmTtjxrJiU77O/Lw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=U8qb40o5P1jEZsjZr9saWIkoF4sZCTVFoM9QzIM7a2r3VbC4MkVI+ITIra5OTHiWl
	 3gS9lkhulMmcOEZsZVkZeapYka/OFvu0tDB5lkoxJeFTVZQhAyD/A4I4ZxfHmUQwF9
	 mlKfgON1dEQLiZP2m0iFgWWNeaKn+oh9FqvHy6QKhRdZRChTzWw/VU/WG2EtzQPR2x
	 D7AdDmvOvHrMG3PfAh5aV6CX3XPigA83OH4Y5hXEj//wcFr9fNsecOtJNj6Nxhpf4A
	 kQ/3uJW0XqE9pZWI8YchgysI43SCf3j1FEk16SA+7H5VdRWZEo0MyNIOFcii6baxpS
	 64yGvtBXt12VQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFC639D61FF;
	Fri,  9 May 2025 21:18:58 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.15 (2nd)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250509201458.872943-1-ojeda@kernel.org>
References: <20250509201458.872943-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250509201458.872943-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.15-2
X-PR-Tracked-Commit-Id: 5595c31c370957aabe739ac3996aedba8267603f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e1329d4045ca3606f9c06a8c47f62e758a09105
Message-Id: <174682553731.3813529.8350704385191414102.pr-tracker-bot@kernel.org>
Date: Fri, 09 May 2025 21:18:57 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  9 May 2025 22:14:57 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e1329d4045ca3606f9c06a8c47f62e758a09105

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
