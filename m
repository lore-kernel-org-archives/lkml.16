Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A49A256C73
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806359; cv=none; b=eJWtExCfauVh1IovOCwlL54ftXlT/PksQf914kuqNpDVkKyCf1tArPGtm1LFCSHbXJ4mMa6yw15yOrWvOUAP77F7ajJGp+SLnnCP8SqsUSsaW7cAKA3fy+zMVxEcO0LPwWR3k+ejhcxr7wFPMM4OWNrne8ClPDMmM8dWXVhN7FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806359; c=relaxed/simple;
	bh=X3SwZk0+NdKsQFVzTHHhqIypNM0XSedRlaB6ZhBrFsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mg9446HRIoMigHFp7RqUqrNlBAGpURVLP20Pq+Qa0JW8CIT1j6GOrK8k8SC/nacNMeeUtUEB8QCLHaoyIlYKGWzzoNKueXz2SehJQY6RmTzfBGNNwbTAwudTL0HvQC1Vh5E7c8nAiXpOu7b5FA0A6izwGVh0WBpzq572CIwY8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YC3jf+X5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YC3jf+X5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749806356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6ps891XYmeXGQVsKHCLRiO18tAsNa4cpsxg3MfRd4RQ=;
	b=YC3jf+X5PxDgNFnKlixmLy/Bor2IizySqaNb/8IncOn8AD4Mqltk61mdXKOsi56doHIa1Z
	kV1Pw84LpLkU8ZrSsbHKx21gryEu/b41hiEfCqcGIs8SQfci363+0VscSEAacrvMxQullK
	mPF7zigln1s2TvEsIR6pQHbXiRjTQAE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-db6WsfvhOkO4AZTnmsBseg-1; Fri, 13 Jun 2025 05:19:15 -0400
X-MC-Unique: db6WsfvhOkO4AZTnmsBseg-1
X-Mimecast-MFC-AGG-ID: db6WsfvhOkO4AZTnmsBseg_1749806354
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451dda846a0so13953815e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806354; x=1750411154;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ps891XYmeXGQVsKHCLRiO18tAsNa4cpsxg3MfRd4RQ=;
        b=hMsoYwZlitmJOpGht33hIN6hpqYL/rywhEmgrEZo6xHipEPqE8qfudkFwHjUlGoUNb
         Hv4j/sI5JTjoFYNm/ObiDCy1hjiRvGYj+W6ZFKNcnUHAvhC/VTC/iFupu3xYnxt2r/A8
         nQmnnNiCvb2mZXEI+fGxhUx4ZW1XPWrNNeSuT139/Gmrci6Q0NXSahg+uYW1Uh6eHnZu
         CreSiz+c2wapm6yOhIz5GCJkY38sQXBHTPQlZPA4pAh+yqhsN9BVFsuix3zvVNg6ClRQ
         860/0nj3hEfKcy4z/C+s4lApWucQvOBHHo6Uw0pQlgwN7WUIln+BmL87bw9pVbxQBXri
         uTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHJYuP1uIPvagVZ+7o60FvTJMXHIE8X+M3TemJDoAilN03BQ+3Qh4l4zuvyyuN/pudG/F5b3DojcR6i9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9lnjgGf4avW79oQJPmDA5NqJFx+cZlK5E7kE8OyB+O7YVHh6W
	QIhl4WayBjyddQ4uevdpbsMK0oW7wvtbTsr9n/NpcBQa/Z5vyudhgxbG6uaULGmtq8/C0PwoqKy
	GO/foXAZxlls0miOHOJxiginJtxWsmHvAD3xg7cgQhfVY/k7J0Ptr1x8oPOmKHG5R6g==
