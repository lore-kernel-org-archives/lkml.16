Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769F19D06A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867217; cv=none; b=gwWAUZvxlKBR4Z+WDsCNQvJvu+jSPkN+udrviY3EAAeHzoHkyFgwApvPihCfbwhVK197iPSTe4XAkkfkje52KktldbzjFiJTJVfIyqhi98Yua7cZd25iJyPMfiMdAslfX0PsU+3TpHXG9ifzvJmGNB3RsrZk5wHlkFKYe6JvqiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867217; c=relaxed/simple;
	bh=GKRCvxoDED8v3LIDc1YZoI2Ep36aJyEqyXUCeo9AoLU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Bc9388cSURI7evmfQeNUm3UMOVc+wwytiEgu/kkgvvHmGBmPQYYjcIBz2FG+meBPHgFChWl1d4OiLnxY93mavPX8Lif2vBtlmiAlnvZyzaenIMA5BkEJg4B/wlvMRZahWuKhBTmT17gI0Ds5Q2bFX33qWSBfM27H/Df81u5Ykz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbM0nH7M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbM0nH7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03925C4CEDD;
	Thu,  6 Feb 2025 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738867215;
	bh=GKRCvxoDED8v3LIDc1YZoI2Ep36aJyEqyXUCeo9AoLU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fbM0nH7MP2S4px703AMFzpZToLv+BCNbWSWExOG58w3JsCUCBlVPsyNYsgJ5JvE8g
	 7NcuYr4S0sgIzl4w1IQM4sFOgZGdtBiwDX+nAHz+u/XFgwWfsul9r89INH8rHo8c26
	 zmmddd/l+sIsxvCBQYRNyLZN8LdZhxLIgMQLznK3Qhu5KdWTl6fmnTxAsN/ce3ZLVN
	 qyyKM+D8Rn+ygAnpECUgURpn+UkDOUofTK9YLHJUsrWvzuN4p+1h+pAaKmDb9TZ1PF
	 0IQX3Bcwr5Ls+IqBbj4vd0JXbUAgFKq1kz0yYGte6Cf1dtBwrjj1nbOCY80Jg7Hd5q
	 JbHQg/2e5z3Sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB518380AADE;
	Thu,  6 Feb 2025 18:40:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: remove unnecessary null checking
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <173886724251.1614734.17651671887403590690.git-patchwork-notify@kernel.org>
Date: Thu, 06 Feb 2025 18:40:42 +0000
References: <20250202043253.64389-1-enjuk@amazon.com>
In-Reply-To: <20250202043253.64389-1-enjuk@amazon.com>
To: Kohei Enju <enjuk@amazon.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 axboe@kernel.dk, damien.lemoal@wdc.com, chaitanya.kulkarni@wdc.com,
 johannes.thumshirn@wdc.com, jaegeuk@kernel.org, kohei.enju@gmail.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 2 Feb 2025 13:32:53 +0900 you wrote:
> When __GFP_DIRECT_RECLAIM (included in both GFP_NOIO and GFP_KERNEL) is
> specified, bio_alloc_bioset() never fails to allocate a bio.
> Commit 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO") replaced
> f2fs_bio_alloc() with bio_alloc_bioset(), but null checking after
> bio_alloc_bioset() was still left.
> 
> Fixes: 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO")
> Signed-off-by: Kohei Enju <enjuk@amazon.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v1] f2fs: remove unnecessary null checking
    https://git.kernel.org/jaegeuk/f2fs/c/53333cdf5b03

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


