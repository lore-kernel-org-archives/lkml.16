Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF3C1E47AD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 20:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749070737; cv=none; b=P75w0y3wbXjyFsoEQDwCVSX7PlqciQcOVOxXB3PUkfWTli7WPBK2xNOhmR28bAE9dT4rlt7xoh48P12WL02bWe3yDh4FYFgKbCYBaNIRglxgaEl2WjUOzW0El4IVC97GYMepzaXXXRRFFpqxsofIR8Pf53CP8/EjzVk7FasjWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749070737; c=relaxed/simple;
	bh=zYGIV8gUJFeESoLXphcUN3VcBCSW38+M6xGL/Gy3T2E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IECteawGkACyM4+9UROl74un4geiOd0m7RhXF2iWecftqpcd0uVTWBz87MiVnd2cguEb0cu4dNA2ngon0pk9WBERSFt0GUfnjkPiyQhPYC/Tv8QVc6XLEiZ5kgO+BLCO4Tz/mjxOsxjqwqF3PMnhM4YUYOUgrrYG+gwmVxQ/tUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hKaS5he9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hKaS5he9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749070735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IjFlZ2/sUA2L86ngL9b3sMgbK1PseoDFjEohelsa5Jg=;
	b=hKaS5he9ZwmMwa2vzrC1tPtC5wBLDMACM7iumqhIFqYC/THZoykJwm0C0yUVZfx+9npUb/
	E64lOevoeo+fzzs81H491Db3mOCTG1OAAQr0LFwDwSe2QJMmy7qkbsfJV1DbG2kVofSOHr
	v797OkXmDXdXvmeD/F5GQdksGVrVLyY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-dEBF4cY6MPKv-sqDefHqNA-1; Wed, 04 Jun 2025 16:58:51 -0400
X-MC-Unique: dEBF4cY6MPKv-sqDefHqNA-1
X-Mimecast-MFC-AGG-ID: dEBF4cY6MPKv-sqDefHqNA_1749070730
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a503f28b09so139537f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749070730; x=1749675530;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjFlZ2/sUA2L86ngL9b3sMgbK1PseoDFjEohelsa5Jg=;
        b=d73LTGZF4nhpT0x9U5yEL7dGExoCzEqDsNvgJ9Mi8VoAkzk+291x1DPHJibVeu7fnU
         rhWnsHshJ8QQpyuF24jTbrbSKssy2YLGoN/RlG+adXYg7bkz7up/EvPRl/0G8fSohk9i
         OpHuDMa2c/mo5+88GVzxYA+6swUqVWaJUJMUnoTe+uf/n001qJcXzdqCRCMyTbQvFXSf
         sCBXikRM2CgoS3UKPlGPdS6XeANtoQ5L7j9Mp60H8minsUcEZftrtCexXaVYwbLb7jSk
         m2OlLbIbKbJWoqEfGsHWBC0LVKvyky7XF10sSecc/nDqES1KL3/DuHc1v3frAbdX3+XL
         gnkg==
X-Forwarded-Encrypted: i=1; AJvYcCWBeKQMHlg+F0aS9k92hN1JNdpfEvrk41dZPmztaaGWVHH8Z+dBb/B7It0kvyqsXXeZH+lEPPHA0pZUPPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPRE2GiGyJtJ6SXxoPaPHKke7CAXcNGdHhHst0tiuMjSiVk6w
	hn0xL80NGPEqXSj4heo5z60RMJJBdm7vWxJOQG4SYAAlA9OrYy4Gu7rJ7N+EvdrNyYPMeUU2YmH
	gPBhKBhrwizzcKWwqZ+HbGdAH1oi05JGmF4asT8MdKKvJnsduwrZrCxDZ4zB1sq3Eaw==
X-Gm-Gg: ASbGncshHoDxzOKLB9TpK1hm7hPReiuKpLmas1RHoU7RTNZ87F/zf5CT23wVNstFT6A
	2TT2sfFwRGGgZE9I2EsZuAAJ1fTxo9Bxb84PPy7kRCTS94aVOjkM/P+blTGS1C1oo8oZYFhIJh9
	j89BTPqXxEeqrlQKT98eorGG4SX7vjmmptuI9/OLfI0M7BgaifTN/iNyu1C5t8+zY/gZyXNmRoB
	Aj60ZKfmYCQUdJZvcW486IL8gu2lM2R6kc/cKQE2xxOQBJv1nK3X3KIZ2MRQDIg/azPaEwAYXOo
	ycRhpRK7TPafXdpng0ZYKvHvxtwGeHrYF+fyVORuT3hHFi992y2sJ1rB9U9I
