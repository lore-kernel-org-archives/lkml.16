Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9245F26A1DE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747334548; cv=none; b=e1OJwAid+8KwaeBS9oef2BKIJESw5En1RBlEjt6j6vaaf/Ei/h+7A5pD83poMD4HH2a2reuGuOCJrgFfUBIRwwX0rulBZ0IbUXQAcHc+lBCEshfcOkoyjNBqnH+g2Tb9rhRRUPWstuRUzOjG1AxQOlqOCF6mCXUCvVaIBqnTfzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747334548; c=relaxed/simple;
	bh=xX71QQXiMVB8DT2YKZd0NlvdhoOe6QRL0MmmliZNwnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giI6IHHid+dLl8Yqb689+bMJrj3+izwV5Bg1MgPkbkz5k+ArtzP8TNDEFYLrDC1wfsN6JgC5+Q7ske2M8RfhllB0mG30dtvSWj8s101e8qpQRP+Xe5nZG7yAQ2T8pEVoCpcUHthuRWgiFCk4hI87qG65eSDVn/54e4vHznES3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y+/O0CFl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P9QLyHuW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y+/O0CFl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P9QLyHuW"
Date: Thu, 15 May 2025 20:42:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747334544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xNKPWRqnPosQVnhlgime5c5yqtuONUfeRM7MtaW+/2c=;
	b=y+/O0CFldvZhodnfLLdyMJYYGgsjKjepG7QibeCQGevrYfgDHCSjY9BtA11L7LTJ35j7JG
	7SCpXq+CQ7F5D1ip6HHg/CL188URF6BSXIR8fa1iyj7WVQia2+6xlK+8vSHGYfbFXPRQ+e
	F6irl1SgMCnRbwfp7k+dbvgQOLkg/fUD5eLscq/r5fJUFFpZ6mhRk0Uf2Q64at9KDfwDU9
	F3cEnDNNSpuc8MwETF4TE8vftPRR+KbnhZbf7RjLMRQVbnphswFtIvjoaCvupnytx+XLHs
	nAcC3gxbl6qEyWtwecDRykzNzOQpuMO7Fwn/fKtJU02QFAgmMb/FKOuTigCapQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747334544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xNKPWRqnPosQVnhlgime5c5yqtuONUfeRM7MtaW+/2c=;
	b=P9QLyHuWR7WbByaMgIzi2dcIRWSZr9gB8SLxHCM4Kx1GPtpnoYGcXy5qtmOqdbn05Vvbf0
	oUMHGNojJCXWbvAg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 8/9] x86/cpuid: Rename native_cpuid() to cpuid_native()
Message-ID: <aCY1j0AksHZQvmWQ@lx-t490>
References: <20250508150240.172915-1-darwi@linutronix.de>
 <20250508150240.172915-9-darwi@linutronix.de>
 <aCYdlAgG0rrEXtFK@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCYdlAgG0rrEXtFK@gmail.com>

On Thu, 15 May 2025, Ingo Molnar wrote:
>
> * Ahmed S. Darwish <darwi@linutronix.de> wrote:
> >
> > diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> > index f054bf52c10a..4b617f8f9b7f 100644
> > --- a/arch/x86/boot/compressed/sev.c
> > +++ b/arch/x86/boot/compressed/sev.c
> > @@ -494,7 +494,7 @@ static int sev_check_cpu_support(void)
> >  	/* Check for the SME/SEV support leaf */
> >  	eax = 0x80000000;
> >  	ecx = 0;
> > -	native_cpuid(&eax, &ebx, &ecx, &edx);
> > +	cpuid_native(&eax, &ebx, &ecx, &edx);
> >  	if (eax < 0x8000001f)
> >  		return -ENODEV;
>
> I'm torn about this one.
>
> native_*() is a pretty generic way to denote baremetal methods, all
> around the x86 tree:
>
>   starship:~/tip> git grep -E '\<native_' arch/x86/ | wc -l
>   682
...
>
> I think it might be better to leave these as native_cpuid_*, because
> shifting a naming inconsistency into another namespace isn't really a
> net improvement.
>

Yeah, I admit I was a little bit uncomfortable about this one, especially
when modifying a call-site like:

    => arch/x86/kernel/paravirt.c:
    struct paravirt_patch_template pv_ops = {
	.cpu.io_delay		= native_io_delay,
	.cpu.cpuid		= cpuid_native,		// stands out
	.cpu.read_cr0		= native_read_cr0,
	.cpu.write_cr0		= native_write_cr0,
	.cpu.write_cr4		= native_write_cr4,
	.cpu.read_msr		= native_read_msr,
	...
    };

So, indeed, ACK.

Thanks!
~ Ahmed
