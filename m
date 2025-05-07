Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E7C1B422A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659587; cv=none; b=OcUcl0EJzc7V2I0hvLSgiQgwwZ9iNiRFusk1Q8Kxa4TeM9nRGZpDdtp5laQDxewc2OhrH/O0+mtUvqoHtppEbuQqn8e7Gm6ueWjaiFTlxKTke7vArzeo1bMOGR9112XbQPRtarNELG8huNWapDD9w8m+ZsPsy9jb+IOTgEIihis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659587; c=relaxed/simple;
	bh=VpRYCxbgwTqyjkzN/WuYkouF17B9EPHH8+zr5YUI1SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwfBiH75J2sYrxO7aPYzL2D45vh1vftSTWXScnoc1V1nDas0VAbBKpY7vnhGCKLAhLLh0kOa9HZWVIdLNRoaZxsxLpKrcaXjWxQJ3BApTw+htvyvYZJwgN98M88ieIExPQ8iFPGRq28sV/bVT2RJ/3Zjc3321SfhMCN3DRgP/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=P8X/6VT/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="P8X/6VT/"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-309e54e469cso57456a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 16:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1746659585; x=1747264385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bze+nlRK9GdebdTiqCcyHrSNtG9GFSGfKrcCqT38XaI=;
        b=P8X/6VT/bH+DNaO2+oHs867bT2Z/O9Wr3sVgbS0Yk0/qu5GsyU3S13zK6kBGdmYQRq
         eHZUhBEkZaZwhSCl44wfEjpwi8mKJMtWKI8v8lLBEw4PLAhPwykLFh/UMZ7twDTkHKp/
         Kg87QcW6dVdopQ1rGp/DT3MXq/1K8OWrUbDDH+aKTxmjMBH1DPLewWXxIsYwaoLWQpWO
         OKNHalSLGpGFWTmwNLwkRMctryJEr9hQP5qIkhaaciVh/qtWPmJuEeQUnQB//2DByd8I
         BcMXLJtmQ+eQuk6Zmf78xLCZalerB+bo4w1dDAUOg7nc1SmcAM3UbuRcaI8LIK3WodkN
         pH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746659585; x=1747264385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bze+nlRK9GdebdTiqCcyHrSNtG9GFSGfKrcCqT38XaI=;
        b=GTi1wJBI+7/1BKH3ywM8vBPduJ2eRxQtMJdA5HRozxp/mk/jWS6qeCA26G5e/7edYA
         1ZhVxuSyh2atAuRA9XiGeJ2Q8PEU1FeFG3rsXdNfgxRETjT9e0e+rRv1kws+tJwyD1b9
         gGGXxESUN/lvIQWgMQs5ulGxnwdyG3x5pTiymyJKvKXVn6X4GYnI7H94aSsLyVAeyFXL
         KW8wl+IJa+hggWH/5UEO1ZzKlOmwiEPOC62MplppZb/NwJI3r1XAdq0rt9O8R1lkmPQl
         KLu14Qw2R6rhP7HZT0jnZp0/vDULKeRrcmw9Op+NeKi4lIVMns9AzbJk+Ib4kVcyZ3di
         oS/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPx9MTgyd5sEpxWKrEYkLrEXYNc+EMiH/mX5Wiw5PVny6eZEiK6WUpDab6rJdeVqmRKfUi13tSTzcEJxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMiteiJWnBS/45oheBvUlMv867ir/ACU/FKkaCx9AAj2rrOrLY
	oiUHT1Kiq92RWcLiRwTBRvhTy9c1nNzpVH8qGrW+/t3qChix5k1lAuMaiVDAGis=
X-Gm-Gg: ASbGncuoRwsiUHtkR9LbrEhFkvzhLbXZNLC+sYF4z3xkyL4kNUcZQ6F2P6l+TFf+zoq
	vf0eUhJqL61p1V2hv63cfxtzS0r3SF9FUkSrZvI0F8kR6QXEbvRt2hX0e8r82nPizzQ//AeJ8U7
	6YLnXNhN2VDmVve5+0TczLG3Xe5hBgYJ2PDELagMb0WFlQC09kl5PQuCC/SI1om4LO7Wj3PmnzJ
	F/kKz02f8g5jbPSeFXu8s5Q5/zGRGcuqvohqXetNAstfUM68t2nM4+f0UklsSfYSW/W1BFiaTS6
	jUkna6S84UGfba4dPpho8SE=
X-Google-Smtp-Source: AGHT+IHXf2uaAFydOllzDh6nhZaOcR5ywT2UaACaV2lmI5F+DIMWgpuh5HCG0Ql/E9CoWvoaXWr8HA==
X-Received: by 2002:a17:90b:3e83:b0:30a:80bc:ad5 with SMTP id 98e67ed59e1d1-30aac1f1bd8mr3014058a91.3.1746659584720;
        Wed, 07 May 2025 16:13:04 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::71f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152204desm100243565ad.140.2025.05.07.16.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:13:04 -0700 (PDT)
Date: Wed, 7 May 2025 16:13:03 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>,
	Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	Sentaro Onizuka <sentaro@amazon.com>
Subject: Re: [PATCH] fs: convert mount flags to enum
Message-ID: <aBvo_-Ee7QQtd3YU@telecaster>
References: <20250507223402.2795029-1-stephen.s.brennan@oracle.com>
 <20250507230511.GA2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507230511.GA2023217@ZenIV>

On Thu, May 08, 2025 at 12:05:11AM +0100, Al Viro wrote:
> On Wed, May 07, 2025 at 03:34:01PM -0700, Stephen Brennan wrote:
> > In prior kernel versions (5.8-6.8), commit 9f6c61f96f2d9 ("proc/mounts:
> > add cursor") introduced MNT_CURSOR, a flag used by readers from
> > /proc/mounts to keep their place while reading the file. Later, commit
> > 2eea9ce4310d8 ("mounts: keep list of mounts in an rbtree") removed this
> > flag and its value has since been repurposed.
> > 
> > For debuggers iterating over the list of mounts, cursors should be
> > skipped as they are irrelevant. Detecting whether an element is a cursor
> > can be difficult. Since the MNT_CURSOR flag is a preprocessor constant,
> > it's not present in debuginfo, and since its value is repurposed, we
> > cannot hard-code it. For this specific issue, cursors are possible to
> > detect in other ways, but ideally, we would be able to read the mount
> > flag definitions out of the debuginfo. For that reason, convert the
> > mount flags to an enum.
> 
> Just a warning - there's a bunch of pending changes in that area,
> so debuggers are going to be in trouble anyway.
> 
> Folks, VFS data structures do *NOT* come with any stability warranties.
> Especially if the object in question is not even defined in include/*/*...
> 
> _Anything_ that tries to play with these objects must be version-dependent
> and be ready to be broken by changes in underlying code at zero notice.

That's totally fine, we can deal with breakages as long as we can
reliably detect what version we're dealing with. We can see changed enum
values, renamed/removed structure members, etc., so that's why those are
preferable. Macros are invisible at the debug info level (since no one
compiles with -g3), so those are no good for us. We also avoid version
checks as much as possible because backports in RHEL and co. make
version numbers mostly meaningless.
