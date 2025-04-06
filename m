Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F04409
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 03:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743908801; cv=none; b=Hq4S218+WFiklWxn8V8IGJZMYGbtsxLz/woEaTvF0h4ePeh2aulN+mV1idEsdlNfmfZLFGhDwuFDSCdPhITMQaKeTMnm0/Gzi1FcyGsqipLKdTnnKjfZCZeX7Cud00CM85gwde9K95VU8lmpWe1yW2C8MjS5dPG6UBPae4NbBUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743908801; c=relaxed/simple;
	bh=4HbsiDgmo6GLdIcGu3CZ8K0E040QwwaFpz7U9jvr5Ak=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nuWqPGM3szkD2noImzxndw3nndwnvn5Nk0mwttNoiQS/Yn58ZLBoUmzb0LPkrxXt+sWCbDwLr2kyaTB0AXzj4xbaCIBMmj0tjIpbctsVdzMMS1Y1H30iRfmsKWtxcq1cbL5Dmd1kg/e+shgQlvb74FTqKDbIqNvY1EjQs7eX4tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UlhdsMVq; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UlhdsMVq"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8fc176825so28692146d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 20:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743908797; x=1744513597; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DkgkHgu9xBWFWEn4k7xx0pg+BPih4qLR9gYlPV5l01U=;
        b=UlhdsMVqByfP8+A/9d+L6K+n8DrqiZKSuH6olwSq2AFIUsVqmJLVnUCBsNKC+Yo1Yv
         IiopCnMwJiN1YqhylDeNVPnfUbRPafaUuhPBUugOpW23rnaYGDyDEAiHOiBI04E4y/+4
         qhWcDqdYSuXTtppVUdNR0swoNpLCEwkuex3fbmzExT5RAzUBVp0SKfmK3i/F2VWsTjJf
         VpdzyksSx63GYCETRKEIyO7FwTJSPK2pj2MimGyK52vETDaxF1Oj4wC7X9zqhmqsVA+T
         k5ZlGeHJEV7RFk9WA0DrY+tfyV3I44Yz0ZBFo1nEZfd9aMk60M7141DZ7H7XDz+6Fns9
         LcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743908797; x=1744513597;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkgkHgu9xBWFWEn4k7xx0pg+BPih4qLR9gYlPV5l01U=;
        b=n1VLCVgWk4DwBkznVwQBR8W3+XWjh2Vn4cMU6rtc0tkI6VElsUEI5F6Ea4RMyRTtgv
         weylH+oGSm6bGHDbjUbpFXGzO5C5trC5oSghe9AxH3SOOB4i+RP0UKbltPEu0iFyjQWQ
         qQsgBj00nR/TSwGyYKjM0o7RcSNKTTrlxnsHlrDGRobU5CRrfzUXxnq1KZ5fbVKQlav6
         IujpiEC1nzI7LYmG5oDRF5WYO6n/4XzHa0IfjxwqsEdZCN8YuxSM1gVEaJxFdnwxdRyv
         2wiuydoAsV6cBUlCd+p/Ip7g0ITt7G3T+Xd8CSP2W9LlOY7XRcjBOcgPi05h4HaXwhsE
         OJ4A==
X-Forwarded-Encrypted: i=1; AJvYcCULHdTrJwmd15ip325QepsMUXule+7mxPQw2gfnZdZI2RiK4sQ9UovRnrVG6vzBRRZ1pyiZSPrC/pYtUUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpuPbq50tQsXSt+4rQJVsvcQ+CaLxMVwJTbSiGGHy/56MgDpAZ
	BAjdNj598Te3syttlV8qWmdBrQCKL3/v3zPd0wjgTa6ImspYoJXcS3Xb5ggqFWc=
X-Gm-Gg: ASbGncu4jm+Syd7SPpSXDtkHPtTtjlCZsMyrcH1LF6BmJ9Bp/bldJ3hUkFLrX557fvQ
	IdsW8DJOEpXPHhSC2Js2aH9NikN+DJXIt5T6zxsnfPekpBUhdhoadTdsld+5ZMLIzpVIjVvqatl
	jhSOLUklojVGNOimOdED582Z2KHwQeLlRB6WkvKv2K+Hsxaa61cwDy3wWtu8WsDEkjMNS8Yj3yp
	qSO7JnCL74MXFbu87KDwGQY32S8B6tW0YojZWpH/cJORMYG9RXOuS0Iiv3A2jfSgVhLyMUkhX+X
	PZjixlfEbcG1anUaGNqyv+brLi4UkxkMAKaM/9YEjFiwzd0d/NVkIMTkH42W1M/P/azSe7pZ/wi
	tDj5JdpRVbSXvb2gbnA==
X-Google-Smtp-Source: AGHT+IGT0KD1rwqZMp8b71UN9yccwtiki6dXwmQJOHZ0zOU4Z7/WKqg/wmAry//YOfyNBfSg+DF1Ag==
X-Received: by 2002:ad4:5d47:0:b0:6e8:f166:b1a0 with SMTP id 6a1803df08f44-6f01e78f95amr183606066d6.36.1743908797474;
        Sat, 05 Apr 2025 20:06:37 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f14d4basm41678266d6.108.2025.04.05.20.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 20:06:36 -0700 (PDT)
Date: Sat, 5 Apr 2025 23:06:35 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/3] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
In-Reply-To: <43q1qr20-9q83-74n7-no7p-n178p6s6p279@onlyvoer.pbz>
Message-ID: <7647q75q-6374-108o-0r1n-277rn7np7101@onlyvoer.pbz>
References: <20250405204530.186242-1-david.laight.linux@gmail.com> <20250405204530.186242-2-david.laight.linux@gmail.com> <43q1qr20-9q83-74n7-no7p-n178p6s6p279@onlyvoer.pbz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Apr 2025, Nicolas Pitre wrote:

> On Sat, 5 Apr 2025, David Laight wrote:
> 
> > The existing mul_u64_u64_div_u64() rounds down, a 'rounding up'
> > variant needs 'divisor - 1' adding in between the multiply and
> > divide so cannot easily be done by a caller.
> > 
> > Add mul_u64_add_u64_div_u64(a, b, c, d) that calculates (a * b + c)/d
> > and implement the 'round down' and 'round up' using it.
> > 
> > Update the x86-64 asm to optimise for 'c' being a constant zero.
> > 
> > For architectures that support u128 check for a 64bit product after
> > the multiply (will be cheap).
> > Leave in the early check for other architectures (mostly 32bit) when
> > 'c' is zero to avoid the multi-part multiply.
> > 
> > Note that the cost of the 128bit divide will dwarf the rest of the code.
> > This function is very slow on everything except x86-64 (very very slow
> > on 32bit).
> > 
> > Add kerndoc definitions for all three functions.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> 
> Reviewed-by: Nicolas Pitre <npitre@baylibre.com>
> 
> Sidenote: The 128-bits division cost is proportional to the number of 
> bits in the final result. So if the result is 0x0080000000000000 then 
> the loop will execute only once and exit early.

Just to clarify what I said: the 128-bits division cost is proportional 
to the number of _set_ bits in the final result.


Nicolas
