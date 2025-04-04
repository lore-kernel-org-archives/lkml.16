Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3954322156F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743796924; cv=none; b=fd3/lTKl9ZXaW0tqg4YNjARq8oQcvQAaLZRs1jYiBi3D4Hp7VKp2skMhznxgthFyOXYsTCsqAk86ujmkqgO+dIhXWxF8Q+DzQvwG4W9eZ4YOEQKsWJrLYasgDRrfnCZ20Xtc0q6VLBhQymJ7Zgy/ExxFmG9un5mgpqEReulMfcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743796924; c=relaxed/simple;
	bh=nPkmhUTpj63pyvFbT1rHkLZ06p2WNrfxGM9ec6D4cvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Za4rcY7EDTZQS/0JW5MDItLBnykw94MO8k+KqBE5SuscTA2XqMMdVMe/53OGrxeWKfqIN9VzsL8xdaA1TxhJk7E+16fQtfokOzNeQWBWGDOOz8OQLlDGn7xDaZRyQdYlz36BldnIlE5M18WO+t+q+NPjyiL0ZKYEuxrgGlI4izE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C7AyVw8r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C7AyVw8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743796921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l2bzN4Zigp7tX/EvogI0FBGaE5HIYvr1psdkteEaEg4=;
	b=C7AyVw8rXSnkihOTs5beQQDfHY1elExt0mkHQkh4dJTbtSa9IN97vNkMpGoLsMACAQwNnH
	jqPDyO8fvy/SJe7V92EnWOekzMU6VMtCFzcqP9MWfkOy4J+PtVCsvLvsEQk6AsJNWJfO4j
	CDdY3LnxQgQO3Fmz/el2n7mSghlbD/4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-d_8oT9dSPPu0J1-iPjXe3A-1; Fri, 04 Apr 2025 16:01:59 -0400
X-MC-Unique: d_8oT9dSPPu0J1-iPjXe3A-1
X-Mimecast-MFC-AGG-ID: d_8oT9dSPPu0J1-iPjXe3A_1743796918
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912a0439afso1310866f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743796918; x=1744401718;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l2bzN4Zigp7tX/EvogI0FBGaE5HIYvr1psdkteEaEg4=;
        b=q4/P6Rl3PUfZahUuIOX6EFQEojwwVMr3W1/J2UwEZGp7w9iRPSw2mCAyOpZvJaRjfd
         5EbsZY1jr203FCAGzqNE7OfM3GPosx7BPrvimO53dGB5CAe+ZzwbKlcxqamAb4W9Xn2p
         prWjYyp/JCcthM0rBi5fhCYL0t++UdBimC7uapx37VcRU3q+SxblST7fKNxC8wpEHw0A
         WgbLzmvJAnMYAfFtRuBrRziM/LeEJsRw8xBvzOqbC9AisxmSx2O+yA9ZZZZYDEX9Qlbk
         ArThF9/63rvE9rfXCsTq9uQRaj0fQkZcGnhIzyNS99xKygVZzXGpfCG3Y25hxo706Cqh
         Po8A==
X-Forwarded-Encrypted: i=1; AJvYcCVmXTf3kQtidaxjUfrd/aCOK8OMhQ2aqe3OVuD9hX+tyLrob6O4tZ5ussOK/2/otuWsbyYy9oWDaJOGiVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjj2fyJgnVL9C7vW0t/O7ZuVH6irMZqLeYUmC22rxbGMxY1LbR
	vHhqq068ncmqgb8r9sGiKG44eK2+n5R3OkhjODg9xgpOUIljg0psHJPf8UAnx0xj8jOmfuCJLQM
	MjPSSsKHQgv95810xuUewqww0ldAsVxfJQLsv35CHUlRmmOo5VshiBG/qICKzWA==
X-Gm-Gg: ASbGncuyysmAz5R+1r4B5DC3r9mqH+kP+4bNPHjfJHJuqNUqWGXx4aSp1DHnaDCN5jO
	9nCtIvp9uviRfd/5/P6uDMvDkpAhJoAXF6B1/82hKaNLTq5i1F2oOhAkBQxEyxAHqhNVp9AGXxf
	1BTOLvW02RBWr5Z4aWMHmgBWc6dTSsFtn5bcgewjPJp3a1cumCjbPvHb8j92cYKCu6XnOFFLfIn
	aagoCH0Q3wLCKiqp/4Edahv4MTSPal+fgocyu2cXJkFym6+spI4YmyhHxHbfhv318tN2Kb4yHNy
	0LC2CKl50YH9KN3BrKqkyelayLT63wMJ27e8+XSl6wTUow==
X-Received: by 2002:a5d:59ad:0:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39d6fd06913mr397905f8f.52.1743796918395;
        Fri, 04 Apr 2025 13:01:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAuL36QMzQ24YMeN4cLDNqaHLBmNpZH6PXHzHGjqxpSqTrSynAi7LtdIomY70GRmKwoDr4XA==
X-Received: by 2002:a5d:59ad:0:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39d6fd06913mr397889f8f.52.1743796918013;
        Fri, 04 Apr 2025 13:01:58 -0700 (PDT)
