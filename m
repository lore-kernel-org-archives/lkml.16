Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990D71F8730;
	Thu, 24 Apr 2025 22:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745534000; cv=none; b=ozDk2xgodbRSAwaUq2/eBebHnPfalrp8Nf2nsylOOkJyGU4b7wQReOEdw+pi2F87gSDffQDZtUgiN0u126Nm2jnWIzeZgu9lzfRpzeaAz4DXepAX/bNFAbNmRkpKSmt4xoV/d/hxlZOPbjmd9Fc2PLzKK+RlccmItQvXXgHlZiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745534000; c=relaxed/simple;
	bh=Uz13JfKvZ+24a7z1jXBRScfADeh8EaIQpZXTqJCuKo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9Sgj3lip+4IKgf3EkggZC9zc7x3PtpO/1DeeLZH7dxtkGhuyLm6o8qGrQJoCBBRBPxpznDvGD51ZgF5GFQ9VKsD5xAdvbPtLJIIC6/0Lrph7iItoBO5BqWgwTzx88BaRjlXwm60tt3WIIQnQwz/4fmvIJESt3GO/5FUIWtuGGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+Yf/ze9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+Yf/ze9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90FA0C4CEE3;
	Thu, 24 Apr 2025 22:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745533998;
	bh=Uz13JfKvZ+24a7z1jXBRScfADeh8EaIQpZXTqJCuKo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q+Yf/ze96gqzV5dUGQsAMk2JWKAASE3FC9Voo6SgaKi8F3YTgAhY99jgHISrZgRIN
	 WucoY4Pvb1ZomKx23yeqVImNBdtINmCv1Wc9umqlGxRycznaTswP+GSzndtyl6f/cQ
	 yUfuy1MdKo4bOO4B+DKUcpqndb7h4D2qizknv3aHd5EOXsMrw8lBeCHwYkDLMfABso
	 noeKNgH7eGGlP82aoPBi6UVGaVbB50VqvXZhz+y3A4pKmupBPKKerchyzTuxrACpcU
	 LbYzvT+GQ5Kg2Mr5s6LWtIQfJYZhiz4ALS4ZbMpHjoKeHpqrBYQLpFQkKwEBHiFzGJ
	 KtDlz5Ifmx5Ow==
Message-ID: <fdb7423f-3bb5-4921-a27f-c8db6f3a6f16@kernel.org>
Date: Thu, 24 Apr 2025 17:33:16 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] clk: socfpga: clk-pll: Optimize local variables
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250219104224.1265-2-thorsten.blum@linux.dev>
 <d7df3b86-c3ff-48af-ad72-428e105976b9@kernel.org>
 <0BD7D71D-6F6B-4864-BEA7-E13563908D62@linux.dev>
 <FC8B34B6-642F-4228-90FB-D8B3148C03D3@linux.dev>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <FC8B34B6-642F-4228-90FB-D8B3148C03D3@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/25 07:22, Thorsten Blum wrote:
> On 8. Apr 2025, at 19:45, Thorsten Blum wrote:
>> On 19. Feb 2025, at 13:42, Dinh Nguyen wrote:
>>> On 2/19/25 04:42, Thorsten Blum wrote:
>>>> Since readl() returns a u32, the local variables reg and bypass can also
>>>> have the data type u32. Furthermore, divf and divq are derived from reg
>>>> and can also be a u32.
>>>> Since do_div() casts the divisor to u32 anyway, changing the data type
>>>> of divq to u32 removes the following Coccinelle/coccicheck warning
>>>> reported by do_div.cocci:
>>>> WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead
>>>> Compile-tested only.
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>>>> ---
>>>> drivers/clk/socfpga/clk-pll.c | 4 ++--
>>>
>>> Applied!
>>
>> Did this patch and [*] get lost somehow?
>>
>> They aren't in -next and also didn't make it into the last merge window.
> 
> Does anybody else know what happened or where I could find them?
> 

This is my bad. I missed the merge window for the PR. I'll resend it 
this time.

Dinh

