Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB891DF268
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749076561; cv=none; b=IDznKAlfNB9Jo+uGn4o5z1zkIMb4zl2haLf6Mpfm5sbcgvZkCiIckiGQ8njHS3A+bomsUtrwoJPsLeSpjeYmeuTImiB//y/tM3vDak8qGtJAXeINVAxZEhSwLJaBgXa/UnjD1wzzKqs51whlz8X6+T3nu3Zj8EMUG9WWU5RVSgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749076561; c=relaxed/simple;
	bh=z4sAJlikg1q7gLyQgA6JO4+ybijqmyRCm1WZOIyn6Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3P2W8AFHmqre0n4EcLQtuhHNNBDXbjVOcLjb7h7MwGHVFQ6jjHNBg3yS1MwoChBcdO91rxcat85nbf8ydcCIL9ZbmGrGrX7cPEuR3/F+ogWQVjXTtKSyAM4QbLoC7rao09mLJBZu2M7G1C85gLtj1QgXqzw60L1cnHX7+lfw/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=WK2Nra8Y; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="WK2Nra8Y"
Received: from [IPV6:2601:646:8081:9482:7a24:4997:8aee:1bc9] ([IPv6:2601:646:8081:9482:7a24:4997:8aee:1bc9])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 554MZPcf206205
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 4 Jun 2025 15:35:26 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 554MZPcf206205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025052101; t=1749076527;
	bh=6l3rtC8kpL9Sl7olv7IDhf6Z+XLo1eOCHrwhTZ6ID4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WK2Nra8YPbo71WxS9Q4D+xg7DwJyrqEVoNzN9+pyJOffK2+BzzoQWHnX8zHVJXaTu
	 d+lGfhNhBMCo1Z4TLfAoNYWeKDV/Lp/TN2EDt7a6KczL4FXlYh8GfltRllxqsmifXm
	 oC+dgzhi4AUCIjO54sQEaBbs/gaEfwoY68z4ceE+BLGOsBX+g8w0pD2kO8QD1IjsX8
	 9Fl629rkCH9KTShGq9ZRmjQJs8Mh+79Iryfm3yxQOB+trkWv6nocy5I1/VP12xbFZ/
	 vOE0/ZvE5Qbyh8Mg4qTtzFaTHlGpcw1W0JMuKdf4sG+lMzdrZXUtjdWXiueq4Z42Jk
	 LcF5+1NID8ZAw==
Message-ID: <0ff715d6-c03c-4972-a92d-ff81c2bf61ba@zytor.com>
Date: Wed, 4 Jun 2025 15:35:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kerrnel/FPU: clear MP bit of cr0
To: Khalid Ali <khaliidcaliy@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
References: <20250526082414.689-1-khaliidcaliy@gmail.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20250526082414.689-1-khaliidcaliy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-05-26 01:22, Khalid Ali wrote:
> From: Khalid Ali <khaliidcaliy@gmail.com>
> 
> Clear MP bit when initializing x87 FPU, since what it does
> is making WAIT/FWAIT instructions to react to setting of TS flag.
> Right now TS bit is cleared so MP should be cleared, as it is not
> needed. This should set the bit in defined state.

Setting it to a defined value is probably good, but the bit should 
definitely be SET, not clear.

If we end up relying on TS being set anywhere then we want WAIT/FWAIT to 
match, and that is the meaning of the MP bit.

	-hpa


> 
> Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
> ---
>   arch/x86/kernel/fpu/init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
> index 998a08f17e33..2a2b45610b74 100644
> --- a/arch/x86/kernel/fpu/init.c
> +++ b/arch/x86/kernel/fpu/init.c
> @@ -30,7 +30,7 @@ static void fpu__init_cpu_generic(void)
>   		cr4_set_bits(cr4_mask);
>   
>   	cr0 = read_cr0();
> -	cr0 &= ~(X86_CR0_TS|X86_CR0_EM); /* clear TS and EM */
> +	cr0 &= ~(X86_CR0_TS|X86_CR0_EM|X86_CR0_MP); /* clear TS, EM and MP*/
>   	if (!boot_cpu_has(X86_FEATURE_FPU))
>   		cr0 |= X86_CR0_EM;
>   	write_cr0(cr0);

