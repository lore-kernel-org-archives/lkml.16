Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0057278E46
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371683; cv=none; b=eiSJCb9q9A30lsJ9keZJgxfgJ9o2q1FxNCkG8wYDQRzQMW4Q1bet/+6K1rtSJvZmMj537erwbIi5gwvbiE7oufbuUBjG7SOW/mITWRcwtojUBn1JTE9SN49fA/x/2M7mHteHxON69VwSBan0jXFa98OX6/DOWqfbgeTG5qPk/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371683; c=relaxed/simple;
	bh=2CXlJb03DPfCYWFhFaWJESoUWwe+3XynY7bKk2AxuuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rawy3nEpgemOi+M0GylevtwgBgmNAxOVdv3NBiELTMOBS7lKUh22T1JkPS5X3d/UiTJRDLnKuahy6OUuJOlFNMGl9WnucpNGtnlylvibpPUeQeHDRVKjnY+TQkGvHDoRhia1Z3iMifb4PycubtwkhJpx7oggV3PzKkS7MOt+ZqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bIbTnBBh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIbTnBBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744371679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rpgiXN1GdSRlMHMHlX6jTDGMaHiSB1vrsLY0H8e7mfw=;
	b=bIbTnBBhPZYZPQIvTTnojwddv8I0Wbeu6HjKAEm0ODfg7ZngMuOwGV1ru+LIzIcblpaBkw
	cf5nPpxGgBHUX+dDt+5hUDhuT/JLI6At5FxUqbsJEVr2jE5UEtzx+MgZ0L7iS08B2hfdvr
	nfo01MNVkcfxhnb3kX1MwpsNU5SdVXo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-7K5NPavwOk6GJGw89g8wow-1; Fri, 11 Apr 2025 07:41:18 -0400
X-MC-Unique: 7K5NPavwOk6GJGw89g8wow-1
X-Mimecast-MFC-AGG-ID: 7K5NPavwOk6GJGw89g8wow_1744371677
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43f251dc364so12703215e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744371677; x=1744976477;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rpgiXN1GdSRlMHMHlX6jTDGMaHiSB1vrsLY0H8e7mfw=;
        b=Rm+0AmTLbsIDFjAlh0c4/EIS0KqmPJESadPGTImW6LcCYA/+K4WPFkO/MY9wufHl9L
         QbN4weWIeOQ+mg6oIXOE6gYmLfv0ECONWXA1NK2oVVm1RE3amFxbIB6oz4JXDO8vf8xN
         y3AlaoVw+R3NdU4FTdt9ax6d5N27+4AtCXpZw1bx9GSg8TQRwNByzMMshc5vpHbG//Uf
         ChuKUc+8EOx59lp5X4mXLPdSTBoT+KFWeOVC+ooP2Q/WJwTZ+5WQSQYF04iGU7GiuiJu
         JjPmWEOcJ3ARvFcjyD7vHrcO/711Jhf05vKv/v/nkrst959n+SDESihxlqY1yHFlqEkx
         QlnA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Z7I65ldubjVRWn11oimxpDkffUF/RpJRp7WCMZKpY4wRuOqU/kPW/PlT4pZJswZhza2ABMFx9vyXqG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6++mvmDmUXmIlQXl7uj2fIL4LiQJnCLPy3oCFsmzeprXE2fY
	sOJqzGm1Gb9lCNThNVFPKstvlJhySqianeq+gpXoAfd5i9Hws01I6h8CMjEk1Ir+WOotBm54tx8
	f5hHmKrpQrRZkcHmlHx6qhX3a3QnQumckMD26lKmBn46RIIxQmLrWQBEYSw50gg==
X-Gm-Gg: ASbGncs8PE++auz8l2X4dSVb1ko5alOI4oR/e6hArPVFp4zvBKxyUCCSz0QfrOQb8EU
	MRLSEoRVd5q0vLF4DUAlLzNM4njnDm/CUF8b6BQjV7Yi9RnlPOx8lJfa9aIQzP1YKAcM9i3wVQZ
	zhoMuyForwO3Sqg1Fuey127iB7EC2d9KgSnMoMNVBWwhk8Qe7V6db2fyiemd1YU8ZdD6kqTelyq
	P/sILHkmX9PxA+64URxhggCxvjcDaSERln+TynPv6d9gjXw/aYfFh0NMryhiZ0Oa6eUSAPnLRKk
	k3fP35q29z0RtSZVtfHYIfpSyekljBDDQAstdbmv2/6rDwDaI4ar34gdBdIdY2RDWMMTV4CsSZN
	z8jgdA7LPnZsUSsad3azFwP0mfA8ui1+21WER
