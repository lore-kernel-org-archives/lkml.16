Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F5223C8DA
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739045216; cv=none; b=ebZoTiMB6fBA8LbOzItyqYS8Z3YIBrxR5ruUYGDe2cCxDQhO6s1Ghvz8rBV8QLC5xTk6DkB4tGGHvpNU/WXtUc1PRZB6VID3WIsTU7QothrJSiyuqvo3iNq6zX2cZNj1YEgLWiueNVY3wVKOTGaE6EAXHR9XY3PH0QlXYf66CfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739045216; c=relaxed/simple;
	bh=9BNNisBUC50vvdy31w8tNIIWkkYWkkZvmJ8jpYQR3UM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=V102LL8fOpOtFsXJZtBcUkyKBDwEsy9PEEk7YdwhD/y01rP4P91YIFLLH46VlD7wiq/5IjiODZ6Aam0w8s53N3V2VvZZmGxwUUO0ytf3Z0PFBS7u4HxGdeIzrmIamAgyupUVPjgaB22AkgxdPYIUs+KMLU9JiN019FoCTgEdAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kELNxoLW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kELNxoLW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C437EC4CEDF;
	Sat,  8 Feb 2025 20:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739045215;
	bh=9BNNisBUC50vvdy31w8tNIIWkkYWkkZvmJ8jpYQR3UM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kELNxoLWR+Os+AgA/+2gU0WEhZCl9yVajp9OzuPkJ0mblr6yAxEE934Mn5fyX9eVf
	 h7+Q/KSVhGE00TXEr9be7mtsIyFJL7qcSU87uvz3fJ5YkCf1ggF9fItoIBkrHhEorP
	 JzITZVp2EapNNe7F7j0XNBRDhKC3lqfEC9tiANBO+ATULxNz0dyvWV82ncwnFGp6ek
	 WH/AB3xvmtwJph5qx38T8nqV7B4Me+D8TnIgSCCOU/CqadifegxcmQBWApy6xGzhOg
	 C8O1PKHgLpZwa5AmynqIkX9yQwb23IdGwaN9oTC7fsmZ8a+64iuMVaFc9wTKQrcmNz
	 wxOkFMJMhP3hQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BB7380AAF5;
	Sat,  8 Feb 2025 20:07:25 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z6ciDeTzQTHn2Gci@gmail.com>
References: <Z6ciDeTzQTHn2Gci@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z6ciDeTzQTHn2Gci@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2025-02-08
X-PR-Tracked-Commit-Id: 9065ce69754dece78606c8bbb3821449272e56bf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c7b92e8969cd60a585629cef8d19b7ef330bc171
Message-Id: <173904524378.2649139.2446982817160651783.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 20:07:23 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 10:21:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2025-02-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c7b92e8969cd60a585629cef8d19b7ef330bc171

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
