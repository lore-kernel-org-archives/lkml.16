Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B0E20B808
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748405929; cv=none; b=n002+l8quSzgb8O7nvNrXGYZIUXGnQdrmEyZGFEQEK+u/Yofyeqhf4Hg0lzk+QqFbKVnK41dm0jkTS/Evm0ztuzu7meLXgWi2hxDNGIf0Qo9G5o4kG/0u1TsTdCAAa6cypJRJHtrzvBp5iZafAvUE4g5Q08qxyO3QHubP3drN7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748405929; c=relaxed/simple;
	bh=e4pdMgC+nMwJhTGRXDtWREeLfkOD/hMlrvfK87t1TLg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oDfJMPtU1yHysy510O4gIA6+Y/wMopy5u6hzh1ryL3hX+SgcUEcz5o+KF+9e74BHY7TAY4JIGRKvi6MD5cHw+jtt1rpw5FKW41pwfs/oO1NQlJziuOKy7k1hlCJ5xaMvAZQRUcJR+1UjTDShh+DI2VPsNe5KuA4RkKiowxnyiDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkEA/S3+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkEA/S3+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147B2C4CEF1;
	Wed, 28 May 2025 04:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748405929;
	bh=e4pdMgC+nMwJhTGRXDtWREeLfkOD/hMlrvfK87t1TLg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hkEA/S3+acjBxkLM83IW5oMKBoNnI4n8vwiAd2Gi35yZkRztMSvN7WrkWIhhZovnY
	 MWfNmg8GuMPKNpthtadjkfmaUZfj2iNpBlzTszR/33ZIKvcrj9sFAfsTA9yIQLlhHn
	 FWAoUopKGT9K3v2h3lSzpArKU9duHgvtMSShws449Gm19zTYuF52akQxW79g2ib805
	 Hr0mfJv7gAx+R/ZnxYr86eZJ/zRRblNFtGGC5vuzCODNJP/mD3RESgvGv9o7pGAad4
	 Mj9WrBvnEmobtVGbOm6+x1ITsL5reEWNR1idInml1166obdqlvGG1x9+SXQhfHBzqw
	 uTDDMA+WKU2Hg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B8A3822D1A;
	Wed, 28 May 2025 04:19:24 +0000 (UTC)
Subject: Re: [GIT PULL] sched_ext: Changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDYZnzyBFzUn_EYA@slm.duckdns.org>
References: <aDYZnzyBFzUn_EYA@slm.duckdns.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDYZnzyBFzUn_EYA@slm.duckdns.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.16
X-PR-Tracked-Commit-Id: 273cc949655c70001778eb0b9e7db993df845912
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: feacb1774bd5eac6382990d0f6d1378dc01dd78f
Message-Id: <174840596306.1893196.1912607763437627488.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 04:19:23 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 May 2025 09:59:27 -1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/feacb1774bd5eac6382990d0f6d1378dc01dd78f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
