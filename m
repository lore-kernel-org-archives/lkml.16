Received: from sxb1plsmtpa01-10.prod.sxb1.secureserver.net (sxb1plsmtpa01-10.prod.sxb1.secureserver.net [188.121.53.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C21B66E
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 00:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738370358; cv=none; b=f00bnuqTKfjXXynuWOLmRcfiJZ/TTa8gzAHR1z68JlclpYVkrgMrexCyd8cIo/zecN6Sw9Ke1X1m6/PduI44hMhAJVSdxh+WjtcfFQbyiCgik9LugzQGO7gvma3eVf64kSMNQmdJpEb/H/U69nxMw+CXgabv0mFr7nqrY43+Rl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738370358; c=relaxed/simple;
	bh=6Nn7RnBR83saL2KUSBgmXoUkfXHaN6YSdQmc8WfGrrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYzXJ/+n+dp9qow3KIKyXDhsiBE/oxufNROFMdIyeFRi5VHSL66aWQwdudHyVBwgMt8hmLxeh3mJVj6xScC8YuTohVO+RQoWXW+Bm9zMjZsLSEh43kMvIjeqC3tYAB1h0KKDJW+evdRnRV4Bfz3duGIiYtqmXiDZ1LFXmviRpko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=188.121.53.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id e1Q5tFy2QToVae1Q6tHkvq; Fri, 31 Jan 2025 17:31:35 -0700
X-CMAE-Analysis: v=2.4 cv=Z9QWHGRA c=1 sm=1 tr=0 ts=679d6b67
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=toyLi-lw1MM_Qq-_eXoA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <6dc540e0-7cae-44a5-995e-65a4a457b50d@squashfs.org.uk>
Date: Sat, 1 Feb 2025 00:30:36 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Squashfs: Add check for cache->entry to avoid NULL
 pointer dereference
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: linux-kernel@vger.kernel.org
References: <20250131202453.48174-1-jiashengjiangcool@gmail.com>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20250131202453.48174-1-jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGQfOkBTvsmXwSdu5t1rp0BT/VXf6SNa0iSM9vmDOxh4gi33TJ1cGzQfNrj2NuS6HTMwVgUIgLUWGfaD+TvxmRIYE2PepV5C2fa5eO2YhNqq5xNbNaet
 /4jmvteHp6ULf2G3uK47kM3+wmNbise+1tq79soqgQmnVeBASXSFSAxRoA3b/4T91uxOaHbgiem7/q5l+6EVc+6K5bdR4z4TSheB2EcQnYbLLfxPIMZEuo3s
 sNe0xqJvvaYcnMyWnX4pKQ==



On 1/31/25 20:24, Jiasheng Jiang wrote:
> Add a check for "cache->entry". Otherwise, if the allocation for
> "cache->entry" fails, "cache->entry[i].data" will cause a NULL pointer
> dereference.

NACK.

You're ignoring the i < cache->entries loop condition.

If cache->entries is > 0, then cache->entry is non-NULL.

If cache->entry is NULL, then cache->entries == 0, and the code is skipped.

In squashfs_cache_init() the cache structure is kzalloc'ed (all 0s).  If
allocation of cache->entry fails, then cache->entries is 0.

Phillip

> 
> Fixes: f400e12656ab ("Squashfs: cache operations")
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>   fs/squashfs/cache.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
> index 4db0d2b0aab8..5a3081583ea9 100644
> --- a/fs/squashfs/cache.c
> +++ b/fs/squashfs/cache.c
> @@ -201,16 +201,19 @@ void squashfs_cache_delete(struct squashfs_cache *cache)
>   	if (cache == NULL)
>   		return;
>   
> -	for (i = 0; i < cache->entries; i++) {
> -		if (cache->entry[i].data) {
> -			for (j = 0; j < cache->pages; j++)
> -				kfree(cache->entry[i].data[j]);
> -			kfree(cache->entry[i].data);
> +	if (cache->entry) {
> +		for (i = 0; i < cache->entries; i++) {
> +			if (cache->entry[i].data) {
> +				for (j = 0; j < cache->pages; j++)
> +					kfree(cache->entry[i].data[j]);
> +				kfree(cache->entry[i].data);
> +			}
> +			kfree(cache->entry[i].actor);
>   		}
> -		kfree(cache->entry[i].actor);
> +
> +		kfree(cache->entry);
>   	}
>   
> -	kfree(cache->entry);
>   	kfree(cache);
>   }
>   
