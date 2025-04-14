Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B108E289350
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651543; cv=none; b=c6qPtX47pRgToXZxQQhFsaqpIS0vO0xH6N2dcwgDR0+LCGfJ0JT4H1T63BuG8jGc/YDDu92qBfHpvUrLD6Q1LWUyRjErJHgSEFEdQCTE05HwTugUhR8RCPHMjUMX7UCkkstDNt0bkC44Xw99shiw+LU2pDVBmvElubPQOjrSpQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651543; c=relaxed/simple;
	bh=7peHC7zYTO6XiikoXfCmvidSlke+vRWvWj0OhDGgoTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELai85wX5K+ZaMbb2gHGpeuHQ+dDTD2q+FjOBXsYbJtC5d6Jg3tqnyJJS01p26AzLzmnGuesZIQXvN29bypZ6dODiyuj9xfiik7jHDgno6aSmhly6KxyzfkcejLGOOzWQSXS/3a92vqUQcmvWtoL5PpJ8dlSRlCMflRDoY/TCdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpfC2Klz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpfC2Klz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744651542; x=1776187542;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7peHC7zYTO6XiikoXfCmvidSlke+vRWvWj0OhDGgoTQ=;
  b=ZpfC2KlzQVOeZBX2g9biETN+Gj4EZkGN2+1eGpfWiUq4dSz+ucOH/X6n
   9Ydp+yDgiVOOHePuzVC8d/YoMFvKFKwQ2qlTdMRAtP3N0qQZq/L4GTC9k
   s7zuuDKAXF69/aAN7Cmv5NmBo4ESUdfK879nv+3Qr2InfSzjcyR34oE5G
   j2D62xYjN5lm+jQ4FaWatQQJQJpf9U0TYe1TJXQh0yXBaAYQcAPPMEz4a
   9nVQwT1xrepBM8fM4j0zrISUw8PBojO/3EuzL/4Zll8eUXEpPOSQ9Yyy9
   qsPle86JUFvv9gopnAaO1Zc3AobPFKftN147TzgT2HnYBU0eC0jbqlUwa
   A==;
X-CSE-ConnectionGUID: NiCzbA/nQPejq4kqp69eRw==
X-CSE-MsgGUID: yxbpqKlnS9mMlS0TdNBMfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45367195"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45367195"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:25:41 -0700
X-CSE-ConnectionGUID: biiimInsSaeAjb7YTn3ghw==
X-CSE-MsgGUID: 1muVOJmzSouWctWtSRVx9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130759208"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.124.222.39]) ([10.124.222.39])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:25:40 -0700
Message-ID: <8ebe6668-fb7b-49d5-90d4-348c276a7395@intel.com>
Date: Mon, 14 Apr 2025 10:25:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 7/9] x86/fpu/apx: Disallow conflicting MPX presence
To: Sohil Mehta <sohil.mehta@intel.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
References: <20250227184502.10288-1-chang.seok.bae@intel.com>
 <20250320234301.8342-1-chang.seok.bae@intel.com>
 <20250320234301.8342-8-chang.seok.bae@intel.com>
 <b18e4a00-c404-474c-8839-862f78125f37@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <b18e4a00-c404-474c-8839-862f78125f37@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/25 10:09, Sohil Mehta wrote:
> On 3/20/2025 4:42 PM, Chang S. Bae wrote:
>> APX is introduced as xstate component 19, following AMX. However, in the
>> non-compacted format, its offset overlaps with the space previously
>> occupied by the now-deprecated MPX:
>>
>>   45fc24e89b7c ("x86/mpx: remove MPX from arch/x86")
>>
> Would it be useful to describe why and how this is possible?

Every XSAVE state component is architecturally independent. There's no
architectural rule out there that says that state component offsets in
the non-compacted format must always go up or that they can't overlap.
But, there's never been an overlap like this before.

So this is technically allowed, but it's weird and it breaks some
internal assumptions that the kernel has.

Does that summarize it OK?

> My knowledge on this fairly limited, is it because the size of the APX
> register state is the same or less than the legacy MPX state?

Well, that was one reason the MPX location was _chosen_ for APX. Had APX
been bigger, it the MPX location would obviously not have been an
option. Had it been way smaller, using the MPX location would be OK.

> Also, what other options does the kernel have to handle this?

The kernel could _probably_ just disable the MPX states and favor using
APX. But, honestly, if this ever happens it's going to be because some
silly VMM is enumerating all the features it knows of and doesn't have
logic to make APX and MPX mutually exclusive.

In that case, we want the VMM to get fixed pronto, so papering over the
issue is not the best idea. Spitting out a warning and disabling XSAVE
but still booting sounds like a good balance of being annoying, but not
being _as_ annoying as a BUG_ON() or breaking the boot.
