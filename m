Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77032040B6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749119607; cv=none; b=ZwJFcqjzyY3ORPnL9KmHgFVAXrigIAa9df+m4trR6MCdGKUzcvX5mV5ASlP7RHMdAMKJ9hhGu9QZO4prg/D2bSsC6gmyk+L2of96OQXTfsCF3UX24eGQhb3kcL/4+ZaNSdJQPPdn6jny8vRvova0B7PcpKS2vnV+NVUmO0Dr7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749119607; c=relaxed/simple;
	bh=a22MTugVqXJqn2rVeTYu08Ru3J9spYEy5/2EYGhxPUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4ziBbiT5J7QsrKbvfEbXiyj3Zmgb/uJCdg79rp+zquHfxG2W9ZhpgDXYQHZlTkD9TfpeVSVzWQ8L0l2BfUp6hsya/KeGxpEBtAmXxheJ0RbXVqOyPbn81GbB/XGNDxgH8/YC671rLlZM7xBFijPUmJ31Je2wWNlwq33ezdJ/2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rg9LwBi9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rg9LwBi9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442fda876a6so6406765e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749119603; x=1749724403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CcvdK+kUqsSYXK1dvlLkx29YE1Y4FdRzYsL+M29q+YQ=;
        b=Rg9LwBi97TjfLJ/j2rkXiV7RqDLcR1pT1E7ovvAhi73iXulx7wbdfRPm5fDAJ3tPV6
         knOtXVMhwX+shg2RQ8vtmLnEjxG4lMjkGZLtzE+J/h3LhreFQdTXOivrOixT9clH6zIR
         pi4QM2e1eZwsykiVR/QYlD4AzkwCUvnSP55v0Cw9WcLRA0+OQYd62IpfskkvhxIH1GzN
         5l5EFuYcvMqIQKur+caIKOs/P+u1ohNuusOiXT0Ooa5mR/kRjKxOkwq6jO8yQPNZ/U+g
         a1SEd6LiyAViU9kMKzXBhHmffFK+55CWiB3EADYlb/5ZHwKGfjCBmmqJyHjayjPBDwet
         oDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119603; x=1749724403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CcvdK+kUqsSYXK1dvlLkx29YE1Y4FdRzYsL+M29q+YQ=;
        b=Li0YOhpGJectqJCJuKdI5F75DeyyoxgvYAqeSgWNizX5Ebf5rmoYUXNVhkhGzvdiZ8
         2bFfqiDB8ivdC5KfNidnfky6840c3T2+ZRWsr+F6r+bsJ8la39COh7Sy6EKPg20mkFK0
         8dttPU9Bot2BOnBNJy1QHB6Oruzmg9gKtipl13bNyza0NFpdtZ4QwfpsqnF+nZ1gclDz
         f1dq/h5EWqtibQh2FoXyfdY7cyUx7qO0bXUEqPivosggrAEpUSZaiQdpmMhXJS2d0RdY
         2oaCOYEQWqCcXtkQiQj6u6qPbYwuHsmAAVE3+a1WhsklKxPn3zVcG6E2gAiGpfFHH/TL
         bLsA==
X-Forwarded-Encrypted: i=1; AJvYcCVwmt4p4jJunNNQTtet4PyjZnqS5Pg0ZZEjaB11XzFAFOugWbI4zfcMUVahBFB5mElXZ5wsey9BB1Ml7Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBvly7IZlVepuRCDRBRgyvf2W6QYO8SCYSLRqQ3g2k/QF1rBbo
	ryfniO0u1Mfx2JBcobE0lXDSM23WibmJYEMAZfQe6XGLdA39TBeN8rQ05gW+xY+mdnw=
X-Gm-Gg: ASbGnct8YdFvJGQBwvm1CugGZEJKkN6ZY7RtUVPu6N9H2nVvq8+D8SM9oyA9d86zGTK
	Uu9EkukdFOaTCMuf2ktkKrdTXRz2kIRpZWxtXyJeCakxs1ROEDH/A3Drjgs6Id8Q7VRISOSj5bE
	Qzx7ZMYCrCSsIA4V4aihJ4YDykZF6Mq9L/i0GAzVHOeUxlrsaE7GjaXx3H3n6LBWaO5s3Lv+jmm
	l85JUNB8LaRUAydecLRShLYqtVswLUmSeaJF/b3NtGys3iDUcK2Jo2hvN8aTP418UeXdc6Jri3B
	c6dJ7e6QFUpyGoSHJ2ELzcW3W0ENjQZfjtuv3FqLznRrTFx7PFLz/XWU
X-Google-Smtp-Source: AGHT+IG/pYQASQpxqALpdTzyKn6tGv+QxqdbmbGFod1wFV2dwtYmyNkB99H/KuhQnFWYsX9U2WTL4A==
X-Received: by 2002:a05:600c:8112:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-451f0b3ce3fmr54377325e9.23.1749119603114;
        Thu, 05 Jun 2025 03:33:23 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6ca08sm24967656f8f.33.2025.06.05.03.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 03:33:22 -0700 (PDT)
