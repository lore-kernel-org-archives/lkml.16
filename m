Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4292ECE9E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175170; cv=none; b=fmJE9QS9uap4/LRhrFeH0qlZQyNY23ylpFfoIb/DnzaAVom4zB9IWGspc5iLGODGwabWL4n/22dGbfR+kDPBNsrF1Zdpvn58r8v2T5Ews9On+rcc7qtesAX6Aple8z1icOge+4V2DKaJX5iM1Q8S/laFQ/8fd5UjWgcNcTCuL18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175170; c=relaxed/simple;
	bh=0QLZtSVwdKy3CpBGwVwWyd5qjT08tFLeKExDFbmtJq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpYOMZ7g26DLCzVUTUwXmwgyyU+s/BJetfXbRJ4T2JQqjj6K1wDMk5NRVEgL9S0EbkLmgVKnCl5/zx7Z0CjKpLuqwTGCt1hafe/44eU4EYWN46VMRmfDiEU0ODHyy4mVUdycfTeEvxnWdFq73fPAazV8nn9GQzYTKQFL69GPkPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GSJHh78k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GSJHh78k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gHUgFH4Vy26JeTkH9Ptm67SlY3McbDtlxFtO8eVqs4g=;
	b=GSJHh78kzzLgJF2HerqztZ2FUyoAMbWZ6gELrlrFEpgyMCHC7JdHa2A2OW4n2Nh29i7SDI
	Yy3q+WBGwypevLHZL+5D1nARCVfMUJRJWr5RbQVD4TNzz9VABF8+SjlfT7+rwY157gSAvG
	IeLJsMWJhmOpVncSgEImVnDQF8zpT5o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-XirgmI0OOBmv2DVHYqk5ew-1; Tue, 17 Jun 2025 11:46:06 -0400
X-MC-Unique: XirgmI0OOBmv2DVHYqk5ew-1
X-Mimecast-MFC-AGG-ID: XirgmI0OOBmv2DVHYqk5ew_1750175165
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45311704cdbso30592895e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175165; x=1750779965;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gHUgFH4Vy26JeTkH9Ptm67SlY3McbDtlxFtO8eVqs4g=;
        b=rvTWBowvGLj7yLDp1MsPBHKXa4NbgNdl7nVYpgogGKz7OdllMxjDiMS7IsF7xTgahv
         +GCJj2aDYdtdT5yf1z9au91BexCx0AX1hiWYs6dnMjpQYB9H79AvKwSUJcXfzSOC2kX+
         AyvRmDUnHLIgQNE65lQcKhlp2WkP0kPF+HLG9gQBCncUDnhMZISEfhQC47TchnbUqFr0
         A1no40cT1GLXIv7WIiyot03XDdwozfcPII16GHG9KCXqAtwV8k/4q18cVQMG7XpDj4PN
         C+uhKb+pk4mO0ny/cQ/6gEjvf7C7O7j4Q6+zEWBaY7UCvAkvxUptNLVWEpoNjAiCz8Xv
         4Yag==
X-Forwarded-Encrypted: i=1; AJvYcCXPq5+le3oG66FulrMhexCrTCMwokAOh22GCH7e5Onwq/W5xDqMuXI2NpzWqYGsgTFKy/isXBdzlZrY/nI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFm8xrEvLupke6EKsyjIHUZJcQyuLyjR98GMJrPAvBAxkLj6E
	DbaPIdwHU/MMZzXmnP051vyHX6YUh4KE7Om3rA20Dmt1J0H9G2yXKPlwRkoXUmTFQAqB4n+IxHN
	069kpv2ZJlDWfd3OHXHeWVEgY2y1opRNueVbocAreWtx6+mPVR2ilDDS0TXTsdpXmOw==
X-Gm-Gg: ASbGncv7H7/rU7UJagRrsZb4rr82XNhBXYTKgPHB84dW2liVsnjF0GUIkPXrlzUOqFL
	+KVjYqPsX60PpaQhGHGqCdOvScdgxGV/kKaHi3QiSkhmlUsjMJ43x+6FqSOanovfirlTGxZ9A8g
	hwFwoGDvVxiV9blqVXes08hnhs8ufadV37cJdarVlQBFX7bjhDXmlsHrlbVNBZhn0I1SwclX2dP
	VWp52Iatrv7NPJCC5PX5kDact8gAk/ira8l2PupM38jBokwb1K31Hm1h4Y6UO60ZESe2WUxJBkQ
	BGt3bqXAGlbEwi4BnOTkFdO9G2bnw/2z2FdvoyK7S6PjklWV+4ADpx2Fujj0PPwcaVOzf9nHM7y
	Bb+UK4pxwjC8T/OmWT16q/YeUPC5VbougOpXLGewH4TN/+hQ=
