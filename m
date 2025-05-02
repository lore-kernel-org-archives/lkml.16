Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40718194080;
	Fri,  2 May 2025 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746211741; cv=none; b=BWPLk8GR7oqSwC2SWghVfARxVa7kpdtcPYgXg9Z+v+F0lZqte+KKrj5EQ9aIHPA369lVfHsZRhP7Y9IbFG9C/OtpAQCVyZEW8mmFDghjMqe3qkTIbUvOQs3Vcn1YbUrx+88w3Mx3i0mexnjaJl1Sw7aOpgHpHtecFg1WQ3YB1J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746211741; c=relaxed/simple;
	bh=WMD/ZpJXQOOvEeURoC3nrQkO/gBhJRC+agPAI49lcNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldcEeuzLjsz8o24eOBaZtZq29wWQrKpzxxG/oh0bTDm9Fm1XeGFhuQTAc9VrHMzaWBTQJS9dMSlDcg4pr0LgE6WVGIU4PDq0BVkFLvqLgMyO0dt1aUQLordXWq7Jip7yedtVwQi9SzZ7sgtZ11m5fr0a6+/nA7IkqMWfCCYdci8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoH20NMq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoH20NMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746211739; x=1777747739;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WMD/ZpJXQOOvEeURoC3nrQkO/gBhJRC+agPAI49lcNk=;
  b=YoH20NMqL8UKmMQCNswzeZzJvjsE8mkKmptUZtLcTrzmRSy79cZ2DUqR
   cqYe5Qxe3/TVXzp9CsftzlkbPGTK92Yn3TY097A7YQ1p3T7aBAM040eBa
   t+72KRHgSzoJy9cmmUfZhOY/UKnIYBDKZDoFdF1FxxdrG2LyhBw4w3Nox
   74wB42HkasMe4dEAm2Ve1nSjBlgcJVsj/SgTEU6fs+OGFRclVcsCg5cvL
   LOTu8wOoW6L07WRLYjg5FdkxSr5Foxcu7AbexSPPizvktbTQySuwyB/tx
   VpE5LjDIQ/ddne2CFh+pqfGS+R/R7NkkA6JCN0ngFa9qcvrssRsdHZk9C
   w==;
X-CSE-ConnectionGUID: k3+o+N20QImciT8L4HWcJw==
X-CSE-MsgGUID: mvWTFVC2TwGglFWaAa8/TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="35519037"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="35519037"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 11:48:58 -0700
X-CSE-ConnectionGUID: mLsB7Ke5S/m3fnkWp6UCEw==
X-CSE-MsgGUID: pwkXt0gzRcWUAVnMnw+7cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="134664791"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.220.153]) ([10.124.220.153])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 11:48:57 -0700
Message-ID: <c348c507-c06b-4611-87f4-c498e144fa45@intel.com>
Date: Fri, 2 May 2025 11:48:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/18] x86/boot: make sure KASLR does not step over KHO
 preserved memory
To: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de,
 ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com,
 devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com,
 graf@amazon.com, hpa@zytor.com, jgowans@amazon.com,
 kexec@lists.infradead.org, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com,
 pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org,
 ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org,
 saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de,
 thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
References: <20250501225425.635167-1-changyuanl@google.com>
 <20250501225425.635167-15-changyuanl@google.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250501225425.635167-15-changyuanl@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/1/25 15:54, Changyuan Lyu wrote:
> KHO uses "scratch regions" to bootstrap a kexec'ed kernel. These regions are
> guaranteed to not have any memory that KHO would preserve.

I understand how these changelogs got written. They were written by
someone thinking *only* about KHO and hacking it into the existing code.
That's fine and understandable.

But everyone else is coming at this from the perspective of not knowing
what scratch memory is.

"Scratch memory" in the KHO world is basically "normal kernel memory" to
anybody else. So I think it's a disservice to everyone else reading
these changelogs to act like it's something special.

The thing that *is* special is that KHO kernels don't have a lot of
"normal kernel memory". At least they're designed to tolerate lots of
handed-off memory and little "scratch memory"

When you run through these again, could you please try to write these
changelogs and comments for folks that are not familiar with KHO?

> +/*
> + * If KHO is active, only process its scratch areas to ensure we are not
> + * stepping onto preserved memory.
> + */
> +#ifdef CONFIG_KEXEC_HANDOVER
> +static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
> +{

I thought we agreed to rework this to unconditionally define the
kho_scratch structures so the #ifdef can go away?

> +	struct kho_scratch *kho_scratch;
> +	struct setup_data *ptr;
> +	int i, nr_areas = 0;
> +
> +	ptr = (struct setup_data *)boot_params_ptr->hdr.setup_data;
> +	while (ptr) {
> +		if (ptr->type == SETUP_KEXEC_KHO) {
> +			struct kho_data *kho = (struct kho_data *)ptr->data;
> +
> +			kho_scratch = (void *)kho->scratch_addr;
> +			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
> +
> +			break;
> +		}
> +
> +		ptr = (struct setup_data *)ptr->next;
> +	}
> +
> +	if (!nr_areas)
> +		return false;
> +
> +	for (i = 0; i < nr_areas; i++) {
> +		struct kho_scratch *area = &kho_scratch[i];
> +		struct mem_vector region = {
> +			.start = area->addr,
> +			.size = area->size,
> +		};
> +
> +		if (process_mem_region(&region, minimum, image_size))
> +			break;
> +	}
> +
> +	return true;
> +}
> +#else
> +static inline bool process_kho_entries(unsigned long minimum,
> +				       unsigned long image_size)
> +{
> +	return false;
> +}
> +#endif
> +
>  static unsigned long find_random_phys_addr(unsigned long minimum,
>  					   unsigned long image_size)
>  {
> @@ -775,7 +824,8 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
>  		return 0;
>  	}
>  
> -	if (!process_efi_entries(minimum, image_size))
> +	if (!process_kho_entries(minimum, image_size) &&
> +	    !process_efi_entries(minimum, image_size))
>  		process_e820_entries(minimum, image_size);
>  
>  	phys_addr = slots_fetch_random();

I made a comment about this in the last round, making this the second
thing that I've noticed that was not addressed.

Could you please go back through the last round of comments before you
repost these?

Just to be clear: these are making progress, but they're not OK from the
x86 side yet.
