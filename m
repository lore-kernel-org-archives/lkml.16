Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE3319259F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887356; cv=none; b=QIsXWEHSBqAwyFu2qxEAByRNqLdIQPAk6QLd23tC4HrbHUOxdllST+QhYO2Ny/R6H8XEU5Bdr8ZRAj5mVrkz5utCpiJ/lwcmoBltDOgDqdq3+UReIDLR4PGUYGoPGflvC3eFbuXTuODJnkmeqCWEMGkjFiTtYtOJjBGx6teH+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887356; c=relaxed/simple;
	bh=nNEiZmY3g+qmq61lmqp2wXWa7PaBorCUrUUrtuUJtf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtxCvOHtOOorUGZEVw/KMizfFQjUdolQ2FOtYautDg1lNfVwJ/l9EiQDi9BqJ024F4+3Kkt7YKXSyX/rOG5W9SHbRD0aQg/B+QJDyiIpi4SO1XZvBW8G9hu5mKPzITt7N7UArihjuZwjlY32lIF7EoUkHSNTnmBepO8DdryTH4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5yJouhU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5yJouhU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453066fad06so20335625e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751887352; x=1752492152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rjMtWlZcH9KDWdY+uSujQcWsrGYDBsGSKcWmFVedP5g=;
        b=w5yJouhULJi4kH/aQbpxCHmU7vDMqvB0G3k9nRjpyW4yi+QNGo0gc8kcNnT9OvYPQL
         mBNIxuR+shsa2t9g/yb+OiRYFNIHDAEu6WOZiHZ3XIXHa1B4mYvZB8boNw9+OGMC6JW7
         Bzp1kYl6K6WbmRE7TfujJn1EWSUhq1dqDu6Xs+G0+W+TShip/oFL7sKbmVExR+CbJbm5
         UUrnJRXviqU4Kt1vOpRw+TvOlIcVeSaB+ngCv5mTvKG0QVDqh5B8jSlVvd8zRkYTQHNx
         17EqjYCRCAdAwJsoQl4EKnlttXObmzkWLzema8pQ2OQ/loPJ+19KvAeH7CwU1tmlreEI
         Z/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751887352; x=1752492152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjMtWlZcH9KDWdY+uSujQcWsrGYDBsGSKcWmFVedP5g=;
        b=MEdgkGqWF9cLfaPwilWyd5SoVERYOaST/NWAcB82baW0XyZUcWPgYIdFhXBUL4+j0F
         8y0XhikIRJP+kdDAqzhFUkfCa/kqR+aQ2LLQMotceWtEKXMJL3vqydaH2gg4s2Jv1/wd
         0M37r5pRrPNmKXwCu+MlP+EHRlXcEWLkfbFi1JTkEwHkPsomaWawtZcyJtpdHTeWH7A4
         xR/zDsl8a9gIlBK7h+w2rOKo4eUJjQRENzA/qwkCo+sGrGWYSygWGeccU7kwiyn4ASFC
         zOfvERwxYHZlY+/usuHRzYORnhSUoCun9DUsO4qf3e7Qqpop27vgm5gosff4AeNbbEMG
         K+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmQcjui6TisilwVIe9x+DETv7Dc6Ot5w7NIQJlytbWbBXVjM6Rjrug9Jgri9zXpzRATOnmkuyrwD77/Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Y8/dm1xUi9VQW2zvLP9NtVLVjg9QBAzK8Ju42LXImqy+4FNc
	Y9kpENXK4ENv7bmVgdv6TCsA8yTeajV/ezpPa5+PeErIq44I8RuKz/cgbNZLrBulOQA=
