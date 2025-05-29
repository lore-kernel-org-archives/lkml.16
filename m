Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BB721C9F8
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518562; cv=none; b=KEBOnHvYW2phhDYWkzMfm8vDYDepMUQxEA7g/P8uAWLTG+aC1ScuxkAX2OSBLPdPyYNdlV34Kl+gHESytEoxsR0HGMurEK16ZD5J+fSDOboXirlnb2WqOy5z+uMWOKSeSwLF0UcJZIPzeckJx8ijVEjwd3Ib6/eEGNcUECeqmnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518562; c=relaxed/simple;
	bh=oVudUYe3FOIi84jTCtMJ8uBulEo+m2KLVU/niW5iNI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEUpo8B0ZJA1e1qp2E6DiAhGAmi1BNGiZ6aVzTZneANlhYwWhqH/ANZDlnW7gBc7HzVC+ZLEbAScG5LvqJ00f53pPQf+4SPZ42O8PxsZjR4P7dnrbN/p8Q4eIo6XUJYYedZgWoroptGf5lhTq7psJvRupOWKxZREoQI81O900ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gThgG1//; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gThgG1//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748518559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uzu05Mxo+1QpUt+8vUm9Wkc8fJoW6BnlrR/DigvGQdU=;
	b=gThgG1//TMGfbAXLhyAvt0nVn1GeLdXbc0Dkx8zN5NNjGHKtbDyeDSAGvwpQeqIwT0mtt8
	cLmJa8Jnvoq4LBpBuhr3n8KYtRYqecORCH7a8F7E93FfLWXXw4wVzUehjPL+qNq72c0rC8
	jK8eet3JTvvo/nF0aayuyUVIK/kUlVA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-_55LL1DRPu65Tm9K7BTrZg-1; Thu, 29 May 2025 07:35:58 -0400
X-MC-Unique: _55LL1DRPu65Tm9K7BTrZg-1
X-Mimecast-MFC-AGG-ID: _55LL1DRPu65Tm9K7BTrZg_1748518557
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso5105525e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518557; x=1749123357;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzu05Mxo+1QpUt+8vUm9Wkc8fJoW6BnlrR/DigvGQdU=;
        b=vsT+eFx7aT/TdXT9oeq/pyUvl485HP5ruxFmN4Xud6aPTW9ei8l2FFOAZoCd3sRHwg
         g6D6YlQrzY5+7tg0bGYRi14b6LtvxR83GamOQZ7oL9CmD+n7sdLFWohorF/L+0ITrydH
         3ccmo3olf0K+2A1wQGoECOLz3n5uIeIhiZGGqVwFue7OLfpHuv2namlGUjUmyVhJLYWM
         SYDxFXglM+bV9/JL1L6yG12zdjqp2oWwAUmp1BvMMLQ+riWstU6Ckoy6SKWhrJTrF/Dx
         L4+Qxv/vgTBqYYzOs3W05cxhpvEXO96UFIjtpoVDS6626nDIq7GycsCfQnKxCPsVWAxN
         nAYw==
X-Forwarded-Encrypted: i=1; AJvYcCU95GM26ExA24WhEOdqc3muJiIE4JISNj2ahC1mt3oqBKVC1FaccSE9sf3xOA0cmZhIMp3l08Q8LkGLKjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlhUshwpbpCUAyH0sq6Q2D8Ze8VpZXr+0XTR08ZTAsRb1I0FQ
	nxvLHMRHfCRsUxBB4YOLR/QZFJUqC7EIf9Tr9gR7ANa946ua2JA4juKsYCJpIjwW1Lsjq6SexMc
	bDA56T4vw4vA2PDU+BKMxx1ActkpijYRz5JScFGZC8q8fF4f/7v+mxGIK69+oobBbPw==
X-Gm-Gg: ASbGnctSHsAH4M7uY0JDMlEJzZ0AWYiP33DgMUk1GBH/5M2dGAUUaEzuoWPIvFIeUtN
	oRw85FRXV5XbCKjY+0/JqvMrFBmCBQHuTL7QEkk5DVOtyixq6lXwWI3xW/n8DShCswxx0WEc1gy
	bMWyoCzFw2GQK/DPuTv3ADhxDvyJwIqvm9z4ngaxM4jN0ApnoytWYix32ehkgD7THE3DABumFNN
	spyHoyjMBuzUjX6udwVJV/JhZgApvvyJwzMXaVeNS9lT7t9ssyYSHETEJmFi0YJ8J/MtJPM6EZc
	58y341Abqk8aq2P5OKb6vPHiV5Xa1xic6jf10zEqjGjlvqcYV6E=
X-Received: by 2002:a05:600c:9a3:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-450ce897d17mr21074325e9.16.1748518556764;
        Thu, 29 May 2025 04:35:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1saTfp2/vBKshNA0ijt79U3HmcD2AFa5Dm2K5wO45KCx7WyAIct8E3zr0cRi1rjgelfWX9w==
X-Received: by 2002:a05:600c:9a3:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-450ce897d17mr21074125e9.16.1748518556347;
        Thu, 29 May 2025 04:35:56 -0700 (PDT)
Received: from [192.168.0.227] (ip-89-103-124-216.bb.vodafone.cz. [89.103.124.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc6795asm17375455e9.30.2025.05.29.04.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 04:35:55 -0700 (PDT)
Message-ID: <c97284b4-cac8-4dcc-991b-d535694f31c5@redhat.com>
Date: Thu, 29 May 2025 13:35:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bpf: Specify access type of bpf_sysctl_get_name args
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, linux-kernel@vger.kernel.org,
 Yonghong Song <yonghong.song@linux.dev>
References: <20250527165412.533335-1-jmarchan@redhat.com>
 <m2ecw97mxn.fsf@gmail.com> <2b5f6cd0-2b5f-4687-ad43-73a7be8fbfd0@redhat.com>
 <m24ix43cxd.fsf@gmail.com>
From: Jerome Marchand <jmarchan@redhat.com>
Content-Language: en-US
In-Reply-To: <m24ix43cxd.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2025 18:41, Eduard Zingerman wrote:
> Jerome Marchand <jmarchan@redhat.com> writes:
> 
> [...]
> 
>>> Looks like we don't run bpf_sysctl_get_name tests on the CI.
>>> CI executes the following binaries:
>>> - test_progs{,-no_alu32,-cpuv4}
>>> - test_verifier
>>> - test_maps
>>> test_progs is what is actively developed.
>>> I agree with the reasoning behind this patch, however, could you
>>> please
>>> add a selftest demonstrating unsafe behaviour?
>>
>> Do you mean to write a selftest that demonstrate the current unsafe
>> behavior of the bpf_sysctl_get_name helper? I could write something
>> similar as the failing test_sysctl cases.
> 
> Yes, something like that, taking an unsafe action based on content of
> the buffer after the helper call.

Alright, I'll do that.

> 
>> I'm thinking that a more general test that would check that helpers
>> don't access memory in a different way than advertised in their
>> prototype would be more useful. But that's quite a different endeavor.
> 
> That would be interesting, I think.
> Depends on how much time you need to write such a test.

I might think about it, but ATM, I just don't have time to do that. If 
someone is interested in implementing it, be my guest.

> 
> [...]
> 