Received: from [192.168.3.141] (p4ff23dc9.dip0.t-ipconnect.de. [79.242.61.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm53765855e9.9.2025.04.04.13.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:01:57 -0700 (PDT)
Message-ID: <d88270a5-7426-4a6c-b627-83b807e159d0@redhat.com>
Date: Fri, 4 Apr 2025 22:01:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 Bagas Sanjaya <bagasdotme@gmail.com>, gost.dev@samsung.com,
 linux-doc@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
 <Z-_7fzU02OU1hVOT@bombadil.infradead.org>
 <09c13770-4d62-430a-827d-6ad35411d18c@redhat.com>
 <Z_Ad0MsSAuAGevgm@bombadil.infradead.org>
 <427f683b-ac68-4820-b264-4016b34df592@redhat.com>
 <kjmyope67af54eagiatlgph7bo4lgzy6jyut7z6elzartkoogy@eon2qkiwdbab>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <kjmyope67af54eagiatlgph7bo4lgzy6jyut7z6elzartkoogy@eon2qkiwdbab>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.04.25 21:44, Daniel Gomez wrote:
> On Fri, Apr 04, 2025 at 09:07:23PM +0100, David Hildenbrand wrote:
>> On 04.04.25 19:58, Luis Chamberlain wrote:
>>> On Fri, Apr 04, 2025 at 06:18:12PM +0200, David Hildenbrand wrote:
>>>> On 04.04.25 17:32, Luis Chamberlain wrote:
>>>>> On Fri, Apr 04, 2025 at 04:06:57PM +0200, Pankaj Raghav (Samsung) wrote:
>>>>>> From: Pankaj Raghav <p.raghav@samsung.com>
>>>>>>
>>>>>> THP support for non-tmpfs filesystem has been around for some time now.
>>>>>> Update the admin guide to reflect it.
>>>>>>
>>>>>> While we are at it, move FilePmdMapped to previous paragraph for clarity,
>>>>>> and clarify ShmemPmdMapped & ShmemHugePage.
>>>>>>
>>>>>> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
>>>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>>>> ---
>>>>>>
>>>>>> Changes since v2:
>>>>>> - Address comment from Bagas Sanjaya
>>>>>> - Squash commits and Ack from David
>>>>>>
>>>>>>     Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
>>>>>>     1 file changed, 15 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
>>>>>> index dff8d5985f0f..f8aae64e38d0 100644
>>>>>> --- a/Documentation/admin-guide/mm/transhuge.rst
>>>>>> +++ b/Documentation/admin-guide/mm/transhuge.rst
>>>>>> @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
>>>>>>     that supports the automatic promotion and demotion of page sizes and
>>>>>>     without the shortcomings of hugetlbfs.
>>>>>> -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
>>>>>> -But in the future it can expand to other filesystems.
>>>>>> +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
>>>>>> +filesystems that support large folios.
>>>>>
>>>>> That seems to allude that THP can be supported on filesystems
>>>>> that suppor large folios. I don't think we want to call that THP
>>>>> and that can confuse folks. Leaving "currently" also seems to
>>>>> indicate that there is more work to be done for THP for filesystems
>>>>> but that's not true as well. So how about something like:
>>>>>
>>>>> THP only works for anonymous memory mappings, and the tmpfs/shmem is the only
>>>>> filesystem to support it. The alternative to THP for other filesystems is to
>>>>> support large folios and with it you can end up using huge pages
>>>>
>>>> That makes things more complicated without a good reason.
>>>>
>>>> See CONFIG_READ_ONLY_THP_FOR_FS as an early usage of the term "THP" for
>>>> stuff we have in the pagecache.
>>>
>>> OK.
>>>
>>>> (with large folios we now properly implement
>>>> this concept, and support more than only PMD size)
>>>
>>> Do we really want to call large folio support on filesystems THP?
>>
>> Good question.
>>
>> "folio" is just the metadata we currently use to manage a chunk of memory,
>> and a "large folio" is one that spans more than a single page -- huge page,
>> large page, super page, ... in the past the metadata for that used to be a
>> complicated piece of "compound page". In the future, we might call it
>> differently (struct file_mem ?), who knows.
>>
>> So "large folio" support in a fs allows for the usage of these larger chunks
>> of memory (huge pages).
> 
> I'm a bit confused here. I thought the term 'huge pages' referred to specific
> page table level like PMD, PUD, or PGD (and not PTE). And "large folio" term can
> span up to anything (currently up to PMD). Could you clarify if I'm
> misunderstanding something?

The transhuge.rst is still a bit inconsistent and confusing, but we 
started generalizing the concept to special-case "Traditional THPs" to 
be PMD-sized THPs. See the description about mTHP in the document.

If a small folio represents a single page, then a large folio represents 
  multiple pages (large/huge/super page). But again, "folio" is  the 
metadata we use to manage this chunk of memory. Just like we didn't call 
a "huge page" a "compound page" back in the days; the "compound page" 
was a way to manage the metadata assigned to a "larger chunk of memory 
covering multiple base pages" as one unit.

I once had a longer writeup about all that (including how hugetlb 
supports different huge page sizes, how freebsd calls these thing super 
pages etc).

This topic seems to pop every 6 months, likely we really should do a 
better job at documenting all that.

-- 
Cheers,

David / dhildenb

