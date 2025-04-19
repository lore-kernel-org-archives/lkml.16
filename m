Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565CD1AA1FF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745083301; cv=none; b=RUKnMZeztqJPJ51Mg7b1h4VKJmZZhljWO4FkASTFU87cQXLBQTp6+u5cYsb+rgur9lnVrP6U+aR8baCGf4gLQ/L4NGQSz/AjRQ6tPrIplWSePvAupY8qlAnGhtEbp3jUUI8CNODY3dLMIKkHF2Oj2Y8ABqP0VBa8TzxUZUJzkCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745083301; c=relaxed/simple;
	bh=Z9b6C72ckExhwVX2kMbn8zXvqTNAJi3qKlqGjjuGK4c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bKp6cXG2tZNjsZvS7p+vrcSkuktvMDkyx0uKnl/DIiHoQMlzo026ipFfy4GFEHE2KTtjLhrQCCd/YQWjeYGM2WFQXkp0BlGG4uhPW0oFe87XTS7s+Efbq0jXzXXSFAYwHg8wXi1KKC3psZL6W7OeVIOsMMi/gdQGPg0Sabj6Nso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJpNUOUo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJpNUOUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35190C4CEE7;
	Sat, 19 Apr 2025 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745083301;
	bh=Z9b6C72ckExhwVX2kMbn8zXvqTNAJi3qKlqGjjuGK4c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EJpNUOUoH3/HZeL2YBGg4XZdvpHWbk+rt+fPLdlWBu4W6elmdVii/cJDIE+MQuLhh
	 b22ACJb8aedco35HxIX8bQxG9qk13aJayIcv3eAoblsVAlQjCqO9P+8gxTITNwJ16F
	 3v12Yh0rTWifTDvpo7QAYYBRbugp9ZvGFtg/nhE4sWeiQSbFdZE2dfuXvWtkv3tXph
	 D/DNA607Ji5BICvxrJu8kKR/L95/firKYg1m9VXTykK0zrkVSDzaIxMJAP+8PgN96F
	 XhqT0QPv/iMnAsxsg7XHMhEfGp8rctrF7VGhDdthLRgXuk2+YHpCy3kZsg2IMPu71k
	 xZg3fEiBvRUJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFC03806642;
	Sat, 19 Apr 2025 17:22:20 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz_TQb0KRXAzverESVSPD1Ap5D=oZhab4tvYJ-XrwN0cQ@mail.gmail.com>
References: <CAPM=9tz_TQb0KRXAzverESVSPD1Ap5D=oZhab4tvYJ-XrwN0cQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tz_TQb0KRXAzverESVSPD1Ap5D=oZhab4tvYJ-XrwN0cQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-19
X-PR-Tracked-Commit-Id: 0467145fab3b3a7a1efd221722310fe32329b3da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51c7960b87f465d01ea8d8ff174e81dd69f3b2b4
Message-Id: <174508333921.507729.8223981949363052199.pr-tracker-bot@kernel.org>
Date: Sat, 19 Apr 2025 17:22:19 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 19 Apr 2025 15:19:47 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51c7960b87f465d01ea8d8ff174e81dd69f3b2b4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
