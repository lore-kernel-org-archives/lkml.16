Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBC328369D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944229; cv=none; b=r4OOO7AZSh5bt6ndw/cUNKSBQs35D+ktR/qTyG6MzjvsX4YakwMaKBdIWQj7hvh6veHgI8KlqLpXMITxNRa8qMaKq+FG/auZuQ5mzLmjXn33dm3ImWBXnnwksjIoWGlg3BCSylIdATLo0yu8f/v0bxuQpt4G4aBXQ5eyGrdSKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944229; c=relaxed/simple;
	bh=cYofdeohFRtCrlrs30kGtQgAlnzJghGw3tFBSu52gXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFRuZrnFspC2zFSvLve6pa6rsADq+u006+PUtnBPwDhTf4AHfZTX5HLirliKlmihairSWzAFZtcu4C8nJF8fAxemoVmXKrb/5G9qJjRCyu+3dbnfRHtJrMsXvFRUFQc2cPae5mn9pMsOlcfv6e9bYZ5jd82sDP2zx9NSDvX1lAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NjiOKPQD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NjiOKPQD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a375888297so3204943f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748944226; x=1749549026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTiUXP9qqpwePncWUOCrudvn6ikDCRoeniFYV5C54HQ=;
        b=NjiOKPQDlT6MnFwQx9uTIPQmWBMWRPdZlu/lgZdmBoHwNCx6v1eS4FM2gZ+nSwtL/O
         FVep63rquqH5qPd+2WS5bOI2vYu5K3S0wn8Eb7ccdo/CEgeFwXouR3QX5JlKpyaXMIyF
         AEXmnYhuyvWzRNWLbUn5grpmPFLlbosiKeIExZwCP+uzAT9AL6O4h0FaNEIO8srQcn5t
         VUYQ25kkFz7DWqPY8GmTt1VDlxHQkCl5r+eW0Txe+W+sohDRwFYuL3OrMrRrXadCyO0e
         WIo4yWDWzmzRl0+jlGX5hWeCv/swOjzBxhgT+2xsQCihz8G/kqABs1IcBeeuPzCPnhQu
         Bplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748944226; x=1749549026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTiUXP9qqpwePncWUOCrudvn6ikDCRoeniFYV5C54HQ=;
        b=SLd2kPUTZnR1iZHFxMwX+fox2YMHv/hWn0KePCID++3eqOSJTNL0WSj32TqDC/hYtW
         RgxVYnqzz3yns9F7hxfPa1AUVhnXMxhNfLPBBGMCHWd/l0q+k3mw58Qc3MofpUidkHm0
         ZZgN/ULXIcYk6awJNMclVEHLqdA2+x36t2Qdm2vfLR2whUQcNvoRX8Vc0bPedgMPMLKw
         3xYyAyPD0/SXTUGad8od1KeM2qqwqjyts7mJ3W6ol6G0/kLk2DaSUCXgGz86sT7LDr/w
         eNkKGY+sz/e/7tvs6lLgn5f/2DDZOg3OuMSvwUoCQlBa0LmKWtcGjXtDzdxTe4oVkBg2
         Dc2A==
X-Forwarded-Encrypted: i=1; AJvYcCVdmB7WUbM1PNMLxymXI8hlN7ukoTdWCPi/AnWs37c8zZcx0j6jfFGIW02lKhVihAjjQmx5PbTe4rSneDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwECP52UsCbHK0Zoyzj1/+vCvKy31Dt/LRuv9+6ZCecYUFr4H2y
	Hu+JaouMYg297HxsePLTXhU/K/oXHUlwrpIbBqhyF74/hwko6Gm8mXJ8tJ/d2uJrar0=
