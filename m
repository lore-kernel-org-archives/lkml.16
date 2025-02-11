Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B8261594
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 19:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739300464; cv=none; b=lr47ouoJTEbMYt5fXq0zlAIm5r4hnQouxUSebSMdF7jSwaV/kgvbHVacNX5hojiEf3BhnrGwX9na24IvHF+xEso97IGYBbzVpBF9n+V/7YLgNfaJCKP0wX4GuFl/KaYY3bULVS1dhwmaSXDZKYwM26cabO6wm4osAicdaNcLsrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739300464; c=relaxed/simple;
	bh=xJY1l7mkl9e+tDuoobYS6iqBxRk9INdIqrt2bmIE/bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEZW/rVvR2S1bS/apfkcDb/tgAJEhA+DfruqRf9YlX6TF9VA5eReT9E6vcJWYxpjL3C+cVSaF39YteHEYgn9x2jVjVQqcWmYMGtD27H0ndApMamU3vG0EoRjjuFHZZON/TwH751W5vrpK7lrdhnQ1PBMA3jqfRa3O+rlQtCw/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8bcLqml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8bcLqml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C84C4CEDD;
	Tue, 11 Feb 2025 19:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739300464;
	bh=xJY1l7mkl9e+tDuoobYS6iqBxRk9INdIqrt2bmIE/bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8bcLqmlGR23OOhwcCxFIPMmPOYqiPjBzItRLk9XdmMfJgRLsnCKoyYJxaHcZ2WFn
	 rsTExoWr6Cs2uH2asYhSTqNHcSu94m6xDVH/aTRQ1rWA7yyfh6mqEzmR5Siw/uzpba
	 JdhK+kkfBntVc/7NudOZ0Wi0FmyQKIYEi0VS6+Mj82Ep0b8jcTuAxZqhS+8r5LbadQ
	 C1xl98roo4MjUkQio+o/bIHsdhJ6uiqsHsiSpiJHwUkRiYR0sWvkS1V4zc6KTW65RP
	 qf7oWDScRot9AQojRktzg//+BfkN17xRPi80tstkYcLWruVIp/feXPewJu56/Kr89y
	 VRcckXRvmiPhA==
Date: Tue, 11 Feb 2025 11:01:02 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 23/35] x86/bugs: Add attack vector controls for taa
Message-ID: <20250211190102.eociwspojygpucrk@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-24-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-24-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:25:03PM -0600, David Kaplan wrote:
> @@ -620,7 +624,8 @@ static void __init taa_apply_mitigation(void)
>  		 */
>  		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
>  
> -		if (taa_nosmt || cpu_mitigations_auto_nosmt())
> +		if (taa_nosmt || cpu_mitigations_auto_nosmt() ||
> +		    cpu_mitigate_attack_vector(CPU_MITIGATE_CROSS_THREAD))
>  			cpu_smt_disable(false);

There's a huge overlap between cpu_mitigations_auto_nosmt() and
CPU_MITIGATE_CROSS_THREAD.

IIUC, the main difference is that cpu_mitigations_auto_nosmt() selects
all the vectors whereas mitigate_cross_thread=on can be combined with
individual vectors.

Maybe we need a should_disable_smt() helper which checks both?

-- 
Josh
