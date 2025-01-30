Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7491F0E5D;
	Thu, 30 Jan 2025 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738263877; cv=none; b=pbL8ODHROur3sEi3H49Xr7IPsiH+vzch2HeuT+9J+i/8gKSd8a1am9TC7VfCLHWJ9bEa7bSEyKfjG5Mh9z06aicuodHPsz1ZybqnKySxBWBZnB2JhTt6+iXVdAEKngxUfIlfKOl+q414pROAxZnQ2VywDiqP7EgIu77o3H0sQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738263877; c=relaxed/simple;
	bh=ss9rEmW1/rO0xDw6Gw0M97gwflHKtZnrZxak+j/6V5s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Zp9lWAEiF5YrVW1PlMWGt1eouLV5pDNcMDUWkwSRYqviSh7aPFYJFkDLnkaJO7th7mwfNTva9Vg+Jcinwvp7rysVe8xxy2FEIrNEJxHE1zv4BybR0ADU6rdDOBSmbJnj3N1zmX/waSOdl2BrkBst/qXJQIG6F8Y6WzV8YthjWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZyZ9t7L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZyZ9t7L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F29C4CED2;
	Thu, 30 Jan 2025 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738263876;
	bh=ss9rEmW1/rO0xDw6Gw0M97gwflHKtZnrZxak+j/6V5s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WZyZ9t7Li2k4/lAB27R8DVfReTWfEOmwa7hTQEFdHGnuErr08Bs8Wv/d9PJaqNzyG
	 /uJaN3s4AKSEgIT1F1diLqu7OWQouvf7ZH1nA5BWY055T4umwgQyhV1vGTgGxYT4E3
	 q8h0DCJKdYFPsvS/75N3HUpFLnpzR05KSA8nj7qVJRyrwrjcvenQav2btrqTrHMBIL
	 4CxmoGZSpTU+7mooVICedxN3KM7SgT5CRBEHqANhgV2tKXYwI8S1Ceo5Fn90Mr399q
	 xDflJved9tOIPunVxlEnugdKuKvhyzSzDm0ZpA5RKcwDuS9vqdNtZ7Xi80UNAKjbGN
	 2dwiRzZtSrKKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3669E380AA66;
	Thu, 30 Jan 2025 19:05:04 +0000 (UTC)
Subject: Re: [GIT PULL] Two documentation fixes for 6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <878qqs1bqh.fsf@trenco.lwn.net>
References: <878qqs1bqh.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <878qqs1bqh.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-6.14-2
X-PR-Tracked-Commit-Id: 96720ce8b1fa72659ab03544516ceaad6bd1ebc0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
Message-Id: <173826390286.1055680.2426131308421240136.pr-tracker-bot@kernel.org>
Date: Thu, 30 Jan 2025 19:05:02 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Jan 2025 09:56:54 -0700:

> git://git.lwn.net/linux.git tags/docs-6.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
