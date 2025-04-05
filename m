Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B502F36
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743886241; cv=none; b=Fj9HD6ia2wwJdLkal5eSY7Zsz8ZrXSRiL/3Xf+q0AZuAqjMY9Oph/R7WG/Z9BSd1fPVxwEs9PplVuWR+jkPVaPvG4V7SdoDtSLCTxjH4IFnYwha/xq62qvn8ZjekcqSpxpkQZC40ssyzbvwpJcNy/R5/B9OlEk49ASE4Hg7GzdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743886241; c=relaxed/simple;
	bh=aWB8JDY+vGaVXRU8LlY80umc4/VTsG6GPQzvbz7dbIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cd/GkL63CfYu2c6URp/3fwtf4Qu18dwfL27TqS1MT/je1qoAqt/OKQM8F/RmRC7iIpgV1YlYDMwB+l/3PDm73aMFrdhnr9E9Qhkb2U0w97SLX1Oh5DwEWwP1mVJ3bT+qBewXDgWxQ4RA4Ng6YivsRnA0Na+NZbryjFqoRnkE2/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QmZ6JGPV; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QmZ6JGPV"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DF25D40E015E;
	Sat,  5 Apr 2025 20:50:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id P4rBmPvBRyOD; Sat,  5 Apr 2025 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743886231; bh=THlX9a+QzLl8nnEiV1w0ojpEAXiVFl9VW3HVZGdUYMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmZ6JGPVcpmLXb/uJ++sMOjolFFmZ7f2uuDRix+zihz08xzkQfFtJoY5mtCWpCAmF
	 SuEqclWJpq65Q+mUjmeLds9OE2a462kcAm2mHnPXx1qVj0Xb4/gtg+cjszCviplimd
	 t4MHQd1h6DovdK7Cw+DBWl1x0wkvXh+eecaymy6CIH98higDjUy8WCqa8YFCmpRR30
	 mSSN6iF6iwrHPx9IbYm677/Aw6YXU/ILEaBLFa875GhX/vglxFe8/rCpsMRDWCVxta
	 6wilhB3x5PSqwFFub4uwp03KUogIP650YJHst4uap24t9oFPtC+Es0iUcIeYS67jYi
	 qZdM7zWlBpEQrjZ5W7PSbnV6eZCMU/PghcIMZ9nAUluXuk0cSaK+UNtXF89T5OSvQa
	 KgbEfLSS1+Rz/R5EUcpSukXu4cjiqpzp5EPqHvQ+ii8mHVUlrE8HWPkIYi2Be0VJsB
	 BFW6cQW1iptd6bipPZt6HG63x+3sgEx9vGfpod6RD+xxCRdUbqXQ30lW2n2fzrlLRv
	 sEa6G01ZPZfpMsNGpwFifCj831XZSQwKN1qy5M91nmeqGkTS50xvKcwkmvmAcGm0xj
	 eKNWEsGybT9Eaq/9TNwbrXEryQnQPHI/7yqlvhpTYV0p1H1gL/sW3/7Oeb4dHmp7Iu
	 F6+Vn9z3MK+iGjIAGcL+lLFE=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 331F040E016E;
	Sat,  5 Apr 2025 20:50:23 +0000 (UTC)
Date: Sat, 5 Apr 2025 22:50:13 +0200
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kevin Koster <lkml@ombertech.com>, Oerg866 <oerg866@googlemail.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-ID: <20250405205013.GCZ_GXhYBEsH73q1MC@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
 <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <DB27EAFA-8793-4B0E-BC33-C9E9E2C41777@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB27EAFA-8793-4B0E-BC33-C9E9E2C41777@zytor.com>

On Sat, Apr 05, 2025 at 01:33:46PM -0700, H. Peter Anvin wrote:
> How the Hades does c->x86 not get set to 4 (hence < 0x10) on this CPU?
> 
> That's the real bug imo...

Go to the first mail in the thread.

4c585af7180c ("x86/boot/32: Temporarily map initrd for microcode loading")

walks straight into  native_cpuid_ecx().

Which reminds me - I should remove that have_cpuid_p() in load_ucode_bsp() now
too and move the disabled check up.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
