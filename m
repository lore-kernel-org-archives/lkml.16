Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0298254B14
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746829634; cv=none; b=qsrAArZsiYbKhDBRSeqd8mPUHChc+PEE0lRRvtRZrjBqTjXu0SliPCimF9wjeSWl+yUmfHPju1X0Tbt98NYBmnP8OnZMEg8B/QFHzjgPOWgMb5YL2U60eKFSAlQt+a2Dv6g8+oh28HiNqToqX+B1wJ37WQ1zU8QDYoSH05f9ejA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746829634; c=relaxed/simple;
	bh=yKsMUjLuGE3EkuKCU26HBOsw2KJoVDDc5eXnJCektgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClGHB5F5TRlYpVzcQ1IqcP8aORZaQ0e74KptzFpj2zkLc9oWiTn2e2kZrSBskdib0/Xt9m7QwzK5hDoQSxtDdW7QXtT1pas60aH8ASeQ8kDWx7jJjs7Xzin7Itx2q2bdwoLQ75cZQ6RidF3rjpTe5+eLse4oCg5UILHCJqimcqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PaPQgo3b; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PaPQgo3b"
Message-ID: <260a8c6a-f92f-41c8-a212-8f9f8ddf6b5b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746829628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jteVl+qSFnN6ueuKmbFExf6FzhNWgyq6s4G+Z3sYIiU=;
	b=PaPQgo3bkhPNazELJ9NUurbL3qAdnBDCM4rrLX089JO2lMY65sw7yCqZXRHmBesqO7f/3y
	LfpsLOI5NX6Bdx4UA8VAF/1JFUss+cvO+g7o3w1o5jSktrnZADu/9+aYXof68HipAsZDQa
	Ud0eqikeeTnxFGNBnXOEyoFRQc9FAKo=
Date: Fri, 9 May 2025 15:26:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V Guests
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
 <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com>
 <bc0f1273-d596-47dd-bcc6-be9894157828@linux.dev>
 <D9Q05T702L8Y.3UTLG7VXIFXOK@ventanamicro.com>
 <ec73105c-f359-4156-8285-b471e3521378@linux.dev>
 <D9QTOYMN362W.398FE9SQB0S4X@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <D9QTOYMN362W.398FE9SQB0S4X@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 5/8/25 6:45 AM, Radim Krčmář wrote:
> 2025-05-07T17:34:38-07:00, Atish Patra <atish.patra@linux.dev>:
>> On 5/7/25 7:36 AM, Radim Krčmář wrote:
>>> 2025-05-06T11:24:41-07:00, Atish Patra <atish.patra@linux.dev>:
>>>> On 5/6/25 2:24 AM, Radim Krčmář wrote:
>>>>> 2025-05-05T14:39:25-07:00, Atish Patra <atishp@rivosinc.com>:
>>>>>>                                                       This series extends
>>>>>> those to enable to correpsonding hstateen bits in PATCH1. The remaining
>>>>>> patches adds lazy enabling support of the other bits.
>>>>> The ISA has a peculiar design for hstateen/sstateen interaction:
>>>>>
>>>>>      For every bit in an hstateen CSR that is zero (whether read-only zero
>>>>>      or set to zero), the same bit appears as read-only zero in sstateen
>>>>>      when accessed in VS-mode.
>>>> Correct.
>>>>
>>>>> This means we must clear bit 63 in hstateen and trap on sstateen
>>>>> accesses if any of the sstateen bits are not supposed to be read-only 0
>>>>> to the guest while the hypervisor wants to have them as 0.
>>>> Currently, there are two bits in sstateen. FCSR and ZVT which are not
>>>> used anywhere in opensbi/Linux/KVM stack.
>>> True, I guess we can just make sure the current code can't by mistake
>>> lazily enable any of the bottom 32 hstateen bits and handle the case
>>> properly later.
>> I can update the cover letter and leave a comment about that.
>>
>> Do you want a additional check in sstateen
>> trap(kvm_riscv_vcpu_hstateen_enable_stateen)
>> to make sure that the new value doesn't have any bits set that is not
>> permitted by the hypervisor ?
> I wanted to prevent kvm_riscv_vcpu_hstateen_lazy_enable() from being
> able to modify the bottom 32 bits, because they are guest-visible and
> KVM does not handle them correctly -- it's an internal KVM error that
> should be made obvious to future programmers.

Sure. I will add something along those lines.


>>>> In case, we need to enable one of the bits in the future, does hypevisor
>>>> need to trap every sstateen access ?
>>> We need to trap sstateen accesses if the guest is supposed to be able to
>>> control a bit in sstateen, but the hypervisor wants to lazily enable
>>> that feature and sets 0 in hstateen until the first trap.
>> Yes. That's what PATCH 4 in this series does.
> I was thinking about the correct emulation.
>
> e.g. guest sets sstateen bit X to 1, but KVM wants to handle the feature
> X lazily, which means that hstateen bit X is 0.
> hstateen bit SE0 must be 0 in that case, because KVM must trap the guest
> access to bit X and properly emulate it.
> When the guest accesses a feature controlled by sstateen bit X, KVM will
> lazily enable the feature and then set sstateen and hstateen bit X.

Yeah. That's possible. The current series is just trying to trap & 
enable rather
than trap & emulate except for few AIA related bits which trap even with 
hstateen
bit set due to sw file instead of vsfile.

Once we have such requirement any other feature bit, we can extend the 
generic
trap & enable framework to trap & emulate.