X-Received: by 2002:a5d:64e8:0:b0:390:f745:bbfb with SMTP id ffacd0b85a97d-39ea52171f7mr2050575f8f.26.1744371676879;
        Fri, 11 Apr 2025 04:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGWT+Wrq8/yLw2xOdYfWGeNI9DWGbQ2gESFnyzGQibk6n5vbhxkmM1zfjg7hr4aTrnDDXLOg==
X-Received: by 2002:a5d:64e8:0:b0:390:f745:bbfb with SMTP id ffacd0b85a97d-39ea52171f7mr2050541f8f.26.1744371676438;
        Fri, 11 Apr 2025 04:41:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c726:6800:7ddf:5fc:2ee5:f08a? (p200300cbc72668007ddf05fc2ee5f08a.dip0.t-ipconnect.de. [2003:cb:c726:6800:7ddf:5fc:2ee5:f08a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9807b7sm1776611f8f.60.2025.04.11.04.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:41:15 -0700 (PDT)
Message-ID: <332ce477-59f6-47f9-9687-10b642b86230@redhat.com>
Date: Fri, 11 Apr 2025 13:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] mm/gup: clean up codes in fault_in_xxx() functions
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, osalvador@suse.de,
 yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
References: <20250410035717.473207-1-bhe@redhat.com>
 <20250410035717.473207-5-bhe@redhat.com>
 <f03f7e13-3d37-4d4a-87a6-61731744f476@redhat.com>
 <Z/j5y6frIT2jIsv7@MiWiFi-R3L-srv>
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
In-Reply-To: <Z/j5y6frIT2jIsv7@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.04.25 13:15, Baoquan He wrote:
> On 04/11/25 at 10:54am, David Hildenbrand wrote:
>> On 10.04.25 05:57, Baoquan He wrote:
>>> The code style in fault_in_readable() and fault_in_writable() is a
>>> little inconsistent with fault_in_safe_writeable(). In fault_in_readable()
>>> and fault_in_writable(), it uses 'uaddr' passed in as loop cursor. While
>>> in fault_in_safe_writeable(), local variable 'start' is used as loop
>>> cursor. This may mislead people when reading code or making change in
>>> these codes.
>>>
>>> Here define explicit loop cursor and use for loop to simplify codes in
>>> these three functions. These cleanup can make them be consistent in
>>> code style and improve readability.
>>>
>>> Signed-off-by: Baoquan He <bhe@redhat.com>
>>> ---
>>>    mm/gup.c | 65 +++++++++++++++++++++++---------------------------------
>>>    1 file changed, 26 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 77a5bc622567..a76bd7e90a71 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -2113,28 +2113,24 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
>>>     */
>>>    size_t fault_in_writeable(char __user *uaddr, size_t size)
>>>    {
>>> -	char __user *start = uaddr, *end;
>>> +	const unsigned long start = (unsigned long)uaddr;
>>> +	const unsigned long end = start + size;
>>> +	unsigned long cur = start;
>>
>> I would initialize cur in the for loop header, makes the loop easier to
>> read.
> 
> Both is fine to me. It's to satisfy checkpatch.sh which complains about
> exceeding 80 char in the line.

Did checkpatch.sh actually complain? You might be happy to learn that 
the new limit is 100. :)

[...]

>> /* Stop once we overflow to 0. */
>> end = PAGE_ALIGN(end)
>> if (start < end)
>> 	end = 0;
>>
>> for (cur = start; cur != end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
>> 	unsafe_put_user(0, (char __user *)cur, out);
>>
>> Essentially, removing the "cur" check from the loop condition. Not sure if
>> that is better.
> 
> The current code is simpler. Your now saying may save the CPU execution
> instructions a little bit. Both is fine to me.
> 
> I don't have strong preference, I can make v4 to address these concerns
> if decided. Thanks for careful checking.

Whatever you prefer!

-- 
Cheers,

David / dhildenb

