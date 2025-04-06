Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2FC19C553
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743961972; cv=none; b=FfP8NPMpj2P3h/CM94Fv1UimoqAguXjjbjxCMMZP0rdcuyORcXgjyFLzq2l2KTd0I1hbcBrHeTQ2eKjD5a5IeNHJFss87fadyZ66nHT7ICszvQihpd2v0IRc4bsr2lRQMbtCPjp/tRb1Ucr0huz+Qe22DKXdEhhnJwZ9m4I6Kb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743961972; c=relaxed/simple;
	bh=tBRITGJw/+xzVGqYeqAHIIxX0RH4h3bpJxYpapnLG+U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YvLxYZAlKoT6pfngskJzvtK7X9gMu3Xj95usUMI9Sy4CSDS/xD2x+ZE46pYKJuF5PAYbACfmXPafqOSZTYKBJcp5djx+JYoJGznlXVLiagLTqJ1ECy85CkW22cAffP/bk7BQb+0BjMdWfvr23ncr70p2Qz/gS9gTzVv7Ur27BYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwKas+MX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwKas+MX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDE9C4CEE3;
	Sun,  6 Apr 2025 17:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743961972;
	bh=tBRITGJw/+xzVGqYeqAHIIxX0RH4h3bpJxYpapnLG+U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gwKas+MXn2VYUHtompQe26zUbDI6Q4+HV3HYBYjGahYxmlI3F5RgyZ41NDmsnwT9v
	 tjIZd/kLSAr6ACRTki7mfkuq2Z/LbWYZDvnnj2miD6L1SHY1qRoyJ2GjYGaQyQ9pr0
	 yBYyeR8TvLtk/L9+vk3ge72EdG9yl6xrIlYASlff673WClUr6HPY2cS0eSaWjGGfY+
	 cRVXupUmckIqyDwN0+DCTMNxNPyKmgJF5yZPxBH9i/mv4ZvIvD+DbOH+2bl1jF1mJu
	 nRfJGAzE2LO+516ltVmXUw2mJHLGarYv86tIt83faLQBxubXWuMK8Rj++YZE3MNg2B
	 sqp5mgCG0V42A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCCB380AAF5;
	Sun,  6 Apr 2025 17:53:30 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z_Kyms8NphwAtcCg@gmail.com>
References: <Z_Kyms8NphwAtcCg@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z_Kyms8NphwAtcCg@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-06
X-PR-Tracked-Commit-Id: a3c3c66670cee11eb13aa43905904bf29cb92d32
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dda8887894965369a87ba27320f6b337c4cd9e12
Message-Id: <174396200937.3925571.3973156405341800623.pr-tracker-bot@kernel.org>
Date: Sun, 06 Apr 2025 17:53:29 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kan Liang <kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Apr 2025 18:58:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dda8887894965369a87ba27320f6b337c4cd9e12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
