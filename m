Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE0D19D07A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744497907; cv=none; b=sMXohnqNryVATdj9ZRvE4pZZ40xgEoVwIESyFYjnregAlS+6UR3BfELe+J6WIUJKFoh0fo376s2lRJ5SjQflPEWwonJwYPLQofiRRaQkN6CpYwEUAjpeDspiIpnDY24lNny6xAUjN5okk4EFteOSdidmFwjaUTh4x/L4yEFv83s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744497907; c=relaxed/simple;
	bh=c+XDuQAh20mllYOeHX7FMEDe5eG3zq2FR50OsEhi8TI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CfOgnbReGCT5gWH1b6d9EAhcPmjtGJFh1/sDfLsIe3WX5QpWTkdADTFKwN45uNwhJGqgVv5+W9mWseUrk3IIdZjQDh12V8ZemG6DAAWKKtukpGeuUE3QTmgVSaU9ZHkdhrw+yWatI8oY83W7JVhyyP1m08e6qQKNCNYQ+lLfZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZPv/LKa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZPv/LKa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F2EC4CEE3;
	Sat, 12 Apr 2025 22:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744497905;
	bh=c+XDuQAh20mllYOeHX7FMEDe5eG3zq2FR50OsEhi8TI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QZPv/LKavW3SavWozDAyFQbhU/H6AqeQ0R31d7tsl+gTBE8YXhoxKSWslSZPaV3Uj
	 GlBaltTU7aZft3mROOca0mqR4WEuYrtyXeVi0ztXs88avTLTZy8ZWHOoZ9lKEFLGXT
	 3nwZAzo3dpk8bY2U/fsYWLNU0LQ6LQjuKKoYD9EwKGtvN2oVs8jCHyTFkqosGqwjTF
	 Mumne5J1uBfMXdYzhVb2HOQZeszTU1Us9ZJZcVLbqkPxh0O/EVuw1v8TVPCQ0VjiDT
	 psd/iaqyqgYpbF/TE9VGBSF9eRf2Y3RKQ5udcMXKwUafx17vJzx8tpLLKQRwo0y8Ud
	 qus0w8HfTKTYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE34E380CED9;
	Sat, 12 Apr 2025 22:45:44 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250412171514.5da58a6f@batman.local.home>
References: <20250412171514.5da58a6f@batman.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250412171514.5da58a6f@batman.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-rc1
X-PR-Tracked-Commit-Id: 8d7861ac507d23024c7d74b6cb59a9cca248bcb7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7cdabafc001202de9984f22c973305f424e0a8b7
Message-Id: <174449794311.770041.1276225033915085078.pr-tracker-bot@kernel.org>
Date: Sat, 12 Apr 2025 22:45:43 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Chiu <andybnac@gmail.com>, Nam Cao <namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 12 Apr 2025 17:15:14 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7cdabafc001202de9984f22c973305f424e0a8b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
