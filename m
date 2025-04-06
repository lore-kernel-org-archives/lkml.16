Received: from ombertech.com (ombertech.com [74.48.158.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F51361
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.48.158.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743921956; cv=none; b=VRzsQr0UXFfa2MZ0L/5sB8TRaowaaPUG4WTAcpYgKA+p5kaxcV0jupokuSezWuYASYA0O1Y5sjUN3D09+qULp3Az+WrKLBVC3bFabV8nSnZgmwjmaQ77GG2qBUpbJCyvezAAA0moJbIm9HRnjNmAYWX7j9RDhlWsZeunCIM0czI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743921956; c=relaxed/simple;
	bh=/lMhX1Zvl7sFMi25eUiNBDFsOaCCotlUKk7SgyHPKp4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=P5ZEF67XNJKr4V/Ci6ppDE8CjXVL6Zp/janWb9adIpdunFP+tKUhf0xIEwxMB96qeZdbCWyIAc7qOH3A5ImYQt9S2vzNq7zu7Wz/y8UOtdwGs+KfNv0XWFSG+INEdSJjlWVKrxfJdWmP6tlc7+x4ltUhrkP2FmOycpd47X604Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com; spf=pass smtp.mailfrom=ombertech.com; dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b=f1jyzhxN; arc=none smtp.client-ip=74.48.158.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ombertech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b="f1jyzhxN"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ombertech.com; s=2022;
	t=1743921663; bh=/lMhX1Zvl7sFMi25eUiNBDFsOaCCotlUKk7SgyHPKp4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f1jyzhxNLyfffCQqMHcIETi/GF1JyD3/drBQXggZ2u5kVEP3snp0360IqOvMcFfdq
	 6A9iC3AyrwK1CIJ9nzbN0/NxO3bu4W1h1/zJ/1nNUADGybM3JnFxyTE+azLyMDmWpY
	 w5uTbrirEl6Zx7cqL4ZBibneMt72hDAw/vAeEg8GC9EAVNF6ezh8gUFCUE1PI3Cvul
	 3fAuVQf7P0pv821Lo9pkzOIrZrBVTgpY+D/hm7jHwryupzr3ogs56xBYeXuaO9jklr
	 9X0vh54I0Zg36NoHD7txQmTJCYbh4BkAONyqPRQgVp4SFheBTX7/mEyI+JIrEGOl8e
	 bb3Aa+i4fAnwg==
Received: from 192.168.1.100 (unknown [1.145.161.245])
	by ombertech.com (Postfix) with ESMTPSA id D0E865CBF2;
	Sun,  6 Apr 2025 06:41:00 +0000 (UTC)
Date: Sun, 6 Apr 2025 17:46:33 +1000
From: Kevin Koster <lkml@ombertech.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-Id: <20250406174633.2c581923c145687476191753@ombertech.com>
In-Reply-To: <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
	<20250405130306.ca9822c1f27db119cc973603@ombertech.com>
	<20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
	<20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 6 Apr 2025 16:40:49 +1000
Kevin Koster <lkml@ombertech.com> wrote:
> On Sat, 5 Apr 2025 11:32:26 +0200
> Borislav Petkov <bp@alien8.de> wrote:
> > On Sat, Apr 05, 2025 at 01:03:06PM +1100, Kevin Koster wrote:
> > > On Sat, 19 Oct 2024 08:29:04 +0200
> > > Oerg866 <oerg866@googlemail.com> wrote:
> > > > Starting with v6.7-rc1, the kernel was no longer able to boot on
> > > > early i486-class CPUs.
> > > 
> > > Thanks for this patch! It solves my problem with kernel 6.12.11
> > > rebooting at start-up on 486 CPUs, which had me puzzled. (tested
> > > on AM486DX2-66 and CX486DX4-100)
> > > 
> > > Is there a reason why the patch wasn't accepted?
> > 
> > Yes, too many patches, too little time. :-(
> > 
> > Anyway, does the one below - only build-tested - work for both y'all
> > too?
> 
> On my AM486DX2-66 it gets past the immediate reboot problem but gets
> an Oops and kernel panic here:

But if I move "cpuid_1_eax = native_cpuid_eax(1);" to after the
microcode_loader_disabled() check in amd.c, like in the first patch, it
boots fine!
