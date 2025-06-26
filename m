Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFA2EB5C8
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948856; cv=none; b=MjdWfBQldLT16MlGLu1nUc2G019fUJRXGTI3JOUOWnqBh5Jpm2Lrccd1IwQqUfz3CO6V1UcJjka5tiJlfHsC05kS5WlXAvKdMd7hb2Y0W65fc/dP/tl+VLL9ceGy+QKwxIUf9rw3S2nn/zOzGWBYK8IflTyYQbt7pXgNsNXP0iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948856; c=relaxed/simple;
	bh=We0yPi4iW1QBd5k8H/+F07RiSET+Bh91Cn/vLT2VPtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWegDSs52sHVBIJ7tK5AYXBv1cUM8J7B36N2/SZt+HSGEl+X9JVLVWKF+RFcuXFq9Slqx75a2bWl510LAEVO4KXLYPIDNEX+/VZ1PcuTR3yrpX0aEDy6UEQ7H91uYsLKNR47teAlPJasPpsiAnmb7Zu4lozB8KWIYLaQtFzMQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eWv1OW82; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eWv1OW82"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+VJnhP1ZDqiXA8ePR33kMYc2RUpKx8geoz54YTdV0F4=; b=eWv1OW82poltdkQmKc2vKBM+XE
	40mMljXvEctf1k7d2u8g0WNjn0V8jBRo8vOGidfVU9QN7w//rWpbkfgngy2EZEC2pzoIWM2Cmvy7v
	VUwYh06u5G+c8BaYecl4NJowXKfMyKLzUJHqR4Mua76HQYf1ThIBk72quSOQbxxFlwNgBNhUosi8Z
	EDC2INJ3lYWyeZ2Rh18kqkg5cOY7b/lYGgYu5HRyt2vrJ75smWdqHMbg+1rkJdOW+cOXxydpRMpUj
	wWK5AvJjYa4ZDFIlLeAvTs5+nPryxSLZayHsgkE9OE4+IWoWF74pdJT3C2Ed78MWMJ8izqjSXIDG9
	g6YPRivQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnmS-0000000BpXM-1GfD;
	Thu, 26 Jun 2025 14:40:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 46E1430BDA9; Thu, 26 Jun 2025 16:40:47 +0200 (CEST)
Date: Thu, 26 Jun 2025 16:40:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] x86/bugs: Remove 'force' options for retbleed/ITS
Message-ID: <20250626144047.GN1613200@noisy.programming.kicks-ass.net>
References: <20250626142703.716997-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626142703.716997-1-david.kaplan@amd.com>

On Thu, Jun 26, 2025 at 09:27:03AM -0500, David Kaplan wrote:
> Command line options which force-enable a mitigation on an unaffected
> processor provide arguably no security value but do create the potential
> for problems due to the increased set of mitigation interactions.
> 
> For example, setting "indirect_target_selection=force" on an AMD
> Retbleed-affected CPU (e.g., Zen2) results in a configuration where the
> kernel reports that both ITS and Retbleed are mitigated, but Retbleed is
> not in fact mitigated.  In this configuration, untraining of the retbleed
> return thunk is enabled but the its_return_thunk is active, rendering the
> untraining ineffective.
> 
> It is wrong for the kernel to report that a bug is mitigated when it is
> not.  While this specific interaction could be directly fixed, the ability
> to force-enable these bugs creates unneeded complexity, so remove it.
> 
> If removing these options entirely is unacceptable, perhaps for
> compatibility reasons, another option could be to only allow forcing on the
> affected vendor (i.e., only allow forcing ITS on Intel CPUs), which would
> at least limit the potential interactions that need to be analyzed.
> Tagging as RFC to prompt discussion on this point.

Testing; I use these things for testing. Makes I don't have to run on
affected hardware, I can just force the feature on and inspect the code
and ensures it runs.

If you use force, you get to keep all pieces -- no warranties.
