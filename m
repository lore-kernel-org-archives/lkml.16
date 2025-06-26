Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96202F3630
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949767; cv=none; b=QCoIIvqOPREEGcfrp5S0icYXGLSUI5h32BtQpNOQAIYBSASc9k2jbod0m98gx+S+50Z8W3R8HUNwK9cO75Ruqeh+nGpqAgXYUYlFd+euPRfB3E/Rhanoc7U3NN74S6xpLuUzkL1iVQdZ/NCUlN9PfwPlOntY2m+Qy0aozfzWeLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949767; c=relaxed/simple;
	bh=5wyDlCrR+MoRcPaALI94qsHK9mOv3DOWEBPYizBK8SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJ9s3bigcURQvqvBFL0625IZHWmXiYTOEywYNyBP/9gzQ/gPu9TnZXDdbmjIsyhiAPxIcVI9v5xUjHdbd7Hqah8TddQymCplk/mpW1iSIPyjJa1/Pa4kZHAhkr4dq8ampWQPm8EqlOURIImrXP+FGvTEgEAhNu6xgAGPvdTcSYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=WO3oasqc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="WO3oasqc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AD19940E00CE;
	Thu, 26 Jun 2025 14:56:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id c9MN40HnSMga; Thu, 26 Jun 2025 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750949759; bh=EFy7ntulGE/vVkDHzw7CPS3UkUvRnb34+HSxVnfd2no=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WO3oasqcR+wVs9a2yA43UdL8lFJ6R15c53iv0TzRYpT9i8yID4IQpZUrjEqFMfuZP
	 9P17rlKg/H+alDC5ULr6W8HCy++22I1ff3kKQ4ETgQTcnohOuNIl1P5CnPexDs+KUn
	 hKw87TDWLQj8Gt1hLgNOUZ5Tff2YwJHVu4ySq6NvPkTmM/puF+BT7Iq6ltQdswOS2X
	 /jWec2WW80wOHA+a1Nri5vZiUEXHhv3B80T1YpI/aKIj4GGcB79cP7vFYTcJWGADhq
	 b1GL6qIuj8cNN0XZWW+mupHBDSSh35lR23OMl273vb48E7iLcgMS3M7TWT2eEjHu3V
	 Qz0sfA9Pnv7xXEMA+IbGfozVYauq1oKu5Jyz4YtFSi5apJkJjUIGaZTGUfXFCTB4BN
	 6wqT2P9Ndfm2ZoU7pyKfOVgMo3gvvookWv20GU2i91zhMVTr9+zmYfhsO6txLvOKBm
	 ngU+hTYZOi/NyX3sLj+41D33Hb7SwTOSpiW3sFRm86oXArgAhBgl2dHsrXcsFasoqY
	 Dkol8QURdCxGEOFxr3Fr2jYT34GEI/RL7KTt1/O6TGmcpBXa2BuIyEI4dyPae4EXbo
	 684XAGwdyHKCYD73GLC7bjivzAJ6I1UgAdAgGzmD4AlXVYO2EHpj2UqIPJD+GY6VZi
	 8c1AydFkFDZaMYknZcLydkq0=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5B61040E019C;
	Thu, 26 Jun 2025 14:55:49 +0000 (UTC)
Date: Thu, 26 Jun 2025 16:55:43 +0200
From: Borislav Petkov <bp@alien8.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] x86/bugs: Remove 'force' options for retbleed/ITS
Message-ID: <20250626145543.GEaF1fb95lZXESXkl1@fat_crate.local>
References: <20250626142703.716997-1-david.kaplan@amd.com>
 <20250626144047.GN1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626144047.GN1613200@noisy.programming.kicks-ass.net>

On Thu, Jun 26, 2025 at 04:40:47PM +0200, Peter Zijlstra wrote:
> Testing; I use these things for testing. Makes I don't have to run on
> affected hardware, I can just force the feature on and inspect the code
> and ensures it runs.
> 
> If you use force, you get to keep all pieces -- no warranties.

Right, I don't have a good feeling when "force" makes a machine unmitigated
all of a sudden.

And we're not screaming nearly as loud as possible when =force is supplied and
for such a thing we probably should even taint the kernel.

I'd prefer if we don't expose =force options to the general public but make
them depend on CONFIG_DEBUG_KERNEL perhaps.

IOW, too dangerous.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
