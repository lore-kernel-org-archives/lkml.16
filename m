Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA3243958;
	Mon, 26 May 2025 21:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748294380; cv=none; b=Rf+VFjZ5+w59aBAhFuB2jP0w5Kt5YEgFQMXhLmZZ2xMP8yzpjNjEcVPbQifUZn4YpGyF/AotxIQxAjY49xO1u/q/NZO+g4/0m2hr3TwFfl6IUzNIoldT7XR5T02u6//D6C5JBf6luaJfa8hcOKYKh3v2DvkfI6jqmhIFXrl9K4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748294380; c=relaxed/simple;
	bh=qAUgO2UoJoGGmaThYuKXzBBxafo6Rn1ajluvpjT56/M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ln20Ffi2JNe/Av71U+yMEm4uefcuO5dBn/Kg2lrDiNFG9h1BXup/N9UDnaWbxIzfQCKgcjT2ExFtWP2tGLw82Z8W5zibigobRnUKZb7pueNCqgI8hQ2RrB8nU4dkmDMb+DH3Fhds+Aozvp9wSEYyLKwItMb0SY6bLv54aiet+B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rv1Cr14Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rv1Cr14Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7956DC4CEE7;
	Mon, 26 May 2025 21:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748294380;
	bh=qAUgO2UoJoGGmaThYuKXzBBxafo6Rn1ajluvpjT56/M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rv1Cr14ZORdoUAbRijFq8HGOj2PqMu7YdxmNUDwrip35k1hbnuC3EojURtFT+dCsX
	 7iKlZUdasY8IGleYNZLopEEmuDhJLM5RMPmGfuKkObRVJZ6jnzC6xcSnnCXp8aVwM1
	 4invRn0W/ZNvpddDPvlCTdSTGB5Ci0slP/Hf/TzndcwkNFp44kgsWMD7KHzAQRh92C
	 gbIebRCNBoT8zpxzqwfroiHsbDv/HtL0FY51j9Fb2ZA1UJUWbxWt6OYIK8HV3lIOnS
	 rmYXjdmeO0wvqTSjpxLzK2EearJAwgEy1scx6sfP1yo2sfdbdH6nrAa17CxDnwVyki
	 6aJ7bxazOGkDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F10380AAE2;
	Mon, 26 May 2025 21:20:16 +0000 (UTC)
Subject: Re: [GIT PULL] configfs for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <871psp56yb.fsf@kernel.org>
References: <871psp56yb.fsf@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <871psp56yb.fsf@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git tags/configfs-for-v6.16
X-PR-Tracked-Commit-Id: c6b1908224593db76f77b904894cd51933559ae9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a56d3133bd875d90ef3237f24e37b75b6d0326a9
Message-Id: <174829441512.1051981.17323216450657444824.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 21:20:15 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>, "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 May 2025 09:51:40 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git tags/configfs-for-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a56d3133bd875d90ef3237f24e37b75b6d0326a9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
