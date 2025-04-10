Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BFC70830
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303204; cv=none; b=HFCRpb51rPJaK2wcDw36gPGnLiN9GDgINXYv313nY5JVdFj2uIEO+/+WRgJ8OCh7IcU7v0ft83S3zgTvU9bj3RqYjx4NrsogLBDvziserCQyd5KqYXuWA22KLxcspXohptbR0+0Y9roGldnuMoi16khT3HUkHzNNhQUUzUTZFu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303204; c=relaxed/simple;
	bh=vvbuOa2Tj2X+hSm3zkyq/M/mQOhxkh8muavWs+cfYGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RaV2TLNhPAHl90znQ3nIZgCrlVQVN/qLPupZ5MWWvwnVAZVy9kNvfbPp+PG6SYrDvjPgWYtGVyMJ+AkPWPBEs3I18bWHNqtDtJDwIst8p7WEmzE2bL8YE0zWhANirSCjH5q9oKAyJue0rgvyy3XJ7fsRbL8HwWzEh/LIxAt+510=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dgMMUkc3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dgMMUkc3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1563502f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744303200; x=1744908000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDsizPH9whaj1rPZK6+IRbd7Mv5wlJNgkvXDCJQDREk=;
        b=dgMMUkc34PPK7yySgNJeq5w3fNhpv5fA6ZfWQ5cNed9nsFg0o8Noy2A5G0ta7l7fH8
         4hxNpeQDfl9Hz0aRC0kSvV15amB5ErgD0Zho74EsCFB1xHZbfz8ZCHJSiUBhVaYilRc/
         NwMx5lZnzdT/dSQCH//YRXO1tg+OdbbjFdtZjjwIfYL3iCwPUaY//3JQKSSdqTTpLRIZ
         mX9G7vCuirrvQNyIj4SEoCqLRmmeCtrDcr0ZF+GKcbNSB2wJrXx105G0+A3JJ317+Av8
         Hvuq9UhL3mKylTgpVuu13ulgZlRQ+Zgla2Sc7ReIRXPHlDWOXAjH2uFfDX7sHj3Vummf
         3Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744303200; x=1744908000;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDsizPH9whaj1rPZK6+IRbd7Mv5wlJNgkvXDCJQDREk=;
        b=cuFmILLHWhEjJd80V/4ih8XQaYuLZv6NbJA64pDsZ13J9JpNIbi45CSUPdRtShLYO+
         liFbcmcY5LtKhEwsBKBIErdgrnKn/4Fjy2+IGpN6R7dI8nUpSD/jCMZdEQBk+fnDJHhj
         TC/GBeeK1BMBAlbFFqomFRcovfaf3DA0ImFJ/mGVA19RrcmLq0FabjBMoEuK8ulH7FNS
         yz21pNGwtF00CN/bobBZ/9SF4RdKF2rdbJHwJo5hG4Bri3LbK/B6TpEsTc1j+bhHqWX6
         Ws3zS3pm7qCwQU4HUbeFbpBE2P9GhvoR2wAWzI003CvWzgWDosEAGU97n4MnrqxHQDP0
         byiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnQQnvSMP6qIyiUsStwK+oW7Kbzj5LiUDyOvzXhio7w5Pt8jYW/ydRo1L3AGKtnoF4Ctu4qj87S9r4yvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Gljiyyw+LXO4v2sgW4e5dVvGPlJwCGNZ2gdhzuaIsrncc5q5
	3cmyWrxbGyWX8QW2eTF9bQNmm8gdGSyU86iLOH/u/7uNfVO9BlsJfLVrkUbbr4f9bims4RG8c1z
	6
X-Gm-Gg: ASbGnct3fxCmnhVyHbYg3+NT+Ne3TaG24eYjisR5G3ux3Nm2EpmZd31kd3JmdzZTHmQ
	YeoEN0x9ur/V7nj+nI/mMmf3L2aBHivMSogfjHEBfx+7rqpr6BACAnDp/SYJxaZohQhrhnRQdi3
	r10+VSRnTGJrLm7SURJJyg/9K24Co6Plep90WkuJ14M1f1EjRyuKr2eBJOw9VW+T6AYgfjrGyke
	Gox0L+9hMTXJEXpd1WVZuR9+Qd+T4uMJAZxV7VxswxFqqnlQPiyz7iJ5hGNjrOQGUSMM6F+1Izh
	cHCUISZhjhWlxlQQrVYDRBpIGg5+FF4E5k/PufHTeUn7hg==
X-Google-Smtp-Source: AGHT+IFXRhZoqBJ0jMSYBW/8OA8GIIdyvhYU+hlbidG18e9yJhy7dw7SqKqUrJUW4z9r79xPE0IVCw==
X-Received: by 2002:a5d:6da6:0:b0:39c:e0e:b7ea with SMTP id ffacd0b85a97d-39d8f61a862mr2556633f8f.20.1744303200362;
        Thu, 10 Apr 2025 09:40:00 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893612adsm5162216f8f.8.2025.04.10.09.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:40:00 -0700 (PDT)
Message-ID: <e67bbcf2-02f4-4ce1-8ad0-b1f1381c65fb@suse.com>
Date: Thu, 10 Apr 2025 19:39:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region for
 SEV-SNP guests
