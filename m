Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7F2973A2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731153; cv=none; b=ZPUTqdXmeIgf4WVp2gm2GOcdr+Ki0iEL6HxTP3NF7nBmvjN0hylIgGz4pABaylB/BItkux2MbXd7qRRCJXrjamOZWqHY/qaTDCFu0WGbjqAtM7yGAb2RudlBC0Xh5rKWIVNCYb+4d7dGvkrObZzQq3Bf4ZzSwVKlaPk2NObOEU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731153; c=relaxed/simple;
	bh=MryQRg4mxc7mp/DKCiZYhG+Yw7K8aefw+wH8sohSJco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/2sPrh1U6m4qtx9u+DPAuuTH4GBhCJQb8m0NtXPdRnKk+8eKQBCcTJG+qHmNmT1F1YppbKeSo4lI0Ce2i9Tblgj7xbMh2wqNUaOXdmR1Nr6dBqchIVTk4UmrCnGFab2l0P+lf69MnwphljPuzfVVdEO4MiZ+95RqLn+Yc1ubv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jF6bQkfg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jF6bQkfg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C97C4CEEB;
	Tue, 15 Apr 2025 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731153;
	bh=MryQRg4mxc7mp/DKCiZYhG+Yw7K8aefw+wH8sohSJco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jF6bQkfgqleLrGlk0kRy0AxYfnJGnjSWGaE+DYpr52dDb3sVnLMVLDpupnxpmji4O
	 smH5+FtxM+vs3kno1Za/uyOorrYrPOKIGR06MtU1BwROPqkGKm4zCXdCi086weeXEs
	 JTYfxN0U9iekw5J1brE341Ctt7n/04ibpfLaQISsQQz+/slAfOVMb5rgWEIYU7Tr1K
	 nhft+ao7Pym74AirWRfd3gyidrFZd5XkyHTeZR0G48uRHcLBu4gHBFNXzgWSLLa82A
	 /1tDQbQzOba2sR3i+H+FwaLWAB0GJHkdmEopnzj9ErxGY+8O45/wtzxnu8F5/wDfYJ
	 KXpCUQpwmpUEA==
Date: Tue, 15 Apr 2025 08:32:29 -0700
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
Message-ID: <wuryibff35vau3vvo5gj3d6fzvfedlhcnlyc5zlwlzvfdr2dro@lkwwglmgac7c>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-18-david.kaplan@amd.com>
 <fkl2b3ymatulazt2xjegubqcejx5bgaraktztpkitodrbbsozw@xrskej3fg3jf>
 <LV3PR12MB92654563086027BB944A117594B32@LV3PR12MB9265.namprd12.prod.outlook.com>
 <mybnv24fbz5nsxmz2yihzctnbv7ab7sznyotupp6mbpzfdvy2e@r2oantiw4wmo>
 <LV3PR12MB9265B84234C24D42E7CB42EC94B22@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB9265B84234C24D42E7CB42EC94B22@LV3PR12MB9265.namprd12.prod.outlook.com>

On Tue, Apr 15, 2025 at 02:59:32PM +0000, Kaplan, David wrote:
> > > > > +BHI                   X                           X
> > > > > +GDS                   X              X            X              X        (Note 1)
> > > > > +L1TF                  X                           X                       (Note 2)
> > > > > +MDS                   X              X            X              X        (Note 2)
> > > > > +MMIO                  X              X            X              X        (Note 2)
> > > > > +Meltdown              X
> > > > > +Retbleed              X                           X                       (Note 3)
> > > > > +RFDS                  X              X            X              X
> > > > > +Spectre_v1            X
> > > > > +Spectre_v2            X                           X
> > > > > +Spectre_v2_user                      X                           X        (Note 1)
> > > > > +SRBDS                 X              X            X              X
> > > > > +SRSO                  X                           X
> > > > > +SSB (Note 4)
> > > >
> > > > Any reason not to put the "Note 4" in the same column as the others?
> > > >
> > >
> > > The other notes are about cross-thread mitigation specifically and those notes
> > refer to the SMT aspects of those issues.
> > >
> > > Note 4 in this case is about the SSB vulnerability itself, explaining
> > > that by default there is no mitigation for any case.  I was concerned
> > > that including SSB but without any X's in any of the columns would be
> > > confusing, so the note attempted to explain that there were no default
> > > mitigations for SSB under any attack vector.
> >
> > Putting the note there makes it a lot harder to see it.  And I think the lack of X's is
> > accurate, no?
> >
> 
> It is, it's just rather unique compared to the other bugs.  I could
> remove the note entirely, but I was concerned that might look odd
> because it'd be the only bug that isn't mitigated under any of the
> attack vectors.  And that's really just because the current default is
> not to mitigate that one.

I think the note is helpful, it attempts to explain why there are no
X's.  I was just thinking that it seems more logical to put it in the
same column as the others.  And that would also help make it more clear
that yes, the X's are missing.  Which is indeed odd, but it's also the
reality.

-- 
Josh
