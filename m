Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6FE18CC13;
	Thu,  3 Apr 2025 01:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743643734; cv=none; b=QvHv/cDgFcatine55/H6IesyFZczY6vs2Vg4tK1H5vIoN01NzregIVnLJTKvuwhBhlZ2CaxR//osVB/420T73g0X6zuIuYd14DkCy69gVJBY08O0/y4mNBO2EjM7GPjSMKlb1sSp4yvlZ3mzJXgKtymzdFkP2uU9cfJdEJHXmv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743643734; c=relaxed/simple;
	bh=b03Pyrmz4MpYpwdwCgDfP4vrJhoBmahLBrQMs6lgj8U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OeknlPdgM/cpIReN4k0HwR1CYDPxyAK6sV6l7RVWUR7dxn3TmxD0PVEPpAlbmZaV+3UxyxnlRgdDqqOj+auH/bXQufkPrqS5WTcrzmgocYbAvFEuI7jRzREkKdoKvbM6v/LZnXGRGqVpoFILq0C8RS+7LMSryRV8Ob7myPGjgGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfNSa7S7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfNSa7S7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9C7C4CEEB;
	Thu,  3 Apr 2025 01:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743643734;
	bh=b03Pyrmz4MpYpwdwCgDfP4vrJhoBmahLBrQMs6lgj8U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RfNSa7S7E+CANzhLv/bBZaGmjrswFReNOLpBcTq9/RWUskC/8pkgaIOBhFw0qOQjc
	 l/CqwXnDjBfklC9Sb3fVi1FTJSQ51vjHhQ3H/oPJeZlqRYSr9GuBT9vOoYBPRlq1kO
	 jJYj1h/ZajtG+xba7v132Pfusxra2TKkWlvW0UW3hEIzK8gVkSDzw8xMLubz8zbvSb
	 x9n8fI4QRNPnnXQeGoXRe+inQPIouU2RXn9mhgW1aBdZhjL8seJnUs9yE4wdZo43H2
	 aE1BFF8mS5R6VY6ZHOYz4cmURIsuuL48DwafaPDyP/5i26HgTvEigf5Bw0K97y7x8W
	 MA8AIxq5SfNUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B7A380CEF1;
	Thu,  3 Apr 2025 01:29:32 +0000 (UTC)
Subject: Re: [GIT PULL] USB / Thunderbolt driver updates for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-2ZiogJ5hSxivJd@kroah.com>
References: <Z-2ZiogJ5hSxivJd@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-2ZiogJ5hSxivJd@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.15-rc1
X-PR-Tracked-Commit-Id: ed492c95f13a7a27f1c0426b33c920ad343232c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
Message-Id: <174364377108.1744561.14790219698027447785.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 01:29:31 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Apr 2025 21:09:46 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
