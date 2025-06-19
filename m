Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F1C2459F1
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337880; cv=none; b=km5FGjDBd76hQpAvc3c+YPr1614xDY1oTERDBeUutAKM//xab8QlXW7itsuhVj625mLIQuVk4oUrXwBVo3ddKf61pk889aUk86YTLfRs4l4XprRuXIGFs/deDPIMXTNLzqgJC5xUKGfLazycCXYzhamb1MV6xy5X5zYZPnIC2v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337880; c=relaxed/simple;
	bh=X0Qvf1p+UcFdwT+Q+wtZjSyeEg3C0TIObqxcbOp8DA8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzCMhonyTH74RruSiktZLCE6pGWsL91mdmcolHW2+HH3vyGNlCktt3qJ7kQhFhkbtr9VrRz8NJzu70v8bUlNDNLcpYmFxtJWow8WGtkOxuqf/3ki8LoD7I8ymn7Cnqjp0gVukRVw3oej9JetfHOC9PFteohn0pmHZRejqVF8v90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORJhmuKK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORJhmuKK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23636167b30so7564275ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750337878; x=1750942678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nfj472nEIt0x/8o/mwSyE6w0gQhW/2elN7P//R13lvo=;
        b=ORJhmuKKy0bJXvnSwyIyHyU/rzs+v+NL57Jg5sWpTjP1+QVoOMMNAXHZeChT7B1UWk
         XzW2NfjR/bWYiLHVYsuFKsKrg9PEc8b0Dz+j6B9PtVOAXZsb5afhbW3pUALYoYWE4zX5
         zdZK1+gaoxkI5uj11WyaRTo8pK8VL3MU4Chu54WnT90OsrNuqhQJbRR0V232IPRxLiOT
         Ni1SJyKpk+t5PNRNVE/mXIQMx6Hf+tLKN2gA4SKhnXvNZpMN8YyxLIoqPABAtKfTAcuc
         z8N9dg36TDVsJ3A3ChbIHcxI6PJ+cEN7EeLKeuhsYq93ug46UEQHC9fAgJUSRjxog9ss
         NHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750337878; x=1750942678;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfj472nEIt0x/8o/mwSyE6w0gQhW/2elN7P//R13lvo=;
        b=C9NVZE2pnntVbjGDrAqFWKDb+oq+uRj1B43DSsoQH4RqqFZp0u6JBh5ns9G5ybK/FX
         kL0+vHHlqVOz1Wv24X6sQDLHe4B8vlC9LF7wyeVXzgNKZRJbBK9dyP/jsu25Ha3Hy10c
         QmU5Ar1MoU8AS6/iqcHETVYjfhPqsjExUkq4OhR9pLSMjRy5/8dZsmUTrAquO8fBVjAe
         Pkbrf5iVdJvOdKMN7041HqkdZhyta6Z2XumG0Bez3ocELn4IqVFB5C9+9YoqHhVGWdpa
         s69TT771a34Y8eg79yTKQ4OW3asBxvM3SxocOxAXRbY+wp1OvLCUM3w/r+xwTUq6xLl9
         RCug==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8cSUOoJ7d2zxgdE/vypdP8vDDMxmTKKO7U2HDHs1BqEAmT+9vI7Gvfmh0Qaw210vHUjrRy28dGuHlFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZMiGml9hzwVanLhCY8bK+8H3CmBjWZYVLj87shxWUkZ++si+X
	hKOwkExx/3+eQcrTb0kTpr6Do/AdcqdOecuKM9cint6bxM5n0KeEw9Bn
X-Gm-Gg: ASbGncsjQog6uu6V5Y3pXILKdHe6zTP512bJLvtiGn4+c0zdEiQAo+6fOkNNBM+rgIs
	iWWbZ/yf+S2M6x1dOsjn/Hl7/9nM7IIEkOShb8ZeEHm8YuVKxmQzzSZxO9sqcd07PtlPA2RcNSz
	oeo7zUWPLqxL8yrbl1ZhdapQ57vLKwMD3HBQXj+TH3QwUKoLjWsFxzA7kjK2xrYNefsfhS6Tzw+
	lCbomdO9FqfAGjsUa1N/pzPUDA44EmF7Ya/DxMQQ0QdTLB7XiE9hULgIGv1iaZIAGNsOCsP9UxY
	uR76MhPQpcJc4WW5PKoL1LdV21/Awhm35JCtV1N3l8NV+6JZyD9adX43k6bSYgeizkMd5/52CBg
	rP0e2ia85rG6yJDQWS6s8iMXH5aYTJbMT4L0D6hC5Whgo+8jd
