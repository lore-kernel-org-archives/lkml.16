Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E21AAA1B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841306; cv=none; b=g0EzeE87vcEfx8ZLYyTSqCSf/FcIMbM1oBa0sQqtoDBlJdePZHH2ZVEuBVq/YU1Fx+Lqkhlj7Cljzf01S17ajwT43o9+kfmF83era2xF6Fxvcnr1iMt/whZGUMUKkNoAKWzZC7dhpgY5GU04L4ZR7iPXYtT2tLbiAh8ReRIWmKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841306; c=relaxed/simple;
	bh=+z86RSDec0qYkezODUVlCk6BWpT4zU4CzST6s1ksFbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rD2ORsW84YASxkKZqlbhI4TTwVuxCdoaMhHJPtYovoVGK1SuujLaJvGO+UQuODHVSNWOZAusBCEMwGlpe4V8Btq37plgO7DVJQWCXX86NRE/qFtIr8Ffn6+IL6UoxDh+jLhPopleGduXQ+BhAe5yCdyHF6b/F0NLlqTsygQ99mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdJmZnX0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdJmZnX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747841305; x=1779377305;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+z86RSDec0qYkezODUVlCk6BWpT4zU4CzST6s1ksFbE=;
  b=cdJmZnX0HWKQS1ARYqqqlvp7cjsdiqodNRAm45nbCmiuN1eKQkI9chBb
   G4v3GO2Vw+x8WY1ylMSZuxTLZgl2caMFQZuDYmMVe1RsvZpCpXoi0P5TR
   qkBt9tC9NZ2+2ri19vXAke0xQS3wHJb7ChIsDFnIzfS1Bv9USIz3Ou2a5
   0D8q1WjfwAnDI7ynXe1dPRVFHXMSnywUl9vX0R5Xeh4uPTZRzO3ZOLHOa
   tFX+zMEQzQxOz3W8smpSn9lIc47tOWiVScXv4yCH4sj74KVAzngTmFIek
   DQnJm6skNM4SkmKb5E6+HSQ1/LB67uC+nr1bFVAFlNPULX+LuKqX+5QTC
   g==;
X-CSE-ConnectionGUID: NS9yZuNQSa2qmoynYm4ArA==
X-CSE-MsgGUID: ILZQc9NCSWaXJ9eutWVcaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72344816"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="72344816"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 08:28:24 -0700
X-CSE-ConnectionGUID: 2ks/NKwoQEGj5bXuyKEKqA==
X-CSE-MsgGUID: y5+U2LApQFqPaXGjMmzNgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="141044428"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.109.100]) ([10.125.109.100])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 08:28:23 -0700
Message-ID: <036f8679-485a-4c99-92e7-f271a972fbf8@intel.com>
Date: Wed, 21 May 2025 08:28:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 6/9] x86/apic: Introduce Remote Action Request Operations
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, kernel-team@meta.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 nadav.amit@gmail.com, Rik van Riel <riel@fb.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-7-riel@surriel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250520010350.1740223-7-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index 0c1c68039d6f..1ab9f5fcac8a 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -40,6 +40,9 @@ struct smp_ops {
>  
>  	void (*send_call_func_ipi)(const struct cpumask *mask);
>  	void (*send_call_func_single_ipi)(int cpu);
> +
> +	void (*send_rar_ipi)(const struct cpumask *mask);
> +	void (*send_rar_single_ipi)(int cpu);
>  };

I assume Yu-cheng did it this way.

I'm curios why new smp_ops are needed for this, though. It's not like
there are a bunch of different implementations to pick between.


> -void native_send_call_func_ipi(const struct cpumask *mask)
> +static void do_native_send_ipi(const struct cpumask *mask, int vector)
>  {
>  	if (static_branch_likely(&apic_use_ipi_shorthand)) {
>  		unsigned int cpu = smp_processor_id();
> @@ -88,14 +88,19 @@ void native_send_call_func_ipi(const struct cpumask *mask)
>  			goto sendmask;
>  
>  		if (cpumask_test_cpu(cpu, mask))
> -			__apic_send_IPI_all(CALL_FUNCTION_VECTOR);
> +			__apic_send_IPI_all(vector);
>  		else if (num_online_cpus() > 1)
> -			__apic_send_IPI_allbutself(CALL_FUNCTION_VECTOR);
> +			__apic_send_IPI_allbutself(vector);
>  		return;
>  	}
>  
>  sendmask:
> -	__apic_send_IPI_mask(mask, CALL_FUNCTION_VECTOR);
> +	__apic_send_IPI_mask(mask, vector);
> +}
> +
> +void native_send_call_func_ipi(const struct cpumask *mask)
> +{
> +	do_native_send_ipi(mask, CALL_FUNCTION_VECTOR);
>  }

This refactoring probably belongs in a separate patch.

>  void apic_send_nmi_to_offline_cpu(unsigned int cpu)
> @@ -106,6 +111,16 @@ void apic_send_nmi_to_offline_cpu(unsigned int cpu)
>  		return;
>  	apic->send_IPI(cpu, NMI_VECTOR);
>  }
> +
> +void native_send_rar_single_ipi(int cpu)
> +{
> +	apic->send_IPI_mask(cpumask_of(cpu), RAR_VECTOR);
> +}
> +
> +void native_send_rar_ipi(const struct cpumask *mask)
> +{
> +	do_native_send_ipi(mask, RAR_VECTOR);
> +}
>  #endif /* CONFIG_SMP */
>  
>  static inline int __prepare_ICR2(unsigned int mask)
> diff --git a/arch/x86/kernel/apic/local.h b/arch/x86/kernel/apic/local.h
> index bdcf609eb283..833669174267 100644
> --- a/arch/x86/kernel/apic/local.h
> +++ b/arch/x86/kernel/apic/local.h
> @@ -38,6 +38,9 @@ static inline unsigned int __prepare_ICR(unsigned int shortcut, int vector,
>  	case NMI_VECTOR:
>  		icr |= APIC_DM_NMI;
>  		break;
> +	case RAR_VECTOR:
> +		icr |= APIC_DM_RAR;
> +		break;
>  	}
>  	return icr;
>  }
I feel like this patch is doing three separate things:

1. Adds smp_ops
2. Refactors native_send_call_func_ipi()
3. Adds RAR support

None of those are huge, but it would make a lot more sense to break
those out. I'm also still not sure of the point of the smp_ops.
