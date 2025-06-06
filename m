Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A9286D48
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205715; cv=none; b=jB7isjMfMMoyBDPJRnPGZEDstsFvbZmoUcOOd2XLAxkjI7vqkMDqPifCg5bG/cJ+VRtv3b6f09/YtqIQKZAua2wu+X3kIUXO9AaKggCGfbiZji9XWjJopfIo2KGN7BAR4icG7BYwE2PUMtsth1iMfqWNDzKCrjoQzHfShfIv/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205715; c=relaxed/simple;
	bh=kACviEvGUPXG/4M4+fT5j0GojhVVgJbgRf1+6PxoGjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEcVep82B2cHKRHJZFeIoquUJmXGqrkYjBxAXRuzY2XdTRY0mijw/6VaSwjbtWZ5T311KLtlkLb9J97uQ/vKpGbg1m1jRKBwxHf2IkdawKpGIcL3GHXTp1B2DJ/yBMry2xbhkQCp7umC2sKF4ojEo1P2cTNWQJD+5LPn7bdUTt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a80i3Q4m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a80i3Q4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749205712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wKVfXE5LvAUMRplqpv2/XdSj/f7PTYuXtEH5Yx/Ix2o=;
	b=a80i3Q4mkn3nvziWjCfrGdCpS6dervW+DAaJFItAhmaxr7/8PQlTBudQ9DjyooUtXJgw4Z
	6DKSj2oKbFitN91qB2gouSbq145f6vGoXbCcNBeg+3rptCMSp92kU+63cAfhHfJNd3mLX6
	91zRIMdXXBOKIed4rw0GxdUKa6wL3KA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-qn8QNg5QPqKM0Wd0vkN3gg-1; Fri, 06 Jun 2025 06:28:31 -0400
X-MC-Unique: qn8QNg5QPqKM0Wd0vkN3gg-1
X-Mimecast-MFC-AGG-ID: qn8QNg5QPqKM0Wd0vkN3gg_1749205710
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f3796779so1423770f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 03:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205710; x=1749810510;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wKVfXE5LvAUMRplqpv2/XdSj/f7PTYuXtEH5Yx/Ix2o=;
        b=i1AQO7IGPGkgKfAceQmAvmzKWuRrxWJO/0BVAR7z1N2NTpj++X3xV3aKNEq0/6wuCA
         EyjYpdCvaFUJd9PMvW7mREofOOGTmBRUMqw5CJQczwctmm1G9krp1N3xjdzE/AItziQ9
         q2Of9Y4TkmYgSskeJN5wh13L+/PyWhZTbZlmCJZXK3aXDkv6RX50dZS/3u8fRSdNV6Ra
         G/VGDdM03w8/I3mAA2PgOBkQ1IYf/c1sAJiLzT/NmToQXmaTOzxIQPnJ6yp9h9/F8Ao0
         qcnVSBYDmmYjvsU9PtOgyX/tl+JU+Y/gyYlE+phqfQEYdJuMFup4wmHnxtFn2NfLzOFH
         ipAw==
X-Gm-Message-State: AOJu0YwauEdKBZ7a/4t4g64qcscJaserCmH+U8f3ctw5meHnqgTgZQfL
	/fXys/buSjFpc/RVyioBxqkw62kLq9WfurilaTqEozwBO+7vCfDoasfVZdm9eKSU7oTQsnC1hvr
	rXL/NBEZQfKSb3kNDEmWWdHO2gDesWDafPMj0pANwJ1DvQkQWNx3bCUy/pF0iwXAisw==
X-Gm-Gg: ASbGncvkpz0y5RNvxeum68H2FKS67S2fXR8Jfkjj1Hmy805G8r8y2iwncD2xln38BhM
	7VBTtWbdGf9zI1ALNDteZue1RvAm15J7U3S3Os1F2ORyffefZ+pqEFOJknqY8aC/GVNFFjt82ZN
	DOeBRD7gCPJfi6sOJJYP5fE+msKVdhAdv4ljjQm3bhE0X82/+QL2Fj9Ptl08KWsp3AD3Xbs5eOg
	Tq+bym6itKYNKlwFz08BNVNGqkUrzaO56KAgGRnIRZ4BglgxLgmaBkgLhiMF6rPzGvfO1EvHt7E
	dhTz6C2wGVjZhVZI7c/KVH+Azt+V+F86QjhdHFvoqBg1k1SaVnbnynLpbxu7ZdyasA65Rqj52Mf
	Law8CE5g4+/suyFlQgpVpPP6LFOWsOoQ=
X-Received: by 2002:a05:6000:2f88:b0:3a4:dd63:4adf with SMTP id ffacd0b85a97d-3a5319a2f10mr2497849f8f.34.1749205710163;
        Fri, 06 Jun 2025 03:28:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKWiQBw/SFRtOD2IfGZYydjryehOqCEDvXvqvtVCdB4/fm2qrI6chgbNP+mu48KPOr7/8IHQ==
X-Received: by 2002:a05:6000:2f88:b0:3a4:dd63:4adf with SMTP id ffacd0b85a97d-3a5319a2f10mr2497824f8f.34.1749205709720;
        Fri, 06 Jun 2025 03:28:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532435f94sm1459782f8f.60.2025.06.06.03.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:28:29 -0700 (PDT)
Message-ID: <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
Date: Fri, 6 Jun 2025 12:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 12:19, Lorenzo Stoakes wrote:
> On Fri, Jun 06, 2025 at 12:13:27PM +0200, Michal Hocko wrote:
>> On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
>>> On 06.06.25 10:31, Michal Hocko wrote:
>> [...]
>>>> Turning them into VM_WARN_ON
>>>> should be reasonably safe as they are not enabled in production
>>>> environment anyway so we cannot really rely on those. Having them in
>>>> WARN form would be still useful for debugging and those that really need
>>>> a crash dump while debugging can achieve the same result.
>>>
>>> One question is if we should be VM_WARN_ON vs. VM_WARN_ON_ONCE ...
>>
>> *WARN_ONCE ha a very limited use from code paths which are generally
>> shared by many callers. You just see one and then nothing. Some time ago
>> we have discussed an option to have _ONCE per call trace but I haven't
>> see any follow up.
>>
>> Anyway starting without _ONCE seems like safer option because we are not
>> losing potentially useful debugging information. Afterall this is
>> debugging only thing. But no strong position on my side.
>>
>>> VM_BUG_ON is essentially a "once" thing so far, but then, we don't continue
>>> ... so probably most should be _ONCE.
>>>
>>>>
>>>> So while I agree that many of them could be dropped or made more clear
>>>> those could be dealt with after a mass move. An advantage of this would
>>>> be that we can drop VM_BUG_ON* and stop new instances from being added.
>>>
>>> As a first step we could probably just #define them to go to the
>>> VM_WARN_ON_* variants and see what happens.
>>
>> You meand VM_BUG_ON expand to VM_WARN_ON by default?
> 
> Sorry to interject in the conversation, but to boldly throw my two English pence
> into the mix:
> 
> As the "king of churn" (TM) you'll not be surprised to hear that I'm in favour
> of us just doing a big patch and convert all VM_BUG_ON() -> VM_WARN_ON_ONCE()
> and remove VM_BUG_ON*().
> 
> Pull the band-aid off... I think better than a #define if this indeed what you
> meant David.
> 
> But of course, you'd expect me to have this opinion ;)

See my reply to Michal regarding keeping VM_BUG_ON() until we actually 
decided what the right cleanup is.

I don't have a very strong opinion on any of this ... as long as 
VM_BUG_ON() goes away one way or the other.

-- 
Cheers,

David / dhildenb

