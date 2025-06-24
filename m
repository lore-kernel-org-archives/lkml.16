Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A43226B740
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756196; cv=none; b=Rt5yTHU9OIcLOdflpgry+G3nrT4XwybWL/Wt+KOBDPP/tnDpZlc/mba7Oxurpart4G/iwhpVUfYgwBH+h1l/poCdpkUCwrtaAoFXV9xJKx/UYex8QNmlmIs9A5N1YqvfEnZpBmYMtVj94OIzBVck8n6QYVS9WotJt3/AwlenJY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756196; c=relaxed/simple;
	bh=oxJVBcprBlyRyXuehTvJpzRAd0H/PXSR6otU+soCaI8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JYb7UBqp02J7UfoAeMghVampGWFBxjz1FsBP+rnnux0CKqyvSx+0U1uL682R4m8WzKN60HvRDkOoKARaynp33SPboG+JItVjT5uWXwZuyP0UKb4jGRSIy4Vuu5ILj28zVm8+ycODIO75BRAA1l1896u3hW3QxcdVlxt6h/W68YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtFonMOk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtFonMOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3373C4CEE3;
	Tue, 24 Jun 2025 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750756195;
	bh=oxJVBcprBlyRyXuehTvJpzRAd0H/PXSR6otU+soCaI8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=RtFonMOkAIH5R3soF88T3khCH09DQhDHemHywOhVptjn8Y7Bcx+/tQW9n29UOZE9e
	 HAAggi4Rtzjs9wa2bRETGm83JjdMkOMf1yDmyszcd/GDgb+Aky+fzHAiktLqXHa7Cx
	 JlUbjYUYIggsPRYr/OFXXxxGA74hW3IQNW4hnWEAqKDDZ2HzPKEkYVIr5AcY6S4XxC
	 Oyuuas+FVPuN8TYMseHNEeLSkFCU//WV1lsQ6hDFeYMQff2n0KqPBtWVKLmL6q6Sb7
	 WGJ4NB+UBX+u8593d50hlX6aOK/tQI0A2LPtBB1cvZKOHaxQ2/SlxNNWycQhwAhY/H
	 71WSauuwALKgw==
Message-ID: <02756532-4e17-4b41-9f48-157b0dbc1db2@kernel.org>
Date: Tue, 24 Jun 2025 17:09:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v3] f2fs: enable tuning of boost_zoned_gc_percent via
 sysfs
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250618060414.97-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250618060414.97-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/18 14:04, yohan.joung wrote:
> to allow users to dynamically tune
> the boost_zoned_gc_percent parameter

Well, it seem this patch did two things:

1. fix to check upper boundary for value of gc_boost_zoned_gc_percent.
2. allow need_to_boost_gc() to use last value of boost_zoned_gc_percent 
dynamically.

Can you please split this patch to two?

Thanks,

> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>   fs/f2fs/gc.h    | 3 ++-
>   fs/f2fs/sysfs.c | 7 +++++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 5c1eaf55e127..11fba7636af7 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -194,6 +194,7 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
>   static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
>   {
>   	if (f2fs_sb_has_blkzoned(sbi))
> -		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
> +		return !has_enough_free_blocks(sbi,
> +				sbi->gc_thread->boost_zoned_gc_percent);
>   	return has_enough_invalid_blocks(sbi);
>   }
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..d0ec9963ff1b 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -628,6 +628,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
> +		if (t > 100)
> +			return -EINVAL;
> +		*ui = (unsigned int)t;
> +		return count;
> +	}
> +
>   #ifdef CONFIG_F2FS_IOSTAT
>   	if (!strcmp(a->attr.name, "iostat_enable")) {
>   		sbi->iostat_enable = !!t;

