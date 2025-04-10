Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243C4205E0F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270009; cv=none; b=CDuK/HJ56XeDOqbuxBwQ5fQ54g8hBmpktDVFkY+JBpL4YsWnphXYNgb0RQ780v46BRoVg78M13pX32pghyQWlYqAbr330HPIQUyYdTdiGGsuMrduLRXXd5so+YDF1Y4E7qy8GgbitP94ysxNMCkEEASFr5Eev8hkWYKN+iiL6Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270009; c=relaxed/simple;
	bh=TCUH1SBss1gxp10jb4fK1DFVV9YBZD0TZm9QEn0QPW0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YjKGIQ/0zO2rI6AvmwGjawyUpgrZhTmFicqSS0nUsKZLXNLxjQR3VE2MuhTneTigdSbAD+NaiIN/nUMHkN9vssZRkKrOHS5t8nIls9W6T9k1Ay6zBfp7hm4zGSb/eodlXZg6Dqd2ZO3U+Ad8vj0M1o1Rgua9KEwxuzwVhlm488A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lTx2/JHX; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lTx2/JHX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ikXpna6Wq9I0naSoBwdaKdMbQJYhH4jOYuXaHVnwYbk=; b=lTx2/JHXJInUjHHCqZJavDL3kc
	Zgf3CNBCcrm5L+rq9CPQjVw/I0DHg7ctNmB9uBeR7Hkz7C7hCCGi7TUVqz5/01bNUtejJSDnLo3wd
	cC8UN+zNzIPT+YyRsaSCoWr/EYH2aar8gxcHJj6HN92Mx2zJMuOGekX1n/RZfXwSDYIFSJDB4LYkc
	+yCwLYm3XviLFEd+4iy8IbhV+9wyb4e7vRnvty0FTCkBKJ9Irpd95jEbWARypLpVJRdn6oENN8lvq
	mwEGXRU9WpTOT9JHUCBSgrWbE3aRTzcv+NUxfB/xb3MeQrYD34aUfAmBzw19LQn5Iymn3OUThIRFn
	7/9sPELQ==;
