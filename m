Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906061E3DFD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744674675; cv=none; b=adqOvc3rvLeZ9fOnwInjOLODDMwM7ji+dW+4Vrr01zHs/CqyfKnoLekitZ/L+qn//JvZxG1z6i1+80oaazKUf1BZAk2xGxX8v08UwlautZD7OMnE8CL4imFM+kOGBsb3HSlEy/Zo1dpc2fDoTpICF/z6NPp02trQVj0fEYeLHsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744674675; c=relaxed/simple;
	bh=2U8BxDvBaIROKjt2bCDKIJjt8BuENEiwmVEAorJNa/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5bARNrrDey7hrXaNqgfm3skdK+izEn+Zw9w4Fhy2w+mqnpa3qw9ulpfESOiFoUuUEHogzd+o08PH3K/741ClPbg7A1L4Ht+mGVfwDKSFhCkL4+hXS03RG3C/q82acCNDX3KdImeSBh755e/tiDK40GcbG54J4G90IidkYXMMmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVux9MiH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVux9MiH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D413FC4CEEA;
	Mon, 14 Apr 2025 23:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744674675;
	bh=2U8BxDvBaIROKjt2bCDKIJjt8BuENEiwmVEAorJNa/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVux9MiHxao1O5H4Ht8bIgl7/jpmndr7QafUZK12IcpssOeQiB3SNI1CcxuYc5bmA
	 iWfcIyygbjMe153wrpxIZO2mquJQ3uCs1I44i+sYO/VIaLTrLELnTQDYY/HODWvGrT
	 Cw1rXGQgKzYApuh/ynUvrdLFNWifXHYxeSOwZ9fnhEJLpTc3l4eByXqmsmSeAt5e3t
	 mUNz0d++InS8Kvnyc/PcnTR3nv8m7WTymfnSuAXzRKX3KBhcgGMrrWqCvmeWCyMhtO
	 YjuFAgDkeZjSnUOd3bPosnQAqJ2lhN/YMbOgf1YtQdeYaTD5LoLsEnmaxmSeJAy3Gh
	 JCP8ygR680xaQ==
Date: Mon, 14 Apr 2025 16:51:11 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, 
	Derek Manwaring <derekmn@amazon.com>
Subject: Re: [PATCH v4 17/36] Documentation/x86: Document the new attack
 vector controls
Message-ID: <mybnv24fbz5nsxmz2yihzctnbv7ab7sznyotupp6mbpzfdvy2e@r2oantiw4wmo>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-18-david.kaplan@amd.com>
 <fkl2b3ymatulazt2xjegubqcejx5bgaraktztpkitodrbbsozw@xrskej3fg3jf>
 <LV3PR12MB92654563086027BB944A117594B32@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB92654563086027BB944A117594B32@LV3PR12MB9265.namprd12.prod.outlook.com>

On Mon, Apr 14, 2025 at 09:15:54PM +0000, Kaplan, David wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Josh Poimboeuf <jpoimboe@kernel.org>
> > Sent: Thursday, April 10, 2025 1:15 PM
> > To: Kaplan, David <David.Kaplan@amd.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov <bp@alien8.de>;
> > Peter Zijlstra <peterz@infradead.org>; Pawan Gupta
> > <pawan.kumar.gupta@linux.intel.com>; Ingo Molnar <mingo@redhat.com>; Dave
> > Hansen <dave.hansen@linux.intel.com>; x86@kernel.org; H . Peter Anvin
> > <hpa@zytor.com>; linux-kernel@vger.kernel.org; Brendan Jackman
> > <jackmanb@google.com>; Derek Manwaring <derekmn@amazon.com>
> > Subject: Re: [PATCH v4 17/36] Documentation/x86: Document the new attack
> > vector controls
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Mon, Mar 10, 2025 at 11:40:04AM -0500, David Kaplan wrote:
> > > +=============== ============== ============ =============
> > ============== ============
> > > +Vulnerability   User-to-Kernel User-to-User Guest-to-Host Guest-to-Guest
> > Cross-Thread
> > > +=============== ============== ============ =============
> > ============== ============
> > > +BHI                   X                           X
> > > +GDS                   X              X            X              X        (Note 1)
> > > +L1TF                  X                           X                       (Note 2)
> > > +MDS                   X              X            X              X        (Note 2)
> > > +MMIO                  X              X            X              X        (Note 2)
> > > +Meltdown              X
> > > +Retbleed              X                           X                       (Note 3)
> > > +RFDS                  X              X            X              X
> > > +Spectre_v1            X
> > > +Spectre_v2            X                           X
> > > +Spectre_v2_user                      X                           X        (Note 1)
> > > +SRBDS                 X              X            X              X
> > > +SRSO                  X                           X
> > > +SSB (Note 4)
> >
> > Any reason not to put the "Note 4" in the same column as the others?
> >
> 
> The other notes are about cross-thread mitigation specifically and those notes refer to the SMT aspects of those issues.
> 
> Note 4 in this case is about the SSB vulnerability itself, explaining
> that by default there is no mitigation for any case.  I was concerned
> that including SSB but without any X's in any of the columns would be
> confusing, so the note attempted to explain that there were no default
> mitigations for SSB under any attack vector.

Putting the note there makes it a lot harder to see it.  And I think the
lack of X's is accurate, no?

-- 
Josh
