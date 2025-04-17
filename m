Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADD58462
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916177; cv=none; b=Ehe0A9qDYlVBCjBlFX4LaSK6B+FpEvZkXlE+2e32M1m2Sb1jQazcSfSyCFlwiC8ruyLfWKh2TJoTGn7pf1XKb4WNOl7Q5w6Nmsx5kyv8DBX7TMPrL5G0DniQn1XBywhFB51Ct3gyNoWmu4GCn/jZcaOcmR/icF+gFOmNNXm5otI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916177; c=relaxed/simple;
	bh=qSuSVLuGWlgMiW/GE3RipwumuohNOWO7Lf9YTrkxExg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AM4ROEPAaGZtC8OlPimlPhI8QntLtcqutUyx+Ehp3dvdUsrNFEFT/pDLKZizGlyHClePviEA3vWxDEZin+N774Ktez9+nBIHRn/uQjewVlxEuewWlMH9CECxu1DF/fRXzbpGDkn2abxIxfSL4xPensq9u4MRm6/P/ZLLUixkFY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vsz2EEab; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vsz2EEab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744916176; x=1776452176;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qSuSVLuGWlgMiW/GE3RipwumuohNOWO7Lf9YTrkxExg=;
  b=Vsz2EEabzouQazYX69l110x1w8VQAV2mk1sNyFZhMTbL3isjD0YfrI1b
   Ii00FQ36bEM5838vfwqxXnLj5zHOFjg7f+Zr8Lnt38qBOj+nmdQPRGpnv
   EHnNVsgbc7jEl2IkZr5XcaMdnwE37BtDXXAX9i19Ea/AKoFxmYYUhmczE
   s9KwnYNTyIaaoVNFuBqDXUrhtTz6IWYzSBBG0ZRUtBQvmZjBLqWXOBz1B
   /NX5OCV+omtXCHQV7vVAGOuewNhUHm+8D2bf4D5IkT16z9DsQH4HYW6vG
   /J7HUoOq+rqyqE3zoyI1SvrwEfnE0Yx8wgRR2I1FTwLTPuXE66EJfMB5W
   w==;
X-CSE-ConnectionGUID: pkLnhFeqS8q5RS2ZLdTcWQ==
X-CSE-MsgGUID: UWY4e94TQyWwZ7EC2AkMaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46538490"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46538490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:56:14 -0700
X-CSE-ConnectionGUID: AgMS0ykDQxyrQFo/lDeqXw==
X-CSE-MsgGUID: bV+IrRU3SOq5J0MkF46qHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130672768"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.223.169]) ([10.124.223.169])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:56:13 -0700
Message-ID: <31e17bc8-2e9e-4e93-a912-3d54826e59d0@intel.com>
Date: Thu, 17 Apr 2025 11:56:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at
 runtime
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "Huang, Kai" <kai.huang@intel.com>,
 "bp@alien8.de" <bp@alien8.de>
Cc: "ashish.kalra@amd.com" <ashish.kalra@amd.com>,
 "seanjc@google.com" <seanjc@google.com>, "x86@kernel.org" <x86@kernel.org>,
 "sagis@google.com" <sagis@google.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "Chatre, Reinette" <reinette.chatre@intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nik.borisov@suse.com" <nik.borisov@suse.com>
References: <20250416230259.97989-1-kai.huang@intel.com>
 <7bd03311-0c4c-41e6-b6dc-803b6455f170@intel.com>
 <ea0b0b1a842ad1fc209438c776f68ffb4ac17b9f.camel@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <ea0b0b1a842ad1fc209438c776f68ffb4ac17b9f.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 11:21, Edgecombe, Rick P wrote:
> On Thu, 2025-04-17 at 10:50 -0700, Dave Hansen wrote:
>> On 4/16/25 16:02, Kai Huang wrote:
>>> Full support for kexec on a TDX host would require complex work.
>>> The cache flushing required would need to happen while stopping
>>> remote CPUs, which would require changes to a fragile area of the
>>> kernel.
>>
>> Doesn't kexec already stop remote CPUs? Doesn't this boil down to a
>> WBINVD? How is that complex?
> 
> When SME added an SME-only WBINVD in stop_this_cpu() it caused a shutdown hang
> on some particular HW. It turns out there was an existing race that was made
> worse by the slower operation. It went through some attempts to fix it, and
> finally tglx patched it up with:
> 
>   1f5e7eb7868e ("x86/smp: Make stop_other_cpus() more robust")
> 
> But in that patch he said the fix "cannot plug all holes either". So while
> looking at doing the WBINVD for TDX kexec, I was advocating for giving this a
> harder look before building on top of it. The patches to add TDX kexec support
> made the WBINVD happen on all bare metal, not just TDX HW. So whatever races
> exist would be exposed to a much wider variety of HW than SME tested out.

I get it. Adding WBINVD to this same path caused some pain before. But
just turning off the feature that calls this path seems like overkill.

How about we try to push WBINVD out of this path? It should be quite
doable for TDX, I think.

Let's say we had a percpu bool. It get set when SME is enabled on the
system on each CPU. It also gets enabled when TDX is enabled. The kexec
code becomes:

-	if (SME)
+	if (per_cpu(newbool))
		wbinvd();

No TDX, no new wbinvd(). If SME, no change.

Now, here's where it gets fun. The bool can get _cleared_ after WBINVD
is executed on a CPU, at least on TDX systems. It then also needs to get
set after TDX might dirty a cacheline.

	TDCALL(); // dirties stuff
	per_cpu(newbool) = 1;

Then you can also do this on_each_cpu():

	wbinvd();
	per_cpu(newbool) = 0;

hopefully at point after you're sure no more TDCALLs are being made. If
you screw it up, no biggie: the kexec-time one will make up for it,
exposing TDX systems to the kexec timing bugs. But if the on_each_cpu()
thing works in the common case, you get no additional bug exposure.

>>> It would also require resetting TDX private pages, which is non-
>>> trivial since the core kernel does not track them.
>>
>> Why? The next kernel will just use KeyID-0 which will blast the old
>> pages away with no side effects... right?
> 
> I believe this is talking about support to work around the #MC errata. Another
> version of kexec TDX support used a KVM callback to have it reset all the TDX
> guest memory it knows about.

So, let's just not support hardware with that erratum upstream.

