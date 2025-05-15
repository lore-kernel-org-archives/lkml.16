Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BF827E7D1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343096; cv=none; b=kEzthOPBi/eWIRpN0sb2gDi29MFV9Q60usMTtGY++LHt2sViyhlVJ50gRxmMMJ4ayN0oggQEZieV+c/bl0o5EQb5IB8MXRwMyGVoelpmhulu9Up0chelJO8afuMgrI/KLIvPngJYcB/XM55AjKBxTbYbqtYfgwx6M69JzarzrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343096; c=relaxed/simple;
	bh=vqHtebI7QcDre+rqXrx1fd4+d1PuHG7I6gqvBzMo28k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcDEfdODooQwph6g5hFE342drrNey7GZW9T+r60VOqGYy68JZnb42qGceAs4ER5SzuYLbz9wMeFC3t1IBy5lB6muaXGf+MVJQZpHyQzDkrMihrAjQtGyf7TqNXXRS4+QOXwwKy/SRM4eGvdSDLzDbIjt1SkkZeSQcmTJo4Tb6PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PHxMCsn1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9wN4uIKS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PHxMCsn1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9wN4uIKS"
Date: Thu, 15 May 2025 23:04:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747343093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RxCCQBBFFS13nbaq8f3f0eNesgOx+v3fCu1reEuH5qg=;
	b=PHxMCsn1ZLdG1RQDYmXT09zutdiWS+q91219uez+upcSZ01rXk6+j2dCTsWnkDkO1PkhQJ
	QF6pjbKTLq8pegX8Up7u8cRL9bxcsmQiPHq+NGJw3QDRtcW1gZtoahx/MqcH2Bep1qJyfb
	4KDcTvZgns5jcKLhHnfJrAIkhnb7nQYD/y19M7LBuZBYR1pvBuOeefklrcnftC2PgMpFMd
	5n9Zwio13tA551MG0YAZLTZ77UhqUsw7jA7d9OvQdKAMR+EGtaOvJqvsqq9Q+4FePbYoHr
	9dmNzzFOAJXqHUHX60MKEc1BAGwH2YFVaINlaa5OIIX6WYtMC4etFTZbo37svA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747343093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RxCCQBBFFS13nbaq8f3f0eNesgOx+v3fCu1reEuH5qg=;
	b=9wN4uIKS4olkIbfYPJ7CXv/1zd9fyQKNS8l73eOMfjwkaFqhkqlIUZFfZNgCq3KMQ7R4E7
	zXJ5Bl6MQvkGR4Dw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 07/26] x86/cpuid: Introduce debugfs
 'x86/scanned_cpuid/[0-ncpus]'
Message-ID: <aCZW85ZgAyvl0ZCB@lx-t490>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-8-darwi@linutronix.de>
 <6e9286b1-6d76-4f30-97bd-8fcc3ca8f211@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e9286b1-6d76-4f30-97bd-8fcc3ca8f211@intel.com>

Hi Sohil,

On Tue, 13 May 2025, Sohil Mehta wrote:
>
> I tried out the patches.
>

Thanks a lot for giving all of this a test run!

> The debugfs hierarchy mentioned here doesn't match the code.

Indeed.  I've added the extra level "cpus/" folder at a later phase and
forgot updating the changelog.

>
> The code actually builds:
>   x86/scanned_cpuid/cpus/[0-ncpus].
>
> Can we simplify it to below? The "scanned_" part seems unnecessary.
>   x86/cpuid/[0-ncpus]
>
> I would also suggest slight changes to the formatting to make it easier
> to read.
> 1) Indent for the printed register values.
> 2) Move the * to the front of the value to make it more prominent.
>

All the suggestions above are very sensible, so I'll do 'em in v2.

Thanks,
~ Ahmed
