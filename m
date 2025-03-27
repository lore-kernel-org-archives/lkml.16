Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC41B1A3159
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093682; cv=none; b=Uheisyug8FiwcS/j7n91V9xwHb79S1z5IgNYLUBnk666MrCeajlbul8OWEbmPqtHU4SzyABeX+IjL7zYzHQJfLCqrA025+lAYhTiz3kcJXeV1PVUaoOB4/OxoBKY9WE8DYUhDqcIebM7Ylb/MyLnLh2OP0oeq1uXIzd2k0u4lqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093682; c=relaxed/simple;
	bh=ORG5UvjXYfUOUCsaQ+0jPx6weTNrHk6CP4aKziL+CRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHa4YdgtT/EbxsBSSGNp22BFtYSf7AMMLUAsgSaFiczzqsCvNRrO0A4S0/rppBBBzWhFBXCJDGHCDCNgPlKmqNGfVMOvajuYY02eXqIH1U5KvLNXjxHbxDOCee98zfIu1OTwVfCbRQxY05H817nXnKzOF0qZCFtvjP+BeGm8TSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lcb/8WCv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lcb/8WCv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24421C4CEDD;
	Thu, 27 Mar 2025 16:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093682;
	bh=ORG5UvjXYfUOUCsaQ+0jPx6weTNrHk6CP4aKziL+CRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lcb/8WCvwDR5ArG/aVRh3vT7RUg5GYhxuvKSL6Ix+bGr+MXzz5QB5jEctjZZ7uGlw
	 78c6/PFPvr+ekycrz5lKHxvbzJZ5fzWjsE8yQwrWFsCbLRGqA+LjLmVYlaBNzVN0hl
	 ZJYGRfSQ0hDALKW6uOS6Ien5h5nk4AnFLDVrkAPQMAh7VaWcesstJHPHcRn3BYxIxH
	 dpd6p2Oxgma5Tg/fUh5cTaq2z8dgGBw63UMRsYe7+P59tfFPUX4TjNflzMg2G3KX2n
	 gSexzuIkDCkx9YSYLiMU+5dD/fZ6cN+IPnDaH2BOsdV1/HkqLhWSoD1xaxFv1KIQa6
	 ZV4hlDoY6T/jw==
Date: Thu, 27 Mar 2025 17:41:18 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: objtool crash processing drivers/gpu/drm/vmwgfx/vmwgfx_msg.o
Message-ID: <Z-V_rruKY0-36pqA@gmail.com>
References: <d86b4cc6-0b97-4095-8793-a7384410b8ab@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d86b4cc6-0b97-4095-8793-a7384410b8ab@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> I saw this on one randconfig build failing today with yesterday's
> next-20250326 (with a couple of patches on top), using gcc-14.2
> and the attached config I assume this is a rare configuration:
> 
> ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --sls --stackval --static-call --uaccess   --module drivers/gpu/drm/vmwgfx/vmwgfx_msg.o
> Segmentation fault
> 
> I have not tried to analyze it any further, but I would guess that
> this is a rare configuration, not a recent regression.

I can reproduce this now too, not with a randconfig but with a distro 
DEB package build:

starship:~/tip.localinstall> tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --retpoline --rethunk --stackval --static-call --uaccess --prefix=16   --module drivers/gpu/drm/vmwgfx/vmwgfx_msg.o
Segmentation fault (core dumped)

Program received signal SIGSEGV, Segmentation fault.
check (file=file@entry=0x555555589b40 <file>) at check.c:4655
4655				w += validate_reachable_instructions(file);
(gdb) bt
#0  check (file=file@entry=0x555555589b40 <file>) at check.c:4655
#1  0x0000555555569fb2 in objtool_run (argc=<optimized out>, argv=0x7fffffffe1d8) at builtin-check.c:326
#2  0x00007ffff7c2a3b8 in __libc_start_call_main (main=main@entry=0x555555559d30 <main>, argc=argc@entry=12, argv=argv@entry=0x7fffffffe1d8) at ../sysdeps/nptl/libc_start_call_main.h:58
#3  0x00007ffff7c2a47b in __libc_start_main_impl (main=0x555555559d30 <main>, argc=12, argv=0x7fffffffe1d8, init=<optimized out>, fini=<optimized out>, rtld_fini=<optimized out>, stack_end=0x7fffffffe1c8) at ../csu/libc-start.c:360

(gdb) i r
rax            0x0                 0
rbx            0x555555d8ed70      93825000861040
rcx            0x61                97
rdx            0xff9bb000          4288393216
rsi            0x55555557e0f0      93824992403696
rdi            0x555555d918ad      93825000872109
rbp            0x0                 0x0
rsp            0x7fffffffe020      0x7fffffffe020
r8             0xfffffe90          4294966928
r9             0xff9c155c          4288419164
r10            0x63e934            6547764
r11            0x555555589b40      93824992451392
r12            0x555555dfa640      93825001301568
r13            0x11                17
r14            0x555555d988e0      93825000900832
r15            0x555555d8ed70      93825000861040
rip            0x555555559d14      0x555555559d14 <check[cold]>
eflags         0x10246             [ PF ZF IF RF ]
cs             0x33                51
ss             0x2b                43
ds             0x0                 0
es             0x0                 0
fs             0x0                 0
gs             0x0                 0
k0             0x400000            4194304
k1             0x80480001          2152202241
k2             0xdfffbfff          3758079999
k3             0x0                 0
k4             0x0                 0
k5             0x0                 0
k6             0x0                 0
k7             0x0                 0
fs_base        0x7ffff7e99ec0      140737352670912
gs_base        0x0                 0

The 'file' pointer got corrupted it appears:

(gdb) print file
$1 = (struct objtool_file *) 0x555555589b40 <file>
(gdb) print *file
value of type `objtool_file' requires 8388768 bytes, which is more than max-value-size
(gdb) 

(gdb) print opts
$3 = {dump_orc = false, hack_jump_label = true, hack_noinstr = true, hack_skylake = true, ibt = false, mcount = false, noinstr = false, orc = false, retpoline = true, rethunk = true, unret = false, sls = false, stackval = true, static_call = true, 
  uaccess = true, prefix = 16, cfi = false, backtrace = false, dryrun = false, link = false, mnop = false, module = true, no_unreachable = false, output = 0x0, sec_address = false, stats = false, verbose = false, werror = false}

It's fairly reproducible here. Sending object file separately.

Based on latest -tip.

Thanks,

	Ingo
