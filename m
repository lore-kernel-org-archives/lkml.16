Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40D1DC98C;
	Wed,  4 Jun 2025 16:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749055031; cv=none; b=T1Vra5Zrx3YjmIY40ppbjNMlCAZlXLI9Sqaaxfdk92nHEaw8b6ZbQiS31WflNRN0s3B0MHXtulNhBvtxc9gXWg/lFRfXJ+5MKSK/+bl2QgU2NDDbOBpiga1LK4tf/I4Z8R5y3ZNNrebdlm090iWP5iPIb8pvrr6WOY/KhQoxuCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749055031; c=relaxed/simple;
	bh=2OJ1OM9loK83DVZMpQuXau4isC73/KHxvpXf6wuAVA0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AOLG5w3Y/pZ24k/NSBG4Mbz3RFbpOPQXEdIhfdXW7xun7vfVXrudRYLFL3pCfjsfJluU3Ax6+x+S123bfdBneZiZhzosNmSIgm9b6mcs+KiNY5qgnX5iuwqQM3bOQU7qZaSXbronii6M4U6CewwJafw7P/0PyyoOOYjt40UdHtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKbMHIey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKbMHIey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6F2C4CEE4;
	Wed,  4 Jun 2025 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749055031;
	bh=2OJ1OM9loK83DVZMpQuXau4isC73/KHxvpXf6wuAVA0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mKbMHIeydVd5bKp2Otqj59fuE5Rbc0h17KXff+xgAvHZnTa0K635Rk/LoHdi0Irf0
	 pTAKQOTiDEORsYAZA61HXmZrIrhJHOIPBHmypIJfNx8CP7ZrpaZKDbBR/RSQfgWJFx
	 y1rPFAaDtdAD5BdYQYCxmRYOh1YWakTxgeheSO5MnFeFFvSlqSuv4DGQ4SEb/koMQo
	 Y/2AHdHSuYvHeHD8aMqn3WIIshp7c92Y9haWmnBZ5uGP6Cu/Bn0//jRyn1Xj4ED23H
	 dv9auJZz+Lyslkn2ZsuFvTpc4Y7cJUZW42gQs5ZgqDXskC6tcq/omOJz0QRHroukVF
	 GeMKcQpu81KXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D7338111E5;
	Wed,  4 Jun 2025 16:37:44 +0000 (UTC)
Subject: Re: [GIT PULL] SPDX/LICENSES update for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEAFnFOS-8tH00ko@kroah.com>
References: <aEAFnFOS-8tH00ko@kroah.com>
X-PR-Tracked-List-Id: <linux-spdx.vger.kernel.org>
X-PR-Tracked-Message-Id: <aEAFnFOS-8tH00ko@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx.git tags/spdx-6.16-rc1
X-PR-Tracked-Commit-Id: 59c11a7a9a138a28c7dff81032a7b7b6f1794540
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f5ebe7bb87e04537b37573f0a2516baa90ee23c0
Message-Id: <174905506287.2350857.11142661323825669523.pr-tracker-bot@kernel.org>
Date: Wed, 04 Jun 2025 16:37:42 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-spdx@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 4 Jun 2025 10:36:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx.git tags/spdx-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f5ebe7bb87e04537b37573f0a2516baa90ee23c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
