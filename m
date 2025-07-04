Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43341221FC7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751609533; cv=none; b=brwnrQlyYn7sLj1daRchBCENlMtVo8jV6pxbalPC4EJc3hwvtDBfBIg22MPK9AI22xX7u3Yu9zc8NcLXpRAUvOzw5bd7c0tuN1A/9wraF6iK9B4qPl7Pa9pY8SsCNUgf5/ALp2v8xsn6HAzbu1ik/UJd1NIu9Y7Q3QQzpl6eMNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751609533; c=relaxed/simple;
	bh=/uogvdvXfYqm/roohIkQvB+ClcSIM1FXcy29Xo6qXa8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pxvt46QOG0U5q1UdkpHt12lWmkX4wFT14mFCDPjT2WTTIfMCSWG23WPR0Zn1lCJ7xGBE9hIo3ksY7MMuY4jnC6iXCewTrmwC7iLN0gsP0IcCsHc00bvZWZ7IjMj+lxNKfdti6A0V99pao1oCd+VPxO8wjOzPGcdfyRpzvGUHBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YBQoCcJp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YBQoCcJp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so1438774b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751609531; x=1752214331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iLc719GJ905zueoaF4JxOKSxawRWbkyYr3NzbMVW2kQ=;
        b=YBQoCcJp6Lb4MFUObbNG8reAC3F5NKVZW0enR+87wBbdqblH7aEjk12lEgjyeuWnqc
         3kQHwhHLSwO+Nsmm3jINrQ9DIuMESSAujNBmkPfJJ8MsJ0FFAccag7HZsyhkTDLfmBY5
         JWjXshkHihbuYS1CnvIsTgOLQfSSudGi3DChGqz5iYmAeU/DVQFDsu/a0IHkZhHFIiyp
         aRwUtHx2fPJAnKmFlP7jK4Dg5F4H4THuvTtqLBQntc9reucn4EmlcFEK+VQk7KKbIMwP
         RrcLNezi5UslDizWqBwtFNMmL5ikz0DG10rkqCenalP48MO40n8OqNLeMRVi6nzZbGiO
         s3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751609531; x=1752214331;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLc719GJ905zueoaF4JxOKSxawRWbkyYr3NzbMVW2kQ=;
        b=MhXheWDWJ6C/DdTMT41EHmhMAVfJgOrxOqjakN8ZVwNLTed+bJj0BsbZm+2aCYc0zf
         j6YCERSFs858rFvTw9eCym3RzSpjwAkcB4SYKjuwklhClqrLeIjXB1nqrvLwAC1k+kbU
         A7YYE33IoHzpi1JBKVNm9+qgNLkVfUZl++4ELywBbpqwMugG5OZaxhoznEgLWyJwpd5a
         En02nCBK2K8QU7i1tqmrnfpH9fdERXc4LNU7g2CdWhHmm6V3Un7xQWs47G+MIRy31yWA
         FrMvjy4vSCs8LdDYuRlOICVrXxMKIa8MTsd7FJckwDc5hIEPsx15wUMDLZ9C/3lo92KJ
         qM3A==
X-Forwarded-Encrypted: i=1; AJvYcCW4vDdVIRsSF6CJ0zG+v2Crys1beRPGFHyVLg7x02v4wI+H2zmkQHfG9UY4yh18lHwY5yKivj7iR6A0DpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsGNE2lJi5wsSpb8Evno9yXnO97LtrRdn8AI54UPRdX4aKMtEB
	2FyFjc9GpzfYqwLevhRNQOFKN90wI7n98hkEzDiTT1uGZ+a6WITW7twDWGn3iSi/I80=
X-Gm-Gg: ASbGnctYtitbg8OtDVgzGXCvh6JBEwHcGEy5Ce5esyH6L/y72GHj1Rx2MDHLvFRxego
	UGoboa+Cp3xbFBECOur0mmm9zH26HhG+aTYqdBSt4z8PNc+nI2/rhnMbJ4J+qUIwvUBv2+3mf3a
	MH8sUMALhW6mGcFGFJQXals9Y5Wh/pWVFXUDBZ3r5+8tPlbusDQtrQNmhaNB3R/Uvfqhwcyrng4
	7Hv/hl78q2bWlE60Nooghv7ysPjnxgaSzAIhq9uhPGiz46862oFSFsZ+2eDxplJ108+moB4mFeM
	abQjP9FbmTBwR35rw/RxfaIJJ4mqPcCUe5DvUKEmNVMBcdaOGY2OY32xvouNjQYp/3dmeZc5fnD
	oERiN20MO2gjHp+aDJd9c5D1XBPVfTnMSHjal
