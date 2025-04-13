Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F161C84AF
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744574584; cv=none; b=psdS6znGEGk0BO2XFYVIZs55OkQWXCD3tAodvsup6OXINK36L++DK0W6I5zbRVD0b3dQxI8Av0n8LCMS0Uj8TSrOI03aYmLAjOpORFR3IGf183EFlRPxW4/I40NrRnmORL/LggPoG3TX5q9R7uM5/YA5F/woxXuKUme+qvEI1t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744574584; c=relaxed/simple;
	bh=BE0F+hAroARe2YCQ0nxcShVfOvHvh2ZRFotUZ3IFQ6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9Mxvh+yjVneM9I3q8RVr94sEtsiNOjOe/GNAgSVItfZP4G2f+UMXDLpz9mrZyidWCL1MaSa/pDFOJHLljFqnqJk71+PpEvRvSrUCKttcaShwwVzLP2cxHuX6mkNMupjf+Ef+xFuK493OVigOzTEcgOXgB80h2uEFjln2p88ip0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VX/00LAU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VX/00LAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744574580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=63ad4fTCOD0p5TrFn4wdTZ3MlAv2F5Vw3+XL7aN8auY=;
	b=VX/00LAUQfE2ePetZWpL5X7XnPFrV0Zb3j4zjrlZU85wh93lKxpJ63UqN4GIbtSd8E1nHf
	9r2xpTI9SI5MqgBhc6RHCGV75iNak+pwrYubLJwlSMsW8MbEba+taxK61fX1jWQzvwSgnS
	S7APugcLr2uQkrmuwAo87Lsj+ewIELQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-4g1TCVIJNw-rPflNHSXuKA-1; Sun, 13 Apr 2025 16:02:58 -0400
X-MC-Unique: 4g1TCVIJNw-rPflNHSXuKA-1
X-Mimecast-MFC-AGG-ID: 4g1TCVIJNw-rPflNHSXuKA_1744574578
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d733063cdso30089365e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 13:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744574578; x=1745179378;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63ad4fTCOD0p5TrFn4wdTZ3MlAv2F5Vw3+XL7aN8auY=;
        b=L2bwLOhn5PNVRFNzatGj4inJdkiuEoL4ocrwTA6FL4p6vM26uU7nnizgIoT3KLek+S
         ojH02nnmqVQzTdWboiebd4fDYvhgtlFOe+NX2bvoYWqwXjZLqqg6wXsVjrGDQTe93M3m
         S4SQvTVt/Vyy2F4BSkerz/trHaEcdJe/6QqG7ZXr69U8FVE4dYo1zcwx7MvMmcdc+tfy
         gtK7sjY5HBwUvK+jvTinNZzra1IGqsMPgc4jeLV02k0I09QiDsfwQSsk4Jk0GspugH+J
         4tGpWZKSJNFuZzmB+UGqjo24CI80z9JahQbHwv2dkc7mSck1zNfDQd6IuScujt3GvuCG
         K3Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVI2DVtWhV+wEIKUT3bdFm71gQbdOrXRT1NHeE2gIO3nFhLTBhOqNnheA9v4Zz82GzZHwjCqym0eeaIlfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLohKVllcGoWd+CawJtkS5I+o4QcEmwQtuk5Lq06ZL40lcloXq
	mR+2oxufbgakR0riAcCL8T6y9axw5zTsUvG5YHZlKL91oGAmmhC+2BDIb423Oiwm2NiUNzTjzz/
	gA9GDxfX5EDRSt+zZIOUzMlpqGf3wRgmdv+zadX56dtyxmqDQ0xmHQ1WN331D4Q==
X-Gm-Gg: ASbGncspzHzGjo9RvVG9D2Dkr/GftwU+naQG7EAbkfwvfVI3MMectLiRzHaSIblaTW9
	6aUfBXi3Q70GuTLI96tI7na0Tury5W13lGViQuvbZ6ZSpijQrFx/0Icbj8WDNjNRl31X31udK05
	5dvnOx8bEjOAHBZUvV3qJT8hgQJTIPXgWSlGT7AKFyCPQweAlO7w/cmK7dJPkzofNkAMQPr8wCH
	/RozfOsoA91m99LkQPybLZ4h4wAldG4QRmis7d3xMB4K1CwAq4cKYQZZSLs7ucMZHfgOscJtpPc
	Q2tYZCKYLK260N5KgX0BqRcl0SE0fyOMYoAUimV8yfSn8omZ80nXsxBhk8MQB7j/Z/Aw7lxseQ6
	G4OS6XJh+r2FQnfYyNOD9l6/wiV/LfzABnO+7ll8=
