Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A78255E29
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206805; cv=none; b=hi34ll32xt+6tHhH9/LeoFhF7MRBqtW5lscZfK/xzLTX708tw3zBlPrZ/6GVz8KaKdD2cvVhES17OO3941KMMKZqkOa/Jz1u2NgspllOmu7FrtWNNZ0J4z9lvGntiGj3SgZX5V23QEN1x8gVLhqIZ7LoRPVTCW3RCo1mdt7FMd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206805; c=relaxed/simple;
	bh=lmAr9JZeFVtK4OBbMlB6jDLFUvyqpzGaFYMfhehq9tY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=G0fq3G5p0AfxpxoycD3KgBmaV7CW20w7gcuWER/z5oIsLt3OThwJ1+w9jqVCgLN6XlTuvNKmqc+KJRUDBnsXSZA5apVtiCTYsvMFc7Qejl9JVDx/tatvF4qbHGifvURH8YCVVR0SntToaF5i+AamY+UcR5q+XgPxIceMLoBenZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7AcfpjS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7AcfpjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BC6C4CED1;
	Mon, 10 Feb 2025 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739206805;
	bh=lmAr9JZeFVtK4OBbMlB6jDLFUvyqpzGaFYMfhehq9tY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L7AcfpjSUuVn/wWghYjCs/4wsp3Y2inLngkKSQQAKhR2NxUX//v8V5iJhp+3F/TdG
	 y8d7a4X5gbgFwlNeyZqU5UfZ/sQEt/DovAfIDDxNgRLg53CfAa/6cdjC78cZve17Qu
	 ZbMUNyfH7WgqgNSY/Wc019jeM1FO9QpKHN8pnPxtsGX7wxoWp7LCHQRBUclv9kYM/V
	 Z4oZAwvEF2VJHN9ss6sQTLph8Kye+1/Edr0WDFoW7NNj+5U7a7BQqZH/rKxD8gTs4J
	 Gi9ZYEZa290aOsIHh8oiFbui9wumRC5rjYjXBn6rfj7y+2eVYZwGau4X9qY9nuLzQK
	 O/TaFO0FJxKYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE18380AA66;
	Mon, 10 Feb 2025 17:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: quota: fix to avoid warning in
 dquot_writeback_dquots()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <173920683379.3829927.11086061258734830665.git-patchwork-notify@kernel.org>
Date: Mon, 10 Feb 2025 17:00:33 +0000
References: <20250208023321.3736348-1-chao@kernel.org>
In-Reply-To: <20250208023321.3736348-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat,  8 Feb 2025 10:33:21 +0800 you wrote:
> F2FS-fs (dm-59): checkpoint=enable has some unwritten data.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 6 PID: 8013 at fs/quota/dquot.c:691 dquot_writeback_dquots+0x2fc/0x308
> pc : dquot_writeback_dquots+0x2fc/0x308
> lr : f2fs_quota_sync+0xcc/0x1c4
> Call trace:
> dquot_writeback_dquots+0x2fc/0x308
> f2fs_quota_sync+0xcc/0x1c4
> f2fs_write_checkpoint+0x3d4/0x9b0
> f2fs_issue_checkpoint+0x1bc/0x2c0
> f2fs_sync_fs+0x54/0x150
> f2fs_do_sync_file+0x2f8/0x814
> __f2fs_ioctl+0x1960/0x3244
> f2fs_ioctl+0x54/0xe0
> __arm64_sys_ioctl+0xa8/0xe4
> invoke_syscall+0x58/0x114
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: quota: fix to avoid warning in dquot_writeback_dquots()
    https://git.kernel.org/jaegeuk/f2fs/c/eb85c2410d6f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


