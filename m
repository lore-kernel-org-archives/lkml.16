Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945265258
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 01:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743210077; cv=none; b=ZuQ6BJPaL9cSEaJHWEGfQBJi2f5d+h8Oy4OP/A2s27bVsExSMC8WK+MqEwZU7aNgFOjbdPIGypUPuHagX/xs6b6U98yU6Ey4xn+QM3opQtXGI1pOVdiV0OmAx+sdcBAl2i6JbOPg++uUgr6T+++oMx/vZvmP80cnUdYbvyscdJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743210077; c=relaxed/simple;
	bh=zw+LY6l7DGQu0Ui9wLy7jSsru+ssJuH1+yqnJNVzNsQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SLh8dEihZxnKkmLHKS5xDccppFU9Zd2kbe4yKEnhgMFWR9+ivKBMqnnFjOKutdSX4kl80/6jwZS7XzI12fo51cp8mp7uTzq/61uNN+1l/gvd692oi4Cm+DBMllwgSpihfCrSUBcsaRtrgidbETssModE+pkggjB6tLqisOC8Zw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ian7LHjc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ian7LHjc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741F7C4CEE4;
	Sat, 29 Mar 2025 01:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743210077;
	bh=zw+LY6l7DGQu0Ui9wLy7jSsru+ssJuH1+yqnJNVzNsQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Ian7LHjchiQU2FO23/UrVO8/IMy/kOLW5DkWyvt6R1OQVx+oHaHmyvNuXSmNVbXWU
	 DpLIp4cVAOYn7tMM3wAAI0OMUUfbYCENbJlrTbJ0CNMHPSviPnPfec9dOfxSa7YyZm
	 3qN7NFH+Xn4wsy+RTBXDLOWRWCZXl3YrSD/CT8J4+1Nu4a80N5GWK1WYgvGXUJIbok
	 dWVpddOd+OdFqom/JAVFoLnQ0RErE7oOFGQN1GMKlIyRd7n8r3h7YjTerpZejU4UjZ
	 6YkPH5CnFlnf7wMDm6CJ66A+9uhRVR9wCq8Xbt8fnuoYiPihG64dRwn7z+GNUvEFA7
	 hirjCGQhaQxTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340433805D89;
	Sat, 29 Mar 2025 01:01:55 +0000 (UTC)
Subject: Re: [git pull] drm for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-03-28
X-PR-Tracked-Commit-Id: cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c86b42439b6c11d758b3392a21117934fef00c1
Message-Id: <174321011387.3019715.1646591159826097779.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 01:01:53 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, simona.vetter@ffwll.ch, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 12:53:20 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-03-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c86b42439b6c11d758b3392a21117934fef00c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
