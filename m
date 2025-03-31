Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702C1C32;
	Mon, 31 Mar 2025 00:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743380320; cv=none; b=eG0nykH3mxObxFBkgvlg8N3VsQnp/ZAyNXyEFfrNE7vo4/ieODrfgsZ9dgRoyw4DptVE7hkK0fwUgoN/2EEFKW2LHz2lA9pl2jZsgFD/1gNHP8V9Oam648/zTZ0GLfjmO4WNdS5S4mHe0/UV+yn/Kbqa3fKODgBlfu3/pVkeTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743380320; c=relaxed/simple;
	bh=6O56coM/mtrBCkTYiwff5KIjPbRikdtojqLTzFUaEN4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bdLEAOXqDWYvx7j+at5fCCZN+irB84rwytZDVQjDUhXgqmHw4dGVK9uZJwqV8hqfTibatczcPZI3Z2p1qbLTNY4ePFWIXw+m9UQHhi66fQnLx8FwLvdvnKIwJOBkI3gZ5349Lo6U8LgbAFj5gRnNASHug/56tfcByPrl1om7bn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niEcBH+q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niEcBH+q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D782C4CEDD;
	Mon, 31 Mar 2025 00:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743380320;
	bh=6O56coM/mtrBCkTYiwff5KIjPbRikdtojqLTzFUaEN4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=niEcBH+q+6p39st15bQjqUoQvhsCnzLln+gIAFS6sp5S82rHWU8aLWg1Cq+3G5FTU
	 Uv3JJ4FHAOk803Qh/IzT7OifJjT40iHwLuqcDaNQ/T4A6uQS0aHjEr5dtG5mGcJRQm
	 Q0FGnFppNVfBj2d5QXS/PKN1ow6mL8nSoadmSCe7ONpnJntxrSV5aAwbh+8l4sBVgR
	 O0vCXfiSS+fpGJYaJlgP0W1rUR/NG7GrMUipVajIYF4flLt/JkgeTZR4s/EDLDZrdX
	 dEowG4LthXJ5YxLpuRWitA31Z9JE7nJQ3Y7l4Tj27aXVe4rqaKmLVGxxx2rr+A9GAD
	 0o/Q8hmTjAWvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7173C380AA7A;
	Mon, 31 Mar 2025 00:19:18 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250330170535.546869-1-ojeda@kernel.org>
References: <20250330170535.546869-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250330170535.546869-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git rust-6.15-test-merge
X-PR-Tracked-Commit-Id: e6ea10d5dbe082c54add289b44f08c9fcfe658af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
Message-Id: <174338035690.3629504.13773091407704425462.pr-tracker-bot@kernel.org>
Date: Mon, 31 Mar 2025 00:19:16 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Mar 2025 19:05:34 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git rust-6.15-test-merge

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
