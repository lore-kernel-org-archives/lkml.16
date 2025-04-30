Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F226D2DC779
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014455; cv=none; b=JgSUGFAjMAIHtNQsTWhGOUk5+sx07a1Jx4W3kafqVXJ8czK2m0aAm8dGzQdcOX+l7ptfrC5ojPXJ5oB6HCug6tt+StoMZqgJoFpQLRqMpQRQsawkhuF4MHMpLuPSMJbBLj7nu2W4WM/8DC8J/Ezc7LLAXVIExgpE8HT6dzVNhQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014455; c=relaxed/simple;
	bh=8QsjaxLDIv0ISrAdDMHRML8ijQlfkOmaKKvq6LJ0kMw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oH/LlCr7B0+zpkNbzKisie/sbuEDaGxhEBsuOXLU5as12wkSRUCmsoS9UNMZex+y8KJscuI1K38J1orFtYVwK+7QHynJ0lPPWBbCLkBoHScNUBWFnZDJMmXmsDtheAGtneJk5AkWsiPa284XRyYD8KnAdPyGFSYHsWXMGZcQGts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTVXSE08; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTVXSE08"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf257158fso40475275e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746014452; x=1746619252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DCQtpbmnNH8yPwrJGcf1JWJJVtWdng53I7ehlQb2+A=;
        b=LTVXSE089NquEekVeaRlvJYbo/PRx7eBV7c9vvvkWhCOi5xpQW81huye+NnE0E/E8x
         KgSGPFPZ0+DmcWvhV6EZh26BqlCWe/DAzImnrcvqSnpO8vre/f1gcK2Iu0rlibPOVxQj
         unPBJUHKhnNNQpFIuPqHXmKvFnvt3W25Ef/jVrT5dYCRlT6XCEBnHkPnqaOoq1OiqY72
         5hR3xW7/d6u+JBMIFUNsn/fQp8l2gkxsRAbm8rk4nu/w8G+g9aa2/yV8N4Tv0uNmk2vP
         98Ctm+YfQ/fNCoi/5WecdfneJcReUMtaMLLumJJ1w7NFJ3M2rYdNrhgQMWtcvCQuHWu5
         lYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014452; x=1746619252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DCQtpbmnNH8yPwrJGcf1JWJJVtWdng53I7ehlQb2+A=;
        b=pWmBOa1JKi582YUlCverTGjMZL3Gtptv0LHLPJUFl6o6cwRBrG64i6WrF1PTgQn5hW
         qagA4ic5d/LzPExfBEQdv/nqi70LNwPIo5cdm2qF3V/tUVMjhgVU96NDkkGi8Fdl8dBt
         4R5IZZYe5PFsFU3A/jOOzXWK07L87QP+Lwns+MlIImwt4XYIVQj0ph+XiPnm/HgOiTI2
         OPrrUSk4mxAbm4zZcukUiJF4VQbB/bDdK4MC70xW/nDMDFrFPSS/IeQ5qYByX16Ragqe
         CpqRAr38TJE7cRLqGLzeBCgtOZfqVVUrXekhCuGN3BwnF85s9Jezx0MQOQr4xNEfcJ7A
         DEWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGecFZtAtmCch4isXJtqluGsKhXCA1X8z3Lg3yqMYtqi+kTpfynI8eh4uhgbVXiqaLWivk3lepGK7RO9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIkaaJ0hqxuNwHD5nsAzrVD1c2N2TS6W3cmKwsSK3/Cw5e5u/y
	nQO5M8f20F5D4y+BbyVcGGNKpvciNaEEWVyTBTz7+mrB+jJuqyrO
