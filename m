Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E920A5F1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335032; cv=none; b=Rt1opTsltkvNT/QnaA8rYE6TnXv6SjNmb1AlLOSqDzC/SEi6xRlLLXFhdNc7se1xfXThaiYSdP9cI5C1o18UikMWwdoD0t409ZdNsLeSq5ECGjEtATgbDz0qnqf579Kz5W+B5vXtqY7tEhqayUxMceTELQjSvQqv9uSTTYoVPXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335032; c=relaxed/simple;
	bh=FvylAnTEIG5Vio2B4xrhvp/MWFzM+c0OvSLGHwjDWLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LO9rV1E0DObDc7nP6X+Py9VtGntMTS9xQteLhPqNM2c2KC1JjlwVnZYUMA605wOmQdovk3Mqt2EDH2jnP6QPF4vD+jD3TDhKP7m6IiZEQVEjWx3ecY4hbzjnxrXGB5IE33jhPull3/T6LMLhIXuPw8wm7ScjbFAbQiLcpsI+4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FYth9XaA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Hnp3PvLE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FYth9XaA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Hnp3PvLE"
Date: Thu, 15 May 2025 20:50:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747335029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tqsECffWPRuvXsMfc+IAbrICGNxlF10REH/u/L9VxDs=;
	b=FYth9XaADp10R4NPKoZy2SvN8f+tvBqD7ur8soulhfi9xFkZPiadCnHtj0iOctwXnvk83e
	jAzM49lWMJF1hD8ToEJhLjB/wya+8j3++Wp7Kz4OqCRFovUwqwayl/wzCjrfmYIiTvDbRz
	HgfkcDIipr108aj6CIvfEwK6iHHXt09g4q8L7tEhIejxmyWURJtufvlFH9COIE1ZKz5qWS
	Yrzi/0yVKIqRUnkmUtkBEx3TA4m53vLSB6Qqu6Cgvt/hZdusieWndIbSoL/hJN5oBHcW8i
	3ENmkSFW4xzYq4KrPDrncWSHR5Jt4STbueP54lSwhm1ZZkQTlrFNHz5safnO8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747335029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tqsECffWPRuvXsMfc+IAbrICGNxlF10REH/u/L9VxDs=;
	b=Hnp3PvLEGVaHKHc7Mf7bNJAbjyNPI8Lwp8B7qY0rk4OvO34F/UxXtyWQITxui/l4yE08P+
	Z9WxNGvxoZCvt9AQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/9] x86/cpuid: Headers cleanup
Message-ID: <aCY3c5l7FFdwvvv9@lx-t490>
References: <20250508150240.172915-1-darwi@linutronix.de>
 <aCYbiLjkWM67Ogj_@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCYbiLjkWM67Ogj_@gmail.com>

On Thu, 15 May 2025, Ingo Molnar wrote:
>
> Thank you for doing this. I've reviewed the series and applied these:
>
>     x86/cpuid: Move CPUID(0x2) APIs into <cpuid/api.h>
>     x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header
>     x86/cpuid: Rename have_cpuid_p() to cpuid_feature()
>     x86/cpuid: Rename cpuid_get_leaf_0x2_regs() to cpuid_leaf_0x2()
>     x86/cacheinfo: Rename CPUID(0x2) descriptors iterator parameter
>     x86/cpu/intel: Rename CPUID(0x2) descriptors iterator parameter
>
> I had some questions about:
>
>     x86/cpuid: Rename hypervisor_cpuid_base() to cpuid_hypervisor_base()
>     x86/cpuid: Rename native_cpuid() to cpuid_native()
>
> and you had better ideas about:
>
>     x86/cpuid: Rename native_cpuid_REG() to cpuid_native_REG()
>

Thanks a lot for all the support as usual :)

I'll send a v2 then for the single one left:

    x86/cpuid: Rename hypervisor_cpuid_base() to cpuid_hypervisor_base()

and indeed drop:

   x86/cpuid: Rename native_cpuid() to cpuid_native()
   x86/cpuid: Rename native_cpuid_REG() to cpuid_native_REG()

All the best,
~ Ahmed
