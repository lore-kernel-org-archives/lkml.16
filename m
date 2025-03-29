Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405F63208;
	Sat, 29 Mar 2025 04:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743223569; cv=none; b=p2Q+T9JPIQ72XHYSUXReEPGySrUWu4qEiSQ5KfkuhdpUfenaYFEaY9ZBu5yIUxCthuIRfUf0r2qcMPnrsgNuFsIHUg9Zt/XRHUH0TmjABokQs1XbrpVsxoI18vwseIOzZd3H9/tYdfwzgGmzEbDsChAMsCTj/iNQhNl7GBNAPsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743223569; c=relaxed/simple;
	bh=hZX2JbwzthWePVZTdyKWHHwVrguPQ0ymnWvrCqACnuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXXOEdpw7kex0YmJ2vH2X/rx+SLy2enQOstrTWzq2pOmbrgYufPciBQ2pBuZJe1Ofy3DpN6+GIjuNw2NamWzy9Q0i3DvdhBZaXZkrpwWq6tSGrpXjm9dQsvf36gTMw9fv5V9EVKTMJaoT0Bv8qrvXzK3y4PjEeKCBwNvHSIc3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZ6UQ1y4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZ6UQ1y4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8C0C4CEE2;
	Sat, 29 Mar 2025 04:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743223568;
	bh=hZX2JbwzthWePVZTdyKWHHwVrguPQ0ymnWvrCqACnuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZ6UQ1y4+hupAywvEBDeoy02bejqdjr9k9XJENjakhn7fijgzp/OaUyXmhLkQVYEO
	 WuZP7c3+MEjiawm4x3waM5yqJuyJ14Lrew6yZclg6DAveHRx/XaysO8/XXXiCaKf1c
	 sUcIL1mB4G0sAY70J/sTjiT1SJXcp2aWWpJ0qMDHq28j8PyNeGGe7MZ+4QKr8Z5tln
	 KdRnI29P8mEKCxuqeZbZAFZGDT/U8XlLVHC7hAJXr2GFXcgcbIKwStWD9IH5O6AGx9
	 lFf37eiHMs+yDNI9i0KyW1wPGjL6sMLcYXUJHoUwoAvp0R+DsEe4aHyS2Quy6t25QE
	 bnVAFKRGKuEpw==
Date: Fri, 28 Mar 2025 21:46:06 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:objtool/urgent 9/23] vmlinux.o: warning: objtool:
 cdns_mrvl_xspi_setup_clock: unexpected end of section
 .text.cdns_mrvl_xspi_setup_clock
Message-ID: <nbth6u2fgdbtw52ll5tzc5qfrfasikqcjbx4eltdezqcagnkkg@wwtkkf2vrjbc>
References: <202503282236.UhfRsF3B-lkp@intel.com>
 <az2awlpfs7wt46kwql7ke3iereryykdroymfuaxawz5gozaxyi@rhlmbjkp3sdg>
 <20250328232449.GA2955081@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328232449.GA2955081@ax162>

On Fri, Mar 28, 2025 at 04:24:49PM -0700, Nathan Chancellor wrote:
> I was able to reproduce this with LLVM 20.1.1 from kernel.org [1]. This
> configuration has full LTO enabled so the build takes some time... it
> also has several UBSAN configurations enabled but turning off UBSAN does
> not resolve it (could be KCOV related?).
> 
> $ git cite
> ae958b12940b ("objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC")
> 
> $ curl -LSso .config https://download.01.org/0day-ci/archive/20250328/202503282236.UhfRsF3B-lkp@intel.com/config
> 
> $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 OBJTOOL_VERBOSE=1 olddefconfig vmlinux
> ...
> vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x33e: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x254: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1d4: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1b8: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x156: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x13a: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xda: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xbe: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x63: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x48: (branch)
> vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x0: <=== (sym)
> ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --static-call --uaccess --noinstr --link vmlinux.o.orig -o vmlinux.o
> 
> vmlinux.o.orig is 391MB so probably not too shareable but if there is
> any other information I can give you, I am happy to do so.

Nice!  Can you share the disassembly of the function?

  objdump -drw -j .text.synaptics_report_mt_data vmlinux.o.orig

Also, if you happen to have CONFIG_DEBUG_INFO enabled, the line number
of that last branch:

  addr2line -fpie vmlinux.o.orig -j .text.synaptics_report_mt_data 0x33e

Thanks!

-- 
Josh
