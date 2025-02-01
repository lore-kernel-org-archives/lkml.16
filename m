Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C52C1CDFB9
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738440503; cv=none; b=WPZuBRl5HU3WAQJqsxqrAhmPNifxhZyW1GGx7QUdpbC8G1nrFPpJgUcrtOtuGP9ZwIB+sA3qbaod3pMotmxJNTe/0RvDduseUKrRdV+os0VUA0Ftq+YOBytbjeP6Hh05ymcub7jLFvTaNtKeImEDCl25YPpuasa6l1mBhbCgQNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738440503; c=relaxed/simple;
	bh=XyGGqdb0Ke1EG4ltXb/k59CLgJ3Z6RdLJNIyYvciqX8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TwflbgOlspsJ6d61+uFKXU47OTijz0NKaR+2OZes2xULXsf7KZKheepHf6rqWwoXBNYuUVFV7kiPCEsLAwpN08H7VwlG/coQGj/WVQ5KTsp6KletcIlfa3MJUiyGErLBzQRpqz44aK9MpeMdl+astWJIBpCZoTjLId86zISDytI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oV9ytvVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV9ytvVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B86DC4CED3;
	Sat,  1 Feb 2025 20:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738440503;
	bh=XyGGqdb0Ke1EG4ltXb/k59CLgJ3Z6RdLJNIyYvciqX8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oV9ytvVeF/M9IR2/zwBZ6KHlKhcCRNaR6hs/4yqipzOUUWHpZdRi/k/cxMUTYw61y
	 7SiIH/ADRJVaqExonU+Mzm8994vbzo2pHnOvxFT0Q1tuze8jHvCWAACd6uCnV6e49p
	 gOL4TImrknu9UBHptbWVoa5D5IITLKIZ3fYgIC8eVKvSV9obBYRiLuf+CXu7YhCkE2
	 LbroPK36jaPxQL6msXKVY+cNLulVfHl3pyxo/Z11MSVWjwz5NVT12R5/eVwxc3of5D
	 Cbxww4/D3BMxj7e4Lf7g0tdQmXKofBSpXLuKZGXfZTcRYOweZRDeiDq5MFKxEWJWi7
	 qPpANHTwj/Gcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB01A380AA68;
	Sat,  1 Feb 2025 20:08:50 +0000 (UTC)
Subject: Re: [GIT PULL] debugfs fix for 6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z55HvQ7tLIU4V2_6@kroah.com>
References: <Z55HvQ7tLIU4V2_6@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z55HvQ7tLIU4V2_6@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/driver-core-6.14-rc1-2
X-PR-Tracked-Commit-Id: 57b314752ec0ad42685bc78b376326f1f4c04669
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8c198ffd6342c3c673058f55200eef75c17ea185
Message-Id: <173844052954.1982916.17808580304501333086.pr-tracker-bot@kernel.org>
Date: Sat, 01 Feb 2025 20:08:49 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@zeniv.linux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 1 Feb 2025 17:11:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/driver-core-6.14-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8c198ffd6342c3c673058f55200eef75c17ea185

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
