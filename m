Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8D221FC1;
	Fri,  6 Jun 2025 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749240657; cv=none; b=VGvrN/H6DLnFRUOIn5+kvucPyrSV1q3yP1O5iwB+8cLOXPCrNHT0W0FHa2bLw17ZhdGKLVbatMFoWLA6HiKlcsllKPGgDoNet5NqOmifHW3jY+runlB5a/1tv8ZsL4QhRtmC1Np10I2bRJlu2uxoKfAgmkVeBy6KWz3ftTtv2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749240657; c=relaxed/simple;
	bh=eSh+JZyia4EdQ1Y3PBrOLZqesTXb2fkYWhoXK2grdRU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=En353q1yvSMB/N3q/WDr8JBShfX3Z+tQXqYVPjkyIFlQkeNRTnXZu373QmE6Y0tgluxtCLGe+DETJHsl/lHxR8NPHSw6acIvlVrRZgA68xwH8lUhft68oMySdJhKYn7wLwTtjvPic4Oub4r/LLHK9Qp0Y9uS0nxcBA5s5qDfKbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0wEEUSf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0wEEUSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C769C4CEEF;
	Fri,  6 Jun 2025 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749240657;
	bh=eSh+JZyia4EdQ1Y3PBrOLZqesTXb2fkYWhoXK2grdRU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=c0wEEUSfV30HjgbTyC4+q4Ed3zyINRPR+NKFT3xMmQTP5t6KpC6Lx7UACqZv98jry
	 OZ2B9oGUsN7ZO5oogt7eHQOs8ZLrPmSqyH6/PqYbM0TzXG1DrZbCF4OzoK1rJNhN8i
	 jENFR5KWeeayZXDFhgBeqiyUSnMdfYdgnLTME7mDCKkLbBXr2WdGltqv/6+sy/R/RL
	 p20UVqUhvvaUzLQyVk6/l/iuGUEbt/wUxFEh22dz4NCA93QhfwpCTmrznhfvAZY3R4
	 fw8RtzZr/e+h6rWp8OvXCJ/nrr1EYojBNdIHX2e3yUeYE+rchR5plNbZ9O8m9WhGk/
	 7rubVtAfNuGnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7C55439F1DF9;
	Fri,  6 Jun 2025 20:11:30 +0000 (UTC)
Subject: Re: [GIT PULL] USB / Thunderbolt changes for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEKpczs8HIdTz2mB@kroah.com>
References: <aEKpczs8HIdTz2mB@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aEKpczs8HIdTz2mB@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.16-rc1
X-PR-Tracked-Commit-Id: 882826f58b2c48cafc7084a799207e76f2c74fe0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c0c9379f235df33a12ceae94370ad80c5278324d
Message-Id: <174924068919.3964077.3034326566105316080.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jun 2025 20:11:29 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Jun 2025 10:40:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c0c9379f235df33a12ceae94370ad80c5278324d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
