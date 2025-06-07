Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AAF1FF5F9
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749295473; cv=none; b=QkOqGx8JatZuVarDQkbRwj/gzulsiHTNogDBG2e1TyQ2m851lBVyAfzyeKRZV+UyByl10aFLqY3Vih2hxIXAax8I16Qn+1g0X8kqNG7iy0UowcdTNu4MITINzpQKBBGKHZ8ubyiHqh1G9t0BThWso5XpJLYBfVYkfOeZac9C1+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749295473; c=relaxed/simple;
	bh=nuUPsTwBuGQIwTKkqwCC+8mAEXl6kp7AHsVvWhxw5F8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sMsD8lC00dAwJOw+lurRMcWee9rKmsWqA0rhssj4j2rb8vMOzeezbIcR18N/clNvb+tTCZB+VOco0GDvBKzp25SCXnBB7eOtzvD/+HawnhQqRkhcOy0tTCDFasJkCwhsjeyXGYPN+Vywuqhco1Jiv5e2nUYlora7wlD8IdXQ0Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tb+sNoMu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tb+sNoMu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DB4C4CEE4;
	Sat,  7 Jun 2025 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749295472;
	bh=nuUPsTwBuGQIwTKkqwCC+8mAEXl6kp7AHsVvWhxw5F8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Tb+sNoMun6BAZt2rbPS/Qtg+fz85SmubVh+/sdWJlhV35bOtu47qQnTFXlv41Iahf
	 4FozRfiXbF+I4Tnvo4EfO/pqrtWZHpGCapwQej56S8ONsatBoGy/WVDYiNs7a8+rE1
	 TD6J7l694AoTkWLnjOCrnSEdTnPkHExI29zSnBN7hojKx4sAZ7/99YUx1ksJ7Y5XyI
	 EVwJK/M+RZkQOpTwzyg/mic8v278OOJTtxu1LAp3ElAs0SRQGj2NzA+lAlVdhfQGY9
	 ZppYau99Hm/4+/fKoNK5oLN8LPTqrReZJ5kjLu7DanWge26lfkLJA0QL1Y/QX3kTa3
	 KB08BJ/LdliPw==
Message-ID: <b5781bc9-ed04-4e3f-bbc1-126e18620ff3@kernel.org>
Date: Sat, 7 Jun 2025 19:24:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Sheng Yong <shengyong1@xiaomi.com>
Subject: Re: [PATCH] f2fs: fix bio memleak when committing super block
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250607064116.2993239-1-shengyong1@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250607064116.2993239-1-shengyong1@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/7 14:41, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> When committing new super block, bio is allocated but not freed, and
> kmemleak complains:
> 
>    unreferenced object 0xffff88801d185600 (size 192):
>      comm "kworker/3:2", pid 128, jiffies 4298624992
>      hex dump (first 32 bytes):
>        00 00 00 00 00 00 00 00 80 67 c3 00 81 88 ff ff  .........g......
>        01 08 06 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
>      backtrace (crc 650ecdb1):
>        kmem_cache_alloc_noprof+0x3a9/0x460
>        mempool_alloc_noprof+0x12f/0x310
>        bio_alloc_bioset+0x1e2/0x7e0
>        __f2fs_commit_super+0xe0/0x370
>        f2fs_commit_super+0x4ed/0x8c0
>        f2fs_record_error_work+0xc7/0x190
>        process_one_work+0x7db/0x1970
>        worker_thread+0x518/0xea0
>        kthread+0x359/0x690
>        ret_from_fork+0x34/0x70
>        ret_from_fork_asm+0x1a/0x30
> 
> The issue can be reproduced by:
> 
>    mount /dev/vda /mnt
>    i=0
>    while :; do
>        echo '[h]abc' > /sys/fs/f2fs/vda/extension_list
>        echo '[h]!abc' > /sys/fs/f2fs/vda/extension_list
>        echo scan > /sys/kernel/debug/kmemleak
>        dmesg | grep "new suspected memory leaks"
>        [ $? -eq 0 ] && break
>        i=$((i + 1))
>        echo "$i"
>    done
>    umount /mnt
> 
> Fixes: 5bcde4557862 ("f2fs: get rid of buffer_head use")
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
