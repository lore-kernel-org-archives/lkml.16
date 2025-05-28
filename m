Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF1C3234
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448024; cv=none; b=Q7+pPEKThBuzEqkVzM/7N0MC+Qt2xmoqJ+sDCG081ZrZwUVSEMgzY30PwmIcMkruaOVjVbZ/6wEJmf/HEm/Ihl6yUMu6DEKlIWEzBpu5j1IIYECheTQFTx4Wz85VRtor59XNcP1+Q7o83zsH+1mHAF0a740N8w3NY6N/O1r8Klk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448024; c=relaxed/simple;
	bh=KcwudleOKREFiTnzrvnQ2gW5IQ/mRaXJ1eFhUaLPNiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjDWIgL2zLgiCTZ7PjKlmqdzLBiLUn/ReD7Bp8qaId4Ondo+I3xUaZZC0qo4Enocm+ycIvfXNtsSdNyLwWnuiohOTN6aogfslNSv3ELTNWqL5yDSAR8AdoVl2/Io8KQJ4rR8Cffr6Jc5/da+WEiNiW8xls4RcaR3+XKX3ZuGicY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwnAgZHN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwnAgZHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA42C4CEE3;
	Wed, 28 May 2025 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748448024;
	bh=KcwudleOKREFiTnzrvnQ2gW5IQ/mRaXJ1eFhUaLPNiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwnAgZHNMom76PzcOL3VWdBEGAku5nLRro0GIgJlXJ/FNpRhqsVNHjWhFqv4Koxfj
	 Fcp6kECQ1k2FqaEH8xXl07P1Ku2dalyl3w1Y3/ivjZQ60wHLD87Gk4+XqPQUmd9xUC
	 1GbZ4Gi2PNIeQkT+bG5S1mvF3xSi7zuzX8Ft2B7D1wmGj0/iAPWsfxjkBgrxHsiXZX
	 1kwSYp6Oh6bJbJ6/kYpM+7SbhtYaaOPQZkbo+ROJM8jvd0rcecWaL9VGcelIQHgB7x
	 SlqXt7Myp379Z4xM5xoYIVM3tUTgUlcaGdKuhkhxkGDI2238hks+qnguvoigdADAj+
	 NIbivoYtWDycg==
Date: Wed, 28 May 2025 16:00:22 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: Re: [PATCH] f2fs: fix to do sanity check on section
 ckpt_valid_blocks correctly
Message-ID: <aDczFqQAMoLxcatZ@google.com>
References: <20250528072045.416898-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528072045.416898-1-chao@kernel.org>

Thanks, I added the patches back with this fix applied to the original patch. :)
On 05/28, Chao Yu wrote:
> syzbot report a f2fs bug as below:
> 
> CPU: 0 UID: 0 PID: 5840 Comm: syz-executor138 Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full)
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:408 [inline]
>  print_report+0xd2/0x2b0 mm/kasan/report.c:521
>  kasan_report+0x118/0x150 mm/kasan/report.c:634
>  sanity_check_valid_blocks fs/f2fs/segment.h:385 [inline]
>  build_sit_entries+0x1b0c/0x1f80 fs/f2fs/segment.c:5060
>  f2fs_build_segment_manager+0x3112/0x49f0 fs/f2fs/segment.c:5707
>  f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
>  mount_bdev+0x211/0x2c0 fs/super.c:1736
>  legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
>  vfs_get_tree+0x92/0x2b0 fs/super.c:1802
>  do_new_mount+0x24a/0xa40 fs/namespace.c:3869
>  do_mount fs/namespace.c:4206 [inline]
>  __do_sys_mount fs/namespace.c:4417 [inline]
>  __se_sys_mount+0x317/0x410 fs/namespace.c:4394
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> sanity_check_valid_blocks() should be called after set_ckpt_valid_blocks()
> in the loop, otherwise, @segno passed to sanity_check_valid_blocks() will
> become invalid, fix it.
> 
> Fixes: 313d10d79a82 ("f2fs: add ckpt_valid_blocks to the section entry")
> Reported-by: syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-f2fs-devel/68345c8d.a70a0220.253bc2.0097.GAE@google.com
> Cc: yohan.joung <yohan.joung@sk.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> Change v1:
> - merge this into original patch is fine to me as well.
>  fs/f2fs/segment.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 5ff0111ed974..b77b5de71a48 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -5054,10 +5054,10 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  	if (__is_large_section(sbi)) {
>  		unsigned int segno;
>  
> -		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
> +		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
>  			set_ckpt_valid_blocks(sbi, segno);
> -
> -		sanity_check_valid_blocks(sbi, segno);
> +			sanity_check_valid_blocks(sbi, segno);
> +		}
>  	}
>  
>  	if (err)
> -- 
> 2.49.0
