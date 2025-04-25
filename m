Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56E62165EA;
	Fri, 25 Apr 2025 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745604083; cv=none; b=N05sekKdhEuHrcE6cTrMPIIS1qOLhveHR77kEjAJO9bJCZ48AP48SglioJpQrJWD3lIJPmfOEoDyo/SPYy6oLCFu8DijwFdFE+jXHryma2pPXoZ13Za1yHmAQjuiP4E27oMzQgirzUe1YKoWKNnPKflqLM9y/gTgK3CZq5VbtUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745604083; c=relaxed/simple;
	bh=s+nyFjXQgDn4BZDK4eLWpXsT627E5K2rVURqb/5KP3w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SQHAMFn5h75XmSiq03DfG57N55P2LDw9Sra6o5v721oX9fwCuuVAGi1iKvgGZ4DHld1fO0AxyEkhKU2bJL1MvvN12y/LHQ8Xw1AJc5xfhemiDGoaf08qGBhTHK2Kl/W98z3VGkb5+IlUpP6/3wf5353Liu8tzPmcc1F6gJZJ8/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPr1dgEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPr1dgEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02EAC4CEE9;
	Fri, 25 Apr 2025 18:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745604082;
	bh=s+nyFjXQgDn4BZDK4eLWpXsT627E5K2rVURqb/5KP3w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aPr1dgEoU3PqpiyI2BEI7IxswfZM7z0aAqLdE62JUuSfpinha2RvDsgZ1Ei0rrKFt
	 YRrUMielasak2Azuu6NB7yau6GH/qGE2xYQmfyU80azab0XrJ2hvC3z8k9MjLCu8Qd
	 wu+Y6ZOkQoo6LDKAfJ1FeDUHM5YMUulrIY4X+AaGNcY2nhME0CpYpY0XOxbc4JDvv8
	 JfSQK4m6nSYHIfXCUfxSCOMrjCAMLJOsHGkKSXhvpvQRyALaqOKxn9ehZQgUv5gF48
	 eEhvkTULMxafihDoVg7w5ixu13wB9ZRvv+zzKhAxpvug6lFwzRsuszfL3EZxPv9jHy
	 oyWLnn7CwyN/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE312380CFD7;
	Fri, 25 Apr 2025 18:02:02 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 6.15-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAuS1QXWLNwEf31j@kroah.com>
References: <aAuS1QXWLNwEf31j@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAuS1QXWLNwEf31j@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.15-rc4
X-PR-Tracked-Commit-Id: 3dfc0445274252301dfcf3980d79acceea6409d1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d5c7fe09739d49612e69ad61ced0a0f19651769
Message-Id: <174560412130.3790119.7245415882561197111.pr-tracker-bot@kernel.org>
Date: Fri, 25 Apr 2025 18:02:01 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 25 Apr 2025 15:49:09 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.15-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2d5c7fe09739d49612e69ad61ced0a0f19651769

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
