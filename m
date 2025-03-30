Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06B8320F;
	Sun, 30 Mar 2025 02:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743302670; cv=none; b=NquVSNjT9dwSZ/DP0lqYbW+LTbrF4OGrepgqs28JdCSFP5XHLvFOmEF6VQrIRIPJ3zzkA/uiTfOI/ErxvHmCsZk57KFChgWLjRKS+9p819CNkxSrhEKqKD11HSd8o+Uw8hChQaQ1j5FlM0sSP+aMUjOjbap6+fcy3IzS6PWpeNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743302670; c=relaxed/simple;
	bh=bUzG6iHMdOHdWj6cWwdHg2M6/1+L2tvVKFq6qVVQydg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrJURInAs3i6Lx2IBd4QOUR26Xz4klAqWy3uabd/SmZWBPaovfmab2sUXR+GB7MA8Y1QvPz8pAKDpFSW1stMFPNggNx7OZfyxQSdjT94X8RemhNi2QDO9bxaCKzNsrv7JlCjq4wNDVd2ZN4dTM+8QuIfyZu822Xsthylwm2fHlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heUNqwVA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heUNqwVA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02478C4CEE2;
	Sun, 30 Mar 2025 02:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743302669;
	bh=bUzG6iHMdOHdWj6cWwdHg2M6/1+L2tvVKFq6qVVQydg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=heUNqwVAKv5Ln40Suv3V4UVj5eQxLD1nDvfA399+VbFU6zRBgkLCmWNowbozLRj3e
	 3efZsPNHIqAR1xJ7jYr4cTpT6HiXfhEkkIoyYCpzXTEqo0KhxULDF1wH1HReJDNAgq
	 8z0xt+L5KAjAnlDx/W1ZBYX2eqPLdGDD984f2Mmtc1HDbNmQE0i93H6q3nNDmcqaXL
	 I9JX6g3yzkHKbji0a3iNKk4J/FeQaJs9v0y9w151fEy8o1DRf4xZjU8cI8ksgQ/FVl
	 IZv6aZaJXaL8+dFQXZsoZLiKnUftmT1Bg1V903pP0R85QcNr0y2yaYy1u158jx8NUr
	 0SkjVZQxohP4Q==
Date: Sat, 29 Mar 2025 19:44:26 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:objtool/urgent 9/23] vmlinux.o: warning: objtool:
 cdns_mrvl_xspi_setup_clock: unexpected end of section
 .text.cdns_mrvl_xspi_setup_clock
Message-ID: <rza3hjwh5j4trizohbc4um53mej4nz7ie6adydbepncxjpoqd2@l67idl6i5mmy>
References: <202503282236.UhfRsF3B-lkp@intel.com>
 <az2awlpfs7wt46kwql7ke3iereryykdroymfuaxawz5gozaxyi@rhlmbjkp3sdg>
 <20250328232449.GA2955081@ax162>
 <nbth6u2fgdbtw52ll5tzc5qfrfasikqcjbx4eltdezqcagnkkg@wwtkkf2vrjbc>
 <20250329200656.GA127272@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250329200656.GA127272@ax162>

On Sat, Mar 29, 2025 at 01:06:56PM -0700, Nathan Chancellor wrote:
> On Fri, Mar 28, 2025 at 09:46:06PM -0700, Josh Poimboeuf wrote:
> > On Fri, Mar 28, 2025 at 04:24:49PM -0700, Nathan Chancellor wrote:
> > > vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x33e: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x254: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1d4: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1b8: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x156: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x13a: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xda: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xbe: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x63: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x48: (branch)
> > > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x0: <=== (sym)
> > > ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --static-call --uaccess --noinstr --link vmlinux.o.orig -o vmlinux.o
> > 
> > Nice!  Can you share the disassembly of the function?
> 
> Sure thing!
> 
> >   objdump -drw -j .text.synaptics_report_mt_data vmlinux.o.orig
> 
> 0000000000000000 <synaptics_report_mt_data>:

This is KCOV leaving dead code again.  I thought I had silenced those
with

  6b023c784204 ("objtool: Silence more KCOV warnings")

but it looks like I mixed up GCOV_KERNEL with KCOV.

Can you confirm this fixes?

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index b93597420daf..4d543054f723 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -275,7 +275,7 @@ objtool-args-$(CONFIG_MITIGATION_SLS)			+= --sls
 objtool-args-$(CONFIG_STACK_VALIDATION)			+= --stackval
 objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
 objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
-objtool-args-$(CONFIG_GCOV_KERNEL)			+= --no-unreachable
+objtool-args-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
 objtool-args-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
 objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --Werror
 
