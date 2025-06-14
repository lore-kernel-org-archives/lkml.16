Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827202F5B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897084; cv=none; b=aqnuH/ILCBXJUU11jFbWUovyqt/bZzG9ZuVyXpXOJhzPY+lfXQvZf6cJgPtWvKxd55MZhep4i3oc1b9x4uYDJrC2bp24ncef8jypXAmNEtTh3CtCaDcfmMckdDoB6gpadnDdUOFyf008xED6KU0wkVQQJfKXSaXCv1vAMXNSZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897084; c=relaxed/simple;
	bh=GHZr9093QeshnhSDllbnn6G3qWrBPLKcJ9kM6t4B/tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUjclpSxapkE2Rdwajh4gcoaWQsVOFXs5wEWoc+/paM8zTwztV+ItywALhEkF+DlchVtUo5VKFbZF3xdsij5iWKfeRwmWa8mVJN/Ggs6wWJ1hGyF6tkpjxIVFUdZ8EjF8v9fHcbLrqY035jEZUKWeQKoujibWN49HAKiOntCX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iUr6cRq8; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iUr6cRq8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j9ZlmHkHpHkgI0wdIPO3WaEDIJyQiEupsW66Cgr5TmA=; b=iUr6cRq8RNtTAcCQneJoHKkJK9
	7xDM48jzD1qyRs8c/jHKQ8fBRhKP2G/tb1+2ff4NlIb8bQdcRR7RIBM5/aR6Trcs58NFh/fmkihqo
	NUplvjck2e6sGcwk9rZ4u9C644c0Gt56LOGntWSjaHobof495ijJmG5oXP6w+SoHjPD4mgJycAhz1
	K/ABABa1hx8YBhh2XNJ5jqBO6dW+mNKJWBNIH7AEenXPgJu3rYmEfCA7DCM88ZFMpLXravHEg4OiQ
	3Uq4zPMQa7aQkJ68j3k9TmeB3IiBRGl8CzE0pB+DEZN+hqpB5GPwYbj4ydP2BB9A9WX+nrmnmJ64U
	/pWa+/tg==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOA6-00000003Coy-07M3;
	Sat, 14 Jun 2025 10:30:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A1D753018AA; Sat, 14 Jun 2025 12:30:55 +0200 (CEST)
Date: Sat, 14 Jun 2025 12:30:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Ingo Molnar <mingo@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Fei Li <fei1.li@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 07/13] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX
 and Hyper-V
Message-ID: <20250614103055.GL2278213@noisy.programming.kicks-ass.net>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-8-mingo@kernel.org>
 <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>

On Thu, May 15, 2025 at 11:40:06PM +0000, Michael Kelley wrote:
> From: Ingo Molnar <mingo@kernel.org> Sent: Thursday, May 15, 2025 6:27 AM
> > 
> > Since the x86 defconfig aims to be a distro kernel work-alike with
> > fewer drivers and a shorter build time, refresh all the virtualization
> > guest Kconfig features, enabling paravirt spinlocks, and
> > enabling the guest support code for the following guests:
> > 
> >  - Xen
> >  - Xen_PVH
> >  - Jailhouse
> >  - ACRN
> >  - Intel TDX
> >  - Hyper-V
> 
> I built and tested a Hyper-V guest with defconfig. The Hyper-V storage
> and keyboard drivers are pulled in automatically, so my previous
> comment about them being "missing" is moot.
> 
> But the Linux console for each Hyper-V guest is a synthetic graphics
> console, 

So clearly I'm a caveman like creature, but surely those things have
serial console, right? I mean, that's how I access all my test boxes,
serial console and ssh. What more does one really need :-)

/me crawls back into his cave.
