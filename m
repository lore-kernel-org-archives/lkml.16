Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D37E17A30B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 06:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745648897; cv=none; b=pnJcBiCwxMh1wXXOoomHnAm4yc+3CAKzb1vpdlhrPResuRx7/I+4tzo/ZtQe+MBXMYnkbf/e64xGh1qgDXvnSZJEolv9x9wBOCGI5n0Ct2UwEwn/M/0mv7eY5/dYdwZhgDIlbaoE5qDJ0X6G1UkiLZVeEN0X6mn2mblPsCN8t1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745648897; c=relaxed/simple;
	bh=iLSvSZrpExHs6iGtLUUAugyRIjzInghTCIhpfN7xuNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ss5e3AYA0DRhZCnLwghxYvZhnR24FjJtBVnC8TJjpmvNwnfUcnXTVeaTSafvbBSBoeBC4IIpDXlCJp8kvvhySqUoWDHNuR8advjF6bg2Cx2YaLjICNmdTNiH7uJgF/Ot5BAV647/NYOsR/xGAo04gabIbRjFbsQUnuKZqrNgyYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OY82lwqS; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OY82lwqS"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so442061966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745648892; x=1746253692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xv4tKOaC/Hpdjay7QKa+hiaqSaXkzeRpeVA+weQIJVQ=;
        b=OY82lwqSylwAvBqdaUaQ43jXRcdI36jfT35lHHcV7x3MvFV2ExlEJnEszOsjRu8tcC
         ElwM0WBy/l5iDYu+19cB67sB57JntwuQ7AcileGLA3jHciUQ56lpOrX6Wc/d+yQo86mE
         TBItgY+558mfOTNiFcYo+8fIE0XJMjRe3nzJIspoN6z5VtyYda14xw9AehrC6Iotri5j
         z47h2oRmWCdHpSGf0JqkXV2WXCi2fbrWCXdisdTKHmjqSdaDzdOpqoejhVLnjt2DChTl
         Tp6IY5MfgiMiw4coB0ydAba1fhMASIOlrTRHNLdOBXcTPiL6fMdLmrCzB6vRStRXG6mu
         x9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745648892; x=1746253692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xv4tKOaC/Hpdjay7QKa+hiaqSaXkzeRpeVA+weQIJVQ=;
        b=EeYeoqkxsEgW4jOtOQ3Qt39/UGjDfohteKDil1FSkdKjUQ5CXjCD+wtTGrepmZ6F9M
         bIY4V0+0lRRO4hSHri/lx4B+Muej6WXzIjw9SEkxI4bN3yvA97oTsMUbC+4+uTBuRzh3
         6jCZFbzAAB/7pQUEVI5gmp6SDnRaZ4SaZl4KDoeBu9u6MdN5ouY3vkEw3gkd5qQuHqhC
         wASjCAN9aB2oilTvQoQfK57bAjfq/p1FWOlkF6HFq/UbjtILVkIcxi33QKKan+P+3zQ6
         F8UDCHeOx1CEXavL1vTb+7EAsWZRlvt6dHFgaJRduHVU6QgVPOlGvqFqytRdTDQlM1XU
         lCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc3MXwr7ZD2Bh/EzhIUrvSnnjq3IzSjFyLzV9HOnmITaxsW75up5qlPbAXrpYaL97tXHMiNMio2zRgLmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXJVRLv6n8HM8bL3yRJVs0h+gBksrfKVaAozKDue1G+hBz6ei
	KBz5J/Pa2WYX3wCziPuBseUgqnTzPM20DWHs55htXdq5jCMGoWFcA4F+d88/ZV4=
X-Gm-Gg: ASbGncvIKq2/cXRGmHK3+nc+GPQZ50jSyy16kfE0rWAqqYimMDdHDN/HKZzgeUyeOKm
	C9IjDPL3jqUc4ydB/FSeAD5n2ZksLyxxaL0bWa8O6x9BLxCldSDbvqGf2+M+1yGV+14TSjoK9Mt
	92qVmjzXD0eiEm+e2sjwnrTIRzDQ9idc5wNug45QRa8STDjI+fTYt/eFmhYXcWTUcAys2F9hUvp
	K+Olpso3/D5ERTjW2hd6Qqg83eUS/wfqx7ZUngT7T+yS9xwUJeDU1LE8hCTEQnveoPbLw/P4jKU
	R/ljOmHLRQ5O0htdzpjA5OcD/k0vK8+kD4JSAiO7A/KeWPohNH+0akzT5fStF4w0fUT0
X-Google-Smtp-Source: AGHT+IESqmurfVzpwJY+LRtMTyy9+uS5Dp4QmJ2LQdrE9JHCD+tPlEB/tEuiwBzn7LlHhYd7RH99Aw==
X-Received: by 2002:a17:907:9492:b0:acb:b9ab:6d6f with SMTP id a640c23a62f3a-ace713a19b6mr428854466b.38.1745648892392;
        Fri, 25 Apr 2025 23:28:12 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1475ccsm4637134a91.44.2025.04.25.23.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 23:28:11 -0700 (PDT)
Message-ID: <5671cd19-6026-4bfd-946a-daffdb899e1d@suse.com>
Date: Sat, 26 Apr 2025 15:58:06 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: compression: Adjust cb->compressed_folios
 allocation type
To: Kees Cook <kees@kernel.org>, Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250426062328.work.065-kees@kernel.org>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20250426062328.work.065-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/4/26 15:53, Kees Cook 写道:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "struct folio **" but the returned type will be
> "struct page **". These are the same allocation size (pointer size), but
> the types don't match. Adjust the allocation type to match the assignment.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu

> ---
> Cc: Chris Mason <clm@fb.com>
> Cc: Josef Bacik <josef@toxicpanda.com>
> Cc: David Sterba <dsterba@suse.com>
> Cc: <linux-btrfs@vger.kernel.org>
> ---
>   fs/btrfs/compression.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
> index e7f8ee5d48a4..7f11ef559be6 100644
> --- a/fs/btrfs/compression.c
> +++ b/fs/btrfs/compression.c
> @@ -606,7 +606,7 @@ void btrfs_submit_compressed_read(struct btrfs_bio *bbio)
>   	free_extent_map(em);
>   
>   	cb->nr_folios = DIV_ROUND_UP(compressed_len, PAGE_SIZE);
> -	cb->compressed_folios = kcalloc(cb->nr_folios, sizeof(struct page *), GFP_NOFS);
> +	cb->compressed_folios = kcalloc(cb->nr_folios, sizeof(struct folio *), GFP_NOFS);
>   	if (!cb->compressed_folios) {
>   		ret = BLK_STS_RESOURCE;
>   		goto out_free_bio;

