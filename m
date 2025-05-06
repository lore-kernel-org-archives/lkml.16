Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86181C84C5
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521339; cv=none; b=CitBkNbYu0TOeyEJsS3IHjFlz5G+UQ5c6zRwWJKbrJdQUdZUPpdJnSTvngjItKuGs0LsqmDUgX85RnJIoVdmATcBUf0ZdxRVq95Uoib27MrkP/i9DhZv8JfqgaCU1Rq017ompLaY4ZAEgkwRYQedoiNRNMo4WLeW66FH2y9Ltfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521339; c=relaxed/simple;
	bh=nLYg5DLtfDfZDeuXiD8GIXR8IzkvLrzaJvCl6LcRzKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ct4nOpQ1VYsnMmRzkqmt+fNUAF9cNPeFYXwOPjoT8KONjyqreHxDvlc34EZa18KJAj/VKQ8UMFyDjws9Sgt+gWFb7E9CFxaiWzbAIf20iLqkq1WPUxTkVBMOw6QIEhrbNxo/KdrRdvxLCAqkfz+GVOPCnF9MDHg69cF4qm+wCEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Pv9/k+bP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8iRFLSHB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Pv9/k+bP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8iRFLSHB"
Date: Tue, 6 May 2025 10:48:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746521336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0ncUfh0Cvfi5Yo8N3BI4CFhiwN/4omNA+mXfYWBDbg=;
	b=Pv9/k+bPlBtpKmVGU9/hzxzJz77u8j04mkqEv/TyOu5U68rdH9jEJF13M/6SUQ6+RZP8+6
	rAhFHkgocvDAM1Avqr7LgxZpV5r1D+gzLR1i+ggAHyEAgELWGQ+wgGv/AYkLM4zP1yQfzu
	jSL56ghrU93Q7Qz1q7Vcl1bspriSVWGMnTkqL5i6JE6Bkg2anRgWRm8YBNuNDW8ZKXv34q
	rgOEWZjPD0gw+siSPbl0eAoFUhL+AttVjmCbSi0o5dEkR/JgKBTGDpPEoZxUad7LmOe9DU
	hjtV8ra+DwsDVky00RheLCjA8UjVcjp8MzEeUysltJNFYstFxI6voZcyNV9AYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746521336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0ncUfh0Cvfi5Yo8N3BI4CFhiwN/4omNA+mXfYWBDbg=;
	b=8iRFLSHBdgGqHp7NidI5vJX/+lhET0LWZvh/TjlMiZO5YFKU2w4ukCzB9FQZFK6/p7husr
	qRdNQV2TZdjbnsDg==
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
Message-ID: <aBnM9WNo_dEjCvoU@lx-t490>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <aBnHCbo4OaWpM392@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBnHCbo4OaWpM392@gmail.com>

On Tue, 06 May 2025, Ingo Molnar wrote:
>
>  Overall namespace suggestion: could you please use 'parse_' verbiage,
> instead of 'scan_'? Even if a lot of the scan_ uses in this series are
> a temporary back and forth that goes away after the conversion, but
> still, some of it remains.
>
> Today 'scan' is not really used in this context, in the kernel at
> least, and I don't think it's a particularly good fit. 'Scanning'
> suggests searching for something or looking for something, which we
> don't really do: we parse the entire CPUID tree in essence, during
> bootstrap, and re-parse it when something changes about it on the
> hardware side. We don't really scan for anything in particular.
>
> Does this make sense?
>

Yup! will do.

Thanks,
Ahmed
