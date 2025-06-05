Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958E442065;
	Thu,  5 Jun 2025 04:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749097440; cv=none; b=HR9pBc1AR67xoQMIzQCRkkguzSO70fA45ueW+2vzmFZ83//zMhBvHNoc0gagYgM5Kg8yDQB0JRRlpE8dm40TTe6VdEcVJsAut7sjnF9nDX8oGE4vic+dBeSVpvN78ybDGmKJhZEiP7TMtN4eAW9fraaYCgElbNOBmA6a0sQ27EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749097440; c=relaxed/simple;
	bh=cl/9dwi0NgI67Cm44M2Id5f8c++OtBegUIKnmKrji74=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ffl0q6A5+nxIYDMl1KgzqGaZX4btrF67R3UzQ52guvAwi8z9kbdgPny7pmcoRpXqxmTXbLLjQcAncXcJQjEuV8muraeaKeXBkQz/+o0ctFZPG0ciWYTB5/3kvQpBIOUdCd4oAG//VWUXuQoWFf7SICvRtiOU35g3sTs9Mgty9oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSk7bTlf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSk7bTlf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704BDC4CEE7;
	Thu,  5 Jun 2025 04:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749097440;
	bh=cl/9dwi0NgI67Cm44M2Id5f8c++OtBegUIKnmKrji74=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qSk7bTlfW/T/rKpWbhFHi655q/IS5OcwbFcA8qAbAe7WffeDUYoTlM565ctLty85e
	 PJrJqlgNSNGzRhm/IeR3KJTrZm1FG2Hvw7YGDP8WzwRZl8tXo0JJ8MI5JlgeOghPTr
	 nJAn1spaH1cS7xrb01v0nDccs+UPFVJpg1UdZiAgKvmJSU1zZAuWYojjRbbI2bquNf
	 CgdCQkPqLJ9LnOo9n9b/OmDEYsV2Iu2jBn6TrmgVFvnnKUtEIlJBKpSSJh7gYR++CS
	 FC23DWTTakSgWQMbrQ6bGp7SJrx9BJQcnsGDdbPS+yZJxFwYGNJpJak8Jg7SnZQhRW
	 Sah1B5DJl/ncw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE160380CED9;
	Thu,  5 Jun 2025 04:24:33 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250605025400.244965-1-ojeda@kernel.org>
References: <20250605025400.244965-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250605025400.244965-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git rust-6.16-test-merge
X-PR-Tracked-Commit-Id: 7a17bbc1d952057898cb0739e60665908fbb8c72
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec7714e4947909190ffb3041a03311a975350fe0
Message-Id: <174909747230.2573604.4030348226584390118.pr-tracker-bot@kernel.org>
Date: Thu, 05 Jun 2025 04:24:32 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu,  5 Jun 2025 04:54:00 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git rust-6.16-test-merge

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec7714e4947909190ffb3041a03311a975350fe0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
