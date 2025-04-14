Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB61A29A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744674530; cv=none; b=fKmkvgLxns1r5rxEvlBTO9uIDMk1soT/S2CVztGhm99oBJmB5nEBFPw08dC6WbrMnTVHfJJuJ+XII1gvokq45c/u7x5nehrSB6BEarVyWK/HV+8nbmEhO3LZEEHkgScoDsu1mgaPDjoFNfRsBmAjBFTGLVNzZRyl2caUUu75ABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744674530; c=relaxed/simple;
	bh=gEEs90Q0Xhu/Ex4H4YdnueUCDF3bEMB8y6GVYNbIO7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+cs1FcWdZrO7tFNDNUJ8raRWOzIE7QNkXL7JG1xvB7O65nglRzaUcrc6Gd05a145BsBQwqp7M13PrvDSgfeEWYHrg222atK+K1dCJ9r0JInY9nCI+tozMPu7j5uBtJRKer5UaGTfcH/KNqzfzT+nNcNxmvEwNcWMGkwaGlStjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMn6DttZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMn6DttZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B99C4CEE2;
	Mon, 14 Apr 2025 23:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744674529;
	bh=gEEs90Q0Xhu/Ex4H4YdnueUCDF3bEMB8y6GVYNbIO7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMn6DttZ/rSTw2C3OD0Qp1Qnjj5dboTFFyTf1dFX76ecVFvHInX3rGM9nnhv9pTmm
	 /9SDdV61E4N5WK9exS7K6idm051M716oRff0CNDe6BduJ9SV16hVFapyH9w8Ju9NW/
	 5c4D5tnCfm4hgtWIUx3+PU68+V+dqdACg8iWM/6+9kQEv7tnD/vTKrHoHR7WEELibh
	 y5p+6IfTLrYbb3fgSD1Kn2mbu0V4EXMoIhQ7PsnR8lPIt6x4+kWlSZoyKu0bWzQOyr
	 iCiETe2Pd1QE82J0a5p/FpuNAydUCM0O2VoFgHz8RCjWwbREt0sSploUt4EUgqHYld
	 xWN6wzATfuTQg==
Date: Mon, 14 Apr 2025 16:48:46 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, 
	Derek Manwaring <derekmn@amazon.com>
Subject: Re: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user mitigation
Message-ID: <ikjndaokjcwq5mshmdnfkl3w3qrt7cn2vflmtd5in4pviupgzg@xxhzsopjmhrj>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-12-david.kaplan@amd.com>
 <pruotxsn2qn5gdxzeiowx4wy75xtlbiarpqyqjt5timl3sui5h@uiareopp3xny>
 <LV3PR12MB9265359D4950ADE05B0E181494B32@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB9265359D4950ADE05B0E181494B32@LV3PR12MB9265.namprd12.prod.outlook.com>

On Mon, Apr 14, 2025 at 07:20:59PM +0000, Kaplan, David wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Josh Poimboeuf <jpoimboe@kernel.org>
> > Sent: Thursday, April 10, 2025 11:41 AM
> > To: Kaplan, David <David.Kaplan@amd.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov <bp@alien8.de>;
> > Peter Zijlstra <peterz@infradead.org>; Pawan Gupta
> > <pawan.kumar.gupta@linux.intel.com>; Ingo Molnar <mingo@redhat.com>; Dave
> > Hansen <dave.hansen@linux.intel.com>; x86@kernel.org; H . Peter Anvin
> > <hpa@zytor.com>; linux-kernel@vger.kernel.org; Brendan Jackman
> > <jackmanb@google.com>; Derek Manwaring <derekmn@amazon.com>
> > Subject: Re: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user mitigation
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Mon, Mar 10, 2025 at 11:39:58AM -0500, David Kaplan wrote:
> > > @@ -214,6 +211,8 @@ void __init cpu_select_mitigations(void)
> > >        * choices.
> > >        */
> > >       retbleed_update_mitigation();
> > > +     /* spectre_v2_user_update_mitigation() depends on retbleed_mitigation */
> > > +     spectre_v2_user_update_mitigation();
> >
> > Function names need trailing parentheses: "retbleed_mitigation()"
> >
> 
> That one is not actually a function name, it's the name of the file-scope variable.

Why refer to a variable?  Isn't it the function dependencies which
matter here?

-- 
Josh
