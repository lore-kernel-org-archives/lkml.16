Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CFE2951D4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305367; cv=none; b=EatA4hPgFGXLs9Zab8pzrmVimgUxA2K2DSRuUdCzuzWahgzDHKIEty7R5pZ+Pqjs7AXD21PmNrZrcX9wVJw6ctERkiYb692hUzCm+HwDrQcbp8TYHYZ1+upsGI7yvzBp2fNKIOSDnQdCcBX3WrpAqP8YOkBydoYr8a83Lh66OPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305367; c=relaxed/simple;
	bh=x1sXBLrox9Cfxp1gWxX+Pza4O5FYUIUENowzTtW2fho=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=WfJ4d8r6D/Hyl3tNowaSYl0EufHnDhCxAGFCWbbCnFUeR8ILIoqnn0VAczKdxnTNWJkRYO4pDZ42IGCO8wtxUnlRYjS/yaibaAt2//0IuGcab8Y7LPa60DgRALu3FI7o494qe6a0o+9JRy97LoCcVWR+mzWYAxdqm14uNhLpaRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y67sgK2p; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y67sgK2p"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-86cfea700daso182433039f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751305364; x=1751910164; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zfAOZg4LwTTd8mipDsvBNOZCGjPGcqAJ6hHgzhMWsSs=;
        b=y67sgK2pkbgUNQ7gjkKzSSMpUJnxWUtzhXXxPUOujt6eisGFryn9rsGWltQkU9B9jE
         e2GedEGrm8+DDY0CKHprRg7OKw2vk2c0qA50Zygn/q+Vo5gxgUFsx3LIvOfvKmWpWfIY
         FNIbepu6nWxHkeRCzZ0Gljhv1d4KH5/jqspIhcj7eK91q/0m/pvqNSDAdmvbCFCGMK1J
         qffixDXEbyeKPKdLbk6S+wiIKhKZOeLypNxCMCb08m0V7FPjfTWUyetxYIfHEKnqGcJm
         bYCN2hcw+kM2K9D1g+68jVTirTBJtG8biyd0lc4xHhsduFChj0Y0vQf7oXoE3v+pPvCU
         nyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751305364; x=1751910164;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfAOZg4LwTTd8mipDsvBNOZCGjPGcqAJ6hHgzhMWsSs=;
        b=P6Jiye2Efi/8WACgGCAAAbDC5hrcHgQu6qEaicmq3vKGoi3ofZ992giUv4xeMxmvgY
         +J2Lp2+A11Mt7XM6OJ+1bLba6j5DqRVdFOAcjk1eVlQufNTEk6/on4/n1WYgo8RojmUt
         IM5xh9Se3W+9YnqV8EZXVSEc0vlyuZt5UGXvQSL2eV+Ewbok3ejCd9u1cbhgF/Izo9FZ
         nHJrn0Lb4w6nbPFEfe71iv7Em8dod3XMqBptqdZ/AUL7ri/1Lv+UIuU+tgnjdAzAJITF
         jp4ie7wyKqjrWnrj9yhdHSt8TLdaMZmP0yy/A8sqGr3tTknJfHrRRZqlB9LD+8EKglid
         uu7g==
X-Forwarded-Encrypted: i=1; AJvYcCUBydLU7+N43HL7ftaekplETO/Ym+8QgNpHmyyb9aIDamTs5pMq4wIs0EWqdFldGDYQv9iNuphthoK/86w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEqVWeM2X3IbdPIcrrsVqSvu4j6XoD2HvdWKAHwlvQtYpAX3a
	ggV7CKgxiOTU8OkT+yrhnV0xdPs5gLvjr1Dn5iay7HFtiw9PGFieIZKYRnkJ1EjieCzIMGfBnml
	Eet1NCl3RDmMpLA12uVvPAxtK2g==
X-Google-Smtp-Source: AGHT+IHeGVNAbtPOjDIR39vaG0kghlxZnlKsay2N4Gr5RhKF/AQPLY5SUF0a/faATBBTtFrSocpRy9rTkRcXNhcugw==
X-Received: from ilbeh24.prod.google.com ([2002:a05:6e02:4c18:b0:3dd:f56e:32fc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:174e:b0:3de:296c:a042 with SMTP id e9e14a558f8ab-3df4ab85845mr124030495ab.11.1751305363894;
 Mon, 30 Jun 2025 10:42:43 -0700 (PDT)
Date: Mon, 30 Jun 2025 17:42:42 +0000
In-Reply-To: <86qzz5b92t.wl-maz@kernel.org> (message from Marc Zyngier on Fri,
 27 Jun 2025 14:36:10 +0100)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsnt5xgd86st.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 09/22] KVM: arm64: Correct kvm_arm_pmu_get_max_counters()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	oliver.upton@linux.dev, mizhang@google.com, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Marc Zyngier <maz@kernel.org> writes:

> On Thu, 26 Jun 2025 21:04:45 +0100,
> Colton Lewis <coltonlewis@google.com> wrote:

>> Since cntr_mask is modified when the PMU is partitioned to remove some
>> bits, make sure the missing counters are added back to get the right
>> total.

> Please fix the subject of the patch to be more descriptive. It is
> worded like a bug fix, while it really is only a step in the patch
> series.

> Something like "Take partitioning into account for max number of
> counters" would go a long way.

Done.


>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kvm/pmu.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)

>> diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
>> index 79b7ea037153..67216451b8ce 100644
>> --- a/arch/arm64/kvm/pmu.c
>> +++ b/arch/arm64/kvm/pmu.c
>> @@ -533,6 +533,8 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int  
>> irq)
>>   u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>>   {
>>   	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
>> +	u8 counters;
>> +

> nit: superfluous blank line.

I'll remove.


>>   	/*
>>   	 * PMUv3 requires that all event counters are capable of counting any
>> @@ -545,7 +547,12 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>>   	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
>>   	 * Ignore those and return only the general-purpose counters.
>>   	 */
>> -	return bitmap_weight(arm_pmu->cntr_mask,  
>> ARMV8_PMU_MAX_GENERAL_COUNTERS);
>> +	counters = bitmap_weight(arm_pmu->cntr_mask,  
>> ARMV8_PMU_MAX_GENERAL_COUNTERS);
>> +
>> +	if (kvm_pmu_is_partitioned(arm_pmu))
>> +		counters += arm_pmu->hpmn_max;

> Why the check? Why can't we rely on hpmn_max to always give us the
> correct value?

Imagine no partitioning. Then the value of hpmn_max that would be give a
correct result here is 0 but 0 is also a valid value (anything from 0 to
the number of host counters inclusive) indicating we are partitioned and
want to give only the cycle counter to the guest.

My predicate to determine if the PMU is partitoned relies on hpmn_max
being a valid value only when the PMU is partitioned.

Making hpmn_max 0 here would require introducing another flag to check
partitioning.

> Thanks,

> 	M.

> --
> Without deviation from the norm, progress is not possible.
