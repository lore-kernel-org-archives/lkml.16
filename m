Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4312836A5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288336; cv=none; b=oXHDT4OjLpzK3Wvz5f5sRVI4/tvpOAGvBwg8iabVvPTsTixucYYRvNZAQyHAP604dITKSlLI0AI9lbIoRAuTTcGjlAgHgVJwo+GOO0BI/+KVkMPPTj5DNghMBTfR5m6RK3Qrk6bl7dBuMRMFXHwS1PXb0Irst7S1S3+Z6/te3fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288336; c=relaxed/simple;
	bh=2YBwhk4W5syXgNs8UjImhop27tHOWmn3Dy+FqKFaZXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvotXgXZuCARdMMcgpcPaRY2PZm6f6zHXBIWrIeil4AainuqflFucBq6rIggXIVVyLVxNVcmIq9y5cCTFUQmPNmj8KIF+mT9aQqsst1a4s8uNTTcQR0jPSOw6gcM13syx92vzmk3jjngRVGYzIoZ2mDz0tkBs6xKzPW15sFXJ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NksgtbU+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NksgtbU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744288333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBzAyT56NRCSx5xZE5qw794PYKvaXztWfOUc9+yUbbc=;
	b=NksgtbU+DN3gmb2uLzQKMDWIlL2PQczbQuRC2v4d6s43XXQ2R6JDEddW+A25o/xq4A6CJZ
	wrXjwxfy6ULimSe2v82WgFvnyLjMmExJBVGQ/BTCaaDt6pCfVRslfalOg8Bbru9veoUXHX
	ho8bZ9tAaPqQcjfEtJ2NFTBfGtloUOM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-j1b1zzqyPBCU-oAFWwLvtw-1; Thu, 10 Apr 2025 08:32:12 -0400
X-MC-Unique: j1b1zzqyPBCU-oAFWwLvtw-1
X-Mimecast-MFC-AGG-ID: j1b1zzqyPBCU-oAFWwLvtw_1744288331
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736c89461d1so1088358b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288331; x=1744893131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBzAyT56NRCSx5xZE5qw794PYKvaXztWfOUc9+yUbbc=;
        b=pB/Wr8x0qv3ZEgMCjUxxeHTXhJnMVvRvIAW6T5pE65Ej9w4fJOsPIUBGxnYGgCLVNJ
         L1umxaRXqYA97qgmxsAOjZa+kho0wBY9TZW7huuaWRS1ownc2j5deGuXB53TKDK+PQca
         djLEfWv+W9SqTOPsGn4rWuzeCQ/7R/GxfarLtoXSCz/IXyeJMWFIJdLPZPT8yEMmDKEX
         FTJ1eUOrjNPn6pc16AcMC8yf7gA+CyHLaINHJy2waEYoueYdJ6N078k3QfmC3ak6SmSV
         e029BWE+rNkOUhyI5hLNthZ4impk04p6E1m27b/1lC7MJv/ldeyt87E3JyjcFMz5IZuV
         +z7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDQRpkRX9mCEpthj7nfxD7jOeKN+8eEgpmz/W7VIvE5kH273ApXWg1aLSVAYCIhTCSOZVdZ3sHAx/Vz6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTa2FfguSdW986ZigRVZYXnNu7kWwbq27lG9JvoXqOsAQcs9S3
	+a0wQ476PmYwpTzmWavHwmInghAw+aatfvyrObMgu3mVkNNeiXzG/2TvgbDN0Am4gcrObeVRgW1
	w8gts/H/OMJpQFD4APdxwn2Ovzpo/crRDzI/HZCgqa/qrMmNy55QNILHRx12MOg==
X-Gm-Gg: ASbGncs6hB6u/+dtjbeIRDy+XotvTkXqnInoM52wvEGmUG+WTIhims/tlnKuStzZP5W
	c4NiMvCk0XODnoJ5q+Xd+qSVduYwXd7dl6iyh8uqyxsHWf6aiFgDLZi0wKDUfZi9czFJr/kE1Gd
	CnwFlKjB9vM36s33+/TBaKo/aXcPvA6haKeuqb2jE0k5ks6FKRwmTfqFMLbt+cYivSKde03wyVk
	jjAnbKfBdq5/e+u248fwKQGZ3NqAJYu/+ilRQ+lmIw66CXw28GYB6Q0L/kFrQXeC0PIw8KX0GdL
	xRBis4368pAM
