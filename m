Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFA525A65B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194376; cv=none; b=f5EunHKagCxRtjWsD9ONckGKwbKknZ/8sneiptIHSQQtdDQwP+yOuf9J1vcqBJbRCz98K5heGFTNq18OZglGRYP08MlU9aoNe5Es7ZhsDBohDjEQ4n6lKTwsxTxdsATNk6/FlYNuj6LPmZBFCzMj+d+q2HVeQpSuZhL1vNaLzBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194376; c=relaxed/simple;
	bh=Dd2T4HL5tb/cKiSS//ptq7uXCIdxCY5F4/nkLAR9cOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCVNbWlC1ZwMsJhFdpqjHCYSnV4XLHWx5ncygQIkGk6GOwUZAoEZpF93J2Te222+ZJCGyePN7QMEps1e2Q/H1yfbJDG3rUpenS1Dwl5sF3Dc62VysBh2pXehz3GxUxHwnxMWRPhnfMXGjbosJzMRAk2hX3ueYdTsPcqSxBkGZvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VIis8BDK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VIis8BDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744194373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gBs+1LYqNepToeDU1ydPbY5iIDDTg2V2NfT1HLVBLnU=;
	b=VIis8BDKJVe5nM3xuLnmEC6PHJ1ccGZplFs99TlDzDAy9DeRqC36zxvZYNEb0BfKbbb16C
	Xm9HykQOlMxbxDqRlBp/7sHv2B+e+BEVLusQkUGN7xmGlloZjkaskHj0f0mBeNHMnzKXWt
	YVVMX3zLZmBVhVJv3/HK56fgZ1CQ71c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-AiS9ZEVnOcCRKwO3tgm9Mw-1; Wed, 09 Apr 2025 06:26:12 -0400
X-MC-Unique: AiS9ZEVnOcCRKwO3tgm9Mw-1
X-Mimecast-MFC-AGG-ID: AiS9ZEVnOcCRKwO3tgm9Mw_1744194371
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39c30f26e31so4653922f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744194371; x=1744799171;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gBs+1LYqNepToeDU1ydPbY5iIDDTg2V2NfT1HLVBLnU=;
        b=EyQ9tMEJdLl3MnquLXajVtx1E43IFVVqms7JHap5M/P05jJfqWMNBidkSKkfdocbFE
         im9nngpX9XB0Cr1fQgatynkKzZZhCteX4S5X2b2RYJ1VPHAtKt9kD9XTT5MYbrkGoVfg
         IhMSrjWXMkA32Wr8pTPUO2zpcrxiX/aZGoVT7O90ftqRezc1UoEZohLCukshr6eFmmp9
         6Fo2nDfW9b9WmNhgqryxw+dSV+hEGrWV90901HvimlSKMbTjJcnG6q7G401dIwnl/DXQ
         VkZikuDT0GEt2DdkuLLbuoCqSn3fAVdQT1CwN6r6CKUb1R8oTT3kXg+GhvCwgtBto0nO
         C1gA==
X-Forwarded-Encrypted: i=1; AJvYcCWdLxoX9Ll4WAt2+BsbDh3/QyfJZl6z6yjsbP9OGyBFyXaHXMJXrAzwx1XeDzmh4kEOsRRS0eKmec4tkcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj4ViM9wnBDZs/yspyOmVaknC/bvsLQTdq8/M5gP+8ErS4czes
	R4vpPYLi22S2PI2airqQGZhVjBLqj3E51QlFoJVZUOWUZBc6i2qBfrN5mKMOb/00nPk6M2J6Iio
	YcAoWyET1fvjMT1qULebBTGq9WAaylNQYDuoLKyIgOm29vVrxJZ03bGrV7z6hAw==
X-Gm-Gg: ASbGnctdG7pl41eHL+j1WXVm/yOabg7eh/fH4XGWnQRdnblaV++3HkdDzS4DQ15tAD1
	WCn6VDbCXDfh9n0IIJRz1NcQHrrsf6uNnBRh4o7ZHpGxd+TjpkYVJBRZXQfrB+Gxjki/ZhNbxK4
	6512pvNBhwxW/hxvCZFpiYnvkUe3TH3MG7IgI7s8dDTmcU42WfbdlB4yUFmhocAZ0niFJXjugnm
	gWQls2QMUvLiLdG5zH2RFh9yS0+0wMSImsXaHkip4ookPaPVNUXRwKrGrqnpBnv7xjHKInhApRB
	ylmBWX3aUEm5oeihk4CeFAWLAyPiFMxdgy/hf+NWvXyKuLsxtJMtjCaRcdiT3SrTPXM38qb+Foi
	niUBcW100bohkwC7OLSVavZzbXnA19zoHRA==
