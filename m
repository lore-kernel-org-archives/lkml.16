Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96178F37
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725630; cv=none; b=c04usqAimk4zBpCcH483OM83EhzDlK9eN8Uc93eIrpG9HvxLeRLfY4f/Smq7QyrzagXwH1+NVvICbX/IoPJ6pNjOSPq7in2UMsmDOxPOjWLPZFptkunb3xeBPK3cN88D5UsOPk7gG9LoUpZr0syV2FjEmvBXe2+pWLOsGRJiv84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725630; c=relaxed/simple;
	bh=w3sB/FWB8UBbQCbXByGpeZ5sAhquoadRiHzXW3UWkI4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XW1pQ/1RgtDIsWLPSzBS0wORbgIiyVRxeeKsDX0zh28xsgElLpsq1YZV6axt7i3HW/j6SxiUEXKwxN1ylZUqtQeviTu8LzVQYSHUtDGt6lCMi5NEGhOdfalaiAXo/LNW5v59gioq1v8TuvSj1CLEgqoXYcCA75KnM29ZvqjaJYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqB0aNaY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqB0aNaY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F3FC4CEEA;
	Tue, 24 Jun 2025 00:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750725630;
	bh=w3sB/FWB8UBbQCbXByGpeZ5sAhquoadRiHzXW3UWkI4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JqB0aNaYV/FpjQehU4DA/AY2E8KTHPg/D6oM52w1ulDlQZ7sLxkd0hsVDXQ/lDzDd
	 lqxHDyZlrjHlOoIfqTk0U9hlkA3aA/KSq/06ypnrTdOjwjtLbgHG5gF28DE5xi9b4j
	 bwAfR+8tdSs8pAze7x/9vbJt4jIB5TVvshv3IWrdxR+RMCkoTEiYxlydPYA1pOuv7g
	 b8Bcq23zhbdjS/UYveQxgD92J2rWKZP2OaagTkDaOLsZAl1hi76VjvRbHT9NfqOti9
	 4yRwkCjcG5d6ourqEyhTgtRfo5r8LldPSFuk5D79OwVf9bb824ws2z+9ESRwNcHGwS
	 nXhlBDxsXRdnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC8339FEB7D;
	Tue, 24 Jun 2025 00:40:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: do sanity check on fio.new_blkaddr in
 do_write_page()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <175072565749.3346761.771322544902669081.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:57 +0000
References: <20250610031315.1067993-1-chao@kernel.org>
In-Reply-To: <20250610031315.1067993-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 10 Jun 2025 11:13:15 +0800 you wrote:
> F2FS-fs (dm-55): access invalid blkaddr:972878540
> Call trace:
>  dump_backtrace+0xec/0x128
>  show_stack+0x18/0x28
>  dump_stack_lvl+0x40/0x88
>  dump_stack+0x18/0x24
>  __f2fs_is_valid_blkaddr+0x360/0x3b4
>  f2fs_is_valid_blkaddr+0x10/0x20
>  f2fs_get_node_info+0x21c/0x60c
>  __write_node_page+0x15c/0x734
>  f2fs_sync_node_pages+0x4f8/0x700
>  f2fs_write_checkpoint+0x4a8/0x99c
>  __checkpoint_and_complete_reqs+0x7c/0x20c
>  issue_checkpoint_thread+0x4c/0xd8
>  kthread+0x11c/0x1b0
>  ret_from_fork+0x10/0x20
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: do sanity check on fio.new_blkaddr in do_write_page()
    https://git.kernel.org/jaegeuk/f2fs/c/70b6e8500431

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


