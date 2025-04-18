Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD9438FB9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744994933; cv=none; b=OetCgyw3JOiRIRb4ooqck0kayIJgCJsTaZU1aWMTywzJtClDFIEPSMg1psvaF6P6gZUj1O8uZ2apqnZypsZ1QY3JV/2TBSx7XWjtDnLmCCwAqt3gmRX/41J6fdx6k7erDAkFbrdIkpn07D0A+NrQIpFqqIIY97XdLwzCUe4jX8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744994933; c=relaxed/simple;
	bh=kdveocKPtaOwG2bR3O1MRlKCtS/wlsUzhPmrL22g1r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nja9Fqi9fcX0TA2HMxYBm+aKStp3kZKA9etnjX/fkhLxkbEAe4MnQLBWZWsOucTc5ELgzkTmkWsZGyjsn/rNQM2CT8zT9xSiXERTeNpI2vPSH64RBQCcAdrJRiLC6n6a42VT/oGbXkpoaUKKKx4/aGG+xnU/Vg3dX8JYJdQaq8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VbQHNWGY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VbQHNWGY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-aee773df955so2650802a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744994931; x=1745599731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GP89nBUOMsug84JoAJAQqbiboxNkHXQzJsMeQ71nqKE=;
        b=VbQHNWGYWo7GCguDFcc0JaYjFCA3u+cnxgFW6kcsQn3iG61zs9GbNTpSU93ZTIoENt
         QZ/hdZeynGLOMFK9vKHwT4CAXyd1btBXBg2es07qFDSPH2oZt1pszuI9mDUDnhk53vEk
         2WKq0wIzv21HUHb5xVgay2UQ3XMx7jzQDrf2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744994931; x=1745599731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP89nBUOMsug84JoAJAQqbiboxNkHXQzJsMeQ71nqKE=;
        b=q5gmP1QGhj8EZ+t1uXOCKVw7RSpfuErsR9nuXD0uuqpxj/HPsxCPSBwITg96cKrv2o
         Nqa7SyzTbVC2pfnjKfdlDXTyixgYanbd+7qSfLOyNOshqsdsdgCeBH2Rpkg+0F9avtPb
         7Vy46QIihqvW+TMInH7HC1O56ZqgAFNUkXKiiQYlCnqymvhjIPCJMVTya4OUzq924n0E
         MOfD6Y+rDXhMWcCfVzDGyUTpXjrbInfFq2UKm8cEdRtuRN5dfLaSBJ1EJ1YtAyejXpMR
         CqC4+KfFR7rtm/b7/hG/KpGiG9MM3kxYASIhN/Ijhn3chUHemt5K3A9ISoQZainS4Ws0
         lq+A==
X-Forwarded-Encrypted: i=1; AJvYcCUiyoxlAeq4qeGtyfTQ7LzPaIgz9sJn5GATQ7vcQxjiB8lQEJTneDGCA3Qy1UjAjLwxmSg1k34jhS++TE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuZadtiev8qqEsJvpQKE+U2qIbGnfIlsXL+3FEexkLbcqrN+Tp
	UTFcCA6X7f755N3PsUxa211xsltzmPtELosbosMlEeeOZw/18KV8NZ/cTlfgDw==
X-Gm-Gg: ASbGncsLR0eNk//INWov21Pyn4xxdhdnzYrnA3wtfuWd5tdAHZsJYM6kNWnxX4hHoAL
	1taO4y4gS/5JVQ7FE2c3DLr1dq8B+rAW3LGV4C7jJB32xH1+0oU48RutFOdBIlPv55XlsDov37U
	Jfgs5nKnS7HspvFvnagjhNpn+9wVg+Bzf/mZNvv8Z0teoQg/dQ9oDhLLcsb/VI+xt0ofQ5N4asH
	LknfxTMZ0St70oRTnxuDGnBOi6gjx0rNAGoMAlyUbx2a8cAhA4bC24LirbwJLHCP7dEn1k3uRxs
	/oMsX4moKa9fM9SWhWWhH1wZWp+TxxM=
