Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88472BE041
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650576; cv=none; b=n/AtJUif/IyUjfzhdhoH6QvFHW7Ty7EOnTvcGeZPYzm+uCw4FOr2hyC++wGxBth3toK5bpZIy4Ej1P4WPvTws84860IM/CM8qoIpCPac4oyz7GU7OCUdpRit/GOZNi8cUGKZwnhmhmw7K06cfufCV2oRKf2iPJGyxUc5qZeRawE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650576; c=relaxed/simple;
	bh=6U8AVqQF1oEFq8dfisoI5iei3Sjr8EueiUUxJ8j2il0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fGO8i4C/QzqaEjVixIBaqHduYgKVP1rDaQ8xqNAwFCAZ226T/lFr1zrVtdzrf9fYD5UqsT16RDZ00PBsGRaIKhv4wMDsHhVUs/D5mWX4hez8kBLz0/nodZjpZfIXVOuWny21Z7apPSjjwFqHyGMfJvuqPr/vUIJFtuaTQXIgGqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Seoniush; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Seoniush"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEADC4CEE3;
	Fri,  4 Jul 2025 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650576;
	bh=6U8AVqQF1oEFq8dfisoI5iei3Sjr8EueiUUxJ8j2il0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SeoniushYeFaSHlJhDe+Y2Mb453rTD0GtYlS6Bw1YQiDVpVaHyfvFivMEfcctx/ux
	 KzQU969tSAYa5ptyqv7QDW3npm3hIwAaQWxBb2SlRkqmoBp8s821Ddtjf7ErIK2s7S
	 ovJ0a+N+XeFW4jLU/ZMZgUfN3VMZ3JKDzmjHDSq6iEiMHdiZHI1EHz+3DsLGTfmDD6
	 kPfE8aLWO1TNC/f0rOhy1A1Gs5eB0vNFxMLvDMx85I4cCA8iobeo1Qt6nGcA2VGQCG
	 zD1hWaEguDjP5omnOiULw5InWWAZDH/FovUUH3CdfHutA5KWHDolFHMlQyYOPiyS6m
	 Z+cwRfsrkkoDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF03383BA01;
	Fri,  4 Jul 2025 17:36:41 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzrmRS9++MP_Y4ab95W71UxjFLzTd176Mok7akwdT2q+w@mail.gmail.com>
References: <CAPM=9tzrmRS9++MP_Y4ab95W71UxjFLzTd176Mok7akwdT2q+w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzrmRS9++MP_Y4ab95W71UxjFLzTd176Mok7akwdT2q+w@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-04
X-PR-Tracked-Commit-Id: da8d8e9001c6a3741e9bec26a6cdcfd75ecabc88
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42bb9b630c4c6c0964cddca98d9d30aa992826de
Message-Id: <175165060062.2287194.7810170516144309790.pr-tracker-bot@kernel.org>
Date: Fri, 04 Jul 2025 17:36:40 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Jul 2025 11:01:24 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42bb9b630c4c6c0964cddca98d9d30aa992826de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
