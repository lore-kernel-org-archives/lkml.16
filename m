Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944D7298CC0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336343; cv=none; b=X9nd4MMYUh/PQ8T4H2Tmu5fri47NqPx6I5rLPoU4hb4il5nVfDT865LT6bhebSAOCDXLLjupJkFOF3t0KgaGYCHIdI9W3MfdmlAb/ROFbct7vcWn/LYTC6rS7mqvjOeTAh0h2sEvChjY1RJDuPsCHJQ8v9wyoEWOHuc7D1bQomI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336343; c=relaxed/simple;
	bh=KD0jJihtYhqfv1XEoRJC+fM9H80cCX8CrlPcHN4vXB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C47nDby2EIS16qeoRuRQU9GY87l5OSA1Y/AZ3ZGMrygIPMc+1m5SS3zM4fACk7BUMsQ4xQ8/lMvW0hdlE+CXwqfLHvjYiaQJHeTDf5pt0/ZBjkuJt8K3GtBwne+Voux59TsdgaNXXbEN7xMy8DZokqjgTSCoULMxtjNsGBRwQOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZcVBwTTO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZcVBwTTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747336339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lw0p7v2GEGVvGwV2lhiAGAZ1uPNcAxe5ljCB58WtnWs=;
	b=ZcVBwTTOqol69GM3SCo3544HQgnBvT9GXSExK/ufq16h6BEdYfcs0UUAqEEXbpG8RyDVqD
	Z9XgKMAASLeZZpouMykFv75XG64XCUoRZYn/rImiUTozTnbQrH6D9TeB7c6pvN6nZKHKGF
	cncToJQ47WAnFXjv1QHzdV57GrqQvfM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-XW0f2T1XM1yfdJAyqDk5Cg-1; Thu, 15 May 2025 15:12:17 -0400
X-MC-Unique: XW0f2T1XM1yfdJAyqDk5Cg-1
X-Mimecast-MFC-AGG-ID: XW0f2T1XM1yfdJAyqDk5Cg_1747336336
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a35c86b338so197126f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747336336; x=1747941136;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lw0p7v2GEGVvGwV2lhiAGAZ1uPNcAxe5ljCB58WtnWs=;
        b=ms7JxbiEbpr4dzMnTGQD2p9qGklN7zsROvEVweUQAfCxQ/G1t2JrT0XeJBrXAd+5qz
         JGC5hNpM0cTyGUOYvpe4qGKD2cZrAcJIIv9EMudXmEJ8o0UnJ7Vjy2HPJZapm+EFkEeU
         E6bitxzSarN/uHJo2g/LiTgs/vkHPQ9LUXR/SOcxKIxn76SdYl/BymuHTSyVmF44Rsp6
         usMDZGxEmxDgV0BQmH5cTgyLeiSkGYVaRnPxZcCwnocmyp3cMB6lIeVdLNnuphc7Zl6C
         4+SHYbMLLut17iLy+XeGpqOQ+y7plWaKqg7d81DVBBJFCVBir1kaNYIqBosj3k+2iZKj
         WHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVlVcxlx5dycTjPzAGqhy311HKJjq6yykcLiRzqBLxZcwx5n1+hKkS2DIsLE4lSZcuTzyTWEWbV1sCqCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9QE+su+Rl3w19ju44RD/XyGMJmb6XRO0xBMLC0Kl77VAo91aG
	W5Br4rlajE9uv6p+Vei4ao9+9fyKzX/rOlwVwuqQ9xtsfMVq0R9T3WNZkWFuW8xeDTO8GVdfK1O
	ZPXyexau9X360NORQcNQbFZALy8fV2I8m4wkVNz87jkXD5MCZ3+IFJq4IKFIAzVwTyg==
X-Gm-Gg: ASbGncu3sf5DC/+ZrfNC+RGIhNJcHT5GJfu5pt5W8jBgA5oHvIN5VoLNM0/v0bEd2F9
	tjJffj2d6lT/hPyNC6ZX9D8J0nxoKuyIAgiUiz5rquCPJYy0NGhGqt50sTyXfc9BvahC1UNT5Cx
	9SsuhN46q9CidanTIv1ywGFBjgwap5ePLosXfS2sjvJy7dqD/jDtK8L+4x1ESJyb0wbcD8fdq0K
	vP8hEqJKPQ9HQg7IujgSSdAYN20oZI7zdGLnw+aU6l2LgNjxFcM7w90kQ9xcNwWUnN8RbPptXsE
	YR0eyzKoGOQV/plR/RvBOMX98a4kX8CM83sEyMKV6HY059J+aio/2HEqhlyKRRQ5b9LajWBtuFj
	PMELB8Xrix82whj/hPatTBzMwBYJw8IhpZCOyMmc=
X-Received: by 2002:a5d:5f8d:0:b0:3a0:88d5:7fca with SMTP id ffacd0b85a97d-3a35c808b9emr540610f8f.12.1747336335897;
        Thu, 15 May 2025 12:12:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv6i9n2zMiKEPUzKWZIQ/UpOWV9YWFmOj8sYqnKvYQhL6NFvppJtQ08DGS6bNPQH7p/ND4xQ==
X-Received: by 2002:a5d:5f8d:0:b0:3a0:88d5:7fca with SMTP id ffacd0b85a97d-3a35c808b9emr540585f8f.12.1747336335517;
        Thu, 15 May 2025 12:12:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d31fsm364329f8f.6.2025.05.15.12.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 12:12:15 -0700 (PDT)
Message-ID: <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
Date: Thu, 15 May 2025 21:12:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
 <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.05.25 20:08, Lorenzo Stoakes wrote:
> On Thu, May 15, 2025 at 06:11:55PM +0200, David Hildenbrand wrote:
>>>>> So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
>>>>> is to override global 'never'?
>>>>>
>>>>
>>>> Again, I am not overriding never.
>>>>
>>>> hugepage_global_always and hugepage_global_enabled will evaluate to false
>>>> and you will not get a hugepage.
>>>
>>> Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
>>> if the policy is never.
>>
>> I think it should behave just as if someone does manually an madvise(). So
>> whatever we do here during an madvise, we should try to do the same thing
>> here.
> 
> Ack I agree with this.
> 
> It actually simplifies things a LOT to view it this way - we're saying 'by
> default apply madvise(...) to new VMAs'.
> 
> Hm I wonder if we could have a more generic version of this...
> 
> Note though that we're not _quite_ doing this.
> 
> So in hugepage_madvise():
> 
> int hugepage_madvise(struct vm_area_struct *vma,
> 		     unsigned long *vm_flags, int advice)
> {
> 	...
> 
> 	switch (advice) {
> 	case MADV_HUGEPAGE:
> 		*vm_flags &= ~VM_NOHUGEPAGE;
> 		*vm_flags |= VM_HUGEPAGE;
> 
> 		...
> 
> 		break;
> 
> 		...
> 	}
> 
> 	...
> }
> 
> So here we're actually clearing VM_NOHUGEPAGE and overriding it, but in the
> proposed code we're not.

Yeah, I think I suggested that, but probably we should just do exactly 
what madvise() does.

> 
> So we're back into confusing territory again :)
> 
> I wonder if we could...
> 
> 1. Add an MADV_xxx that mimics the desired behaviour here.
> 
> 2. Add a generic 'madvise() by default' thing at a process level?
> 
> Is this crazy?

I think that's what I had in mind, just a bit twisted.

What could work is

1) prctl to set the default

2) madvise() to adjust all existing VMAs


We might have to teach 2) to ignore non-compatible VMAs / holes. Maybe 
not, worth an investigation.


-- 
Cheers,

David / dhildenb

