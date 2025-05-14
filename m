Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456EB1B414E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211598; cv=none; b=q2vXaBf4dvgmnJxOfhtOsltBMX9wJG2hwu7lbRqY02tuLTmq2UKUROcTkfAeFp2SUe5cKf9jcohOwm/ahmCqsB4Z7mrSQfbEE6x/t2k5lDMlIkoSMSxcjNyAXiBHwGHg34Ec20Rv922DICr2ctdtCJB/7oyoWkTcx6pT3mhJtq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211598; c=relaxed/simple;
	bh=3CXpvZ6r0gzI/d2EhYFqbuGUg457rbvvifYrJSBg878=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOj991FvnGWHuz14VCekX9XDaqohoGepaKW8VNLsArLz9KshEbuWenaSGYfkLIQ3+GBUUKg0lyZqJRtgKDv40VPIuO8ujBTd35jj4ZEltL0xu+5RlJzq8vDHSSf7fb6x3HubDTAAlvOY0G14MiN6TyECspsfnw/g09UyKm/SvmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hm8iVqZM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hm8iVqZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FB9C4CEE9;
	Wed, 14 May 2025 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747211597;
	bh=3CXpvZ6r0gzI/d2EhYFqbuGUg457rbvvifYrJSBg878=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hm8iVqZM6376zga6toinURm9wKZa2XbgbO+4YI1CAsaI4/EjJg89Sg/0oPye41aSp
	 hGAm7BK9nGHVZmx3MCiisEXbMB1svmyEvr2zQDrKDSW5ilUNjGfQI9n50Be+K3+Nk4
	 DafLcGIBhAgDmZcA6l8QrP08O6UdpfWvbxJhihXmr4h1F9tp5/bHRXADgwP5YQAVj9
	 31yu93xj0c/Q0/i3/iL1TnagMm+YuY3C1sh6ePI4DRuE37T99R0sN4y+NAczEE+k5x
	 DmfYt4kwEU+0yKluuq3hmWBfQEXId0lcvXpjEmkUXDuyCparO8m/wCXTyocLxbBcqK
	 +rIP74zMAyh0g==
Date: Wed, 14 May 2025 10:33:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 2/6] x86/cpu: Use a new feature flag for 5 level
 paging
Message-ID: <aCRVSaNVH6waid4c@gmail.com>
References: <20250513111157.717727-8-ardb+git@google.com>
 <20250513111157.717727-10-ardb+git@google.com>
 <7uh3pi23cdd5r2t6ln5p2z2htgmzo5b6omlhb6vyddobcbqqnt@nyujbhsnpioh>
 <aCROdV_fIygO8OoM@gmail.com>
 <jjvzxxat34tc2uebx3sjqpuft3onxk2izv6azvmmrvr2yxkir7@jqeumosuzmrd>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jjvzxxat34tc2uebx3sjqpuft3onxk2izv6azvmmrvr2yxkir7@jqeumosuzmrd>


* Kirill A. Shutemov <kirill@shutemov.name> wrote:

> On Wed, May 14, 2025 at 10:04:05AM +0200, Ingo Molnar wrote:
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
> 
> I am not aware of any production code that does this. But changing is
> risky.

Would production code ever really care about this?

> Maybe leave "la57" flag in cpuinfo for 5-level paging enabled case and add
> "la57_enumerated" or "la57_capable" to indicate that the hardware supports
> 5-level paging?

Yeah, see my other mail, I think renaming X86_FEATURE_LA57 to 
X86_FEATURE_LA57_HW and exposing it as an additional 'la57_hw' flag in 
/proc/cpuinfo would be the way to go, if this is a compatibility 
concern.

Thanks,

	Ingo
