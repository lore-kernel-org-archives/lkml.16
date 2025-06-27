Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177191F4608
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026602; cv=none; b=YmiKFsWsSglnXQVS5YulPhFvbn43kr/Q6A31srkS4BDQJL+lZ+SFKJfUhfti3R+ZdikTD/rk8BfI+JeyARn6DVumqkRG2NmcbFQIfPmquhmMJWGjHp28glsbtWyd0ymP24WU8A1nxC6h4hX1VfKtuxzU8Kbl/mM4iLg8lQnIq0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026602; c=relaxed/simple;
	bh=Z89CgsstUwddzJ6TKHqJ9RzUkAp8PFPXDoB684QD71s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHD32lKcbMrcfTp6S/zRs69zjKz4CkM6Vv6uQRfzlaFoRGaA5XqFOuln1UuwSOyavRvCK4LaZDlmm2aWG8z9YJfNlm5E1LHUCveiOe7Dtvg0Ifu4kKWx933ojNDK9GYlgaS9PAQc9QUG6+XsQt9MTxZd0z0ZDIRi6dwy0aI89Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O1+4S4L5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O1+4S4L5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751026599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z5iXgYBlAwd33V1zlwBhehhaKVgL6D6G6eNQgnNmF2Q=;
	b=O1+4S4L59cEXY4u9w5b04QyaUQFNOs8P0Lnwx7jDpIPN0Xc+xxtlNdGnKtuLIZE4A9R9Q9
	OwCkG91wj3ANWrfela/SS3tpSO7OxgBrKkumu3ltyxAR4GyiDtUfQSDwX3TwUSDTICV5Lc
	6tNTvQXK2eZiO+YbkvuH5Fr93aeAng0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-0U5Tmmc-MSm3ODIQxA7FLA-1; Fri, 27 Jun 2025 08:16:38 -0400
X-MC-Unique: 0U5Tmmc-MSm3ODIQxA7FLA-1
X-Mimecast-MFC-AGG-ID: 0U5Tmmc-MSm3ODIQxA7FLA_1751026597
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1475791f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026597; x=1751631397;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z5iXgYBlAwd33V1zlwBhehhaKVgL6D6G6eNQgnNmF2Q=;
        b=e5AGm4HjX9+518UjjY6YqKxCADKfgfdcnNHBmEix5wKRSmWeAWLKLmU3ZgOKkDHb5B
         tZqbdmEbZ5A8DJTGE31H2sy4bOeiC8E+3KDpXMD1vty0+o89XfTfsACAKIyXT5kcRNJo
         /jBfQ9dvFRI8cvPIcNTJLN7gGltCyw2VlFR+GYZLfT0mnfilXXAuDvly+DtZakJOMPNa
         66jz93OyszjHpESUHNof8/5QElJagFgxs7/5jSclgdXi4DIuePB4StbNI2IopMhGm7K+
         m5YAY2cyFFgcOYQZXXPIMVoQzlAr4G7CBzSNpo3gIStcxYUM9nHy0N65woGVn6MejfOo
         9jtg==
X-Forwarded-Encrypted: i=1; AJvYcCX6CVxcayxvUyzpsWpwUqHMfJYaXa88mWXGx/fJdQ/OonZA7tAFcGD/xKjpyd3+VkLggmB1Clz1xkf8qSk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4TlwbXiHfzfsBgSArIQoZfpW9vUH0952Z50RbpUn+co3LnfH
	ZtZKtvmfkdN7qtKo4wW4GavM6gH/l9VWXnEDekTkZyAFboedjqhBBiPT2Oby6w/IL8tnU1oB8P8
	A6JaGGVBglEpJwCN7hhsODGQ4PonJ6yC22p4ZD59GqdYi1saV/2YytYDvEvmUn27rrA==
