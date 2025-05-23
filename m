Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01CE2DCBE7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747967573; cv=none; b=r/ppGFcd90MSD2A0JTfRt3ZVrYPCqGPP1ho4DYFeF8MQFFqLwwgwY+P27dKe3ErlEsO8dOGBmEhQYh7vj9nXt8kvHvTkG93g1auz/2aejphSXcfaNm/gOlFIjc3XW7h0lfShRbCDkOoIvN2Y0wjrj6NmOz/NrJkED1OxrcDbedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747967573; c=relaxed/simple;
	bh=S25lebnZRW5zzcfOg+loS2fbdOdPCUzd3TChisW/CfM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A7mbZkwOwQaMUMHXmM5YzSsqdmYFC8o3eGlnSU4SqFu5F0q0anHki03aDtzO9f2rVrwH9C6y8C+U9ic1AuFa3z8SL/j6OpVcTpLeJL26dbZielQCPgjX9vH6fy7RlUWvqeebwDl8GxqI8FiilkQOowOyk8fRnytKatIu61uTdYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F70IWq7d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F70IWq7d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEDEC4CEE4;
	Fri, 23 May 2025 02:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747967573;
	bh=S25lebnZRW5zzcfOg+loS2fbdOdPCUzd3TChisW/CfM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=F70IWq7dbwv1hU8ShOf7gZi/CeN0tFvoDF/xdoDjSTCg7r69c/Nt/aZXOj63N0ij6
	 EsTNnnsgvIGGihMY7zUF3qyupf5ueE3KRoR0fr4rXRjgahIQmOM85ZWuMF3CsmcSsl
	 PACw7y/5qOob1AoSrjQvhQmhqzo84vhUsN3AwDgKjXOiCzLORdjAkUw0EMOYXEA9J7
	 D090s/p8cjd12xL6xZf+uYZ8/54BLYTuPVCdfW8D76FPtHfq41zWbh0wk5ARVTo4Df
	 ROP1ePaGxKlyCO0NFHJanemjV1dV7+MGBSSuw/Xvf440cMwssyrOhVKyBclXAM1lkP
	 ZA4j77cZtlZPw==
Message-ID: <6c51b7aa-8caa-4dae-b079-01ea8571599b@kernel.org>
Date: Fri, 23 May 2025 10:32:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org,
 syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com,
 Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to skip f2fs_balance_fs() if
 checkpoint is disabled
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250521115635.829744-1-chao@kernel.org>
 <CAHJ8P3J8cX5+pVkE4TT24zh+wvW06KrpKXT2-7cRx3i8XzBbNw@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3J8cX5+pVkE4TT24zh+wvW06KrpKXT2-7cRx3i8XzBbNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/23/25 09:39, Zhiguo Niu wrote:
> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> 于2025年5月21日周三 20:02写道：
>>
>> INFO: task syz-executor328:5856 blocked for more than 144 seconds.
>>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> task:syz-executor328 state:D stack:24392 pid:5856  tgid:5832  ppid:5826   task_flags:0x400040 flags:0x00004006
>> Call Trace:
>>  <TASK>
>>  context_switch kernel/sched/core.c:5382 [inline]
>>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>>  __schedule_loop kernel/sched/core.c:6845 [inline]
>>  schedule+0x165/0x360 kernel/sched/core.c:6860
>>  io_schedule+0x81/0xe0 kernel/sched/core.c:7742
>>  f2fs_balance_fs+0x4b4/0x780 fs/f2fs/segment.c:444
>>  f2fs_map_blocks+0x3af1/0x43b0 fs/f2fs/data.c:1791
>>  f2fs_expand_inode_data+0x653/0xaf0 fs/f2fs/file.c:1872
>>  f2fs_fallocate+0x4f5/0x990 fs/f2fs/file.c:1975
>>  vfs_fallocate+0x6a0/0x830 fs/open.c:338
>>  ioctl_preallocate fs/ioctl.c:290 [inline]
>>  file_ioctl fs/ioctl.c:-1 [inline]
>>  do_vfs_ioctl+0x1b8f/0x1eb0 fs/ioctl.c:885
>>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>>  __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
>>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>>
>> The root cause is after commit 84b5bb8bf0f6 ("f2fs: modify
>> f2fs_is_checkpoint_ready logic to allow more data to be written with the
>> CP disable"), we will get chance to allow f2fs_is_checkpoint_ready() to
>> return true once below conditions are all true:
>> 1. checkpoint is disabled
>> 2. there are not enough free segments
>> 3. there are enough free blocks
>>
>> Then it will cause f2fs_balance_fs() to trigger foreground GC.
>>
>> void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>> ...
>>         if (!f2fs_is_checkpoint_ready(sbi))
>>                 return;
>>
>> And it mounts f2fs image w/ gc_merge,checkpoint=disable, so below deadloop
>> will happen:
>>
>> - f2fs_do_shutdown              - vfs_fallocate                         - gc_thread_func
>>                                  - file_start_write
>>                                   - __sb_start_write(SB_FREEZE_WRITE)
>>                                  - f2fs_fallocate
>>                                   - f2fs_expand_inode_data
>>                                    - f2fs_map_blocks
>>                                     - f2fs_balance_fs
>>                                      - prepare_to_wait
>>                                      - wake_up(gc_wait_queue_head)
>>                                      - io_schedule
>>  - bdev_freeze
>>   - freeze_super
>>    - sb->s_writers.frozen = SB_FREEZE_WRITE;
>>    - sb_wait_write(sb, SB_FREEZE_WRITE);
>>                                                                          - if (sbi->sb->s_writers.frozen >= SB_FREEZE_WRITE) continue;
>>                                                                          : cause deadloop
>>
>> This patch fix to add check condition in f2fs_balance_fs(), so that if
>> checkpoint is disabled, we will just skip trigger foreground GC to
>> avoid above deadloop issue.
>>
>> Reported-by: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/linux-f2fs-devel/682d743a.a00a0220.29bc26.0289.GAE@google.com
>> Fixes: 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable")
>> Cc: Qi Han <hanqi@vivo.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - add missing Closes line
>> - fix to use git commit description style
>>
>>  fs/f2fs/segment.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 5ff0111ed974..19b716fda72a 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -433,6 +433,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>>         if (need && excess_cached_nats(sbi))
>>                 f2fs_balance_fs_bg(sbi, false);
>>
>> +       if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>> +               return;
>>         if (!f2fs_is_checkpoint_ready(sbi))
>>                 return;
> Hi Chao,
> When I read this patch, I feel that it is somewhat redundant with the
> following checking about SBI_CP_DISABLED in f2fs_is_checkpoint_ready.
> Can we reorganize these checks for the f2fs_balance_fs case?

Zhiguo,

Oh, I agreed. I think we can just use is_sbi_flag_set(sbi, SBI_CP_DISABLED)
instead of f2fs_is_checkpoint_ready() here, let me revise it in v3.

-       if (!f2fs_is_checkpoint_ready(sbi))
+       if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))

Thanks,

> This will make the code easier to read and understand.
> thanks!
>>
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

