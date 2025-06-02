Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8634BA49
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892442; cv=none; b=QNHKf31VyvBHYpBkIxywOYGojd3MxMMI/LlKhebE3hRylOUZ1wk/mChuj/C4zQjNe5B5vCpryRh39KNGks2JWv5cAWzdQGt4Paj3mtoiEoNGrTm6r1E1orJRx9vp8pFId++VxX76rNgkcxiFGEQTiivEV6v0+9ZdoFRQVfLnwfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892442; c=relaxed/simple;
	bh=JYOVQfhsOQJXeKd0zuSCSvZ513ITfhb8GkvwC2HBqbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWbkgWEnUK5tg5GRUxjuovSTEz44/zVFNFDleK3vKV5fRIEDiliLgv2zWtRrIw0zubKrdCDKtqmOBAhvhEbMZGhq7/gqvb4M3ahb6LLjsCblmAOGPSl2/dtbOGI/eJAjRJeI6Ndkl6hGnutJ+WNE5g9YAbBJXzb0cXDKwnAARQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0A7VrCE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0A7VrCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748892441; x=1780428441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JYOVQfhsOQJXeKd0zuSCSvZ513ITfhb8GkvwC2HBqbs=;
  b=W0A7VrCEfuxaNc6LBGEXy5xiX54wBD/TaU2F9UQKVW8gV8aepdfWmjIq
   4TPfPYYyzDoEL/YEPn4QR8YEe/D+Jfbx4hYQBiU0N8bZOBeWyP+K568uA
   4AYyCU6kgNyCsOSPR6b4yV+WAfIvWnPbWvKBpATR/VSRs1tQiHxMrPspw
   EsY85JxW6UD9VKgLx0wHtkGPVd3UkfysfpRRCXODn2yKm6M+zXLiftUUu
   HdtZuXnU5JeWTLfh8GSFk7B574yf00NiBFWn/jFgKMuPByfHeYzBKlaAc
   zeXmagRL17bdJ1VeK4KNAYNLaM2RXkwj6GFmBb68ce3MdLTSVQDlXJP+6
   Q==;
X-CSE-ConnectionGUID: 4Oa/OUD+QZeEoKiDVuGDwg==
X-CSE-MsgGUID: s8vPp4MQRyKG6+X/3+QmyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62303560"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="62303560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 12:27:20 -0700
X-CSE-ConnectionGUID: YI1EvoA7SHG//vAEtndLnA==
X-CSE-MsgGUID: VHjpy6+WTAKubLH+g3LDmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="149628204"
Received: from enasrall-mobl1.amr.corp.intel.com (HELO desk) ([10.125.146.36])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 12:27:20 -0700
Date: Mon, 2 Jun 2025 12:27:14 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Khalid Ali <khaliidcaliy@gmail.com>, tglx@linutronix.de,
	peterz@infradead.org, jpoimboe@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, hpa@zytor.com
Subject: Re: [PATCH] kernel/cpu/bugs: log ltf1 mitigation status
Message-ID: <20250602192714.tfrchuks4jj47iuk@desk>
References: <20250602073732.734-1-khaliidcaliy@gmail.com>
 <20250602090942.GAaD1qVv5182lZSPtK@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602090942.GAaD1qVv5182lZSPtK@fat_crate.local>

On Mon, Jun 02, 2025 at 11:09:42AM +0200, Borislav Petkov wrote:
> On Mon, Jun 02, 2025 at 07:37:06AM +0000, Khalid Ali wrote:
> > Log the L1TF mitigation like other mitigatioons. This one is is the
> > only one that doesn't get logged.
> > 
> > Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
> > ---
> >  arch/x86/kernel/cpu/bugs.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> > index 7f94e6a5497d..38cb2a1b2849 100644
> > --- a/arch/x86/kernel/cpu/bugs.c
> > +++ b/arch/x86/kernel/cpu/bugs.c
> > @@ -2803,6 +2803,7 @@ static void __init l1tf_apply_mitigation(void)
> >  		return;
> >  	}
> >  
> > +	pr_info("Mitigation: PTE inversion\n");
> >  	setup_force_cpu_cap(X86_FEATURE_L1TF_PTEINV);
> >  }
> 
> Pawan, what's the story here?
> 
> There's this stuff further down in that file:
> 
> | #define L1TF_DEFAULT_MSG "Mitigation: PTE Inversion"
> |         
> | #if IS_ENABLED(CONFIG_KVM_INTEL)
> | static const char * const l1tf_vmx_states[] = {
> 
> which comes from 2018:
> 
> 72c6d2db64fa ("x86/litf: Introduce vmx status variable")

I don't know the back story, but L1TF does have too many KVM specific
modes. Probably thats why it is separate from the main mitigation. Also the
KVM part can be compiled out for CONFIG_KVM=n (although it is not a common
practice).

> I guess it is about time we made this mitigation also follow the common
> pattern with the mitigation strings and issuing them at the right time?

I will try to combine the KVM part with the main mitigation.
