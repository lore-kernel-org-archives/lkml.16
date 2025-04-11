Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481035947
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744342584; cv=none; b=pFiGj/vHMUaQIvSwGVpVzuh1NAwTkthI3g58lLek1TqWUVzRuq6fCcRZZ0sGpdOXWt0pwEWvJIL/bUlENUiomtVVpb847ZdfXNMsbz+mZADJ5QbvdvyLHtrF+YW3rFUzEm0jAYUu2+YZXeKXgE3kw/TvQyT1dfL4ePqe30aVxKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744342584; c=relaxed/simple;
	bh=J9wUBWpoTpULzhSLt5V4MGz/YlVsN9rmHe8+QS8TfIs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kUd5Singgol/FipXbGk4DedV68mQ7Lt7nyOB/4T06ENQk5ZbkkvgGTI0cEcW05/MvW49kA/AWmQnXlrNzbhbWijm3MqLpP5GH8+ofOf2FB8DwayNMHGdg6HKPs32jSiQT4bi0PRgOGVxtMOugF1WXF8orJ5rAL42miS5saFBR7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3QaSu6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3QaSu6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D134C4CEE2;
	Fri, 11 Apr 2025 03:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744342584;
	bh=J9wUBWpoTpULzhSLt5V4MGz/YlVsN9rmHe8+QS8TfIs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=r3QaSu6J/c83EVvoqopvoxbq4aA4Q5lfZFwcTCqUSelp9o9WYPotOqHdH3KAfg3mH
	 V+Ncqkr6LILYEuXZ3biOZ7i5c/x9DiCCuybC19kshlv3LMpXnKN4auBM4c+KtCJZfX
	 2nLn3fk9YGXjLf1kJq3bh3UXpQ79qhxl99uclVNjP/LYwOhxYtEzaSBlF0cv5OvyNX
	 /JPHAv8w8BPoKGvWcm42PsUcPKldWXhrWnIvNRz0xKYJsT9OLfQfhUC6fzC0vIkwIr
	 joiGOAdtsFTACc9FKZ3/mC7MinSJprdmn9I/aEJE3gB/f5tXndgLDhmKmSjOLCtBhb
	 q2WniLBeUv0yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E61380CEF4;
	Fri, 11 Apr 2025 03:37:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzvTUFpUeme8Aom4734ycaAK1b1gJFnjH3hHmg756UMGg@mail.gmail.com>
References: <CAPM=9tzvTUFpUeme8Aom4734ycaAK1b1gJFnjH3hHmg756UMGg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzvTUFpUeme8Aom4734ycaAK1b1gJFnjH3hHmg756UMGg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-11-1
X-PR-Tracked-Commit-Id: 485442c6a523de1d293350e039a9d9df9c08704c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 900241a5cc15e6e0709a012051cc72d224cd6a6e
Message-Id: <174434262168.3947740.5175447386950205073.pr-tracker-bot@kernel.org>
Date: Fri, 11 Apr 2025 03:37:01 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Apr 2025 12:58:55 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/900241a5cc15e6e0709a012051cc72d224cd6a6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
