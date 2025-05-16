Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367843D69;
	Fri, 16 May 2025 06:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747375516; cv=none; b=V8ESPRoYk+sbhFBHBUK2VBJy7rffIGqQjVStHI3AMfL8PLvSIt06eVqCAfols/7P1DXFgszpxoX1sBAV8e67s9KUatNj+VkAu2MPRXEYd8pA+bGl4jhh0kZ8DZHIRavFZjj+IRpf+5QBZAETFUkuBQoencS5nhOzqB+SbzX6FM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747375516; c=relaxed/simple;
	bh=bW/BSRnMonxJF09QI4JenGAMerZbgvhvGxO91qgyG40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOphZKlnLgw/79GV3Lph1Hi+BciqmXwL6mfNqhkTrN+B/SXFicW6oUW63qqhlrGTmvRno6m+uIfpTvOgzeJ8ACkD9Ft0xrD5wxgmlUu8O7nt4+MK3HVasU7/Yi3SgnvOLaahmPdto2UaQgMEUIjHa5//w/IVD7WDFrPKdxPLqHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n96Sx2Ok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n96Sx2Ok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F3CC4CEE4;
	Fri, 16 May 2025 06:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747375515;
	bh=bW/BSRnMonxJF09QI4JenGAMerZbgvhvGxO91qgyG40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n96Sx2OkenwE0kt3YDNfJZlohnuKTqmaWZNUPaZ6CW9WiQIYMcAet01BF7Nfw3kVN
	 lOe4k+swNbvlzFY+wtcQDBtvSfiaHZFM9SHTbiH/S2Xt53BToRxnP4jbJiE6g/IUD0
	 wo3hmk8y+YdB/EGpRIQ112qAOTUPNhzYaOs8yXBE=
Date: Fri, 16 May 2025 08:03:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	shimoda <yoshihiro.shimoda.uh@renesas.com>,
	goda <yusuke.goda.sx@renesas.com>,
	Kurokawa <harunobu.kurokawa.dn@renesas.com>,
	Kihara <takeshi.kihara.df@renesas.com>,
	kazuya.mizuguchi.ks@renesas.com, takamitsu.honda.pv@renesas.com
Subject: Re: Question about UIO vs DT
Message-ID: <2025051649-commode-brussels-1034@gregkh>
References: <87o6vutrbw.wl-kuninori.morimoto.gx@renesas.com>
 <2025051549-flannels-lively-a46d@gregkh>
 <871pspti1t.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pspti1t.wl-kuninori.morimoto.gx@renesas.com>

On Fri, May 16, 2025 at 02:18:07AM +0000, Kuninori Morimoto wrote:
> 
> Hi Greg
> 
> Thank you for the reply
> 
> > > For example in case of
> > > the device which needs "2 regs 3 irqs". it will be
> > > 
> > > (A)	[1 reg, 1 IRQ] UIO
> > > (B)	[1 reg, 1 IRQ] UIO
> > > (C)	[0 reg, 1 IRQ] UIO
> > > 
> > > and (C) will be DT error. Is this known issue ? Do we have better solution ?
> > 
> > Yes, write a real driver for the device as obviously it is a complex one
> > and UIO shouldn't be used for it :)
> > 
> > What type of device is this that requires this type of hardware control
> > and why do you feel that UIO is the proper solution?
> 
> One of big reason is license.
> Because it needs to be proprietary licensed driver, we can't create
> real driver.

That is not a valid reason at all, sorry.  So much so that I, and many
others, have argued that you can not have UIO drivers in userspace that
are NOT also released under the GPLv2.

Go work with your lawyers please, there's nothing I can now do to help
you out with this due to the expectation that you are attempting to
evade the license requirements here.

greg k-h
