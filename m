Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A616019C55E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867216; cv=none; b=ap5vHTEkdRRjpdxxVNBpJ4vvBdpCPs48OFGXgi2W9H4IASgh2AE04Dt662OeCn6s2mw0JpgTR82as7g9TliYIJ1kf3WxnRRiOj1QEwxXJrD0aT33slJItVAD14LZ0mMfnTzVywcbJwEbwBEZV7Hxpk6KnYvtukASgFIWKKPI/I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867216; c=relaxed/simple;
	bh=pVq4CMDAhc4V1jMrsbf17rYpj/pKJWdpelfy3IyvIGQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BQzLWANR2B59pAD50jw4S8sYYYnQZ42h548mwyZ4LFhUKqTMQMW5E6039lI4hzo8yoD4pY61sh8HQ8d4dcH/N7OOb6UivzeTg7y4yQpVN5kUCzkqUDvwg8OA2jkiIwZZwLD8Wblf7HOdNW4233typyUQD054pPDbmI6tne4Gyec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G19p2HTZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G19p2HTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83788C4CEE3;
	Thu,  6 Feb 2025 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738867216;
	bh=pVq4CMDAhc4V1jMrsbf17rYpj/pKJWdpelfy3IyvIGQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G19p2HTZhpJLKtrPIgKSDBP7Lq+SyXJbaiiWtP6ILcdEmndkqAjMf9PzKSK1ZaOdC
	 cafX91YZmpzFLTRpN/fXFDy/YnMTxNMbfCPCHxDEJi2qDdFLNxPo6NiAjetJeytHNE
	 as95jdUAs2EzIKhZDsh4MUUHRTkWPzigb7YaUC8zWO/DhbX2DWH+Whm5ekK7X64Sdw
	 +fnK4qMseghPE1O3wy0BNLoHPvAtOoTJdy2KiVcCCvqfZJWycDHd4mI6Qh8Q5cROIi
	 ksWiZReUpPt3PBfb2/DpjCIjKQG3/2fifeJP2VPVO8Oj/37DaSv1njF0CkjqTfqo2l
	 GHq/f4MhN+Lig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 714C2380AADE;
	Thu,  6 Feb 2025 18:40:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: don't kobject_put in the error case
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <173886724400.1614734.1303529241100125768.git-patchwork-notify@kernel.org>
Date: Thu, 06 Feb 2025 18:40:44 +0000
References: <20250131222457.1634039-1-jaegeuk@kernel.org>
In-Reply-To: <20250131222457.1634039-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 31 Jan 2025 22:24:56 +0000 you wrote:
> Fix a wrong kobject_put in the error path.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: don't kobject_put in the error case
    (no matching commit)
  - [f2fs-dev,2/2] f2fs: introduce f2fs_base_attr for global sysfs entries
    https://git.kernel.org/jaegeuk/f2fs/c/21925ede449e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


