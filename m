Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499131DE4C3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755444; cv=none; b=Ry/vU2QZ+MAgwnj5k6t0FLN/cv8wMcSfWQwWwE441hn5VLXdn4+GmzDtJiirS8h+9UYnO2zTUrfapHi/cCqA0+LDg9y0R2KbynIiVffvixrsCQkl6F3IW7fPsG6ElXm3GO6OVdXYJNdyNHYDwr3tZpHkX/Zpo5NfRKbc3mNOK8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755444; c=relaxed/simple;
	bh=of5v57glO70v4geqyCkOK6IF3XI+eNn/Yya+oMglVBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NieKlCr6nk8vDvCnuqMn/CQOzWXaog498SY8Ms3N8PZk5YZL5l6AnHYs005KmL/PRPctVe+fCBFv9G0ezElOUhND/h2yL79+qjmhXbHruZxyF3DUUfVZw1uxgBGK/p1eKu6IfM9IVGOdm13VuGGUu+8nuM0rfgGHzrfibPrcPWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Ge3ejjmT; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Ge3ejjmT"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 14F6B40E0200;
	Tue, 15 Apr 2025 22:17:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UTLeQtGprgwl; Tue, 15 Apr 2025 22:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744755436; bh=fU/gwMrSl7SyuKsX9jLjCnOcxSKA9Sp11Rp1Ryc665w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ge3ejjmTcNocFTIyepBLteHsu689NqpNGlADTMU6sQKtzEQA4lhY5mtYiLlo1Fg+f
	 u3PEKt3gpX0UpdkQzKWfC/l+EijNwaJZKMfWIrn0Mb41TZ+gSBEUEM7h1BQZmU/Qnc
	 3AJvmlzUuY9UkGyUGaQYUoaJoBmgQzkjX4KCMESizxQsBwgp96sdlS+l7T7nL5+MRH
	 M1BfojTioA8mcilXyiicwjhamYiQ1dwljHOraYwwjXjLFt6KSh/mX6j6i092jBivYv
	 1slN43XveLBgzU7rRDV/b8CZow0AZyyJhtfzlZS5meSS0je+r9KLL7Y2nEsxRpeoRn
	 c5S886AG11sBD3P/xxFMSyuEKAeRDZv+Ukbc2WcOGf9mJEvOcZ7VWtQ6qnc9Wc6oAA
	 OOtTcC2em6tZZqdlkaJ1qJdJWgoZSxrRbKpsE4uL1qTJlX73RBzpS+LNQLjc2fOqF9
	 t2ta8m85oacDXZJNeob+DLvCsSusWJWlFaF5wnOHrYrToRtsyiqaC5ehz4RV+ov4XN
	 s/CHNrjGOMEI3OBjjvFxKpLPxKpBV8RboEvuIclS1LHOKFp2mG8MswXxHhYxBEyHel
	 VZbCxuxgHqcVacwlrlkJxE5xqsMxTVF1x6thC8tWeXhxyuZr3a7kWLDj9MZ1Vt2zTO
	 rn4opNpRqHts/DKTtbmyhFsI=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F1CFF40E0196;
	Tue, 15 Apr 2025 22:17:07 +0000 (UTC)
Date: Wed, 16 Apr 2025 00:17:02 +0200
From: Borislav Petkov <bp@alien8.de>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: thomas.lendacky@amd.com, David Gow <davidgow@google.com>,
	"x86@kernel.org" <x86@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors
 during kunit run
Message-ID: <20250415221702.GMZ_7a3meDh4e0L11s@fat_crate.local>
References: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
 <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local>
 <995cfca8-c261-4cf0-96f6-b33ca5403ee5@linuxfoundation.org>
 <20250415180128.GJZ_6e-B3yFuwmqWWS@fat_crate.local>
 <8b08e040-fee7-4344-8ba6-bbbd4f73e318@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b08e040-fee7-4344-8ba6-bbbd4f73e318@linuxfoundation.org>

On Tue, Apr 15, 2025 at 01:06:49PM -0600, Shuah Khan wrote:
> Does your arch/x86/realmode/rm/pasyms.h has reference to sev_es_trampoline_start?
> 
> The one in my tree has it.
> 
> arch/x86/realmode/rm/pasyms.h:pa_sev_es_trampoline_start = sev_es_trampoline_start


# ./tools/testing/kunit/kunit.py run --arch x86_64
...

[00:15:36] Elapsed time: 58.840s total, 2.096s configuring, 53.170s building, 3.487s running

# cat arch/x86/realmode/rm/pasyms.h
cat: arch/x86/realmode/rm/pasyms.h: No such file or directory

Could explain why I don't see the issue...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
