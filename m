Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1392328E17;
	Thu,  5 Jun 2025 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749163857; cv=none; b=i9YUKEbxEPEuarjNzbrkTWwWaOYHvdkLJXIcX9B2FEKUGrZobQv3ZX9m1OMnNShQ8pSXeOIab0vLS0fX9PIeXkqZfHG9qpcfYdMOL2Z6NnxI3DPUhfub+wPg+tOWEJOdV3x/G0jcFRzqUtj2+DAzgUAulzsmyWpHCeQqxNtiSJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749163857; c=relaxed/simple;
	bh=w5rGUCB60HCMrQ5sxrkuw3dHXn6zg5hHhTznI168je0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1wZ/Xlb/FxlN79Lr/fwX9lHFaFMaGSBe57sRMKFuwT4be3dKeQETCZi31tc3o51iLll6tuu/lMIGjl+Ui3HdMHqxOVou7UU2s4PwW9cszbAr2ijCsmg+asPJgxqGVrirRTEMz2Dn02DltBeIgJL3GloWMwFmKQa2HSRi0Bfvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvFkZus6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvFkZus6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94F7C4CEE7;
	Thu,  5 Jun 2025 22:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749163856;
	bh=w5rGUCB60HCMrQ5sxrkuw3dHXn6zg5hHhTznI168je0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QvFkZus6+IFnjXFu/n2GiBb6aJkvDWuNZmF3dz+Uvqfx2BMWokX280z9NNrXeREZE
	 WZL+/T37cxMWASmx+OCqeZpVwHpWbPDcorxGUXm5Eg4BDzdDH+3+UgW+ZgJN2m6q0r
	 6cJFep/Mpfvyqh+9hi60zQrRxXaoprGAJB0/WnV08l21MSfhaxz6g0F7q6VoXM0Dig
	 +1uwuFIhY9kw39yRsr6NyZGg2/RPlLKw/SNj4aa2KiTvynIXGrqQFvf651uYt4GwhN
	 nXTd84j+EwMBPIAHsDuJsGWWR0rGqVAppUGjz24B/3y3uzzCwD+OlYs4hneQA0RxXI
	 UmKv7vLuTuYiQ==
Date: Fri, 6 Jun 2025 00:50:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] scripts/kernel-doc: drop "_noprof" on function
 prototypes
Message-ID: <20250606005051.60a48cb4@foz.lan>
In-Reply-To: <aEHwdoNCrF4-KY_i@casper.infradead.org>
References: <20240326054149.2121-1-rdunlap@infradead.org>
	<aEHq_Jy3hPQIzaO-@casper.infradead.org>
	<875xhaf145.fsf@trenco.lwn.net>
	<aEHwdoNCrF4-KY_i@casper.infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 5 Jun 2025 20:31:02 +0100
Matthew Wilcox <willy@infradead.org> escreveu:

> On Thu, Jun 05, 2025 at 01:18:50PM -0600, Jonathan Corbet wrote:
> > Matthew Wilcox <willy@infradead.org> writes:  
> > > This turns out not to be enough.  For example, krealloc() is
> > > currently undocumented.  This is because we match the function name
> > > in EXPORT_SYMBOL() against the function name in the comment, and they
> > > don't match.  This patch restores the documentation, although only
> > > for the python version of kernel-doc, and I'm pretty sure there's a
> > > better way to do it (eg building it into the export_symbol* regexes).
> > > I can turn this into a proper patch if this is the way to go, but for
> > > now it's just to illustrate the problem.  
> > 
> > FWIW, I have no problem with leaving the perl version behind, I expect
> > we'll drop it in 6.17.

I agree with Jon: it is time to retire the perl version. 

> > 
> > (Meanwhile I don't object to your fix as a short-term workaround)  
> 
> OK, will give Mauro 24 hours to comment, then resend as a patch if
> there are no objections.
> 
> > We see other variants of this problem out there, where we want to
> > document foo(), but that's really just a macro calling _foo(), where the
> > real code is.

The problem is that one may want to document both _foo() and foo(),
if they have different arguments. I'm pretty sure we have cases like
that.

> > 
> > I wonder if we could add some sort of a marker to the kerneldoc comment
> > saying "we are documenting foo(), but do you checks against _foo()"
> > instead?  That would be more general than trying to keep a list of
> > suffixes to hack off.  
> 
> kernel-doc is our own format, so sure, we can add whatever marker
> we want to it.  I think it's not quite general enough because we have
> situations like:
> 
> static inline void foo(int x)
> {
> 	numa_foo(x, NUMA_NO_NODE);
> };
> 
> /**
>  * foo - Frobnicate
>  * @x: How many
>  * @nid: Which node
>  */
> void numa_foo(int x, int node)
> { .. }

If I"m not mistaken, if you do things like that, kernel-doc.py will
complain that "foo" is not "numa_foo". It will also complain that
"nid" doesn't exist and "node" is not documented.

Basically, there is a strict check there (if it got properly 
backported from the Perl version) which checks if kernel-doc
is documenting the next function prototype name and argument
names.

The rationale is that we caught several cases where a function was
removed, renamed and/or have their parameters renamed without the
corresponding kernel-doc change. So, the verification is now
stricter (*). When we enabled such check, we fixed several bad
kernel-doc markups.

(*) Also, kernel-doc handles files in one pass at read time,
    sequentially. It could be possible to change it, but kernel-doc 
    is already complex enough, and placing the markup just before
    the function is a good practice anyway.

> and now we're documenting a parameter that doesn't exist.  The only
> solution is to move the kdoc to the header file, which is annoying for
> everyone.  Or replicate the declaration in the C file and kdoc it there.

Heh, for my taste, having kernel-docs at header files look better, as
this is where the kAPIs should be defined anyway. 

Ok, one may change the behavior of a function without touching the
arguments and forget to update kernel-doc at the header files to tell
about such change, but this is problematic anyway, as, if someone is
relying on a certain behavior of a kAPI function, changing its behavior
may result on unexpected results at the current callers - and even
future callers.

Thanks,
Mauro
