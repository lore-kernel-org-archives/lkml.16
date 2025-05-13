Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB86298989
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143876; cv=none; b=hH1z7JCY25YlD/MfJ0XF2l1kDjyYLb/C8nUBpu3+SGAbu2SfCROX+SpQ617YqM6as8ra40wyqF+tO4aiaIVrvoJeNARdnDUg0hIpYl0iI9zIiZOgflJazd6B1htDPPODaxCOU81/AjQQq3YWKhA6H/tkhhiV2J2fdsOCxV3UKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143876; c=relaxed/simple;
	bh=e4eJ1305I+EgHcEaP7lZEmnVbMFKKOUHcQqiW/2DwFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTKdRq56Aa+1g+u8OS1kZb1h/XBOZPOuq2CZ+f75LLnrhfSYKKZJqNaN8iQHdEXrDG+0iqZ3w57lSzmSlr5tieocZRAdH8kMgwlX8LjDKUzc1inWYv1u8H8K2aF5o+k5oMSZLQh5Dkgfn5I1Ps+WotW7zEGPtwsOvyQ2Z3vDsXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZPUf4DXB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZPUf4DXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747143873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jguUTZh5JvRuhjXFBXsB5gTRN4crP6ONtuEb+MxDCd0=;
	b=ZPUf4DXBVOWcr2iIAKf3IPRQUtoRfceIt4lULHS1OQZUip4YIoaz5UArdIUCOIY8BH5DVE
	Q3Q1o4lSr7vdqFu+XDZWBCylFjzFZdr4yZAi+ORBwDUdifQu875LZ8TGptgN7ZV8LT7C6e
	kHdCEg/cEqhQSCEouF9L1csxo2+2NE4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-4IGdiuqbOl6A513Si4ykPg-1; Tue, 13 May 2025 09:44:32 -0400
X-MC-Unique: 4IGdiuqbOl6A513Si4ykPg-1
X-Mimecast-MFC-AGG-ID: 4IGdiuqbOl6A513Si4ykPg_1747143871
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a1f6c5f54cso1636867f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143871; x=1747748671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jguUTZh5JvRuhjXFBXsB5gTRN4crP6ONtuEb+MxDCd0=;
        b=IetqE+Jeb8J/aavcneftFPmhTKK9Ly2GlY/OLPks7fIHRyaebpwzsWnWolJ+v23+2w
         GeWbdyZfKKMYV2x6nGjtj5K/yrcEKfByL1ZLQVrB63V1vu7ipcIaoXgEbcHlcTWipK0X
         aCBzxKKcyTzBs6TTcG6FVKUfkwL4GgcKpHHywf9vJcxUi5k+FaS5IlanyW3Rk+CSNRFO
         vWSA1Y4ZupBLgKfHnrl1U5rPVxpifcfh4LXU6obYVkuQm6oco9s3Z8uePN8xjbstB0XV
         Nkm0fExh7gawLnE79KaJdksBsGyKYa5L7GwL65gLD45qvzeeYzo6xZmSogYjx+/gfvC7
         6w7A==
X-Forwarded-Encrypted: i=1; AJvYcCWqmJFGyxe4Gop8kYGy6fRdNwuHnoI5Y0ya8eUToZ0badReiPnNwibYaAneM0rKY6wgfXe25sHJamR+tTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOubkqNKgksrwqksOgkGzs1v174ByIpMqyfbcBJvbfXwt4IZOk
	/o6G7ctINc+Kk0QE7lTZGfH2pEYTLNoZGw/F8gKv7x698U2XI4okDx/cu1OfXqFE3IGDhekTUWy
	b1n11q2ZbmASjWsBmzybtMue/JeUC4yEp6AL7sy8GtCARhe50xNeyt0KdW/vmXd6giVpqsA==
X-Gm-Gg: ASbGncsIkdcv8ne4mK3qi1e2XUoql5CwNX6Q2BV5vjBC/UMS2rwrXf5kdB4IxanHBOM
	3kAeFTNwv9iuPYlXSwVtR+TlWHNGwZ+SxDRyCdOKBM1q3fcUyhxppIbDxwzTlmw+Ho57eJobYSQ
	ZLA4R7UWubq0D4Oe8gIBuJV0kq7FP+LAZlsEn39tYlucxZMHVrDco9Lc4Fe4akkV19Lj7p2rLQr
	oA7QGT56OjGOeb/ObciIGek0x8pgSMN5YeiOWf1whuo5Rv28odMeHI7BNKwBC9y10hn7R94cw3D
	TBMefZAdWvopykk=
X-Received: by 2002:a05:6000:1a87:b0:3a2:6b2:e558 with SMTP id ffacd0b85a97d-3a206b2e7cbmr6897540f8f.28.1747143870786;
        Tue, 13 May 2025 06:44:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJPvRc2d/tScX3zj2Zy4dIA1+zH01wyvfnGBVZQ5VJgZ3BSnWeMNjMYPwqRM4uUjlqx7Agqg==
X-Received: by 2002:a05:6000:1a87:b0:3a2:6b2:e558 with SMTP id ffacd0b85a97d-3a206b2e7cbmr6897501f8f.28.1747143870216;
        Tue, 13 May 2025 06:44:30 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.148.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ee95asm16433764f8f.11.2025.05.13.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:44:29 -0700 (PDT)
Date: Tue, 13 May 2025 15:44:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Konstantin Shkolnyy <kshk@linux.ibm.com>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mjrosato@linux.ibm.com
Subject: Re: [PATCH net v2] vsock/test: Fix occasional failure in SIOCOUTQ
 tests
Message-ID: <2lh2s2nnhiyqjlwl3xgkh3ujjipaggi3isjgrhgi27s62exh7m@bwyn34knronr>
References: <20250507151456.2577061-1-kshk@linux.ibm.com>
 <2d2a92d2-1844-49de-a869-4caf2677b099@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2d2a92d2-1844-49de-a869-4caf2677b099@redhat.com>

On Tue, May 13, 2025 at 10:46:35AM +0200, Paolo Abeni wrote:
>On 5/7/25 5:14 PM, Konstantin Shkolnyy wrote:
>> These tests:
>>     "SOCK_STREAM ioctl(SIOCOUTQ) 0 unsent bytes"
>>     "SOCK_SEQPACKET ioctl(SIOCOUTQ) 0 unsent bytes"
>> output: "Unexpected 'SIOCOUTQ' value, expected 0, got 64 (CLIENT)".
>>
>> They test that the SIOCOUTQ ioctl reports 0 unsent bytes after the data
>> have been received by the other side. However, sometimes there is a delay
>> in updating this "unsent bytes" counter, and the test fails even though
>> the counter properly goes to 0 several milliseconds later.
>>
>> The delay occurs in the kernel because the used buffer notification
>> callback virtio_vsock_tx_done(), called upon receipt of the data by the
>> other side, doesn't update the counter itself. It delegates that to
>> a kernel thread (via vsock->tx_work). Sometimes that thread is delayed
>> more than the test expects.
>>
>> Change the test to poll SIOCOUTQ until it returns 0 or a timeout occurs.
>>
>> Signed-off-by: Konstantin Shkolnyy <kshk@linux.ibm.com>
>
>Could you please provide a suitable fixes tag?
>
>No need to repost, just reply here.

I always get confused whether to use Fixes tags for tests, but I saw 
this patch target `net`, so it makes sense. BTW IMHO it can go 
eventually through net-next, which is the target tree I usually use for 
new tests but also test fixes.

In any case, the tag should be this one:

Fixes: 18ee44ce97c1 ("test/vsock: add ioctl unsent bytes test")

Thanks,
Stefano

