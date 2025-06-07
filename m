Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7B1F8AF8
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749295451; cv=none; b=qcZ538OGkyB07NGgoc7d4MRxAYpb1gj5iASxkXWkX4kWWC65qAycXwySzq3mHZmO45VlcYnKFTW2Y3JyAuHyvqpaOZc8YD60T4P10XoSMaW9Erug6UBbtRGc5/KWxT2zDdLnkZSHXYsJRT9ByVoCDIRCuEA18mPYUVAkE324Ajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749295451; c=relaxed/simple;
	bh=TMkU4Y5022JaJW8x8OEDEeW2ERrB9D2x6QSYL6BAWvc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CAa5n5q1s8NGP1LfFTaE4iBfxAyIzRQqpi/E8qUJlDUBPABrUMbvu4wo/6yPDK1eHw7/ZbxMtKEdu7fEMI111ahJ5p25OCmnaawHQPEgU/cJ5pxHHQkCsCFczdJWF6ULBvqCjCB69NV6D3TR4Y8ZOvm87xq1++T/EYQl8JHuqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqYCd7GO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqYCd7GO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C47AC4CEE4;
	Sat,  7 Jun 2025 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749295451;
	bh=TMkU4Y5022JaJW8x8OEDEeW2ERrB9D2x6QSYL6BAWvc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=fqYCd7GOr61MX1MMSqi58Xyd4dSSBctm68h9p0sYIJ7umnIeVD96ed84mGymwPb6N
	 yBe2ii1sNF+vUnpcMlTmjmKmjQJ6sB+ArwwLB7jYbx6cTDwxOG7X8nN2yLGTiCes4+
	 Up2oDdOW9utkPoG0pW4poGsAZ92uPXTj3eng5cXGRwhIg6TFzTiJBC8kmm19r3T6T5
	 HdTmF0NOit+BN6BzjxjPIoiXtlQt2ds2MgddnJSEJuc4KgsXabId4F38pyqQR7vu/X
	 Po1rCkLydHkV+SjZABAPFEtUYxiEdUHYu7CDqeOa9ZJ48fTiywrh8hWoDjXNto5R79
	 SqEaW1NErl56A==
Message-ID: <369054af-94f3-4d96-aa9f-5d8a3a1af5c3@kernel.org>
Date: Sat, 7 Jun 2025 19:24:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: add gc_boost_gc_greedy sysfs node
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250606215932.1226604-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250606215932.1226604-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/7 5:59, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add this to control GC algorithm for boost GC.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
>   fs/f2fs/gc.c                            | 3 ++-
>   fs/f2fs/gc.h                            | 1 +
>   fs/f2fs/sysfs.c                         | 7 +++++++
>   4 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 931c1f63aa2e..b978d183f5b1 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -869,3 +869,9 @@ Description:	Set a multiplier for the background GC migration window when F2FS G
>   		boosted.
>   		Default: 5
>   
> +What:		/sys/fs/f2fs/<disk>/gc_boost_gc_greedy
> +Date:		June 2025
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
> +		Default: 1
> +
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index de7e59bc0906..31afee3af1a0 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -141,7 +141,7 @@ static int gc_thread_func(void *data)
>   					FOREGROUND : BACKGROUND);
>   
>   		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
> -				gc_control.one_time;
> +			(gc_control.one_time && gc_th->boost_gc_greedy);
>   
>   		/* foreground GC was been triggered via f2fs_balance_fs() */
>   		if (foreground)
> @@ -198,6 +198,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>   	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
>   	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
>   	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
> +	gc_th->boost_gc_greedy = 1;

How about using GC_GREEDY macro instead?

>   
>   	if (f2fs_sb_has_blkzoned(sbi)) {
>   		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index efa1968810a0..1a2e7a84b59f 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -69,6 +69,7 @@ struct f2fs_gc_kthread {
>   	unsigned int boost_zoned_gc_percent;
>   	unsigned int valid_thresh_ratio;
>   	unsigned int boost_gc_multiple;
> +	unsigned int boost_gc_greedy;
>   };
>   
>   struct gc_inode_list {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index b0270b1c939c..5de7cd5c4fd8 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -824,6 +824,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "gc_boost_gc_greedy")) {
> +		if (t > 1)

Ditto,

Thanks,

> +			return -EINVAL;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;
> @@ -1051,6 +1056,7 @@ GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
>   GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
>   GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
>   GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
> +GC_THREAD_RW_ATTR(gc_boost_gc_greedy, boost_gc_greedy);
>   
>   /* SM_INFO ATTR */
>   SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> @@ -1222,6 +1228,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(gc_boost_zoned_gc_percent),
>   	ATTR_LIST(gc_valid_thresh_ratio),
>   	ATTR_LIST(gc_boost_gc_multiple),
> +	ATTR_LIST(gc_boost_gc_greedy),
>   	ATTR_LIST(gc_idle),
>   	ATTR_LIST(gc_urgent),
>   	ATTR_LIST(reclaim_segments),

