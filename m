Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ACD26A0C2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278306; cv=none; b=WcD9EzoVEiEzHJISykWynRs9gUOVJNjYVSNvoyQ4s+dxzVvyZ2qyUqDhjhnxSR6A+DHpBUuOX9cNClfxW0mcFN4BNf6zlBWv5pRIELUtZHqGZSQm4KUB07qfhu+TO7F4wpegw65n5OUwcAw95voMqzSc9Ie7ZD3a79niKyDatt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278306; c=relaxed/simple;
	bh=rcKmSUgHpsgrV6/iQao/x7bdLFkwJp5qa8+xh1WZKuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEPv+PfRJHoqH8gIfA+LzB9/6Hx0nulpzKQNA/lNyHEI3cPX3/nAYt3cpe+zERFUWrh/kIqUKItEg1vdTaYIuGx5R+kvXR8EuegTofkcOoEd7PKoYEh+IkHc6sXoyWNSijCSsHJQ9FOZqt70EnDMl6xtlHuB9DVSMBEKJ2ThHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ePrVvES7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ePrVvES7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744278303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/PhODJYUOFY/4jZ292xori9GQqlmQfr9vf/eG8mtsE=;
	b=ePrVvES72xtPuoVnopAvKG3bX5ZVEzLfVkjB7iYSaZBQtdIa7hVcCpDvjYqhDaOlZZ/kLc
	4tOqlTieuPrzOkyrsUXfsd38YtdKPGUIZadYI5yJ9EAiiAyFRDs4uzIOA8tvnEfc+6cren
	sSz6+chqpBcAhOZMY0x+3NIUhv0kvuo=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-GD1OAWCkMkWRKsGNDs5cZw-1; Thu, 10 Apr 2025 05:45:02 -0400
X-MC-Unique: GD1OAWCkMkWRKsGNDs5cZw-1
X-Mimecast-MFC-AGG-ID: GD1OAWCkMkWRKsGNDs5cZw_1744278301
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so518597a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744278301; x=1744883101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/PhODJYUOFY/4jZ292xori9GQqlmQfr9vf/eG8mtsE=;
        b=I9qAGX36etGpR3Kdym9DxQqbKxZ5ny6tLwZszTrTHxy9Zf5+OlHr8Dp97Lz1Cpj5Oo
         SwP635m/V2eCRSKZPEWLOVqcXspDJXNdg8B3Q07v3X3XZrCp6em/EemJr0kaNXNw+QAR
         RXfz9kG/AQnjkGaMjCvomR9+r6jdrKuiN5DrAE05P+D5nZjz1RuK/zcGdiYIpX/51SDL
         E+uCHViqQaCUHPa4E4eEWSPul+GUUxFI1vcfs6vv0iHyMXuUAW93pvjgvrJgbprvmHxe
         GwvIeETlLPkZqPbDHev2q94nVCyJceAkeMsQRcvn694v0Ih1bKApMEpKa8Ve1VZfdDXz
         UrOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWv6Rib6KvjbSyiTpEbahpuFbIgQhf5L32LyIQxCQ4SHVvP1S9jAWPtg1CUAxpEFWz0fjDWJPK9EzOkRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNRE+ihNaG2NO/MSZwASkD5FynqstlaqzaaPoSYodhkQaCYGTb
	PWg+2Z4F+Pt9IoQoaqBdVuezSBaZ5g1EiVjDgvejQzWBgiiCgHRVHZoXaopjjjIlkHEX9IDir7c
	JxBFPzNfxjQJMElVxcknWR6NGpAVUsnVLN3Pghfs+OE1MqO/Q69s/Wz+GBEA7vg==
X-Gm-Gg: ASbGncvSz81NC6cq0uzWVrO+8YdoYpgpZZL/PUuGbDWDhYoDFzFv5JXlb2TKM+VNg8M
	KEnXZnjxT+lxllUPZ/9SZycQKPoGRhRunq/HqDQSHip2WehBMI4X8NjxanXPCGgF1eBshg7iw+z
	CdJaXzjnDzzjGZ6vBqIW1Z5jreUWd1A7+4MkKWYumMrakG+5uBgU80aHdrt1RiocIpJeWmdsI/v
	IOodDcBiITYpaZlzkLdD2gW0LpQBsy9bEGVstulbknnnvfsV43uBWHGtV0XLkp/NThtcailfHCo
	yCVbK8PSbCOh
X-Received: by 2002:a17:902:f542:b0:224:e0f:4b5 with SMTP id d9443c01a7336-22b2edab992mr22561975ad.7.1744278300865;
        Thu, 10 Apr 2025 02:45:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRlBAGOXJTHImC/d9zbZzfMKPBHx1mRPlLAVbrk95GhmWW/h8KqdRrNOXYYBIBbjz/7wTkAw==
X-Received: by 2002:a17:902:f542:b0:224:e0f:4b5 with SMTP id d9443c01a7336-22b2edab992mr22561775ad.7.1744278300529;
        Thu, 10 Apr 2025 02:45:00 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97298sm26133415ad.138.2025.04.10.02.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:45:00 -0700 (PDT)
Message-ID: <675d6580-814f-4fae-9dc5-9470645adc07@redhat.com>
Date: Thu, 10 Apr 2025 19:44:54 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
To: Oscar Salvador <osalvador@suse.de>
Cc: Aditya Gupta <adityag@linux.ibm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Danilo Krummrich
 <dakr@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20250409180344.477916-1-adityag@linux.ibm.com>
 <Z_dWTU8UsvCHFMpN@localhost.localdomain>
 <dc4c0d4e-a9a5-4fa5-b39d-4248fba26043@redhat.com>
 <Z_d_8fyQzGuwzbIv@localhost.localdomain>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <Z_d_8fyQzGuwzbIv@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 6:23 PM, Oscar Salvador wrote:
> On Thu, Apr 10, 2025 at 03:35:19PM +1000, Gavin Shan wrote:
>> Thanks, Oscar. You're correct that the overhead is introduced by for_each_present_section_nr().
>> I already had the fix, working on IBM's Power9 machine, where the issue can be
>> reproduced. Please see the attached patch.
>>
>> I'm having most tests on ARM64 machine for the fix.
> 
> Looks good to me.
> But we need a comment explaining why block_id is set to ULONG_MAX
> at the beginning as this might not be obvious.
> 
> Also, do we need
>   if (block_id != ULONG_MAX && memory_block_id(nr) == block_id) ?
> 
> Cannot just be
> 
>   if (memory_block_id(nr) == block_id) ?
> 
> AFAICS, the first time we loop through 'memory_block_id(nr) == ULONG_MAX'
> will evaluate false and and we will set block_id afterwards.
> 
> Either way looks fine to me.
> Another way I guess would be:
> 

Yeah, we need to record the last handled block ID by @block_id. For the
first time to register the block memory device in the loop, @block_id needs
to be invalid (ULONG_MAX), bypassing the check of 'memory_block_id(nr) == block_id'.
I will post the fix for review after Aditya confirms it works for him, with extra
comment to explain why @block_id is initialized to ULONG_MAX.

Aditya, please have a try when you get a chance, thanks! I verified it on Power9
machine where the issue exists and on one of my ARM64 machine.

Thanks,
Gavin

