Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E841E0083
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484345; cv=none; b=FVJ8RD/VUa3FhVkyqup0aCQdRRz8PeA498nWmi+PhZ7WaSUfEJhWeoYEaIf7k0iFGJSKmXaVROW5ejOZHuvhxJ14WUY5kPUGk9cKr7wVEjytPDLigOLPuVGV+AzFJXkn7tEmQK07c8nEtGHUC+L6DeXjnJfzJejc1/xc1QCV24M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484345; c=relaxed/simple;
	bh=3KYj4hoXt0YgFwkyodQk2jYK82urZK2Zbm7i9f20f/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqSR3NG9HFnYOdvBmjdMqoiy3udEsjGNmT5AaTfI8OY8RqxKn4+6MIrBxlCvGpSo9Y+HVK0U+MOjm81X8rUdeuHJ2enDhdkC+oidgHQHptVUTmVTPPsiixquCfUq2kCZ4e+YBIl0wDFHFhq8X8RH/MHAKZU1h/S7O/eP7G+8Znc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R4vSjzaP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R4vSjzaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745484342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DCCtHgRAYDee1byosMX1ALFYFAjSSHdnoUS+x28sB6w=;
	b=R4vSjzaPptmG8XUe6Fs+ZxZKvIxkEUVEExHyA9F+/HWo/s6Sqhoj52rKgNgEeNghVD39b0
	YWcKkEDkNjBhhKoZyUGTo0Z9jusgnJhfc7FmYUPLzxmUH7TBOrZMBhig9HUWow1p2E6xcS
	DDXdILMzwZahqU2Q+meJcAtXQFJcQqI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-cTB_JmabOuWDlAEgqIruww-1; Thu, 24 Apr 2025 04:45:39 -0400
X-MC-Unique: cTB_JmabOuWDlAEgqIruww-1
X-Mimecast-MFC-AGG-ID: cTB_JmabOuWDlAEgqIruww_1745484338
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so3548305e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484338; x=1746089138;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DCCtHgRAYDee1byosMX1ALFYFAjSSHdnoUS+x28sB6w=;
        b=lmb1SUaqzplPOoEmmPpYMsZ6YJ4hHE05waJ7hdV1NG1Po4O0BPx7IWWvOUiqF4XyID
         tXTHUydFGV8huYDkNnCm8GqwG6ZgN6Tj4T0sI9+A4W9X6Fj3SoKGbz2MnEBd8EbvYNCk
         7m3SplXPthWqZprKEHlnMbUESdISqsLdSd8rH5ovyyoBLCQKngeqBbYYXc28IFH8s1tF
         HnmRTV9zz/buCHOrTW15pSUDsprhxydkUVNpwpkZwr+Q1MZqFqBOe9+wmL8dpsvA1Au4
         7Ydixnk2yCaZVmpjtu7HrrxTpFxw5dypJrcUMaSrOFGv/CglwbRO5P4FYlU4L1P15/OS
         luiw==
X-Gm-Message-State: AOJu0YzHTChejRZe3OWsrvOQjk1YNZYxvP7vrVgd0Lc1ERNVzwu77ZMR
	oyiynofjBZlBCoY22FKo4HQuE3uxGJHfArA8BYJCbnuTWxy/8ucgYK0KxvcLCjwDf5EmdlJO7Ad
	SAN4bsP74z7dbo0c/+uOjcYxC5Ax8pO2Srt4kXBUD/EK7Lg71AIc/hhQD3fubwQ==
X-Gm-Gg: ASbGnct2BFRDVEPdXBrvcOA+zD6IGQq5ycfbQoneW9lW7zaZHLpKHWy41DOncP3QpFU
	/5ruhfL+mV9G62NbiOB7aWz92To1hMUQZlosjon8dwoamnOjqn1YmOQO/0+RTt5PTFYPKa2kknM
	w3bk08FeKObvXC/aj11F6ol7FhgL21N6DGFqv2LGDYLBOfeUS18SvIaD5CG22vhXPT3wNsrOYEk
	DmuhYETXhUWzV90JOgvs7Z4TCb4z7cw2ifQhE3/3836AhTlGYT0BbSKgpBSJL0dBIN9C9XjQVuI
	jivMgRUwMcxR0NapMcb59gGR/jp7ivAguogpLv3BtkGO17Zh9iwYf83w37ydmFGk4ONmbdkwibU
	eEndk74KskFAAt/DsPI8w3B1ZXEeOoYV60kSM
X-Received: by 2002:a05:600c:3b91:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-4409bd86c8amr12550085e9.20.1745484338303;
        Thu, 24 Apr 2025 01:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiTvyva/0VDNmVOrOfyf3Kou3YcRNl4Yq3G4pDqzn2+kBmauUiKe/ULre54W4Covxqkfdesg==
X-Received: by 2002:a05:600c:3b91:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-4409bd86c8amr12549815e9.20.1745484337940;
        Thu, 24 Apr 2025 01:45:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba96sm12028085e9.8.2025.04.24.01.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 01:45:37 -0700 (PDT)
Message-ID: <0101d903-af59-478d-b0e6-af5ba6619eff@redhat.com>
Date: Thu, 24 Apr 2025 10:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250422144942.2871395-1-david@redhat.com>
 <45b26168-93c9-4170-b7e1-4b51078a04f6@lucifer.local>
 <d3f71458-8c0d-44c9-9a03-868efceee93f@redhat.com>
 <33b972a5-a137-4b5f-846c-614e5f83409f@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <33b972a5-a137-4b5f-846c-614e5f83409f@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Probably the right way of attaching such metadata to a VMA would be
>> remembering it alongside the VMA in a very simple way.
>>
>> For example, when we perform a reservation we would allocate a refcounted
>> object and assign it to the VMA (pointer, xarray, whatever).
>>
>> Duplicating the VMA would increase the refcount. Freeing a VMA would
>> decrease the refcount.
>>
>> Once the refcount goes to zero, we undo the reservation and free the object.
>>
>> We would not adjust a reservation on partial VMA unmap (split + unmap A or
>> B), but I strongly assume that would just be fine as long as we undo the
>> reservation once the refcount goes to 0.
> 
> Yeah this is a really good idea actually, almost kinda what refcounts are
> for haha...
> 
> The problem is we talk about this idly here, but neither of us wants to
> actually write PAT code I'd say, so this may go nowhere. But maybe one of
> us will get so frustrated that we do this anyway but still...
> 
> Then again - actually, is this something you are planning to tackle?

I hate this much with that much passion that I'll give it a try for a 
couple of hours, as it might fix the other issues we are seeing.  So far 
it looks like it cleans up stuff *beautifully*. Even VM_PAT can go ... :)

... and I think we still have space in vm_area_struct without increasing 
it beyond 192 bytes.

-- 
Cheers,

David / dhildenb

