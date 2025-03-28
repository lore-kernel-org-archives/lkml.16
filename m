Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8645186294;
	Fri, 28 Mar 2025 23:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743204293; cv=none; b=QQMmE2EJkUktew5eSwNoTMKuUaB0FyNI9AXsFOetpHhr5n30XrQuejUUgjXgRS+8EFEo2HHnkGXIM+BWxZRTFtGb32sxI/C6v+eJTUYtUa8pplkAAEe8G63WOAvF7ehn9PBADUfrFHxW1g49Q+zZIBrTUUbYGCdKOLQLZbyZEjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743204293; c=relaxed/simple;
	bh=JfdSNMYDw9Qg7aDZQJB743RqNGYA8J2GewrataBZi2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQZMRzL/SH6QNcNct3/YvzHV74WYFsBu3felBvOL7+WT8Hfmy1WbIa6cMhKC/j1focTz6CEVpYBwTL32edW+q0qgxkzNxSinR0k7f+O2sldkqh1WLLs2TRdUYZZyRFNqcaw7Qyq/3HyzJKhpiArfTpBUDfpTddsdkeMGGvJLgH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9MvPAoC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9MvPAoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6E9C4CEE4;
	Fri, 28 Mar 2025 23:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743204293;
	bh=JfdSNMYDw9Qg7aDZQJB743RqNGYA8J2GewrataBZi2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9MvPAoCm7WRo1effocyLLurFNuYDXL6yDVbwylQ8Q8Nte+pJQTZcWE8D34coT7Ho
	 57ceU+SnUtjP+pyefXOpZp0Dgar72NHUZHLKp0W+3q3jKlvrN6ZzSMgcFG6OnkyrSN
	 4A7fzcVy93FOUiRvXl3BYBXNWwHAUOFoMZOHzPucpBhKm/uNhU0r8eczawpeDq0m0y
	 s/b5temtGpmMzjs+w88EzwJSQroO8ufDuYgC+28lxQE4W7b3BKP4V9PS4SUR0OuNWW
	 Xnh/XzfWJlivVqZQ3yZeuD3WD0TPa0uoB5+n8ZTEqC1AIsTHoXOJlcd3IZCIHHrnyk
	 Q4ZO1Fl/BK6ww==
Date: Fri, 28 Mar 2025 16:24:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:objtool/urgent 9/23] vmlinux.o: warning: objtool:
 cdns_mrvl_xspi_setup_clock: unexpected end of section
 .text.cdns_mrvl_xspi_setup_clock
Message-ID: <20250328232449.GA2955081@ax162>
References: <202503282236.UhfRsF3B-lkp@intel.com>
 <az2awlpfs7wt46kwql7ke3iereryykdroymfuaxawz5gozaxyi@rhlmbjkp3sdg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <az2awlpfs7wt46kwql7ke3iereryykdroymfuaxawz5gozaxyi@rhlmbjkp3sdg>

On Fri, Mar 28, 2025 at 09:31:15AM -0700, Josh Poimboeuf wrote:
> On Fri, Mar 28, 2025 at 10:49:22PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
> > head:   1c9d28fdf70d4ae3e8dfeadee982461403c6bb50
> > commit: c5995abe15476798b2e2f0163a33404c41aafc8f [9/23] objtool: Improve error handling
> > config: x86_64-randconfig-161-20250327 (https://download.01.org/0day-ci/archive/20250328/202503282236.UhfRsF3B-lkp@intel.com/config)
> > compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503282236.UhfRsF3B-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202503282236.UhfRsF3B-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> vmlinux.o: warning: objtool: cdns_mrvl_xspi_setup_clock: unexpected end of section .text.cdns_mrvl_xspi_setup_clock
> > >> vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data
> 
> Hi test robot,
> 
> I'm unable to recreate this one:
>  
> >> vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data
> 
> Can you rerun with OBJTOOL_VERBOSE=1 added to the make command line (or
> exported)?

I was able to reproduce this with LLVM 20.1.1 from kernel.org [1]. This
configuration has full LTO enabled so the build takes some time... it
also has several UBSAN configurations enabled but turning off UBSAN does
not resolve it (could be KCOV related?).

$ git cite
ae958b12940b ("objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC")

$ curl -LSso .config https://download.01.org/0day-ci/archive/20250328/202503282236.UhfRsF3B-lkp@intel.com/config

$ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 OBJTOOL_VERBOSE=1 olddefconfig vmlinux
...
vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x33e: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x254: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1d4: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1b8: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x156: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x13a: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xda: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xbe: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x63: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x48: (branch)
vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x0: <=== (sym)
./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --static-call --uaccess --noinstr --link vmlinux.o.orig -o vmlinux.o

vmlinux.o.orig is 391MB so probably not too shareable but if there is
any other information I can give you, I am happy to do so.

[1]: https://mirrors.edge.kernel.org/pub/tools/llvm/

Cheers,
Nathan
