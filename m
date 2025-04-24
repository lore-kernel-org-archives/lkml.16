Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083B92820D1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514464; cv=none; b=r5zkDRFcG2jbbtG6N+mFK2eeKIAw41lVcrFnPosjzpHM+Py0Ex/VzYiR6q/kmooVtCsW99qvLmuELBQoXbZchOHFNDvIe/4RXTgVAZpSgbgHwsVEuG78w+MweA7fxY4AcoTBFzVji2ZuAH7Lbv6e/pHKGpHAxpe2ZaX+aNiAqE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514464; c=relaxed/simple;
	bh=3Mb71N1HHQBg5V60dy6jE45PBJVPZjuhI2qEZlnROnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pjPAbwoolYhdUfuYHvH1MIvL9gvxXdyzgDxFAyxcAiGN8hPleoH+B8Aj1udkljzTK7LID+NZhwYovPg/DSdmaayerasKSqKZMUt8hhsJEp/n7LlfR6wkrrKWaV4TeCkuHCdHBTXB1M5NLkklNn0YYTmexJp3dHg2/4gY7B7JRyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1A661063;
	Thu, 24 Apr 2025 10:07:35 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64EC93F66E;
	Thu, 24 Apr 2025 10:07:39 -0700 (PDT)
Message-ID: <2d6bf83a-85ad-404a-b34f-c8777e373aaa@arm.com>
Date: Thu, 24 Apr 2025 18:07:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] cpumask: add cpumask_{first,next}_andnot() API
To: Yury Norov <yury.norov@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <20250407153856.133093-4-yury.norov@gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250407153856.133093-4-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yury,

On 07/04/2025 16:38, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> With the lack of the functions, client code has to abuse less efficient
> cpumask_nth().


> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 0f816092c891..9067c3411cd0 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h

> @@ -458,6 +490,33 @@ unsigned int cpumask_any_and_but(const struct cpumask *mask1,
>  	return cpumask_next_and(cpu, mask1, mask2);
>  }
>  
> +/**
> + * cpumask_andnot_any_but - pick an arbitrary cpu from *mask1 & ~*mask2, but not this one.
> + * @mask1: the first input cpumask
> + * @mask2: the second input cpumask
> + * @cpu: the cpu to ignore
> + *
> + * If @cpu == -1, the function returns the first matching cpu.
> + * Returns >= nr_cpu_ids if no cpus set.
> + */
> +static __always_inline
> +unsigned int cpumask_andnot_any_but(const struct cpumask *mask1,
> +				    const struct cpumask *mask2,
> +				    unsigned int cpu)

Nit: Shouldn't this be named cpumask_any_andnot_but()?
It's any cpu from the first-mask, then 'andnot' the second. This fits with the other
instances of this, e.g. cpumask_any_and_but().


> +{
> +	unsigned int i;
> +
> +	/* -1 is a legal arg here. */
> +	if (cpu != -1)
> +		cpumask_check(cpu);
> +
> +	i = cpumask_first_andnot(mask1, mask2);
> +	if (i != cpu)
> +		return i;
> +
> +	return cpumask_next_andnot(cpu, mask1, mask2);
> +}


Thanks,

James