To: Kees Cook <kees@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-coco@lists.linux.dev,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Kevin Loughlin <kevinloughlin@google.com>, Michal Hocko <mhocko@suse.com>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
 <202504091038.5D9B68A@keescook>
 <67f6bee647aa5_1302d294f5@dwillia2-xfh.jf.intel.com.notmuch>
 <e2933f6e-4bda-40ee-b69c-d7222082fcfd@suse.com>
 <202504100931.DEC3D3B79@keescook>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <202504100931.DEC3D3B79@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10.04.25 г. 19:32 ч., Kees Cook wrote:
> On Thu, Apr 10, 2025 at 03:03:55PM +0300, Nikolay Borisov wrote:
>>
>>
>> On 9.04.25 г. 21:39 ч., Dan Williams wrote:
>>> Kees Cook wrote:
>>>> On Tue, Apr 08, 2025 at 04:55:08PM -0700, Dan Williams wrote:
>>>>> Dave Hansen wrote:
>>>>>> On 4/8/25 06:43, Tom Lendacky wrote:
>>>>>>>> Tom/Boris, do you see a problem blocking access to /dev/mem for SEV
>>>>>>>> guests?
>>>>>>> Not sure why we would suddenly not allow that.
>>>>>>
>>>>>> Both TDX and SEV-SNP have issues with allowing access to /dev/mem.
>>>>>> Disallowing access to the individually troublesome regions can fix
>>>>>> _part_ of the problem. But suddenly blocking access is guaranteed to fix
>>>>>> *ALL* the problems forever.
>>>>>
>>>>> ...or at least solicits practical use cases for why the kernel needs to
>>>>> poke holes in the policy.
>>>>>
>>>>>> Or, maybe we just start returning 0's for all reads and throw away all
>>>>>> writes. That is probably less likely to break userspace that doesn't
>>>>>> know what it's doing in the first place.
>>>>>
>>>>> Yes, and a bulk of the regression risk has already been pipe-cleaned by
>>>>> KERNEL_LOCKDOWN that shuts down /dev/mem and PCI resource file mmap in
>>>>> many scenarios.
>>>>>
>>>>> Here is an updated patch that includes some consideration for mapping
>>>>> zeros for known legacy compatibility use cases.
>>> [..]
>>>>> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
>>>>> index bfa444a7dbb0..c8679ae1bc8b 100644
>>>>> --- a/arch/x86/mm/init.c
>>>>> +++ b/arch/x86/mm/init.c
>>>>> @@ -867,6 +867,8 @@ void __init poking_init(void)
>>>>>     */
>>>>>    int devmem_is_allowed(unsigned long pagenr)
>>>>>    {
>>>>> +	bool platform_allowed = x86_platform.devmem_is_allowed(pagenr);
>>>>> +
>>>>>    	if (region_intersects(PFN_PHYS(pagenr), PAGE_SIZE,
>>>>>    				IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE)
>>>>>    			!= REGION_DISJOINT) {
>>>>> @@ -885,14 +887,20 @@ int devmem_is_allowed(unsigned long pagenr)
>>>>>    	 * restricted resource under CONFIG_STRICT_DEVMEM.
>>>>>    	 */
>>>>>    	if (iomem_is_exclusive(pagenr << PAGE_SHIFT)) {
>>>>> -		/* Low 1MB bypasses iomem restrictions. */
>>>>> -		if (pagenr < 256)
>>>>> +		/*
>>>>> +		 * Low 1MB bypasses iomem restrictions unless the
>>>>> +		 * platform says "no", in which case map zeroes
>>>>> +		 */
>>>>> +		if (pagenr < 256) {
>>>>> +			if (!platform_allowed)
>>>>> +				return 2;
>>>>>    			return 1;
>>>>> +		}
>>>>>    		return 0;
>>>>>    	}
>>>>> -	return 1;
>>>>> +	return platform_allowed;
>>>>>    }
>>>>>    void free_init_pages(const char *what, unsigned long begin, unsigned long end)
>>>>
>>>> I am reminded of this discussion:
>>>> https://lore.kernel.org/all/CAPcyv4iVt=peUAk1qx_EfKn7aGJM=XwRUpJftBhkUgQEti2bJA@mail.gmail.com/
>>>>
>>>> As in, mmap will bypass this restriction, so if you really want the low
>>>> 1MiB to be unreadable, a solution for mmap is still needed...
>>>
>>> Glad you remembered that!
>>>
>>> This needs a self-test to verify the assumptions here. I can circle back
>>> next week or so take a look at turning this into a bigger series. If
>>> someone has cycles to take this on before that I would not say no to
>>> some help.
>>
>> Can't we simply treat return value of 2 for range_is_allowed the same way as
>> if 0 was returned in mmap_mem and simply fail the call with -EPERM?
> 
> The historical concern was that EPERM would break old tools. I don't
> have any current evidence either way, though.

Right, but we are only about to return 2 in a TVM context, so chances of 
running old tools are slim to none. Also it's perfectly valid to have 
mmap fail for a number of reasons, so old tools should be equipped with 
handling it returning -EPERM, no ?

> 

