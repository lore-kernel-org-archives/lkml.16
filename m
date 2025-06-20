Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE3E220F36
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401248; cv=none; b=Paif83/UIJR4VQRoWmc2opx2xd85jf+YasKVX1PlzuM6Kb14ZOTL684q63eJJQzOe3LhMXCFwbwuXUcQnBP3UatYsvLoVHpxKyW9e1lxmuKi1QMnnG1dcGU1nwnUwX0tN/7DDSxOjff+Udle+djbCtcvFDa+oXk0j81ohIyTxlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401248; c=relaxed/simple;
	bh=dVLl9EUNjWGmiCDhYmFZI0+MgMZZogKvTobR1Gx3A2c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mRnuXvGFRQy+2IEJsicgNjBDfywzAQWpmk3IGq4garzVe3rJUpHWickoNKNDJ8Qc+JvZVNcINckHROKrfbkthXrPKv1byScoKP0LLWFNV/lYTmwcmUq4dk8uf/1XDrkAO/ocKW8WQmU5bBBoRP794lsMV1OQbgJBmn4HKs+tSfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJAVlss/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJAVlss/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6F1C4CEED;
	Fri, 20 Jun 2025 06:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750401248;
	bh=dVLl9EUNjWGmiCDhYmFZI0+MgMZZogKvTobR1Gx3A2c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tJAVlss/09O6zE7KKmNPbBz0UmB+exM4jzNe60pNIN97PKIsUGVuuIrBueB2KvOWX
	 mCZA3Brz50zjPKeCS1BNv/0y9BUwtQmoEBKzE4Vn9p8f3JuOtQv6JswrlnD7NhA0dK
	 Rf+uQA6fQcccDtJjqIMgAUGjmsJkgnaSMzKZdOl8Eoe0v6XS8xWQR6kpVcNZr2OSbk
	 9RhzGQsTiCt0dB+o3I/Sa/ksf7qPDmaCq3hgcN/ZHQbYJqneiS7fxUFO5ZQsRYI87Q
	 NFYTrLu1kJ2iKTHKQrp2RPm2101U9cFEdYt6+3OvLJvugx2MmqNDhcpmml3lNIcOgt
	 /paObgyybkJQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC2638111DD;
	Fri, 20 Jun 2025 06:34:37 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txjJTL-dgwgrZbsiQzAHxe97vQ6mrttCxnf0okZQ5t3gQ@mail.gmail.com>
References: <CAPM=9txjJTL-dgwgrZbsiQzAHxe97vQ6mrttCxnf0okZQ5t3gQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txjJTL-dgwgrZbsiQzAHxe97vQ6mrttCxnf0okZQ5t3gQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-20
X-PR-Tracked-Commit-Id: b8de9b21e8499a09ef424e101a8703e8e1866bfd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f2b6c5f6b692c696a232d12c43b8e41c0d393b9
Message-Id: <175040127634.1104049.1483328524375191524.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jun 2025 06:34:36 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 20 Jun 2025 13:25:32 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f2b6c5f6b692c696a232d12c43b8e41c0d393b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