X-Received: by 2002:a05:6000:2890:b0:3a4:e603:3d2 with SMTP id ffacd0b85a97d-3a526a84717mr847209f8f.0.1749070730442;
        Wed, 04 Jun 2025 13:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa+Gezp8iiTLoB/KqZ3gWK809er5J18zOcbOHxYhrjEk3yJTf+o6JBeAedMNn9aSfhfWFJMQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:e603:3d2 with SMTP id ffacd0b85a97d-3a526a84717mr847196f8f.0.1749070730088;
        Wed, 04 Jun 2025 13:58:50 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe754acsm23052362f8f.59.2025.06.04.13.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 13:58:49 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:58:48 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
    Colton Lewis <coltonlewis@google.com>, 
    Ricardo Koller <ricarkol@google.com>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/3] KVM: arm64: selftests: arch_timer_edge_cases
 fixes
In-Reply-To: <adf8b877-7ca2-f60b-fb59-578c70d0e3c0@huawei.com>
Message-ID: <9b9f7099-4e81-9b74-a1ac-37cd4965675b@redhat.com>
References: <20250527142434.25209-1-sebott@redhat.com> <adf8b877-7ca2-f60b-fb59-578c70d0e3c0@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Zenghui,

On Tue, 3 Jun 2025, Zenghui Yu wrote:
> On 2025/5/27 22:24, Sebastian Ott wrote:
>> Some small fixes for arch_timer_edge_cases that I stumbled upon
>> while debugging failures for this selftest on ampere-one.
>>
>> Changes since v1: modified patch 3 based on suggestions from Marc.
>>
>> I've done some tests with this on various machines - seems to be all
>> good, however on ampere-one I now hit this in 10% of the runs:
>> ==== Test Assertion Failure ====
>>   arm64/arch_timer_edge_cases.c:481: timer_get_cntct(timer) >= DEF_CNT + (timer_get_cntfrq() * (uint64_t)(delta_2_ms) / 1000)
>>   pid=166657 tid=166657 errno=4 - Interrupted system call
>>      1  0x0000000000404db3: test_run at arch_timer_edge_cases.c:933
>>      2  0x0000000000401f9f: main at arch_timer_edge_cases.c:1062
>>      3  0x0000ffffaedd625b: ?? ??:0
>>      4  0x0000ffffaedd633b: ?? ??:0
>>      5  0x00000000004020af: _start at ??:?
>>   timer_get_cntct(timer) >= DEF_CNT + msec_to_cycles(delta_2_ms)
>>
>> This is not new, it was just hidden behind the other failure. I'll
>> try to figure out what this is about (seems to be independent of
>> the wait time)..
>
> Not sure if you have figured it out. I can easily reproduce it on my box
> and I *guess* it is that we have some random XVAL values when we enable
> the timer..

Yes, I think so, too.

> test_reprogramming_timer()
> {
> 	local_irq_disable();
> 	reset_timer_state(timer, DEF_CNT);

My first attempt was to also initialize cval here

>
> 	/* Program the timer to DEF_CNT + delta_1_ms. */
> 	set_tval_irq(timer, msec_to_cycles(delta_1_ms), CTL_ENABLE);
>
> 	[...]
> }
>
> set_tval_irq()
> {
> 	timer_set_ctl(timer, ctl);
>
> 	// There is a window that we enable the timer with *random* XVAL
> 	// values and we may get the unexpected interrupt.. And it's
> 	// unlikely that KVM can be aware of TVAL's change (and
> 	// re-evaluate the interrupt's pending state) before hitting the
> 	// GUEST_ASSERT().
>
> 	timer_set_tval(timer, tval_cycles);

Yes, I stumbled over this as well. I've always assumed that this order is
becauase of this from the architecture "If CNTV_CTL_EL0.ENABLE is 0, the 
value returned is UNKNOWN." However re-reading that part today I realized
that this only concerns register reads.

Maybe somone on cc knows why it's in that order?

I'm currently testing this with the above swapped and it's looking good,
so far.

> }
>
> I'm not familiar with the test so I'm not 100% sure that this is the
> root cause. But I hope this helps with your analysis ;-) .

It did, thanks!

Sebastian

