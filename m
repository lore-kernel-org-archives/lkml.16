Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683DB243942
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739046749; cv=none; b=LeRQkEzycVQ5CPVJxBoTxxTDTCCUbmc2oucIg2FDLay+RvENUs20PrQqPRc/jiX39zm4VFy308NsHO4qHsjlRyz2ZqthJ4CbKwtoKG3RbdjUvNxZVFvmou51KHf+TAgNm6ddEYx9+urdz1njgsI5zK79IK2PFdwY2fkBPRtD5qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739046749; c=relaxed/simple;
	bh=NT/2QO6AYL9oqziUnAgRvQEAC2Q/r3NLLYAmL7/v+UI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=m/wArtEue/Pazn9lLwXt6Jll7wWN5lbP0Vlm8CEkn0Xt58QL9ZJ7SzpLMs/dYbimO3GYgdCgIuPJFkONhLafTgnbn7eXveWiwGgIvL6yUnBBJAohwieLG9PgjjSNGHlE/eIY2AE7c+fn0tfzPkv1EwgUib38+TEIguCZp0HCra8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8JM4FkH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8JM4FkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D37C4CED6;
	Sat,  8 Feb 2025 20:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739046748;
	bh=NT/2QO6AYL9oqziUnAgRvQEAC2Q/r3NLLYAmL7/v+UI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=U8JM4FkHzfOGFwDrdiqxWK8chckXbbB2i5ZmVqpn3W0AGYHSbyBG0va10GCz/LNWR
	 7zdFzXZtAusKGOltzN5xoIuXPB00zivehuNLius9UcHnpx6rnq6p1gkejMU0qBHGwY
	 0V7uSub+abonudb6NTCklGiTQ8nSOqGpHC1+BfmV4RsedULtRsW25JtQ7xAXau9fm1
	 ddVOss18bddVmRFQzzSWgzStb2ZCd6dPagBDvcc0D5ew+hn4eJ4dWe6Olqh4VaaNHn
	 SDjP4+O4HNGAfLtYcqML6ks4sYTRJ/MjaRgmYJmtcut8Q2CyRQPGLgagu0aLOgum/f
	 zPKRmJYiCxz0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D3B380AAF5;
	Sat,  8 Feb 2025 20:32:58 +0000 (UTC)
Subject: Re: [GIT PULL] ftrace: Fix function graph notrace setting
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250208093927.3be357ae@batman.local.home>
References: <20250208093927.3be357ae@batman.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250208093927.3be357ae@batman.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git ftrace-v6.14-rc1
X-PR-Tracked-Commit-Id: c8c9b1d2d5b4377c72a979f5a26e842a869aefc9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a0df483fe303e0c87a6d4a4f60213d5f8703c5ae
Message-Id: <173904677677.2654177.12095827660419378597.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 20:32:56 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 09:39:27 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git ftrace-v6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a0df483fe303e0c87a6d4a4f60213d5f8703c5ae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
