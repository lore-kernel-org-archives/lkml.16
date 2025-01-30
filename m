Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F44A35
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738200596; cv=none; b=e43NoFfq8Bd2wGdtesX48gwKxQL5v/vB+gd8GIwuFXu4+e5vQgsIWIJ2oDhn1uIWc1CfD5TwilhZbhp5mmUfzmWpYuZwYISu5y0wA2/mrGRsyN+a5LE1bdlJsVajOU3lPFDHhZ+f2mttfJOlvw+g210QzITskH7oV/6NTKHPOcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738200596; c=relaxed/simple;
	bh=8qAgW8LtPIIHIhnZiyASftNwjabnu0tEnOkYhhfsY94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAtTRP/LiwOQ9l7qFNj29JziQXvHlVCaXxeThwnpp83ekDfX1F2ONOGhtn12icsfiWVVQJ5TR9Fi85w488J26HEQ5D+p+5Ls0De64BoStWHMjQDASR9Ja/o22x7QZar9/7Z+LIvrvhudczfPSHD4DHhQ+XG1uX0ub89aXk/AmyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=onbCK20d; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="onbCK20d"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467a6ecaa54so2548481cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 17:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738200593; x=1738805393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dPxkurx/OULW83mf3JAHR7aMN9zx3nKC9vlS36caCvg=;
        b=onbCK20d3e7iN9DLA4SvslTtZInr1XyybOGAIyfgnq1ngebZa316kiEIlmFw2XoP4A
         CWQn3blP49VqwJXWw3UyghvCuQ0P5zzmpI1EdIzh0RFTnRd0nmg40950owmONSxw+YLb
         deuIgjtfwPaJetMqHcnP+OV0zOzuMcMxgzk2a2eE4hV6JhWsztHESa+LnXVweqV4K2kS
         tKdrwVC0VcS+2BqyaSRh+MgWiOxCbeyOO5EQMNTur1C0p0W5PAQ+E6yXJAiT0YwvUrXe
         KRGHCiPqfzpRz6MgcWYsAqQIVTGIdBoHnrCwgkeb/wxb9ODMBW57tYuMnDHbvxBPkjFa
         q+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738200593; x=1738805393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPxkurx/OULW83mf3JAHR7aMN9zx3nKC9vlS36caCvg=;
        b=K3Lhij0r3wBvk5VgQ6HilP8kXU7KeBrpWSsPYNEsaOPciD8Bz4aRHOUx8d0SpE70QV
         zMLAs8z6nUWAw+wqOy5H4obB/xe3L8wIb8RtZyU2al438bK3UthSkLp1RP3/dZ/AzMkc
         QkfL19rpmCshQGo7VssnoBGJRLSgDELYXrLhc1nUiohrf1TDYj6QPsjphgeJ4vQ2RQ61
         JUz4VS0ymR7nz6hbl5QpUMGVrOoGxKHaCpGwGg/LcRuvYyZp72DwywgNIXOeb7TAw6bE
         pjVmIvOF5lE9yIYeeOUI71zzPs2mJNmV+rSH4fK4u/fceEAxaqIapfiMCKDN9yehF4Dh
         5CrA==
X-Forwarded-Encrypted: i=1; AJvYcCVLGN+sZ3ZmgK6YmC9TqwRiFh964Pc8WObBXpUjoHPrcYL3Sa48iaPsXTBu/PIqno92KIYwh+ggYLPOKeg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvzk75QipFiO8EoWzeRgXZfleH9FgyVtarUb1riasoIqSFyGvv
	Dw70essY/GMFSGIDXQi1Bt0QCnSLzlpfIcswKXnlF80269SCOOoTr+J89WJsc98=
X-Gm-Gg: ASbGncvI+VfCML5RiWh3eEbvyojLhfxi0/r/TM1mYW5zaNIpWGoTfN+7PGrVrU6x3cN
	EMEpbmthtZXIrLuHmWRmQULn63+XattUOO+8t4RzRpW+sgt0y0+flnRVaPk+hqINj8pA0WNOrBK
	mdCMUYkutSMMz15lELqcwG7J3gz2RXDDCHRfMkAkJIzlhtcYc+Y4umX4pc/xrmbKhUOlZmDYf+c
	RHLilH9jIbwEXzL873OTbNrvZ2n88Pavc72oFGL9R3FofunkU/iLLGmaYVXFxijiV6BFuSwh4Z2
	pp+ic/+o0iVwFk7zLyPxvZkyNxBsPVDWQ0HGWQk5a7evDVc3o6PKDd+DZYsM8KO9
