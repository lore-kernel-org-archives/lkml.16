Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5354C128819;
	Sun, 29 Jun 2025 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751215183; cv=none; b=hp4aMdomODZUa8sMQ+z7y/8V/T9VnNAE4WizeyoOQR0jg6M4T/XTw9DzyTqP560LX/o/YiFF5MZi3iyaCaOH9w9q/uIOEjpMlxixIkXasAoaFX4j8msVzRIjk+kjeM1cq8fD35GBk/gUAtzHNqPKGuoakwV/HW80HIwvxVlPFJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751215183; c=relaxed/simple;
	bh=hMfeRc/VIXFngmJ9sqa4j0XJccJ9dWxRrJE5Vh/FFk8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PitNBGbQbYcT6SPRMJLTMf5PCeoegfJWUA0pp5QQnG3OzBhGNQvUrerjJKZwzWk7mGShuDYTOWVlZ2my73iLe1JfAr6s2SsiS1YDxHyb8lJwl7iKZAtRaUjselHN356gUi3bl1V/kXlY2dTq1BZ++tdMsOUlLgXCvWxp9tghHdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Be03TNR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Be03TNR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5125C4CEEB;
	Sun, 29 Jun 2025 16:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751215182;
	bh=hMfeRc/VIXFngmJ9sqa4j0XJccJ9dWxRrJE5Vh/FFk8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Be03TNR78IZRm6cKdPLNtPlsOZtCANHIONXYwIWmmZpVf5qsLu84rqViyVodCAe8/
	 f61itYEVsYbVt7rlMGNaOAyaxTc6RnAODDtD24CXv6oZXIuKp3IgUkLtFaBu0W4bUr
	 CI3zYb5unDuborpbu1ejNuZE706MulRTJWGe2cUuSJnIm/+Fa1PjmdpH5N3D9eRO3u
	 crL6Sw0yob4MRfOQ2eG1gkIrSfrY5VieQdAIVnyxlUYTR7MKYYkbvS6bT+TyGbH8Z9
	 dnNuf6mSliKLiBmwyGzGz94VrfGxagg8FasqxHAW2/q9AswPzOTS7c+k0X1NKZUBdz
	 P+OXipdKrbXlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 744FF38111CE;
	Sun, 29 Jun 2025 16:40:09 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fix for 6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aGExya6dgB0JMLYb@kroah.com>
References: <aGExya6dgB0JMLYb@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <aGExya6dgB0JMLYb@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.16-rc4
X-PR-Tracked-Commit-Id: a55bc4ffc06d8c965a7d6f0a01ed0ed41380df28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: afa9a6f4f5744d907954f5b708d76c9bffa43234
Message-Id: <175121520859.2431506.10725902674250859019.pr-tracker-bot@kernel.org>
Date: Sun, 29 Jun 2025 16:40:08 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 29 Jun 2025 14:30:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.16-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/afa9a6f4f5744d907954f5b708d76c9bffa43234

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
