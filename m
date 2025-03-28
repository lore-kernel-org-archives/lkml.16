Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2471922D4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200884; cv=none; b=FAnIJ/vvmGyQ9b8IdUnNL/nVbRwSn/9Y3+jsIKOP7oW7XBH/BeSCqL4dwm6vz0JQHv2h9SlaGQx11PC0B727c8vuJ/GR2PUz6DOsAPjWkppRyoWWdV3EyH7oNp7xzxqjippU7JvWyhqxxLTHaz3biCN7zUv+Zqjz8FY+aiNEsws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200884; c=relaxed/simple;
	bh=6jOvlqyEfoDPRZEe5QU08df95hhR8+LFZyAjPkJByFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmD6zkvij2+4H72mpbs2kM6dMmSnKk80sS+WeFLsEAUrRphJXQKyjFPgpHZtfphoxeDm1DdhMLq2XaYWEbmFLd507Ws9D3BL/Izqs6HPka6eHDF+sqgoa4pucSc7TFwgZBB8tu/EPaM9zWzQXwfahJe/KP5Ry3hwujp34TiM+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sC0TajSA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sC0TajSA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4491C4CEE4;
	Fri, 28 Mar 2025 22:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743200883;
	bh=6jOvlqyEfoDPRZEe5QU08df95hhR8+LFZyAjPkJByFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sC0TajSATgcTpvSIbP6lezd1y4gxX2Vf+yzxDkiTp1DUCP0X8INtwB42cJ4qliXmx
	 1tQ+Jp24Gf5ANRx4ILCJcxgw9jgeHi4Kt7lPWzt03WvN7BPu9BHy/9KeYpnC/pxlb2
	 Ud4vNxLKlZy/IZ1mBcMGOI5EnCYT6TkX+nqeRatHFrc8allUJawI6y0UFEvgFvkTUP
	 jyul9pAN13AUVDG+hSBcSfo7mBOWIi47prtSr0VIlyu32D6VnZphswKBKmhypxCduh
	 mud6NnzC+U16uwVpjMthRTM+Yhf5Ce4/IleKHdYAuP2Tn+ZJ0kEPrRQvDKs2GDopE4
	 8Q1o/EPY6ssGA==
Date: Fri, 28 Mar 2025 23:27:59 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2/2] x86/bitops: Fix false output register dependency of
 TZCNT insn
Message-ID: <Z-cib74Y1NjB4huZ@gmail.com>
References: <20250325175215.330659-1-ubizjak@gmail.com>
 <20250325175215.330659-2-ubizjak@gmail.com>
 <Z-MjgKSzJKIVooFI@gmail.com>
 <CAFULd4agDYNCJrQQ8bji09eGVJp1D46LH=fOpcfciza2qhKJfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4agDYNCJrQQ8bji09eGVJp1D46LH=fOpcfciza2qhKJfg@mail.gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> On Tue, Mar 25, 2025 at 10:43 PM Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > > On Haswell and later Intel processors, the TZCNT instruction appears
> > > to have a false dependency on the destination register. Even though
> > > the instruction only writes to it, the instruction will wait until
> > > destination is ready before executing. This false dependency
> > > was fixed for Skylake (and later) processors.
> > >
> > > Fix false dependency by clearing the destination register first.
> > >
> > > The x86_64 defconfig object size increases by 4215 bytes:
> > >
> > >           text           data     bss      dec            hex filename
> > >       27342396        4642999  814852 32800247        1f47df7 vmlinux-old.o
> > >       27346611        4643015  814852 32804478        1f48e7e vmlinux-new.o
> >
> > Yeah, so Skylake was released in 2015, about a decade ago.
> >
> > So we'd be making the kernel larger for an unquantified
> > micro-optimization for CPUs that almost nobody uses anymore.
> > That's a bad trade-off.
> 
> Yes, 4.2k seems a bit excessive. OTOH, I'd not say that the issue is 
> a micro-optimization, it is bordering on the hardware bug.

Has this been quantified, and do we really care about the 
micro-performance of ~10-year old CPUs, especially at the
expense of modern CPUs?

Thanks,

	Ingo
