Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFA121E0A8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090296; cv=none; b=p55ZxaHFzRDQJ/+NuCrKjkqbKMpQgD9vmxy3sXUa8Lx3jSbIXrr1Vp+hlU8C9N+uT/z0oidoyzzlERQQPyN00PMzHL5y225Sc0O8cCcOQlW26k86HRcfWFSWtdlWkKhE9A/0ibEkyn6zLnKYMTpRt8vb1yfE5Q1lf19v8yfXSVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090296; c=relaxed/simple;
	bh=/7XqCp0wWU6D/C9ZivcTOm30N0eSnHGP/ES+Waj0eNo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pZOrgOkeaDlzDuPbcy/mg6dVyBC3OsPALqACDRJfKCnZIsHwWdLyytEWXyGS1LRSNtR2clwARgqBNXeJMPVd2INe2VgiOvtgN8CrcZ2w/RZzNM7nYl8XwFOlEQa5Ub8eS+TY6LAZWmBZ1ejuoc/4NKbaWwZoEyIl9UhlclLkNVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fn1SyXZH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fn1SyXZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE97C4CEEA;
	Mon, 16 Jun 2025 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750090296;
	bh=/7XqCp0wWU6D/C9ZivcTOm30N0eSnHGP/ES+Waj0eNo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Fn1SyXZHZ0PHUiYAHonHhUkOt4mttbWXBEwp5wuqFBqsZMKAZW9/VEYfih7n1GsMN
	 PWjy2QfBITjRdrYht3Ny09lsbn0rv5yOL7IJI1+1IxRyQeeY6bgXuF1NzRtMyFHusS
	 Wu+MWzSpeJmTDg5MftXcdLKLfvw6yM/ysfqVOxBonLg6gOWhSw11/DZGASSnb9dacC
	 4VQqJ4flXAuyxr7CVWvJ8fJAYluTEq08M4FSIk5eJuIa5L23PzzgJOUuIMr4uBPdQe
	 IUWw1k4b8M9sw3B3uTDW2uw9UyiOXn3zm/6ZlJbb6V/lMAoux9DYGZ9twwf5DsI1eN
	 JzP7w9KgEaAYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FEB38111D8;
	Mon, 16 Jun 2025 16:12:06 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <81e04fa6-2870-4b0e-82aa-602f9435a848@linux.ibm.com>
References: <81e04fa6-2870-4b0e-82aa-602f9435a848@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <81e04fa6-2870-4b0e-82aa-602f9435a848@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-3
X-PR-Tracked-Commit-Id: ab107276607af90b13a5994997e19b7b9731e251
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44a5ab7a7958fbf190ae384b8ef252f23b840c1b
Message-Id: <175009032488.2413506.5328344768668554411.pr-tracker-bot@kernel.org>
Date: Mon, 16 Jun 2025 16:12:04 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, j.ne@posteo.net, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, nnmlinux@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 16 Jun 2025 15:20:48 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44a5ab7a7958fbf190ae384b8ef252f23b840c1b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
