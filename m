Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021411714B3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744630018; cv=none; b=QgiAOEbvlWbW0bSB6OCnFbjDwBadqEt0MKKjclEP1beggRA+KLw+rIE8rvuc2Y/rLxADtPBX3ur7eWK6S+11vw5MOzzIXs3qTxwSTJ5eAMWLmk4EmcXag9DkSfBfvDksRFie8ujlkEyovjAanKVmGpAoxKin7skbzWFaVupRx4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744630018; c=relaxed/simple;
	bh=PcVscbJIwX1c9QxMKgyKhTEJQPzoJAPoOaF9FWJcDg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpmsfzEC92IT9iz9BkuDKWFt6tb8lUNt2bEXCHLJcpsybeK6v9pO0ltQhGRsEdDCkMOaE80hk8DqR6osN3K9qtRwOwvCHOlAP8TRbIj27E0Rr/tKw0uU62kcRfcjvUQpHgYkEZ9uAmnuNFsTfeOkMk8aZ/g0XlI5I8Ban3yZz54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=G1ygKTR8; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="G1ygKTR8"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8431540E0247;
	Mon, 14 Apr 2025 11:26:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8P-BOrCkdaV3; Mon, 14 Apr 2025 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744630009; bh=YvwoXRXvaINmFtRGTjqmuIJtyUKpZ36Yv9jwWPf86fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1ygKTR8RJcytUDAS/+PnMp2y4I2+A41ZOuOeCMrpIOi2kXeFgle3uL0hOJy6c++k
	 9Nofr/DwfQhDwpT9ruaMXrmwMHBCkzGLcR7MjnWbo2GHTCyFkAf32ykAmrbjof0hh3
	 whjVNI4X1UXcN18lu/pWY36ht8mq6TYYJuTMHNrp4hbKN/4T/uMH1ipifr9Xdm4uOU
	 cz0/8DO/snvvSy1oARHQCoxgDgwOsiFJMTl4Y6vKXn3W5MF3gWHxHive+x3YfCqRjR
	 kJjkD5UvoWnMZroIginwFsGNwUnq3drUvjOw+2tdqlXoMDZidldGg9vK0rvLtI2DZI
	 TSq0hyaMZMxPP2iHen0lufYze7tG5n9laNEvSCs8HoAosJHxKwUlJT/NIJFZnKF5Lj
	 Jd1TdtLqRhkSViZrv4ISWx3hX4UdQHTaYIJ71X2dM+nlC2NyC9FaUs6MBD74+ZuDc6
	 4kWUq9A+LoOgQpEBAD81Lzd0zau8cMPeyoPrTExL2TNJD1nc2Zj4YM1cDz1/Tl3ygt
	 GmAvSg4K8WiWD/d+SAZz6OqTta/WkG31ELXmTQyav7ZV3z0I5zMg0EowSTWhhF+1dL
	 99DSX1v6jiA8jnAF+VnwRs60fgCZtlOpHtG7sOmYUgME5zjnMEg3MYXlPBj1pveIQ3
	 igTpCOsCJ+7dWu9vLmoaW20M=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CBC7C40E0196;
	Mon, 14 Apr 2025 11:26:39 +0000 (UTC)
Date: Mon, 14 Apr 2025 13:26:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kevin Koster <lkml@ombertech.com>,
	Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -v2] x86/microcode: Consolidate the loader enablement
 checking
Message-ID: <20250414112633.GBZ_zw6WlMbXr7q7cM@fat_crate.local>
References: <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
 <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
 <875xjcteq2.ffs@tglx>
 <20250411110741.GCZ_j3_dLFQ5fGhHqw@fat_crate.local>
 <20250414095933.GAZ_zchcLNPpUHF9IN@fat_crate.local>
 <Z_zoG9Dn0u4ngMrj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z_zoG9Dn0u4ngMrj@gmail.com>

On Mon, Apr 14, 2025 at 12:48:59PM +0200, Ingo Molnar wrote:
> BTW., any objections against:
> 
>   s/dis_ucode_ldr
>    /ucode_loader_disabled

Well, "dis_ucode_ldr" is the user-visible cmdline option. (I admit, it wasn't
a good choice back then but we had exposed it to luserspace already so there
was no turning back.).

So if I rename the internal var, there'll be a discrepancy:

        if (cmdline_find_option_bool(boot_command_line, "dis_ucode_ldr") > 0)
                loader_disabled = false;

And yeah, it doesn't need a "ucode_" or "microcode_" prefix as it is internal
var now.

So yeah, I guess that could work because the discrepancy will be at one place
only, at the parsin location.

An additional thing we could do - and since I'm fan of namespaces - we can
start supporting a "microcode=" cmdline in parallel and have it do

	microcode=disable

with the same functionality. And "dis_ucode_ldr" will be deprecated and it'll
warn when people use it and will tell them to use "microcode=disable" and we
will phase it out after a loooong grace period (think years).

So yeah, something like that...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