Received: from 144-178-94-38.static.ef-service.nl ([144.178.94.38] helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2mJ1-00000008lsT-1LAc;
	Thu, 10 Apr 2025 07:26:35 +0000
Date: Thu, 10 Apr 2025 09:26:35 +0200
From: David Woodhouse <dwmw2@infradead.org>
To: kexec@lists.infradead.org
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Kai Huang <kai.huang@intel.com>, Nikolay Borisov <nik.borisov@suse.com>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Dave Young <dyoung@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 jpoimboe@kernel.org, bsz@amazon.de
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_0/4=5D_x86/kexec=3A_Add_ex?=
 =?US-ASCII?Q?ception_handling_for_relocate=5Fkernel?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250326142404.256980-1-dwmw2@infradead.org>
References: <20250326142404.256980-1-dwmw2@infradead.org>
Message-ID: <652D1332-6C06-4F40-B72A-44B20EDC011D@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 26 March 2025 15:16:00 CET, David Woodhouse <dwmw2@infradead=2Eorg> wrot=
e:
>Continuing the drip-feed of the exception handling support, on top of the
>current tip/x86/asm branch=2E This adds output to the serial port configu=
red
>by earlyprintk, reduces the window during which exceptions can't be handl=
ed
>during the transition from kernel to relocate_kernel environment, and add=
s
>a kselftest for the kexec-jump and exception handling=2E
>
>v9:
> =E2=80=A2 Rebase on top of partial merge into tip/x86/asm (commit 0717b1=
392dc7)=2E
> =E2=80=A2 Add kselftest=2E
> =E2=80=A2 Update to cope with static_call() usage in earlyprintk=2E
> =E2=80=A2 Drop the attempt at adding CFI support for relocate_kernel()=
=2E
>
>v8: https://lore=2Ekernel=2Eorg/all/20250314173226=2E3062535-1-dwmw2@infr=
adead=2Eorg/
> =E2=80=A2 Fix UNRET objtool warning in exc_handler=2E
> =E2=80=A2 Clean up magic numbers in stack frame for exc_handler=2E
> =E2=80=A2 Fix i386 build error due to making the debug support unconditi=
onal=2E
> =E2=80=A2 The int3 is still a [DO NOT APPLY] hack for later, and I plan =
to deal
>   with that with a userspace test case based on
>   http://david=2Ewoodhou=2Ese/loadret=2Ec which will exercise kexec-jump=
 at the
>   same time=2E
>
>v7: https://lore=2Ekernel=2Eorg/kexec/20250312144257=2E2348250-1-dwmw2@in=
fradead=2Eorg/
> =E2=80=A2 Drop CONFIG_KEXEC_DEBUG and make it all unconditional in order=
 to
>   "throw regressions back into the face of whoever manages to introduce
>   them" (Ingo, https://lore=2Ekernel=2Eorg/kexec/Z7rwA-qVauX7lY8G@gmail=
=2Ecom/)
> =E2=80=A2 Move IDT invalidation into relocate_kernel() itself=2E
>
>v6: https://lore=2Ekernel=2Eorg/kexec/20250115191423=2E587774-1-dwmw2@inf=
radead=2Eorg/
> =E2=80=A2 Rebase onto already-merged fixes in tip/x86/boot=2E
> =E2=80=A2 Move CONFIG_KEXEC_DEBUG to generic kernel/Kconfig=2Ekexec as B=
artosz is
>   working on an Arm64 version=2E
>
>v5: https://lore=2Ekernel=2Eorg/kexec/20241205153343=2E3275139-1-dwmw2@in=
fradead=2Eorg/T/
> =E2=80=A2 Drop [RFC]=2E
> =E2=80=A2 Drop _PAGE_NOPTISHADOW fix, which Ingo already took into tip/x=
86/urgent=2E
> =E2=80=A2 Add memory-mapped serial port support (32-bit MMIO spacing onl=
y)=2E
>
>v4 (RFC): https://lore=2Ekernel=2Eorg/kexec/20241127190343=2E44916-1-dwmw=
2@infradead=2Eorg/T/
> =E2=80=A2 Add _PAGE_NOPTISHADOW fix for the identmap code=2E
> =E2=80=A2 Drop explicit map of control page, which was masking the ident=
map bug=2E
>
>v3 (RFC): https://lore=2Ekernel=2Eorg/kexec/20241125100815=2E2512-1-dwmw2=
@infradead=2Eorg/T/
> =E2=80=A2 Add CONFIG_KEXEC_DEBUG option and use earlyprintk config=2E
> =E2=80=A2 Allocate PGD separately from control page=2E
> =E2=80=A2 Explicitly map control page into identmap=2E
>
>V2 (RFC): https://lore=2Ekernel=2Eorg/kexec/20241122224715=2E171751-1-dwm=
w2@infradead=2Eorg/T/
> =E2=80=A2 Introduce linker script, start to clean up data access=2E
>
>V1 (RFC): https://lore=2Ekernel=2Eorg/kexec/20241103054019=2E3795299-1-dw=
mw2@infradead=2Eorg/T/
> =E2=80=A2 Initial proof-of-concept hacks=2E
>
>
>David Woodhouse (4):
>      x86/kexec: Add 8250 serial port output
>      x86/kexec: Add 8250 MMIO serial port output
>      x86/kexec: Invalidate GDT/IDT from relocate_kernel() instead of ear=
lier
>      selftests/kexec: Add x86_64 selftest for kexec-jump and exception h=
andling
>
> arch/x86/include/asm/kexec=2Eh                     |  2 +
> arch/x86/kernel/early_printk=2Ec                   |  9 +++
> arch/x86/kernel/machine_kexec_64=2Ec               | 27 ++++++---
> arch/x86/kernel/relocate_kernel_64=2ES             | 70 ++++++++++++++++=
++++---
> tools/testing/selftests/kexec/Makefile           |  7 +++
> tools/testing/selftests/kexec/test_kexec_jump=2Ec  | 72 ++++++++++++++++=
++++++++
> tools/testing/selftests/kexec/test_kexec_jump=2Esh | 42 ++++++++++++++
> 7 files changed, 213 insertions(+), 16 deletions(-)
>
>

Ping?
