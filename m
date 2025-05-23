Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAC0170A0B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747966794; cv=none; b=Ocfd6qqUVY15wX7mUr6PNkeAolhChYJR8RIXa01BzF+2MU6Wt8GmM5v6XHPT+DPnUsh7LQZgSm4mRBHLQ7bvnSD+8rk1i6UEvmYwJdE8xgjl7xDAb1lq+EIPFcecuUn7J6/nFEh7KDS7cF9qs3EtzcZbjrT1S7i0dCGQzUaBqqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747966794; c=relaxed/simple;
	bh=XiRD1ZTdrDd/+WnwCgXmWMh44zeaMtvWvY4bQQPbBYo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q2hxpTNutHIA8U30h28Of/Ij/M1AmteS08Efuor8Nu3/YXzaKysbbm4zYGTbbIpRoekw+acuPvIt3A7Fd6k/n/mPxHB9F9h5Sih5sX3h8zRjQaHvXFJUIOcQ6RHMQuwC/ceAWwqKH3b/TZ8mJRmtMzhgBq7mghnY1CRbtmYrcbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nmeiuq3H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nmeiuq3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E136C4CEE4;
	Fri, 23 May 2025 02:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747966793;
	bh=XiRD1ZTdrDd/+WnwCgXmWMh44zeaMtvWvY4bQQPbBYo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Nmeiuq3HYOLlLYm1vA2r/9hfnTgBxRH+WIc3Nahr2qmjVRAfarCqLnWipOtjz97+C
	 v3krBo3TulWAj04NIYojX/OO/jHttqc1xW69kBRyP42zTK/zoEKizPP7jdb5O90qML
	 0r72ajp8/XG9wa/B6WHzLXafSu1rPQYyqvxTQpmd/OLUMfypFJhDabVfr7ybboPN6u
	 IY6+K6NzwXgB8zKs+2ET+GyQ5r+Q9A9ImXVInCppsANXpHalKdLLaipyscUIj/Eg4G
	 6Ebp893qTguoQa4ly6onqZS+V1aFGMYe7lNES4VxhLwenUd2v8qXn/iAjjT7v6CIGv
	 UM054D4cbzSSg==
Message-ID: <2e20d818-56d7-4b34-90a5-3503dc02b164@kernel.org>
Date: Fri, 23 May 2025 10:19:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH] f2fs: enable tuning of boost_zoned_gc_percent via sysfs
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250523002146.763-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250523002146.763-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/25 08:21, yohan.joung wrote:
> to allow users to dynamically tune
> the boost_zoned_gc_percent parameter
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/gc.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 5c1eaf55e127..f9ff68dc2bcc 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -194,6 +194,8 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
>  static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
>  {
>  	if (f2fs_sb_has_blkzoned(sbi))
> -		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
> +		return !has_enough_free_blocks(sbi,
> +			sbi->gc_thread->boost_zoned_gc_percent < 100
> +			? sbi->gc_thread->boost_zoned_gc_percent : 100);

How about checking lower/upper boundary for boost_zoned_gc_percent
during setting its value via sysfs? Also update the manual page?

Then we can use sbi->gc_thread->boost_zoned_gc_percent directly here?

Thanks,

>  	return has_enough_invalid_blocks(sbi);
>  }