X-Gm-Gg: ASbGncvBgJ2BmGp0FYZyo9cKPVR8HbybXBovU4sGJuU0W7K3H8alD7BymcdaeJVdjrH
	vt8/dD9LoLivC71ks4ziC7r79jarcR3DCXa8fIHCP/NUIzoX2HMorh8NnfcVhShSFDPK/OFwSV7
	FQ91ol6BDWmr++VbgABo7rSfbICPDD1QmcUaezGNSpp+huic/geY/LkT2FfJYdOy2/sx6ZHwxTF
	QX3GdkkWD916y7OENwaN8Qbtm+ndlg7lalMdJ3mpabxO1fmMxLJFLDd05JG5v03sH3zvidyxqJT
	5XguJJuqPuvoIubRIj5qFvqk8o4FUFAJx5Vcsyqx0zAIijYCA6Le2s8zrYGch+FMBhY=
X-Google-Smtp-Source: AGHT+IHP+NzOEoebO2F65iIhUokYTdg25eXvRyuw2XM8rhBPvr8L/1ygaNVNU239JiCScgrpFEZPwA==
X-Received: by 2002:a05:600c:c3db:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-454bc4c1e94mr47310605e9.10.1751887351597;
        Mon, 07 Jul 2025 04:22:31 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm109152915e9.32.2025.07.07.04.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:22:31 -0700 (PDT)
Message-ID: <6f55d9ba-02c5-4075-a751-018b1521ddd4@linaro.org>
Date: Mon, 7 Jul 2025 12:22:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Alexandru Elisei <Alexandru.Elisei@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
 <20250704140443.GH1039028@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250704140443.GH1039028@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/2025 3:04 pm, Leo Yan wrote:
> On Tue, Jul 01, 2025 at 04:31:57PM +0100, James Clark wrote:
>> DEN0154 states that PMBPTR_EL1 must not be modified while the profiling
>> buffer is enabled. Ensure that enabling the buffer comes after setting
>> PMBPTR_EL1 by inserting an isb().
>>
>> This only applies to guests for now, but in future versions of the
>> architecture the PE will be allowed to behave in the same way.
>>
>> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/perf/arm_spe_pmu.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 3efed8839a4e..6235ca7ecd48 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -537,6 +537,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>>   	limit += (u64)buf->base;
>>   	base = (u64)buf->base + PERF_IDX2OFF(handle->head, buf);
>>   	write_sysreg_s(base, SYS_PMBPTR_EL1);
>> +	isb();
> 
> I know that you and Alexandru have discussed whether the isb() should
> be placed here or after the out_write_limit label. I should have engaged
> in the discussion earlier. Sorry for raising the question now.
> 
> My understanding is that isb() is not only for synchronizing the write
> to PMBPTR_EL1. It also serves as a context synchronization event
> between any other SPE register writes and the write to
> SYS_PMBLIMITR_EL1.
> 
> Let me give an example (perhaps a rare one): if we use perf snapshot
> mode or the AUX pause/resume mode, it's possible that the flow does
> not trigger an interrupt via overflow. Instead, the sequence might
> look like this:
> 
>    arm_spe_pmu_stop()
>      `> arm_spe_pmu_start()
>           `> arm_spe_perf_aux_output_begin()
> 
> In this case, to ensure that all SPE system registers are properly
> written to the hardware, the safest approach is to always execute isb()
> just before writing to SYS_PMBLIMITR_EL1. (In other words, after the
> label out_write_limit).
> 
> Thanks,
> Leo
> 

I think the point is that any write that enables the buffer must come 
last, but not necessarily all writes. And not all paths in 
arm_spe_perf_aux_output_begin() enable it so the isb() was only added on 
the path that does.

I couldn't see an issue with your example, are you saying 
arm_spe_pmu_stop() could call arm_spe_pmu_start()? It doesn't call it 
directly. Or do you mean the aux pause/resume thing can cause a 
arm_spe_pmu_start() from any point in time? If that was true then it 
doesn't matter where the isb() is because you can never be sure it will 
be before the write.

James

>>   out_write_limit:
>>   	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
>>
>> -- 
>> 2.34.1
>>
>>
> 

