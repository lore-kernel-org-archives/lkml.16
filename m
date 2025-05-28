Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1696B2E401
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449194; cv=none; b=i9O8s43jqbsaIDkxpHb57m7T7LKZRPMqnh86dR1sEvvBJ6D0RJ6dWnpRmJ2+N0WUVNd+SQwPfd8LqUDxynYf1uh0cLYmVsNQU9ybvTjKUA8qqi72Xi2SOJSFbpVhwtPypW64GfC7N4eLFd94IUC7ADaR+iP2jtXVTv7OCnmGs4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449194; c=relaxed/simple;
	bh=6w+sSIEa2a6VRdcgdL1M84ZRtr3imad0eRZ9oLz8HW4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MKP330Pv93ipex0ahSE3l1bs6Wv0S076cDB3IwZimgBAl44If9OhjET/8hfOBGtqgFXqjRMq/yHzAd4KpEAqGpuzyWdhCzv9pspcadYOUcdUVk+6nrxFQHP80A4MIIp29Z5bbZTbSo5S324smikT2lZIwfIVr+mPSg3rZMBmsd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZablnEiH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZablnEiH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83433C4CEE3;
	Wed, 28 May 2025 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748449193;
	bh=6w+sSIEa2a6VRdcgdL1M84ZRtr3imad0eRZ9oLz8HW4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZablnEiHJ2JJM401tyemi8r/4oK/yt++24MeyhqBRDvq7lrXWv15+reo1LkpFWpQM
	 UsyupwxwkNK47A/VtSaTF4f261Y2D0xXXJNNdts91qd5esovrgdOfh3woEA/smyw7w
	 fyPAvjd+xMGh/ZaqmjcHt+mnxr+c+zualif2vluqJ007Wg4Vb3suQ0s/X5ggGpH//h
	 m19G+ThMzkQVxuFV03202eYTc9qekq31hP4NwFigqM2iItOzDuuyPBp0IzIgbQ3Mhm
	 JW6I6TghXQ+DRPUW8oipVopLqkYnrsN4BBjrLdwJ+JEDzKMAGmmN3C5eq5MZ7tRxTX
	 OVVaw+2Qavpqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDA33822D1A;
	Wed, 28 May 2025 16:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: introduce is_{meta,node}_folio
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174844922750.2455931.7003358490084665923.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 16:20:27 +0000
References: <20250523073304.1454247-1-chao@kernel.org>
In-Reply-To: <20250523073304.1454247-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 23 May 2025 15:33:03 +0800 you wrote:
> Just cleanup, no changes.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c |  4 ++--
>  fs/f2fs/data.c       |  2 +-
>  fs/f2fs/f2fs.h       | 13 +++++++++++--
>  fs/f2fs/gc.c         |  2 +-
>  fs/f2fs/node.c       | 18 +++++++++---------
>  5 files changed, 24 insertions(+), 15 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: introduce is_{meta,node}_folio
    https://git.kernel.org/jaegeuk/f2fs/c/019a8912425e
  - [f2fs-dev,2/2] f2fs: clean up to check bi_status w/ BLK_STS_OK
    https://git.kernel.org/jaegeuk/f2fs/c/68e7f31eecf1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