X-Gm-Gg: ASbGncuhOelhwMBWqyyKDsXXenUcZm+qhZBCX5bhaxxiL18JBBsO4FjfjTVvd6siYBO
	dcZpgcvQ96bIlj9Ye2RZBf+mB+SibAC8TErt0Dm5ONRSTgmHgHp4OjmSklW85d7c4IgOivt4fuS
	ikV//XUfX5RV6817tCGzfFWgBGGVFkFHTUspH2wbfT5mX5TgVaBUH9VYfCPFn/dgCQDCgYNdS6K
	ICijfaaUkE329dJhCGlyFzAKfEX9LjorC7UotcMPvTkUef9V7PuBF/et+sAM6/WIq4REhdJnham
	t0Yip6Nom+8X33Li5bkBheo+UrBHBd2aumdZQJT9l2nIVh0nEdv5hwhAdmglMS0aUbeoO4rcdd+
	+zxI=
X-Google-Smtp-Source: AGHT+IHdKokDsDAPpxiS26E99ubqRD+quvtP2rRWwTXxF12j2WHpvdyRyJppc7rg/JIjOLn49FAS8A==
X-Received: by 2002:a05:600c:1c29:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-441b268b915mr14159175e9.22.1746014451847;
        Wed, 30 Apr 2025 05:00:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b97288sm23331245e9.6.2025.04.30.05.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:00:51 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:00:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, phasta@kernel.org, Linus
 Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH] x86/boot: Work around broken busybox truncate tool
Message-ID: <20250430130050.27be402e@pumpkin>
In-Reply-To: <CAMj1kXH7Vi8ruqohvRrPM+Dk2vPtyaMUkNRzi0Ak77aq6Q_peg@mail.gmail.com>
References: <20250424101917.1552527-2-ardb+git@google.com>
	<aApm-lvBjREPOW47@gmail.com>
	<CAMj1kXH7Vi8ruqohvRrPM+Dk2vPtyaMUkNRzi0Ak77aq6Q_peg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Apr 2025 18:39:13 +0200
Ard Biesheuvel <ardb@kernel.org> wrote:

> On Thu, 24 Apr 2025 at 18:29, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Ard Biesheuvel <ardb+git@google.com> wrote:
> >  
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > The GNU coreutils version of truncate, which is the original, accepts a
> > > % prefix for the -s size argument which means the file in question
> > > should be padded to a multiple of the given size. This is currently used
> > > to pad the setup block of bzImage to a multiple of 4k before appending
> > > the decompressor.
> > >
> > > busybux reimplements truncate but does not support this idiom, and
> > > therefore fails the build since commit
> > >
> > >   9c54baab4401 ("x86/boot: Drop CRC-32 checksum and the build tool that generates it")
> > >
> > > Work around this by avoiding truncate altogether, and relying on dd to
> > > perform the padding.
> > >
> > > Reported-by: <phasta@kernel.org>
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > > I personally think using a busybox environment for building the kernel
> > > is a terrible idea, and does not satisfy the build tool requirements
> > > listed in the documentation. But apparently, it used to work and now it
> > > doesn't, and the workaround is rather straight-forward.
> > >
> > > IOW, I don't care whether this gets applied or not, so I will leave it
> > > to others to make the argument.  
> >  
> > >  quiet_cmd_image = BUILD   $@
> > > -      cmd_image = cp $< $@; truncate -s %4K $@; cat $(obj)/vmlinux.bin >>$@
> > > +      cmd_image = (dd if=$< bs=4k conv=sync status=none; cat $(filter-out $<,$(real-prereqs))) >$@  
> >
> > So the workaround isn't too terrible, and since someone did trigger the
> > bug, debugged it and reported it to us, it costs us very little to
> > apply the workaround and (re-)enable someone's Linux build environment.
> >  
> 
> Indeed.
> 
> > Also there's almost no existing usage of 'truncate' within the kernel
> > build system. Found one only:
> >
> >    drivers/firmware/efi/libstub/Makefile.zboot:                  truncate -s $$(hexdump -s16 -n4 -e '"%u"' $<) $@
> >  
> 
> Yeah, and it was me who added that one too :-)

That could be changed to use dd as well - since it defaults to truncating the
destination at the write offset.

	David


