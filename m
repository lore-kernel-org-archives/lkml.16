Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CC7279799
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699002; cv=none; b=Vrj30zOj0qn4iD6yQuKpg6JyUVOPapef7HebRC8IcU8Y4ymQEl4B1vf5Ai1dx2OoIN8T2yB33GF7FW/NN0tV40hVZ9bt0Qh06GkguiJWx+rlMM8k48FEZZhKRUuH6cTmCMKCSlYLLQbu0Eh9QvfxEjCvMsFLDAowHSSC10mY7w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699002; c=relaxed/simple;
	bh=0w1mAf0KNTYZjdmbTaPxEL5sNssyvZfwmOjdvquXwJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBZlScEa0ntDpH8YX5ICYymP7RAyxqrVK9bBvwe4IMLdplowhHe4zTawxOyfYqFNn/Rw3uplpsikoXAoBTqtyiqG3ac/MXzmUTYxFapwbAZOnIfYAMt1juYoIrPxOx0L+zuon0IWm2u7w7gvvA6zssA8DKteFctgwN+UoEoSgk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEFA415A1;
	Mon, 14 Apr 2025 23:36:37 -0700 (PDT)
Received: from [10.163.49.104] (unknown [10.163.49.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00C033F694;
	Mon, 14 Apr 2025 23:36:34 -0700 (PDT)
Message-ID: <f998cbba-bda0-472b-8f4a-a972a29f21ef@arm.com>
Date: Tue, 15 Apr 2025 12:06:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: kvm: Replace ternary flags with str_on_off()
 helper
To: Seongsu Park <sgsu.park@samsung.com>, will@kernel.org,
 catalin.marinas@arm.com, yuzenghui@huawei.com, suzuki.poulose@arm.com,
 joey.gouly@arm.com, oliver.upton@linux.dev, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, cpgs@samsung.com
References: <CGME20250415012410epcas1p42b48977934c21b5db0b19f4185f7a63c@epcas1p4.samsung.com>
 <1891546521.01744691102904.JavaMail.epsvc@epcpadp1new>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <1891546521.01744691102904.JavaMail.epsvc@epcpadp1new>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/15/25 06:54, Seongsu Park wrote:
> Replace repetitive ternary expressions with the str_on_off() helper
> function. This change improves code readability and ensures consistency
> in tracepoint string formatting
> 
> Signed-off-by: Seongsu Park <sgsu.park@samsung.com>
> ---
>  arch/arm64/kvm/trace_arm.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/trace_arm.h b/arch/arm64/kvm/trace_arm.h
> index c18c1a95831e..9c60f6465c78 100644
> --- a/arch/arm64/kvm/trace_arm.h
> +++ b/arch/arm64/kvm/trace_arm.h
> @@ -176,7 +176,7 @@ TRACE_EVENT(kvm_set_way_flush,
>  	    ),
>  
>  	    TP_printk("S/W flush at 0x%016lx (cache %s)",
> -		      __entry->vcpu_pc, __entry->cache ? "on" : "off")
> +		      __entry->vcpu_pc, str_on_off(__entry->cache))
>  );
>  
>  TRACE_EVENT(kvm_toggle_cache,
> @@ -196,8 +196,8 @@ TRACE_EVENT(kvm_toggle_cache,
>  	    ),
>  
>  	    TP_printk("VM op at 0x%016lx (cache was %s, now %s)",
> -		      __entry->vcpu_pc, __entry->was ? "on" : "off",
> -		      __entry->now ? "on" : "off")
> +		      __entry->vcpu_pc, str_on_off(__entry->was),
> +		      str_on_off(__entry->now))
>  );
>  
>  /*

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
