Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D21CAA7D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088614; cv=none; b=A88RJvDluSyfzb6u9PUku0If1OUCeXwp86Qi9ErVshzn9jxGK6LxwP2nIm6TJMU434CgwOyBaRwmmGmiLU8UtMEcTOHAUHG/NtfrlYi7pBToliO0kLB9ktJksM9nYIyfI78qBLsqPrWahLa8Fc+qVsNYihUNwQr//GpU18PZQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088614; c=relaxed/simple;
	bh=kCrdhF+yR04zpDgvPaEbwrTFya3LR3Mk7SW51smtES0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvVnLoF9SFAy6/BUMbMKqmW/kmbjetwUF0Qm2bOVcaC19Fbaj/3+gBbe/HiEUvJ1m5UuHLikAeurKouBFNy8DwNmDm8C6odzg+FGPIih5hG8VkPoBYoqed4kba3DTRTXDJXovH71k67g6DoQGOKMMfAMmeYb8RSaQcGEVqaRKew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGAIJtbQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGAIJtbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744088611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08d10QPRbou7mD/4AaojdjLjtx5I6e0q1cXfeY1kUxQ=;
	b=HGAIJtbQanh9ngnQi72+Ut7n1QhrAWR1edZtwX14JU8fDy1BHpMS16X7xVWCQplgefKhBr
	sq6SVIawted8My2Y24fpytSj75FOxFkczWrDkmey5NQCw6C9JwysvIYsXw9pIYOcCcOjZg
	htW2dasuJAjUuWGwSF11SeUGGf0skEQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-avOLxPLPPLK_ti8gpWgYPA-1; Tue, 08 Apr 2025 01:03:29 -0400
X-MC-Unique: avOLxPLPPLK_ti8gpWgYPA-1
X-Mimecast-MFC-AGG-ID: avOLxPLPPLK_ti8gpWgYPA_1744088608
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410b910b0so39471315ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 22:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088608; x=1744693408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08d10QPRbou7mD/4AaojdjLjtx5I6e0q1cXfeY1kUxQ=;
        b=WBiHhAnL/cdBr5Hi2y1aoCy3os470tEFmQCQCVW/fOxQY9PYEOtMzZvSQK/7iM4wDm
         vDXNCz95pYIkw6cLD+8iYJrd4kgAxb+92GbaFNLDujT+jY1B9noD9roPlXsj9UYc5TBQ
         Xwl3Ugrh14zTDIji6WV2gs0Z6HfZhNCaJq+i5gmU0YR7WugNTpmgZQCPrZanGs2ulR3Z
         4m/4tzgdXVEyrt2NHVl/tkrQxHdgGrhIRy3ID8Q9ZkUh04+85AuLP5A/kuLysDP8+/HU
         aKARmYy0dqZHi0JN4k4Fq59pIZ7Pa78EPGSz5QNBgXZerz0gNmL0M2f5mLFbMrrFyrWv
         9CkA==
X-Forwarded-Encrypted: i=1; AJvYcCX4SJ/ilbYkaN9XtfnyJE6gtJtCyzWUddw5yYjjuIhRhB7y84rTMkDkGEl9pyKISGxvrfdhGlMtMiE3+HY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+1s5tkpaiAWexfkLRHLmkMxSqCktI+50dxe75E7v47HwvsasZ
	68ZrFroe1zncktJYsyAQ3E9kauMK6Pbz4sqvpr0k7ReyKvpA9tnBncnTLYUCRPfSR6Wzgp/foq7
	1bLPoFhYHkFuR9HupsFAOxsSqsU3BfyCRhVIL/zET4p3dUA+dh2HXVDCRCVA2jg==
X-Gm-Gg: ASbGnctVdNBShgVS3b+Bs4OtZ+WYnqEGeEvIB+TqzWkSstojm9LlEvnySTLmk5bD+2K
	6cS1Mdh1mefaq+zGgFfV6Op5tKBCYCebtjROkm5JQeHO6hR3N7FQ4xR1Xy1CQ1vHa90x4FT3sxQ
	UZuCdx7tCQ1Rzhcbi01EZYgY7Dx/I30bf+SxErmWU3nzPKHzyjcBC+I/iQHTZSqUWwCEMqwtvzz
	472kOPEtdbGOIC4V0jIHLF9r5eypjLrZT/te0g62GV+4vENpMCfuE9W9uxU/nkspPznuqbF6sG4
	RGwcJusz3CV30QT/
X-Received: by 2002:a17:902:ccce:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22a8a04593emr212605165ad.7.1744088608512;
        Mon, 07 Apr 2025 22:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGML8JrfPQSGP1sTXgAJbLiBC79RWpQvktKvDF6YE82nc5K0KhNIo0FYjrqKNMDpWPDe5wEjg==
X-Received: by 2002:a17:902:ccce:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22a8a04593emr212604925ad.7.1744088608147;
        Mon, 07 Apr 2025 22:03:28 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c01b7sm90355785ad.96.2025.04.07.22.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:03:27 -0700 (PDT)
Message-ID: <005ccfb3-b616-4723-b039-b8a3d6fb10bc@redhat.com>
Date: Tue, 8 Apr 2025 15:03:19 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/45] arm64: RME: Handle realm enter/exit
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-18-steven.price@arm.com>
 <80983793-5df7-4828-96e8-90540e7d9183@redhat.com>
 <95c06abf-591f-4dd0-b1fd-296b0d5ae924@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <95c06abf-591f-4dd0-b1fd-296b0d5ae924@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/8/25 2:34 AM, Steven Price wrote:
