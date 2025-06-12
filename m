Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3197023C50F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734357; cv=none; b=PSzwRXcZJQWHW+huNjEg0wRzNCcM0gHLU7SE4r2FQ/fAyzcZUQz8N4qY9ys87AlOIgnao77fK95mwzKjTBnR61iN6rof3zeGOrdpqME+IDmrkdwDiTaARW6lxJ8Vr2SAvW8P7eRFlVH0DKFRjNuIEKN644h3cwBLXsRSqYyvh2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734357; c=relaxed/simple;
	bh=X3yMqW5NajiTCPwKCTX9LI95bJ7bStTltxhhbzgLSqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5pRt+jRQmix/U0v1hnIOxvto8mcsdOKfiO6PjfLbhNVu9F88iQd2+q+YM1DZj7PFKzDvI2ld2PaRMb4ZDp8KZdWzmPtizZRlkTCcF2re8UwDfG7RAxrlXnsS5PhyCxLcy9ev3ZjAC7CjT9Gztu+xLHQe/CPurPS/Vf285ISJ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVLHLP7R; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVLHLP7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749734356; x=1781270356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X3yMqW5NajiTCPwKCTX9LI95bJ7bStTltxhhbzgLSqw=;
  b=dVLHLP7REQwiS+bIghJmOlt4vCywzEs3yM1byg05aNPYIsjf9Jse6lzb
   AzjjpnLaNQqCZakAmkGRIFHxJ7A2HWj/QUsMR/RcUlfhMhAI9peqaH/yU
   8sEkxM3UaWgUj6ztNKExniTfdg/Phek5ffBH27Z20SMdV0U0YiiGzeP9h
   4x2evW/FoNOoIFZovpNieyrTMzvQPqHNYjKG5eCOk887fC2BZsNkZ8Dga
   uQBsXwh1BObhYGP86Ae5k8D6kO3UuwkxXdVh0VTq4bsRJvfcXt08LnJyU
   HKrTBdtH9034lLws6q1o4uLdV17CbQUWa50YH71F8dr1tLahWpgsY+iJ+
   A==;
X-CSE-ConnectionGUID: j4Vh9IELQgadO40gGGOw4w==
X-CSE-MsgGUID: raBfGUL0Sp+xh5towyc3WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51625496"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="51625496"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:19:15 -0700
X-CSE-ConnectionGUID: +WNiAZPeTXy6eBVfB6RByQ==
X-CSE-MsgGUID: +6yN9PXWSxyb7l3v48rJew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="148421687"
Received: from dholevas-mobl1.amr.corp.intel.com (HELO desk) ([10.125.146.47])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:19:15 -0700
Date: Thu, 12 Jun 2025 06:19:09 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] x86/its: Warn when microcode is old
Message-ID: <20250612131909.saj4lq7dh2gqznyc@desk>
References: <20250611-its-warn-v1-1-02eb9a75ce9c@linux.intel.com>
 <112c84e8-4116-448d-9c6c-89b0312cfc01@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <112c84e8-4116-448d-9c6c-89b0312cfc01@intel.com>

On Wed, Jun 11, 2025 at 11:34:04PM -0700, Sohil Mehta wrote:
> On 6/11/2025 5:08 PM, Pawan Gupta wrote:
> > A microcode update is required for IBPB to be effective against ITS. On
> > Intel, X86_BUG_OLD_MICROCODE is set already when old microcode is detected.
> > In such a case system is tainted and a warning is issued.
> > 
> > Also warn that userspace could be vulnerable to ITS.
> > 
> > Suggested-by: Borislav Petkov <bp@alien8.de>
> > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > ---
> >  arch/x86/kernel/cpu/bugs.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> > index 7f94e6a5497d9a2d312a76095e48d6b364565777..7aa3ae00e6b4daa5e42217b66c50cd46d6bcc115 100644
> > --- a/arch/x86/kernel/cpu/bugs.c
> > +++ b/arch/x86/kernel/cpu/bugs.c
> > @@ -1427,6 +1427,10 @@ static void __init its_select_mitigation(void)
> >  		return;
> >  	}
> >  
> > +	/* For IBPB to be effective against ITS */
> > +	if (boot_cpu_has_bug(X86_BUG_OLD_MICROCODE))
> > +		pr_warn("Old microcode, userspace may be vulnerable to ITS\n");
> > +
> 
> Maybe I am missing something, but isn't "old" supposed to be an evolving
> thing? I am not sure how old microcode can reliably (always) translate
> to not effective against ITS.

Yes, "old" does not always means vulnerable. Looks like "... *may* be
vulnerable" is too subtle here.

> Can you please provide more context? I feel the warning could be
> misleading for userspace.

Since the ITS software mitigation does not depend on the microcode, there
is no enumeration. Hence, hitch-hiking on the existing X86_BUG_OLD_MICROCODE.

On a second thought, cpu_set_bug_bits() already issues a warning, and even
taints the kernel when old microcode is detected. So warning here seems
redundant, and also misleading as you said. I am okay dropping this patch.
