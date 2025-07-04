Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B3F2737FB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628747; cv=none; b=aWoDUnsXssqeW9eGlE8ZPZzs53TpwdqoO6IrAEYBAukgcfWLHQttpQIodVNc4k8yOYe2dvF+d7+fDt1ERbfC6ac0endIavUivBo7E1XP2t88Tm47lclr0lNbJ2KHBqIozR+BgZfVBzQCb7wnL8Ez9H73/LSwLh4AGXj6wcccgG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628747; c=relaxed/simple;
	bh=Mwa8QQjryeACcPbhmM+rXoHSJt81/ZGnvnYXxzP/0RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnmLcDYlq3HmSuRJxFBLrj2vtnGGyP8owuyOnoygIYxcxTVOPVNXKK5KMU3w/Kmg6MbKiP+6qKrUCQjzVpaRTMx3WBKcJ7BlY9olWrfRpuUWIvEXxV0CVqt5EzuR6e7h9LV0pHQD1Wjj2rKhABjfolSsP05rotbDciqk2OMqroM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KfdKSA7E; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KfdKSA7E"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 598F440E021C;
	Fri,  4 Jul 2025 11:32:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OOW8D8MQCpsM; Fri,  4 Jul 2025 11:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751628741; bh=JJ9d/2Q2biuZzIo5WZt+iA3CEavN5Jk/1HACCKDZxtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfdKSA7E5got+vVLQhcEV5BHJltMtyJ83twy2wXl0DjnRj6ASRRW+oO0huHtnFYQK
	 IArz0cFuR45n5pHqFyLvcgAIF/qaSuoa4cJHpqBHBWMN72ss/Ym/0V61D8QueZ9uxg
	 YYlIjpIG03ApPRK6FOKt/mx7NW5XyCXEXQSVq1qz3u7KKipXn8rGkru1GshBJdI3gY
	 5ELASoqrhsEufxoeO4+AQ9cr3QTgjJBoGGs/jTF0o29mxVRucmTUnKvfvKAzCZndaJ
	 PqUPBgancxFgvmXDR8FdS2sO/+K5Kfk81OFiXtQr7AhkRIrRZ1lQmFjo+h2sSYgdHu
	 EcQfx6LinxqQmgZ7ylIBWF1TvELCtgGGGL65PxnApqxyUBLz/tiugBgiAbIvjgwsxV
	 ZhXwYFC9dCyJYhFJhHgVkAKF0dOJUZ4x76n2nXWQmDNUWgUhSZ9mM49jEvY8Avw4v3
	 eH8rVcOv7IZ6UluU5l1dfCeZIKHxA17EBzojOds/c/vnSS1ox7suVRaEQRuVc2ihgP
	 GKlu5Z79QeACjfbbT+m0RkmKlrVfr50amzjtYumA3zrM5S0NYu+//6BNVyzTNx48Uf
	 8lUAybch6MGnqBW3Dk3C4r3K9jqM3fQMh4kF7pz5dQBAfOJ45ferDCXDadoKlqfY5X
	 ANYoHSP0//w7TI65SCtwpVvw=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0DDAB40E00DD;
	Fri,  4 Jul 2025 11:32:06 +0000 (UTC)
Date: Fri, 4 Jul 2025 13:32:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 02/44] ASoC: Intel: avs: Include CPUID header at file
 scope
Message-ID: <20250704113201.GMaGe7sZritvfQT0uz@fat_crate.local>
References: <20250612234010.572636-1-darwi@linutronix.de>
 <20250612234010.572636-3-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612234010.572636-3-darwi@linutronix.de>

On Fri, Jun 13, 2025 at 01:39:28AM +0200, Ahmed S. Darwish wrote:
> +#ifdef CONFIG_X86
> +#include <asm/cpuid/api.h>
> +static unsigned int intel_crystal_freq_hz(void)
> +{
> +	return cpuid_ecx(CPUID_LEAF_TSC);

I'm guessing this will get eventually converted to the parsed struct in the
end?

I guess I'll have to continue reading and see... :)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
