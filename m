Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83F9229B29
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338505; cv=none; b=TZNpiElbQ6c43En+juMn+oARAt1F2C7pqT/jqWP/k76EIeXtTj7IWGIbOs9KccOAu2D2CPoGUEVHUWsgWTR1cGdGoOUyZm/3aEq9miDKXISoPbj7HOMlDbFkrVmdSo9kJFOw7aGNGBBgPx/UuBMKUuuBuxIYAcHta4PgZ9+DyEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338505; c=relaxed/simple;
	bh=JxZ71lGvU4o8aziGLpVVaNfk4GLuAAsnv5TJPfqIiSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgSLR3jdnSmQfHOn2C1tyKtcmDNYdD/p+XPLtGWl2DEFCLbqkCd9X36uDZSIK+E23N5KxPnzZ53BUv1IKLp2Y4reygtpkIS5NmbR2mvnKhAYpfRrJZ+yYKVAt0DpOub8P+gButUH+6v+ypTzV9mJCfxHANJuflygOkazD6RmfNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UrooQnxd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UrooQnxd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453634d8609so983365e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750338502; x=1750943302; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qdHw6p7z6zmQz0C4ujdVdisan2PpMVfsoufPTvfXsp0=;
        b=UrooQnxdFESEByQG3Q+wPKs77NQXt4DG6No3gCj9ll0+Rbxsw6Ho+R5XmNJwlmL6pm
         Qi/jQlzVVJWOXrDbFm94B1grkBDofBt5MLd78uJIC7p42BXHYU5ABVagc2iA8YD/mglF
         KFBJqQv/LOjuWAF7OZ0eWb4w60gZG3YeENmxqJuyKyw4rO2u4BbpB6NN9DWF94xmteOB
         9sW4KYqX85AxjaQUAP4IjTvy3Punz4kPhEIEOmT8RiWBC42Npbuk2Nsoflu8ys/ZVHVZ
         WBLdAIriF68jiOcE5uOI8bq2sWwKmwm335sJ+shMY4yKaDJ6CkDzw+bF0MN0jvWoNvju
         nLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338502; x=1750943302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdHw6p7z6zmQz0C4ujdVdisan2PpMVfsoufPTvfXsp0=;
        b=nc31D/Rjzns9NdNjwL3oywzzcsva9GWrPEG0ia0Fziyeb8elXoTd036MrKUvJlklw5
         9jI+07ccmCxx8wkmVINL97ckt9rvE+OUo/kXeOoe/aqnPkZDLlSXpuHKP2thIvSa4rfE
         0R95raqzZNmjizy/jaZUEJHyMJ1Z6xF6RGKmCjmjVWh7XNxUoB+XKKGOaXH5V6JBKg9a
         2kM2Qs5fkv2ua3et9oLOj9MiSrLXNdLrFo5na0/57xDz5m1YaNDi78Gu5H7I4Zvkv+5s
         Lh6fKQyBclsK9tiGvtCPnaB4qz8ddGC4m4SH9cwRB5iIVi2q3Pj/H+oEwFCYzXYijsmF
         w3cw==
X-Forwarded-Encrypted: i=1; AJvYcCWxAtd6Lw1PrU1hVM86VjmvMVkm1bZLYnrIu9HaJG4unSozAcAsVXC92qV4qioBW1Y5uqsR/1YNsb0vcO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQGQvCT20rpL3h7iLZhhNPsn2lOnzdIbJwwT90ntQH1RylVwz
	K1/qcrDRJTVFMaBbVltxIByqJ3mOMoID/wk6j4K0T9BcaJdsf95zEL957fkVAR4E+lQ=
X-Gm-Gg: ASbGncsLZnLZ+lcmHkBNTaAN0apaiIizZ02IHz5sGhSUhGLWlfFoUP3GhkeQi3GDimS
	C5fOt5UIZEc5eqtvFrUpUaWhAdT0n+axDonY7NIyP6yIdTmSH9JVoYW8XAXdd4jdH9LMltA5oTH
	GV0vjjQv3pwZNOjq2ftZDtd+f+FwPojrqjySRsEe15SPPipdFts7vDNHWdsqowQdeMKUYyUWjyL
	NnzqXG0QloWZGacvckyAX2FpaJa8AQ2V2xb3HVZO6jwobjz6Fsg5jQPkpVJlENAPj++bVxKjUnk
	pzbytAxXmBgyDRcy80tI30vYvtgz/Hh0aIvYUBuNmdP0sqO8/L4envbF6lZoST76
