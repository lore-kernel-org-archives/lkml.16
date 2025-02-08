Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD9419CD01
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739053527; cv=none; b=nNctE7qOd9ook543R+mGgDGQeEfJxNqjMcXvqdd/P6tHgwnv5mb3XoWs4DrBz035NSfgrSiDTjBYz7kEGQ7uh6GQnsLAIJtIz2FRfQmruIQg34YMg9Gi+hFJVb0wo3GU8IrYddscjkCd8itD9/hZIXpO/rKmJP5tiGuXBsUjBCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739053527; c=relaxed/simple;
	bh=W8YRp2EUsr2e13ALlxJD9zHZ4QyYP+Z87YyAlSSOFO0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=C2WBNO9CKX205Wy9PDyAOXkuBoFqo36un6ZYYLxH6/3AUx9s0wN8O7H1WdWsIUsmvwR10ppBOhiO9sHa2P2NvDyk69Y7DohacVOS4vCw5ad/QMP5/lQ/8qlPZ8QjmmS4XwGQwD8s4URW7Tc7xyKfXKhvC6Nh3oizUWSa1HfBgqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pcjfmV9m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pcjfmV9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F0FC4CED6;
	Sat,  8 Feb 2025 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739053526;
	bh=W8YRp2EUsr2e13ALlxJD9zHZ4QyYP+Z87YyAlSSOFO0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pcjfmV9mmrhaHEya9bq6KzA12ja0vT/sDg12VDxSGniovV/RLQDmPokGyYeiFdh1U
	 vKw16PZBGVMFCEB2QOQklFYdPB/7QkiqzP1bpM+risQwzjf9tXwAE+KVhe5tToLCBE
	 PgHXF3lXdSt2ioxHfoTWcVW/Z2AnauGIXC1YFrHxfohBIV8CZXQUU59bIaZ1iUD5wZ
	 M0UFrU8/xCxMA+ruET1VYIZEIFcI/v8bF7LCm384vERyPxO7RzjmeY4MJ03WiXu3Cn
	 tV6ZKOOO41IHCnIYYZgzz53Le7HF292bhvCrKCB2nqVOt+UjJQ/C5vusXNBSTPHYZl
	 qy5YPHxmYaVQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340CE380AAF5;
	Sat,  8 Feb 2025 22:25:56 +0000 (UTC)
Subject: Re: [GIT PULL] execve fix for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <202502081228.796ABA4@keescook>
References: <202502081228.796ABA4@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202502081228.796ABA4@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.14-rc2
X-PR-Tracked-Commit-Id: b029628be267cba3c7684ec684749fe3e4372398
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b0582f50952a0e225fabd97bb6f90ca5138a0e7
Message-Id: <173905355466.2676587.9153761161069898680.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 22:25:54 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "Eric W. Biederman" <ebiederm@xmission.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kees Cook <kees@kernel.org>, Richard Henderson <richard.henderson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 12:28:46 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.14-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b0582f50952a0e225fabd97bb6f90ca5138a0e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