X-Google-Smtp-Source: AGHT+IExD7KOIwp60ABVvZC51KGJUxkHICCIp6gpdohdZCSEaIoU6l2h4wvSvhZGHVi8H+Fsq8KURw==
X-Received: by 2002:a05:6a20:430f:b0:220:88f2:51a5 with SMTP id adf61e73a8af0-22597d0563bmr3567125637.18.1751609531468;
        Thu, 03 Jul 2025 23:12:11 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1d76:cc0:e1b1:8778:e58c? ([2001:c10:ff04:0:1000::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38f879d040sm91749a12.44.2025.07.03.23.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 23:12:11 -0700 (PDT)
From: Liangyan <liangyan.peng@bytedance.com>
X-Google-Original-From: Liangyan <liangyan.peng@google.com>
Message-ID: <dc4d14c5-1f04-47d7-b314-e4db62f57665@google.com>
Date: Fri, 4 Jul 2025 14:12:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH RFC] x86/kvm: Use native qspinlock by
 default when realtime hinted
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Bibo Mao <maobibo@loongson.cn>, pbonzini@redhat.com, vkuznets@redhat.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, wanpengli@tencent.com,
 linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org
References: <20250702064218.894-1-liangyan.peng@bytedance.com>
 <806e3449-a7b1-fa57-b220-b791428fb28b@loongson.cn>
 <8145bb17-8ba4-4d9d-a995-5f8b09db99c4@google.com>
 <aGVdykqnaUnPBkW-@char.us.oracle.com>
Content-Language: en-US
In-Reply-To: <aGVdykqnaUnPBkW-@char.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Find one AMD guest(AMD EPYC 9Y24 128-vCPU) to test, it seems about 9% 
improvement.

Command: ./Run -c 128 spawn

With virt spin lock:
System Benchmarks Partial Index   BASELINE       RESULT    INDEX
Process Creation                      126.0     120449.8   9559.5
                                                           ========
System Benchmarks Index Score (Partial Only                9559.5


With qspinlock:
System Benchmarks Partial Index   BASELINE       RESULT    INDEX
Process Creation                      126.0     131566.8  10441.8
                                                           ========
System Benchmarks Index Score (Partial Only)              10441.8



Regards,
Liangyan


On 2025/7/3 00:26, Konrad Rzeszutek Wilk wrote:
> On Wed, Jul 02, 2025 at 08:23:58PM +0800, Liangyan wrote:
>> We test that unixbench spawn has big improvement in Intel 8582c 120-CPU
>> guest vm if switch to qspinlock.
> 
> And ARM or AMD?
> 
>>
>> Command: ./Run -c 120 spawn
>>
>> Use virt_spin_lock:
>> System Benchmarks Partial Index   BASELINE       RESULT  INDEX
>> Process Creation                     126.0      71878.4   5704.6
>>                                                          ========
>> System Benchmarks Index Score (Partial Only)              5704.6
>>
>>
>> Use qspinlock:
>> System Benchmarks Partial Index   BASELINE       RESULT    INDEX
>> Process Creation                     126.0     173566.6  13775.1
>>                                                          ========
>> System Benchmarks Index Score (Partial Only              13775.1
>>
>>
>> Regards,
>> Liangyan
>>
>> On 2025/7/2 16:19, Bibo Mao wrote:
>>>
>>>
>>> On 2025/7/2 下午2:42, Liangyan wrote:
>>>> When KVM_HINTS_REALTIME is set and KVM_FEATURE_PV_UNHALT is clear,
>>>> currently guest will use virt_spin_lock.
>>>> Since KVM_HINTS_REALTIME is set, use native qspinlock should be safe
>>>> and have better performance than virt_spin_lock.
>>> Just be curious, do you have actual data where native qspinlock has
>>> better performance than virt_spin_lock()?
>>>
>>> By my understanding, qspinlock is not friendly with VM. When lock is
>>> released, it is acquired with one by one order in contending queue. If
>>> the first vCPU in contending queue is preempted, the other vCPUs can not
>>> get lock. On physical machine it is almost impossible that CPU
>>> contending lock is preempted.
>>>
>>> Regards
>>> Bibo Mao
>>>>
>>>> Signed-off-by: Liangyan <liangyan.peng@bytedance.com>
>>>> ---
>>>>    arch/x86/kernel/kvm.c | 18 +++++++++---------
>>>>    1 file changed, 9 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
>>>> index 921c1c783bc1..9080544a4007 100644
>>>> --- a/arch/x86/kernel/kvm.c
>>>> +++ b/arch/x86/kernel/kvm.c
>>>> @@ -1072,6 +1072,15 @@ static void kvm_wait(u8 *ptr, u8 val)
>>>>     */
>>>>    void __init kvm_spinlock_init(void)
>>>>    {
>>>> +    /*
>>>> +     * Disable PV spinlocks and use native qspinlock when dedicated
>>>> pCPUs
>>>> +     * are available.
>>>> +     */
>>>> +    if (kvm_para_has_hint(KVM_HINTS_REALTIME)) {
>>>> +        pr_info("PV spinlocks disabled with KVM_HINTS_REALTIME
>>>> hints\n");
>>>> +        goto out;
>>>> +    }
>>>> +
>>>>        /*
>>>>         * In case host doesn't support KVM_FEATURE_PV_UNHALT there is
>>>> still an
>>>>         * advantage of keeping virt_spin_lock_key enabled:
>>>> virt_spin_lock() is
>>>> @@ -1082,15 +1091,6 @@ void __init kvm_spinlock_init(void)
>>>>            return;
>>>>        }
>>>> -    /*
>>>> -     * Disable PV spinlocks and use native qspinlock when dedicated
>>>> pCPUs
>>>> -     * are available.
>>>> -     */
>>>> -    if (kvm_para_has_hint(KVM_HINTS_REALTIME)) {
>>>> -        pr_info("PV spinlocks disabled with KVM_HINTS_REALTIME
>>>> hints\n");
>>>> -        goto out;
>>>> -    }
>>>> -
>>>>        if (num_possible_cpus() == 1) {
>>>>            pr_info("PV spinlocks disabled, single CPU\n");
>>>>            goto out;
>>>>
>>>
>>
>>

