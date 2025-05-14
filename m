Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9070221A928
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210460; cv=none; b=m1S0oVV75pv4YtU80jtyeTCZh5Vw9UPBfdxfkfkWlTJvrUAeH/9bKVbsAkJ0KUaXCCCqtaa800DsYAlHxWWsbWJdi7CKjCVQ9AwZzkr4USIlaWE1DlAFyGD+hO9fD800jnoWghodMeczhanfWLqQxKs/kp+PZfo2FkO07d7i39Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210460; c=relaxed/simple;
	bh=xwmT5ahSo/42Vzd63HMnS5ibR4t69bomeBwZ7ynTQTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bl9s+X8XILio5V0BNf9IHT+XDm8fd8rFD3zV5MEXyGmIJTOaLaYMmzJsFjD786kkFUJBrAUxUKeprG0tF/drKq6Qw6P9Z3P1Sp6Bfu0MmLxCCO6yDvQvw/bAJQOxsXgK515d0UWCazvwvRV2fDWHWQreubuvgHxeNKdOqmhbv/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=beVBsUCP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="beVBsUCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747210457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UVqeHdXoNatwSKVTslY/SeODkl4nG6i6PMhVEIwStqY=;
	b=beVBsUCPc1qSTJyTZEmtXN5E81BUEk7/9YL9POCWBtcIktHWwGTm1qY4vFZXpZ+IqwnDvX
	ORbJMxOvjRQQgBtiIgviqxWbUh9SxG2quqduup7B14Mc69hubntLGeNRIXNWbSuGpP+KGl
	LMi0uvncKRp50+5vebSmGy2GT7v8Ul8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512--JVJAdjcMx6Id9Ya4evoVA-1; Wed, 14 May 2025 04:14:15 -0400
X-MC-Unique: -JVJAdjcMx6Id9Ya4evoVA-1
X-Mimecast-MFC-AGG-ID: -JVJAdjcMx6Id9Ya4evoVA_1747210455
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ea256f039so47575145e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747210454; x=1747815254;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UVqeHdXoNatwSKVTslY/SeODkl4nG6i6PMhVEIwStqY=;
        b=EIxsrHu8UZVTIu0cYOnIXCd5EuOXmmaZAxW3bPelPvxgHZvS/q+/ej2+GbXBMB8UeE
         V3VuPum18r++rmqFyHkWBGZLkbOoxiAv+kUEyxAjzTP1HlO/oLVS8PCdwfH0wWqHXgVk
         2UmS4Z7LL+/+3vYldVe1Q8/iLCaeauiVmnJ4wnDmN/dgRMOdCzyudJ0dbcYpPlnu29Gz
         oxMzepRgUa6nYnVGh0s/Xa8GDTOG9vG3NkW/Ks/7rbNeb+gLMLD2wZrkFArCmwFZJ5Jw
         HYbt/eIJ6FSnZSG7P5cRQAv50Eul45RE4a4C6ucdcFh7b2PwnF5YOmsffynLTFqF8e7p
         eWgg==
X-Forwarded-Encrypted: i=1; AJvYcCV7fplN4vbh6mXIFlE3ILfwrCxpIySUwBu/3ZLmumI/Ruvjf3VlOO/WFc7u8KHSFhaWvR6BIupqkeKe26k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXC31TpLhCZ7G9g/5q9MUHd8Frjg7UgoBmAjhLCgGDYbXMM9P
	wWbtzU+920gtQsOnFwjOx9kwRoIolePSnY6TddAsMLYPA2qEg2oQw5cffgEdJXNl5qszHUslixz
	3fqkihI/Xd7ielytOFbQl7/BmzhddshrM4WH519bbLXuQWD8eZju3ksCdxuitvg==
X-Gm-Gg: ASbGncuSpyDFGKalzF3z1LsYSQm6rsGERR6i/U3bgzSb0Jynt4D1e4ENFWMVSDIf9M0
	TmsHisBpwPutEC+VLLjoOwCeZUdj4T7r0HLNv3AieGIiYrPocelXcr9i011RMgz1Xh8osN8/gau
	hjExI4N6Gz5Ko0wkngWlbXR8fCNcFwgHzYC7EGOSs2JVdTePTcXI6Mmf0WU8J/9SOexvrYYzldM
	HEmu91jkQVOsBq+LZLAosP8k6VPhHGV+cMR7kFY5sRF8e95J+ab+kDmlussJJTN26xbgNNRm3yd
	IwYroMkDCPZGaM1gNn5XLsfTKll27U2iI+tkGK7zz2XUJYqLdG5v/BoeE/sZRGG6Mn95emEJliu
	QtUdnCfexDo7d64J1+4a412s0YJD4xRmGOE64RYc=
X-Received: by 2002:a05:600c:1d01:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-442f210d5a4mr23366875e9.16.1747210452807;
        Wed, 14 May 2025 01:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqDke89zQsVRLim8rNsTSqO36a3+NT5pzYq4bKYyrZq3OWcqcbuxUu87qOrxCidfiRPv5dkw==
X-Received: by 2002:a05:600c:1d01:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-442f210d5a4mr23366065e9.16.1747210451664;
        Wed, 14 May 2025 01:14:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f15:6200:d485:1bcd:d708:f5df? (p200300d82f156200d4851bcdd708f5df.dip0.t-ipconnect.de. [2003:d8:2f15:6200:d485:1bcd:d708:f5df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a5a2e0sm18579891f8f.101.2025.05.14.01.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:14:11 -0700 (PDT)
Message-ID: <a46874fc-d3bb-4cc7-871d-fd9791eb2e52@redhat.com>
Date: Wed, 14 May 2025 10:14:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1JGQyBQQVRDSF0gTUFJTlRBSU5FUlM6IGFkZCBt?=
 =?UTF-8?Q?m_ksm_section?=
To: xu.xin16@zte.com.cn, lorenzo.stoakes@oracle.com
Cc: akpm@linux-foundation.org, chengming.zhou@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn,
 jiang.xuexin@zte.com.cn, Liu.Jianjun3@zte.com.cn
References: <202505140950573489NhOV97K3BT0-xew40vNy@zte.com.cn>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202505140950573489NhOV97K3BT0-xew40vNy@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.05.25 03:50, xu.xin16@zte.com.cn wrote:
>>> I guess my point is, as a submitter you expect that people that are listed
>>> under R: that you are supposed to CC would actually ... review? :D
>>>
>>
>> Yeah of course, kinda makes sense right?
>>
>>> In that case, I would prefer to have actual reviewers there. If there are
>>> none, then there should be none listed.
>>>
>>> Of course, If Xu and Chengming do *want* to actively review KSM code
>>> changes, I would be more than happy to list them.
>>
>> Sure, so I think best thing is to ask:
>>
>> Xu, Chengming - do you WANT to be reviewers here? :) if not, happy to drop.
> 
> 
> Sure,  I am more than willing to take on the role of reviewer for the KSM module.
> I am pleasured to dedicating my time to reviewing new patches about KSM on the
> mailing list. Thank you for the invitation.

Thanks to both of you, happy to hear that!

-- 
Cheers,

David / dhildenb

