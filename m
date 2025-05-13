Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5461F1A072C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747163123; cv=none; b=Gl3JD0E3ZeIo0gO4rT7eNgtiZbmXn/xtvlecvtqaqC+HpoXeNiuqvRLhDpeSQH+hOHuLG/TTtnUV6XKr/mvzzvKTtAwyOuMGpsnbwCTFOEPtjUpzTjoL2GzbMv98gtX0Yxp8XbLF6Dy9uXchbR64bpRYIE5/EsKOmsx/pOipn/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747163123; c=relaxed/simple;
	bh=5TO1FbNF/CnyzvviPzgv2AZWl9qYvjV9IVRnDIc0eck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VzuRUqXqfzDMYvLyyVWXGNEoVVR3nGwupih+orajfwbw7fu9COHGnTi/qaAUXLOsw3uvg+G7Hyd8bBoepGXl5dAiS+UvELQ4e6496foQAyTi+rjWJUPzocFIBQZ5a3ibW5WhUzh6sKRfYovP4v73RFpMa0s48BYZeCwkcwTWjrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PTf7BMHQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PTf7BMHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747163120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F7oMpWwlD/lrnuy1Dhx/KSfZ4OIBENoAs0l1lyYlS6s=;
	b=PTf7BMHQvF+j3D8umn70fOfJIEgKRmiSNFQiVLXIJDuv99MWIcPWbeZ69IdAxBdPprCqzi
	FpC6pivGhNkRFkzN2MzdlnRxCxs+DL35JkAEJbr3A592y5xK6dwzZ/Ykz1pD0JjTvbMDez
	aK9CQ2Mhg7FPogJrFyzrDCyhONKjHtw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-v5l6Dv7iOKGnONrVA5Re2A-1; Tue, 13 May 2025 15:05:18 -0400
X-MC-Unique: v5l6Dv7iOKGnONrVA5Re2A-1
X-Mimecast-MFC-AGG-ID: v5l6Dv7iOKGnONrVA5Re2A_1747163118
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0b9bbfb0fso3293635f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163118; x=1747767918;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F7oMpWwlD/lrnuy1Dhx/KSfZ4OIBENoAs0l1lyYlS6s=;
        b=wDW0jNjwjWtOz+R9GfhMLAFxnK6eWFcu7kL5mixrl46RqGw+a8pIbbZIhyQLQrdM8Z
         esqI0gR1nmJhl/89eIr1Pqf+2YXmXUBdFUXbuM8J1GTxFPUZ0R50mceTGt7TBkuuvujJ
         V5z1+a4t/UkFiHoS8F5Yab45RFFEHKS8oXWjzXzXO6xNCdKK5gEoqcR7+gRr5foXOLLS
         JZVPxitsdYqX4iyn6+KSoyqCHfM4VItE0s+MByaTHpF0Z0kDrmOILGy9wj3rg/RgHNPV
         FIOJL+Pz+jwQcEINXJU6lNzGx0M/5ufaIYDRILGvPSee7l6HRnKKhcjCc78/FrCGoNFc
         Lo5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxMZtcykbHs85bFRNI9HalxeT7T4jC1qmWbweocuNwk8h0B64D/Bkchc4pSssXTSlS4OeeMOqpXeUHGvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHkbVCpaaJqeuzSQIOTXMGiJRRFcNCFjih/QTtNmQJOiIAYp51
	TlTYO3hAuBe9XEQ70TzAWFokMTo7iyRG92fw84RAEIjehYZ719MiYXwrMO+7wwpk6nTUOE/Nyfa
	IuN7KyDjx3smwtNQXBv2zTf2A3FUo718exxNYCfPGz59ILQDFh9JH970LAJw8/Q==
X-Gm-Gg: ASbGncvvCx6DIjwv6bPSg7WPhejfh1xWE4jKQlD16ZZX4T1zuMidxYx29Cd0zR/P7a1
	U9gLE/cRHYjlowtP9j/v/2myyxb/ZGY17RbO0StiFDp8qCPDRCxfFefDW0Y/a2t3iyzjAgPji2e
	opqm2r1Wy5hFqCPYHaCh+1tjLh6/RI2avyMPWDh3CiaUPBN2yCQrEl1vh3H3mMdSmtYpuBIqBSL
	fhqxcbVQozFgC6UxOjBMgynG+Hc7jMSGk/KurPKF+guR52BpPMY6unWf8gUAEjJfbArilQYnuM+
	5G32TF3oc9mFLKrqYYvYm+cC0G5fqQoUHoSM2oeEAPrT5wXsKDCQoe/bBpLFLWFXdXYESWB+o/+
	ugTJS7aqzwW7Hz3/IB4gluHHrLZIqsRUPwDU2Kp0=
