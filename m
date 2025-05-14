Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA9227A905
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237199; cv=none; b=kUd97V9wR+CvIgR1Prdt0trT2p5KTgIt4U5mG2P2QtqPY5U9oSwFqKOCyhiQaDNvXZoqvHoFFI8oKXnW6vFwOAdoohDoXTLenpd+gSxbLS6t4gk+jEP1yX7KJRrCQVqkXg5qVT1xEBzxsOw3swq/kuiz+i8uK+GL7arSW9s5XUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237199; c=relaxed/simple;
	bh=CXW+8Kkek2ngZPRlgBBnb1RmAch5ngUtLPbJkneb+50=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tWZOxqSUqAvJA0qEivOY4kPVjffKm+UPKPBPhFmdzyga6hEMeUrIDuQj8aY3vu5zec6tO6IPMnz9SCnglR3//f5tQk9+klRwd1b3HjeYq9fuY7bjsdrVnhdgHQS7eOnb2V/oRDMuSsk2M1eZ8QJdO4sUWlA5BU+SzjtsaRGD1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzStKIFW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzStKIFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECD4C4CEF6;
	Wed, 14 May 2025 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237199;
	bh=CXW+8Kkek2ngZPRlgBBnb1RmAch5ngUtLPbJkneb+50=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nzStKIFW7HgaBXbpJo+kw03oJ7BqoIxAiw5AVk8siWT4Q1iI3ZJZRKenRUjyAImpy
	 vOUH74NFRlqrz2a4qx13NeT+QjtWTrbUCzeXREshKICW5Qf9IF8LQPQ6T+bzsyi8ct
	 HMlkR16M/15hTkJn0qOL24NzJL3mcPdqOggQaCsPtiYxdP2aCV2k9ebM6HMGZcmHXk
	 O5p2pfY8BTRVN2rvvF+onqcL7+hyPkvhy543XiuU17rMXJhpLkNoqi2Q2JOjTwiqs3
	 4j2P3iyvgjq5RQIJlP1t4kYUnK2AK8nFuzdbgguktR5tH1WQrlwfctnOkyQSKSHAM/
	 Xvj5GLk/dN/LQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD79380AA66;
	Wed, 14 May 2025 15:40:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use vmalloc instead of kvmalloc in
 .init_{, de}compress_ctx
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174723723649.2412407.16054768914286290257.git-patchwork-notify@kernel.org>
Date: Wed, 14 May 2025 15:40:36 +0000
References: <20250513055721.2918793-1-chao@kernel.org>
In-Reply-To: <20250513055721.2918793-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 May 2025 13:57:20 +0800 you wrote:
> .init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will try
> to allocate physically continuous page first, it may cause more memory
> allocation pressure, let's use vmalloc instead to mitigate it.
> 
> [Test]
> cd /data/local/tmp
> touch file
> f2fs_io setflags compression file
> f2fs_io getflags file
> for i in $(seq 1 10); do sync; echo 3 > /proc/sys/vm/drop_caches;\
> time f2fs_io write 512 0 4096 zero osync file; truncate -s 0 file;\
> done
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: use vmalloc instead of kvmalloc in .init_{, de}compress_ctx
    https://git.kernel.org/jaegeuk/f2fs/c/10b26e772b10
  - [f2fs-dev,2/2] f2fs: introduce FAULT_VMALLOC
    https://git.kernel.org/jaegeuk/f2fs/c/2c19d65bab04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


