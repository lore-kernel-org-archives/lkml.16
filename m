Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD92243946;
	Sat,  8 Feb 2025 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739046733; cv=none; b=RkOf4PUhpXBv+02NYHRe+CCd2gsJulfBN2v+yEhijyt5FsrQuIOSwEbVt+r/ZsIRVfyPk2qwM+Hq6pzngbKppTR9FkrTnY0tQTmfI7MgSyzEI/X0eZM230JJYZjzWbi9Br71BwQyfDcLKmg/VbA8/KtLxttnfJI0PgjLxLNGj1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739046733; c=relaxed/simple;
	bh=Q6EvRURVSjKHgfwvG6nn2cK0bDigrOhSG5vvq7iP3U4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=h6/cbYzx27zLY1gHOAmvB0QXWafqEc58V97Q7pBIVFQL5m9gnKL9K0hWgpPTq5d6NLtYwpRPaybKNwV25Aqlg+t/m3EF5OzK5OD8jEyjj+OmM27moe8nn0NQHjW1KnVpDHV2i4WDl1bfu7k9BivqrkNuE+8A35vn+/FPYtJV/MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scH15Htn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scH15Htn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA293C4CED6;
	Sat,  8 Feb 2025 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739046732;
	bh=Q6EvRURVSjKHgfwvG6nn2cK0bDigrOhSG5vvq7iP3U4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=scH15HtnZRvCM3XOCEZlGTiXh7fZZjaSyPTO2ht5iB8UuGiLPibcbelLyAbdLWuCv
	 z9xRv7PHHcSM9i+S4musuOZ5cLuZV60zET9hTm1EpExRaFBaApOd3xn0fNo20sgJok
	 tnh0I4u0GkPYPrEMSPQcdZi4PFIMhFmwuQxLu1zBArYiIxdMOWRJCEERwYOTdw57j8
	 JNcHC23PSATyPnKVauABquIocTQmK7yNqEh3ug9Ud8G9XyEO3adgJg+84sjEqQT+3O
	 Y/+ueK7Td1hL473MiAbU8sywN0NIzueQW9zzZkwYQ8DrQEi9NPDUIM4pE3VIhOznoD
	 XrRgD0fGtZ8fA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F78380AAF5;
	Sat,  8 Feb 2025 20:32:42 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250208175817.45181-1-ojeda@kernel.org>
References: <20250208175817.45181-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250208175817.45181-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.14
X-PR-Tracked-Commit-Id: 6273a058383e05465083b535ed9469f2c8a48321
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 595ab66f1becea80c4182b2d2660f357c17db2a9
Message-Id: <173904676063.2654177.3936759655217443213.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 20:32:40 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat,  8 Feb 2025 18:58:17 +0100:

> https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/595ab66f1becea80c4182b2d2660f357c17db2a9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
