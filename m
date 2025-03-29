Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E51F1F956
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 21:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743285112; cv=none; b=Gkh+W5fDB8MjzrtQ59qYAFL/s5O995/HZH5YUC5QkhC4Uaw64jYbqmXc0pfhpqWDK5P8gCXE01/4AJFmDciiMgfIScMuAqAHtIOeGfyi8Oi8XdqRA697yneCVIYNAo5u29jVrucZTF9r707jZWOrk5Yq8bQ2JhCY+KW6bsMHrc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743285112; c=relaxed/simple;
	bh=4dTn9b1fgmouJ+jWMYuw80TdZ/JvLFSrnXo/HOErIqI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ibZjlbbJiI2zOrmwMMTDOBcNq1f0v5D5ZbkG6Fe6SjYFWt5v4r0wRqFxU1301UMjtYMWeRF9/ApwE0wRUsQrE0lB5oSpbB7gHY1bQ7qry5gRBnHZ1hHfUu8wbL9snjbb0qMddoptS+RUJTVaTcFP9PVA27v4FIPqm1WmupX3bhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4Pdq0qp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4Pdq0qp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D26C4CEE2;
	Sat, 29 Mar 2025 21:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743285112;
	bh=4dTn9b1fgmouJ+jWMYuw80TdZ/JvLFSrnXo/HOErIqI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=q4Pdq0qpGa6iEhUCY0Ldha5REvQxlH40icUH66J5+r3j3lotuEYpiP7vnS9S6B278
	 x883BnboAJ5uK5qAuj1dyNcYRLmQRVDTIoHb40WR+ywP9nuCxsIM94Hn4mgNavMF2v
	 Bhe0KnA+vRkQnOLI0wUSDxHjQcARpAAkANngpzj/r/Z+8+Z6Zewc0Hdj7Cbl+2ndRx
	 mtNcU6kqLeyOMQzft3GdXJXK1+XIocbLzruL0PxX9geeAMiHWkur+j52liNn6jVy1U
	 lkSkICG7z5gwJ/WJnsPmvIYFOVY3m5lNdyvW3YiTkmKvG222GJzwE8oS+DmXP7SfUV
	 3GVR6xzeZGjfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2FC380AAFA;
	Sat, 29 Mar 2025 21:52:29 +0000 (UTC)
Subject: Re: [GIT PULL] regmap updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <1873795367bda5d10ff64d1efa0625fa.broonie@kernel.org>
References: <1873795367bda5d10ff64d1efa0625fa.broonie@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1873795367bda5d10ff64d1efa0625fa.broonie@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v6.15
X-PR-Tracked-Commit-Id: 153dbf4adad0082d030c30d20541df2b1af52db6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 054b7477e3bfdd562b723ce5e227bd3fd2621f51
Message-Id: <174328514860.3286170.12848452584865117606.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 21:52:28 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Mar 2025 22:26:53 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/054b7477e3bfdd562b723ce5e227bd3fd2621f51

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
