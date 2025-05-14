Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369418C933
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207979; cv=none; b=VinMu1+SD4NKZD+ehEvIOIBKmbD76LJhMXRZgvj3QnUFMAGLFm81KidKFr+sqROxMoE/KGpNH8T7UNcXzzidNM1abh1cTxQvlk9PxFrRxugNmVgZ8I/ci0JpqhHSGZ/sOH6PIoPtPvH8b3SXp5znGeZg2F0GC0nJN6ci4IavGhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207979; c=relaxed/simple;
	bh=6oRn1hw64j3lVnfQXHe/1ScTnfMW08aNk+MHWr//xNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRaUhBqbCoJWcuJCHXTHt54nTKBMHwVLHMIVNQeSarUY5NCDTFf4k7iZqwTEZsH4SaTBi6eqb8wgeuIira13kG++E0VMAkc7GymTkRsSAyAc9ljm3e5bZ+IzsjvHisVdKILfX7DeShVVIYkkAYbT4bLvbf9Ia+6qXgV/HlbmYrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zZ1Y+KR3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a95thXnB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zZ1Y+KR3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a95thXnB"
Date: Wed, 14 May 2025 09:32:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747207975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QiAs9qwZxdaMkFWgaAX5QHub300Q9rn/dWhw8ecB5i8=;
	b=zZ1Y+KR3f9reK0e6AWlIM89ueIKeeUriQQhjXuKfC8Fohyt/5xnZbw4hmi7EwhCOIR1Ilp
	Z8pf+jBdP+lRhQVzIhM4POPP/hYFmBwxBWyh6pugFc1hcGjCknGme/eNDcjv1EfRhhCVHl
	Izp79zClj+KsHodDeyLV/5qpbL2onQaM1kzIbS2vykmDdmaTADgWUHCCNsIWf0itxJXynz
	WtvrNcI8gxZk6MunGdr4Zcx8u5rqV/T8I7rxMxnkZB7QL5MYeDOqZrcbgFR4JPb4mjJctN
	dpOe9rjl4sY6qR6mVcDCj+S6CcakxIj8kYzscZ+DkKbOMgRlab7moUX0uzaLJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747207975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QiAs9qwZxdaMkFWgaAX5QHub300Q9rn/dWhw8ecB5i8=;
	b=a95thXnBNsDM7TEDzhWYa+hVUnNxG9pTzI1bAgsXPxKhIT+Ux4o/V0jzYHfy2QI++ecUro
	iAWGawF2SDtzG6Dg==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
Message-ID: <20250514073254.p4PBBQuh@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
 <9b528d3c1de5291d1540b3617e63d40b9889c88f.1746997351.git.namcao@linutronix.de>
 <602a2de6-3b6f-4fc9-b50d-90539361c50b@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <602a2de6-3b6f-4fc9-b50d-90539361c50b@ghiti.fr>

Hi Alex,

On Wed, May 14, 2025 at 09:24:55AM +0200, Alexandre Ghiti wrote:
> > +#define RV_EXTRACT_RS2_REG(x) \
> > +	({typeof(x) x_ = (x); \
> > +	(RV_X(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
> 
> RV_X() definition was inconsistent across multiple files, so I harmonized
> RV_X() it in this patch https://lore.kernel.org/linux-riscv/20250508125202.108613-3-alexghiti@rivosinc.com/
> 
> So here you use the "old" version, would you mind rebasing on top this
> patchset and use RV_X_mask() instead?

I will do that. Thanks for the info.

Nam
