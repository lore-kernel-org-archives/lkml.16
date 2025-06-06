Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A71DDF5C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 00:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749169002; cv=none; b=p+RiOd5S5s4KMjm0u6T3HYp7mHmillV1xAr5QPc/goUbOsHvD6mA48m6HFUzFArnsh+tc3t8GMq+AOHZRgTNaCE4KOzcb0Jkf2vYY+N8i6YQ3X4/MPckUvP/paXzH2h1RhvSNw+kNWkg+O9x9X4O3jOkySohmzTfWEww9bieCCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749169002; c=relaxed/simple;
	bh=qBz0DAP8dAYLtjTcVjxkZ48FD+U+UYSQisUtfxn/zck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTrp6J3ogRWzGe8AjOb6vPnvcQ6ozFqBmJ4CfAdS2cy2XgWMN1gLEDyQ/xOFtVAMrbMx3Ppqv5FSP/qMAWxYkPan/uzLcB0wGn1nIlgYnhakfwuNc8R7cSxQJ8abxIf2u9Rm4AWFDNEWaINflrnnwz78/E63GKL9JElP7X4dbIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jOhpVxn4; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jOhpVxn4"
Message-ID: <ed5276d8-5169-47fc-bef2-bde7b8979e7e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749168988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+xPywf03yDNkYEegcXCgoSVQ8qSRx8kshKocy4LVVsM=;
	b=jOhpVxn4e1YZ6YRTUuacO44l3FJVVuTv6wv1IJDDzKnIXkBhX4W29RIyrnrXhS7TchjIa4
	gVVLMZ/Xjc1siqRtZxtV1k4yYPl5YHtL+DRDh0PkDHHJNiZNKEc1IiTlyNYL+OepkPTaOK
	g/0I8UWEEhM6ek3EHxaksSLp6Vo375I=
Date: Thu, 5 Jun 2025 17:16:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] RISC-V: KVM: Check
 kvm_riscv_vcpu_alloc_vector_context() return value
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605061458.196003-1-apatel@ventanamicro.com>
 <20250605061458.196003-4-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250605061458.196003-4-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/4/25 11:14 PM, Anup Patel wrote:
> The kvm_riscv_vcpu_alloc_vector_context() does return an error code
> upon failure so don't ignore this in kvm_arch_vcpu_create().

currently, kvm_riscv_vcpu_alloc_vector_context returns -ENOMEM only.

Do you have some plans to return different errors in the future ?

Otherwise, the code remains same before and after.

> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/vcpu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e0a01af426ff..6a1914b21ec3 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -148,8 +148,10 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   
>   	spin_lock_init(&vcpu->arch.reset_state.lock);
>   
> -	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
> -		return -ENOMEM;
> +	/* Setup VCPU vector context */
The function name is pretty self explanatory. So no need of this comment ?
> +	rc = kvm_riscv_vcpu_alloc_vector_context(vcpu);
> +	if (rc)
> +		return rc;
>   
>   	/* Setup VCPU timer */
>   	kvm_riscv_vcpu_timer_init(vcpu);
