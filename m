Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7C1C3BEB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744264408; cv=none; b=UVen7etD21aHhyPNl5KkfSwlTI3nd7+1zHb+usisJjwS8M2uZ9rU6KWu0azoXnpYqUshOR/3wl5seZZiiRcWew5RFv5VYA6Gy25E4tUsLWKyTqm00azwJoIr6nVJO0JyAt3T15WldziXFLS1q/jZyNzC3WjVVD7OZGqr1u/ERbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744264408; c=relaxed/simple;
	bh=FtkADtqTTAHBwNsbObL8YEun9ehU1SjIakCurok/u3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8yuXKGh1fDv6k6/+c61Cb74atYMFPW7P/s2o43E214NylWYK7my3g8ZigD9eoAOwYql1gJBXtYO/Nh3+8IJj8ykWArxKhaNGk+R3rsr5FBGDDT52XLHyW1QZdJTJNeaBDt0hf4KQ1H9tFxAi7cYlNwrou1JfykHnUq0hXDKwTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zc2l3tXk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9ZcR2y7m; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zc2l3tXk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9ZcR2y7m"
Date: Thu, 10 Apr 2025 07:53:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744264404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FtkADtqTTAHBwNsbObL8YEun9ehU1SjIakCurok/u3A=;
	b=Zc2l3tXkfoM8O+xad/kva2psLQs5gEY5FqLx1BmssCyPctzjo0YGvk+eEIbY7CKfRVdhoL
	wVuETyrGnyTEhU/Xnjv40XwhGwSqCpPwTcTqlPjPsHWFGKGhu+GXBBC7gX5rMQPNBSvt9t
	W8dKIaFw0G0S52YcN5JFKEyev3sK5nkgvonxuX2/+ZQ1gQAxX6YNu3QlFRzTpu3nwMdZ2G
	f5ZW95rb2dqggEJk8u+LjsuE4dEqSxK9N5BACNhL9V8xuAKieRQrOqXE7mbSbdsVjsrXWT
	ggV2ZsCHs1xbeHkCONuN9nQ+8bvWn0Y2VSosuhIhP/9XS54Q8wO/2zbZy6CcFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744264404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FtkADtqTTAHBwNsbObL8YEun9ehU1SjIakCurok/u3A=;
	b=9ZcR2y7mo2HDzwYkG5fXkCU1/sRq3qPTXrSFQz2XYldwavFdrFZqx7ZIsNaub9T4hKAR2J
	BeUeIhmHFP89l0AQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] x86/cacheinfo: Properly parse CPUID(0x80000005)
 L1d/L1i associativity
Message-ID: <Z_dc0h-EI5RWtIK2@lx-t490>
References: <20250409122233.1058601-1-darwi@linutronix.de>
 <20250409122233.1058601-2-darwi@linutronix.de>
 <Z_bCA8788lrr-NdB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_bCA8788lrr-NdB@gmail.com>

On Wed, 09 Apr 2025, Ingo Molnar wrote:
>
> Yeah, so a Cc: stable tag is usually reserved for recent regressions,
> or critical fixes - but this is a bug from 2009, ~16 years old. This
> bug is old enough to receive a driving license in the US, and can
> legally buy beer or wine in Germany.
>

Haha, noted :)

> So I've removed the tags from the two commits in tip:x86/cpu, but note
> that the Fixes tag itself will give backporters enough information so
> they can decide on whether to backport. Greg's -stable process
> typically processes all Fixes tags for example, once Linus pulls this
> into v6.16-to-be.

Yup, makes sense.

Thanks a lot for all the support!
Ahmed
