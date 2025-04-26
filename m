Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49A1DF759
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745687106; cv=none; b=BAJ+zLZj7uhzAfM5nQlRgFVMEU8SP8hPm26iUVN5EEFZ+QPdzNGKaEfU4lgMHN5w4jw1KiWgCiZqi+2iwrJ7O8Xd+hUT9Dol5mLBzU7YdOz3e7tYTzu2C3zPvbDLMBQkr+ykOUUqC+r17H4j4tXKJVEuCZewLUSTiAj35ih72OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745687106; c=relaxed/simple;
	bh=bmB4LNaG9qJ93DN1uHQ2PlYyTGX66NmUX7nCJlCeUnQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=P8ZVnmgiezyb1Z18yS5n/Le1/GtJouuRxy5A43dSr3Laa+cCKn9aiRjygGzAEL7DzC3HTs4ysoQsTCEgNcrRsICagSBxVVBGv2ltYTqzEUxCR/GTd/gj6JV2+Fumj0HG7xQ3PukDqpefGPmgOkklqJ+gNfbHBXdCMazQldg0koY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATWfkJB4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATWfkJB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBBCC4CEE2;
	Sat, 26 Apr 2025 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745687106;
	bh=bmB4LNaG9qJ93DN1uHQ2PlYyTGX66NmUX7nCJlCeUnQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ATWfkJB4QqO7tVeeW0lmkzxSGgYEjUs/9FB0YOMC7aQQjwJ1a1uAH1Fh0zzeMe2Ni
	 JuEh4zelNZv5v1HOvP+rrXRC6U7WIya1CspNAhVsWHUJMAEGg90vja83XMeSnuJd5O
	 U7fGaMfxSNngZBLz5AyzggUmZ+A1Q46Dh5sdEaTLhLLYPu9H9NmBMh0UyDdYBfha1g
	 DKcfSlpAYYo9A28DTipJo01XsDbRLpCOaiZuaQawBoLEyCrolIhBFj1pwMErRKNMK/
	 zC+QL2Ten0JQOSJpJTC9uCKCrKIHsfp+vvJNQ2lF4ykx74kMSJeRpa0UFeKv9BngFI
	 gr/m1z66KazBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB05F38111CC;
	Sat, 26 Apr 2025 17:05:45 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-26
X-PR-Tracked-Commit-Id: 250130d2daaa0a828bafbd6ad58479a645029e82
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa573aefdf9bc6e4a903551d381ddcbd60f37943
Message-Id: <174568714456.4031081.785120233885422966.pr-tracker-bot@kernel.org>
Date: Sat, 26 Apr 2025 17:05:44 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Apr 2025 09:12:11 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa573aefdf9bc6e4a903551d381ddcbd60f37943

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
