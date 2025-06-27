Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFE1362
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992216; cv=none; b=vFqb+YRG4S6Pns17j2aX024ZLzv8qkzi5KNLT0wTmRHtN/3C6TUyHinv5x9nIEwCe3ryUJD0hMBzQap5rbyZwv53id9wzyZAjOr2rmGs1gHYHYO66sMElqcVL/foVuYWL3wHeE5DUjfhJAcAf8sp17bJkBIR1q7dvQy5x/oqtCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992216; c=relaxed/simple;
	bh=n/nstBsO1bgKBTSEh4ZMaH5ZH0MJ/EIw9FCOKOtoaSw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rGfiiAqli8NxSIpNfzNeO4DVLpUFXt23YnylumRejom3cGivK1rMLZggUTpOvFzxNheGFP2bzBNnP3slhwx6zGv0+OHF29hec5nn0C52taOlMzk2GCLu81E2yHn0rRl2V6ekwIL1XIfYHvTi8ZrePPooBc+3pydIFzbrDXYNuiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aj/dP3OP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aj/dP3OP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11806C4CEEE;
	Fri, 27 Jun 2025 02:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992216;
	bh=n/nstBsO1bgKBTSEh4ZMaH5ZH0MJ/EIw9FCOKOtoaSw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aj/dP3OPYwe6gTp8ajqI66LiQ2tyFvLh25zBIxaWJAq2fNWmxbq1ItE4pDMLr/pZ9
	 wQB8ud2e9alS1027Hax1SrHdxHh7cUFlQVS2ZLr0Kqfl6HqkTbgzETl+1f0gjMQJIS
	 r+IwvT7aGoJ3q69vxeM9h4xQuW9ma5pt9IX+dfr/T2MEUTN38OdC4+sF1UnfAn+J57
	 ojWSPEqzQ0FB6dJYiskKA8hbZ7/cRkFyZ1L9Shm8J6zWZwczJBjAME6R+GFBBMQ4+W
	 Td725AtlXbjFomutR1UicfTtc+xnH7qdKm0jFhWwgqH1AwPE2UFv5w4WW4dShNQe9V
	 QGnjvoKq8E9OQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710553A40FCB;
	Fri, 27 Jun 2025 02:44:03 +0000 (UTC)
Subject: Re: [GIT PULL] HID fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <87p88249-s198-rq33-77p1-17qnr911436o@xreary.bet>
References: <87p88249-s198-rq33-77p1-17qnr911436o@xreary.bet>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87p88249-s198-rq33-77p1-17qnr911436o@xreary.bet>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025062701
X-PR-Tracked-Commit-Id: a8905238c3bbe13db90065ed74682418f23830c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8a20830f2dd180064f25254d9c55beb243fe9223
Message-Id: <175099224214.1407206.13630347143954633918.pr-tracker-bot@kernel.org>
Date: Fri, 27 Jun 2025 02:44:02 +0000
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 27 Jun 2025 00:15:30 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025062701

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8a20830f2dd180064f25254d9c55beb243fe9223

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
