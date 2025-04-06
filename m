Received: from ombertech.com (ombertech.com [74.48.158.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F9513D89D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.48.158.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743980290; cv=none; b=dgF8rWDd2C/Zk4ItMlZVPPWlzYqoKzmswsgjVI98F4egGt8Gb+cGFEybOzccNsrPUVTXhaAanB7ODzYaE5LHTL96uGWfBCExa+I6WENoDCYsM0V4FTv5s1T1zKXBrfeWO8R+yQ1tcsar0Z4mJpUzHMg86OsPBnjASoM1c3mGFWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743980290; c=relaxed/simple;
	bh=dY/i0Dks2KO8z0Hq/GALHzznPitxZdcEM8Oa+/p0C4c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kHF/AuKLhWxOcfuknoi04Dsz69msMPJkK3JAfO8B3V1C/kT5Z6C7a4CMDzXbVrojJjI0tVo998W8SiKs/fBLRFhHeTMXe5XT+lg3ENvRhKmd9qtDvrb8se8Sq4CRMcxz+ZpSab0mHxmn5nzQADhk2+FQLRFecdBS3w4t4T18xak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com; spf=pass smtp.mailfrom=ombertech.com; dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b=fhz9tGZ4; arc=none smtp.client-ip=74.48.158.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ombertech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b="fhz9tGZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ombertech.com; s=2022;
	t=1743979995; bh=dY/i0Dks2KO8z0Hq/GALHzznPitxZdcEM8Oa+/p0C4c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fhz9tGZ4b2hHprOIIP0ktQdx8GudvOOKSy2BxKSoV6MPO5yDmSl8D0JKdaGvWKb4a
	 I91/By6Ig8TJTmY1iqYqc1uE2/qU37DPJQrdjwkM+MKbXs16sgGfq62zP2w+n/lta3
	 xt5id1EUn0W1g+zkkEWprf5BcQ1Ou2qLY0ff+tWwjXDXfZaAy9KraHvhnX3lAFW9X8
	 NTaIbk3XbMCQkGRZ5Fjk6+FuYtP6IRTUvX9O+RQnGQ4fuGl8cW34Rf42CxMy0I1QVL
	 IpbaFi5BTgRFEp3MA26rsH+XcHcjU4BrD6Nnr2vAlffzKZuj1uDLZ5jbt+l9YUAu/S
	 xfmuEpQ5WBKeA==
Received: from 192.168.1.100 (unknown [1.145.193.55])
	by ombertech.com (Postfix) with ESMTPSA id 258175B1A1;
	Sun,  6 Apr 2025 22:53:13 +0000 (UTC)
Date: Mon, 7 Apr 2025 09:58:48 +1000
From: Kevin Koster <lkml@ombertech.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Oerg866 <oerg866@googlemail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-Id: <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
In-Reply-To: <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
	<20250405130306.ca9822c1f27db119cc973603@ombertech.com>
	<20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
	<20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
	<20250406174633.2c581923c145687476191753@ombertech.com>
	<20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 6 Apr 2025 21:02:53 +0200
Borislav Petkov <bp@alien8.de> wrote:

> On Sun, Apr 06, 2025 at 05:46:33PM +1000, Kevin Koster wrote:
> > But if I move "cpuid_1_eax = native_cpuid_eax(1);" to after the
> > microcode_loader_disabled() check in amd.c, like in the first
> > patch, it boots fine!
> 
> Yeah, I noticed that too last night. Here's a hopefully better
> version after I ran it on my 32-bit Atom - I don't have your old rust

There is the 86box emulator which Eric Voirin suggested before for
reproducing this issue, although that adds the uncertainty of whether
the emulator matches real hardware behaviour.

> and maybe you should simply throw it in the garbage - that thing is
> probably not worth the electricity it uses to power up... :-)

Well my testing modern Linux on 486s was originally prompted by people
on the Tiny Core Linux forums finding compatibility issues with old
PCs. But I like to know Linux really works on the hardware it's built
for, and I'm not much better, writing this now on a Pentium 1.

[snip]
> diff --git a/arch/x86/kernel/cpu/microcode/amd.c
> b/arch/x86/kernel/cpu/microcode/amd.c index
> b61028cf5c8a..dda7f0d409e9 100644
> --- a/arch/x86/kernel/cpu/microcode/amd.c
> +++ b/arch/x86/kernel/cpu/microcode/amd.c
> @@ -1099,7 +1099,7 @@ static int __init save_microcode_in_initrd(void)
>  	enum ucode_state ret;
>  	struct cpio_data cp;
>  
> -	if (dis_ucode_ldr || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
> +	if (microcode_loader_disabled() || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
		return 0;

Still fails unless the native_cpuid_eax(1) call is moved under here. After that
change, it boots fine.