X-Received: by 2002:a05:6000:40d9:b0:39c:2665:2c13 with SMTP id ffacd0b85a97d-39d88568c31mr2010000f8f.54.1744194371180;
        Wed, 09 Apr 2025 03:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEWmIa74oC/EBWtcIBT3aCKxYYW9CUEqTZalP8j7CzbFT+ggxsZlGZ1jafa07RTHs7W0WW7g==
X-Received: by 2002:a05:6000:40d9:b0:39c:2665:2c13 with SMTP id ffacd0b85a97d-39d88568c31mr2009966f8f.54.1744194370780;
        Wed, 09 Apr 2025 03:26:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:8400:ed9b:a3a:88e5:c6a? (p200300cbc70d8400ed9b0a3a88e50c6a.dip0.t-ipconnect.de. [2003:cb:c70d:8400:ed9b:a3a:88e5:c6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893773c1sm1199667f8f.24.2025.04.09.03.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 03:26:10 -0700 (PDT)
Message-ID: <297fdd97-d53b-4018-bd15-50235e235561@redhat.com>
Date: Wed, 9 Apr 2025 12:26:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: fix apply_to_existing_page_range()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Daniel Axtens <dja@axtens.net>
References: <20250409094043.1629234-1-kirill.shutemov@linux.intel.com>
 <00a37819-b2ae-4399-b21d-86339059c46a@redhat.com>
 <54aymye7ctvyoaxdoge3h756tnhd57kzy4lnpggvydohtrxy45@ruwh3ni4yttq>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <54aymye7ctvyoaxdoge3h756tnhd57kzy4lnpggvydohtrxy45@ruwh3ni4yttq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.04.25 12:23, Kirill A. Shutemov wrote:
> On Wed, Apr 09, 2025 at 11:52:43AM +0200, David Hildenbrand wrote:
>> On 09.04.25 11:40, Kirill A. Shutemov wrote:
>>> In the case of apply_to_existing_page_range(), apply_to_pte_range() is
>>> reached with 'create' set to false. When !create, the loop over the PTE
>>> page table is broken.
>>>
>>> apply_to_pte_range() will only move to the next PTE entry if 'create' is
>>> true or if the current entry is not pte_none().
>>>
>>> This means that the user of apply_to_existing_page_range() will not have
>>> 'fn' called for any entries after the first pte_none() in the PTE page
>>> table.
>>>
>>> Fix the loop logic in apply_to_pte_range().
>>>
>>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>> Fixes: be1db4753ee6 ("mm/memory.c: add apply_to_existing_page_range() helper")
>>> Cc: Daniel Axtens <dja@axtens.net>
>>> ---
>>>    mm/memory.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index fb7b8dc75167..2094564f4dfb 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -2907,11 +2907,11 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>>>    	if (fn) {
>>>    		do {
>>>    			if (create || !pte_none(ptep_get(pte))) {
>>> -				err = fn(pte++, addr, data);
>>> +				err = fn(pte, addr, data);
>>>    				if (err)
>>>    					break;
>>>    			}
>>> -		} while (addr += PAGE_SIZE, addr != end);
>>> +		} while (pte++, addr += PAGE_SIZE, addr != end);
>>>    	}
>>>    	*mask |= PGTBL_PTE_MODIFIED;
>>
>> LGTM. just curious, did you run into any actual issues that are worth
>> describing?
> 
> I stepped on it in my non-upstream code debugging. I am not sure how it
> affects existing users.
> 
>> It should affect apply_to_existing_page_range() users where create==false.
>> There are not many, and likely most PTEs in the range they are passing are
>> all non-none.
> 
> Or we just silently leak memory :P

That's exactly what I am trying to figure out: is there something 
upstream that could actually run into this such that we should CC stable?

-- 
Cheers,

David / dhildenb

