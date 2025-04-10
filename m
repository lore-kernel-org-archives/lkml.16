Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2111EE033
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308371; cv=none; b=LnTK1yz2XQhHLdmaLRiSM4Ni8B7P/HY1YEASW0ygHbTMmX7FJkoXv9H3qw6SyodPRUPWhyvxqAB6kYD5wob4Ptd8Q92d7zPSuGlxBJmYapvmPEAMUOhgagGigrX6wMD+DjT+5uaAmghMrai9BbqtorsdUrjNAeq6DeVPT5TLNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308371; c=relaxed/simple;
	bh=97CLy7ScUb7KjJNq5FyADwEg7x7LCJlR+XeniAehrnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rp+NS+hJv5O3NwyamSgBLDorGyhnS55WQxyZitPr8NVO9nFLYt7vUbHuZQpu02mMhCEqz0jmhegad35Pp+fODty0l1Qi2bqKOCSy2JXTrkMTDjrSU/5vxPG5EW8/7rQE4h94aNy6auNtt+jLxSp2OowRMlx1J8vYvVQk36XT4bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Leso7VYv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Leso7VYv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0D18340E0246;
	Thu, 10 Apr 2025 18:06:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id d2T57S0RvkDH; Thu, 10 Apr 2025 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744308361; bh=EOfVUfdNXb8ddmvTFAygk4eBRRo1P24EGYmuNdA69uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Leso7VYve/3oOFxP0UYQi+TtRIyVjHOQr0hSeEqltsKVVYkMUck3spnDz7ItjL6mv
	 b9uS4qEcJp+FxYX3LUsMx0m3k7m0ZZTJ6Ce64hOXKsvYRqc9oRIM4NFlLhxzglX2VE
	 LOiK7W6prhlV7Stpq95jlwzZQpTl9qIsCZzHBel8dFdW44rmWigmQFwMBVxDoeFHqK
	 dEUsMMvztCNVtlT+fOjr0UpzbZrv8w3yrEFk9oJeI04/u8pw0XGaJZytcnZAhePmkz
	 RTKPNLlkoRcrrGw4JUE2lvfnYVqvxVarvebdwJwM24iX0SvocpA6gwSdL4Y29m+iiG
	 IV2pdZ89jtqNrzAUv0Sjx0GYV9KInNaW/bu867xVzCHHggA6ta18Sa7wg8DiDY9Y/5
	 ElNDxrhhLBjUiUJBHoUmHgWnCdkB9aeCsF++R2aPUq+1xMy7A/fmXXqv8LVwYkqrS4
	 EZsP5rM9858pbwfVhLForQZmIFFhQ0Fa8mjsNDk2A/EaCVyejInqmd3hQm3XDor6vy
	 Akil/KkqukvBJeKdqniYzV0Fe87A3sPTAi4lzQKW7GAqaN8Qjow2E+fpJo71P0Nw0p
	 5ptL8Yld2hZr6BhcJrxviobpstbXv/CBus5IjBCHGgpe0vUGJkCseu99d/CkSIqKpI
	 hEG4dwDqrsR9tE3oB4/XxVvc=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5F6CC40E0242;
	Thu, 10 Apr 2025 18:05:57 +0000 (UTC)
Date: Thu, 10 Apr 2025 20:05:56 +0200
From: Borislav Petkov <bp@alien8.de>
To: Xin Li <xin@zytor.com>
Cc: Borislav Petkov <bp@kernel.org>, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/cpufeatures: Clean up formatting
Message-ID: <20250410180556.GHZ_gIhKb431qGH5Ja@fat_crate.local>
References: <20250410165434.20648-1-bp@kernel.org>
 <a8782d3a-9c22-48c3-916f-29babc58db5f@zytor.com>
 <20250410172514.GFZ_f--kaKKxF-Y6WZ@fat_crate.local>
 <4dc7b54a-463c-4801-9c68-a6ff6edf9ad2@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4dc7b54a-463c-4801-9c68-a6ff6edf9ad2@zytor.com>

On Thu, Apr 10, 2025 at 10:52:56AM -0700, Xin Li wrote:
> I ever had a patch in which the last column of the same type macros are
> not aligned and tglx asked me to make them aligned.  But that didn't
> need any name shortened.

If you wanna, You can take mine, and then do two more patches ontop,
shortening one name in each one.

:-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