X-Google-Smtp-Source: AGHT+IGqTd8Q9dEQrcbw5ihJXKadrsMSUD3Cq01wFh1WfrbnVVzStHBH9XgkXM74j+ULEQmw9UOvhw==
X-Received: by 2002:a17:90b:3808:b0:2fa:4926:d18d with SMTP id 98e67ed59e1d1-30879c02a9dmr6116623a91.13.1744994931320;
        Fri, 18 Apr 2025 09:48:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:a:200:de:8c89:4042:cc8e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087dee33fdsm1466810a91.10.2025.04.18.09.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 09:48:50 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:48:41 +0200
From: Dmytro Maluka <dmaluka@chromium.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"open list:X86 MM" <linux-kernel@vger.kernel.org>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>
Subject: Re: [PATCH] x86/ioremap: Fix off-by-one in e820 check in
 memremap_should_map_decrypted()
Message-ID: <aAKCaQRYmjNaz175@google.com>
References: <20250418135955.58190-1-dmaluka@chromium.org>
 <05f00515-1400-2f39-0bdb-b963994bf882@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05f00515-1400-2f39-0bdb-b963994bf882@amd.com>

On Fri, Apr 18, 2025 at 09:43:43AM -0500, Tom Lendacky wrote:
> On 4/18/25 08:59, Dmytro Maluka wrote:
> > The end address in e820__get_entry_type() is exclusive, not inclusive.
> > 
> > Note: untested, bug found by code inspection.
> > 
> > Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
> > ---
> >  arch/x86/mm/ioremap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> > index 331e101bf801..a44800a6196e 100644
> > --- a/arch/x86/mm/ioremap.c
> > +++ b/arch/x86/mm/ioremap.c
> > @@ -578,7 +578,7 @@ static bool memremap_should_map_decrypted(resource_size_t phys_addr,
> >  	}
> >  
> >  	/* Check if the address is outside kernel usable area */
> > -	switch (e820__get_entry_type(phys_addr, phys_addr + size - 1)) {
> > +	switch (e820__get_entry_type(phys_addr, phys_addr + size)) {
> 
> I don't think removing the " - 1" is correct. For example, if you are
> mapping a page-aligned value for page-size (4K), then not subtracting 1
> will place you on the next page, which is incorrect, because you are not
> mapping that page.

But __e820__mapped_all(), called by e820__get_entry_type(), handles
'end' non-inclusively:

		...

		/* Is the region (part) in overlap with the current region? */
		if (entry->addr >= end || entry->addr + entry->size <= start)
			continue;

		...

		/*
		 * If 'start' is now at or beyond 'end', we're done, full
		 * coverage of the desired range exists:
		 */
		if (start >= end)
			return entry;

		...

i.e. if we don't subtract 1, phys_addr + size is still outside the
checked region, so all good?

Whereas if we subtract 1, then we have a problem, since
phys_addr + size - 1 is also outside the checked region, i.e. we check
[phys_addr, phys_addr + size - 2] only?

Am I missing something?

...Besides that, after looking closer at e820__get_entry_type(), it
seems buggy on its own (independently of this off-by-one): it is
supposed to return the e820 type of the given range, but if this range
is not covered by a single e820 region but is covered by several
e820 regions, it doesn't check if they all have the same type, it just
returns the type of the last region.

So e.g. if half of the range is E820_TYPE_RAM and only the second half
is E820_TYPE_RESERVED, e820__get_entry_type() will wrongly return
E820_TYPE_RESERVED, so memremap_should_map_decrypted() will cause the
the whole range mapped decrypted?

> 
> Thanks,
> Tom
> 
> >  	case E820_TYPE_RESERVED:
> >  	case E820_TYPE_ACPI:
> >  	case E820_TYPE_NVS:
