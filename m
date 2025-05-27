Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CAE18A6AE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344010; cv=none; b=fcir3E7/bwA4wIeujh4aIluUUxGyCLawqeNOihGLJWL6hBtlsyymI1YYyXFZMOloJaazg/oVjuQSNJvrm7wdNeWRG6Td8UV94hwqtWbkmko7dcZAGIXnjb0d+jtbKzdnF23eqBcvdQOEp36RrN3BAaWfzxbRd9KSifVMj9TGQh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344010; c=relaxed/simple;
	bh=arc/Sur3Dxf/SCX7bfzarGNzPFlQCFbCXknQicuTgog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0X2JuKOnPdVsrTRI+8Q9UYXb/JOAuhv7NX9qoAqMorEEPxybO20BB8mqM/XDU/DcFme2z4FFhPIofTpg3iFjz1P1V0jTcoPdRsIpXnP2LrLVByCkjPZYab1QgAkj6e8hyUePnmZOp8+v023wIYLnPolyckATNxpvSrrGcaS5pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=guVCIylj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="guVCIylj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748344007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sulfAOh0bnTIvH614+QkjzD08FiYe9TfUeautv0hWDU=;
	b=guVCIyljUnXv1g9b2g4PIc/5Qv0buiWK+gnlV39urxwZnOUT9ebhqGo5WCf2foVLdinJfr
	ztW3c19gxmFV0biijiXcv313KJ2uWR5/dnadwtYscS31D7ck5SWOrIkWUty9LfL1BpcZ0L
	KKplEq/K06JnnmnKzpgMyXQaGXc8gyU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-ik2JGpWGMYKiSbdG4lVlfg-1; Tue, 27 May 2025 07:06:45 -0400
X-MC-Unique: ik2JGpWGMYKiSbdG4lVlfg-1
X-Mimecast-MFC-AGG-ID: ik2JGpWGMYKiSbdG4lVlfg_1748344004
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-44a3b5996d2so15189825e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748344004; x=1748948804;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sulfAOh0bnTIvH614+QkjzD08FiYe9TfUeautv0hWDU=;
        b=nAqNtzNsnlAEOa/OdDC1O3goBSLC7JREew6zbPKAEdNh7oooFpbhBftW9JLBV1pZoF
         KykibjCxC7AbbHXqk+eZIwHqDs4tytM/uEU10syp3x+6+J6RTlfugWUjWkstCOUAlnQX
         TbQS8w87vNrpHbg2zNxdH13eay0bcwApUdntT5EfSKWyOwfmKHW7W3mI+kVPVm0ixXSZ
         2uzYuK4wLboPB5ApAO3xXwMrG2N4urwcQIYNpJeegi7Ohv4WA978/mJ6Vk9bzRkgtR12
         X+Cwkct04dV0ncyjtwxMTI0UNjsJtY1HX+hZ6MQMJm2hVTNRFdMV+qtIeMkHKW5/a3Ne
         fsvg==
X-Forwarded-Encrypted: i=1; AJvYcCXcUaTHEC4qVJFmnyfqlZMJEjyWcxchu94ePAQ1MpnPWKOgY+a8S2TCVq0bYkqih2GYtdV9LHiTDL7oZQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIHDzP41gF3oHm+/vr3EssKDNtZOXnWmz3vTFS4GoTxPGqSi/K
	+oNhLLWiBOl651B5YTyqHg3+SsjnsNpVBboJgirPnCNAFV+G78zRz7KuPG74qsCuiZWo7rTO1F1
	3ftV7kdZLuvX1XzRhU3++iHtaKWFaOeHJXutc3bAhv9wxN6cEV85v8Oug5HetyLnRRg==
X-Gm-Gg: ASbGncvLAmzFcrtLOTDNoKr5gzKMYU2u7JddxJHFMaoEU58OCVwrIqpERVvq9mGtUZT
	fAg+CU9K4o1c4qyE6682v3GJEQMJOqrhChso96mR7UFQw4PAg1Ez7gxYCHAw1VeiAOVpsvWdyvW
	GcfU/Olz9pYohHT8vAr904ljZ9tr3FvWmeS/UvlTTH9yJBQTrcKU8co53avepfoV2f7p273KdVD
	4ph4PTUONQeQNK8gYbAKjniqUZ7N6kFiIUPVQl14mxM0pgU0aEucRV8jO3KOm8gDKjx9BzxwjD9
	yLMcLb0/8KEUisIRrctgYUoMQxDERTfYvWTt2Zu4quNe
X-Received: by 2002:a05:600c:6550:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-44cf6d81765mr79014425e9.27.1748344004447;
        Tue, 27 May 2025 04:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbm0J5ZLvf0PzR50HxzLWAsQEs102P3Yg2tmficxvKf+HeXmgF2N8HWUYfJRuOhVoRm+M3UQ==
X-Received: by 2002:a05:600c:6550:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-44cf6d81765mr79014185e9.27.1748344004054;
        Tue, 27 May 2025 04:06:44 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcced3cb5sm20457195e9.1.2025.05.27.04.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:06:43 -0700 (PDT)
Message-ID: <42ce8dcc-0139-4dd7-9bef-bf3efa93849a@redhat.com>
Date: Tue, 27 May 2025 13:06:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]userfaultfd_move fails to move a folio when swap-in occurs
 concurrently with swap-out
To: Barry Song <21cnbao@gmail.com>
Cc: aarcange@redhat.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 peterx@redhat.com, ryncsn@gmail.com, surenb@google.com
References: <CAGsJ_4zOhNBe9b1m1LYaJbFur3TdLma+2EXbc=BhAToDeLfvAg@mail.gmail.com>
 <20250527083722.27309-1-21cnbao@gmail.com>
 <bcc5cbb6-4ce6-4c01-8b5b-f6e01b306b2d@redhat.com>
 <CAGsJ_4xQ4-bszHNi=0QDCqsap+0WdfU9_u8ftaMuKCuNcn8RYA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4xQ4-bszHNi=0QDCqsap+0WdfU9_u8ftaMuKCuNcn8RYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>>
>>          EBUSY
>>                 The pages in the source virtual memory range are either
>>                 pinned or not exclusive to the process. The kernel might
>>                 only perform lightweight checks for detecting whether the
>>                 pages are exclusive. To make the operation more likely to
>>                 succeed, KSM should be disabled, fork() should be avoided
>>                 or MADV_DONTFORK should be configured for the source
>>                virtual memory area before fork().
>>
>> Note the "lightweight" and "more likely to succeed".
>>
> 
> Initially, my point was that an exclusive folio (single-process case)
> should be movable.

Yeah, I would wish that we wouldn't need that PAE hack in the swapin code.

I was asking myself if we could just ... wait for writeback to end in 
that case?

I mean, if we would have to swap in the folio we would also have to wait 
for disk I/O ... so here we would also have to wait for disk I/O.

We could either wait for writeback before mapping the folio, or set the 
PAE bit and map the page R/O, to then wait for writeback during write 
faults.

The latter has the downside that we have to handle it with more 
complexity during write faults (check if page is under writeback, then 
check if we require this sync I/O during write faults even though PAE is 
set ...).

> Now I understand this isn’t a bug, but rather a compromise made due
> to implementation constraints.

That is a good summary!

> Perhaps the remaining value of this report is that it helped better
> understand scenarios beyond fork where a move might also fail.
> 
> I truly appreciate your time and your clear analysis.

YW :)

-- 
Cheers,

David / dhildenb

