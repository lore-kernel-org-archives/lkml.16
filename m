Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD72813AA53
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459048; cv=none; b=Rd9aWtwW9WZziJDY/e+kaHBWbW8QFVZNLssCPK8YybKtHCdCRoKLN4bW8wY5hiIvO0/4OXmZGJ4fLujjo2CGKx0CMFA0+Lc+dLIkAXxtyU8DHQ+uDKmbOCVHNWQn1MzI69Q3nV648nGT6ELuiNYvccH9XMfGWkqTIZaZDPy1tdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459048; c=relaxed/simple;
	bh=O1QOsfQKfSBvWRmSVxSzFdhWW+0snVjTcsBpLdZpgOo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WZf1CTQG/S1AnZwpfC/gKMjscd1PC+GOUHulCHF1lyhJMSq1xjhwtwmdpz8b9KzNcT2B3U+w0QnApGcqRePo2PKyODFVJfA38FywRB32MRsVAirIt71iYo648tUgaEY2/aI+JHN/vKbWvhfg50VMrN6pVcTYsdC97aPrKHC3uJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QyATK5xu; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QyATK5xu"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748f5a4a423so2710499b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751459046; x=1752063846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZZQ0b9PR4kHg3DyEsxDVtoWqZbIHgud0yNfUX8vIa0=;
        b=QyATK5xuvBU8dCSgFiYMeERp70YYyC4IIGC7+PHi7bYltCoNCdaogk68pLRG8jEtr/
         4J3agww+4THUTs9qVsFKZKTzhfu8Z9kBXa5glKAz7Q0d/Mfn7RfTQzdBfojBz45N4nCu
         aDAx/7wuVMC2rDhX2ur0uLntwdELLrGB2YrOcdRiuHAohwogv66KAyHc3HFvD20CIzyP
         nzqPyFE5vWvthpKTxPQizgvMFOQUvbQOfIvYpeazzstn5THEqcqJufM7+tcB59fvGz0d
         Sa5A/dZn7eIpGoJ+G4x8nkIaKuz8dPKOTx/2BwyJ/MGwpLdwSqNfys9lDpLgEyABM6EM
         ZSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459046; x=1752063846;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZZQ0b9PR4kHg3DyEsxDVtoWqZbIHgud0yNfUX8vIa0=;
        b=tBs6u45g1OyvMUaKbrxRYAbOLWi6t8P7ZzKAnVWqzIUDJtrXJnX4xYv3pNAw47iduY
         rLeXSGeBR05oblUk4UhbY2roDujROPlqsmfVDBU2B/QNG0PyR3soTe6wTzhl0ChXbk72
         gbUeJyEP8xNH2bdEE9M+3d8bcWW33Q93nKoEQbNtik/GCyLfFpnQeEf3rRtSoXuJr+8H
         VriCsSHbqcTUzUIf+7owY89fz2FWiiikEx38qFKDV+zuKU5XoD8vUT2/qymWX5TXV7SR
         D+BktCn1TIRtAfKN+4pdZ8pepN+Qn3bI4vBxKsLax4Yb8OX4kgE5N3X4LPEsyI1pBk2Q
         EJVw==
X-Gm-Message-State: AOJu0YyF3vV94gSGEiMTUoqb5O8nIQnP+5LAgYkVvnXwBm56/1Ykf/eX
	gh/KuL5HhryqFgw+lzdBp1t7MjDLCRd/rWrY5FDk9x7cpmIkMx8UwSrW9GK7r/uOPo4=
X-Gm-Gg: ASbGnctEXDaDwi9dLAUIhR1i6z+u0D2Y2lg8fz5YT4nicD5WuiWg2atA0LwVerq+UhD
	0FySGDskfSiiFedH4TAdid+pYox+T+J5sbn63Z/KoqIy1VE7WsSA6LOh3b8Zr8TbOT5Rt9ijWRP
	wc9OHDeWg4pqOxexoRmMnjkKlLrztBVa+PuJsYJcHbOnmNOngCiHEfqf//3pFa0AuJWRgULuqMz
	z/tIHulS8k8SpOepi0CAzFScZyZ4WyflS6xxRQBRdtY9rY6ERlgrNIudBeXlKP7gvLBccVsmCGo
	iM+i4KsV2kFb1R1LUd24YdGFO1Ai/pIf///udzuP9IvaHtLfCX7iq3uJvHkA9kkvzPSbkv7GJCO
	McumRJRLzi+rwQBzf494g7ZnZPwSoFSAFc9zN
