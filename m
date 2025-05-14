Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973E25DAF7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216889; cv=none; b=P3sz/2Q+h1ahdSWm4BKEsufKyF+Ps+yKK0mYp3Jk8XGSJjldWTkT0UijuKMXgXmRyO0svUBub3+EHG18wUQQYOTkvMRMbdi08QUv9Lw+4nGTeXLsPwR12dkTGFYLqbtXg8X93AyJDslxihffvtONl2HpCnc7FZuZGe6imbPUjqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216889; c=relaxed/simple;
	bh=pobJ400CLepzNXb/cYSUGRmG1PO7LIUNV7zydd02BtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leZLj4T8m+JuxdSv+sjLuirvll3hHqsh/K9gpsMnnDcO2m56F4M7/+y6BqspVbDq7yG7VgvpAn7xcyIklQ6iQyr0HA893wcDFfwQhRMm/aPRbbUMcNXPA6sye5WyB372tw+omDlUPi4u0VSwHT88TtCUcgqL18p8nXGk/XhRdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JJyTD8Ao; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Yw/VqjqA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JJyTD8Ao";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yw/VqjqA"
Date: Wed, 14 May 2025 12:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747216886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yjJ8VTCfJF3mh532Vvi9mnXCuXqEe7OAhye5pR0w08=;
	b=JJyTD8Ao92BZRcVKabvPvKBtz2HtA8d6TJiDDphuBIRYm0oVVhxATBhDhml5NQ3syJkx66
	y9LfcfFOkp+UeB+hGUtsIuEPKF4RBbRS4R/Tz+7KBT6f/ZZzHQ163W6gFv3p1QXuGZSm8/
	xtXGLCS260+bzl5TRVv+BOis2k1yydT1LXp5yIemUeJtAKS83Sou9m3KJqINZu6Kep29b1
	I+2kKwdHMmNxrU2ZTR/RAgtEPHtmmajjOT2ZcouWetnUp2JDMXmJqovgZqjn1WvU0D1nMe
	IvOmLgKRDoAI7USdoxYpL+hwNYAxRPAP7ZmPXdksDqPtlo5Jy766u354twljuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747216886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yjJ8VTCfJF3mh532Vvi9mnXCuXqEe7OAhye5pR0w08=;
	b=Yw/VqjqAIPadN0tqNqnAHVHf1OReRfhru2LMX6IT+9ugZFxd3qRL3vHDy94d5Tiw6qMhgy
	8HbdjDtJPy0HVmAA==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
Message-ID: <20250514100125.KjX0gdp9@linutronix.de>
References: <20250513151631.3520793-1-namcao@linutronix.de>
 <b6df6923-1028-4a6e-8cf4-e10e8fd55475@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6df6923-1028-4a6e-8cf4-e10e8fd55475@ghiti.fr>

On Wed, May 14, 2025 at 10:22:03AM +0200, Alexandre Ghiti wrote:
> On 13/05/2025 17:16, Nam Cao wrote:
> > +	for (i = 0; i < num_kprobe; ++i) {
> > +		kp[i].addr = test_kprobes_addresses[i];
> > +		kp[i].pre_handler = kprobe_dummy_handler;
> > +		KUNIT_EXPECT_EQ(test, 0, register_kprobe(&kp[i]));
> 
> 
> Will kp be freed if the test fails?

Yes. Unlike KUNIT_ASSERT_EQ() which terminates the test, KUNIT_EXPECT_EQ()
still lets the test continues.

> Thanks for adding new tests, KUnit tests do not run yet in the CI but I'll
> add them soon!

Well I promised Björn this test back in 2023 ;) But I wasn't sure how to
implement it (I was still a student at that time) and then got busy with
other stuffs. But I guess better late than never.

Nam
