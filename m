Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C501A841A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749307235; cv=none; b=gr16WJ5g2Hu07oTSZM1gkDitkqnlxTPV5l1gqwCoWWcXKlpRc//WK8CX5WVShSzQIy2L5LUNJLrjw0ptliH93Nk4u7Y6NPCy1qdeU9eBbpu8Vi0AzG+RXs6TAXGXDF7g1iFm0szEdtIXRwleOPoyIBcf8rljGq+XmzfUyjS+jUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749307235; c=relaxed/simple;
	bh=yXUT3i0z6a8WQl96H5LHFhs7mbe0fZvd8f3Eywv3fcM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Arxlc82REk36/e9ow9d5HuCZs60/871etNB5QIJic0F2o8NOrRWIrYLDDehY6zdiGBgzfDmhqa0Bmsx0LOIVqUv2mGpc1oPuZLgHJdLWcRZ7k7kxz4XRTn1+FcV6wb0yRNXt6ZXcfbUWWK+SDcyoN25MQiGKPppMIxj4grdguXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0s5U68L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0s5U68L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7C7C4CEE4;
	Sat,  7 Jun 2025 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749307235;
	bh=yXUT3i0z6a8WQl96H5LHFhs7mbe0fZvd8f3Eywv3fcM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=n0s5U68LRd5heC+3GkXG4iqV/Uahx4l4Pan+aqGayY7SKbSbisvIHtD0DRasEtzf1
	 jyLF/wQeVj8ZSy8xmmScMNrg2BpywZh3h6sW3kCZGw5Pu9KBpsAwX9Hgj2FLjJNnuC
	 Owmvjj+hy9/7b8+vcGzhxc6UUH9YtNP1hVq8N7sGjbf6WCRkB41rpApry1CiMebtQg
	 +avHq1lYX2bmXvRq5mjH7EfUf9eN0TKl6k/vJCZSSTXa+MhymKBMDZGKpr6IkgEYbt
	 N6M87KYHuNG8vmg006y+EckBxrS8f6TLEhxb6azVP58gAZDYIv1lD1cZxkpDm46jKq
	 1Leh5G4aP4frA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0BD3806649;
	Sat,  7 Jun 2025 14:41:07 +0000 (UTC)
Subject: Re: [GIT PULL] JFFS2 and UBIFS fixes for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
References: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.16-rc1
X-PR-Tracked-Commit-Id: 2b6d96503255a3ed676cd70f8368870c6d6a25c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b032cac622533631b8f9b7826498b7ce75001c6
Message-Id: <174930726655.61778.51942806686421281.pr-tracker-bot@kernel.org>
Date: Sat, 07 Jun 2025 14:41:06 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 7 Jun 2025 07:59:51 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b032cac622533631b8f9b7826498b7ce75001c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
