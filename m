Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C09262D14
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 19:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301455; cv=none; b=BKcHtb0CWnqU3T8T0YrC1m17ssTYbJah6Z3HQDkOeYu/eL5R/D8b6BaXf8+maCY7bjuWk2OrntQoLqosdvN6axDxK2fXjcdUx1yx5BKaRQYJqoC9/fFE/ILPM9yLzU/+1g3E5sv7zdF2yN3oOV9maDwIINBCA1sm48rwCzKHWiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301455; c=relaxed/simple;
	bh=R4IoKkTFSP3XaWfh6jn42r1rdQmKvj5dPYpfCDY1QgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1X2Doatz3JocgxIem5FMeNW+C0rLl8jiolKDPb2Lgplo47lb2ok6ukavXqv/OvZwkgvwxP+KGN+2Ur9M0RvcNopamiD+o0bmiwHsUAcAHGPoN46ffA9Sjs8qj9OPempcHOQ1YkslJuLNRWE92V02NDSD0gPHXuTJoqc2WvLWrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEC4ajmT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEC4ajmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F854C4CEDD;
	Tue, 11 Feb 2025 19:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739301454;
	bh=R4IoKkTFSP3XaWfh6jn42r1rdQmKvj5dPYpfCDY1QgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PEC4ajmTyDJ6LQVKhdqnZrwKnqyVDmmKEXPjw7hY0grfjfaT87+DPETKLsr5DFP3b
	 Q8EM8iisc27AcyrCg6D0BkkV8KyYIElrhROsj2XUqPGju2J/ri6XDg6HhpFbwfQz/C
	 R7Lrx4WCQNbY/64YRzQAuFXjJDQ/U66N49tMzAMZhWz+sa7AtoeNb9bS8Lq7zumtEh
	 YoqzhHVeaTx+XUUu72+nW3s+5y18goja7Chl73juF5Q7rRmLWYu3m9smZHHZzyPj7w
	 nTR+KRZe5ngLkKZLjQ1l+SwumCW+hYFbWQPjExieEHYlqY55imp5+EFgOF9LpcRvp8
	 /Czzuzgv1fW0g==
Date: Tue, 11 Feb 2025 11:17:32 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 05/35] x86/bugs: Restructure taa mitigation
Message-ID: <20250211191732.7bnnn3zbbnrxvwhn@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-6-david.kaplan@amd.com>
 <20250210225016.cosuartrzzuaftqf@jpoimboe>
 <LV3PR12MB9265E7765694B3755E924F8494FD2@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB9265E7765694B3755E924F8494FD2@LV3PR12MB9265.namprd12.prod.outlook.com>

On Tue, Feb 11, 2025 at 05:17:15PM +0000, Kaplan, David wrote:
> > On Wed, Jan 08, 2025 at 02:24:45PM -0600, David Kaplan wrote:
> > > @@ -400,48 +402,71 @@ static void __init taa_select_mitigation(void)
> > >               return;
> > >       }
> > >
> > > -     if (cpu_mitigations_off()) {
> > > +     if (cpu_mitigations_off())
> > >               taa_mitigation = TAA_MITIGATION_OFF;
> > > -             return;
> > > -     }
> > >
> > >       /*
> > >        * TAA mitigation via VERW is turned off if both
> > >        * tsx_async_abort=off and mds=off are specified.
> > > +      *
> > > +      * MDS mitigation will be checked in taa_update_mitigation().
> > >        */
> > > -     if (taa_mitigation == TAA_MITIGATION_OFF &&
> > > -         mds_mitigation == MDS_MITIGATION_OFF)
> > > +     if (taa_mitigation == TAA_MITIGATION_OFF)
> > >               return;
> >
> > This check seems rather pointless, the only thing after this is the
> > TAA_MITIGATION_AUTO check.
> 
> True, and it can be removed.  But in patch 4 in the mds logic you did suggest having an explicit return to make it clear that none of the later conditions applied.  I'm not sure I feel strongly either way, but I'd like to be consistent.

Let me try to clarify:

  - If it's already doing the conditional for another reason, then
    adding in the return makes sense:

	if (condition) {
	    	do_something;
		/* all actions related to condition are done */
		return;
	}

  - Or, if it's adding a condition+return to avoid having to explicitly
    check for !condition later, that also makes sense.

    	if (condition)
    		return;

    	/* assume !condition */
    	...

  - But adding condition+return, when there's only one condition
    remaining in the function, which already implicitly excludes the
    original condition, that just adds code for no reason.

	/* this has no purpose */
	if (condition)
		return;

	if (!condition && condition2)
		do_something;
    	
    return;

-- 
Josh
