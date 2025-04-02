Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD0815D1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 03:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743565684; cv=none; b=h1I85fBEic/LKzHtVXvB7B+hxtxiwb8l+6ntd513E3mBFNrJgy5a3ovr6ycweu77rZfF0iEumFrMlJ5PbyboGR3YZADBcKj7kLaZezMIDQ5gB3lGR/L15Gn3D4XLZLBOTNKbtdeL5ftKqU8Oc/Mfc7o4ka4CLqoVsDtRtuxKuwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743565684; c=relaxed/simple;
	bh=2cbla7mnOLoS4rKB/K/5R/RWZ1uimU6q3udMuF3DrVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXXLDw9ZN8+CGBDkdv1vFVwve6DhKgzM9rwIUoEVwhapzSCIvP0yId+mwCo/WvWlKCFTlWy4wQPapkwluPvFBNND4/fsRWV0DAhKP5ff6PbbBmN8wYxaUTkWBhz8EeOUVEQcL4AUO5z/IAdo74ucKnF30ZaAFiasuZWTDuT1lyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O85abYyX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O85abYyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B74C4CEDD;
	Wed,  2 Apr 2025 03:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743565683;
	bh=2cbla7mnOLoS4rKB/K/5R/RWZ1uimU6q3udMuF3DrVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O85abYyXjCoJkpC7lPv65JfM5ObIdl28rqExiW4gMGrG1BLKyVHG8wjSRY6iin59D
	 AdhnBxIvIjWNkDGS606Ny/Q0GQnS3wjzkloIG/nbrveb7lfwLgJkihLxUwjDfnV1As
	 gTE7zXZhWOnNKAZVNoBsLUiC8zr3n7ciokbl1vQuPf/WhBhnQXravt3fVzap/FjOIY
	 H2/lMhb2YNRWhzEIqm/k+fO5FenMcIqnJc3gnBXAyUzeGFnpDujAzY7I+ttlD1DO/3
	 JpMwyBv48hhZ7pTipGFY0JuJxhz3cpnTGCDsT2a5pEfIgDChIGKuVvFGfhG0FJo5rJ
	 iy8Sfl/uslu9A==
Date: Wed, 2 Apr 2025 05:47:59 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH -v2 00/49] Simplify, reorganize and clean up the x86
 text-patching code (alternative.c)
Message-ID: <Z-yzb9abBfIlRVhb@gmail.com>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250401143148.GH5880@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401143148.GH5880@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Mar 28, 2025 at 02:26:15PM +0100, Ingo Molnar wrote:
> > This tree can also be found at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip WIP.x86/alternatives
> 
> Can you please use your own tree for WIP stuff?

Certainly! Wanted to do that for some time anyway, to reduce mixups 
with -tip, but procrastinated it :-)

I have just moved all of my Work-In-Progress branches to:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git

    WIP.x86/alternatives
    WIP.x86/msr
    WIP.x86/core
    WIP.x86/cpu
    WIP.x86/fpu
    WIP.core/bugs
    ...

Thanks,

	Ingo
