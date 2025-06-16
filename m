Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9122221280
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110880; cv=none; b=bBVscHCoLv4PGIEL3trIA87UwBbvzhIfT9ZS2DK7mSB2e5ybkByNbI5bKq42w/0jEqJU63z4zEnWLB0J//Bq1Vl0MZJY6QXObp8XYZW/yG9UqpJnCKCKaD0NKo2E+WvGOcWR5wwV4kYrNm2tJKIsJI8yGFBEfsC6Nc6XKvnHesc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110880; c=relaxed/simple;
	bh=UMxDd6TnJEodZHq8r8FH5cpU2eWgBOYMp6Xmzp/bWro=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sGLIPppZqcVY2XJ1iaXKwGxkJnl5W8v9yx0f9qcJ/eKSdsZRHR2qtvvYhpOMlCN16TYc45t4hfcpbUil+FN7XvfUQjo4TJdh0w1BQIgje3KLZ7GPYRywj9qzdDYM7b5+mdvouCWj1aUsHh+gENyMqEePgVwQPP+hvHdL21gn8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hr9T15sQ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hr9T15sQ"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d3dd14a7edso102405485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750110876; x=1750715676; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9z+O6suy7npEsAFN8NS41uuImBr9J+t5Uf3lp/zXoo=;
        b=hr9T15sQLqi6ZEZ9+WsGsTOIR0Ru7TRJce6qNRuGTuc6NseLBHvd+iU3BxKBXC1Kin
         aWhC1jgqLhiWGSru+VehVu0K1/8rp+AH9UmcQjFzy97g+r+FPyMxOfbZXzuDzAA6G0RZ
         5jFN8NOU9uKWXSeKYzMMM0Zfy8GX1S7+WrqZM+LT9jS8HisQ3ZINGRvdE7dF3xLC+C/e
         r5IAFwNHqr2QqNGL8FFZNX98OOpNSe2YDOXwtyWgwaHdjxiy2rg8qKlMusIjza10CAip
         mL8XqlzjN64BCtcpinizP/5SbGCHbEU0/VO2lKFKdFsDJApvlWD7qUi10ax8EU9PZQ8O
         gVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750110876; x=1750715676;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9z+O6suy7npEsAFN8NS41uuImBr9J+t5Uf3lp/zXoo=;
        b=pfnYEqSUar1Et1mPbaNT9ocg1ArOTzTqa7Nhh2SZ2WIQJzFhgenogy8XyvP0AmvmE2
         CCHH1UiNLJdRiDss2HzcLz2QPupnpJFc+KvsXZodyhTOnCyte9cifkMdJO+3zW+TwJnA
         CeSro6Hi5ARiQf0YFC8pi6Ko0ixYuKnrdfsOq1abDofAzEHlDUK/RrbQ2F32qSBpNTfU
         uq0R0QfXr+AxeAXM6ldtLSB8cn9ll/MCNCTnukL4SH+UE/QJA9t6NHZGqBlIpThXpEkI
         qZC6WxZYklN3XuL55SsFIp5hFQdUVgVrvmjd9vJWDPWjlbA77+LlWC6Y7phrR47sNin7
         lsaA==
X-Forwarded-Encrypted: i=1; AJvYcCX85MNuNos8YZWdqkO18Bt+ucCto6VojyvNatpkpSHUpq2i5sXXbO1kPBE3mRL+/QVGzIK8k/WlmUdPJQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjdCdyRrLhjsEp8iwRwQyegM6Vko1OI9S9i0QOmDsQguhyB83x
	/BTjz3Ggmh8q78188g6pf6eOhrG9wl0a/bjl6v7T1KxpFIYgaY/JRMYDqK51Uewr82k=
X-Gm-Gg: ASbGncvrmUMsw/CjJnc41ba2VqEU4iojLDssKsS8OeJoPr4N0TYtCkuBStpsLqtgJMP
	WaJPqa2c4bEWhmT51UZTwnPCSVW0gO3xaZAZnMWKdrUJ0YM++yFKKGDw5CckuYwd/zxZj4bTL54
	7YFHCmjs1csLKqpx6wIfwoYLsCes5AmzmSE0cVksxOC5D+Z6bplxjBggpcWCjlO6YybxvgO/rHj
	jVSkiAWQJ4u4bRX8Pw+L4ocUh42uI6RDB/7/7YiwszQmsN0ODTUkYNyGL54sQsxVKfHfIkydZNp
	KIi5LAX0TokMleuVCaW/HZofRREFAhcROD1LNb68ptXBOHu0AUj3nK/H+YyJxxI60JzFf2XoAYC
	csgwk9Uqwi8LCJDC1ckvzWc+4Ag==
X-Google-Smtp-Source: AGHT+IEd1meUmn7TOmA8y5gcSl4goeQRArpgpkKCGdvuk6JRqg9Hfn09w3mafxkqGOEbTR5TFphuCQ==
X-Received: by 2002:a05:620a:2909:b0:7c5:9a09:cb73 with SMTP id af79cd13be357-7d3c6c1b541mr1694163785a.23.1750110876546;
        Mon, 16 Jun 2025 14:54:36 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dfec10sm576210585a.33.2025.06.16.14.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:54:36 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:54:34 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    Oleg Nesterov <oleg@redhat.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] mul_u64_u64_div_u64: fix the division-by-zero
 behavior
In-Reply-To: <20250616222629.620830f6@pumpkin>
Message-ID: <8s09r460-1523-728p-33pn-p7nn3655so4o@onlyvoer.pbz>
References: <q246p466-1453-qon9-29so-37105116009q@onlyvoer.pbz> <20250616222629.620830f6@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, David Laight wrote:

> On Mon, 16 Jun 2025 15:22:44 -0400 (EDT)
> Nicolas Pitre <npitre@baylibre.com> wrote:
> 
> > The current implementation forces a compile-time 1/0 division, which
> > generates an undefined instruction (ud2 on x86) rather than a proper
> > runtime division-by-zero exception.
> > 
> > Change to trigger an actual div-by-0 exception at runtime, consistent
> > with other division operations. Use a non-1 dividend to prevent the
> > compiler from optimizing the division into a comparison.
> 
> Given there is a definite 'plan' to avoid adding more BUG() to code
> I'm not at all sure generating UB here is right at all.
> 
> I don't know the best solution though.

The best solution is to be coherent with all the other divisions. They 
have well known behaviors, people are ready for them, debuggers are 
ready for them. If a given architecture doesn't trap and returns zero 
then with this patch we'll return zero too. If another arch raises an FP 
exception then we'll raise an FP exception. Coherency is the key.

> To my mind returning zero for divide by zero and ~0 for overflow is least
> likely to cause real grief later on in the called code.

Maybe. But that would be unexpected for some. Plenty of raw divisions 
without helper wrappers are out there. They won't all just produce 0.


Nicolas
