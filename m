Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021432DFA41
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744735675; cv=none; b=bLOAM8x9CdbH6dMlMOATMv69KuxBiKFC/kcNDnayK3haG7KXtciJTcQ5iiqDpi/R6/adk4RuPOaSGw9juUWtzmeRfumvBtxEqyu+BNySGQOB3DNZvU3PwglQ3QhqYoNkGwcrfRG/9cP4vr9HViOrNd6KzcN0XH8rc+MGV+kJmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744735675; c=relaxed/simple;
	bh=mmBxGfDtfaRQt5Cn82njWc21jVL+/1sKkFTs4xcGThE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mt3xlB2oVZ+fg7m0D11nEe2uvTQvmp9m3vVgWBWcbBmhuKPj4ietJ9B4BoRVHgRzUH0O/XvOdVHhnEfPGcnUEuO28ejs+SlUma6L7H3YQxhVRfnpx9ccH7TjtzH/CSxAb5mL6CW+f7t2rG0GGkEJY8L6IIvMkYNpBJOCD7lLEt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyQBodap; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyQBodap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE022C4CEEC;
	Tue, 15 Apr 2025 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744735674;
	bh=mmBxGfDtfaRQt5Cn82njWc21jVL+/1sKkFTs4xcGThE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KyQBodap42h2R90ylgvW8QOplEyGHutIBElPQ++1M9tfe+VuOHZxSSEAeJ0B6Hn3b
	 zSsesVTb9wjrIrYMRZzzqFU/BX3vfWVUvdyFheYC/zlhmBnFnv3TyeLXFNYCaP6q0g
	 4hvij9RATlDEs5CZlmj0i2FtYHJpQ9Eb5jZg0pGWsyf/rADuCijB9Fy2Xv04/B6RUV
	 rwfb2w3/6+inJ/2nGDMvqli5F9Y8FbPUPNLfxUTry0isyZQt6IjfPChBjpSkIdNwv4
	 poflae9obpuqx701352nrEP4g9Sh3oA11+pWsrolg0Tl3tWp2tuBBuKzh2DjG56Js0
	 S+VDOzUxblqGQ==
Date: Tue, 15 Apr 2025 09:47:51 -0700
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
Message-ID: <l3b2rwwwwtrxr5fyya3xnxtzlmvkmiwobxy363cvmxgegg56fv@wpxgyc3ymtxe>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-18-david.kaplan@amd.com>
 <fkl2b3ymatulazt2xjegubqcejx5bgaraktztpkitodrbbsozw@xrskej3fg3jf>
 <LV3PR12MB92654563086027BB944A117594B32@LV3PR12MB9265.namprd12.prod.outlook.com>
 <mybnv24fbz5nsxmz2yihzctnbv7ab7sznyotupp6mbpzfdvy2e@r2oantiw4wmo>
 <LV3PR12MB9265B84234C24D42E7CB42EC94B22@LV3PR12MB9265.namprd12.prod.outlook.com>
 <wuryibff35vau3vvo5gj3d6fzvfedlhcnlyc5zlwlzvfdr2dro@lkwwglmgac7c>
 <LV3PR12MB9265BA06BBDBFCEB868CFF0694B22@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB9265BA06BBDBFCEB868CFF0694B22@LV3PR12MB9265.namprd12.prod.outlook.com>

On Tue, Apr 15, 2025 at 04:10:49PM +0000, Kaplan, David wrote:
> > I think the note is helpful, it attempts to explain why there are no X's.  I was just
> > thinking that it seems more logical to put it in the same column as the others.  And
> > that would also help make it more clear that yes, the X's are missing.  Which is
> > indeed odd, but it's also the reality.
> >
> 
> Right, except that the last column is about the cross-thread vector,
> which is irrelevant for SSB.  All the other notes specifically pertain
> to SMT leakage.

Ah.  Can we give the column a broader heading like "Notes"?

> I could put the '(Note 4)' text in every column, but that might be
> even weirder.  I could also remove SSB entirely from the table since
> it isn't technically relevant for any of the attack vector controls?

I'm thinking the table should list all the mitigations, regardless of
whether they're affected by these controls, so the controls are
well-defined without any ambiguity.

-- 
Josh
