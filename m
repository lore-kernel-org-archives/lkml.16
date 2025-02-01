Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B639224FD
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738372828; cv=none; b=sqpHef22AZk1/fwWIJlgDe/wfuVll4NFCeDBZ2amUs8Ju5NhZlWX5tMVphZbewBW/cxFFJ5mkgv4k3zNSfOBYl1LOgaZnq3jmNqALMtX5SCpg7ze8qD85J/C7VAP13eibnPyHvJSWPxhq6jT8NCME8kwdZgtK09suztZanF3FEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738372828; c=relaxed/simple;
	bh=ern+rP+PqdIW79Ykqv5qaGbGCuMqBPVXFvmC0d9q2cg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Lz6YPhBOdC/DKexRwWyjCXk/7I7GVCoPQzY8xzdTbmXpDHvOO3CHQbbVX5OaZn1BYKD+SIzjFHHbs6VfNa9t2rfvNelzqJBlLzWK5+Wl+cMgBXE2KtVYKQ8zb4Or6zbKDfyUdTNEZlygBB0DMJmUYI0DdpCjY3O2BXyUPbRAcMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZEY/eSp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZEY/eSp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB4FC4CEE2;
	Sat,  1 Feb 2025 01:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738372827;
	bh=ern+rP+PqdIW79Ykqv5qaGbGCuMqBPVXFvmC0d9q2cg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oZEY/eSptufVbwZxZW+iqEyf9r1HVsbM6E4gcmHekVqOEOnwgEmDb+svgWEfZpsh5
	 VkHz+BmGMmOQE2pY4qEjBL3xPZictxoVsZ+5k6roaBL8MwKj0vjaNqYat7TzGoFUG+
	 x+J6l1q3WGSRRnq6rPCnRSD/5dYNDuCOgjLfOP751Cq70HnHW4NdoY0nmnVNn9nMcX
	 DCd2oQB0MvQoX9357EwfCR/wrBkOa3ucwbIxTy5Xg8NfNMUmoUoCM7gBvA5wgu+akU
	 0v+mDPANpY0Xl0ccPN0HHWKg7esoZxdr0iZ9UswEPwR+6GRoV4T/3cYAOJFHe0OuXq
	 6tWDKQoKTyPww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70ECC380AA7D;
	Sat,  1 Feb 2025 01:20:55 +0000 (UTC)
Subject: Re: [GIT PULL] AT_EXECVE_CHECK update for v6.14-rc1 (fix1)
From: pr-tracker-bot@kernel.org
In-Reply-To: <202501311342.42FE3BDF9@keescook>
References: <202501311342.42FE3BDF9@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202501311342.42FE3BDF9@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/AT_EXECVE_CHECK-v6.14-rc1-fix1
X-PR-Tracked-Commit-Id: 38567b972a22706e9a1a52b2c4bc9ea4b5ed00ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdd4f86c97e60b748027bdf6f6a3729c8a12da15
Message-Id: <173837285410.1781434.7240287741502720585.pr-tracker-bot@kernel.org>
Date: Sat, 01 Feb 2025 01:20:54 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>, =?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>, Jeff Xu <jeffxu@chromium.org>, Kees Cook <kees@kernel.org>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mimi Zohar <zohar@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, Paul Moore <paul@paul-moore.com>, Roberto Sassu <roberto.sassu@huawei.com>, Serge Hallyn <serge@hallyn.com>, Stefan Berger <stefanb@linux.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jan 2025 13:43:33 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/AT_EXECVE_CHECK-v6.14-rc1-fix1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdd4f86c97e60b748027bdf6f6a3729c8a12da15

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
