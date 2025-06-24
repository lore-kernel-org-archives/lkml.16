Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FFD1C84CB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725629; cv=none; b=Q0FZZv5K9fwbnW1aNSTKiNho9nFhZS6cTLa8IHnWEKSeXEH07cJoARRIb6sgZYhKDcsOKLHXC4LtSQJJ8LdyqG69ovLgOsyL7uw9YYfMJLL1Sff3rRGfKgbX28NFHTOFgpJcc42gdsY9cyef+fSPTi23uALj+AE5XKA7xxQLjd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725629; c=relaxed/simple;
	bh=qKo0UmaPptGag6CyO9k3PD/eop53y1VYiyYvNlVqaIA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KoBQFzH0fnswdwg1Iw1RjaxjYzShOAi6q5qdw6clxdOAg04UwTvq8Z6sit5Jog4bj//Rie8Nbv7/+oRGzDJpjXDkzABioWr+ruTE+vk+Py0vXOSTo3WpFtZ+Yfivfoozhqcamxh8D5HxXt0HBB4/VAqLbW/8pFp5r2v/OoVi7UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osF9Bp2v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osF9Bp2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAE7C4CEEA;
	Tue, 24 Jun 2025 00:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750725629;
	bh=qKo0UmaPptGag6CyO9k3PD/eop53y1VYiyYvNlVqaIA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=osF9Bp2vZkhsl9BBLuDE1u3SgFdFNRqOK6ibcilEppgMciEZWA+2vZr9FpEQezfXE
	 0r/eupRjKP87Ex2seyxZoQbXbd1xFIYKrbvDBk6k0p9Le7Ur27TwH1NNPxyql1N40Q
	 nTovHP3073Slx1GZgJsTNtjfnbNJt/8suI9Z/5y3W1l5GmAJSmPhfFxlVJC6DvS97Z
	 y99+i4n68MgvCD50anvipS60do9GONXHHOk9bKOxj//blnI9pv1NHVF+y9iPUgl8JL
	 58pR0X89cxc2Dtrmy2+GxWe23QqIytN+D2rcN5oSuaG2iEsooHP3N9QRUtu0DqNvN5
	 L3m6ybcAa/QBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FDA39FEB7D;
	Tue, 24 Jun 2025 00:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix bio memleak when committing super
 block
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <175072565599.3346761.7520240849473534184.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:55 +0000
References: <20250607064116.2993239-1-shengyong1@xiaomi.com>
In-Reply-To: <20250607064116.2993239-1-shengyong1@xiaomi.com>
To: Sheng Yong <shengyong2021@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, shengyong1@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat,  7 Jun 2025 14:41:16 +0800 you wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> When committing new super block, bio is allocated but not freed, and
> kmemleak complains:
> 
>   unreferenced object 0xffff88801d185600 (size 192):
>     comm "kworker/3:2", pid 128, jiffies 4298624992
>     hex dump (first 32 bytes):
>       00 00 00 00 00 00 00 00 80 67 c3 00 81 88 ff ff  .........g......
>       01 08 06 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
>     backtrace (crc 650ecdb1):
>       kmem_cache_alloc_noprof+0x3a9/0x460
>       mempool_alloc_noprof+0x12f/0x310
>       bio_alloc_bioset+0x1e2/0x7e0
>       __f2fs_commit_super+0xe0/0x370
>       f2fs_commit_super+0x4ed/0x8c0
>       f2fs_record_error_work+0xc7/0x190
>       process_one_work+0x7db/0x1970
>       worker_thread+0x518/0xea0
>       kthread+0x359/0x690
>       ret_from_fork+0x34/0x70
>       ret_from_fork_asm+0x1a/0x30
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix bio memleak when committing super block
    https://git.kernel.org/jaegeuk/f2fs/c/554d9b7242a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


