Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89729201269;
	Wed, 23 Apr 2025 12:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410720; cv=none; b=Ke0a5P1bFzqndJm8MB4Fes38ViHeq97lbhGYPmvg2+98eV3+iN7gjhkzOxcvwILbt8qbqUk4LKqB6AAHS7FL6oGooiX8E6aeEHfsE4Ot84N0ANP7mDvUJuocmfFZ1lprgqL5ghFmXsj2VtQuE4GG9c2L1o6Kr5c+lA0pJANj7Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410720; c=relaxed/simple;
	bh=Cje/rpX1nsP8ok0+Yu4Tmt7cPYgnhDzCx1sDh0X/cIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JoUpyoXp7Y/Y30qz1utNCDY+ap6DnjNZJbw90rLGPLk5LevS3D0O5xI7c6KzthlXzImti3M5kZ5NypSBGHADVR6grvpdVGTLtTBRkrnaBmVEqzTwKxtiydb+DgOjFtJueihVNaMIYkDOJdmRC4FADT2/2/9/a5ggFjKW07ixoBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04AB91063;
	Wed, 23 Apr 2025 05:18:33 -0700 (PDT)
Received: from [10.57.74.63] (unknown [10.57.74.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B410A3F59E;
	Wed, 23 Apr 2025 05:18:36 -0700 (PDT)
Message-ID: <a4277fb4-c982-43c7-9f02-e0050eff417a@arm.com>
Date: Wed, 23 Apr 2025 13:18:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of: Build warn for missing fn() in _OF_DECLARE
To: Liya Huang <1425075683@qq.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_BA80A2305727877DEE7BE20655D9CA825B09@qq.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <tencent_BA80A2305727877DEE7BE20655D9CA825B09@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-17 2:23 pm, Liya Huang wrote:
> The function pointer fn() in _OF_DECLARE macro might be NULL. For example,
> in __reserved_mem_init_node(), only non-NULL cases are handled, and NULL
> function pointers are ignored.
> 
> This patch introduces a check to handle cases where fn() is NULL. If fn()
> is found to be NULL, a warning is issued during compilation to notify
> developers about the missing function pointer.
> 
> ---
> The function pointer fn() in _OF_DECLARE macro might be NULL. For example,
> in __reserved_mem_init_node(), only non-NULL cases are handled, and NULL
> function pointers are ignored.
> 
> This patch introduces a check to handle cases where fn() is NULL. If fn()
> is found to be NULL, a warning is issued during compilation to notify
> developers about the missing function pointer.

This patch in -next appears to be responsible for syzbot complaining 
about build errors for some configs:

"
kernel/dma/coherent.c:410:1: error: static assertion expression is not 
an integral constant expression
kernel/dma/contiguous.c:497:1: error: static assertion expression is not 
an integral constant expression
"

https://lore.kernel.org/linux-iommu/6808d00a.050a0220.7184a.0010.GAE@google.com/

Also on closer inspection, just outside the diff context we still seem 
to be explicitly anticipating fn being NULL with:

	.data = (fn == (fn_type)NULL) ? fn : fn

so something doesn't seem quite right...

Thanks,
Robin.

> Link: https://lore.kernel.org/all/CAL_JsqK733Q9bbxC0Wz5uxyZ9m7bs+bci5kUJF9GJMv73-dO4w@mail.gmail.com/
> 
> Signed-off-by: Liya Huang <1425075683@qq.com>
> ---
>   include/linux/of.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index a62154aeda1b6a600c2b155ac486c0e0b56e0bf2..99d1d553e65b7970a3ecb5158774ca5185f297a0 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1523,6 +1523,7 @@ static inline int of_get_available_child_count(const struct device_node *np)
>   }
>   
>   #define _OF_DECLARE_STUB(table, name, compat, fn, fn_type)		\
> +	static_assert((fn) != NULL);	\
>   	static const struct of_device_id __of_table_##name		\
>   		__attribute__((unused))					\
>   		 = { .compatible = compat,				\
> @@ -1530,6 +1531,7 @@ static inline int of_get_available_child_count(const struct device_node *np)
>   
>   #if defined(CONFIG_OF) && !defined(MODULE)
>   #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
> +	static_assert((fn) != NULL);	\
>   	static const struct of_device_id __of_table_##name		\
>   		__used __section("__" #table "_of_table")		\
>   		__aligned(__alignof__(struct of_device_id))		\
> 
> ---
> base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
> change-id: 20250417-_of_declare-ac80b59d952d
> 
> Best regards,