X-Gm-Gg: ASbGnct7xrown/nGxAsuJERIkiNIIexUSHe1cGtjL9H/Axbb7q9fnYdRBw6svCLk0mD
	ZDcw/gSY7XI+SOryk4f0A5tVnSK1nkgpeX3Bsezx//9WQnQrq3VNDMkEyOJ5dbnC1vl/PfpRPaO
	Cn7y5FwKgAi4ZAhyEziP39K64PgBBT4JcW2YwQLBIwgUhttUPRWTgBu4LgTKX293J4NqlGalobf
	0uCYnBv1518Nx7Bdwh2UH0BU3sDIctx8+J1MLb8/73TxCAtc918rokpIQrF5or4xqlaJz4OegPC
	7sG7BQcSi9xwgacbZhCK3RmrWqw0gDtNOA3GK7ln+GeAtlKOciRIrZHcMPPtfmZmRVe3CumT5sB
	6FT8H3PQ+yWCe8kIJyOXBumS/WRblPLkOXsVwYSzGZwJhk1DgZA==
X-Received: by 2002:a05:6000:1acc:b0:3a5:2e59:833a with SMTP id ffacd0b85a97d-3a8f435e017mr2954028f8f.1.1751026597260;
        Fri, 27 Jun 2025 05:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFXCaDmfg79ltzhkJvrafzPaymAbe7A7YchbEapX8dANRC8wG38l5KXwh1B/WTFpadmove+w==
X-Received: by 2002:a05:6000:1acc:b0:3a5:2e59:833a with SMTP id ffacd0b85a97d-3a8f435e017mr2953995f8f.1.1751026596736;
        Fri, 27 Jun 2025 05:16:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8e1sm2528578f8f.88.2025.06.27.05.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:16:36 -0700 (PDT)
Message-ID: <053f8c6d-0acd-465b-8d9f-a46d50ccce71@redhat.com>
Date: Fri, 27 Jun 2025 14:16:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] kdump, documentation: describe craskernel CMA
 reservation
To: Baoquan He <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
 David Hildenbrand <dhildenb@redhat.com>
Cc: akpm@linux-foundation.org, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>
References: <Z9H10pYIFLBHNKpr@dwarf.suse.cz> <Z9H4E82EslkGR7pV@dwarf.suse.cz>
 <Z9Of+RYjpcDN7+ji@MiWiFi-R3L-srv>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z9Of+RYjpcDN7+ji@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.03.25 04:18, Baoquan He wrote:
> Hi Jiri,
> 
> On 03/12/25 at 10:09pm, Jiri Bohac wrote:
> ......
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index fb8752b42ec8..895b974dc3bb 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -987,6 +987,28 @@
>>   			0: to disable low allocation.
>>   			It will be ignored when crashkernel=X,high is not used
>>   			or memory reserved is below 4G.
>> +	crashkernel=size[KMG],cma
>> +			[KNL, X86] Reserve additional crash kernel memory from
>> +			CMA. This reservation is usable by the first system's
>> +			userspace memory and kernel movable allocations (memory
>> +			balloon, zswap). Pages allocated from this memory range
>> +			will not be included in the vmcore so this should not
>> +			be used if dumping of userspace memory is intended and
>> +			it has to be expected that some movable kernel pages
>> +			may be missing from the dump.
> 
> Since David and Don expressed concern about the missing kernel pages
> allocated from CMA area in v2, and you argued this is still useful for
> VM system, I would like to invite David to help evaluate the whole
> series if it's worth from the VM and MM point of view.

Balloon pages will not be dumped either way (PageOffline), so that is 
not a convern.

Zsmalloc pages ... are probably fine right now. They should likely only 
be storing compressed user data. (not sure if they also store some other 
datastructures, I think no, but might be wrong)

My comment was rather forward-looking: that CMA memory only contains 
user space memory is already not the case (but the existing cases might 
be okay). In the future, as we support other movable allocations (as 
raised, leaf page tables at some point, and there were discussions about 
movable slab pages, although that might be challenging) this can change 
(unless we find ways of not placing these allocations on CMA memory).

So as is, this should be fine, but it's certainly something to be aware 
of in the future.

-- 
Cheers,

David / dhildenb