Message-ID: <632eadac-e5fd-4e50-9ced-cd4f2b9e6c82@linaro.org>
Date: Thu, 5 Jun 2025 11:33:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] KVM: arm64: Add trap configs for PMSDSFR_EL1
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
 <20250529-james-perf-feat_spe_eft-v2-6-a01a9baad06a@linaro.org>
 <867c1ze4pg.wl-maz@kernel.org>
 <2fb1965b-bef9-4a8e-a1c7-c8a77d957b23@linaro.org>
 <87a56ned6r.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <87a56ned6r.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/06/2025 4:31 pm, Marc Zyngier wrote:
> On Tue, 03 Jun 2025 10:50:23 +0100,
> James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 29/05/2025 5:56 pm, Marc Zyngier wrote:
>>> On Thu, 29 May 2025 12:30:27 +0100,
>>> James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> SPE data source filtering (SPE_FEAT_FDS) adds a new register
>>>> PMSDSFR_EL1, add the trap configs for it.
>>>>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    arch/arm64/kvm/emulate-nested.c | 1 +
>>>>    arch/arm64/kvm/sys_regs.c       | 1 +
>>>>    2 files changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
>>>> index 0fcfcc0478f9..05d3e6b93ae9 100644
>>>> --- a/arch/arm64/kvm/emulate-nested.c
>>>> +++ b/arch/arm64/kvm/emulate-nested.c
>>>> @@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
>>>>    	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
>>>>    	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
>>>>    	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
>>>> +	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
>>>>    	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
>>>>    	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
>>>>    	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
>>>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>>>> index 5dde9285afc8..9f544ac7b5a6 100644
>>>> --- a/arch/arm64/kvm/sys_regs.c
>>>> +++ b/arch/arm64/kvm/sys_regs.c
>>>> @@ -2956,6 +2956,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>>>>    	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
>>>>    	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
>>>>    	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
>>>> +	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
>>>
>>> PMSDSFR_EL1 has an offset in the VNCR page (0x858), and must be
>>> described as such. This is equally true for a bunch of other
>>> SPE-related registers, so you might as well fix those while you're at
>>> it.
>>>
>>> Thanks,
>>>
>>> 	M.
>>>
>>
>> I got a bit stuck with what that would look like with registers that
>> are only undef in case there was something that I missed, but do I
>> just document the offsets?
>>
>> +++ b/arch/arm64/include/asm/vncr_mapping.h
>> @@ -87,6 +87,8 @@
>>   #define VNCR_PMSICR_EL1         0x838
>>   #define VNCR_PMSIRR_EL1         0x840
>>   #define VNCR_PMSLATFR_EL1       0x848
>> +#define VNCR_PMSNEVFR_EL1       0x850
>> +#define VNCR_PMSDSFR_EL1        0x858
>>
> 
> This should be enough.
> 

Thanks, I'll resend with these added.

>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -596,6 +596,16 @@ enum vcpu_sysreg {
>>          VNCR(ICH_HCR_EL2),
>>          VNCR(ICH_VMCR_EL2),
>>
>> +       /* SPE Registers */
>> +       VNCR(PMBLIMITR_EL1),
>> +       VNCR(PMBPTR_EL1),
>> +       VNCR(PMBSR_EL1),
>> +       VNCR(PMSCR_EL1),
>> +       VNCR(PMSEVFR_EL1),
>> +       VNCR(PMSICR_EL1),
>> +       VNCR(PMSIRR_EL1),
>> +       VNCR(PMSLATFR_EL1),
> 
> I don't see a point in having those until we actually have SPE support
> for guests, if ever, as these will potentially increase the size of
> the vcpu sysreg array for no good reason.
> 
>> And then sys_reg_descs[] remain as "{ SYS_DESC(SYS_PMBLIMITR_EL1),
>> undef_access }," rather than EL2_REG_VNCR() because we don't actually
>> want to change to bad_vncr_trap()?
> 
> This seem OK for now. We may want to refine this in the future though,
> as these registers cannot trap when NV is enabled. Yes, this is a bug
> in the architecture.
> 
>> There are some other parts about fine grained traps and res0 bits for
>> NV, but they all already look to be setup correctly. Except
>> HDFGRTR2_EL2.nPMSDSFR_EL1, but it's inverted, none of the FGT2 traps
>> are configured currently and PMSDSFR_EL1 is already trapped by
>> MDCR_EL2 anyway.
> 
> Can you elaborate on that? We have:
> 
> 	SR_FGT(SYS_PMSDSFR_EL1,		HDFGRTR2, nPMSDSFR_EL1, 0),
> 
> which seems to match the spec.
> 
> We also have full support for FEAT_FGT2 already (even if we have no
> support for the stuff they trap).

Oh I think that was misleading, the version I was poking around on 
didn't have the FEAT_FGT2 stuff applied yet but I see it now. And yes, 
as you say, what's there matches the spec.

> 
> Thanks,
> 
> 	M.
> 

