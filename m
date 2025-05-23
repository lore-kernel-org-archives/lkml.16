Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C891B4139
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020583; cv=none; b=ZakBsjv7GIWQaWpyn6iGZnfp9aEwrLAMY3ObtJp/VYxNhzZgJQtzyu8u3cO/9urgOn3xADl936F1XYjwv0ttTWxgjtMMYlSjL0l7Z7q3dE9o7YMA9KtiUTgMO8VOm8k08yVJsymg/ZPcFWrzZMLGJ7COrthUO3E5S0GKMFTdL3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020583; c=relaxed/simple;
	bh=Drp5lZRk4LA7SqjWH3KK6QjUHA5tD8wxZElSKSZPax4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fb7V4norVSjFFINbEpFNaw94WO3ArwsMf4YkaV50MBdmc5XXmRErkMarXvvMw0mmerSssIhDmK8wfF6cJ6U8n8otf7YZ5w6x/7JhCyV0cVUfnAEQI0KZ/Ze2HPVJEfnyV0v1DMyT6I52EKHxS4PvfiAhDBiU0ovKkUOMYIgKE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p4ygCmn0; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p4ygCmn0"
Message-ID: <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748020578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwSnBgPFez8PLTovNHh7DO/HqAHVQL0w4mtppSLYja0=;
	b=p4ygCmn0/SgSUw/j+FUlcInOw5bcP3qQpAP+WTRtVHCq8zqDVxfsG3vreS7WCBAJhRjcTY
	CNS0wuI2Zor/NqLA6i4HP+ByVNwTy/KZWyPRvH4hhejZLNvTG/9jo7xnLQXl37V2+/wL9Q
	eok6kr9D3cEhlTaruAu9Wmz5VZIJWYI=
Date: Fri, 23 May 2025 10:16:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 5/23/25 6:31 AM, Radim Krčmář wrote:
> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
>> Upgrade the SBI version to v3.0 so that corresponding features
>> can be enabled in the guest.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> -#define KVM_SBI_VERSION_MAJOR 2
>> +#define KVM_SBI_VERSION_MAJOR 3
> I think it's time to add versioning to KVM SBI implementation.
> Userspace should be able to select the desired SBI version and KVM would
> tell the guest that newer features are not supported.

We can achieve that through onereg interface by disabling individual SBI 
extensions.
We can extend the existing onereg interface to disable a specific SBI 
version directly
instead of individual ones to save those IOCTL as well.

> We could somewhat get away with the userspace_sbi patch I posted,
> because userspace would at least be in control of the SBI version, but
> it would still be incorrect without a KVM enforcement, because a
> misbehaving guest could use features that should not be supported.