X-Gm-Gg: ASbGnctOnO6wGF0ugUVZjgfM1ACljubrJUWv8bsbJ1f7CTxCwE3AUUUqA2R/hsus43S
	qBynVRPzrqt53TU5I4xt0bJyAficD+nbLgbT19PJDKGNbEC27k4LhaJ0R6+69+ovDPAFtQU8UVE
	QSWQrXy23hB8prQ1ukOzdio/S9m1VrMmxWlgqsRjtb2LES/KBkF8T1ZmvLguSFwSihf/9duvbJj
	ToBbKNJe8CtZV9HvF1x3Xfbxxa6WQbhnGKUao9rgmHufTWW1eIQa4adlDekBOROjjuHRXC4/Vtd
	jNXRg+5riW0CcVcLIrsjllipnYeTS2RHKJQaaSKspB5nl09x1CqO4yfHPhF8PM/9UKsspobeb8z
	yl0RD1mfW8crTIEc/C2q9TeNOyFXD9JuElPSRcg452gKZf3LqyA==
X-Received: by 2002:a05:6000:2312:b0:3a5:3bdd:6cfe with SMTP id ffacd0b85a97d-3a56871784bmr2001982f8f.26.1749806353902;
        Fri, 13 Jun 2025 02:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB0wUkGvgtukzllv0pkrwV3nUyJ0DyvtgCso3AdZqNtiUYhQOEQyHdJ6RuP49T0sKMOQsbbQ==
X-Received: by 2002:a05:6000:2312:b0:3a5:3bdd:6cfe with SMTP id ffacd0b85a97d-3a56871784bmr2001954f8f.26.1749806353542;
        Fri, 13 Jun 2025 02:19:13 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e980sm1741051f8f.41.2025.06.13.02.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:19:13 -0700 (PDT)
Message-ID: <925cdfc4-7878-4572-9a4d-9b99d149a652@redhat.com>
Date: Fri, 13 Jun 2025 11:19:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] kdump: wait for DMA to finish when using CMA
To: Andrew Morton <akpm@linux-foundation.org>, Jiri Bohac <jbohac@suse.cz>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <dhildenb@redhat.com>,
 Michal Hocko <mhocko@suse.cz>
References: <aEqnxxfLZMllMC8I@dwarf.suse.cz> <aEqpgDIBndZ5LXSo@dwarf.suse.cz>
 <20250612164735.76a1ea9a156cd254331ffdc4@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250612164735.76a1ea9a156cd254331ffdc4@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.25 01:47, Andrew Morton wrote:
> On Thu, 12 Jun 2025 12:18:40 +0200 Jiri Bohac <jbohac@suse.cz> wrote:
> 
>> When re-using the CMA area for kdump there is a risk of pending DMA
>> into pinned user pages in the CMA area.
>>
>> Pages residing in CMA areas can usually not get long-term pinned and
>> are instead migrated away from the CMA area, so long-term pinning is
>> typically not a concern. (BUGs in the kernel might still lead to
>> long-term pinning of such pages if everything goes wrong.)
>>
>> Pages pinned without FOLL_LONGTERM remain in the CMA and may possibly
>> be the source or destination of a pending DMA transfer.
>>
>> Although there is no clear specification how long a page may be pinned
>> without FOLL_LONGTERM, pinning without the flag shows an intent of the
>> caller to only use the memory for short-lived DMA transfers, not a transfer
>> initiated by a device asynchronously at a random time in the future.
>>
>> Add a delay of CMA_DMA_TIMEOUT_SEC seconds before starting the kdump
>> kernel, giving such short-lived DMA transfers time to finish before
>> the CMA memory is re-used by the kdump kernel.
>>
>> Set CMA_DMA_TIMEOUT_SEC to 10 seconds - chosen arbitrarily as both
>> a huge margin for a DMA transfer, yet not increasing the kdump time
>> too significantly.
> 
> Oh.  10s sounds a lot.  How long does this process typically take?
> 
> It's sad to add a 10s delay for something which some systems will never
> do.  I wonder if there's some simple hack we can add.  Like having a
> global flag which gets set the first time someone pins a CMA page

We would likely have to do that for any GUP on such a page (FOLL_GET | 
FOLL_PIN), both from gup-fast and gup-slow.

Should work, but IMHO can be optimized later, on top of this series.

-- 
Cheers,

David / dhildenb

