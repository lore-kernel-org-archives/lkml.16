Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B125D1BC3F;
	Tue,  3 Jun 2025 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748972730; cv=none; b=qWAY87enLb69lzUg20EENtZk8rJvWyFSCK93yTGSG8O85IJP0RnZM+81Hl67L8J5gSNBO44rLPDPuteyH09gxjRvOefcmbYtMn40dbeqJ2iisLgoijOU5Gs7WxPZawdN8pQZNiWyka5C31Wp8FhqItZsBsNBvf799iBPQrRaZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748972730; c=relaxed/simple;
	bh=wdlfOjWezkwk5DegUWl2HnqMQ5tCxvL6yZvJUIog08Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=f+9cJOOZIBrjf2siORM3YZJdjlULcC3ZUwhuw7T/NyH9vlcmS2mHdRXi2UQKJPIyFop/+tEKppSqSO5+gFqhcaj8VZbLTBA77ZUpW13e84LhV53ixIc419M+h81U2WV/RWBnZITRKrcbvs/H6rmN4IiLMdy27o0qvMBDpBFxdzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdsZ94YE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdsZ94YE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B95C4CEED;
	Tue,  3 Jun 2025 17:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748972730;
	bh=wdlfOjWezkwk5DegUWl2HnqMQ5tCxvL6yZvJUIog08Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tdsZ94YEGccxk8nwPb4FWUlKcmotuBT8aAbC1dYyxHQv8TpUEGQekWA0k/CCi00nh
	 hg+P/OgxGFSI3t+qC1joJbF1OjyrzdLvArX32mMB/QoyL8IxQDKpUKkiJflhYi+XjN
	 LbogSRDi0728OyTfQ5uhpMRRNlyQzF4ihpP3sQaqSyJoB5+xnWLjWvZUqPh08Si+MA
	 CuSzkccOczRZHpwxkEr8DC/HahOzhvPRubxUi00eOaXjwTTZi3U4TYi4Atd3DagCO5
	 pJD5BcUm1947YrICLPiPzlUjCA/TkWVzFyoJYjHcf5dXnInMXb8BAX4e+3PtOeGoMo
	 Eowi2Z0hsBHiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 373E4380DBEC;
	Tue,  3 Jun 2025 17:46:04 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250602192527.265989-1-linux@roeck-us.net>
References: <20250602192527.265989-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250602192527.265989-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.16
X-PR-Tracked-Commit-Id: 46d40b2479ab6417db4d7174f7a938c994435b3f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 76c21d225469780a005140037b6248e648f41ae4
Message-Id: <174897276271.1603771.15739427705587788262.pr-tracker-bot@kernel.org>
Date: Tue, 03 Jun 2025 17:46:02 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  2 Jun 2025 12:25:27 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/76c21d225469780a005140037b6248e648f41ae4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
