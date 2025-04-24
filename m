Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C375819CC3E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519003; cv=none; b=gZuBIenSvBS26wzIvbrEqSpm8eX3DDOu3cKBY+LtYoPoRC7zMO14YjXuOZ82uEhpDQci9C81+j+fmKVMyEVzpqKZjkusxWnQg+1wLtTcPyOLxXUSIPJVAdZeyHIho4apxe+YsdEdHESmQ4Bq8h2MauPTEUvaGBx0fk8055WUUrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519003; c=relaxed/simple;
	bh=J7jtu1USJR/EbPQ5fIb1ICwK3lxvgdE1MDDCOsAXx6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSnpw2qMdxNK/lcZ/davr6l/MW249tX/sC8JDp4pXaC9uqhw+ACRH/C5yB00eHQcbkDTsr6K0dKfbnD3MHRTK74Bm2nJ0emOF6MI8lCL5nctxMDQ9Nb5sX86vMh1v23lwUj7ihxRS974KZQKPNpcG4RXkmumE5FgHF2VPmZ9ydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIju5860; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIju5860"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C85BC4CEE3;
	Thu, 24 Apr 2025 18:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745519003;
	bh=J7jtu1USJR/EbPQ5fIb1ICwK3lxvgdE1MDDCOsAXx6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIju5860jZ+YIS5QM1vHx8wXfHVfwTH8KlJinGGJCodrNo1xnz4NNS5OpU5p/zKxy
	 JBm2szzRRVrQy/as8Q2qS1b7syOoFGbjQ0K5Z7KqV/FKY8cgycAUyCykBHoVTtGLq6
	 LLYYNAtLbh6G1TjkEugmfmgqibanSAT+qU42Cs0BYGUvcPx3g7sK/kyauv7mFyNWb8
	 ZKnr7VhVDVxouhpQmv//jxwor92v7NGOBgPk0GO2TPG86tcDPLsgTCuvCL8tNF0V2p
	 tVXjd6wDCgk+7nfFw4RCc+IIQVMFJznBl8piEXaUli1X50vnxAal+S86sT5+VpOJ95
	 gmf825OgigzQg==
Date: Thu, 24 Apr 2025 20:23:19 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH PoC 01/11] x86/linkage: Add SYM_PI_ALIAS() macro
 helper to emit symbol aliases
Message-ID: <aAqBl3Odf4oX2SCL@gmail.com>
References: <20250423110948.1103030-13-ardb+git@google.com>
 <20250423110948.1103030-14-ardb+git@google.com>
 <aAp9dMyCJ982GvKY@gmail.com>
 <CAMj1kXG4umHx6ebVRjg-C+_xJRRBrxmqhiDKqVychCPF9PJoGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXG4umHx6ebVRjg-C+_xJRRBrxmqhiDKqVychCPF9PJoGQ@mail.gmail.com>


* Ard Biesheuvel <ardb@kernel.org> wrote:

> On Thu, 24 Apr 2025 at 20:05, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Startup code that may execute from the early 1:1 mapping of memory will
> > > be confined into its own address space, and only be permitted to access
> > > ordinary kernel symbols if this is known to be safe.
> > >
> > > Introduce a macro helper PI_ALIAS() that emits a __pi_ prefixed alias
> > > for a symbol, which allows startup code to access it.
> >
> > s/PI_ALIAS
> >  /SYM_PI_ALIAS
> >
> > What does 'PI' stand for? 'Physical memory Identity' map?
> >
> 
> 'position independent'

/facepalm

Clearly it's getting late here :)

> - it's what we ended up with on arm64, but I'm
> not attached to it so happy to switch to something better.

Could we make it something like SYM_PIC_ALIAS() at least? Because 'PIC' 
is something most people will recognize in this context. PI goes for 
3.1415. ;-)

Thanks,

	Ingo
