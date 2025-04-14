Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9FA26AAB9;
	Mon, 14 Apr 2025 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744627298; cv=none; b=bAfT33y9wm4I4I42NKTjkfjfD/YqI7hV/o80ZJ1TeajSLvrNz9NJv5LeUhDbUCr/pzvtJLlorQsEg7H631/3DXgiBjZqa1aqNLVuVsNv5t25zRsKoDNNYOVgTb71AfwM6cGg9HVl5b8XFhwtt3wAF/L0+3t+dYiRWk/hcMeiey0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744627298; c=relaxed/simple;
	bh=LgaIia1gAbW4kWBF8RDgTao5z/bNP5mRElJSSodgg1w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DqJhxc5C0cONc8wV33CzHmDzB9FrFJqUy/cpy9WDbZSXpUD6I7WgKJZeF53SGib4K6xO/wqa/69DpgtY79CeSMK9Cy45BXJXII6vZ58WZdnPSVOzrJmlFujNUnKtN39REBxNt4CWQI8I6uYsFYblK/o+mH6ufjTLmI33nWkL2xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOdVY4ov; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOdVY4ov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744627297; x=1776163297;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LgaIia1gAbW4kWBF8RDgTao5z/bNP5mRElJSSodgg1w=;
  b=JOdVY4ovDJNYvSO62zh+CvwaX0VlHJsBOOPEfBAazkd9O/agdf9DezvX
   8Wg+UxpV7e5PEZtOEsLea0r830SKw7zddf/irthIqplvBZU94aDE6dS4O
   T0I2oHeZijXL+rw2ykwWR1p7qIkHcG9uBgIpWTNX5k/AVWq4a0/LE757w
   m65knMwr4wq++93Mf3d0lkan6/NXmxkF4mT1CW3k+WpdURz7iAxxXmIFU
   7q3r8fOUqLIT7BPNogzi2AdT0PDYoK8X6AILj6SDQETC/ZdyBKKioNTVp
   b0IrHZ8gOhKFPnPrxvrJxunNsxpXtZ6GexgBi3iyFuMGRusvOnmrrQljQ
   A==;
X-CSE-ConnectionGUID: tVd1WkTZQ82JXjTDBpuwTw==
X-CSE-MsgGUID: hX0JgJyrSHyFhVZrVYeSXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="63492962"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="63492962"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:41:36 -0700
X-CSE-ConnectionGUID: kToh/TFGQZy3Vj//OQuNuA==
X-CSE-MsgGUID: Hb9UphaXQpGxJRQ+HldyqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130638215"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:41:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 14 Apr 2025 13:41:31 +0300 (EEST)
To: shouyeliu <shouyeliu@gmail.com>
cc: srinivas.pandruvada@linux.intel.com, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: fix inconsistent state
 on init failure
In-Reply-To: <20250414092132.40369-1-shouyeliu@gmail.com>
Message-ID: <1feb5888-5ec8-67aa-9775-e1bea6b8b9fe@linux.intel.com>
References: <20250414092132.40369-1-shouyeliu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Apr 2025, shouyeliu wrote:

> When uncore_event_cpu_online() fails to initialize a control CPU (e.g.,
> due to memory allocation failure or uncore_freq_add_entry() errors),
> the code leaves stale entries in uncore_cpu_mask after that online CPU
> will not try to call uncore_freq_add_entry, resulting in no sys interface.

Please add () after any name that refers to a C function (you're not even 
being consistent here as you had it in some cases but not here).

Please try to split the very long sentence a bit and make it more obvious 
what causes what as the current wording is a bit vague, did you mean: 
uncore_event_cpu_online() will not call uncore_freq_add_entry() for
another CPU that is being onlined or something along those lines?

Will this change work/matter? Documentation/core-api/cpu_hotplug.rst says 
about cpuhp_setup_state():

"If a callback fails for CPU N then the teardown callback for CPU
 0 .. N-1 is invoked to rollback the operation. The state setup fails,
 the callbacks for the state are not installed and in case of dynamic
 allocation the allocated state is freed."

> 

Fixes tag?

> Signed-off-by: shouyeliu <shouyeliu@gmail.com>

The correct format for tags is documented in 
Documentation/process/5.Posting.rst:

tag: Full Name <email address>

> ---
>  .../x86/intel/uncore-frequency/uncore-frequency.c    | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> index 40bbf8e45fa4..1de0a4a9d6cd 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> @@ -146,15 +146,13 @@ static int uncore_event_cpu_online(unsigned int cpu)
>  {
>  	struct uncore_data *data;
>  	int target;
> +	int ret;
>  
>  	/* Check if there is an online cpu in the package for uncore MSR */
>  	target = cpumask_any_and(&uncore_cpu_mask, topology_die_cpumask(cpu));
>  	if (target < nr_cpu_ids)
>  		return 0;
>  
> -	/* Use this CPU on this die as a control CPU */
> -	cpumask_set_cpu(cpu, &uncore_cpu_mask);
> -
>  	data = uncore_get_instance(cpu);
>  	if (!data)
>  		return 0;
> @@ -163,7 +161,13 @@ static int uncore_event_cpu_online(unsigned int cpu)
>  	data->die_id = topology_die_id(cpu);
>  	data->domain_id = UNCORE_DOMAIN_ID_INVALID;
>  
> -	return uncore_freq_add_entry(data, cpu);
> +	ret = uncore_freq_add_entry(data, cpu);
> +	if (!ret) {
> +		/* Use this CPU on this die as a control CPU */
> +		cpumask_set_cpu(cpu, &uncore_cpu_mask);
> +	}
> +
> +	return ret;

Please reverse to logic such that you return early on error, which is the 
usual error handling pattern.

>  }
>  
>  static int uncore_event_cpu_offline(unsigned int cpu)
> 

-- 
 i.

