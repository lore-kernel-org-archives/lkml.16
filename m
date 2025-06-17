Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39972397A4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138691; cv=none; b=janohYqJzYsEIFYHZpMUAJKQfqQ5MKzROI6GK4nto7oyJLQk+E40fzj0w8u2SX88ag50FgBzxsmEcqUFumIyo+hk/Za4V0+qD1QFAGPHU2Gao70BZGhzWbpEaH76E5uvvv7r+4qxpaMB27ky7sHm0iZCMiSxZn1pHfbtRCGWWP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138691; c=relaxed/simple;
	bh=FbkeenEsIpXeuGcFiRuqBUmJZXXbBLKDpHvRSQRQAhQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kr6zbafyx1Df+W+JP0ruDcD9CowvYHd+7lIsmVlbHdWVszmEor8BpapZ2WYQjq6BVKkhghQFGgUifDJv4yuZzOCHNYSi0doMlKfOo/QPTq9yboaz75Kq2uMIZKLwBFaY3rQBfHKmyil5NV+mSmxyzUr0CZEi866GM2PnV43oUxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8Qlw7dx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8Qlw7dx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BD6C4CEE3;
	Tue, 17 Jun 2025 05:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750138691;
	bh=FbkeenEsIpXeuGcFiRuqBUmJZXXbBLKDpHvRSQRQAhQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=G8Qlw7dxlyuAis5O7Xfc+47Z9gkeDoib0rJUeVaZ5/iHFGpKrbym5CTqwK+WfDYYp
	 BT2ND9ZuLAW6HvIA+/X8gusnUmtBWKZ+oKrMfGEyplZgOEBn/9VG3exHEX2Oii/slk
	 CApO7i7WCF29ZoPSN20urMOE/5Qps6p7jORMWRuhIEt7OyUYl1GjXC8ASlZ8GK0vSb
	 J2zgZPjISXmgHmnx2D4mgAdnrwBdnFfd3JAcS/xgH9dctL2Kc09j1yff56qAuQFbv1
	 cN1MjQ1MX1xLLIWbvWTBZ63jK0IO6zJPGqEOwezVmQk9OkozKCgpppFrLGGEDQmMy6
	 CrTwk99tkQ4pQ==
Message-ID: <5e0b43d2-df0f-4378-91c2-d7ad204c4380@kernel.org>
Date: Tue, 17 Jun 2025 13:38:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v2] f2fs: enable tuning of boost_zoned_gc_percent via
 sysfs
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250616050445.1492-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250616050445.1492-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/25 13:04, yohan.joung wrote:
> to allow users to dynamically tune
> the boost_zoned_gc_percent parameter
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/gc.h    | 3 ++-
>  fs/f2fs/sysfs.c | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 5c1eaf55e127..11fba7636af7 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -194,6 +194,7 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
>  static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
>  {
>  	if (f2fs_sb_has_blkzoned(sbi))
> -		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
> +		return !has_enough_free_blocks(sbi,
> +				sbi->gc_thread->boost_zoned_gc_percent);
>  	return has_enough_invalid_blocks(sbi);
>  }
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..6c26b5e10c8f 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -628,6 +628,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> +	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
> +		if (t > 100)
> +			return -EINVAL;

We'd better assign boost_zoned_gc_percent here and return directly to
avoid all below unnecessary comparison between a->attr.name and entry
names.

Thanks,

> +	}
> +
>  #ifdef CONFIG_F2FS_IOSTAT
>  	if (!strcmp(a->attr.name, "iostat_enable")) {
>  		sbi->iostat_enable = !!t;

