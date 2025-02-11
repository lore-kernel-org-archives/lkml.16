Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446473BB54
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299021; cv=none; b=TMWs0efEPPcaBtLzkzcC7SkERa1W62kr1pqLMZF7+xsRLEWtfXQlSulqpZG1cdM1wYFAwWV22ZmzM22q61yHPgQCPfyZcS/7eXepziAQGtW2YTxxPyRAFU/vveiq65OmOPHZJwK0aLSFdbCAWgAxg7Lmftv3r5RGky/lXaRPvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299021; c=relaxed/simple;
	bh=ECyQVWW45GnMczkRjm/XlCIytIxAb9ehTHDo2xIVE4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYBYvW8yWA+99Mkh2y15GzRTG1A5/7I/1HG+CCGzOWI2sVkdxPtPUIFulTjKcooVXD+UFWMyQRhFlpkZud5I/9RD51kNPDrgSg1IEYsxOVjC1b4dUH/WjyHRWYBtBG0Y7MFRdQ0lWphybxejk2Ri5Ry4mETdog4MKp9PFjmvWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2ecMHeR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2ecMHeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3ADC4CEDD;
	Tue, 11 Feb 2025 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739299020;
	bh=ECyQVWW45GnMczkRjm/XlCIytIxAb9ehTHDo2xIVE4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2ecMHeREtQ/wkbTPoKsOeq+nqXp+73t/ZKlLsqrNK3xL22ErByyMZzi4hfK879GP
	 TbRUHh+Oir4XU+oHSo9fSOcLt3vdCbLOre1EHiZVLfGoSGDAhobtrMj6RvJKxg5lGz
	 iNPPqLFtGMhsLFl2lCIuer8ouq5WQex6JvZWVQ4N3zMpuMXSdjuyICZs665D8UCnLn
	 +PcN5Qc9NpUGQG2UdzsPYEZRyDx9S3aQbA5Ju0kxx8oJ/VEbSq4nHd2Iob3GAJpshG
	 zJnxUmH/NcDfKY6U7v/Ai3ghV9rmZgbkkp8CidLovekB3NWGVUk9o50syWAXz3DcD1
	 luiTyZ4FU4UeA==
Date: Tue, 11 Feb 2025 18:36:56 +0000
From: Will Deacon <will@kernel.org>
To: Itai Handler <itai.handler@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com, ardb@kernel.org, usamaarif642@gmail.com
Subject: Re: Issues with kexec on arm64
Message-ID: <20250211183655.GA9618@willie-the-truck>
References: <CAFpOueSJFyAa2q=0S5Ch6cCy_ORKBV8Y-FUTq6bTky37LJ7M_A@mail.gmail.com>
 <20250103161637.GA3921@willie-the-truck>
 <CAFpOueQa2EOSC7=5xsWU85B0FG8xsDoqk7btMQCEV7wBdT1GQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFpOueQa2EOSC7=5xsWU85B0FG8xsDoqk7btMQCEV7wBdT1GQw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jan 05, 2025 at 04:46:42PM +0200, Itai Handler wrote:
