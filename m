Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85EA2F5A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744347869; cv=none; b=aNkmPZgd7wsNqmN0Z6U7wR/G7EIzCiiMyRiR7XlW35Pcs9dNojN82ZOveCyo2u8Lm0I8LjXDz8Pz1AfQeLcYA7v//LZ9gLCM9GhIRg5IRJ1fAKrxErFB2Dxsneki2PuZmOVLC9s5rBJ8kM8UZ2Zj4XrgiarbnSDXJKGepUgQfAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744347869; c=relaxed/simple;
	bh=T8mPvhM5+YZk3TzevX8v4LHU0QxvAI+FrdjtKRyhYDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrPde1vcurpclcaxowgr2xFM692D8fLkT0R9Qgj9twj7Glhw7qUGYDUC2GK6Ki9Ft2VN8Fmp6JbdRES6UbV3Rp/wnKX4kOoNQDdqtKb/uVM/V2NgJNSt88NyIp/U+CwvqRdnS9Za3X+nBq5aphW5nE0f9EkfkCCXzCGxVwb1nUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gfz8xR2/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gfz8xR2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744347866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvlX/1zzhednfD/RRLGt51k7nZ3MkpYSEZj6G3Ys+3s=;
	b=Gfz8xR2/LU1e8McMTLpv/sG65cgvsvUhD/wDXKU3FGTcLruPsM0NNGS3cNU8lLSBtxLFFk
	Gr/CrKE4te57ki3cqsIiNrNdQctbjDolXM8vPjfIpf1GeHEpEAU+7XuW47cd+ACvFO7gIV
	wkcFa6wTDAXD6ASXAqQfu3gh31hm0CM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-85D1zAMpN3aCc8KY-RT0YQ-1; Fri, 11 Apr 2025 01:04:25 -0400
X-MC-Unique: 85D1zAMpN3aCc8KY-RT0YQ-1
X-Mimecast-MFC-AGG-ID: 85D1zAMpN3aCc8KY-RT0YQ_1744347864
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7377139d8b1so1198325b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744347864; x=1744952664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvlX/1zzhednfD/RRLGt51k7nZ3MkpYSEZj6G3Ys+3s=;
        b=Ju7tt60K1wrNM3UwIomvJcynW3fL5GTGy+E+YHiVRV31YVVSkShtBFVtgxk/c3j9ex
         7QutFryUqdIljDAlM+70juDQcKMvdeaSTjyN9aLPYjpoMS7MBMyKmm8q865bWdUrlBnf
         A6r8nDSGVWS+D8wuJHj83BiKcFlWIRxo/iIhW6Sun17X/rS6m7+PwnbH6786k3FuiO4A
         stC3Ta5Imcs5s5skvAaqrYpDRsqY1gkVvSNw0cT9aEJHFy1bWyRe34RwMm8KspS7m7XM
         6ou92Ftk46xRRFbKThZV6WNLCdqUdZIWFwtvHbWX2NFO7+1ixdI0XRtcQCHtth8IJpCl
         FI2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/K3BevTqw2rBn+Uj4/PbnzsNBv1vUGPY47SvTU/FEeHpmk+KMVW5U7YBuFXowhdcYr3DmTmOxvvHrAAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfvBw0zbKH80KDLcr9VDE16Dqeh6kkEeR4hEFm0tdCs6aH0iSW
	xf0ePC8Yuq4x6AQEzWLkivGv78l2Wp/1x108Bt2eX3SJZV/47134ctWGZNyQv9fClNXGNlYDfI4
	YxNANpV3IvyF68PmniscHfgG79IETBJQhD2ARFjVyzWbPcL+8BMY+tTN7ILgOzC3JYC1ceA==
X-Gm-Gg: ASbGncsClNBOItuEiPB9lG1fZxKmxKUiiiF5QfKLl8K0KTwE04z9zEe02sBB/O+VSfn
	RxPiXW5b0l4+TEblQBbL5n43QzrnDtR8YNn9AYhWL8YyIAYkrRSs/UQ1UZBtpDAQfQbFhAvp5HK
	KRXe4NuXLfqTMhxhhpqHjB/Qj4PwcYVBDJ0QJRHi2ETWRIggSxlw3MJLlo3j0aN3oJA0yHAihtu
	A9XFEJpyAR8bYR+vnXAuMe45hkbEoCRFdnRa45gWNO4HoobqbjSVuC4IWVAPySqedOm69iRYIGe
	laQbwbZBNtog
X-Received: by 2002:a05:6a00:4608:b0:736:450c:fa56 with SMTP id d2e1a72fcca58-73bd11a2d89mr2013398b3a.5.1744347863624;
        Thu, 10 Apr 2025 22:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuHd5b/4/FiYUP9OhKyCUlRjGkb1liUBaCYJIzX4FfjPycAoW/qWjzgb6sjOPDw4JJJvUT/Q==
X-Received: by 2002:a05:6a00:4608:b0:736:450c:fa56 with SMTP id d2e1a72fcca58-73bd11a2d89mr2013365b3a.5.1744347863151;
        Thu, 10 Apr 2025 22:04:23 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230f09bsm519649b3a.156.2025.04.10.22.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 22:04:21 -0700 (PDT)
Message-ID: <44dff493-9d79-4343-ba81-0c262d7a5b4e@redhat.com>
Date: Fri, 11 Apr 2025 15:04:16 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
To: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, adityag@linux.ibm.com,
 donettom@linux.ibm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
 dakr@kernel.org, akpm@linux-foundation.org, shan.gavin@gmail.com
References: <20250410125110.1232329-1-gshan@redhat.com>
 <9deb3725-8991-43d1-8c3d-56523fabff28@redhat.com>
 <Z_fNx7hTOR8St0SM@localhost.localdomain>
 <Z_fR6c4o1V57ZAXR@localhost.localdomain>
 <a950dd20-d7eb-429b-b638-2df68208918d@redhat.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <a950dd20-d7eb-429b-b638-2df68208918d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 12:25 AM, David Hildenbrand wrote:
> On 10.04.25 16:12, Oscar Salvador wrote:
>> On Thu, Apr 10, 2025 at 03:55:19PM +0200, Oscar Salvador wrote:
>>> All in all, I think we are better, and the code is slightly simpler?
>>
>> One thing to notice is that maybe we could further improve and leap 'nr'
>> by the number of sections_per_block, so in those scenarios where
>> a memory-block spans multiple sections this could be faster?
> 
> Essentially, when we created a block we could always start with the next section that starts after the block.
> 

I think it's a good point. Tried a quick test on a ARM64 machine whose memory
capacity is 1TB. Leaping 'nr' by 'sections_per_block' improves the performance a bit,
even it's not too much. The time taken by memory_dev_init() drops from 110ms to 100ms.
For the IBM Power9 machine (64GB memory) I have, there are not too much space to be
improved because the time taken by memory_dev_init() is only 10ms. I will post a patch
for review after this patch gets merged, if you agree.

         for_each_present_section_nr(0, nr) {
-               if (block_id != ULONG_MAX && memory_block_id(nr) == block_id)
-                       continue;
-
-               block_id = memory_block_id(nr);
-               ret = add_memory_block(block_id, MEM_ONLINE, NULL, NULL);
+               ret = add_memory_block(memory_block_id(nr), MEM_ONLINE, NULL, NULL);
                 if (ret) {
                         panic("%s() failed to add memory block: %d\n",
                               __func__, ret);
                 }
+
+               /* Align to next block, minus one section */
+               nr = ALIGN(nr + 1, sections_per_block) - 1;
	}

Thanks,
Gavin

