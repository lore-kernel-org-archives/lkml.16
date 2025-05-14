Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EF3135A53
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747247257; cv=none; b=KXip2MXfb+P+esY0W0tStshL3s02r3bA6cgqodjyUoSsXyQ02uw1guyVmVI+uHHVK3/eHkf+b45yX4/waAF/MOuzEvPpFTBilYCU3tH4cya0DAWx9UryoqduUPzlc2UHeemhNQ7aRFClF2Q5DgsAMXzIz24zPZ6N6x30KsM61io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747247257; c=relaxed/simple;
	bh=ThWe7bIm82h4HURFeCPf15PlinxCsAT0liHj8r9brTM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=O7Zwotd+hWe3v3AZrrhGFHJq269FNWNStEghIEjEMwUJck+czWSqSNDgf6jS/To60m6LIIO8T9ALttn3/GwSRHz2Goqs2wXYMhfqXAL6NqK1vO5HP/mHhW2Pg+gVUrLZDg5Ex9iXc8H7dNXSvotcfez+PA2ze1zYau9sz2eferU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDMhs9m7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDMhs9m7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F799C4CEE3;
	Wed, 14 May 2025 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747247255;
	bh=ThWe7bIm82h4HURFeCPf15PlinxCsAT0liHj8r9brTM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qDMhs9m7MDFRHFxKU1GQ6EEK00Tf+FKNkToa2ln/U7eboFlH6z3vB637B4Uus3kl6
	 F2ud0i50rJhKVwIozNoksC10ILXIFc25SgDIFTZC+puEkAKoCOWRpihbVAuU/W27GC
	 nxiYIHqPxGcQZRIUGWm58WLITDdJWvXPBKLrL/FrhNjKlGZgce8y6l3NiivKf/pOzJ
	 eBAQQh8etz6DVZcjsQ2uFQkZrGKB2oS5yhQu877MJgMAqM9Xv3MDMt0Ljj5+89fjTw
	 s914dt3BO726nApwUV/25WMVwUgqMPgUx2XEBo3kS162E/xAShGElq3aSw17fxff5q
	 U5IAs98yiEN1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0F5380AA66;
	Wed, 14 May 2025 18:28:13 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250514135839.5f947295@gandalf.local.home>
References: <20250514135839.5f947295@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250514135839.5f947295@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-rc6
X-PR-Tracked-Commit-Id: 1d6c39c89f617c9fec6bbae166e25b16a014f7c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c94d59a126cb9a8d1f71e3e044363d654dcd7af8
Message-Id: <174724729252.2465709.12627470131192461772.pr-tracker-bot@kernel.org>
Date: Wed, 14 May 2025 18:28:12 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, pengdonglin <pengdonglin@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 14 May 2025 13:58:39 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c94d59a126cb9a8d1f71e3e044363d654dcd7af8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
