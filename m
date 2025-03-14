Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2DB846F
	for <linux-kernel@vger.kernel.org>; Fri, 14 Mar 2025 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741986187; cv=none; b=J0suy1f5uTU7M1tjQPn5u4rvnatsn0lfbrtlrQLhRDRiuAhLblCTm8pov/QX5MLozaq4Vh3wmbSf5bwSfwQrk3efHGHNi5b3rO+IIZDxYmJnVWv4H5czQNyErtpx9J2otz/Uwb3S7SHzAG+lbkAsG+XbkoqyQd93Vc3m8C2fi6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741986187; c=relaxed/simple;
	bh=37c96Ju4RQ3EjKN7eGLifJHe0WXdKJC67hGKjJwVSvI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PsL80mzBdqK0fYYQ209aaYFipb4S+1ptQHWyqRVX4ANGviyh7DZ8mUWKhJCa8acqwDJaeh4A/v5ear8mio+2q9V+2C6GFiJbAJKxPvevLyuNOqtX59vDY2cssDIYwQwNZ9oYVg9O24dy/uxI+TVa/Y0rkvppkS+pmtVmr7awhbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7dZRJZo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7dZRJZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54CBC4CEE3;
	Fri, 14 Mar 2025 21:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741986187;
	bh=37c96Ju4RQ3EjKN7eGLifJHe0WXdKJC67hGKjJwVSvI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=N7dZRJZoPUXhUbMrBIbCDxH2HSFr9q/DjZkVcl1RRClAEYX57iM859lHRslsQ2K1H
	 7Mq7ERoyX89ur3pbdysh45S5KUu7MUllDdJCeGBoGsdAG0QBpyvTltAKKB4RbOmpGS
	 iOimaj+BiQqrThZOjq2O3nVj5ApNkbq2WFZ1fkHfy3Jm5av+7t2OvNdg5avSAol+3m
	 wJPiB8gVqd5rw5AQRlPtiwFB32ks0Pmj9PNEMQPc8Dg92du8U0RYsx9ymZLWz+AI8t
	 qu/VGQTFtTQa/NrwFtgsPchWPQRFElzw4NVLu31IV/GGJ6yk2vDDp43CirAmkUKvD6
	 8CsjDmZe3uMSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFF9380CEE2;
	Fri, 14 Mar 2025 21:03:42 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250314160458.GA9438@willie-the-truck>
References: <20250314160458.GA9438@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250314160458.GA9438@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: f7edb07ad7c66eab3dce57384f33b9799d579133
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef9248676f81c0342d6e8f90a380a9e0b8c25280
Message-Id: <174198622151.2382486.16421451040430592857.pr-tracker-bot@kernel.org>
Date: Fri, 14 Mar 2025 21:03:41 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 14 Mar 2025 16:04:59 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef9248676f81c0342d6e8f90a380a9e0b8c25280

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
