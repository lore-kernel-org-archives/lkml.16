Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FAA188A3A;
	Thu,  3 Apr 2025 01:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743643732; cv=none; b=fsGNYKlpk8T8HPRN+B3RvZLhi5yZOmmQikTa2z17/vIki8zIRpWyysV2yGnDK9/jYvV17Qu3dQhBSfDlaCzLgqIsuaU/yEE7KYhqcOJYGSZ5r/BUg3KQkKpjTksuyFei7PgkMBLM+mpaxS4+HxehMKjzGn/UP7H2dkpr/zOEKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743643732; c=relaxed/simple;
	bh=ccnB74Fd9KhiFI9JtoH4zZbb8n9uGUZ8PukgLa9Frdo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WR7qyCDNdk6pUw2aKogGYv5FD6qOtBx+7kWijZBbu7jS3w3KPuCtI5x5g6ZKmymgkIdenkyhIr1sYrp3PjDqmm45hmF8j1Kx4C+t3DEfL1bdJfV3mhnhR7A6pXfJUBRh12DwyBoP4GYPuGiG1BjeWEbx4WD8nEGXU6H+RVks0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTprFSCJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTprFSCJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A669C4CEEA;
	Thu,  3 Apr 2025 01:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743643732;
	bh=ccnB74Fd9KhiFI9JtoH4zZbb8n9uGUZ8PukgLa9Frdo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OTprFSCJXOKz2uNcbqxIAfZ1nbS/hz+o5cPSoawAY8Yi+W+XksYBOEFi1hQCNCgOv
	 +5okWnCrDrxYpjkRCmvYb/4SSVoEYuC6AwKs/BKEAgbEpV4PGTaWBnao16W+Vsmz8m
	 j2yRRhaAGengkrpPLmsWJ37ldbfzqxOO4SynelG3p8iClu/c6abAVn07DcLhYrtsN/
	 uKt4Jyt/IrLbjLxk1Z0NL94WPQYv1IfziPcgRhJnECWWbXEf2tpJUin1o2c+S3YUW3
	 gAqvewMD5o90BJLJkUDk43v46jYNQHqmkVAl+5RQvLXnaMLOwb6WU9x1U1DZ2BxxmI
	 FHw+sRFDXUT6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF57380CEF1;
	Thu,  3 Apr 2025 01:29:30 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-2XfqNIBsMRR1Jp@kroah.com>
References: <Z-2XfqNIBsMRR1Jp@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-2XfqNIBsMRR1Jp@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.15-rc1
X-PR-Tracked-Commit-Id: 3b23d31e569ca19b7bf1059760b879f61cd71ded
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25757984d77da731922bed5001431673b6daf5ac
Message-Id: <174364376934.1744561.18386999029027216847.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 01:29:29 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Apr 2025 21:01:02 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25757984d77da731922bed5001431673b6daf5ac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
