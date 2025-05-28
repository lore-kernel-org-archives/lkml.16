Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C75628C87B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446889; cv=none; b=JUNW7M5MiYTmhXSDpVBUYk0bjYRIcUBi3Mi4AJvyzOXZqcvT2B/ggMpNZSP1HDnuzZOgle26ie0sDybOiiNUliiHztEyxm4Zuo58s6lRNGy2Y7S2Xc9cGe4Z8vbJQgweQ9TSiBPT/5fhCO88Vy0eAaQYMTUrW+cWog9lW/NrUqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446889; c=relaxed/simple;
	bh=7EQ2E7kk7MhXqr82SAjRqE3m120h7nBfPj59qvIaMTY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IOKxBFrXvRNAEYrO5C8OlBNihGCwkOE5vK8A4Xz6Zo5Si4K3bhIVRWZ/JudK4vNYFsBUOu7Br9Ufu87sPtflfsR8zJ//KN+QMoi1IADfTWSfQWCkjxdbb2JA6QItZprBeEUhHEsI4t6h/l1F8u05Es345KJffDtRycCPsL1GrMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqByh58m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqByh58m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA52C4CEE3;
	Wed, 28 May 2025 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748446889;
	bh=7EQ2E7kk7MhXqr82SAjRqE3m120h7nBfPj59qvIaMTY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jqByh58mEWwUA03HLzWTqbCjJ1zU6++NOxpE2pxCwTWOo0y2BxHd3lKh8ouVjqoYo
	 6KW2GIfdNlZXPyaL7l3ZJFzmkDxVUS3bCV1smoihs+xP3nf0mkjiZz1FKOhCL21Sj+
	 57GHZEMUSE4uPDkMdZLBNbqMj5HmCXlPnRHlyEX7f5zMcdjPASjeqHVAhxjtDYugBZ
	 tKMo0jgO16xLkYnz9zHBS9cygSoldhQ2nscsdy0WoN7KJ+FwiH4u/7A+qSfIIv8vlq
	 /2qfsLd4/QRJug/LTbe8FSWWEHlU9BwE/FRmYGHN6ONGHg9WlcGCK+aieyFgBlAXJh
	 rnCJD+/ZMY3mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F353822D1A;
	Wed, 28 May 2025 15:42:04 +0000 (UTC)
Subject: Re: [GIT PULL] hardening updates for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <202505262001.561C185@keescook>
References: <202505262001.561C185@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202505262001.561C185@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.16-rc1
X-PR-Tracked-Commit-Id: f0cd6012c40da99b45f8f63052b97ec89d5f307b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 48cfc5791d83b630fd90a1b64a15a6d09c186f99
Message-Id: <174844692307.2441113.1173997929588626055.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 15:42:03 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, Coly Li <colyli@kernel.org>, David Gow <davidgow@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Guenter Roeck <linux@roeck-us.net>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Harry Yoo <harry.yoo@oracle.com>, Jan Hendrik Farr <kernel@jfarr.cc>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <n.schier@avm.de>, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, WangYuli <wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 20:25:28 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/48cfc5791d83b630fd90a1b64a15a6d09c186f99

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
