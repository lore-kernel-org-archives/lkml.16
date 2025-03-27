Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807187483
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743052688; cv=none; b=s/QxUM41oiFVkVCO51k+bPl1O+GkUYapD3ei9M2Z5dUwwqyxB7fKoYIf+AbS+oD+LJExqDU8sib1QAEpI2oPUuATuAGPXkjTaVK8ulZe2vIWErHlsmvcR1dBLbjcQnX3j96yR4w2kLffWW6FeyDuoRPCVQvuGUqdYj/tZLaT9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743052688; c=relaxed/simple;
	bh=MUEkhbrLah+qUnwXOqxIDqCRSSUCPTPdGTWUp273+Jw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=d8abDbc3ouuSJyAPhvOS41GXAgr2MPaNqVS+VseZKNYjVtpZIIDPt4QWh6m5ZLfoRrYlSfxu0PXgwJVQFg0F3H95T1mYck7+hq8BYpl+SlY7XZ+OWRyH89ftn+vaVNu6gNJ/tCWJntnXaUaXg6tm22pmO6tSa16Iy+DTsq12cds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtPkMfEZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtPkMfEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F33EC4CEDD;
	Thu, 27 Mar 2025 05:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743052688;
	bh=MUEkhbrLah+qUnwXOqxIDqCRSSUCPTPdGTWUp273+Jw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FtPkMfEZGZqUNhAzNwkU/+TTIQhdAuCHozhh3aiilFP5tdF7eLKbL5XI9+96KePbF
	 oIrEtLKWCIRWA8zA2URTqPpfTcHbImY7oQRkWWrWKftGqfhKZI/HWsCF5QJrSl3uVw
	 Dv9fZYgjLi43RGScdiDL/BKFV7I2BDbvMfVlrp6G9Fd9d9Co9EvaF6Chce1WnYaWpV
	 Ngf9NYU/Ic7w0Ky/kkYAlnxJiEOrcIT1g1FjxIUgYvQ60pZgtvDekj5MTx+XJx6CNc
	 wonHlWFO1644YWQfygMjqZRO4OyqInb8F89pzrOZN43mxQEunLJ+WSOmOd2tPtBCLY
	 XpHGHbbYFQMjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF5B380AAFD;
	Thu, 27 Mar 2025 05:18:45 +0000 (UTC)
Subject: Re: [GIT PULL] zstd changes for v6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <44A5CFC9-5B88-4910-9674-BAEDD9969165@meta.com>
References: <44A5CFC9-5B88-4910-9674-BAEDD9969165@meta.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <44A5CFC9-5B88-4910-9674-BAEDD9969165@meta.com>
X-PR-Tracked-Remote: https://github.com/terrelln/linux.git tags/zstd-linus-v6.15-rc1
X-PR-Tracked-Commit-Id: 65d1f5507ed2c78c64fce40e44e5574a9419eb09
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e61f33273ca755b3e2ebee4520a76097199dc7a8
Message-Id: <174305272453.1585001.8620274847370523188.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 05:18:44 +0000
To: Nick Terrell <terrelln@meta.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nick Terrell <nickrterrell@gmail.com>, David Sterba <dsterba@suse.com>, Kernel Team <kernel-team@meta.com>, Ingo Molnar <mingo@redhat.com>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 02:20:52 +0000:

> https://github.com/terrelln/linux.git tags/zstd-linus-v6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e61f33273ca755b3e2ebee4520a76097199dc7a8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
