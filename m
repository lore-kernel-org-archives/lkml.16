Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAED28C2CE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446887; cv=none; b=KqVrYsUZvj7PDLyWBBDmfgPS/7zKTXs9JltSglRIqv7yZx6NGpodAZv6vTNs5yvoTXATcSk+Wy+kFn/a5wLmDrWVyPt7tj1EnwlFc5+T8R7jiw9fkK47b4bqEpoMhMfE5sruT18N9wAN0JDr5bEvNGttTqUfvM3doDUiqbbw5ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446887; c=relaxed/simple;
	bh=UBAeWcVKwYuOyOZF+0KXZos+mVGByw8QFXn39HteDoQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qCskvKO+pWOJfW3ydCCuKgtzR9kF4qOz7NNh15fZW9/4pN8T8EsyiYMpWoe0v9LvxJYWQUfRdhqpTZ0gIkqiu0smU7+IeKRnoNMqwwYoNW6kZx6HFo4K9UU9q1wr5EauOmiuQOQ/9By36xWuzYyl3t7Ruko2o1w04QEyqCMV2+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9UmxWi3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9UmxWi3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8B7C4CEE3;
	Wed, 28 May 2025 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748446887;
	bh=UBAeWcVKwYuOyOZF+0KXZos+mVGByw8QFXn39HteDoQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=W9UmxWi3inR7YvTl//AnpCDF2zACzY1UF3z46xF/cwgMDODpqFwi+7JD0yWVBQr+d
	 uACWnc86CPO2x7RvwPm3uk9tCkcfzFWbJej1tt/nCZUZ1LREoChMInBDWKkvZZUfoq
	 sXUN2W8ESYT09OwmAvKa/fZJL7CQxA3ZCxuhfVdL6qJ0acXx05LUe+Wd8IbxlLt05n
	 +vw8t9fKZbjV1zpk+F45ZCnazdAcWuuH4R0vxmqve1YZASbnYXvNG7M9c5eyh1Ar3v
	 hnYnRtJW3mLEzawlY+Fu2oz/l3YJyRKXrTTyeCyNSne79K4IhYOEp/kfmCDKWzv9xj
	 Cecl5S+BzDOIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF943822D1A;
	Wed, 28 May 2025 15:42:02 +0000 (UTC)
Subject: Re: [GIT PULL] seccomp updates for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <202505261937.AFE76B5@keescook>
References: <202505261937.AFE76B5@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202505261937.AFE76B5@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/seccomp-v6.16-rc1
X-PR-Tracked-Commit-Id: a9b33aae79cea2e55fd9204069a29b2e59f012a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 96d40793abc65341c4274169a4444fcfe5f0e6da
Message-Id: <174844692127.2441113.7935479799320535085.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 15:42:01 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, Neill Kapron <nkapron@google.com>, Sumanth Gavini <sumanth.gavini@yahoo.com>, Terry Tritton <terry.tritton@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 19:37:27 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/seccomp-v6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/96d40793abc65341c4274169a4444fcfe5f0e6da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
