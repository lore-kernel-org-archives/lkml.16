Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6B820E6;
	Sun, 30 Mar 2025 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743363494; cv=none; b=pU2GJ+HFiH+ZL6tZIQOjF+24LOLScvbgTIJOvGBK60TnHk1Kvd6l5EeNvehqS8DRcew62pMYTDFhxA/dPUrUezXDfd5xJ55beJkxW1Bsoe7O2QemXHl2VEOpS0yv+Gk5z/RoEBH82xGB05Z3WdIt0V2siRg8J2Legk8O9+Ghk7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743363494; c=relaxed/simple;
	bh=jmWW0iE1sq3mbul0/uhjRIUyrnnYPzrWGh+NNUJaLaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G45HjgOdyQMtbm7fWvmhN2FbYdVhS3oFIWHi+8JLn1OZ3Wqt9hYUvAU1hDJAXNJnp4KjTjsFIOBCCqImadW39Rh1JOHOMIX4gq6AtIwwzwZ49R+o0GV0UURB2+Ziio8nM9kjTJa1olKkU58UbFCX5WwBVwI7obysSzZuXyMtNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rvlOc3zQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rvlOc3zQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6052C4CEDD;
	Sun, 30 Mar 2025 19:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743363494;
	bh=jmWW0iE1sq3mbul0/uhjRIUyrnnYPzrWGh+NNUJaLaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvlOc3zQDU6tIYZS1hbc8qWgrnNVUdqOPGvxd/WD8/CiYxoLifMFL7ubIoHkAmaZc
	 EeAHs7PAdJHGqFAEF+XO/DGyQa55GC8o/4mJ/ML9WlhNLr0FlsJxMA936lAQnPwwxu
	 Lj3m95kxi58erV5dYY6s1j0J7swQhUXQB4lI55nsMRD2Mbfoug8EpJ6cIEwxhTA35f
	 8zVanFi2Asbp6RrACVCRXAVxGLWb1vGPAq4b9jOHLtqtGwn+DPU1hO57scoihtziE4
	 kvEN56oJ4keJU95ox9N9RKFGKWqokeQOXI/zGxJ2H9cRjwki2hZ/h/Ip0wAbdwz93P
	 E8x8q2qjWxltA==
Date: Sun, 30 Mar 2025 12:38:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:objtool/urgent 9/23] vmlinux.o: warning: objtool:
 cdns_mrvl_xspi_setup_clock: unexpected end of section
 .text.cdns_mrvl_xspi_setup_clock
Message-ID: <20250330193809.GA62063@ax162>
References: <202503282236.UhfRsF3B-lkp@intel.com>
 <az2awlpfs7wt46kwql7ke3iereryykdroymfuaxawz5gozaxyi@rhlmbjkp3sdg>
 <20250328232449.GA2955081@ax162>
 <nbth6u2fgdbtw52ll5tzc5qfrfasikqcjbx4eltdezqcagnkkg@wwtkkf2vrjbc>
 <20250329200656.GA127272@ax162>
 <rza3hjwh5j4trizohbc4um53mej4nz7ie6adydbepncxjpoqd2@l67idl6i5mmy>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rza3hjwh5j4trizohbc4um53mej4nz7ie6adydbepncxjpoqd2@l67idl6i5mmy>

On Sat, Mar 29, 2025 at 07:44:26PM -0700, Josh Poimboeuf wrote:
> On Sat, Mar 29, 2025 at 01:06:56PM -0700, Nathan Chancellor wrote:
> > On Fri, Mar 28, 2025 at 09:46:06PM -0700, Josh Poimboeuf wrote:
> > > On Fri, Mar 28, 2025 at 04:24:49PM -0700, Nathan Chancellor wrote:
> > > > vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x33e: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x254: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1d4: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1b8: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x156: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x13a: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xda: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xbe: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x63: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x48: (branch)
> > > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x0: <=== (sym)
> > > > ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --static-call --uaccess --noinstr --link vmlinux.o.orig -o vmlinux.o
> > > 
> > > Nice!  Can you share the disassembly of the function?
> > 
> > Sure thing!
> > 
> > >   objdump -drw -j .text.synaptics_report_mt_data vmlinux.o.orig
> > 
> > 0000000000000000 <synaptics_report_mt_data>:
> 
> This is KCOV leaving dead code again.  I thought I had silenced those
> with
> 
>   6b023c784204 ("objtool: Silence more KCOV warnings")
> 
> but it looks like I mixed up GCOV_KERNEL with KCOV.
> 
> Can you confirm this fixes?

Can confirm, that makes both warnings disappear in this configuration.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index b93597420daf..4d543054f723 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -275,7 +275,7 @@ objtool-args-$(CONFIG_MITIGATION_SLS)			+= --sls
>  objtool-args-$(CONFIG_STACK_VALIDATION)			+= --stackval
>  objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
>  objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
> -objtool-args-$(CONFIG_GCOV_KERNEL)			+= --no-unreachable
> +objtool-args-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
>  objtool-args-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
>  objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --Werror
>  
