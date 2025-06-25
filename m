Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C417A2E3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875861; cv=none; b=PiaRtxWl7xZknaIzdvtXmQ+FOvY9eQBIYfwFYu/qnYs1XppMbcrEaiAv5mDk1rxBmkVYcJOVAhcf2jOlIJLrovYtljrQ7sHgIgX//l6KFJj4aCjIAH0XVvsUJ0pWRiBt7VAw9Qnf/HBbfEEEumOjo5ODuhVHHz+hxbQe5TZ4018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875861; c=relaxed/simple;
	bh=ud3FvwW/I6VjeZJ0HmOW8gMowEOeWESobuFlOIBS8uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joymXlDGdB/j7cEDl48EroaCOg1A8YpjxIcHMXs92i80QZ18CvI5a4NQjIOpM5m8GokIWQR8Z3s3GWNdphLeOid5oj/loNj0HHlP4z1fb/DNdoDr646o/bmpci2s20oyGK3mNhcrnEL7vHDtE/dSXc8krW60Fb1UHh4WDMrMILw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aUjSO4km; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUjSO4km"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750875858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pWnIWLqZUQ/JZT7dqvsQpQ8JDnL4IOC/WIuagqDhlGw=;
	b=aUjSO4kmJMCmCyldX1fZvnMpR1soGxzs8/fp92ZMbsjIig1mx0crbGPW+sxMAkPiHXg8NL
	BfCsRCLDayP29JqKWpMZa1iwLGGXPiTlAp3Th++xMlBnXG1evgcgn51sIzzRtRNo/vkrr4
	Czff1+o86hmJL/xg5kgwuA0UaTFmfLM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-pATSbia4NVuFOsYPs64PHQ-1; Wed, 25 Jun 2025 14:24:17 -0400
X-MC-Unique: pATSbia4NVuFOsYPs64PHQ-1
X-Mimecast-MFC-AGG-ID: pATSbia4NVuFOsYPs64PHQ_1750875856
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so61284f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750875856; x=1751480656;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWnIWLqZUQ/JZT7dqvsQpQ8JDnL4IOC/WIuagqDhlGw=;
        b=Oa3jg7a+mQakAmZFz7qVeZXFkIc+oS6LoRYA2XE9DHdhonuUjf4x7niJg7W1YF3PgY
         Oazke7GSwUb5OcIrckfspJDK+GHgI+DNpYSHUtSqE+CifHdvlr0lcyR/NHdRjtq9E/dn
         5mtGt7G44ci/YH4wbEYfSvR/ro88s2Wm1spjbJjCrQNJsyuSsWlTslA4Uo4mb0YX0pCF
         BVdiZfKY2wq4f7vCKytiQxMe0/wparPeeBoMg6WUdLhBnK0fuNue7KmdbDy9C3sXQpT/
         5dh0I6HYboxnXkJlUNn6vmixdvAbXLb4K9N+Iudd1CHxkB2ZAYbP6HU9lP/o9P8wFeHF
         OPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeCMQYGbFSWy2RZneHR4k47bOZyC/dOTPSTlvZpC6u+SqZlMTHuEnLbd2lJLAHGmYYJw5eElEGrZOqmtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzALw0YwOwWH8lmNWDxOsWTBI7qNhCPJvBUXjPUmlyV6/H+Ls3f
	3XBqt5/9zHIvnH9C4Zz/h0o2VBiZHqPUIvBnr7WickqP6EOasN9IAxnOVKkToTvfcKJNcDlFPWT
	sj34U01ITitqcMu0y5Aqx5GgEusIbt7vT1kbXP8/6qerd7pEEGpyp21H5SzmNjCZYRw==
X-Gm-Gg: ASbGnctcChJ/xcsMMPH8tSgX3we1sFL8nq8DkOImaKFVZQ1P0II62ao9cl+lFzr7wfd
	0h5a9y3eFZZoJEzSn59Rh+ZgCxhlg9AcoVksgnLjBA96G0ZF/78jSiiPQDzAqKtZia/6+2T5Tc9
	FydJwRLf9EKp74DQYi+OvBQkDJxqHfbKAUKYuPcqzTzcGFiLpZLVzo+Lgy42ZXgKnKELdXkZJmL
	EAsRkveaFUhkV+bA+xhZSzXb6AqpL66B1cgMgFjpWYF+xoT4nlgMPRL7zZXaxmwsFstZ7UfBSOq
	ZCUPWN8417JkjgHqiNdqhGkQ00W/nwaxd+1qkvD+kY5+GI8eawRt3tdkrPa/2jm/IJYNsMOlVoF
	f7jPLOZWUlXAidbXNcOVYy2pnIS88feNGRcSBswUbCd1R
X-Received: by 2002:a5d:6b81:0:b0:3a5:3517:de3e with SMTP id ffacd0b85a97d-3a6ed6420cdmr3172710f8f.35.1750875856337;
        Wed, 25 Jun 2025 11:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrWcD2BmAgCu51Qrm6UZlWp1JBNezQX6VsTDpw3DYUC3CMNPIqLe+/s/lJCX/lnLe+ooULHg==
X-Received: by 2002:a5d:6b81:0:b0:3a5:3517:de3e with SMTP id ffacd0b85a97d-3a6ed6420cdmr3172692f8f.35.1750875855768;
        Wed, 25 Jun 2025 11:24:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2977sm5384651f8f.63.2025.06.25.11.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 11:24:15 -0700 (PDT)
Message-ID: <cba29ce0-24ef-4cef-9e54-74418c55c217@redhat.com>
Date: Wed, 25 Jun 2025 20:24:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] mm/memory.c: convert __copy_remote_vm_str() to
 folios
To: Matthew Wilcox <willy@infradead.org>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Jordan Rome <linux@jordanrome.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20250625174841.1094510-1-vishal.moola@gmail.com>
 <20250625174841.1094510-2-vishal.moola@gmail.com>
 <aFw5NuCbgJOBmG97@casper.infradead.org>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFw5NuCbgJOBmG97@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 20:00, Matthew Wilcox wrote:
> On Wed, Jun 25, 2025 at 10:48:39AM -0700, Vishal Moola (Oracle) wrote:
>> +++ b/mm/memory.c
>> @@ -6820,9 +6820,10 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
>>   	}
>>   
>>   	while (len) {
>> -		int bytes, offset, retval;
>> +		int bytes, folio_offset, page_offset retval;
> 
> offset_in_folio() returns a size_t so that we can support folios larger
> than 2GB (which is a real possibility here; hugetlbfs might end up with
> a 16GB folio on some architectures).
> 
>> @@ -6837,17 +6838,20 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
>>   			goto out;
>>   		}
>>   
>> +		folio = page_folio(page);
>>   		bytes = len;
>> -		offset = addr & (PAGE_SIZE - 1);
>> -		if (bytes > PAGE_SIZE - offset)
>> -			bytes = PAGE_SIZE - offset;
>> +		folio_offset = offset_in_folio(folio, addr);
> 
> Umm.  Not sure this is safe.  A folio might be mapped misaligned, so
> 'addr' might not give you the right offset within the folio.  I think
> you might need to use addr - (vma->vm_pgoff << PAGE_SHIFT).  But I'd
> defer to others here ... particularly when it comes to anonymous folios.

Not special to anon memory I think ... :)

Only the offset within a page is okay to derive (existing code).

-- 
Cheers,

David / dhildenb

