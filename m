Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724191B4232
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881746; cv=none; b=CV83FJahfqKwCnLS5SawZ8U7IIeeodj4EPY9l2enNbhxRanqS56Xigjo6g2pzPmDGFMsNPA1J+FkmO8sgnFJj+vimysMjyZECywJyFLhcZ76dJziCr0aJx57Mpqvo0I7wDpFeCPfvbrjGT5GTkZM/QnVbaqbQa7PIuQOONfH0Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881746; c=relaxed/simple;
	bh=Hr7cJ8hbGINJXjU3P0oIQapcqls5Y+aVq92uopVRj50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sD2ZwSLzlqDh3zLPy9mCgALkKZTfv7muczStr7+pW3GykoOBIYUFd0Ibv/18aAxOXmCRi5faJOey5Lg7lxzzXX7NwjB19RelTSDbhfLSUfYZvzmNIZsJBQChUZy24wiXFm0QISBM8OSAOqa4ezifSGVoliWRkbpsNDtS9f/BsiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dO0Jl28A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dO0Jl28A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748881743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ieNSkMEMzT2cBUSDsIkIFZPogjlidcu6cjj3LcjU7B4=;
	b=dO0Jl28AGbJrJs9aipWIjPmlRanhj3IitJ6B41rurrQiTlnUvWk9b2hjmFkEVoKcDaDKZc
	2KQ5RSctgvw9HCPER3pU7ge097P+xDPld7ylq61HfDcv1xPesHUOFs3idEIRfK7AcXZF6d
	rQVcYLDr9EiqpQ/4PcX9Vb9XeeHonY8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-Yp4QwoTMNHmDxL8uHJgYaw-1; Mon, 02 Jun 2025 12:29:01 -0400
X-MC-Unique: Yp4QwoTMNHmDxL8uHJgYaw-1
X-Mimecast-MFC-AGG-ID: Yp4QwoTMNHmDxL8uHJgYaw_1748881740
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-445135eb689so24827895e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748881740; x=1749486540;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ieNSkMEMzT2cBUSDsIkIFZPogjlidcu6cjj3LcjU7B4=;
        b=l5ra/+j1R9oHF87JC+el713LzvhVAm7gLTaxxvlAnIMWkc0nhQQFW5ALkxpCIoVMJW
         MOqab/1QKz/0bVhySlqImFoxt3LDZZvTpla66tG7HwdrFoWozPGinV9bhZ+WvlfpKdTI
         uxAyqUEfUn4SeK5myFFNxwY1fuL418cIDL5kLuNi9DkMpOC6HevGTPcYc4136uLXpGF7
         tO0xtf1bIp6DxD9thJJKWDm2j/cqu8Mdc88Uwleyx3EutwKLvgSgtcpFdHjKr1shBmhy
         4B3kFJqedmAxbkghS3XqyaxLKqb+Ekw84jn90a3yOJbXY2q3Psv7hq5rpdTTJZWDidgu
         6zRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/UdRPCd3OLuCYzlxKxkiWEfjFRAnic56XgeRU8T4a71TKLWEMN699iiSKwMk/W1UX2ETY5XImeUqjgm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJKnoC+q/V8uwnIz9uz+8AtLue5/yNNTZCgPi+dssOmkNo0nY
	IOt0Y6tOLviVn7Y/fdnyOBbY1dkMhlWY4X5rdlGWrYZR37kl9Ms39cz65lHxaUnF0GnTuTRdX6s
	uSP4hpOm8BHNLlQYf2TVpdrZngAI619wg/CNh6Lti8VtCrsnzjqmMfVCVEtFrCVugnA==
X-Gm-Gg: ASbGncudLPi6lV4e5RcuGKJadW9XolTFwA/vTETC/HFequdURnPEa53ttNjOqEiUnxB
	LP0oXOi/wOVdN6BGVRnHvKaVSGTBwcUfAM3Ipap8Q/FXIK/meQcVtwbrhWzpHUlo++6DK2KAx2A
	Y4tNNZiB91fiOdIrFnun8b4VRjoUXFgkutSAU4DXgYL8QCYqprO7QiKMpmHcnau7OMgLilYm7yt
	5OmJ5NV7TrjRkXkHjvGKpaoWVa9gw5iAlhuXacfbLmS/8TmXg6rGp197NotqKClWcKfrfBGYxM0
	eP6SxI2a4l/B7EPJ/YTrH8xkw6QIBGvopvXS9+im5uSWWV0ZdIaINRTw7OH9UJf3aH31D7Q/7y0
	cdeWdBP8wBMjHEsFbdRVTCH/s/QsXgY63jwZlWc7JayEkTsuKlg==