X-Google-Smtp-Source: AGHT+IETkeRfDcmNB9+WEm2yGsnJ6OgHgpRfUmc69FAO+OZBAHjIaiAqF+dsmTgGpCmrfOlIUgPTQA==
X-Received: by 2002:a05:6a21:48d:b0:21f:5aa1:3124 with SMTP id adf61e73a8af0-222d7df0870mr5638079637.13.1751459046175;
        Wed, 02 Jul 2025 05:24:06 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1d76:cc0:e1b1:8778:e58c? ([2001:c10:ff04:0:1000::8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31beab2sm13027706a12.47.2025.07.02.05.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:24:05 -0700 (PDT)
From: Liangyan <liangyan.peng@bytedance.com>
X-Google-Original-From: Liangyan <liangyan.peng@google.com>
Message-ID: <8145bb17-8ba4-4d9d-a995-5f8b09db99c4@google.com>
Date: Wed, 2 Jul 2025 20:23:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [RFC] x86/kvm: Use native qspinlock by default
 when realtime hinted
To: Bibo Mao <maobibo@loongson.cn>, Liangyan <liangyan.peng@bytedance.com>,
 pbonzini@redhat.com, vkuznets@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 wanpengli@tencent.com
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org
References: <20250702064218.894-1-liangyan.peng@bytedance.com>
 <806e3449-a7b1-fa57-b220-b791428fb28b@loongson.cn>
Content-Language: en-US
In-Reply-To: <806e3449-a7b1-fa57-b220-b791428fb28b@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

We test that unixbench spawn has big improvement in Intel 8582c 120-CPU 
guest vm if switch to qspinlock.

Command: ./Run -c 120 spawn

Use virt_spin_lock:
System Benchmarks Partial Index   BASELINE       RESULT  INDEX
Process Creation                     126.0      71878.4   5704.6
                                                         ========
System Benchmarks Index Score (Partial Only)              5704.6


Use qspinlock:
System Benchmarks Partial Index   BASELINE       RESULT    INDEX
Process Creation                     126.0     173566.6  13775.1
                                                         ========
System Benchmarks Index Score (Partial Only              13775.1


Regards,
Liangyan

On 2025/7/2 16:19, Bibo Mao wrote:
> 
> 
> On 2025/7/2 下午2:42, Liangyan wrote:
>> When KVM_HINTS_REALTIME is set and KVM_FEATURE_PV_UNHALT is clear,
>> currently guest will use virt_spin_lock.
>> Since KVM_HINTS_REALTIME is set, use native qspinlock should be safe
>> and have better performance than virt_spin_lock.
> Just be curious, do you have actual data where native qspinlock has 
> better performance than virt_spin_lock()?
> 
> By my understanding, qspinlock is not friendly with VM. When lock is 
> released, it is acquired with one by one order in contending queue. If 
> the first vCPU in contending queue is preempted, the other vCPUs can not 
> get lock. On physical machine it is almost impossible that CPU 
> contending lock is preempted.
> 
> Regards
> Bibo Mao
>>
>> Signed-off-by: Liangyan <liangyan.peng@bytedance.com>
>> ---
>>   arch/x86/kernel/kvm.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
>> index 921c1c783bc1..9080544a4007 100644
>> --- a/arch/x86/kernel/kvm.c
>> +++ b/arch/x86/kernel/kvm.c
>> @@ -1072,6 +1072,15 @@ static void kvm_wait(u8 *ptr, u8 val)
>>    */
>>   void __init kvm_spinlock_init(void)
>>   {
>> +    /*
>> +     * Disable PV spinlocks and use native qspinlock when dedicated 
>> pCPUs
>> +     * are available.
>> +     */
>> +    if (kvm_para_has_hint(KVM_HINTS_REALTIME)) {
>> +        pr_info("PV spinlocks disabled with KVM_HINTS_REALTIME 
>> hints\n");
>> +        goto out;
>> +    }
>> +
>>       /*
>>        * In case host doesn't support KVM_FEATURE_PV_UNHALT there is 
>> still an
>>        * advantage of keeping virt_spin_lock_key enabled: 
>> virt_spin_lock() is
>> @@ -1082,15 +1091,6 @@ void __init kvm_spinlock_init(void)
>>           return;
>>       }
>> -    /*
>> -     * Disable PV spinlocks and use native qspinlock when dedicated 
>> pCPUs
>> -     * are available.
>> -     */
>> -    if (kvm_para_has_hint(KVM_HINTS_REALTIME)) {
>> -        pr_info("PV spinlocks disabled with KVM_HINTS_REALTIME 
>> hints\n");
>> -        goto out;
>> -    }
>> -
>>       if (num_possible_cpus() == 1) {
>>           pr_info("PV spinlocks disabled, single CPU\n");
>>           goto out;
>>
> 

