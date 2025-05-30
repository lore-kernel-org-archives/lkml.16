Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215322192FD;
	Fri, 30 May 2025 23:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646985; cv=none; b=r+HoF48Us7JTxolVGGGuIBBlAzrPQnojYjXFEl+X6jZN32fpv9/xwjOd9f2vVhdrl3u7Cys11JFndl74+GBQJyYP/h+gGTTnh278bO1Ml0PAY+EMSF3hY2k+13ev6pncQy62j/F3c59PJPov9H/bNWtVo+sqEn0FAunNsSXDbCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646985; c=relaxed/simple;
	bh=4flk/FNC3OtUDVILBis9TnDY0W5zAWOKSOS32I0jVpI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qNntH4tzJaeAy9q8U8/xRQZCg1EaiBU/gDWE5+E2GozwGvl3zwUakrQZKQ8u1wNBhp8o5mYDg/DAJWrrEbYvnTlhc58Dekq7VQchFRqAvzPyO77+ijotA7fb+sYGf/l3gdvssLVTi3DZOJ0uGO/EfA92vWM2Ragkli/9Ypo2B+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gL+/T4iy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gL+/T4iy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9467CC4CEE9;
	Fri, 30 May 2025 23:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748646984;
	bh=4flk/FNC3OtUDVILBis9TnDY0W5zAWOKSOS32I0jVpI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gL+/T4iyHr/5fZD1wmpF3PHzMFrmwum8scwA5/L7tF/URpKmJZ7JxcsXooDUHF/hr
	 QJM+Vh53aA/1TDPVeJ7p4sqVOlKBYPBI78bSd8mkWss920BTRroPK93N1ddMhEHpM4
	 QnPuOhTtYGTyacDOX2Bl8EUtp1Xk3nfN/gy3n6iziWGR+y6ssHaC1fE5RoRfbPMD/x
	 El1C7xk//CIBqhWasKUygEdjZ9pUOlh0bWaWm2rx3LYRKr2TFa/bCCOY6YWVLwB5Yq
	 +tvcIxeK85rABDactixbK7ds+l4qnb61iCz8uaZuMKqlXIff+fSVGDgG2ZYHz1xkmX
	 MPW+7fYn0seZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B7839F1DF2;
	Fri, 30 May 2025 23:16:59 +0000 (UTC)
Subject: Re: [GIT PULL] ACPI fixes for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAJZ5v0iDrmG44NHPtDThtYkk-v3YOX-4yxJWC7SvU0Hjq-vWGA@mail.gmail.com>
References: <CAJZ5v0iDrmG44NHPtDThtYkk-v3YOX-4yxJWC7SvU0Hjq-vWGA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAJZ5v0iDrmG44NHPtDThtYkk-v3YOX-4yxJWC7SvU0Hjq-vWGA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git acpi-6.16-rc1-2
X-PR-Tracked-Commit-Id: f4c606df263b6de746412dee707bc4b590adf45a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1fbbb629452ca16909b440b9217a28f42202dc60
Message-Id: <174864701764.4165071.6283899760357092192.pr-tracker-bot@kernel.org>
Date: Fri, 30 May 2025 23:16:57 +0000
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 30 May 2025 20:51:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git acpi-6.16-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1fbbb629452ca16909b440b9217a28f42202dc60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
