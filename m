Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8C207A28
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743543458; cv=none; b=eSYkkOD2PassKVnWwM3EcOp1jBFUJ3dNcRk6f/W7CB7cbSVYrggWkr3B7BWKKULEw9giIt6T/f9yyrynUQLQeEOqSBHkV8DECdA7/C02NfNTL7RNvWGLqXA0BjUaoHMuOEzgj3fLOnpdD0zS1HizCb3ujclkR+5BiCH1eo/6PSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743543458; c=relaxed/simple;
	bh=1vcknptoflNmHUpOJ6pY4OqzLjzYHcKawA7CQ+SvLCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iI0p5H9mQ45jFBF/uMZGEhdakpyxEpNKvWQLM0jk+KylL81t22yMv2XTJSLmpDDcXEeM6X38swbSDk7nAi7D/NUT/w/zIcsQWf6cclna+d7Ozhu57MKbSeZsyonG9oHTWoPUQ/Gp9b4k8rMw5rfzWt2mbbxQ+yiyacwmFbBj/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDiiwx+6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDiiwx+6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1295640f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 14:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743543455; x=1744148255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/COfYHy8zMoNgWQFTIVdamjY88sXTDSwchphGjfP+8=;
        b=dDiiwx+6VIEfSgtBQ763yY86twbdk/quaKax2atY+ucmZ8KjoADAa4iPIAgqAxmkKz
         mYtw4iyamYa01FCzxj5SWKXjWhge8n2EiwQqZC+IRB9TvOjccw6xklE7i9jNPa4ujzzv
         DqC5JL7NEYNhsqoVYEHwXEtS9ALaHG+bkGsaBPfHWuKmtG7l+iFqPiBfhEvgLKeTdJZr
         Nj3YBjFWHqzOcLMbnO0TysaS25LMsAVsinGfNEgz83a0ybvM3nSmIwMsClfJkcJFzJTm
         3GWyD/bHWejbLh/3NtT0CIoAoqiZjP0PbmJ+6Jom8YVvBJ6YsT9u4h4SH0Amh7k7Gktc
         +dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743543455; x=1744148255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/COfYHy8zMoNgWQFTIVdamjY88sXTDSwchphGjfP+8=;
        b=HivVDIEVuW94VWOghH8mCLevup1waBACfbb32QssuIjpK9Go3MSztsfqhtSlPxjLu3
         pIYxH/uyntmo8h3IfgCMozzLxz0Y5PTGcfMLMjA9w0fPUBc1St09PNkVxKHcmqgAW/tg
         +8FvfQqKrJKb8gYz+hARJoQ6IZeA8p3w3oc1Sf8XIlzZVHxjCrftsgT2xoyJ7bXeniwR
         I0DzIP/43FcxaS5vbM4OrmhQkhDOGhdUvXbZ97WGiqa8ftrlKiP+hjNTunqnVHVC2oRq
         32uE6pG/R3SH94BGU1c62cPC8H3Ko3URy/X0U9Jr71Rdi8FqHWTFJzMEigJepNGdDCsc
         iWAA==
X-Forwarded-Encrypted: i=1; AJvYcCXMmwSXbK6A+p1B6JZFnrpmyiPhAWvVh4jK48E3OUhSYjieM5GzWsHvhFoDqayI/I+Fw6SBDtdxIMUMZn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYZKXglhFkcln8fX7p9E0Za7aFKGMALbkuruavBv1K5IvgR3Ne
	ZfwXgavaO+Rg9rp8XD0mqH+2j5tve5sdx0J+GQH+vhBAgM3UbdvXsQpm1Q==
X-Gm-Gg: ASbGnctgoK8yagRq7TIS48PC45cdkD3cameflXQSndyKQ+VbpOsYvQ5EvyfwIVHFvRG
	52pP9/Cfy6IOxdEOzw+MhF980vxGoDiQ1TwLjbq5qpN/h0Qo4vh4h3jx+GLW0EoiUgnrWqyC0l9
	O12nbyq9EQKesI8ZcIr4m/xqDnN2MXwW1dt1wAfatJZK0OrWMnlxnPdUwHNImy12ST/dnwVahyV
	StpLL1Z9qz8m29Z7QyeG503IiE9zEoxX/M7Gg1HtVoxQAAT1ywar+04cCMCcWXDvah8XjO7EeO9
	CeSA7ioA0+f87gVv4i7FYurUGtDU364IeJ16ZZBfbE599R2b/axhjzlT2G2bg4za07vadKGaXu1
	f3qyDFIWMzJthnOcHMg==
X-Google-Smtp-Source: AGHT+IGO2jfmP8rGFS+Z8fDLNDz0+RSFspxtr/BfcSaRT/pE/49LTqJl+8QqfZ0GhWexSj6A/yNIcw==
X-Received: by 2002:a05:6000:2907:b0:39a:d32c:fb5e with SMTP id ffacd0b85a97d-39c297530f2mr71592f8f.21.1743543454559;
        Tue, 01 Apr 2025 14:37:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcf42asm957565e9.15.2025.04.01.14.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 14:37:34 -0700 (PDT)
Date: Tue, 1 Apr 2025 22:37:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <20250401223731.7102103d@pumpkin>
In-Reply-To: <46368602-13n7-s878-s7o2-76sr0q67n9q4@syhkavp.arg>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com>
	<20250321131813.6a332944@pumpkin>
	<epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
	<20250331195357.012c221f@pumpkin>
	<mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
	<20250401202640.13342a97@pumpkin>
	<15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz>
	<46368602-13n7-s878-s7o2-76sr0q67n9q4@syhkavp.arg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Apr 2025 16:30:34 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Tue, 1 Apr 2025, Nicolas Pitre wrote:
> 
> > On Tue, 1 Apr 2025, David Laight wrote:
> >   
> > > Looking at the C version, I wonder if the two ilog2() calls are needed.
> > > They may not be cheap, and are the same as checking 'n_hi == 0'.  
> > 
> > Which two calls? I see only one.  
> 
> Hmmm, sorry. If by ilog2() you mean the clz's then those are cheap. Most 
> CPUs have a dedicated instruction for that. The ctz, though, is more 
> expensive (unless it is ARMv7 and above with an RBIT instruction).

The code (6.14-rc6) starts:

u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
{
	if (ilog2(a) + ilog2(b) <= 62)
		return div64_u64(a * b, c);

Now ilog2() is (probably) much the same as clz - but not all cpu have it.
Indeed clz(a) + clz(b) >= 64 would be a more obvious test.

On 32bit a check for a >> 32 | b >> 32 before the multiply might be sane.

> > And please explain how it can be the same as checking 'n_hi == 0'.  
> 
> This question still stands.

'ni_hi == 0' is exactly the condition under which you can do a 64 bit divide.
Since it is when 'a * b' fits in 64 bits.

If you assume that most calls need the 128bit product (or why use the function)
then there is little point adding code to optimise for the unusual case.

	David



> 
> 
> Nicolas

