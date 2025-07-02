Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFED22F757
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446856; cv=none; b=uwMocxhgBwkFE1sofXgwVPSQ3STkXtE30ib7oDYbJOGmKW7rkiEqjizjvEKOKZd1LUPEExYjtwMUaOgu80lBP8uDUQQ/+frf2nKQIscVfFh4d3J+VCdQt8OF23Uhuto3dktqswleayehqteHqn5ewNtmeZ/hrv44JNoDVMUJ0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446856; c=relaxed/simple;
	bh=xEY82PbF93ohIniKOKoq+S3QlKOIU/Nuy9Wd7TjTwpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCudT0Chv6gmybZF1mM0jzmWrkW+YwMw2cEFM/RbhTqBU4sXCF85hugULCfYsBxEngWToZaCeR9HnVRumV2HIAwByvaOoFEEn0L9GtK67ooiaZ7rp967JKqtwancLOVZCLIARA/k1uQw5qjqvvjQj6ixzOLPBsUqvuAnW6blS58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UEfnALgo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UEfnALgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751446854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aUUS9w9cwb9x+70hkmm6v/8Du66Nlb6aYRU3v9lp+mU=;
	b=UEfnALgo31TUJpUntQ7k3gqtWgolm7j3jZPmoyXjFlBqZONukFkC04/oM+CBLhgOgjP1Hi
	mcalEtGroorKzVDBlL52A+1eSJsVjw2PypwaoeDG0kWc+Xd7+G49gimTPyjhB4ynuKoPn8
	9a3ES3CRhQEHMk9vp6DF1lHEJ0nGKyQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-J2AlmYjqN6OdDWuW_1xx1A-1; Wed, 02 Jul 2025 05:00:52 -0400
X-MC-Unique: J2AlmYjqN6OdDWuW_1xx1A-1
X-Mimecast-MFC-AGG-ID: J2AlmYjqN6OdDWuW_1xx1A_1751446852
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d1fso25569095e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751446852; x=1752051652;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aUUS9w9cwb9x+70hkmm6v/8Du66Nlb6aYRU3v9lp+mU=;
        b=ORyaoVTLm0HXohMLkN/RHJiOwbb5ahSTwIGgrMWgtXPo1gcEqVKYfQczpMqbRe2d9W
         NCBcaPrlKPM9Up9eErdR9Z5Q5kYd1DPetBAkWM9ErVEzMMtX1ty35t2pyQ+qXuyJVMmB
         eK09fgl2riQLbi9pJGKROFM+4Yis5J8nujsqR8gxk3VZMAhszbuRtxi9qTRIedBIBY7p
         hgS/xmimbf6oSP3XdA3VTR8MlpwsO4epFf7pljmGyYOzQbSIorVpzBslu39DjQfGI6/u
         wL1CkpAPzu4Twt3jcjNTlbxMvtYjxS10mlX4OWesIjSo3zYOHyH9n/kcqlPPl4ICBgLK
         gphg==
X-Forwarded-Encrypted: i=1; AJvYcCXuU2g+J8lqC23CIxRsm23kZy8YYnmBDHsQkmTmsou+oD8Rq6lWbuqSGqXEv0j8rSPAdCcYOC+9kBeCV2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxayWYMqy9DuF9HJmwtsvinpsunr27MWkgqu49T5W/5tHCat9vG
	8McNs7dDNxRa6j9l0EXEimmgVlnhtT3Fb1RbE9F5gcZGnEtnBPAEakfzVM+at18Z2PfCvaY2zv1
	7NiQpweUPYTOV3sPtsPsU8d6FqBedSU8HWZ9EYuRHa1HO97N4SsEDsDbN5ApP5bpaJg==
X-Gm-Gg: ASbGncvPsjEEXQpoTZ1GAxlHfxFYfRfT3jy/k8o+ES3HwpBBGJ5v8ABbaDpp/cArdLY
	B3c9wi0K2bKXbgczJqWh23MnWLGAmiC6wRr/JmZnIzUo4sMgKTRpBCERdNl2Mgt16vF/V2VykkG
	geEcSF2GemH55jyQhDDKWd0/YbENmRTGuZMxszxJgjtrAGrRdYcay50ahexZEMEzc1N1TmadfE+
	zsOUlPPIsOTckX+v56yEYO8G6M5h1LcA3kVLcIJAbSzg1geLTgI05pZOMZ0eHdoA89UvtD5Tb1A
	qgqrlgl6Xz2jGrzeDnxSDG/DFKOvP5dhZiN8UlJRJLzW5uOmrghbTGY=
X-Received: by 2002:a05:600c:64cd:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-454a36e5974mr21346465e9.13.1751446851426;
        Wed, 02 Jul 2025 02:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjPS53z637Tbb3NunpHVUE5Tvt94sT2dKF2J1twqXsuHPzGgo1r1PcSvgkglU4v6DNFMNROg==
X-Received: by 2002:a05:600c:64cd:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-454a36e5974mr21345745e9.13.1751446850860;
        Wed, 02 Jul 2025 02:00:50 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe24esm191220725e9.23.2025.07.02.02.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:00:50 -0700 (PDT)
Message-ID: <6092c44e-8800-47ec-9cfb-a1f062ea122a@redhat.com>
Date: Wed, 2 Jul 2025 11:00:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Oscar Salvador <osalvador@suse.de>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-3-david@redhat.com>
 <aGTw5ipC-ITJGfv0@localhost.localdomain>
 <1d98e96b-4bc9-45c1-9861-e0f3c5930ec2@redhat.com>
 <753a8900-d9ff-436c-8758-17d363967b30@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <753a8900-d9ff-436c-8758-17d363967b30@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 10:51, Lorenzo Stoakes wrote:
> On Wed, Jul 02, 2025 at 10:48:20AM +0200, David Hildenbrand wrote:
>> On 02.07.25 10:42, Oscar Salvador wrote:
>>> On Fri, Jun 27, 2025 at 01:55:08PM +0200, David Hildenbrand wrote:
>>>> Let's clean up a bit:
>>>>
>>>> (1) No need for start_ptep vs. ptep anymore, we can simply use ptep
>>>>
>>>> (2) Let's switch to "unsigned int" for everything
>>>>
>>>> (3) We can simplify the code by leaving the pte unchanged after the
>>>>       pte_same() check.
>>>>
>>>> (4) Clarify that we should never exceed a single VMA; it indicates a
>>>>       problem in the caller.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>
>>> Hi David :-),
>>>
>>> I have to confess that I fell in the same trap as Lorenzo wrt.
>>> __pte_batch_clear_ignored changing the pte value.
>>> So I'm not sure if it would be nice to place a little comment in
>>> __pte_batch_clear_ignored claryfing that pte's value remains unchanged ?
>>
>> I mean, that's how all our pte modification functions work, really? :)
>>
>> Thanks!
> 
> I mean, it might be that me and Oscar are similarly 'challenged' in this
> respect :P (high 5 Oscar!) but I think the issue here is that it's sort of
> a compounded use, and in fact some functions do modify stuff, which is why
> we end up with all the ptep ptent etc. fun.
> 
> Up to you re: comment, but I think maybe in cases where it's a reallly
> compounded set of stuff it's potentially useful.
> 
> But obviously we still do do this all over the place elsewhere with no
> comment...

Well, if you are not passing in a *value* and not a pointer to a 
function, you would not expect for that *value* to change? :)

Yes, once we pass pointers it's different. Or when we're using weird macros.

Adding a comment that a function will not modify a value that is ... 
passed-by-value? Maybe it's just me that doesn't get why that should be 
particularly helpful :)

-- 
Cheers,

David / dhildenb

