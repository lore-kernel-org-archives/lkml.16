Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A924B280A29;
	Tue, 27 May 2025 18:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748370604; cv=none; b=CCsFTzUMpmHQps2TcXOC6QLE2WONyQaO8y3axrHvsrSa95P/VJufa8zlG/F3hafIWSlerNDxN1+sFBXLe1KPQfACQ3XwEwd3qeZ4SQmFTYBER3LdbnuZ0W0wSNyzHOKQDQe6yoEXX2k9IMTIwj15T0/MH0jIdW9ImsndDyFFAE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748370604; c=relaxed/simple;
	bh=x8nohniNrv53iKOKTJFFfJIzJ6uEbtiV0a4buh0VcwI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NRy1QGu2rM149KXrwmeVuwWTu+dfN8luNAKjZOaxNoLSUiNgoH29snDsKb5eSKE17IkJEC5mYDNka4kXsZPraoG9Y+3RU6nf5Y3RhBgFqCldQgd9PoE38Rd6eC+gSaXjwArYiwbtGubKDAVphMQClXs6B4DZsigqtr/AgFxcsSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4GgRw+T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4GgRw+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803F8C4CEEB;
	Tue, 27 May 2025 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748370604;
	bh=x8nohniNrv53iKOKTJFFfJIzJ6uEbtiV0a4buh0VcwI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=S4GgRw+TXJYSiGcxDODjjgLMz0F8ke6o7FQ9iSyXfDcQkNTw5WEgTFxcds/RKlskz
	 cdDod5JvdB3RgtimpiKCGhK/5dWUL0PIXCKMT61DW6R+7ERJPcJPGxTVN8CVu8mb9g
	 xrNsOni/KHA8Hpz0Wdqvus3b8nauBOvKCOisifEIod/XqL63/DUKCo9BsHNCNMOjh7
	 9y4dDqC8HhTy/vb5WXw6ziYCUJQDUY1SD9oG0ZUh3gfqGlMk5GPWSnFu+WBWCln3ub
	 tkJsi9mXFYQZ8RwQyUx0UZU1csU3wgZd8nj6sOpy9WKG1cmpCe56h4f/ChlVtUYzc7
	 ytXSfL2iMTBdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB07F380AAE2;
	Tue, 27 May 2025 18:30:39 +0000 (UTC)
Subject: Re: [GIT PULL] LKMM changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <737fd7ca-57d8-47cc-b6d4-e3e701ffc733@paulmck-laptop>
References: <737fd7ca-57d8-47cc-b6d4-e3e701ffc733@paulmck-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <737fd7ca-57d8-47cc-b6d4-e3e701ffc733@paulmck-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/lkmm.2025.05.25a
X-PR-Tracked-Commit-Id: 5c9e0062989e5d2bd77b75c432b54e8ec7689bc7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95bf3760eb9ceeb93febdc280695347b1e0a89c1
Message-Id: <174837063859.1737688.403829334979452106.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 18:30:38 +0000
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, lkmm@lists.linux.dev, kernel-team@meta.com, akiyks@gmail.com, urezki@gmail.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 21:41:36 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/lkmm.2025.05.25a

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95bf3760eb9ceeb93febdc280695347b1e0a89c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
