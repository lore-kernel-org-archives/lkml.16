Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003DB14AD2B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366749; cv=none; b=tGvcwcZ+g7Ldkr7jdBrdaoGyW3XjsYw8KqRXCUkm95qwtBN1Z+dLT4zHIE2KCm95K6/0dxAFIO9/CIJVS8j3kNXQm5kv3i+8KFb3s6k/ghYBYRzfdcnQui5Cqt3qZ07pttuPiWACxoaNMqbMqmLAYlSxxPoMvWg/fzKOEIiOEzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366749; c=relaxed/simple;
	bh=x3HhkUN5vZO8GA1jPqT05OWCV0Kb8Ba8GVXsnHU5TFw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=a54E+tpom6mRT5lmI+dFQJVqjkQLvRv9FGcLfR1mhpFALb/XJd9AIyVU0qt0N1pK9sAcrzho46A1vUDe4Ra1K2LwZQpMzmSA8jLdH/WVT8x/gb7lGDep+X0h5oZ+FZNcL3uUCckIotYNXOiBfLZvxK1b4MpT8K8zWxgUpuBMVQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b77KfT/J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b77KfT/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F88C4CEE9;
	Tue, 27 May 2025 17:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748366748;
	bh=x3HhkUN5vZO8GA1jPqT05OWCV0Kb8Ba8GVXsnHU5TFw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=b77KfT/JkNy9Q8Cs6PkPJ0g1DikOdv/wv83syLZQuxnceIZUoQC4iVjb77gcCLo4l
	 gjAUQZUuaLcVgxN5v+G5/T1KI/adEiZjgAJIREdqGybtHn4s+GgeSl0iPQfITFkPEb
	 P7pHzTdwD9MVHYZKrE4s9Bln1maZte2bDEPiBBm0DJy9gR9nhvb3iZOzi2U0/SuYdS
	 S65lHXM79/ZHKfTSO50y4ySzQzqff9oL1Wr6rPr6QG6yz7zu1O8AP+1IQyhq2YaIDY
	 2NEqS8d5WWkooEDJIEYCezIJ6S+RJmsrHjrFi23bP+UEJvUR6w0YDllSoThlQwJSNC
	 /2RmlaDPl/5Pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADE1380AAE2;
	Tue, 27 May 2025 17:26:23 +0000 (UTC)
Subject: Re: [GIT PULL] x86/cache for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250526121550.GAaDRbdu2IYM7xuwxd@fat_crate.local>
References: <20250526121550.GAaDRbdu2IYM7xuwxd@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250526121550.GAaDRbdu2IYM7xuwxd@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_cache_for_v6.16_rc1
X-PR-Tracked-Commit-Id: 54d14f25664bbb75c2928dd0d64a095c0f488176
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 664a231d90aa450f9f6f029bee3a94dd08e1aac6
Message-Id: <174836678242.1718433.16390418611429644422.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 17:26:22 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 14:15:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_cache_for_v6.16_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/664a231d90aa450f9f6f029bee3a94dd08e1aac6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