X-Google-Smtp-Source: AGHT+IEGQ1yCiIqL8EMmQw2kxNWpjg07NWygAGfH9GX1YhqdFPogOWAcwOYs9H9mCLBw99s/RI+rsg==
X-Received: by 2002:a05:6000:2310:b0:3a4:f722:f00b with SMTP id ffacd0b85a97d-3a572367c83mr15931408f8f.11.1750338501821;
        Thu, 19 Jun 2025 06:08:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d0b04sm119652365ad.247.2025.06.19.06.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:08:21 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:08:06 +0200
From: Petr Mladek <pmladek@suse.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: David Hildenbrand <david@redhat.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFQLtrSGxcscq9No@pathway.suse.cz>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <b589b96f-a771-42f1-b14a-0f90db9fb55e@redhat.com>
 <5d037cb6-91a7-47b7-a902-c3e36f2adefb@arm.com>
 <dc5fb92c-6636-4dce-bc66-181345f79abf@redhat.com>
 <ihe6ueejcemrscqzuieunap6sk2z2yb7xr7szr77nue6qpcvm3@qnwvbvqlwdn5>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ihe6ueejcemrscqzuieunap6sk2z2yb7xr7szr77nue6qpcvm3@qnwvbvqlwdn5>

On Wed 2025-06-18 19:16:00, Pedro Falcato wrote:
> On Wed, Jun 18, 2025 at 10:44:20AM +0200, David Hildenbrand wrote:
> > On 18.06.25 10:37, Anshuman Khandual wrote:
> > > 
> > > 
> > > On 18/06/25 1:48 PM, David Hildenbrand wrote:
> > > > On 18.06.25 06:12, Anshuman Khandual wrote:
> > > > > Add a new format for printing page table entries.
> > > > > 
> > > > > Cc: Petr Mladek <pmladek@suse.com>
> > > > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > Cc: David Hildenbrand <david@redhat.com>
> > > > > Cc: linux-doc@vger.kernel.org
> > > > > Cc: linux-kernel@vger.kernel.org
> > > > > Cc: linux-mm@kvack.org
> > > > > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > > > > ---
> > > > >    Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
> > > > >    lib/vsprintf.c                            | 20 ++++++++++++++++++++
> > > > >    mm/memory.c                               |  5 ++---
> > > > >    scripts/checkpatch.pl                     |  2 +-
> > > > >    4 files changed, 37 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > > > > index 4b7f3646ec6ce..75a110b059ee1 100644
> > > > > --- a/Documentation/core-api/printk-formats.rst
> > > > > +++ b/Documentation/core-api/printk-formats.rst
> > > > > @@ -689,6 +689,20 @@ Rust
> > > > >    Only intended to be used from Rust code to format ``core::fmt::Arguments``.
> > > > >    Do *not* use it from C.
> > > > >    +Page Table Entry
> > > > > +----------------
> > > > > +
> > > > > +::
> > > > > +        %ppte
> > > > > +
> > > > > +Print standard page table entry pte_t.
> > > > > +
> > > > > +Passed by reference.
> > > > 
> > > > Curious, why the decision to pass by reference?
> > > 
> > > Just to make this via %p<> based address mechanism. But wondering
> > > will it be better for the pte to be represented via value instead
> > > of reference ?
> > 
> > We commonly pass ptes to functions through value, not reference, that's why
> > I am asking.
> 
> 
> All printf/printk extensions in the kernel follow %p<some letters> and use
> pointers because %p takes pointers, so it lets us use -Wformat with no issues.
> 
> So yes, taking a pte_t * is required.

Correct. But the pointer is usually needed because the %pxx format
need to access a structure.

Passing a pointer is another potential source of errors. I mean that
the callers might pass an invalid pointer by mistake...

Another aspect is performance. It is likely not a big deal for classic
printk() which is a slow path. But trace_printk() tries to optimize
the speed by deferred formatting where possible, see vbin_printf()
and bstr_printf().

I think that this is not a blocker for this patchset. But you should
know that using %pxx has a cost.

Best Regards,
Petr
