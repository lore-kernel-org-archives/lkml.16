Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4151B414F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181962; cv=none; b=cJAeqFNRTQ/MRNtWZTlR1HLZTD1Kh5Gy5dz59bS/HJZj0YMuRTHoidleA1nRQbsCjRuXjEziJOPvcBmgM3SM8RsnxhkCauiGnt/Zk3wDpV8bnOi+JyTV7V/vatf24mHzhku2T1hc3EQknerJcZwbkeZmVyUxO2Qn3YrAU/itrHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181962; c=relaxed/simple;
	bh=lF71qqCebU1OJC3HnOGdjiCKxuuDaM0gULKXsGw1eDw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Zgw2QqhhQQ1GNKAAU6bh2qJ+KZr2h0UmnLJhHy4NV2XsdD9YbVZcJkqk1zhez0+JQPU4rEQ6zj7UhvJrLuYYydZJSJ36Ix4QgZ91TE6zVWc7zlK8Q26Eqc6CoOZZcUBNI16ViLoOjZa9V+jxFG2tlcoc+ElsL7qqgF9uXl9EqMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJ97+4Sv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJ97+4Sv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CCAC4CEE4;
	Mon, 10 Feb 2025 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739181962;
	bh=lF71qqCebU1OJC3HnOGdjiCKxuuDaM0gULKXsGw1eDw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=dJ97+4SvIxmFfust64zmMcq2g3/KFZNFJQ1f7zV1y30VlqgOiSjcfUNox+6+06tMw
	 y1+Lr/zTB32GR2K89Vjzf8I+Gkeaw8bE9/7qnUrDaJXXnUhlFiEoTTUt+sUuvMoJb4
	 40uT/+pY/cQXPneOMBDpiUgjFm16tRXoQZAUqF0CqJ4KKextTufrXAIVlQq/gdKidf
	 M21ON/6KGY87sx+s9SafR4T9In7LuSYN7jigIMsTkPEF9a+IPRVI8YIGP0nM0oquR5
	 ZFRj8tv0YS2Ll0A8NTfrJZY7b7OUq3+M2oXK4f4xeZSwGEbE/FzZZD3N3xh2xHQYH3
	 7wm+wNUkKWq4g==
Message-ID: <5a1b2716-bcc4-4a5e-95ce-ba45f508738d@kernel.org>
Date: Mon, 10 Feb 2025 18:05:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, niuzhiguo84@gmail.com, ke.wang@unisoc.com,
 Hao_hao.Wang@unisoc.com
Subject: Re: [PATCH] f2fs: fix to return SHRINK_EMPTY if no objects to free
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1739150649-31850-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1739150649-31850-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/10/25 09:24, Zhiguo Niu wrote:
> Quoted from include/linux/shrinker.h
> "count_objects should return the number of freeable items in the cache. If
>  there are no objects to free, it should return SHRINK_EMPTY, while 0 is
>  returned in cases of the number of freeable items cannot be determined
>  or shrinker should skip this cache for this time (e.g., their number
>  is below shrinkable limit)."

Seems in 9b996468cfdb ("mm: add SHRINK_EMPTY shrinker methods return
value"), it didn't convert most of filesystems, left most filesystems
to return 0 which indicate there may have objects to free. :(

> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