X-Received: by 2002:a05:6000:18a2:b0:39c:1258:7e18 with SMTP id ffacd0b85a97d-39eaaec7d0amr7425612f8f.57.1744574577631;
        Sun, 13 Apr 2025 13:02:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC6elm7Oi5iDPiKnsLQ1d73dgjttu042978TXC+X8rsZnB7bNdTTMjBo07JiI9gRom78QS4g==
X-Received: by 2002:a05:6000:18a2:b0:39c:1258:7e18 with SMTP id ffacd0b85a97d-39eaaec7d0amr7425603f8f.57.1744574577225;
        Sun, 13 Apr 2025 13:02:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c684sm8891758f8f.33.2025.04.13.13.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 13:02:56 -0700 (PDT)
Message-ID: <b5d0d34d-8aed-48a3-a484-8a60481860cb@redhat.com>
Date: Sun, 13 Apr 2025 22:02:55 +0200
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
 <332ce477-59f6-47f9-9687-10b642b86230@redhat.com>
 <Z/sOUfK0VoiC7d+w@MiWiFi-R3L-srv>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z/sOUfK0VoiC7d+w@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.04.25 03:07, Baoquan He wrote:
> On 04/11/25 at 01:41pm, David Hildenbrand wrote:
>> On 11.04.25 13:15, Baoquan He wrote:
>>> On 04/11/25 at 10:54am, David Hildenbrand wrote:
>>>> On 10.04.25 05:57, Baoquan He wrote:
>>>>> The code style in fault_in_readable() and fault_in_writable() is a
>>>>> little inconsistent with fault_in_safe_writeable(). In fault_in_readable()
>>>>> and fault_in_writable(), it uses 'uaddr' passed in as loop cursor. While
>>>>> in fault_in_safe_writeable(), local variable 'start' is used as loop
>>>>> cursor. This may mislead people when reading code or making change in
>>>>> these codes.
>>>>>
>>>>> Here define explicit loop cursor and use for loop to simplify codes in
>>>>> these three functions. These cleanup can make them be consistent in
>>>>> code style and improve readability.
>>>>>
>>>>> Signed-off-by: Baoquan He <bhe@redhat.com>
>>>>> ---
>>>>>     mm/gup.c | 65 +++++++++++++++++++++++---------------------------------
>>>>>     1 file changed, 26 insertions(+), 39 deletions(-)
>>>>>
>>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>>> index 77a5bc622567..a76bd7e90a71 100644
>>>>> --- a/mm/gup.c
>>>>> +++ b/mm/gup.c
>>>>> @@ -2113,28 +2113,24 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
>>>>>      */
>>>>>     size_t fault_in_writeable(char __user *uaddr, size_t size)
>>>>>     {
>>>>> -	char __user *start = uaddr, *end;
>>>>> +	const unsigned long start = (unsigned long)uaddr;
>>>>> +	const unsigned long end = start + size;
>>>>> +	unsigned long cur = start;
>>>>
>>>> I would initialize cur in the for loop header, makes the loop easier to
>>>> read.
>>>
>>> Both is fine to me. It's to satisfy checkpatch.sh which complains about
>>> exceeding 80 char in the line.
>>
>> Did checkpatch.sh actually complain? You might be happy to learn that the
>> new limit is 100. :)
> 
> That's great to know. I never noticed this and always wrap via vim's
> indication.

Note that coding style says:

"
The preferred limit on the length of a single line is 80 columns.

Statements longer than 80 columns should be broken into sensible chunks,
unless exceeding 80 columns significantly increases readability and does
not hide information.
"

So 80 is still recommended, but there is nothing wrong about exceeding 
80 if there is good reason.


-- 
Cheers,

David / dhildenb

