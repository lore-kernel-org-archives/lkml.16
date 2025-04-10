Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CE9276021
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294148; cv=none; b=XuZU4Ty/Fe8uboH27l8G+3PJCTYNGF13pxw18gJaOdKblxg7CkRniELlJQt5tNmrcvadgSTnezDrc/eEZ31BehcdN4hhXbV7Fgj9YPyHPn1pkKAP3L4f0+as9qLeg28UV0MXCcPD17Ni46bNH8gK/XLRWvMMj4l1KK3IVJ3lsYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294148; c=relaxed/simple;
	bh=RAvqgwOe95bzIaYDYX48bflXNBKKkphqE8oTRacCQjU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WfLwu6te47x5bzO7xIVw5dpDN8UR0WbR/U0FuYwp/Y0O4BBuXmvS+DCd9yAC6w0dWeU5m8bpZzlyzXUYdKCRIxoi3p2WajSBbWTn+ubLawN/CshD58/4WDdQbBGZYOCwOorFCofRZnFkd3IRuOZPCDSj3zIWcBEPKQcSx89/RIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tY9M0sOG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tY9M0sOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A21EC4CEDD;
	Thu, 10 Apr 2025 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294145;
	bh=RAvqgwOe95bzIaYDYX48bflXNBKKkphqE8oTRacCQjU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tY9M0sOGGMbPGNh8KOp8E37eYO3whlAejAIwHGttnmEzBvZgtQiB/hOspBMdIaW5U
	 cP121DxN9eToy2bz4KSZdyBqzF8foGcGcf6oGzUgokYGC/DHssU6bYqx3mCbfAyDmx
	 ffDZ+4x0r1zDNV9HWEiTxG28DpJIMG/71sMZRasFuB2H41qHQ9oMENz30l90ulF17P
	 mOoGDq2qz1T+UH2q7x7T/uwsPdwbGiC7yUQQ29wgv8dHhy5StfJ/f7mT9W0rAEvBk4
	 +Bbt2av4iucjlXQ5lVU1hq71odN6BVNIxqWrU6o5juWzrEjcf28bloZRqJBDFwiEyb
	 0r24qQKNsa7hQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0F8380CEF4;
	Thu, 10 Apr 2025 14:09:43 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v6.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250410090713.30027-1-jgross@suse.com>
References: <20250410090713.30027-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20250410090713.30027-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc2-tag
X-PR-Tracked-Commit-Id: 64a66e2c3b3113dc78a6124e14825d68ddc2e188
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2eb959eeecc64fa56e9f89a5fc496da297585cbe
Message-Id: <174429418245.3685623.8550379606264843082.pr-tracker-bot@kernel.org>
Date: Thu, 10 Apr 2025 14:09:42 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 10 Apr 2025 11:07:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2eb959eeecc64fa56e9f89a5fc496da297585cbe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
