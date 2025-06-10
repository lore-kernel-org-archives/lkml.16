Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7394235361;
	Tue, 10 Jun 2025 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568611; cv=none; b=bKjCDKSVb/sLTBUqkFC5rgnWGfrbn7oEmqdcw1KjaQ/0G+Ov988R0Z1q0jH0JCCrcu6xWEgN4mWHehWDt588fz5F5HE99Ka8420tdV0FaSpjtBLdQ0KgpK/oPfou4N0GaBleyaxXQIHWEKze/u89FYqcEUbRwG2oUE4FUFQW1FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568611; c=relaxed/simple;
	bh=i+ZA5PZnarEIMUdL2kicaLXeZfd5IMGlajk3npLOGVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d72zOtFUGUVw5hJw4ksuEP8FAPVe5MG2KLhNDy7oGeKOo7/iAK6ni7ewOJ+J7gCUW7x+lC22702sASyX4WywsqPU/Y/UfKxNzuFFPAyyion2D1XeerC3Rn9gPkTWUiapHYnqDaE+jGvepIjUafVXcFfbHOwUO7dRrBR+VAdPTxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIh7SLtb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIh7SLtb"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so6417829a12.0;
        Tue, 10 Jun 2025 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749568608; x=1750173408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytfxy1F91/6XXoUwKvCD7IATlqB9CgwhEYIH06zF7vg=;
        b=fIh7SLtbnRtjOLXbp20e9rGU89UJCSYhJUdUuomg6dvlHdj3DDxZZEDjrEejbklDDK
         K0tq6ilDCfyDlwse7p8ST2Yl7nY2fzGhti+oDDVNEIy3m/+zHjIEs1hdHPIggCKwC4HV
         +1ilfTECEAjelXB9eLD14sZYK15H56xCHmkRBMT/3nG3SqZHxG5v64+PpBQbcKNHIaFw
         mhsUhMeZTQkw2F+zP0N3jvYCvpzVCs69Q0H6PN9iS7T9FTdRAr2nr6KmWatsZ36fF3SY
         M7i7h/v/pglO1yMKRy2CVqqUtcWDSshTosYni9ukRe3UaM/SNHVQ2HsA57IgTSQvDOVX
         bTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568608; x=1750173408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytfxy1F91/6XXoUwKvCD7IATlqB9CgwhEYIH06zF7vg=;
        b=hlT1PC8fmR8BgPo4Bfz4FYg0rbA6Bj0R20Tv3YjnedED+Wiw4fnTqd20K1G638CGVv
         sY6jPFBFxx0c6Rz+mDg+2z5gYmjEJ9otH0fmZaT9+TKY4zLd0gAmq0FqY7SFKeWLRMoO
         smuFzAn1gna08WscSiJiDoapYubkOoCAPagvTCo0vvYApwFWkbRR2hASCjJH0ht6XNoE
         OqFBQ+RmmJJ6CN/YqMOBsoSPpD18zElcMPckgIZYlV3+wXcx7SLPXuRbl78lTOxkm9Le
         nAoDe2dd2b8hQBI6CSD2TIQcaeZ0PqekgdCQTUBJWhlLxcpv6aIzK/cgIQG388AyvXuy
         F5pA==
X-Forwarded-Encrypted: i=1; AJvYcCUiuoxmkGeJ+9Fjb2DflF1Flsb1Y4Q3llmc0jn/uTxMgLL1X5SnDEbVLI5xinams92NxsimOZbKhGo=@vger.kernel.org, AJvYcCWgWJMcjx63Ac9o/I1Jx8hkYTkDIp4Zl0osTRJNgoDXN2K6lvonqOlx67BVanhII9s8UxW8qkeBZ3b1muCh@vger.kernel.org
X-Gm-Message-State: AOJu0YzK5YwvfNr1P5Jjy39xnsJfD+qQPOyKxuxkhRSh6UfL1E5HNYnc
	oh4nuMrUCucMXO3q7HRtr1HghvLCpLPV1Q92DuvsIQHQa/1CgkzZLD5v
X-Gm-Gg: ASbGncuhG+mrsoi7VSRFn8Lpxqw4Op4ZtzyvNqSDTYzK/yCg+5yDY59YmbeYXxrszKK
	F0unJOjRLyYa5cvice7vZzl69oBkodYjWV8rSZ8Mnmr/8q40Mf04wk9pond+pyZ3xjOVy+MhqiN
	DdEctvkyPdYra5/Q3JQdO2RjNnLqNMdDZxeWD2e3qE1p/NUMzlV2Nvj6FKCvjFNtlSmcM1tO1gC
	ec+VLkMoypoUZwgeplqr2/ndJwzUqE8gb63kO80wykVjhNE6TFDTIDT3RcZhPOmFc1FyuVrH1m+
	E/hF/DEVzx3nsmadHZbo8tGBknpzYNPpP5cFVb+w7wP7cnKamTBeiaLDjbeId7ngSpFbg93tH4Z
	plUUjySsnhDTI3X97ldOgB6x8c08v9WVGwOsAex+WXWg=
