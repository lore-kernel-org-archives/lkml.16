Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FB025A2DB
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739300043; cv=none; b=ujaYkatEJj/gGomj6NOzns8ntsRlID3w+478OaBGboCd203lwqXoeXtn4lFXM1H3rl0btasuP/SH6x/7vh/DoeB9QWQy6wEKO32hziaio4MpQfIkQuVt9wcxN1r6evCBhY9lYR6/wFb2P9+3Wyk/va8FfiP0uSl5rVRBF4I79aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739300043; c=relaxed/simple;
	bh=DKFr30ogLvo+/4sc/Ag2WKsX3/YgZYqejQoExYWh7gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JahV/3SCI3t4d8gsdmOt/N1PlgDk7RmfWQz+WCDrvCLgTqKj00RdAgUoBsF0IFFv5vuojiXKW94pv8ZKHUgPmxS7lhCUVADEv96FT9Mw6WtEcZ0U0P4BZH6PKQx0gvn+Kp7J/vFKv1B6V+prm2v6w4/HcIS1UTOrv1Rpr6lJSKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2JVMRqy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2JVMRqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D6DC4CEDD;
	Tue, 11 Feb 2025 18:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739300042;
	bh=DKFr30ogLvo+/4sc/Ag2WKsX3/YgZYqejQoExYWh7gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2JVMRqytl1IHJ9/UlyTgqK1siq7Fm1dAFEkmpIYf5c5SNrOvOE1Iw0eyx3XzIYAl
	 Q5jwiCorHQJZ1lHxbyLcHl5A/KzhI1fZufb4N4eXsYMhFHwf51gnoKalIa3LHI9CP8
	 vp+llYbKhipIxslNG9sZuvNtF1PMGUS2wJq+dCLO0i9kxejNAARNOgaQ5f2iSBmvq0
	 RiGh+MVxpI8mRmpMlnTjpvwHv++HHfiVedtVWhzADCpZRgPfE79jKL+yP6F+pxi4nj
	 0D2tj4FzRscGXBG5kfA3qOUbihWn57abdmDZKzrXPliJrdJr9ohJQERUVsgduDfpEv
	 u0ebc9vsWzs0Q==
Date: Tue, 11 Feb 2025 10:54:00 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 21/35] x86/bugs: Determine relevant vulnerabilities
 based on attack vector controls.
Message-ID: <20250211185400.vwu3tkqr4gc2r5tu@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-22-david.kaplan@amd.com>
 <20250211184130.2fl4jvdwd4e5y32a@jpoimboe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250211184130.2fl4jvdwd4e5y32a@jpoimboe>

On Tue, Feb 11, 2025 at 10:41:33AM -0800, Josh Poimboeuf wrote:
> I'm confused by CPU_MITIGATE_CROSS_THREAD here, as the GDS mitigation
> doesn't seem to disable SMT?
> 
> Am I just completely misunderstanding the meaning of
> CPU_MITIGATE_CROSS_THREAD?
> 
> I assumed it's not a vector per se, but rather it means to force nosmt
> if one of the other enabled mitigations requires doing so for its "full"
> mitigation.  But the implementation doesn't seem to match that.
> 
> On the other hand if it really is considered to be its own vector, that
> doesn't make sense either, as "cross-thread attack" is really a subset
> of each of the other vectors.  For example, a user->kernel attack can
> often be done either via syscall/irq or via cross-thread.
> 
> So I'm really confused.  Am I missing something?

So I looked at the next patch and now I see what I was missing: the
individual mitigations are checking
cpu_mitigate_attack_vector(CPU_MITIGATE_CROSS_THREAD) before deciding
whether to disable SMT.  So the implementation mostly makes sense now.

should_mitigate_vuln() should have a comment at the top explaining that
it doesn't check CPU_MITIGATE_CROSS_THREAD (since it's not actually a
standalone vector but rather dependent on the others) and that each
individual mitigation should check CPU_MITIGATE_CROSS_THREAD when
deciding whether to disable SMT.

Also, checking CPU_MITIGATE_CROSS_THREAD for GDS doesn't make sense
because as I mentioned above, "cross-thread" is really a subset of the
other vectors.  If the user isn't concerned about any of the other
attack vectors, mitigate_cross_thread=on should just be ignored.

I'm also thinking that "mitigate_cross_thread" isn't quite the right
name for it, as it really only relates to disabling SMT rather than
other cross-thread mitigations like STIBP.

So "mitigate_disable_smt" or "mitigate_nosmt"?

-- 
Josh
