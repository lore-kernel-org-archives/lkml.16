Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91345839F4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745978389; cv=none; b=ohoAKU5nLm09qR/wogqNwfjV+3RC9qw03QKGsIJXmKw8naZbDR+ELo+FUIeLlLjd7XwXz3Uu2S+5boheAibHYDK4ur20gasCjZ9/dpmnEWIhqjoEe9kAM9LnWJ2daxBYBjmQ/5Kfv7a++uq+oEoKBF9Oy4yIoQKpioa7OBTHB8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745978389; c=relaxed/simple;
	bh=kXX33O6mDavdDO9coCSiBlNNPLi01Y+IZo/HAouKwS0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=apLOP1T4VOQf50ChVqAc9SFYZedSWrDLUwUVE++QAgS3KmC2/U6LaUGiLsOX4WcI62lYObi0HQRJ1ml4oVGv+4Mvy0zukXbZlwfL6p7cTnLhqyBo0uWrS9k4aJHrV6qDcoqXmUhYn6EcsswPPLdRvmw2us3Qfh25VRFsmR3X26o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjR7rg9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjR7rg9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C94C4CEE3;
	Wed, 30 Apr 2025 01:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745978389;
	bh=kXX33O6mDavdDO9coCSiBlNNPLi01Y+IZo/HAouKwS0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RjR7rg9pVG+Yo7gW9jfzoR27O+eFLxNj7ra0z4eLz5L9Sd7PlNiNFt92BKnvmlAzt
	 cWenP4+n/Y4mu7goygzUZ1v0etpeEUT8m3eQI2xtafCLhSRSI2bYloq9BbupbpOHpl
	 6iO36cskaTP33GkxLcmH3u9AHFLrj3PDBZuVofFVEBMOEpFtsjgjnHSzXooWWBTEz6
	 XvliUQo9l+Dyo7E8jme5MXwlwkLsQ/AcmGKHxYkrtaGEbAN/UzK++lVdcD+YRhBwWC
	 xiQlvKF1Z8YatO0fl0ixWxamP11eT7z9tiwU1pLwdLRHpmesCdFZxr1+0EoEH+9g88
	 eU7hBgIaWGWzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D033822D4E;
	Wed, 30 Apr 2025 02:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: support FAULT_TIMEOUT
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174597842800.1861815.12345517608809854649.git-patchwork-notify@kernel.org>
Date: Wed, 30 Apr 2025 02:00:28 +0000
References: <20250425095055.1129285-1-chao@kernel.org>
In-Reply-To: <20250425095055.1129285-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 25 Apr 2025 17:50:55 +0800 you wrote:
> Support to inject a timeout fault into function, currently it only
> support to inject timeout to commit_atomic_write flow to reproduce
> inconsistent bug, like the bug fixed by commit f098aeba04c9 ("f2fs:
> fix to avoid atomicity corruption of atomic file").
> 
> By default, the new type fault will inject 1000ms timeout, and the
> timeout process can be interrupted by SIGKILL.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: support FAULT_TIMEOUT
    https://git.kernel.org/jaegeuk/f2fs/c/7724284838ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


