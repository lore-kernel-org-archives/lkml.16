Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB2325D542
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197869; cv=none; b=MncBVASLuStGNlOJHHltTaHO7Y72fmbSnkUfLYuLw5VK1LTKr5D8nBJ8lSmHWH8akbZIYJxQG10yrCBs5NqtlUBMy8ZPqGkGhc2ngBCU4+Hr2foX5Ad2pNY4qGBPksj/pv9BsF4SptvjS6MVOr0sRBg49VhACRK8Jbr0bqqXhb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197869; c=relaxed/simple;
	bh=xTuCKPOc5qekl7dLx2YyFR+swy67NBR4iLLNPDhJejw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmktSU3EoIuVmzm4TE7i5n+7/x6xASQZ0CVoL+yNcXT27OuveDJY4XdZtQ5pzLxILixUCGSBJHAsTMPQnRN0lesPsF5Lzd1rykrvt9hEg+CbcaSvbsPhjJU6ziG+0hWyDdnQrCh2wRTo+FlGC7BR6z/fa9d+yJJUD1CqRHH1fWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UufNS8IA; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UufNS8IA"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A07F940E021D;
	Wed,  9 Apr 2025 11:24:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CPTDvJ6gcXQd; Wed,  9 Apr 2025 11:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744197861; bh=aqXqGbSfrbrNCrhBUhhLLiqTnKMaIMK6iXkkMoVv6p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UufNS8IA+fehmpEvjwG+ZAC1FiPKjTKsay50cwfNGzy7NVGaPpHcCIGXysOxG7GV8
	 +lIDkOyzfeGLeUEBZdiyoebeU++pLd9NkgU6CwUCaLctk1sPfNK35WMPwBT/JixXXM
	 qEjKXxqYbH2e5y78BJCPRcpBfU5p8cZ+yPSYztE2XNYK9WISX4nQsGcF/oR5CPgCn2
	 POT8k9FSFtDcRIau/8i5A7lKZOVQm7Hhb3TZyUeIVApAg1tEL1w/r4vzUPFqjxsLhm
	 6n6fgW/p45Z3FkfUJJKqvGbliXFXXXpGKG2RJU8jhlxuOH5g5ZFcHTDNIwu60K2omy
	 7rHT6kqlzJ95ZPokC+S11VAKe64CnKD/qBsxMB0KUrCDFlTH4Juol25D1IGNhjhGt0
	 RNeo348yjE4ZIGJpvGwsX3NBzbfFIzr1+XO1o5+zFXPX2KFuepk4yZNeq1bYlaFW+8
	 61CqoSESnsXOjlpreQVMrx1PceWM8vVZaz4VHBAfI0evmcreFNJbEm4L8vGLZwx1/u
	 LC4dcaGxdX9W12r+0ZuiyXAbkuf1n2YTR0n7f9RLSrU8FsuKGt4UZq8DbfQZiI4QTl
	 ISLnamf/GBSOxXgOLKzr3lhQmihoQxjAtjUkT6FUYJsKcCCecUauJEiMHE07z5tu2b
	 09S5k11qUnccrhPy/PyU2eLE=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 07C6E40E0169;
	Wed,  9 Apr 2025 11:24:14 +0000 (UTC)
Date: Wed, 9 Apr 2025 13:24:14 +0200
From: Borislav Petkov <bp@alien8.de>
To: Dirk Gouders <dirk@gouders.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux x86 <x86@kernel.org>
Subject: Re: AMD Ryzen 7 PRO 7735U: 8 instead of 16 CPUs?
Message-ID: <20250409112414.GFZ_ZY3k88JhYTbYJ0@fat_crate.local>
References: <ghlds9lidx.fsf@gouders.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ghlds9lidx.fsf@gouders.net>

On Wed, Apr 09, 2025 at 12:49:14PM +0200, Dirk Gouders wrote:
> I got new hardware and after setting up everything, I was wondering why
> I don't see the expected 16 CPUs in top(1) or /proc/cpuinfo...

Send full dmesg pls.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
