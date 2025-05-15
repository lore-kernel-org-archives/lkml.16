Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFF0263F32
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333756; cv=none; b=XxAYHbKu+ThHkiKa3iIEmdmiHFvisJ7rkKL4sjCDnsFKbOhUEE6Xn8gfz26gImg44Drt7Dbq/nZq2348MtE/bQQ1lTaH8SU/TqsRlKFPz0/xkacW03Ei30HCVQClds/tTVT5VNebAOE3doEqVviwGNJHC8wJd54k9Xn6Ro61wqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333756; c=relaxed/simple;
	bh=005V1DnsI9qlRExZs5lNJ+THFIVv++44qnw0+WY3jis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOq3jOvhAhQPQrXY0kqXaRMJ5mkzhFnG/L9xW+nkFybUFK7vz5VolCDhxxfkO0wk4eQAO3GwY+YiXcjuZ+BY7k84O7T/kh3bFJxvIDryAjyRV8n46UPw88ibeq70FyUxxG9fUQU77A0J0Me49ABI1l3rQ6ngrwjrpPYtI7pMcmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s0bgzWeA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zyNoS4PZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s0bgzWeA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zyNoS4PZ"
Date: Thu, 15 May 2025 20:29:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747333752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=005V1DnsI9qlRExZs5lNJ+THFIVv++44qnw0+WY3jis=;
	b=s0bgzWeAkttlp+ZFUWnbW+XzonbeYCB2sR0OuAmpICl9IiklKI3lEy/M800poV6p+SK67u
	9CFRQPITTNCt5PBM3f5lNiSM/Q9tOUBtwlbPOPxdVPYVhB62pqmD1FAXweNgzCdUOqy8qr
	MoaNOXlIAZhnsYMgCzDSjY/5zmsiNzWYK+oQ24/il8pig7mwIAA4niupaA4XIiPEWJrKdP
	UCaWNxtLDoSCR7HLMVTX4Q8Ww0v7zrJ+YJIsYKHePvFmaKjWxRw1QKbO+Gs91r9JwqnmaG
	STA3KsduHhmNHDQGbuqz8qFcfjvTcWn13obxPQiuIA1KmW5c9yLHmXRDQvqMRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747333752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=005V1DnsI9qlRExZs5lNJ+THFIVv++44qnw0+WY3jis=;
	b=zyNoS4PZfJSg9w5EVwVBgCogDgBXqg7CnXTOuRc9TuTM6i6yOIYAwCI+1HV1vo3V6Y9Vqm
	2UTNrOZLmlVOCrDg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/9] x86/cpuid: Set <asm/cpuid/api.h> as the main
 CPUID header
Message-ID: <aCYyd1ss7c67Ms1P@lx-t490>
References: <20250508150240.172915-1-darwi@linutronix.de>
 <20250508150240.172915-3-darwi@linutronix.de>
 <aCYVlLgDNE4fs3yU@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCYVlLgDNE4fs3yU@gmail.com>

On Thu, 15 May 2025, Ingo Molnar wrote:
>
> Note that in the tip:x86/core commit I've applied today I've delayed
> this removal of <asm/cpuid.h>, in case there's something in -next that
> started using it. I've adjusted the changelog accordingly.
>
> We can remove it later on, shortly after -rc1 or so.
>

Yup, thanks a lot.