X-Google-Smtp-Source: AGHT+IFEnIv1nsim5lPdlQj78zl9RmwGB1M+QifWu4dAueGxHGT/j0Tb0xnCGj+Mj/Jowg+4W9/aMw==
X-Received: by 2002:ac8:59ce:0:b0:467:6dd9:c961 with SMTP id d75a77b69052e-46fd0b317f2mr77198481cf.48.1738200593421;
        Wed, 29 Jan 2025 17:29:53 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0a7547sm2194951cf.4.2025.01.29.17.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 17:29:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tdJNP-00000009VHN-2onL;
	Wed, 29 Jan 2025 21:29:51 -0400
Date: Wed, 29 Jan 2025 21:29:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>, linux-rdma@vger.kernel.org,
	Mustafa Ismail <mustafa.ismail@intel.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zhu Yanjun <zyjzyj2000@gmail.com>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] RDMA/rxe: handle ICRC correctly on big endian systems
Message-ID: <20250130012951.GF2120662@ziepe.ca>
References: <20250127223840.67280-1-ebiggers@kernel.org>
 <20250127223840.67280-2-ebiggers@kernel.org>
 <ae41a37e-3ee4-484e-ba53-1cad9225df7a@linux.dev>
 <20250129183009.GC2120662@ziepe.ca>
 <20250129185115.GA2619178@google.com>
 <20250129194344.GD2120662@ziepe.ca>
 <20250129202537.GA66821@sol.localdomain>
 <20250129211651.GE2120662@ziepe.ca>
 <20250129222147.GC2619178@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129222147.GC2619178@google.com>

On Wed, Jan 29, 2025 at 10:21:47PM +0000, Eric Biggers wrote:

> > To be most clear this should be written as:
> > 
> >   u32 ibta_crc = swab32(~crc32_le(..)) // Gives you the IBTA defined value
> >   *packet = cpu_to_be32(ibta_crc); // Puts it in the packet
> > 
> > It follows the spec clearly and exactly.
> > 
> > Yes, you can get the same net effect using le:
> > 
> >   u32 not_ibta_crc = ~crc32_le(..)
> >   *packet = cpu_to_le32(not_ibta_crc)
> > 
> > It does work, but it is very hard to follow how that relates to the
> > specification when the u32 is not in the spec's format anymore.
> > 
> > What matters here, in rxe, is how to use the Linux crc32 library to
> > get exactly the value written down in the spec.
> > 
> > IMHO the le approach is an optimization to avoid the dobule swap, and
> > it should simply be described as such in a comment:
> > 
> >  The crc32 library gives a byte swapped result compared to the IBTA
> >  specification. swab32(~crc32_le(..)) will give values that match
> >  IBTA.
> > 
> >  To avoid double swapping we can instead write:
> >     *icrc = cpu_to_le32(~crc32_le(..))
> >  The value will still be big endian on the network.
> > 
> > No need to talk about coefficients.
> 
> We are looking at the same spec, right?  The following is the specification for
> the ICRC field:
> 
>     The resulting bits are sent in order from the bit representing the
>     coefficient of the highest term of the remainder polynomial. The least
>     significant bit, most significant byte first ordering of the packet does not
>     apply to the ICRC field.
> 
> So it does talk about the polynomial coefficients.

Of course it does, it is defining a CRC.

The above text is reflected in Figure 57 which shows the Remainder
being swapped all around to produce the ICRC.

The spec goes on to say:

 CRC Field is obtained from the Remainder as shown in Figure 57. ICRC
 Field is transmitted using Big Endian byte ordering like every field
 of an InfiniBand packet.

From a spec perspective is *total nonsense* to describe something the
spec explicitly says is big endian as little endian.

Yes from a maths perspective coefficients are reversed and whatever,
but that doesn't matter to someone reading the code. Clearly state
how to calculate the u32 "ICRC Field" as called out in the spec using
Linux. That is swab32(~crc32_le(..)) - that detail clarifies everything.

> It sounds like you want to add two unnecessary byteswaps to match
> the example in Table 25, which misleadingly shows a byte-swapped
> ICRC value as a u32 without mentioning it is byte-swapped.

There are an obnoxious number of ways to make, label and describe
these LFSRs. IBTA choose their representation, Linux choose a
different one.

It isn't misleadingly byte-swapped, it is self consistent with the
rest of the spec, and different from Linux.

> I don't agree that would be clearer, but we can do it if you prefer.

If you want to keep the le32 optimization, then keep it, but have a
comment to explain that it is an optimization based on the logical
be32 double swap that matches the plain text of the spec.

I gave an example comment above.

Jason
