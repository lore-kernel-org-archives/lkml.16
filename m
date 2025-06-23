Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4C338FA3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687745; cv=none; b=X6xg8BAr2ufKGrMoYWom/Ck2Z6rVEmeC+ks554eKv6GUfomhUC9AEhYTCXleGPzLDcUGyUV/M/S1LkFoMY2dzdmCb0rh/Gma0pAZpJf0khhK4eQ5p/rOydkGXfkLUEAPtne7wo67cBsXomWqvSHJcW4n9QU+rIW0FvwbsvcovsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687745; c=relaxed/simple;
	bh=LHY0UpkTD9R8FW+gVVZYc4ksei9Gl6YQIazjtCDpjNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjwMIl9ucSTy2wWgTr+rTjd1c+QhXrO02zwH6TKj+hDOAcYFMTDYk/bIaBZEk9vKhVfbq2Q7S7FOotF6AG2ScXPUWJ6dZmhf+vzh7yJJ7SgnZUP+Buc1OrIpFiXCkg+YB9VJ0EngGSQprPKBWvGpiFySMVpM6SZhRo4O33UYxRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d3xdyPML; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d3xdyPML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750687743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y7Ci6GAY7NgNa/wDuDrw3HTWAKtIQSbtFXEH8SpJlTM=;
	b=d3xdyPMLcEggC/UbzQY3uTFNsksJZ+jEZLc6URCya3QHnkYaEvgNQNtEb+jp8eYuAz64qp
	7h9v8rCl3ADEkZ4NnHzO3Bj0GJqgza8aDlw4WfHe74O5Kj0ui9xxfZSQYTMiCmU/KOnwDK
	YTyRQgA7IeKprfaFebVFs0GltbKCrAk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-sr6Br4BEP9iM_h59YyK4GQ-1; Mon, 23 Jun 2025 10:09:01 -0400
X-MC-Unique: sr6Br4BEP9iM_h59YyK4GQ-1
X-Mimecast-MFC-AGG-ID: sr6Br4BEP9iM_h59YyK4GQ_1750687741
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso3392663f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687740; x=1751292540;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y7Ci6GAY7NgNa/wDuDrw3HTWAKtIQSbtFXEH8SpJlTM=;
        b=p7xMt4eOI4ct8JV97tgSZTVTqLW7Ws32RYXqZQXuTosUVQgigvY8oU5znzCQaxrcu0
         JUstu8XifHluKLhOEbsUO9L0Vh8Iv+y56GoQz4eJXn8IwIzEbiixZsmoQjhEMZOKJ7vi
         cftKRXbZ7dWwxyC+SGgVho/aMn9eYAydJ0k5oPBVLeTf1vXYalXxDHTQ3dcnbC3cM2rr
         Ew8A/BtAWJednfzd1C1RletPDrHvLwap1L7KXTJOjN7vOevOo5QsPER/fHfRRmatOyMH
         X8HpHnoIlb0fuANsNUgUeFMgt1N+IzdK5qGASJcgyqoZnFtEvxPQ4rL2MKDSHnkJWvDo
         N8FA==
X-Forwarded-Encrypted: i=1; AJvYcCXa5ZEEdU2W5+XKsC6FY4aP62wmnG/xK772zdxQ+7ytKS8dpUxK004TkOkZBnW5fOwZWLaLnAfrvhWOkgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAD4C8xmBTNiRfjmt7vBrHVTV7GNnx/BcwaJPTKad9LIzUQ4Q
	hOt54O51/fo1zfRdexuPTTn48Z5no9eojWhf3DgMtr0kzhIfQt090g6PyFhIh3CSjyZYdbWaS/c
	JOifgzfJa53q22PkREnmasTDPBuEDUVIVGWd+NydOtg2mEiQS8RW8Kk/GRlkDzRrIOQ==
X-Gm-Gg: ASbGncupccxG2CylKNitl6YPPxkHOXNqo5KT4IdF9WIOhKXMQLpx+E4UTJceDN8xJ8B
	yNFd+6xGFM0RiIHxNuXm0Yws4TJy78gy+0I6GomP4aoulXT3ma/xT5pdUA6Q34HNylD725+Xo96
	dYXT+EO5unxlsvUyARdWLKp3qh7nYkV0HTj0aFGfPTfNk3tiD9X/Ydus9tTbCqjQ3b3GTl6aWqC
	s1+QwPRF8rTpPy9N4hyNtsFTTRTRPk+RfexRmuyJRWGuxAXBZHZ47Ol6TM+gbY1MLbEVr0HvaPL
	avtPUckW9f8xkWoaJNwSHGwsY16ezEA1Ng5KbH95PBrB2iUi/QG+lhVC/U333Ji/bcAgvH3/A0/
	Fzw2JO3ezkrXXbkLL5t6iBhoxD65Ox9XyNQpZ2j0jBpIGS+tCRQ==
X-Received: by 2002:a05:6512:3f19:b0:553:cc61:170b with SMTP id 2adb3069b0e04-553e3b98f84mr3747073e87.10.1750687297716;
        Mon, 23 Jun 2025 07:01:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG89Rz9PqrL0f3vMDfXPPWwQBkTuKiA1M8G8745Tdu2WmKymzZAXhOuTGumkLVsU5sTP1V8JQ==
X-Received: by 2002:a05:6512:3f19:b0:553:cc61:170b with SMTP id 2adb3069b0e04-553e3b98f84mr3746924e87.10.1750687296534;
        Mon, 23 Jun 2025 07:01:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470903asm113858015e9.40.2025.06.23.07.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:01:35 -0700 (PDT)
Message-ID: <2930133f-371d-4846-968f-6137ae1b3156@redhat.com>
Date: Mon, 23 Jun 2025 16:01:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize collapse_pte_mapped_thp() for large
 folios by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250618155608.18580-1-dev.jain@arm.com>
 <cd871535-f606-4f2b-8fb2-e3520a2b000f@lucifer.local>
 <164d06b5-1640-4b0e-bc60-cd886bc5a98a@arm.com>
 <023a65d4-5f69-42fc-ab43-b73e44d6cd10@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <023a65d4-5f69-42fc-ab43-b73e44d6cd10@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>
>>>>    mm/khugepaged.c | 38 +++++++++++++++++++++++++-------------
>>>>    1 file changed, 25 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index 649ccb2670f8..7d37058eda5b 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>>>>    int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>    			    bool install_pmd)
>>>>    {
>>>> +	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
>>> NIT: I don't know why you're moving this, and while y'know it's kind of the fun
>>> of subjective stuff I'd rather the assigned values and unassigned values be on
>>> different lines (yes I know this codebase violates this with the pml, ptl below
>>> but hey :P)
>>
>> To maintain a reverse Xmas fashion. Now I know that the declarations are already
>> not in an Xmas fashion, but I wanted to make sure the code I change maintains
>> that for the part I am changing :)
> 
> We have no such requirement in mm nor do we particularly want to establish any
> conventions around this.

Well, if we already do have reverse xmas tree, we tend to maintain it

... or when adding new code.

So in MM it's actually very common to do that. But we avoid doing that 
just for the sake of it when touching some code.

-- 
Cheers,

David / dhildenb

