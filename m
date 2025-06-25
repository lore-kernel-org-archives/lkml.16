Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA9A72626
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837022; cv=none; b=SHifMuMDLbCwXZFCVgr3faTpP4e6prMR3yGFIoRl/kNqcSawYHEYlwJ6wT/wg2YkKAByn4c482ZT5TDFvakonJzNQ0cM53r4dq5xVakI7SCTmfQDvPKSnJH2Sbdh5KoMpHVYf7PjtUFHv2ntZpYBWOlECf58dHEWLCdtyuK0sWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837022; c=relaxed/simple;
	bh=tWbjqJMhWoDJpfcwqAs6dp5jx8ThsHj5MWbFv2xcUHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7iD3wkWGLLHc9Wx+QV+rN98dLwMs0NTcw/gMJIcUshpOSznFtN0p/bXN6+JY4K9FB8C3e8s1Bi+QHX2URsgpKQzdiG1Sl+qS+DmXLMNUkU2wwpxhRid+VXvIqzLj/CSzsTHP0jeqCUF7Nz68FdRKMnrC/etGmlyAJSft0FrOKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RkOdzqcB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RkOdzqcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750837019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1P/2lQyvV8ecDpDP3C/LwPlKXFGjscFAOpQlLtWNP6s=;
	b=RkOdzqcB1EHr3EK/u72lTvl+HgUln79JFZS5okduSL4j09rVjS++xFiKsGthM5bulXFlvI
	+NnT3uAKuwZ5mEhc13SwmOiBiSnEOX5v9MmtDUJSWIZ/gw7PKrBnnU9o6T0uPIv7aIfb9I
	CQLeRWHy7L5CQlQCb2Dudb7HGN3uk84=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-GHqWsk6cMy6DQhLQq4WB6A-1; Wed, 25 Jun 2025 03:36:57 -0400
X-MC-Unique: GHqWsk6cMy6DQhLQq4WB6A-1
X-Mimecast-MFC-AGG-ID: GHqWsk6cMy6DQhLQq4WB6A_1750837016
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so278386f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837016; x=1751441816;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1P/2lQyvV8ecDpDP3C/LwPlKXFGjscFAOpQlLtWNP6s=;
        b=xNh4EVgUiGaFra9GhLNWFWgcs06tvUM9IfZIxQafsbmJr0yYoOLoutpWkgV+KaHNJp
         HwN/ZhgUXb6ECn1wCXh6eqyxhvNVGPKDPa8a35CgANt7tTf0SOGAbXaoMSpUjSgD9GV9
         Q5E6Z4x/dw2LbCm7b44Y8wSgfnwQE1U7rnxSswfLfZVl9p4ptgl5yivfAeEoMu1Fg8OP
         NDVVkHp5+Ortb8G3nyM5Dc46mfz1CT/tnYvbDw9cBHfTPUh8J5z7NGqTdDgPeQrUTgMx
         Z9y+9LJekHArOP4d0nSBfIbuvxFtQL3wo0Ys0K2mlDugkOJcUB/rJo22mxjEryhzpBkE
         dT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGSvE2pk6+OoSQSk8kMiN2SGRRZb61I3Z6pMHiAzQy5wCAIZrG/6o9Q4Z6jAsIQIP9HpmW0POboh2ng5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr4kn1cAa80DUZ5QVV1e5nBqxzZdjWNQCt/s3WASD3NctEj6vE
	OoqHQMO8/Yy353gDip1OmYJv45+N56InOdt2KXTaIIuOyKVxUwsgz2CVo7RQNuaZlLcVJkYFp07
	BSpH86Do71px97mJER4j+3XdJPmY65Kwy9RmtkJiODn/UvuBmpQJoiEqZ7iYZXINu2w==
X-Gm-Gg: ASbGnctQM6mhMD8d7jMOkPLYDpzxRjzd236yMhrDyUlYnTrbW9Vk+p31KwlH3xeW5Gp
	V8MkMxZ7rrV6GvkMRA5OdL/stJ0MvdQdWVRImIb7aQlAtySnj2SAMfTOpwXMinRaTCoPB8nDsWG
	WCpBjKQB3XOYqY4BL4cDGvFCvjrS+wi0+AyN+vvwp97kvH6ZPweDuIztwq6D71rmpwi9VYPyCFL
	+shH8fa3Sn1LF/4TmTklkRKNbNyTOLuNoVrOyb7j82t0WREM08tDU7vYt5E8FHQhdD3vH34LaBZ
	5IJkY2MfXn/XZHNuu9SBTK8GqBGMyqHna+j3FA9w35ecDRFrybXLncqKHjmQiRA74Y5broqslnA
	+3lsYeVgqZWwuvoEwaJutWAA8H+rrcScgSWITKtCxIahD
X-Received: by 2002:a5d:64e2:0:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3a6ecf3ece7mr1702457f8f.14.1750837016026;
        Wed, 25 Jun 2025 00:36:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDrUzxokw9FSq1FXRe5LEe0dHrBdi9y5myM9SVlJAcoCa3Xu9vvk6aYzq96tXz1EenZSie7A==
X-Received: by 2002:a5d:64e2:0:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3a6ecf3ece7mr1702440f8f.14.1750837015642;
        Wed, 25 Jun 2025 00:36:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8051018sm3950725f8f.16.2025.06.25.00.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 00:36:54 -0700 (PDT)
Message-ID: <8691d74b-67ee-4e26-81ac-f6bf1725361e@redhat.com>
Date: Wed, 25 Jun 2025 09:36:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com>
 <db757c1f-8666-4a73-ab57-cce83059e95d@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <db757c1f-8666-4a73-ab57-cce83059e95d@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 09:30, Lorenzo Stoakes wrote:
> On Wed, Jun 25, 2025 at 09:23:31AM +0200, David Hildenbrand wrote:
>> Well, one could argue we broke user space (admin settings) when we converted
>> "never" to no longer mean "never", but "never by page faults + khugepaged".
>> And we did so without updating the documentation.
>>
>> I finally went back and checked the original discussions and, yes, this was
>> deliberate [1].
>>
>> As so often, we created a mess with THP toggles.
> 
> I mean... !!!
> 
>>
>> Probably best to fixup the "never" documentation, and state that there is no
>> way to disable MADV_COLLAPSE anymore.
> 
> I disagree on the basis that system administrators will absolutely expect:
> 
> # echo never > /sys/kernel/mm/transparent-hugepage/enabled
> 
> To disable THP.
> 
> I _guarantee_ you that's what nearly everybody except a handful of people will
> expect.

I know, See my other mail, the problem is rather if there is no somebody 
relying on never+MADV_COLLAPSE from doing the MADV_COLLAPSE-documented 
thing.

It's a mess.

(I have the suspicion that Hugh might know of such a user :) )

> 
> If we do decide to not do this series, _please_ can we seriously update the
> documentation to be _absolutely crystal clear_ about this.
> 
> I will volunteer to do this in this case :)
> 
>>
>> I agree that if we want a way to disable all of them, we better have a
>> "deny" now. ... until someone else breaks that, then we can have a
>> "really_never_deny_all" etc. ;)
> 
> I really really dislike this. 'Deny' is weaker than 'never'. And now we have to
> add even more complexity to the thing.

See my other mail, for shmem_enabled "deny" is stronger than "never", lol.

-- 
Cheers,

David / dhildenb

