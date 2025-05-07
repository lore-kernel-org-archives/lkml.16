Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F4A31
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607562; cv=none; b=U7xw8oI4EEyuqLqRbUDpSjVwRkuKYkSPRTEmau4sRJz6praEkFAABmE3KIpkrbndzhdvYT4EzXOHa9XbtkXNb6mUVppEES6yjA84TmzuumSqiilex5W5mw7AW/3bJmtml4i0Mprb+IImUXyCv77HKv8w2UqmH9UJE+O1+xz/BOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607562; c=relaxed/simple;
	bh=+QPr7RaUjoHLOEF4Gepw0QlxQEmy5lYmdLlOUghg5E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XX9Nr9D9lbv7qHblekIySz4G/Ha9METMpMr6gB0MiEaxHrn+9J7vXUO6jg7iYADDkjh9HwL4m0nDTTFoJYGaR9WeBWzSBnrW9RfySZAPPPwqopnxSNwYt3s2EHt6yBHFpHO3HtS9LUtJwVOVJnEK6LYlIulxFGHmAzauO1YA39Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YYswT0RH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xTZkwOGx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YYswT0RH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xTZkwOGx"
Date: Wed, 7 May 2025 10:45:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746607558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUvmZJnbkehSlXGem4uoy4mmmQt0h01eJ+sDuhrRNf4=;
	b=YYswT0RHJIdQ7YeomY30lG3e84nfFHaIJMhS5a3ElZVQUUysxTsGKdpzIty9TY71zAjbA+
	lOIDksWxaIFCgcqBaHuDVwDgxDdWpllPOaTC4VJWuxq9I6wrW6TB1ut9Gzo83YbEkAKGGX
	h0/nVIMubh0i2UQFltWEeXxjdhSuZrb7MqB8WPyLCutSmatepZT47swrc/PapG1eiBs1dm
	HN+2UokOYWs5uMpxONxeEetoXlRJG/5KPs1Mz+keoZyXfYcnBUf18K4rXT+kIeHsOE9RLn
	HOFDmTrIJe1kIcWLnPF2xteLnEcfVn0T4LserghnVvYoNeSueqd0ERIIF/qhsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746607558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUvmZJnbkehSlXGem4uoy4mmmQt0h01eJ+sDuhrRNf4=;
	b=xTZkwOGxINvS0jib1v44fV6UGfrIsoW1PqZ94cQb2A/XOGtdpclg7YwDNnN7P9LAYHtcMF
	wVTib68zvQku8XCQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 00/26] x86: Introduce centralized CPUID model
Message-ID: <aBsdxY-OLw_bSuTC@lx-t490>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <aBnSgu_JyEi8fvog@gmail.com>
 <aBsbTiBuWmUC3QaP@lx-t490>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBsbTiBuWmUC3QaP@lx-t490>

On Wed, 07 May 2025, Ahmed S. Darwish wrote:
>
> On Tue, 06 May, Ingo Molnar wrote:
> >
...
> >
> >  - Please just use a single central API header: <asm/cpuid/api.h>, and
> >    remove <asm/cpuid.h>. It's confusing to have both <asm/cpuid.h> and
> >    a proper <asm/cpuid/> header hierarchy.
> >
...
>
> Would you be OK with at least having:
>
>     asm/cpuid/
>     ├── raw.h		Raw CPUID ops; what is now <asm/cpuid/api.h>
>     ├── api.h		Everything else (CPUID model API, CPUID(0x2) API, ..)
>     ├── leaf_types.h
>     └── types.h
>
> because if I merge raw.h and api.h, the new CPUID APIs (which people
> should be encouraged to use) would be so deep in the new merged header it
> will be no longer visible.
>

Now that I've looked more at it, the above will be confusing for the call
sites, so I'll stick to what you suggested:

    asm/cpuid/
    ├── api.h
    ├── leaf_types.h
    └── types.h

Thanks!
Ahmed
