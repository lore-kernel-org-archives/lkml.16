Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFF127933E;
	Thu, 15 May 2025 05:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286965; cv=none; b=PG+D73QnCzNA3p8V7klg7GAX1oGwfvWFpY+eXp3H3wMmdqM04onc4xPpZ04cXVqrugsYYOPkiT9UEXknw5GqkMZfvm7/jTmUqQLpVdtKgToCRjpPD7hVtXY+frshJOR2evzp3zvS7Zo/LnbumeOJdYDKZgvnOzTTppE5JCYv9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286965; c=relaxed/simple;
	bh=dqn7uuF28OU81Cykus9N0EUWqtybyeKF7QN0v17ofiE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=h3dhGTgE05iACRMSl2OcyfBZCELoPZPNaCtUQBSx9ILOdB7Aj5ObkHmuVYmil4asAcgEszUz4IsIfvN5pt0z2G9loPdlRsdkXyX0LsdJvfDLie8b8TzzKzjVuY205/Tpf3gsWttZPBpqQQkwSdJWwlXYMRtyCS5UEKaJRBLL19I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHxuvqCG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHxuvqCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96591C4CEE7;
	Thu, 15 May 2025 05:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747286964;
	bh=dqn7uuF28OU81Cykus9N0EUWqtybyeKF7QN0v17ofiE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DHxuvqCGyXgZG/HeWQyc6vqJ3HcO/qo1RKAjWEysMz+z+e1AxPbXyi2QO+3z6HFdT
	 JYOYAoM0c2cPMgm50q1UOoAQxWt4Nvpg+Sw2m4rJ0525gSr/EJ9qUObsXwtRF6uiUl
	 irSbzEZoDdBgr1SHLdL1qVtRUf/+VjkjeeGjZ+ixyO5ahoLaC+bEW2jeGAUEA0QLDa
	 2DQdjyFMa22thi2F7APT2v2gVQHlOwr2mik8DgMpCgSg+rU2rM4NYRtwQ/5fSVkHem
	 d9ToE+5luQU8Bi5vPLUjgtOrOFko5lpjNIFjIIkH+3MDEJNcvQ+SoWl7n/jLkpOr+c
	 OvzIYlIaQcq3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB53C380AAFA;
	Thu, 15 May 2025 05:30:02 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
References: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.15
X-PR-Tracked-Commit-Id: e0cd396d899805d56df91b989f8efad3a36df0da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 088d13246a4672bc03aec664675138e3f5bff68c
Message-Id: <174728700160.2618305.12083814490763602889.pr-tracker-bot@kernel.org>
Date: Thu, 15 May 2025 05:30:01 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 15 May 2025 14:14:26 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/088d13246a4672bc03aec664675138e3f5bff68c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