X-Google-Smtp-Source: AGHT+IEcS8PC34Qc1drEU4mGIDe5xqm3bz0ahIefSK6fW9WWRz6ZRz1DLuPVhxl2BM1IpwlbBCb3fQ==
X-Received: by 2002:a17:902:ccc8:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-2366b3fe71amr319874135ad.50.1750337878399;
        Thu, 19 Jun 2025 05:57:58 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78ce2sm119250435ad.95.2025.06.19.05.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:57:57 -0700 (PDT)
Date: Thu, 19 Jun 2025 21:57:55 +0900
Message-ID: <m25xgr6g8c.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: benjamin@sipsolutions.net
Cc: linux-um@lists.infradead.org,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 07/13] um: nommu: configure fs register on host syscall invocation
In-Reply-To: <2231a777eef3cdb339fe98af4618f958ed658df6.camel@sipsolutions.net>
References: <cover.1750294482.git.thehajime@gmail.com>
	<2863dab9b3f9d6536b73623398a3f39e4ae70957.1750294482.git.thehajime@gmail.com>
	<412c514334ac14a992cab3e7b86170b96d60be1c.camel@sipsolutions.net>
	<m28qln6huv.wl-thehajime@gmail.com>
	<2231a777eef3cdb339fe98af4618f958ed658df6.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/26.3 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


On Thu, 19 Jun 2025 21:38:47 +0900,
Benjamin Berg wrote:
>=20
> On Thu, 2025-06-19 at 21:22 +0900, Hajime Tazaki wrote:
> >=20
> > On Thu, 19 Jun 2025 19:40:49 +0900,
> > Benjamin Berg wrote:
> > >=20
> > > On Thu, 2025-06-19 at 10:04 +0900, Hajime Tazaki wrote:
> > > > As userspace on UML/!MMU also need to configure %fs register when
> > > > it is
> > > > running to correctly access thread structure, host syscalls
> > > > implemented
> > > > in os-Linux drivers may be puzzled when they are called.=C2=A0 Thus=
 it
> > > > has to
> > > > configure %fs register via arch_prctl(SET_FS) on every host
> > > > syscalls.
> > >=20
> > > Really, I still think that we should "just" get rid of libc
> > > entirely
> > > inside UML. That would avoid so many weird/potential issues =E2=80=A6
> >=20
> > I'm not sure if I understand your point.
> >=20
> > Q1) what do you mean by 'get rid of libc entirely' here ?
> > =C2=A0=C2=A0=C2=A0 do you mean the following code block adds the depend=
ency ?
> > + int os_arch_prctl(int pid, int option, unsigned long *arg2)
> > + {
> > +=C2=A0	return syscall(SYS_arch_prctl, option, arg2);
> > + }
> >=20
> > I guess this can be replaced with inline assembly instead of using
> > libc's one.=C2=A0 but this is the code under os-Linux, which I thought
> > we're
> > allowed to use the host code ?
> >=20
> > Q2) "That would avoid so many weird/potential issues =E2=80=A6"
> > I'm new to this;=C2=A0 I'm wondering what kind of issues did you see ?
>=20
> Oh, I am just being annoyed by libc in general in UM. It isn't specific
> to this patchset.
>=20
> An example is that we need to keep malloc() working for libc. Which I
> would think is kind of weird. Or we had issues because libc turned on
> rseq and that was inherited into userspace, causing random crashes and
> such.

I understand, thanks for the input.

> > > Doesn't change the fact that FS/GS needs to be restored when doing
> > > thread switches and such. Though one might be able to do it
> > > entirely
> > > within arch_switch_to then.
> >=20
> > I believe this is already done in arch_switch_to.=C2=A0 This particular
> > patch does the control to the host context.
>=20
> OK, need to look at that again a bit. I haven't really wrapped my mind
> around how everything fits together, so I probably got some stuff
> wrong.

anyway, thanks for your time to look at this.

-- Hajime