X-Google-Smtp-Source: AGHT+IF/eSu5QqSR/oHteTbpJTYOs9uEQ5oS/WYmrUNW42bFe8vizpo1YLaaPgHkosNoBYLfa6VdUA==
X-Received: by 2002:a17:906:c10d:b0:ad8:8945:8374 with SMTP id a640c23a62f3a-ade1abebae5mr1460765766b.61.1749568607761;
        Tue, 10 Jun 2025 08:16:47 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:c2f:a34:6718:ee1d? ([2620:10d:c092:500::7:b9b7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c800sm735176366b.79.2025.06.10.08.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:16:47 -0700 (PDT)
Message-ID: <7b16ed90-659f-45b4-83e9-62781e5460a6@gmail.com>
Date: Tue, 10 Jun 2025 16:16:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
To: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: david@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
References: <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
 <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
 <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
 <AA2C4D68-B1DC-48A6-A807-56516067B9C7@nvidia.com>
 <f980e652-8e2a-41da-af9b-39fdd439fefc@lucifer.local>
 <2338896F-7F86-4F5A-A3CC-D14459B8F227@nvidia.com>
 <dc32ec54-88c5-4171-a2d0-389e3ab428c3@lucifer.local>
 <46F6B7C4-542C-4310-9C70-F7469B151C7C@nvidia.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <46F6B7C4-542C-4310-9C70-F7469B151C7C@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/06/2025 15:20, Zi Yan wrote:
> On 10 Jun 2025, at 10:03, Lorenzo Stoakes wrote:
> 
>> On Mon, Jun 09, 2025 at 03:49:52PM -0400, Zi Yan wrote:
>> [snip]
>>>> I really think a hard cap, expressed in KB/MB, on pageblock size is the way to
>>>> go (but overrideable for people crazy enough to truly want 512 MB pages - and
>>>> who cannot then complain about watermarks).
>>>
>>> I agree. Basically, I am thinking:
>>> 1) use something like 2MB as default pageblock size for all arch (the value can
>>> be set differently if some arch wants a different pageblock size due to other reasons), this can be done by modifying PAGE_BLOCK_MAX_ORDER’s default
>>> value;
>>
>> I don't think we can set this using CONFIG_PAGE_BLOCK_MAX_ORDER.
>>
>> Because the 'order' will be a different size depending on page size obviously.
>>
>> So I'm not sure how this would achieve what we want?
>>
>> It seems to me we should have CONFIG_PAGE_BLOCK_MAX_SIZE_MB or something like
>> this, and we take min(page_size << CONFIG_PAGE_BLOCK_MAX_ORDER,
>> CONFIG_PAGE_BLOCK_MAX_SIZE_MB << 20) as the size.
> 
> OK. Now I get what you mean. Yeah, using MB is clearer as user does not
> need to know page size to set the right pageblock size.
> 

Just adding it here for completeness, but we could do something like below probably
or use PAGE_SIZE_64KB instead of ARM64_64K_PAGES.
Although it will be messy, as you would then need to do it for every arch and every
page size of that arch.


diff --git a/mm/Kconfig b/mm/Kconfig
index 99910bc649f6..ae83e31ea412 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1023,6 +1023,7 @@ config PAGE_BLOCK_MAX_ORDER
        default 10 if ARCH_FORCE_MAX_ORDER = 0
        range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
        default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
+       default 5 if ARM64_64K_PAGES
        help
          The page block order refers to the power of two number of pages that
          are physically contiguous and can have a migrate type associated to
>>
>>>
>>> 2) make pageblock_order a boot time parameter, so that user who wants
>>> 512MB pages can still get it by changing pageblock order at boot time.
>>>
>>
>> Again, I don't think order is the right choice here, though having it boot time
>> configurable (perhaps overriding the default config there) seems sensible.
> 
> Understood. The new pageblock size should be set using MB.
> 
>>
>>> WDYT?
>>
>>>
>>>>
>>>>>
>>>>> Often, user just ask for an impossible combination: they
>>>>> want to use all free memory, because they paid for it, and they
>>>>> want THPs, because they want max performance. When PMD THP is
>>>>> small like 2MB, the “unusable” free memory is not that noticeable,
>>>>> but when PMD THP is as large as 512MB, user just cannot unsee it. :)
>>>>
>>>> Well, users asking for crazy things then being surprised when they get them
>>>> is nothing new :P
>>>>
>>>>>
>>>>>
>>>>> Best Regards,
>>>>> Yan, Zi
>>>>
>>>> Thanks for your input!
>>>>
>>>> Cheers, Lorenzo
>>>
>>>
>>> Best Regards,
>>> Yan, Zi
> 
> 
> Best Regards,
> Yan, Zi

