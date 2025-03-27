Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72518EEA9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743112668; cv=none; b=XlNzccJ/hlOhOM0EkbWPPeFZCtIiBttu8VSv1g2yO8QYwvQyn6Or9a1cxhxSyFyKBzf/44oA/WFWdrk9AIKu4c1TEulPRLjmFgwoqQy8LndPkvpWdhK8yPVj6QcyEJthZugH7TeGELeSe/dne7dNwItt7wfGxmrQa+s7FkUUThA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743112668; c=relaxed/simple;
	bh=vEC3nYe4sWrHn3kHC+aFv+04EDeh1WBI0+LQ94j77lg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QIC1ycovWnjoZPJpvXIOxMl6wtrFmLswVGxRQoME6ZvteF2/YGEjXl17oTvVUIyd13SNWp4terSL0UZQ9pMTaRHpoBS3rDDpkRLfheBm5/WOMGNh5RKniVfqCPthqsLMP/W93HsklIeyFNf9TpgGYuKOBNt0b79/HKotQ/oI5Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DB2RCX2c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DB2RCX2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6409C4CEE4;
	Thu, 27 Mar 2025 21:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743112667;
	bh=vEC3nYe4sWrHn3kHC+aFv+04EDeh1WBI0+LQ94j77lg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DB2RCX2cWhuHNyqWI6njfIZ13qrH8OLPGMhIK9YTjurF/mCuPF1AtrG/pZY5THO+0
	 z+wy1grw7twTWqrvbmm5DixOeJm4of8v3oDe4IhaXAyBqCbt14nO14hV1QxNnxNX63
	 6d9YHweyIAwUgo9AtKoCKVbFIUt2A5Jg7buhePHGtUNYEKWIAMOCCpDKGpSTzMXUX1
	 r1nLWWUypagCcXAyRPvqiUVffDyw+4BXO30SxOowEAMie1OlQadFodsFb3ABj9SOfY
	 uYgYCLQ48HTyK/iqeET2zZ5VrKqIsFL7JRXXoYUxQzRW5BjH+8INY3B66/GLqqTt1c
	 tJ0hgNJdd9Lpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C9C380AAFD;
	Thu, 27 Mar 2025 21:58:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.15-rc1
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174311270426.2230226.11533981024198489963.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 21:58:24 +0000
References: <Z-GPopTYCOl0hjp3@google.com>
In-Reply-To: <Z-GPopTYCOl0hjp3@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Mon, 24 Mar 2025 17:00:18 +0000 you wrote:
> Hi Linus,
> 
> Could you please consider this pull request?
> 
> Thanks,
> 
> The following changes since commit f286757b644c226b6b31779da95a4fa7ab245ef5:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs update for 6.15-rc1
    https://git.kernel.org/jaegeuk/f2fs/c/81d8e5e21322

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