> On 04/03/2025 01:03, Gavin Shan wrote:
>> On 2/14/25 2:13 AM, Steven Price wrote:
>>> Entering a realm is done using a SMC call to the RMM. On exit the
>>> exit-codes need to be handled slightly differently to the normal KVM
>>> path so define our own functions for realm enter/exit and hook them
>>> in if the guest is a realm guest.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v6:
>>>    * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>>>      vcpu to the error.
>>>    * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>>>      this exit type.
>>>    * Split code handling a RIPAS change triggered by the guest to the
>>>      following patch.
>>> Changes since v5:
>>>    * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>>>      change on next entry rather than immediately on the exit. This allows
>>>      the VMM to 'reject' a RIPAS change by refusing to continue
>>>      scheduling.
>>> Changes since v4:
>>>    * Rename handle_rme_exit() to handle_rec_exit()
>>>    * Move the loop to copy registers into the REC enter structure from the
>>>      to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>>>      where the handler exits to user space and user space wants to modify
>>>      the GPRS.
>>>    * Some code rearrangement in rec_exit_ripas_change().
>>> Changes since v2:
>>>    * realm_set_ipa_state() now provides an output parameter for the
>>>      top_iap that was changed. Use this to signal the VMM with the correct
>>>      range that has been transitioned.
>>>    * Adapt to previous patch changes.
>>> ---
>>>    arch/arm64/include/asm/kvm_rme.h |   3 +
>>>    arch/arm64/kvm/Makefile          |   2 +-
>>>    arch/arm64/kvm/arm.c             |  19 +++-
>>>    arch/arm64/kvm/rme-exit.c        | 171 +++++++++++++++++++++++++++++++
>>>    arch/arm64/kvm/rme.c             |  19 ++++
>>>    5 files changed, 208 insertions(+), 6 deletions(-)
>>>    create mode 100644 arch/arm64/kvm/rme-exit.c
>>>
>>
>> With below nitpicks addressed:
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>> [...]
>>
>>> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
>>> new file mode 100644
>>> index 000000000000..aae1adefe1a3
>>> --- /dev/null
>>> +++ b/arch/arm64/kvm/rme-exit.c
>>> @@ -0,0 +1,171 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2023 ARM Ltd.
>>> + */
>>> +
>>> +#include <linux/kvm_host.h>
>>> +#include <kvm/arm_hypercalls.h>
>>> +#include <kvm/arm_psci.h>
>>> +
>>> +#include <asm/rmi_smc.h>
>>> +#include <asm/kvm_emulate.h>
>>> +#include <asm/kvm_rme.h>
>>> +#include <asm/kvm_mmu.h>
>>> +
>>> +typedef int (*exit_handler_fn)(struct kvm_vcpu *vcpu);
>>> +
>>
>> Duplicated to exit_handler_fn, defined in handle_exit.c, need move the
>> definition to header file.
> 
> While I get this is duplication, I'm a little reluctant to move it to a
> header file because this is completely internal to each C file (the
> xxx_exit_handler[] arrays are both static). If either side wants to e.g.
> add an extra argument there shouldn't be a requirement to reflect that
> change in the other.
> 
> Specifically I'm wondering if we're going to ever need to pass an RMI
> return status into the rme-exit callbacks at some point.
> 

Ok, thanks for explaining it in details. In that case, I think it's fine
to keep exit_handler_fn in rme-exit.c.

>>> +static int rec_exit_reason_notimpl(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +
>>> +    vcpu_err(vcpu, "Unhandled exit reason from realm (ESR: %#llx)\n",
>>> +         rec->run->exit.esr);
>>> +    return -ENXIO;
>>> +}
>>> +
>>> +static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
>>> +{
>>> +    return kvm_handle_guest_abort(vcpu);
>>> +}
>>> +
>>> +static int rec_exit_sync_iabt(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +
>>> +    vcpu_err(vcpu, "Unhandled instruction abort (ESR: %#llx).\n",
>>> +         rec->run->exit.esr);
>>> +    return -ENXIO;
>>> +}
>>> +
>>> +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +    unsigned long esr = kvm_vcpu_get_esr(vcpu);
>>> +    int rt = kvm_vcpu_sys_get_rt(vcpu);
>>> +    bool is_write = !(esr & 1);
>>> +    int ret;
>>> +
>>> +    if (is_write)
>>> +        vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[0]);
>>> +
>>> +    ret = kvm_handle_sys_reg(vcpu);
>>> +
>>> +    if (ret >= 0 && !is_write)
>>> +        rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);
>>> +
>>
>> Unncessary blank line and the conditon isn't completely correct:
>> kvm_handle_sys_reg()
>> should return 0 if the requested emulation fails, even it always returns
>> 1 for now.
> 
> It shouldn't matter, but like you say it's not technically the correct
> condition so I'll fix this up.
> 

Ok.

> Thanks,
> Steve
> 
>>      ret = kvm_handle_sys_reg(vcpu);
>>      if (ret > 0 && !is_write)
>>          rec->run->enter.gprs[0] = vcpu_get_reg(vcpu, rt);
>>
>>> +    return ret;
>>> +}
>>> +
>>

Thanks,
Gavin

