Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119F328DF45
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452181; cv=none; b=bJ05D+61IKb+IctEO0h65wm13dcNZyW5i5LXxIZGqV7WLaE2lRdzK88t5ybEZbRXhmDm03kBEiUe2PifarZql78XUTX8lSWqh5hpSaOqTlp68yW0EOe7MY6Y/2mbacRGaBmL4FU3WwSiDm6rZPFPxp4UFjoIj4xM0MbiUNXlMaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452181; c=relaxed/simple;
	bh=BJ/ZgklTcy9+MXNhe9PBNRegZQfOjXStNiGBkaVuyMU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HTTyqZdt1d1TqP3D3mjfKeKlpKjvMDRJ01DPL8H/a9S1tfu7GlLTRLGXqY/RzWWIUPX+FzMRj0PG5px+IIbzdKMAiZXovxY5Hfkiq2hUzvQ7Bjzch/0LKv7S0JmrpnIGMSw9ICJKRpe6jWdiV3xc4deO202jz7pMTNeTExeeM/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvrY54qe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvrY54qe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F11C4CEEF;
	Wed, 28 May 2025 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748452180;
	bh=BJ/ZgklTcy9+MXNhe9PBNRegZQfOjXStNiGBkaVuyMU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UvrY54qeuqkLPbDgr89sGf0odhUehgJBEFqzF8+2/D1jUoMphYhq5neO/jcBC3yrU
	 Q3wbfpG8d3kyLKUJHQAQyOuCzimf7HOoqQwh19NVyVM4CkB+j2fb4ebraDlFMBJQAD
	 dskOuq/7rx5QUagmtvdtm6gLdkacj+QJnWrUvgzUpZ15jAS0DhD3lGW0f4fOGH1yJ6
	 TeTQ1OFV4mxTfMcz3U8psne4V8mmoTvygrMyuTRFR4kn6N+9tf16QzG8GaCgYVUMC5
	 /ZiD3d/qtCTfOisdWvE6lck1CAraXOuMwCpaPuCZYioApqdubuJOVjgjNoSXk5f38w
	 kV7cjxW6PsSLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 311EE3822D25;
	Wed, 28 May 2025 17:10:16 +0000 (UTC)
Subject: Re: [git pull] drm for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
References: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-05-28
X-PR-Tracked-Commit-Id: f8bb3ed3197966fb60bedcbdc126d2bd5bc0a77f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b08494a8f7416e5f09907318c5460ad6f6e2a548
Message-Id: <174845221480.2474092.12132473999464633723.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 17:10:14 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 28 May 2025 13:51:25 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-05-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b08494a8f7416e5f09907318c5460ad6f6e2a548

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
