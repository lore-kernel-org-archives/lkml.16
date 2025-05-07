Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D44F1C84D6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603403; cv=none; b=jGkXa4PQ5OrKaoH1XxiO1IKKeU9ZC0u/S86CLlMCtmcZ7lVRsbuSqawGi1TQUowAr0Q1DDgpWV98CFGshCRgpskuVLma248NdNiQAB/7n8GbXcw0VwPFQ2ClOEkIbxWwbSK5UZvczZgmB9mJ54N+wD+7EhTukiKDn+fKEtnzS8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603403; c=relaxed/simple;
	bh=dMn75clKei2svv0TnxnNa5qfSZW8xbYeKzKay6rJU4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxp5E6H5YiAy/8nMefgxihf5tedZR5mMmcNxSPcKSAW0Ecf2csStchQ+ORQIV6GyKNtCmp3XB1V2LzWEJT+1O56E5KzgKvInXYy+Bi4Lp6NhytJN6coGsfu0t8J23bkJiXqihFpC96pURilTtLES9Q80DTXEZZ4xmMBo35vQVlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mNzwdiET; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CDnlzsKe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mNzwdiET";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CDnlzsKe"
Date: Wed, 7 May 2025 09:36:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746603399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VDaI8AdA8Qn0NK3CpkdWZgdey3l47BTjaidDhOmucl0=;
	b=mNzwdiETFofhRA3KfhVtR1PT6dBbLAazNDsXnYEef4AKzPe4DspdPQ6y9CLVYo8K0Kp/E+
	wcoc6Jd03tDQAPvBbpRhsu8JNiOU800atcie523vKg/WnggigQkXs7a6/m6j+wQFpJYiJW
	qMweOntwh0B9ceeVFU6n04n/gVaYcOZkRRJCqVEEiZ1eoap75/yrhHG3pd2p84c69jy5/G
	nsvIfzXbDTxugOmkMwiKBp31OTzaGIQG54Vp4A3n72vIIMLW8IhqnkDPSwlPL1xK0FTtn/
	biIQSqBhafCd5ur4ypEkFYzzAFeHXYTswgvCq6vvZDnPZ0+MLJxcpEZSSgtcvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746603399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VDaI8AdA8Qn0NK3CpkdWZgdey3l47BTjaidDhOmucl0=;
	b=CDnlzsKenrkWXAFlNBGfoThnv0lSfxA8FyV5S4szyUDr5m+InIXrzPevxxe5clZgOYR28f
	BvYaby7H0gXQ2MCw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 12/26] x86/cpu: Use scanned CPUID(0x1)
Message-ID: <aBsNhcFPeOiFuj34@lx-t490>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-13-darwi@linutronix.de>
 <aBnHeoNq_LBY0xxj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBnHeoNq_LBY0xxj@gmail.com>

On Tue, 06 May, Ingo Molnar wrote:
>
> * Ahmed S. Darwish <darwi@linutronix.de> wrote:
> >
> > -		if (cap0 & (1<<19)) {
> > -			c->x86_clflush_size = ((misc >> 8) & 0xff) * 8;
> > +		if (l1->clflush) {
> > +			c->x86_clflush_size = l1->clflush_size * 8;
> >
>
> Nice patch, it really nicely demonstrates the maintainability
> advantages of the new CPUID parser.
>

Thank you. Really appreciated :)
