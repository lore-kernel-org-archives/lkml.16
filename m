Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6358F14F9D6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743472964; cv=none; b=fhCI0hm1GVqWCXf6z130KGl6PcqwfxEP4R0pxkBbIrah2TgJ8tlEq6/GvzALHD+fLOwK2u7m5wcEtITOhNhdwGmjhNDN4gh0ZcezPst+kTwcczrib7plfnjhhC2E5BFf1ve7iHDx1qo0RDHEOGMaOsZjYclWSi93+dI5d0k/Xeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743472964; c=relaxed/simple;
	bh=kRekIgnvPaqaCbYcgrheX2xPk+xi9lJZYGUmXQuFvPw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kuaY7n8Oa++ojFUcT6EVi87MNnX5ey65AOHqF6TVI7VuoDquGvXrkgewzlxcS3+bLo6TXcwXC3R3a2I2f9EnBTwDuMtni4YZWHsWxnEw1tF0DD22JuvmcUNCvw33d3GXCXGxUQYhgMazi8Nr/ggyAxp5b61P+a5U6pG8R0MhoOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaFD/gv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaFD/gv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45ED0C4CEE3;
	Tue,  1 Apr 2025 02:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743472964;
	bh=kRekIgnvPaqaCbYcgrheX2xPk+xi9lJZYGUmXQuFvPw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gaFD/gv2EF/hLHpPKFF7XAdHF5+kA0QKItvT4vqBaGMbjmslizahPxeazHvr9TpJr
	 y90mfMahMLMO1BRD5gHiBeZQpa1nGkekEb/5F2P0YlJnwUearSrVbCG70jt6SsWu8B
	 pJ6Qs6hSdBeO3RoqR9VeDhMczmj1IHsu4RPoBpg7I5gqngwVl7TAgrAd9x5gobAoBT
	 TdqYhphcT2A+7K3rDipwVZl2TfmmUiqYDCGRJ5asBNV9ugNzhmzTx3OcpPm7hgeO1c
	 h32byAMGVowcezYfUhFMD7lBKtNIg1qKdiZzge/kSStqNO13aHR3gOiprbacpaExht
	 LubZa5ot9yrDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CED380AA7A;
	Tue,  1 Apr 2025 02:03:22 +0000 (UTC)
Subject: Re: [GIT PULL] exfat update for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd_E0eM8dfoU1HVQ+DW4YKMsrzfJbGTsQELjfy=R+omndw@mail.gmail.com>
References: <CAKYAXd_E0eM8dfoU1HVQ+DW4YKMsrzfJbGTsQELjfy=R+omndw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKYAXd_E0eM8dfoU1HVQ+DW4YKMsrzfJbGTsQELjfy=R+omndw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git tags/exfat-for-6.15-rc1
X-PR-Tracked-Commit-Id: c73e680d1f84059e1b1ea82a537f6ccc1c563eb4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 172f7c91674fb3e55a7a00cfcba76719000811df
Message-Id: <174347300064.206397.8999466173502315059.pr-tracker-bot@kernel.org>
Date: Tue, 01 Apr 2025 02:03:20 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, "Yuezhang.Mo" <Yuezhang.Mo@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 31 Mar 2025 20:51:40 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git tags/exfat-for-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/172f7c91674fb3e55a7a00cfcba76719000811df

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
