Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F582563
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738290736; cv=none; b=e6hsUHD3ebPT/X0GyqoaGUYPz+bjSIqhX7pfu/vscpgj0AampTvI3hQCJXYau0zvRi8/XBLjU8ZOVuqmB6nBlvirvMiPbl70v0FfLvGPU49xVk79hn4kGiJE2vEi/Ie/KVFGR8e3oN5s8heEx4WEHM8DzfcMbshx/figECKhfYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738290736; c=relaxed/simple;
	bh=n0btgpOVEaK9cjwukf4WHWCJO7EIm7N6TtbUfHDZzrs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aaiORfJWwjjzGq78WhpA5TzPN5wn3DGQh+VbIH+A+5BDYntABcGKRJPv32g7FzHLwiHZ6XLuWOOP/GiLIkYbA0cdcTERkPOGlNsfv2X//dJwPQJ/Rrx1ACbt+nDqdibqMrT7E3C58i52MtlAUyzShL4dp/DRtQlCCo3IeNABlCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ptFkiomq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ptFkiomq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E25C4CED2;
	Fri, 31 Jan 2025 02:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738290736;
	bh=n0btgpOVEaK9cjwukf4WHWCJO7EIm7N6TtbUfHDZzrs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ptFkiomqfP3SiGihfR7YUQ1ayXpAzY68PPj02vc7bqIUWtY2EcxPjiafCLqzR46GN
	 n+WsSJmM1R0tIpBlj09D1l/JcbaCuXNSBrAtJIJwNS6q3J2cMFzRxdb5PMuuJ3/O/z
	 jN12UGah959DvaKaRMGsLvobpzOMEJpTj72UsWV0WvUiipvl/zOHXfC9OD1rYOilAo
	 EOfBgPm8XvyjmkkBsAg7cw3UsyLf0Dr4cVBmxV+5nQg4gzz7K+orrkQE/eSkso7Pcu
	 reYGJHOymJwP5dJSaCItsYno8VpcisszzLZbzZDLqPutmADEpbBGXaqLzmW+Yx0NR0
	 E0IUGKocIhGlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2DB380AA66;
	Fri, 31 Jan 2025 02:32:43 +0000 (UTC)
Subject: Re: [GIT PULL] UML changes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <1821733080.304331864.1738275118129.JavaMail.zimbra@nod.at>
References: <1821733080.304331864.1738275118129.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-um.lists.infradead.org>
X-PR-Tracked-Message-Id: <1821733080.304331864.1738275118129.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-linus-6.14-rc1
X-PR-Tracked-Commit-Id: 2d2b61ae38bd91217ea7cc5bc700a2b9e75b3937
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69e858e0b8b2ea07759e995aa383e8780d9d140c
Message-Id: <173829076262.1153141.8687646823693580370.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 02:32:42 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>, linux-um <linux-um@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Jan 2025 23:11:58 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-linus-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69e858e0b8b2ea07759e995aa383e8780d9d140c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
