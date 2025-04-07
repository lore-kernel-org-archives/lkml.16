Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D144822FF4C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021792; cv=none; b=YrX3tfO7AU0Ow7QSsmCP9n9gkisyyuSWEXMkcFuAq5neJpw2QOgfvS2/WYNxzTcFSwOAwpsImeFyrmZdni1bnqyX6SAKJbuQkiu09K1MZjE5MYwRl7XJrHHHDGpDlu/ljhhDT3NQW3/dbcc3MO6NRFS5eGco7MAPqfxr66WAROU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021792; c=relaxed/simple;
	bh=iR3K6l63ZRfVxgJOHyFqckQThS9FIWgPNEnWkYtqzjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hL2hqyRXhvmG8dvKoPH3tbR8Xd1YPnGG51Ns5XKerBeVxJZake09DiaKKh+glPqYxZWZJZJgj4ZNiVPpl/jV+3guLccNrIZt8VF+t0JkX1zgFVheSfm6XKMiJwd5g0j6YrLUF6mdcaHhsJsRvR5YsNdWtBq/XuJ+VE95bGl45co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QLtuE88K; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QLtuE88K"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ECEE340E019F;
	Mon,  7 Apr 2025 10:29:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dCtxv0J300I7; Mon,  7 Apr 2025 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744021781; bh=HnhVHfXUKvxV249eCFU/UYBQHIvkvBe9gS5FoIgRPPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLtuE88K6Ka6yxdSfyNlsFCvdHVqtX3Olfg4FkQhvO5n0ph/2PIrPBY7fDvmBt7pE
	 CPdEL5QwmmmxIDOMARNAlGKJ27AI27KmqVEtgiiAQ4tGzIT9oBZQeGnot+fAWjq4Gc
	 FwwZ8NJpuBjydOFCv+CjukvPaVsj4WSNBxmFxRe2GpSgkaTkJ5xf383Zi/nclHs2af
	 f5B8yMzL3uM8iMiYZKao0ByXQVYAkXcdIDANh7JK1I4eEXo4Wizc4EppZlLjHWtqK0
	 IbVllEDfWsQFCDoakRxBtEtfwDClTXn2HsItqUadbMZJ4XlAI7kWMVbFwm8FjBGbXz
	 IOmloe1SSCmAMulCqlzOFfAevFC1Dl12nmPsELYrx3NorEPtgAGBNajpp3OVTXb9it
	 8U89W6OVVGdlP36ZKD5FJ1R7Ye9YdEuN71gaxNeqFwYQ1SvY/vD2oPvDr6S8w+9Qvy
	 MyuGQmlFLc7cB1qSSgmuLAOZnR/za+KWcHMDiNTx7E8xqCWtErG077+Y2Kpoi78eR5
	 pDCKdT2WEB3oFeNe3BHNFZhtNK5zR+9k6LETY2dC17EeIAWQ6VzH7AHbbRzk7rOjTD
	 cufq8ySOW6pgaIM09hqOsfMopOAw35kVOgPtFMfJ/JKxmo0EqKg/6p1mMlTSyQl3KS
	 gRDV3oa0PZKf0YQXssgI8yoU=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8947340E0213;
	Mon,  7 Apr 2025 10:29:33 +0000 (UTC)
Date: Mon, 7 Apr 2025 12:29:27 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kevin Koster <lkml@ombertech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Oerg866 <oerg866@googlemail.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-ID: <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
 <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>

On Mon, Apr 07, 2025 at 09:58:48AM +1000, Kevin Koster wrote:
> But I like to know Linux really works on the hardware it's built for,

I don't know what that means.

> and I'm not much better, writing this now on a Pentium 1.

Lemme guess: this is your main machine you use for daily work?

:-\

> > -	if (dis_ucode_ldr || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
> > +	if (microcode_loader_disabled() || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
> 		return 0;
> 
> Still fails unless the native_cpuid_eax(1) call is moved under here. After that
> change, it boots fine.

Please show me with a diff what you're doing because I don't know what you
mean.

I did this:

bool have_cpuid_p(void)
{
        return false;
}

in order to simulate no CPUID support but my 32-bit guest boots fine.

Also, send a full dmesg from that machine so that I can try to reproduce here.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
