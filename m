Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0E0433B3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749071844; cv=none; b=vBocmknqRCfZkV+ryuhhzTSaxU3iGPro9tzccO4IwvG17KjJavoHgmAB3M0O2vbGbL1sBbFJ8ckb3Hk84rostC1zbUBhqyjY693qP/q6kGy6aombCaG5y3iObrXZ4mJxy1mir5lOtztL/Z3zx+rRLJTWkyS02koRXvmLULzhhCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749071844; c=relaxed/simple;
	bh=CXCvGL5hSf5ngZ4A2BceMmShZkAeoCIwyR3G4t932uk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JLnwpwmNeIkFcokzc7o8SVky1nQzdnnZwkCEEHjtG1ScbBayV6iH5hN5nsKdzZAi+efMhQh4nEaJ0q+B0qjph19lOsSm9bIZ7W96tKDkd7tyS/kRq0XRmZBnI7Ch+zLNk/vrgZ1RvvOqh14JXz3D+ippErrGITfSFyuzPS+7578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=THqChL2T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="THqChL2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749071841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3eaIlD6SgIwBKzFRuDf45UmSCQNYGCKtzx7DOTC83A8=;
	b=THqChL2ThGEpA70BM0FfBVlZLdnIyz+tRD3UJxT1Ifr7QiQLQEYogc8bGJZov92e8Kb9xx
	K2YGTOLFzI5facoMqgO2xKdpP1vqyPiYkPhZkFNCDvZwLsCdQFT7yVlHAbK+OEbnmD5YYE
	4e1Ap/JSnWJt/+ovhZsyY9Q6FkaIxps=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-YnxkDavSO_-_TLlHsXZPKA-1; Wed, 04 Jun 2025 17:17:18 -0400
X-MC-Unique: YnxkDavSO_-_TLlHsXZPKA-1
X-Mimecast-MFC-AGG-ID: YnxkDavSO_-_TLlHsXZPKA_1749071837
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a1f6c5f4f2so160039f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 14:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749071837; x=1749676637;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eaIlD6SgIwBKzFRuDf45UmSCQNYGCKtzx7DOTC83A8=;
        b=k8HtEw0bU067qv5gRG16DKnBvk5HkFhxBgjAjUQUyZWuEYBrkenzevFrDtTBML8med
         mHAxEW/yrTuZho3qq5RaK4lVLuqH1Cco0WSJCHWhhCKxcLRFZunMdE4si9rLCxQ9vp/1
         pkUiZwdf4vgslM/UY0pePpcELYIfwHVpfr9Drqzs3HBLgFj9gkwEdH6VXRWisMy4d6qV
         YCtmjBiPNLwRAiN2SsmnH8EcVuadfxiKHh3lPDcH/aOLxcxihNFxdSrxtuvnw2yw48Ue
         SAFPBJSc8Pw778AY2zuK4mRc+PhRxPinYVwIY+FUuWPyyhVwmWbCP7QJSLgCv9oSJlmx
         3mhg==
X-Forwarded-Encrypted: i=1; AJvYcCV8N7gSszoc8we8bQYMKouVME4o9aZeS6GmZzswlbayvNJJ3kHxx9aGBadiQXOYn7ByaYyDH0tA4gHSZI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vLd+8SzcdQRRVPf6gPx89kY7EBWb3wufPwtvbyEGGypcY8ZD
	Jx9KAUMZRJ1Eg4YyEcLFd3hKEnYjzeXVacWi+4exp0yn+Q5gJ1ur6AxEhEBYvEA5bfQTMHxPA+D
	BaHllx9lsPmQK/u5nIQ9wtRcxcFY98IgFAE4HRpQpKmGMQ8xIPhMeHSsQPf+YlG33zQ==
X-Gm-Gg: ASbGncva/JL228+p00IISnSUPRBkM9YCfyunj9iVwso/hOyoE8T+UJGeuEcoKuS+bSb
	CXQueG/ozu6as3kg79G8tAoOwZHlHlRByiDkjcGHxWfuIAa7F7JZ0Vv9kHiORQH0woNV00EjzJ1
	1AdqKO6bGB9ej0D4cO94tlKklR2LEO6hTJpZ3DceiYaSXYkJLmMYYhCDsm9DZ0Sfd7t0/lfna1W
	S2hpKKOpTwjq3TsyK80NIEW/poV+D3EUwMnACdH4xwj6+3ep7vO6n0fsN6uQZFkWxREPVywaBKk
	AzQy+yROT87HAmy12rP3sgrsPGPtVAH3g37Dx/3nJcMypnvDbS8YzibD0guvqzCf3DkxT9g=