X-Received: by 2002:a05:6000:430d:b0:3a3:40d2:8499 with SMTP id ffacd0b85a97d-3a3499516dbmr324830f8f.58.1747163117727;
        Tue, 13 May 2025 12:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/K+txzNv75joF0r9wiBizDw4eq1VJimg4Zr8/FRArXffJvh0MdXPZ/0GYQ97A0SZK5g9j3A==
X-Received: by 2002:a05:6000:430d:b0:3a3:40d2:8499 with SMTP id ffacd0b85a97d-3a3499516dbmr324814f8f.58.1747163117335;
        Tue, 13 May 2025 12:05:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34? (p200300d82f4d1a004fdf53e21a36ba34.dip0.t-ipconnect.de. [2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de087sm17434814f8f.16.2025.05.13.12.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 12:05:16 -0700 (PDT)
Message-ID: <ae22b0df-f4ab-4567-b3b4-35c1c6b5233a@redhat.com>
Date: Tue, 13 May 2025 21:05:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add mm ksm section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, xu xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250513161758.136402-1-lorenzo.stoakes@oracle.com>
 <dd10e199-e5de-4c4c-a524-68091973de7d@redhat.com>
 <783a848c-f9f0-4f2c-8d6f-46d2765d80f7@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <783a848c-f9f0-4f2c-8d6f-46d2765d80f7@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.05.25 20:17, Lorenzo Stoakes wrote:
> On Tue, May 13, 2025 at 06:52:27PM +0200, David Hildenbrand wrote:
>> On 13.05.25 18:17, Lorenzo Stoakes wrote:
>>> As part of the ongoing efforts to sub-divide memory management
>>> maintainership and reviewership, establish a section for Kernel Samepage
>>> Merging (KSM) and add appropriate maintainers and reviewers.
>>>
>>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> ---
>>>
>>> REVIEWERS NOTES:
>>>
>>> I took a look through git blame, past commits, etc. and came up with what
>>> seems to be a reasonable list of people here, if you don't feel you ought
>>> to be here, or if you feel anybody is missing (including yourself!) let me
>>> know :)
>>>
>>> David has kindly already agreed to be co-maintainer for this section.
>>>
>>>    MAINTAINERS | 15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 80aa09f2e735..5ea2020acf84 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -15567,6 +15567,21 @@ W:	http://www.linux-mm.org
>>>    T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>>>    F:	mm/gup.c
>>>
>>> +MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>>> +M:	Andrew Morton <akpm@linux-foundation.org>
>>> +M:	David Hildenbrand <david@redhat.com>
>>> +R:	xu xin <xu.xin16@zte.com.cn>
>>> +R:	Chengming Zhou <chengming.zhou@linux.dev>
>>
>> I don't see a single RB from Chengming Zhou, and a single one from xu xin
>> ... :)
> 
> Yeah sorry this is fuzzy but git blame mm/ksm.c for 2025 gives you _very little_
> activity in general, a series fro Xu and a series from yourself :) Xu's series
> was... acked by you :P

Yes, 2025 so far had little activity (fortunately).

> 
> Equally with Chengming based on other files listed here, I went and checked to
> see if there were substantive series as a sort of 'fuzzy matcher' which might
> imply a review interest here, and see there did seem to be some.
> 
> But obviously if anybody feels any entry here is inappropriate, or on the other
> hand anybody was missed off, more than happy to rectify on the un-RFC!

I guess my point is, as a submitter you expect that people that are 
listed under R: that you are supposed to CC would actually ... review? :D

In that case, I would prefer to have actual reviewers there. If there 
are none, then there should be none listed.

Of course, If Xu and Chengming do *want* to actively review KSM code 
changes, I would be more than happy to list them.

-- 
Cheers,

David / dhildenb