X-Received: by 2002:a05:6a21:99a9:b0:1fd:e9c8:b8c3 with SMTP id adf61e73a8af0-2016ce05c7emr2787719637.26.1744288331100;
        Thu, 10 Apr 2025 05:32:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5qEzKDpLVJLqsXJE+8XQz5tr9maYCR/qX4nyYZq9YvKO8WnRM8qNCTY7QXBulOSKkB39xDg==
X-Received: by 2002:a05:6a21:99a9:b0:1fd:e9c8:b8c3 with SMTP id adf61e73a8af0-2016ce05c7emr2787694637.26.1744288330786;
        Thu, 10 Apr 2025 05:32:10 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e694e0sm3213317b3a.170.2025.04.10.05.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:32:10 -0700 (PDT)
Message-ID: <0b4b56fa-a04f-455d-aeb0-97c065c3ec05@redhat.com>
Date: Thu, 10 Apr 2025 22:32:04 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
To: Aditya Gupta <adityag@linux.ibm.com>
Cc: Oscar Salvador <osalvador@suse.de>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Danilo Krummrich
 <dakr@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Donet Tom <donettom@linux.ibm.com>, Gavin Shan <shan.gavin@gmail.com>
References: <20250409180344.477916-1-adityag@linux.ibm.com>
 <Z_dWTU8UsvCHFMpN@localhost.localdomain>
 <dc4c0d4e-a9a5-4fa5-b39d-4248fba26043@redhat.com>
 <Z_d_8fyQzGuwzbIv@localhost.localdomain>
 <675d6580-814f-4fae-9dc5-9470645adc07@redhat.com>
 <tm2pvk7ylatmou2gjcctz4dzyw3rudw5hgqsiax3eoxfkvsrmz@vuzh3xuepq6n>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <tm2pvk7ylatmou2gjcctz4dzyw3rudw5hgqsiax3eoxfkvsrmz@vuzh3xuepq6n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/10/25 10:22 PM, Aditya Gupta wrote:
> Cc +donet
> 
> On 25/04/10 07:44PM, Gavin Shan wrote:
>> On 4/10/25 6:23 PM, Oscar Salvador wrote:
>>> On Thu, Apr 10, 2025 at 03:35:19PM +1000, Gavin Shan wrote:
>>>> Thanks, Oscar. You're correct that the overhead is introduced by for_each_present_section_nr().
>>>> I already had the fix, working on IBM's Power9 machine, where the issue can be
>>>> reproduced. Please see the attached patch.
>>>>
>>>> I'm having most tests on ARM64 machine for the fix.
>>>
>>> Looks good to me.
>>> But we need a comment explaining why block_id is set to ULONG_MAX
>>> at the beginning as this might not be obvious.
>>>
>>> Also, do we need
>>>    if (block_id != ULONG_MAX && memory_block_id(nr) == block_id) ?
>>>
>>> Cannot just be
>>>
>>>    if (memory_block_id(nr) == block_id) ?
>>>
>>> AFAICS, the first time we loop through 'memory_block_id(nr) == ULONG_MAX'
>>> will evaluate false and and we will set block_id afterwards.
>>>
>>> Either way looks fine to me.
>>> Another way I guess would be:
>>>
>>
>> Yeah, we need to record the last handled block ID by @block_id. For the
>> first time to register the block memory device in the loop, @block_id needs
>> to be invalid (ULONG_MAX), bypassing the check of 'memory_block_id(nr) == block_id'.
>> I will post the fix for review after Aditya confirms it works for him, with extra
>> comment to explain why @block_id is initialized to ULONG_MAX.
>>
>> Aditya, please have a try when you get a chance, thanks! I verified it on Power9
>> machine where the issue exists and on one of my ARM64 machine.
> 
> I don't see any softlockups now with your patch as well as Oscar's patch.
> 
> Tested on PowerNV Power10.
> 
> Thanks for the quick replies Gavin.

Nice, thanks for the quick test, Aditya. I will send the fix for reivew, with
you copied.

Thanks,
Gavin