X-Received: by 2002:a05:600c:1c08:b0:442:f97b:87e with SMTP id 5b1f17b1804b1-4533ca4e4b7mr128553075e9.6.1750175164703;
        Tue, 17 Jun 2025 08:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiFlMK/+U/csst4PKIw9qd2THHsZbHuL/6FDu5Zo+6wEWdPw9aJkAzKN+IEt6KNQdOVid5AA==
X-Received: by 2002:a05:600c:1c08:b0:442:f97b:87e with SMTP id 5b1f17b1804b1-4533ca4e4b7mr128552755e9.6.1750175164245;
        Tue, 17 Jun 2025 08:46:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d7fsm14537761f8f.18.2025.06.17.08.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:46:03 -0700 (PDT)
Message-ID: <5255e8ae-b9c5-40e5-8bf1-29cffa8a0137@redhat.com>
Date: Tue, 17 Jun 2025 17:46:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
 <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
 <aFDm0YrbSAvXc5Wp@kernel.org>
 <4b0036ae-5b92-49b5-8396-412c7026b105@redhat.com>
 <bb03abf2-e3d9-4dd3-85b1-707bf9aa5a25@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bb03abf2-e3d9-4dd3-85b1-707bf9aa5a25@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 17:04, Lorenzo Stoakes wrote:
> On Tue, Jun 17, 2025 at 09:59:01AM +0200, David Hildenbrand wrote:
>> On 17.06.25 05:53, Mike Rapoport wrote:
>>> On Mon, Jun 16, 2025 at 11:10:41PM +0200, David Hildenbrand wrote:
>>>> On 16.06.25 22:38, Lorenzo Stoakes wrote:
>>>>> There are a number of files which don't quite belong anywhere else, so
>>>>> place them in the core section. If we determine in future they belong
>>>>> elsewhere we can update incrementally but it is preferable that we assign
>>>>> each file to a section as best we can.
>>>>>
>>>>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>> ---
>>>>> REVIEWERS - let me know if these seem appropriate, I'm eyeballing
>>>>> this. even if they are not quite best placed a 'best effort' is still
>>>>> worthwhile so we establish a place to put all mm files, we can always
>>>>> incrementally update these later.
>>>>>
>>>>>     MAINTAINERS | 28 ++++++++++++++++++++++++----
>>>>>     1 file changed, 24 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 4523a6409186..a61d56bd7aa4 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
>>>>>     F:	include/linux/memory-tiers.h
>>>>>     F:	include/linux/mempolicy.h
>>>>>     F:	include/linux/mempool.h
>>>>> -F:	include/linux/memremap.h
>>>>> -F:	include/linux/mmzone.h
>>>>> -F:	include/linux/mmu_notifier.h
>>>>> -F:	include/linux/pagewalk.h
>>>>>     F:	include/trace/events/ksm.h
>>>>>     F:	mm/
>>>>>     F:	tools/mm/
>>>>
>>>> Probably better to have some section than none ... was just briefly
>>>> wondering if "CORE" is the right section for some of that. Some of that
>>>> might be better of in a "MM MISC" section, maybe.
>>>
>>> Maybe rather than add files to MM CORE we should move mm/ there and add the
>>> MM MISC section for files we explicitly want to exclude from MM CORE?
>>
>> Also an option, yes,
> 
> These suggestions seem to be roughly the same no? :)
> 
> Maybe the MM section itself should just contain mm/ and we move everything else
> + stragglers to misc?
> 
> Now who, whose's first name begins with 'D' and surname begins with 'H' should
> we put as M there... :P well...

Most of these files are fairly small with little activity, so I don't 
particularly care.

Happy once the real big things in there (e.g., OOM) have a dedicate section.

-- 
Cheers,

David / dhildenb

