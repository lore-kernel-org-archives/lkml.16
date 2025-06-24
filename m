Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D46F53E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725626; cv=none; b=PM1YbutLL8YM2WDpOxDZ0kR8/dnXj89jxt/vBVS9TH5RNqitWp/E8Q9b9I4CdebWGxV3JNvruIymjAR22XhVlO0iXztNz07aJZFzJulrSsmhAMuD9UTVgBiLStyUxUJmaCRv/ljPvaqfqD6kGzG+29+5YR1ZHZ9dQUDm9mNMo6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725626; c=relaxed/simple;
	bh=HSdCQQWxVeeErIFv7WqAXQehp59S8Y03qaZKyPJC5qo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MjoS8J4VKH/C4VTHVwT0dj2UWx00ZqcZRi7gzlLZ88I14qHfWGhigEqsA/YK8hWAOANeLxouhEEL+sEJecksXFS3m7wCSw0f60376sRrKrcKClIx3cwWtiLCA7L8gImd8cYl00gMKCUrUp7eTU+/kR+cMtjQUcS6vy7lUPdSIoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PX8XEXhm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PX8XEXhm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC59C4CEEA;
	Tue, 24 Jun 2025 00:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750725625;
	bh=HSdCQQWxVeeErIFv7WqAXQehp59S8Y03qaZKyPJC5qo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PX8XEXhmPW7ftop/zlrGyZTLveBRA2KNT3sTc5BccH0hCz2cDcjCPfaJKhrNiCbqE
	 agmX8X7CyECp3iIynflrqidvZSOrkM73rAoG7bcVu7i0RJtrmGHUHWlFtvMoG9OITo
	 IVDUTL+cmKFjRm9x/DbKrU7C46DLUy+ZA8hTLX63wpaegzvSVeOEOtl3+vO080xkFc
	 EBEZNb5Dlg4O6uF3CspZmobnlO1/kbW0u2tz2Qfd31BDoxfIFmNGRmipQz/Vswl8zx
	 BTUyiV4dMZC5Axo4HglkkPDggFrthsZ1WfIdmFZkaSpUm0hIMdQNkyXaoj3+L3q913
	 xbEEg9cuL0m+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DA539FEB7D;
	Tue, 24 Jun 2025 00:40:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: make sure zoned device GC to use FG_GC
 in
 shortage of free section
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <175072565225.3346761.9321054958830239968.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:52 +0000
References: <20250529222532.1088106-1-daeho43@gmail.com>
In-Reply-To: <20250529222532.1088106-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 29 May 2025 15:25:32 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We already use FG_GC when we have free sections under
> gc_boost_zoned_gc_percent. So, let's make it consistent.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: make sure zoned device GC to use FG_GC in shortage of free section
    https://git.kernel.org/jaegeuk/f2fs/c/24bf3ee37fb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