X-Gm-Gg: ASbGncstac7ez8hJdCtqYMsdrlbssv++22KtbolV39rlbqFRK1dCXMTHvLZKF4sl/5j
	BksBARpdABBR5WnjdC6RUausVkLJYECqkUm39PW5enONJwoYuQWslv6feh0Cq2YHBVvYeD0wlwJ
	+/ea/p5YJQ+OG79ew+M2H9L55zgHIjgJ+UP1lfPBBGWt31Ml3gvHy2cuFgpYEuBvHfRuzqYV2T4
	N7YhYVPF63KdcGn1iL3EMFPwcKWEO4+0z1eZ7X4SWgo++RBGS/HEx1bfF8kKogJAe5UAjH4piAK
	2QbvDHhgqDmcve6aoFkB8MHuhL0asBI1z4ujUgK6QS/rtVhbb5yRKrCg
X-Google-Smtp-Source: AGHT+IHsW44MmqwfDKjzghl/i3BzuGEINgERerQaDbyP3gu7SUf4muuyytvtJbMK7SPgP194SuthmQ==
X-Received: by 2002:a05:6000:2892:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a514502388mr1696065f8f.23.1748944225608;
        Tue, 03 Jun 2025 02:50:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c9d4sm17906246f8f.38.2025.06.03.02.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 02:50:25 -0700 (PDT)
Message-ID: <2fb1965b-bef9-4a8e-a1c7-c8a77d957b23@linaro.org>
Date: Tue, 3 Jun 2025 10:50:23 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <867c1ze4pg.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/05/2025 5:56 pm, Marc Zyngier wrote:
> On Thu, 29 May 2025 12:30:27 +0100,
> James Clark <james.clark@linaro.org> wrote:
>>
>> SPE data source filtering (SPE_FEAT_FDS) adds a new register
>> PMSDSFR_EL1, add the trap configs for it.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/kvm/emulate-nested.c | 1 +
>>   arch/arm64/kvm/sys_regs.c       | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
>> index 0fcfcc0478f9..05d3e6b93ae9 100644
>> --- a/arch/arm64/kvm/emulate-nested.c
>> +++ b/arch/arm64/kvm/emulate-nested.c
>> @@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
>>   	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
>>   	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
>>   	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
>> +	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
>>   	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
>>   	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
>>   	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 5dde9285afc8..9f544ac7b5a6 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -2956,6 +2956,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>>   	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
>>   	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
>>   	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
>> +	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
> 
> PMSDSFR_EL1 has an offset in the VNCR page (0x858), and must be
> described as such. This is equally true for a bunch of other
> SPE-related registers, so you might as well fix those while you're at
> it.
> 
> Thanks,
> 
> 	M.
> 

I got a bit stuck with what that would look like with registers that are 
only undef in case there was something that I missed, but do I just 
document the offsets?

+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -87,6 +87,8 @@
  #define VNCR_PMSICR_EL1         0x838
  #define VNCR_PMSIRR_EL1         0x840
  #define VNCR_PMSLATFR_EL1       0x848
+#define VNCR_PMSNEVFR_EL1       0x850
+#define VNCR_PMSDSFR_EL1        0x858

+++ b/arch/arm64/include/asm/kvm_host.h
@@ -596,6 +596,16 @@ enum vcpu_sysreg {
         VNCR(ICH_HCR_EL2),
         VNCR(ICH_VMCR_EL2),

+       /* SPE Registers */
+       VNCR(PMBLIMITR_EL1),
+       VNCR(PMBPTR_EL1),
+       VNCR(PMBSR_EL1),
+       VNCR(PMSCR_EL1),
+       VNCR(PMSEVFR_EL1),
+       VNCR(PMSICR_EL1),
+       VNCR(PMSIRR_EL1),
+       VNCR(PMSLATFR_EL1),


And then sys_reg_descs[] remain as "{ SYS_DESC(SYS_PMBLIMITR_EL1), 
undef_access }," rather than EL2_REG_VNCR() because we don't actually 
want to change to bad_vncr_trap()?

There are some other parts about fine grained traps and res0 bits for 
NV, but they all already look to be setup correctly. Except 
HDFGRTR2_EL2.nPMSDSFR_EL1, but it's inverted, none of the FGT2 traps are 
configured currently and PMSDSFR_EL1 is already trapped by MDCR_EL2 anyway.

Thanks
James

