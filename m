Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37251A0BF1;
	Thu,  5 Jun 2025 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749166103; cv=none; b=ewcJ2/zofndpMilm3LtH+I6WdS/kVZ9BY0UrR30VPepAHbXR2drvRu7Y7nS42Zh9holi19mtwDlqa0Sve1B7iFiw1uRnMRMeYobXHALIVasV/JaPgdBRY29CxfikbC97xfmefa3asgTAgVd79Bbm0PF2HIgthkDbeNqbu2nq7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749166103; c=relaxed/simple;
	bh=wpT4kdhFrVLz3iKJ50S2pa3mTyei+h7mexPBYlVblpE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8+bbl2C2DbuhefToaS4xmOSqO4ognKlqeDgGzZfmE8ERYuBoZ1ATSGDpjcfBy4D/nCTYgSDhsWSKWrnlaWJ5PcFUDNZZ46XwoTrO4Em0IRO6awpgxjH83SU6s/OrA+uINbrh0Yl1VPydrci/PL2xRDeaDWLNZ1T5M3ln51iUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWmq/hUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWmq/hUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACD7C4CEE7;
	Thu,  5 Jun 2025 23:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749166103;
	bh=wpT4kdhFrVLz3iKJ50S2pa3mTyei+h7mexPBYlVblpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rWmq/hUrBAiEFgH+Rxiy1HbEdUiNebMP/czdlikDUQF64Ox3eOdKjap50YlGioveZ
	 WmkFY+LfUTXEHcW1gEAq+j+FeEf53h6dOS71NHpizqw+1hjvnB38eE5CwJM9E+Ct40
	 GwDEDdMm3cgLpncIAO4rHXDMBJWgVhbbJkvMufQR+SlhxmY0evOf7NtNFd6rjzMopt
	 NflDgOXOsiJrCTPd2T+G+dQGngMQV7410xmLe4ZEYTzndJWvL7pZStEsG01uHSqDbB
	 ropW4j90kdA+7+oMEp2IG+fsc1gp6imvwXJzSixn9i7zKw3v5BbSp1VrHbCIT3RAx+
	 FIiGBEaFZx4/Q==
Date: Fri, 6 Jun 2025 01:28:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Matthew Wilcox <willy@infradead.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Suren
 Baghdasaryan <surenb@google.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: [PATCH] scripts/kernel-doc: drop "_noprof" on function
 prototypes
Message-ID: <20250606012817.27f16dd0@foz.lan>
In-Reply-To: <875xhaf145.fsf@trenco.lwn.net>
References: <20240326054149.2121-1-rdunlap@infradead.org>
	<aEHq_Jy3hPQIzaO-@casper.infradead.org>
	<875xhaf145.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 05 Jun 2025 13:18:50 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Matthew Wilcox <willy@infradead.org> writes:
> 
> > On Mon, Mar 25, 2024 at 10:41:49PM -0700, Randy Dunlap wrote:  
> >> Memory profiling introduces macros as hooks for function-level
> >> allocation profiling[1]. Memory allocation functions that are profiled
> >> are named like xyz_alloc() for API access to the function. xyz_alloc()
> >> then calls xyz_alloc_noprof() to do the allocation work.
> >> 
> >> The kernel-doc comments for the memory allocation functions are
> >> introduced with the xyz_alloc() function names but the function
> >> implementations are the xyz_alloc_noprof() names.
> >> This causes kernel-doc warnings for mismatched documentation and
> >> function prototype names.
> >> By dropping the "_noprof" part of the function name, the kernel-doc
> >> function name matches the function prototype name, so the warnings
> >> are resolved.  
> >
> > This turns out not to be enough.  For example, krealloc() is
> > currently undocumented.  This is because we match the function name
> > in EXPORT_SYMBOL() against the function name in the comment, and they
> > don't match.  This patch restores the documentation, although only
> > for the python version of kernel-doc, and I'm pretty sure there's a
> > better way to do it (eg building it into the export_symbol* regexes).
> > I can turn this into a proper patch if this is the way to go, but for
> > now it's just to illustrate the problem.  
> 
> FWIW, I have no problem with leaving the perl version behind, I expect
> we'll drop it in 6.17.
> 
> We see other variants of this problem out there, where we want to
> document foo(), but that's really just a macro calling _foo(), where the
> real code is.
> 
> I wonder if we could add some sort of a marker to the kerneldoc comment
> saying "we are documenting foo(), but do you checks against _foo()"
> instead?  That would be more general than trying to keep a list of
> suffixes to hack off.
> 
> I'll try to ponder on this...
> 
> (Meanwhile I don't object to your fix as a short-term workaround)

If we willing to place hacks like that, better to bold it:

	# FIXME: this is not what we should do in long term

> > diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> > index 062453eefc7a..bdfa698d5570 100644
> > --- a/scripts/lib/kdoc/kdoc_parser.py
> > +++ b/scripts/lib/kdoc/kdoc_parser.py
> > @@ -1176,11 +1176,15 @@ class KernelDoc:
> >
> >          if export_symbol.search(line):
> >              symbol = export_symbol.group(2)
> > +            # See alloc_tags.h
> > +            symbol = symbol.removesuffix('_noprof')

If we're willing to do that, I would prefer to place "_noprof" into an array, 
as we may have other similar cases. Also, please comment why we need it and
where we have those "_noprof". We tent to forget why rules are added. As the
code churns, we may end dropping things without updating kernel-doc.

---

for a more long term solution, maybe one option for cases like that would
be to have something like:

/**
  * foo(), foo_noprof() - common function description (is it possible to have 
  *      a single description for both - as they're semantically different?)
  * @_size: size description
  * @_flags: flags description
  *
  * some description, including an explanation what are the differences
  * between both
  */
#define foo(_size, _flags)                    foo_node(_size, _flags, NUMA_NO_NODE)
#define foo_noprof(_size, _flags)             foo_node_noprof(_size, _flags, NUMA_NO_NODE)

Still, another kernel-doc markup will be needed for foo_node variants, as 
the parameters are different anyway.

Please notice that this is easier said than done as the above may break the
kernel-doc's sequential state machine at the parser if not done with care,
specially since one might eventually modify the arguments on just one of
the variants, like:

#define foo(_size, _flags, _bar)              foo_node(_size, _flags, bar, NUMA_NO_NODE)
#define foo_noprof(_size, _flags)             foo_node_noprof(_size, _flags, NUMA_NO_NODE)
	
Btw, we do have things like that: there are several register 
functions/macros that have THIS_MODULE on one of their variants,
like this:

	#define acpi_bus_register_driver(drv) \
	        __acpi_bus_register_driver(drv, THIS_MODULE)

I didn't find yet a good way to have a single kernel-doc markup
that would fill both cases and won't add too much complexity on
both kernel-doc syntax and at the kernel-doc code.

At the above, we probably don't want to document the __foo
variant, as all kAPI calls should use the variant that doesn't
have THIS_MODULE, but there are other similar cases where the
__foo variant, for instance, don't have some mutex or semaphore,
and we may still want both documented.


Thanks,
Mauro
