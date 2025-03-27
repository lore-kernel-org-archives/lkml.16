Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B94A48
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743055327; cv=none; b=uSQ/MgsnCMaPHfJbjktSmLX5Ppmt3CSMEg0vm1umAcW2wvHTalfC3wKFrdHUsCO3svwMi+1Q+eg5by1ZjUI3yh1+UsRWRFuUuxileYLRH7Dw9Mbaju/HmmDzlVRIz5dD+iZV1NvycU4Z+UVENh8qoHsMn/Xpk/eSJnYrzQxtETg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743055327; c=relaxed/simple;
	bh=cOARddFxtT4x6J653OMfN+s3lEmPCGmX0P+GzDTJSZg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nKi503XsbDD6ltDl4xho+wvQqMDAxPE5K7TMLcw/cw/u9H4pnSPuZV0siKXv65SU4FtrwGYimwFRwBPMkg4XeYKn6YMhdZcYc0+ioheJie8UcLa4fvKZPMYP0+owM1uqNgLQ+QX7fRJiTtSnSJsgIDpfPHY7igCr3OX7hJ2qc8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUBt3OTT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUBt3OTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA18C4CEDD;
	Thu, 27 Mar 2025 06:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743055326;
	bh=cOARddFxtT4x6J653OMfN+s3lEmPCGmX0P+GzDTJSZg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=QUBt3OTTRe3hCvzR5e2P+5+9zIq+D4SJaNWRR2gcrUokGy0d0AgEchHFfzB7cY9x2
	 q1H1km3xKPRs2La7nOcyQbBSlJnmBtFs+KT0xwADcUtD+5W3HEOn12YXayAC/rZaFS
	 7RvcOVp22fOyEwUPfUiv0/OOS90kqFum7E67KBBbyK0VqkKrsgoZbaXwuEd7UtnlHD
	 Q6K4DvbfpHzFvlqyXhgJvaxWlMgPwtNGGTNAgU7W3gNWc7QbnpEt6LQIJniqPOJtdq
	 /cEmjWjQIDPqdZ7z70rk/iH5G7T6wjP4ikWm95rxePhFuwCdGHTPL1JB1Bs68yPU0w
	 mlT9C8ptvLUMw==
Message-ID: <bf3f571c-a6bf-4a17-8745-039b37ac4f48@kernel.org>
Date: Thu, 27 Mar 2025 14:02:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Yohan Joung <yohan.joung@sk.com>
Subject: Re: [PATCH] f2fs: prevent the current section from being selected as
 a victim during garbage collection
To: Yohan Joung <jyh429@gmail.com>, jaegeuk@kernel.org, daeho43@gmail.com
References: <20250326141428.280-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250326141428.280-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 22:14, Yohan Joung wrote:
> When selecting a victim using next_victim_seg in a large section, the
> selected section might already have been cleared and designated as the
> new current section, making it actively in use.
> This behavior causes inconsistency between the SIT and SSA.

Hi, does this fix your issue?

https://lore.kernel.org/linux-f2fs-devel/20250325080646.3291947-2-chao@kernel.org

Thanks,

> 
> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/gc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 2b8f9239bede..4b5d18e395eb 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1926,6 +1926,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  		goto stop;
>  	}
>  
> +	if (__is_large_section(sbi) &&
> +			IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
> +		goto stop;
> +
>  	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
>  				gc_control->should_migrate_blocks,
>  				gc_control->one_time);

