Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C323C2080C1
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499216; cv=none; b=G2ArFU2Bx9eOeIlFKp+WRoXMHRIzegbFlfSVLOh7AmyxBqGaXL86m2tR8rcCTJwMwsPveyxn64YdC1VTnYMNqPbS+6/N7yXJLb3CQ9fzLIMWXR8o5kzOY5Uk2NqUbsPkjN9LpVW4FS3EL4AaUMe713ius4BETx3xlIJW0gA3m9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499216; c=relaxed/simple;
	bh=8nSyOenatLpJ7rD2pqKIQXxAtZ8RuFJBXjErFjIqcto=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hCcF0FZVPiFFsSsBvJGw0GoDJPVK3cpyZ8AqbalwoA7rFwMzrazbS7j8F9EyZW3aFU/45woQg1bH6f4oit26rt4ksWb5PoOpJ2DlgaN6tOTq1eehf5MBxqRZxztaPw8wyU13PLs8apxPdcKvuCA7/nBlwoX4NKFiTtvXdahZUo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGnh0f9L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGnh0f9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F13FC4CEF1;
	Sat, 17 May 2025 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747499216;
	bh=8nSyOenatLpJ7rD2pqKIQXxAtZ8RuFJBXjErFjIqcto=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jGnh0f9Lw50HgnzylDG5UaCs3obxwP2NQ0KsM32XjaJMqdKFG4tUkTA//KA4mmu46
	 6cywxXy+Y+IIN3pCliSzM2xascUHXPx0kfnyqovuQuSpGCjg+X7i9YALuQQdWHQK18
	 zvpeRjNLmEV+Yk6yksBzA1GOlgr+lJCcxZl1ZXz1RcDh3VZ5vQJh0eDJIbAXNh0mj2
	 0CxCooEd8CJA/1kOVX/+pHJb2W1sYWpi3gpWKsIF230sD6zShViUQfqhVDtsSerW19
	 zsoALoSh7KHu14VADKeVKGTaHhLooaLeqhL/awEepYnq9WAn3JM4gvO57dxI7xr93c
	 zAtW/LH0Jxn7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711AD380DBE1;
	Sat, 17 May 2025 16:27:34 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCiOmGAbtcGdc2VC@gmail.com>
References: <aCiOmGAbtcGdc2VC@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCiOmGAbtcGdc2VC@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-05-17
X-PR-Tracked-Commit-Id: 99bcd91fabada0dbb1d5f0de44532d8008db93c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4bcaa590098cee78b3fbe118df1cfc3e614b3ee0
Message-Id: <174749925309.101931.14141115380106323810.pr-tracker-bot@kernel.org>
Date: Sat, 17 May 2025 16:27:33 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kan Liang <kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 May 2025 15:26:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-05-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4bcaa590098cee78b3fbe118df1cfc3e614b3ee0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
