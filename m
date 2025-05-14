Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8D44C6D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211466; cv=none; b=p7WeKP2rCEn2bqQKCawmNcvrOv+/hSZQ3cNVWuN5URyiG+3ZGVxhCah1BI7GVqsgV2jtVdc41HtozBQtEWahZlEzBaZmTAOEKPG7rYodTvsmhRBJTFwZ+zNmW7RQ4ksXxbO//Xvvm0FVW2qMAX1/+yolujnvoFVJnikj8MGp4zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211466; c=relaxed/simple;
	bh=CbNDFQDhb/wBOoxx+pn0/q2yIrFVDiKuHeorTjh9e8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmkSlt8dfR0aHe3gIsxEs4tv87nm6bgSoVn60nWAZfV74scrPrI8KOaQQGzh3+VKguP7K8hvefCItxrN2XkIxx7tHHdq6SkvDAPzeuFQU7KfT46oJPUz2pWmhu7YAzvTOKFzc78/DmqfojdIUV/7vT864Vr/qPUfSMNPIVs8rxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSrohg1M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSrohg1M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773A9C4CEE9;
	Wed, 14 May 2025 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747211466;
	bh=CbNDFQDhb/wBOoxx+pn0/q2yIrFVDiKuHeorTjh9e8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSrohg1MeNDtpjnWCpMpKS42idOWS7vkUM+NBZKIK36ycIILMxEsmDlxLEKFU7DT5
	 rwR36Kxwl44yoFWvF3uYu320mtpaRJsBnHPkjH0zlsY2+fST4lg5MKTAtqiEkHAc+J
	 1tXXhIVoCzGFY1fvAJ5D66vEZzg7bhObDIGONkTOqEEcf4Vm1BbdFu0H+Dnrt9JEa2
	 gt7giyu3FfbeuPYDcEAFD4MC4j6DXcipxuN5Z/Zwtqamf0YEdJB0TuQLC+bVE+IH6y
	 kWsYSmt3wn/Z24n9s5kksOuMqEFmBOAig7FCrGSLp4b8ig3t0RJx0ov3jFeLp41oh8
	 leMosIS+PWLKA==
Date: Wed, 14 May 2025 10:31:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 2/6] x86/cpu: Use a new feature flag for 5 level
 paging
Message-ID: <aCRUxffQmM9dbGe6@gmail.com>
References: <20250513111157.717727-8-ardb+git@google.com>
 <20250513111157.717727-10-ardb+git@google.com>
 <7uh3pi23cdd5r2t6ln5p2z2htgmzo5b6omlhb6vyddobcbqqnt@nyujbhsnpioh>
 <aCROdV_fIygO8OoM@gmail.com>
 <CAMj1kXGChWHhbfjUgTQ37+epLjivrKhV8unwyZCHvNTJL2f57w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGChWHhbfjUgTQ37+epLjivrKhV8unwyZCHvNTJL2f57w@mail.gmail.com>


* Ard Biesheuvel <ardb@kernel.org> wrote:

> On Wed, 14 May 2025 at 09:04, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > > On Tue, May 13, 2025 at 01:12:00PM +0200, Ard Biesheuvel wrote:
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Currently, the LA57 CPU feature flag is taken to mean two different
> > > > things at once:
> > > > - whether the CPU implements the LA57 extension, and is therefore
> > > >   capable of supporting 5 level paging;
> > > > - whether 5 level paging is currently in use.
> > > >
> > > > This means the LA57 capability of the hardware is hidden when a LA57
> > > > capable CPU is forced to run with 4 levels of paging. It also means the
> > > > the ordinary CPU capability detection code will happily set the LA57
> > > > capability and it needs to be cleared explicitly afterwards to avoid
> > > > inconsistencies.
> > > >
> > > > Separate the two so that the CPU hardware capability can be identified
> > > > unambigously in all cases.
> > >
> > > Unfortunately, there's already userspace that use la57 flag in
> > > /proc/cpuinfo as indication that 5-level paging is active. :/
> > >
> > > See va_high_addr_switch.sh in kernel selftests for instance.
> >
> > Kernel selftests do not really count if that's the only userspace that
> > does this - but they indeed increase the likelihood that some external
> > userspace uses /proc/cpuinfo in that fashion. Does such external
> > user-space code exist?
> >
> 
> Bah, that seems likely if this is the only way user space is able to 
> infer that the kernel is using 5-level paging.

The price of past mistakes. :-/

So, the pragmatic, forward compatible solution would be to:

 - Keep the 'la57' user-visible flag in /proc/cpuinfo, but map it to 
   the X86_FEATURE_5LEVEL_PAGING flag internally.

 - Rename X86_FEATURE_LA57 to X86_FEATURE_LA57_HW, and expose it 
   as la57_hw.

This way, any LA57-supporting CPUs would always have la57_cpu set, 
while 'la57' is only set when it's enabled in the kernel.

An additional minor bonus would be that by renaming it to 
X86_FEATURE_LA57_HW, the change in behavior also becomes a bit more 
obvious at first glance to kernel developers.

Thanks,

	Ingo
