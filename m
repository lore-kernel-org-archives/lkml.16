Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562923C393
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606846; cv=none; b=RcK9RBSMf4JLA9wGrRth1C4wvt5eGVJ3YlSVYFGgtRYfyCZVH9qs07A1aLMwndnX4iA3v4RXMlK5fxbRZXyl8+2uJCMFvXdOAtiVd9WNzqK3VexfVMCnqeCxOI2zcIZ6lsVgB+vefIKeVV76swMRWmdX1Tx9Qpnbd2KNp6iS3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606846; c=relaxed/simple;
	bh=2et4+1tFRUBDxKlH2jm+SKWLLwwNkVddxsNNtrF9zqA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=n6YwBNN9Pr3wlPIoRYnBiNQC17J4q5OZuGVK+rn3903qcH40fASSvBow+cGIBZ9vc6pDrLI3ETJlI9aD3g/FgkxGT4S6MLXnoimE8Kzl6Ox/jpgW3jXdkjjKaqZxdtMlVY2ItFDKa4rtje0cPr8S++mu65+u5GNTVZxL96ZgC2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=SsXwSU6s; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="SsXwSU6s"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 532FDPm0081523
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 2 Apr 2025 08:13:25 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 532FDPm0081523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743606806;
	bh=rBQ9vbx5WwUZnxioFnQCAQxQGMrLPM9huNEt/MpV618=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=SsXwSU6sUia1/fAzbBqlk1XNUZPMRMsmGIMK8NZGnwtLtwCCxv7LKeBBkOoxOzrJE
	 emyIviWRLSB26IekRzOfGmCpeoOlsEI6XcrRKa01uuzf0zLhHoLOONtI2oktLB8YmD
	 Cf1BMkrB9dmdDZqtt1nv6JRTsgX5HnfJ2AXLnkrI17jrcxQAf6ZvzwZrff2GQ4mi9i
	 PWLnLRh2i7BCVpzhEWex6/LVcCAxJxYOE4lXcqCekIPKt6EBiZEuJBaFNuBKYeYjit
	 X7rjftnEauaCCZWBYoopHT7Oe68kbv/26Fo/6Jc6ngmpG9OQ7i20sg1HD115Stc53L
	 N5xgyZkcnjGqA==
Date: Wed, 02 Apr 2025 08:13:24 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Sohil Mehta <sohil.mehta@intel.com>, x86@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Kai Huang <kai.huang@intel.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Mike Rapoport <rppt@kernel.org>, Petr Mladek <pmladek@suse.com>,
        Jani Nikula <jani.nikula@intel.com>, Tony Luck <tony.luck@intel.com>,
        Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] x86: Cleanup NMI handling
User-Agent: K-9 Mail for Android
In-Reply-To: <20250327234629.3953536-1-sohil.mehta@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
Message-ID: <F5D36889-A868-46D2-A678-8EE26E28556D@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 27, 2025 4:46:20 PM PDT, Sohil Mehta <sohil=2Emehta@intel=2Ecom> w=
rote:
>While reworking the NMI-source patches[1], I spent quite a few days
>understanding the existing NMI handling code=2E The intention of this ser=
ies is
>to fix the inconsistencies and redundancies that I encountered=2E
>
>This series also includes improved documentation to make the code easier =
to
>follow=2E It does not introduce any significant functional changes=2E
>
>I have tried to split the patches logically to make them easier to review=
=2E Let
>me know if some of them should be combined=2E The patches are in no parti=
cular
>order and can be picked up independently=2E=20
>
>The documentation updates in patches (5, 6, 7) are to the best of my abil=
ity=2E
>However, I would really appreciate extra eyes to ensure it is precise=2E
>
>The updated NMI-source patches will follow this series sometime later=2E
>
>@Ingo, I tried to format the commit references the way you prefer:
>
>  Commit:
>    feeaf5512947 ("x86: Move sysctls into arch/x86")
>
>However, checkpatch seems to dislike it, so I reformatted them as below:
>
>  Commit feeaf5512947 ("x86: Move sysctls into arch/x86")
>
>Is there a specific guideline for x86?
>
>[1]: https://lore=2Ekernel=2Eorg/lkml/20240709143906=2E1040477-1-jacob=2E=
jun=2Epan@linux=2Eintel=2Ecom/
>
>Sohil Mehta (9):
>  x86/nmi: Simplify unknown NMI panic handling
>  x86/nmi: Consolidate NMI panic variables
>  x86/nmi: Use a macro to initialize NMI descriptors
>  x86/nmi: Remove export of local_touch_nmi()
>  x86/nmi: Fix comment in unknown NMI handling
>  x86/nmi: Improve and relocate NMI handler comments
>  x86/nmi: Improve NMI header documentation
>  x86/nmi: Clean up NMI selftest
>  x86/nmi: Improve NMI duration console print
>
> arch/x86/include/asm/nmi=2Eh      | 49 +++++++++++++++++--
> arch/x86/include/asm/x86_init=2Eh |  1 +
> arch/x86/kernel/dumpstack=2Ec     |  2 -
> arch/x86/kernel/nmi=2Ec           | 87 ++++++++++++++++-----------------
> arch/x86/kernel/nmi_selftest=2Ec  | 52 ++++++--------------
> arch/x86/kernel/setup=2Ec         | 37 ++++++--------
> include/linux/panic=2Eh           |  2 -
> 7 files changed, 122 insertions(+), 108 deletions(-)
>

Talking about NMI, one thing I would like to see done would be to explicit=
ly enable NMI at the point where we are ready to take them=2E=20

If we enter the kernel with NMIs disabled, using IDT they will get spuriou=
sly reenabled the first time we do IRET, but using FRED they could stay dis=
abled until we enter user space=2E

It also seems "cleaner"=2E

We ought to already be doing something with the RTC NMI gate register, so =
that ought to be in the same logical spot, too=2E
