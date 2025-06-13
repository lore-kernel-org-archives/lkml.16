Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7A71C84BB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826488; cv=none; b=WhbxzAqPFewt6bQcOE+2N/rAVoqLgmUKoXOMV73hF2wDzaq7qW8P0hw+G2vY8J8XL6/DKWeTMRZ80lNYQm3syoRGtzO9gt2Cps93dj06CJBIIDxEQ0PbaOD2Bbs9MBxohtvNPK4ztRTqLHuN7MXFRluo/Nh91PNgkJcUy8DpNaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826488; c=relaxed/simple;
	bh=KlOZtFzzm6PfyrjqYCI+ew2XZogAweu4gTEHDHk+aT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNZELDgHN9q+GhZyKIP92TO5dpd+W7vgc/VQQGkQhAPelZqU8qJ4scFGNusSELnYNllI32rQ2C+NEUvmFR7zBR9Vp8Fh7FoPXMCZ+paFJresdnmE39n4oZr+GyiBHmWznhnxj+wNw1n9sOq2hVTJgLzryoBGI/KrmzWOOwZHya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nw+QO0Q7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nw+QO0Q7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749826487; x=1781362487;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KlOZtFzzm6PfyrjqYCI+ew2XZogAweu4gTEHDHk+aT8=;
  b=nw+QO0Q7zQUTKCa3idab9VHUshwUOVARhVN1e5rK/dSWJuzruXRNVwwI
   vEMH0iecva/007lHwqCQ+ATDaYZ1EkIaz2v8/f9BB6hcDnIe8rMUtJnH2
   qDJAEk7pKUb0QhPdVp/SMxhbJYNNrV6D4k3uZjZHEZK4IE6lNeBlnFH7N
   R30c65dSUoGMfiWXZPptjsqhZstUmbdTHD0H5AEQTyRz3BZ/xFYWsNKWf
   8Pf1JKmEIBuc+1Ie2IJVnalVwPWxT/alzqrLT1AjcJyuCTMg5sqdoMYgG
   /eD/HhQOPGomsH6DhakpDN4tVcuCyJh9XLfKZDwV39CtIKiTv6x5O2kfT
   w==;
X-CSE-ConnectionGUID: ogwElbsTTuCqARGfZJv76g==
X-CSE-MsgGUID: wAdkRKVQQLGcEEbiXkQTvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52192524"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="52192524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 07:54:46 -0700
X-CSE-ConnectionGUID: Pxh/EBSeQVaux7k8fdu20A==
X-CSE-MsgGUID: ROsQTaztR1WdTTnZcGsROQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148392590"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 07:54:46 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 6D06320B5736;
	Fri, 13 Jun 2025 07:54:44 -0700 (PDT)
Message-ID: <03cfdc36-a7b9-4098-bc21-cb612907add2@linux.intel.com>
Date: Fri, 13 Jun 2025 10:54:43 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/12] x86/fpu/xstate: Add xsaves_nmi
To: Dave Hansen <dave.hansen@intel.com>, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 dave.hansen@linux.intel.com, irogers@google.com, adrian.hunter@intel.com,
 jolsa@kernel.org, alexander.shishkin@linux.intel.com,
 linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-4-kan.liang@linux.intel.com>
 <c7bfcaf2-1669-4d6f-afb2-9bbcadfcde9e@intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <c7bfcaf2-1669-4d6f-afb2-9bbcadfcde9e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-13 10:39 a.m., Dave Hansen wrote:
> On 6/13/25 06:49, kan.liang@linux.intel.com wrote:
>> + * This function can only be invoked in an NMI. It returns the *ACTUAL*
>> + * register contents when the NMI hit.
> 
> Yes, but why is this important and what are the implications?
> 
> It's important because all of the other mechanisms that deal with xstate
> are _trying_ to get something coherent. They're trying to, for instance,
> poke at the PKRU register for userspace and we need to ensure that the
> PKRU value that's being targeted is for the right task and is actually
> in memory (if that's what we're after).
> 
> This interface is totally *in*coherent. There's no telling what was in
> the registers when the NMI hit. That seems crazy compared to all the
> other FPU code in the kernel. But it's actually OK for perf because
> there's a separate hardware mechanism that saves XSAVE-managed state off
> to memory. That mechanism also writes whatever was in the registers when
> the NMI hit. It's also completely incoherent.
> 
> That's really the only reason this insanity is OK. perf can _already_
> handle XSAVE "snapshots" from random code running. This just provides
> another XSAVE data source at a random time.
> 
> Could we get some of that ^ into the changelog and function comment, please?

Sure. Thanks for the details. I will add it in both the changelog and
function comments.

> 
> One other thing...
> 
> XSAVES uses the modified optimization. That means if you did something
> like this:
> 
> NMI=>
> 	xsaves_nmi();
> <=IRET
> ... run a little bit in the kernel
> NMI=> // another NMI
> 	xsaves_nmi();
> <=IRET
> 
> The second XSAVES might not actually write anything to the buffer
> because the registers didn't change (they weren't modified). Is that OK?

Yes. The per-cpu buffer in perf is only used by this XSAVES. No one will
clear it or modify it between the two xsaves_nmi().

Thanks,
Kan

