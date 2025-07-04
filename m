Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365D52E0936;
	Fri,  4 Jul 2025 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650580; cv=none; b=WNJ3k7C+wj528Hs/ccYZTe/1z375/jEUe7wvaq86pAN8tsRNtwoqE7WAPLrUWycoAgGdp9CEvACkg2ljKry9vFedQD+S12PCVFgZ++IrOaMgHnELG82+PiOCSYi/6QHEgIpWcNKFjWR6ygvkq6SOx+0hGgaynG6/onUyL+7T1Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650580; c=relaxed/simple;
	bh=tQD43+XsyZ2Mog5uStgWOBm34qHgf0BWYQifXUOlWEA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QGtbqlgLnLcGAD7xZW0DB3HgkIE+8h+rCag6VI4+PjtAxpCxI3laX/9SA3mYzu2AJmFRj7q2vvOix80GFk683Uqn7/ZpLiukzwJRSm8pYdlXAd8N3aqy3uLpUYu2KVhDDTlwdO6/PTR/+llosJU2jyrqzHThrWnKl4FUri9Awkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3YiYHN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3YiYHN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73BDC4CEE3;
	Fri,  4 Jul 2025 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650579;
	bh=tQD43+XsyZ2Mog5uStgWOBm34qHgf0BWYQifXUOlWEA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=b3YiYHN8NnPPHpfCl93sAQ7xgXPK/kCjAfjTQNjClm+QIMUbw7wEOpwfWIy76D3U0
	 8lJXs7BRxhSNo28aXorpv1U5+nFzg9KYw+0yuDD/YBHH6YfJwfYV1RPmg3sW/UcGR2
	 dFcBY2xfztwkaUVemi8p9uiZI24UAhiw7x2RSkkkUp4EWdTFCjrOLreah4YqHlpy8E
	 8YgKdyjTJ8Cy+qHwLebWLML3JmhKMLGjvefuPJkeKnzPBAUjCJt3Hes/KseeTZumj9
	 TMXbzDsX0AFaS4Lfc47x7PcCGMeO8pIWvdpJq1dMESEss3ODfqqSvmhapobqKnZk6c
	 7QQv4i8yqcKRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BBA383BA01;
	Fri,  4 Jul 2025 17:36:45 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <aGfkoTIQaoylP-Ul@kroah.com>
References: <aGfkoTIQaoylP-Ul@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aGfkoTIQaoylP-Ul@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.16-rc5
X-PR-Tracked-Commit-Id: 9bd9c8026341f75f25c53104eb7e656e357ca1a2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c2bd251d2039ce2778c35ced5ef47b3a379f5df
Message-Id: <175165060388.2287194.551018231553988939.pr-tracker-bot@kernel.org>
Date: Fri, 04 Jul 2025 17:36:43 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Jul 2025 16:26:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.16-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c2bd251d2039ce2778c35ced5ef47b3a379f5df

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