X-Received: by 2002:a5d:5f43:0:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3a4f7a364e1mr10765209f8f.29.1748881740475;
        Mon, 02 Jun 2025 09:29:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuyr73wVGfGNCmZNF9qgRvhzEmYvj6p07InfYNtUHa4yJdwhczPonOBEXQRhDsersMVP4qXQ==
X-Received: by 2002:a5d:5f43:0:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3a4f7a364e1mr10765189f8f.29.1748881740058;
        Mon, 02 Jun 2025 09:29:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b79asm15145126f8f.2.2025.06.02.09.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 09:28:59 -0700 (PDT)
Message-ID: <702d4035-281f-4045-aaa7-3d6c3f7bdb68@redhat.com>
Date: Mon, 2 Jun 2025 18:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: Fix uprobe pte be overwritten when expanding
 vma
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org, oleg@redhat.com,
 peterz@infradead.org, akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, pulehui@huawei.com
References: <20250529155650.4017699-1-pulehui@huaweicloud.com>
 <20250529155650.4017699-2-pulehui@huaweicloud.com>
 <962c6be7-e37a-4990-8952-bf8b17f6467d@redhat.com>
 <009fe1d5-9d98-45f1-89f0-04e2ee8f0ade@lucifer.local>
 <6dd3af08-b3be-4a68-af3d-1fc1b79f4279@redhat.com>
 <117e92c1-d514-4661-a04b-abe663a72995@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <117e92c1-d514-4661-a04b-abe663a72995@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.06.25 15:26, Lorenzo Stoakes wrote:
> On Mon, Jun 02, 2025 at 02:26:21PM +0200, David Hildenbrand wrote:
>> On 02.06.25 13:55, Lorenzo Stoakes wrote:
>>> On Fri, May 30, 2025 at 08:51:14PM +0200, David Hildenbrand wrote:
>>>>>     	if (vp->remove) {
>>>>> @@ -1823,6 +1829,14 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
>>>>>     		faulted_in_anon_vma = false;
>>>>>     	}
>>>>> +	/*
>>>>> +	 * If the VMA we are copying might contain a uprobe PTE, ensure
>>>>> +	 * that we do not establish one upon merge. Otherwise, when mremap()
>>>>> +	 * moves page tables, it will orphan the newly created PTE.
>>>>> +	 */
>>>>> +	if (vma->vm_file)
>>>>> +		vmg.skip_vma_uprobe = true;
>>>>> +
>>>>
>>>> Assuming we extend the VMA on the way (not merge), would we handle that
>>>> properly?
>>>>
>>>> Or is that not possible on this code path or already broken either way?
>>>
>>> I'm not sure in what context you mean expand, vma_merge_new_range() calls
>>> vma_expand() so we call an expand a merge here, and this flag will be
>>> obeyed.
>>
>> Essentially, an mremap() that grows an existing mapping while moving it.
>>
>> Assume we have
>>
>> [ VMA 0 ] [ VMA X]
>>
>> And want to grow VMA 0 by 1 page.
>>
>> We cannot grow in-place, so we'll have to copy VMA 0 to another VMA, and
>> while at it, expand it by 1 page.
>>
>> expand_vma()->move_vma()->copy_vma_and_data()->copy_vma()
> 
> OK so in that case you'd not have a merge at all, you'd have a new VMA and all
> would be well and beautiful :) or I mean hopefully. Maybe?

I'm really not sure. :)

Could there be some very odd cases like

[VMA 0 ][ VMA 1 ][ VMA X]

and when we mremap() [ VMA 1 ] to grow, we would place it before [VMA 0 
], and just by pure lick end up merging with that if the ranges match?

We're in the corner cases now, ... so this might not be relevant. But I 
hope we can clean up that uprobe mmap call later ...

> 
>>
>>
>> But maybe I'm getting lost in the code. (e.g., expand_vma() vs. vma_expand()
>> ... confusing :) )
> 
> Yeah I think Liam or somebody else called me out for this :P I mean it's
> accurate naming in mremap.c but that's kinda in the context of the mremap.
> 
> For VMA merging vma_expand() is used generally for a new VMA, since you're
> always expanding into the gap, but because we all did terrible things in past
> lives also called by relocate_vma_down() which is a kinda-hack for initial stack
> relocation on initial process setup.
> 
> It maybe needs renaming... But expand kinda accurately describes what's going on
> just semi-overloaded vs. mremap() now :>)
> 
> VMA merge code now at least readable enough that you can pick up on the various
> oddnesses clearly :P

:)

-- 
Cheers,

David / dhildenb

