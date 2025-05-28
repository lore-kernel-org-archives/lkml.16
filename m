Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556EE2206B5;
	Wed, 28 May 2025 19:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461469; cv=none; b=db4tIeW5w5qb9iRDsKW+/eSftvuk6aOMmQWgbTq90v7UMcH2ZraLGJiXOhHEk35ueOQGlWAhd27N4vzkPCTyyCO7bjYDjtQfhRR5mpkEdsrlVU2JDGZCZ1QMIQ0L9LmoDeATHwTKrJUe+uIn0xBLIzgYu8q6hAuxEOtkvHMqDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461469; c=relaxed/simple;
	bh=gkJPuUEBmBa2T6rdVCbOWsZX40AzDjpo93A3cuUkLHc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=F615pLIQn/UztcZTROEHwbAbHoFBccZmssJYPkmpjVZJoyVXoDkG7T7+lTEbxUWnTKiVDbmW6fb1iu1GNB36AnP4R4wawc7HMStJnJJ7Z1EczAJSyg0+N20ddjJxVEns6caycl4a/8E9rQyc+64sb2vzzcHhKyeCQhU58caa8oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VR55tyDg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VR55tyDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384D4C4CEE3;
	Wed, 28 May 2025 19:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748461469;
	bh=gkJPuUEBmBa2T6rdVCbOWsZX40AzDjpo93A3cuUkLHc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VR55tyDg8cJPCOkgla4sWmkS85gVbYeq2bGS/BL+MHLNJm9icHxKnoUnV4F4QlsMw
	 NtroM1IyJyzruJTwND3MFGkKTd1ISP11iSIA3e4U+UJ0zW0kEMBOmSTf6lVx5mjOpS
	 H5MU1LxHwYTPORtZc8s8vIkCPeZzeUz6AiOEYYr2pqUjB5r88hVZx5nhSqQzUDu6nT
	 zL6qrBF8HoAGuWYIifnviEPddAVscLeZEzFBf2pJU+o2zWjUMEP6d7NnOSBjeKnpzY
	 k714cRigrg15zpTlCt1NDChCUwLTZ3sqeCIFDe416f/BsMWudJgS5llI7LmOwK9xB5
	 TX6H1Z6u5EoNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D903822D1A;
	Wed, 28 May 2025 19:45:04 +0000 (UTC)
Subject: Re: [GIT PULL] dlm updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDXkbAcJfiMTixT2@redhat.com>
References: <aDXkbAcJfiMTixT2@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDXkbAcJfiMTixT2@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.16
X-PR-Tracked-Commit-Id: 6f8b4788266c7df3b7cfc6c665f663b4c3d09aad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1fd8bd0cc18cd8572ac0da21418cce2ee45e04f
Message-Id: <174846150291.2536722.1487916114814230281.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 19:45:02 +0000
To: David Teigland <teigland@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, gfs2@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 May 2025 11:12:28 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git dlm-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1fd8bd0cc18cd8572ac0da21418cce2ee45e04f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
