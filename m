Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D11F0E31;
	Thu, 30 Jan 2025 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738263376; cv=none; b=NjjG06jteEAM+QDuparn9zxzROq1DZbp3vdcinVNOYdwKAF9jQ7BMnMYhSNagHmBt5fUNuw/pygBu4h+bq/hoOc9So3/WpRM5olmrD5Jit4o/FUfylMPiowUeUxVbgU8lyLXN2vdq5GjKYm1IoRoXFCi6pngloNUhS07ujd4B6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738263376; c=relaxed/simple;
	bh=Aty2GbCh9zH+KjKMe7IP08fZTQyDBoHLox18xvstpFA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JnT6l9LTetD9x9Jm2kFJ/Q3ezBIUK4PTAnfd292l+EA0mzN9ZNuwlN7suLY2fB0WFM2SawKALSQ1AsJo0R/hKD57fCG+kB/L+dYX6fJiKVPGwGL4ocEieMRo7hS4SW+DWRdFS/cBbkN3KAqwh/OdFf4Ns3Jn53HUbYm8mWjni2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDEkwz3q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDEkwz3q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCA2C4CED3;
	Thu, 30 Jan 2025 18:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738263376;
	bh=Aty2GbCh9zH+KjKMe7IP08fZTQyDBoHLox18xvstpFA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aDEkwz3qORzGGll6UjY3sg8zxWWoPdbNg44AzZawhjIGK2aUBREN3Jnnl+Pc/dLjW
	 zzNnOOXuqOpUu3sxnP6VkZPh75RV/Zsguss+5U7v8lEVQpnhaidfaiAbFMEy/3Roar
	 VGw4Hos49ghLiZ8mxOK5SFahZngmwXFC0Izd2RKc1y2b1vkDU+7OqLlByzFr8yeKpW
	 De0uot025sNI7H+nAwd/Nf11FDWEFN1gXaqO3bfrM2Aa+iEsKyUyXSYLqridLTk/du
	 Ak1JbSyzC8Q3vhUm/no4KAkBzyheJvpHU4N3EHnJ4zviQV8j5MpsKi/0VVUoTO7Mgy
	 Ez9NI/7qyc98A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0EC380AA66;
	Thu, 30 Jan 2025 18:56:43 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250130093454.17264-1-brgl@bgdev.pl>
References: <20250130093454.17264-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250130093454.17264-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.14-rc1
X-PR-Tracked-Commit-Id: f8524ac33cd452aef5384504b3264db6039a455e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 90cb220062f52c50ad689f40be3aa958a4553204
Message-Id: <173826340261.1052698.8500998481644139116.pr-tracker-bot@kernel.org>
Date: Thu, 30 Jan 2025 18:56:42 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Jan 2025 10:34:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/90cb220062f52c50ad689f40be3aa958a4553204

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
