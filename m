Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCEB213E7E;
	Mon, 28 Apr 2025 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880018; cv=none; b=gL5gVr6BTge9OWmm3ZOA4bPJvFIA7IFZoA8hjFyIlWYHm6GCahwpKUuFdVeUghy/blvXDe3jJCcAetKyZd7pp6PSLkpckCJ7+mhUBVxZ4LMUTvdOXtanSpkaMgy27qMVbqUMQhOT2fcWvm/4KHHMyDyXCTJc5oYU/V07ySdCB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880018; c=relaxed/simple;
	bh=BFR43jbgHotYY1eutbh4BBrxebdbMJ29xjEmR45iP/M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AgFL5dIk/X9Z13FVZTOvs64qLa4ztuER3D6OlGS1+UEBl/FBhzPD7mrlT5r7YapDX3XheVMpkCZrh5X5gHnFrAEMdKRkDv15ocoW7IaIWoco8uoeC+AhDRaauzSZGu9A5MHCl6IiojtP2FpoDXdMEjcpWsRnR8QKPkxOYPqior0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnsMzU6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnsMzU6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95727C4CEE4;
	Mon, 28 Apr 2025 22:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880016;
	bh=BFR43jbgHotYY1eutbh4BBrxebdbMJ29xjEmR45iP/M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gnsMzU6ouEJDEXlU0SfMnpQH9Dwre4NjybN2lFvke/koLw3n/hC1EQ1TIN8UASbVL
	 RnRwsSrNCeAnnSQ6MEd2d50OxKZiFZDOfM2nTxjH7zUrzh+/OgsvwfQfrehWWdhHIa
	 PXsykTwY9uxIqsqYZMZNJ89z0lHWqh/xU17z5DwsGC5x63CMABdb4JKAonn/7xQptc
	 eRQ5QDDKeCy2xvMraQU/eEM7eWN38Xi/7ihMtaaM4InWj1AipOFIopR0afbT99eYp6
	 oj4BWJ9UQEfOv9xgHTyjegcCEpj/JMpSW8KPmsKpolbJAQqXm816Kha5C5/fI1AlyD
	 vbf3nPEweKaIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB013822D43;
	Mon, 28 Apr 2025 22:40:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on sit_bitmap_size
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174588005523.1067750.16774699673521378545.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:55 +0000
References: <20250414105520.729616-1-chao@kernel.org>
In-Reply-To: <20250414105520.729616-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 14 Apr 2025 18:55:20 +0800 you wrote:
> w/ below testcase, resize will generate a corrupted image which
> contains inconsistent metadata, so when mounting such image, it
> will trigger kernel panic:
> 
> touch img
> truncate -s $((512*1024*1024*1024)) img
> mkfs.f2fs -f img $((256*1024*1024))
> resize.f2fs -s -i img -t $((1024*1024*1024))
> mount img /mnt/f2fs
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on sit_bitmap_size
    https://git.kernel.org/jaegeuk/f2fs/c/5db0d252c64e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


