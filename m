Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073131E47C7
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839249; cv=none; b=gE/oojaG34uS3ztyF8hQDnILWkuOkt17hmjPanzPn0AWBFnpwM4+N+UOnOzA9S/Mwv4GSdXx3mOXQR7LivTH2ppNJ3qnln2InwzaFqTrojsaZk9fD6++R+J5d9UJcQ4RCgL19ottiTnIn75FkAmaLvY7xmly2UuyvcAstLS5kNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839249; c=relaxed/simple;
	bh=TBf0PdWtC0D619z/idpOBY4r3Wt4FtFdnQekOqc92to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Smm9sVfhoqiBZs+X+ClAhohNJ+gsE0/GN/qa5FVgAzTm0tq5E/RD/y0YzrwkbNupFn8XJrAQJXQfM1q7bC+kNAanlZkAwgzZfxTBuU4OTbJY7bOmiEceGfeQDQTQrxGzEZ6++2vHjrhDeDN6wiVpJlTZAqJ4uNL3fLdT/OtwNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VwAGcyCc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VwAGcyCc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7D51540E023F;
	Wed, 21 May 2025 14:54:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lzSYRv2Urjmp; Wed, 21 May 2025 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747839240; bh=DjduBGoiftbADTLrVR117JVRrl5Hfw+1MUZ5CyH7lJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VwAGcyCcob8JFsFmBNM19Pne9rIMl6f7BWvHSrj3JaZhpgZjOUugu5kqDUUj0+Sf9
	 6r3vaMkfUpZzhkUgo+zhiIwgv3ab4Ek5x1k6u2ui95DB5eMTpD3HbdXy2LveJIPyQ0
	 OG1kE+XgD0IqlI74+3JKEyhIeoEEDz4hW/90KVjZu/uzjrAAhE8MdJVcTJcFrG02th
	 XGrURuAC6JDCDwt7qeFFeMVPZl1gselPkq4YmKHxjto7UFva85XTPW9h/GW4ybcR4E
	 qeKjyZkN+72129OhgYYr5HAjGV3XCrC+iFKs1CEOEzM3YX5qGo/Z3RfJ3HXUUnSd8B
	 ET2hlzhLe2axTJnS0K+aQMxrzMHII4PnJ6Q/nks2GnJAkCuEbpRJB28vdykL4J5l4e
	 ry98tgtxq3+7zdpQ8LHPp83pWqClstMlumzJkXwVWWWsvqITYJPHCh2iYqGBhK50vu
	 dxishF7XEDtCtQy5A6YzzChUGTkJbpKG+JcQv3Re2HYyA+lLDlJYSFz5g49P18S/FJ
	 8bG1R/IMdmv07Xx/jIYci+54Qrory4JfQfqnIW8xzQrQabBPRvQlvlyospCx/cUv+C
	 DtjwU9CZY2fRY0O/POgnOcogoJhGv1msSCfO5wHQ+sQT88ZMezITf5206VfdBXTEtI
	 ln4LnfrXBEwFfxsB0sLNMf98=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7474640E0192;
	Wed, 21 May 2025 14:53:46 +0000 (UTC)
Date: Wed, 21 May 2025 16:53:39 +0200
From: Borislav Petkov <bp@alien8.de>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, nadav.amit@gmail.com, Rik van Riel <riel@fb.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC v2 4/9] x86/mm: Introduce X86_FEATURE_RAR
Message-ID: <20250521145339.GCaC3o87kpaouLZ_3D@fat_crate.local>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-5-riel@surriel.com>
 <20250521115343.GCaC2-x8LsmMApUkjQ@fat_crate.local>
 <cb657cabbc3c87e0a821c7c3fcc16e62b7d854f4.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb657cabbc3c87e0a821c7c3fcc16e62b7d854f4.camel@surriel.com>

On Wed, May 21, 2025 at 09:57:52AM -0400, Rik van Riel wrote:
> I had the same thought, and tried that already.
> 
> It didn't work.

Care to share why?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