X-Received: by 2002:a05:6000:2512:b0:3a4:d274:1d9b with SMTP id ffacd0b85a97d-3a51d92f84amr3541716f8f.25.1749071837469;
        Wed, 04 Jun 2025 14:17:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/w3mTJC6PzaXkAlaJcofTyt+hL5Id0Z9sQ5spOyW0fO3Rb3p4l0Y62I6sWoWE4eFRofNvzg==
X-Received: by 2002:a05:6000:2512:b0:3a4:d274:1d9b with SMTP id ffacd0b85a97d-3a51d92f84amr3541694f8f.25.1749071836994;
        Wed, 04 Jun 2025 14:17:16 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c842sm22506811f8f.29.2025.06.04.14.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 14:17:16 -0700 (PDT)
Date: Wed, 4 Jun 2025 23:17:15 +0200 (CEST)
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
In-Reply-To: <9b9f7099-4e81-9b74-a1ac-37cd4965675b@redhat.com>
Message-ID: <77f07e94-82a2-5dc4-2483-e2ecff151e66@redhat.com>
References: <20250527142434.25209-1-sebott@redhat.com> <adf8b877-7ca2-f60b-fb59-578c70d0e3c0@huawei.com> <9b9f7099-4e81-9b74-a1ac-37cd4965675b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Wed, 4 Jun 2025, Sebastian Ott wrote:
> On Tue, 3 Jun 2025, Zenghui Yu wrote:
>>  On 2025/5/27 22:24, Sebastian Ott wrote:
>>>  Some small fixes for arch_timer_edge_cases that I stumbled upon
>>>  while debugging failures for this selftest on ampere-one.
>>>
>>>  Changes since v1: modified patch 3 based on suggestions from Marc.
>>>
>>>  I've done some tests with this on various machines - seems to be all
>>>  good, however on ampere-one I now hit this in 10% of the runs:
>>>  ==== Test Assertion Failure ====
>>>    arm64/arch_timer_edge_cases.c:481: timer_get_cntct(timer) >= DEF_CNT +
>>>    (timer_get_cntfrq() * (uint64_t)(delta_2_ms) / 1000)
>>>    pid=166657 tid=166657 errno=4 - Interrupted system call
>>>       1  0x0000000000404db3: test_run at arch_timer_edge_cases.c:933
>>>       2  0x0000000000401f9f: main at arch_timer_edge_cases.c:1062
>>>       3  0x0000ffffaedd625b: ?? ??:0
>>>       4  0x0000ffffaedd633b: ?? ??:0
>>>       5  0x00000000004020af: _start at ??:?
>>>    timer_get_cntct(timer) >= DEF_CNT + msec_to_cycles(delta_2_ms)
>>>
>>>  This is not new, it was just hidden behind the other failure. I'll
>>>  try to figure out what this is about (seems to be independent of
>>>  the wait time)..
>>
>>  Not sure if you have figured it out. I can easily reproduce it on my box
>>  and I *guess* it is that we have some random XVAL values when we enable
>>  the timer..
>
> Yes, I think so, too.
>
>>  test_reprogramming_timer()
>>  {
>>   local_irq_disable();
>>   reset_timer_state(timer, DEF_CNT);
>
> My first attempt was to also initialize cval here

Forgot to mention that I did this because my tests have shown
that the interrupt didn't only trigger early (like before the
reprogrammed delta) but instantly. This seemed to work but I think
the order in set_tval_irq() is the actual issue.


>
>>
>>   /* Program the timer to DEF_CNT + delta_1_ms. */
>>   set_tval_irq(timer, msec_to_cycles(delta_1_ms), CTL_ENABLE);
>>
>>  	[...]
>>  }
>>
>>  set_tval_irq()
>>  {
>>   timer_set_ctl(timer, ctl);
>>
>>   // There is a window that we enable the timer with *random* XVAL
>>   // values and we may get the unexpected interrupt.. And it's
>>   // unlikely that KVM can be aware of TVAL's change (and
>>   // re-evaluate the interrupt's pending state) before hitting the
>>   // GUEST_ASSERT().
>>
>>   timer_set_tval(timer, tval_cycles);
>
> Yes, I stumbled over this as well. I've always assumed that this order is
> becauase of this from the architecture "If CNTV_CTL_EL0.ENABLE is 0, the 
> value returned is UNKNOWN." However re-reading that part today I realized
> that this only concerns register reads.
>
> Maybe somone on cc knows why it's in that order?
>
> I'm currently testing this with the above swapped and it's looking good,
> so far.
>
>>  }
>>
>>  I'm not familiar with the test so I'm not 100% sure that this is the
>>  root cause. But I hope this helps with your analysis ;-) .
>
> It did, thanks!
>
> Sebastian
>