> On Fri, Jan 3, 2025 at 6:16 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Dec 24, 2024 at 01:36:41PM +0200, Itai Handler wrote:
> > > [Sorry about my previous e-mail on this subject. It got corrupted.
> > > Please ignore it.]
> > >
> > > Hello,
> > >
> > > I'm encountering kernel panics / system hangs when attempting to
> > > kexec a vmlinux file on arm64 architecture.
> > >
> > > It happens both on qemu and on real hardware.
> > >
> > > These issues occur on all kernels from v4.19 to the latest mainline.
> >
> > I think other folks have been using kexec on arm64, so something smells
> > fishy here. Is the issue intermittent?
> 
> No, it isn't intermittent. It's very easy to reproduce the panics/hangs.
> At most we need to perform two recursive kexec attempts of the vmlinux file.
> In v6.6, using the configuration I supplied (config.sh), a single kexec
> attempt is sufficient to demonstrate the issue. In that case a panic occurs
> on the first kexec attempt. In newer versions I mostly see hangs but sometimes
> panics as well.
> Please note that the configuration I supplied sets CONFIG_ARM64_64K_PAGES=y.
> But I saw issues also with 4K pages, but in that case only when enabling some
> debug options (KASAN, SCHED_DEBUG, KCSAN).Also please note that kexec with the
> Image file (instead of the vmlinux file) seems to work properly, without any
> issue.
> 
> >
> > > A sample panic output looks as follows:
> > >   kernel BUG at arch/arm64/mm/mmu.c:217!
> > >   Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
> > >   CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0 #292
> > >   Hardware name: linux,dummy-virt (DT)
> > >   pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > >   pc : __create_pgd_mapping+0xe8/0x3b0
> > >   lr : __create_pgd_mapping+0x44/0x3b0
> > >   sp : fffffe00804d3c20
> > >   x29: fffffe00804d3c20 x28: fffffe0080620000 x27: fffffffefdbc0000
> > >   x26: fffffe0080300000 x25: 0000000040010000 x24: fffffffefdbc8020
> > >   x23: fffffe0080010000 x22: 0000000000000040 x21: fffffe0080010000
> > >   x20: fffffe0080300000 x19: 0040000000000783 x18: 0000000000000000
> > >   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > >   x14: fffffffefdde0000 x13: fffffe00804d3c78 x12: 0000000000001d68
> > >   x11: 0000000000001d64 x10: fffffe00804d3c2c x9 : fffffffefdde0000
> > >   x8 : 0000000040420000 x7 : 0000000000001d68 x6 : 0000000000000000
> > >   x5 : fffffe00a0010000 x4 : 0000000000001004 x3 : fffffe0480010000
> > >   x2 : fffffe00804f7ec0 x1 : 0000000000000000 x0 : 0000000000000000
> > >   Call trace:
> > >    __create_pgd_mapping+0xe8/0x3b0
> > >    map_kernel_segment+0x74/0xb0
> > >    paging_init+0xec/0x4f8
> > >    setup_arch+0x234/0x52c
> > >    start_kernel+0x64/0x500
> > >    __primary_switched+0xb4/0xbc
> > >   Code: f9400300 92400400 f1000c1f 54000060 (d4210000)
> > >   ---[ end trace 0000000000000000 ]---
> > >   Kernel panic - not syncing: Oops - BUG: Fatal exception
> >
> > So this explodes because we find a page-table entry at the pmd level
> > that we don't like the look of:
> >
> >   - It's not a block entry
> >   - It's not all zeroes
> >   - It's also not a table
> >
> > Sadly, the actual value is clobbered by the time we take the BUG():
> >
> >    0:   f9400300        ldr     x0, [x24]
> >    4:   92400400        and     x0, x0, #0x3
> >    8:   f1000c1f        cmp     x0, #0x3
> >    c:   54000060        b.eq    0x18  // b.none
> >   10:*  d4210000        brk     #0x800          <-- trapping instruction
> >
> > Maybe dumping 'pmd_val(pmd)' before we crash would be instructive? Maybe
> > it's a pointer...
> 
> I dumped the bad pmd (on v6.6).
> It's always the same value: 128000017901ca60.

Hmm, I can't make anything useful out of that but it certainly looks
bogus.

> > > I bisected those panics to 8eb7e28d4c642c310f25c18f80a44dd4b01c694e
> > > ("arm64/mm: move runtime pgds to rodata"), which was added on v4.19.
> >
> > Hmm. I wonder if the rodata section isn't being loaded properly? Can you
> > add some traces to check that, please?
> 
> Could you advise which traces are needed and how to add them?

If you can find where the .rodata section lives in the kernel binary
that you're trying to kexec, then you could instrument the kexec code to
check that it does indeed load that into memory, for example? You'll
need to use your imagination as you're the one lucky enough to hit the
bug...

Will
