Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F15C21147C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744057395; cv=none; b=BU1fcAOgp4FD3RluN110THJYB0OZmwcECHmZLS/W33G5j0Zu7+6DY346K4X5G2VpYOcaKx7tb6TC/YXts+wgVF+w1ROuiwErGmXoSoV1aC/HNfC2gEXiz/tEXcB2I+0TmOLiPqqCsFjL5Zi2PiZrJGMziWRDY2hyDbwp7dvmyVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744057395; c=relaxed/simple;
	bh=4CDBc+mrtMUOBHFLrkJy71IEFHbPFn3VjbOrN+CDMuE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGLPd9njQx5rc7CosdnFtkBUF4YlEbCE9H9dhg470TQJtxlyfvnLqXkXKgAcyd7amW+OSo3x1FGWGIMdbSkgXUkZ8eOBpR037prQSf1f/DwTBH3jRFWzx0pxhXxke+9nR7Ts8+nZDm+WCn1uttCteL+LEu8SilVFbNbGSe4gimw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pp5cqW9t; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pp5cqW9t"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so44332515e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744057392; x=1744662192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIh6ymbiYceFcr8rtxX0TDsT4gw+UoBHwK2YyD57zKc=;
        b=Pp5cqW9tfdFR3yA7Iz+9orEj6QxOL+xuxD+dQhodd41m0S4vi1213bYbWGMMOE4IY6
         Q4kYlKAEgIKlbvXni8u8XHx529yHniGZ4qn85wP/3ECCg4F/sLMxeW0uJv32tSjor8ac
         lU/InCMmz6USEnvYGPNO1Nw/o/VytO1F9ECO5XKjgsPILwGw4v2oJRWrBAOwtxrSVPpG
         dZ1bfUs4AOBHqpPj82zDZSkZqryDcGssKSehOIt6eoAAzOHzYsAUl5nilY7zAJVTiloM
         ted3Hg506RjtLNPSIhRJtz6P1Dt0vhYAa6Vy71zCRw47KUBKYdumItgL95BBHBbIR6/h
         gsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744057392; x=1744662192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIh6ymbiYceFcr8rtxX0TDsT4gw+UoBHwK2YyD57zKc=;
        b=V4awTENnMN2uVVLWGt4CWv6cTtFRCD5qk5B9tytVPwo3puePvkv66Gk5AA5e7IFjcH
         Jsul5pszFZ8jyRm+9A0g7WOt5Glu7HSJ/z+Gsx7G2H3oyUP4rrMGFrOE2K1PKGjc1yTg
         oOKd9sXbSqDCqmzHZ+/qtNyTZS36rI8ayCMt5JVw+tuOhnX/kcKnozDpKMAJIGU5CVNP
         EftebKiB9c4LhjeIV2EJBjLYgw7ZZOIYsAduM/F23PVZXwlWI/hUIO+Oez4LmnBjdoTm
         EzxTd/bZV3wB5dzWrOumVBYOVu5i20sX6ZDgtvp/l0JgyzvXddrk+24Q8UIG9zMaby8q
         fbPg==
X-Forwarded-Encrypted: i=1; AJvYcCVUI08YFGGSDrB5Ch4MoIED44hi6+7QZ1NU0CQAKHPE7kBFM4SCmQxG9W2VyY0PY6uqAoFxHsoeiv3x/88=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHShIk1PiqLHH2kO6UfkohNLfi5rW3GDg9pfxSpiutZHXeiS+B
	iXq2JV8SWrAlDXHI8zE3OHqC0gClS/mva6e5ShBukzrhUb3Z+rBW
X-Gm-Gg: ASbGncutABl7hphDW4Fdhr+i1FpttwgpkfmkL0aMavQIUNO6oECfj/a7030Y3kO3f8e
	uVsv9Gv8vjXser537q9m5plbhZ0gjaAOT3AQZSJ2lNfIs2NQIgNBnQORE6IXdCqI0JqH2Z5U/RP
	qx6joOH2zgwQRbplvEmRFGEFOQHBSkQYfsZDvktpg7KTk3pIUOV+e0AfX4wzW1tIJummrlIjuPp
	ps42a1lHydPhi6CQpldpx4ujjuXhuzZ2vRAjmmhRkO+Vtf/TlBAZTaOtWRhNogQwmWAZLATOFaZ
	+HzTN8k/7zIM0xc/ugdgttA2lMQZHJ1AAD+lQFYbNlHBIQfBJSSdjNZwsmQV4XrTZ6qE2ndFZyW
	Yp5tBh2I=
X-Google-Smtp-Source: AGHT+IH1RCOQ1unKQhmVQ+1tPlQJT6C0JXcdrvp8NBQ0NCQJlMO5k2Rl3z1kb1H7RDOFuF7vi30b6g==
X-Received: by 2002:a05:600c:1e03:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-43ecf8ceb2dmr129603645e9.14.1744057392109;
        Mon, 07 Apr 2025 13:23:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eda4662a0sm101920725e9.36.2025.04.07.13.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 13:23:11 -0700 (PDT)
Date: Mon, 7 Apr 2025 21:23:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, Andrey
 Konovalov <andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor
 <nathan@kernel.org>, Peter Collingbourne <pcc@google.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
Message-ID: <20250407212310.0a934bad@pumpkin>
In-Reply-To: <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
References: <202504061053.F27227CA@keescook>
	<CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
	<FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org>
	<CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 6 Apr 2025 19:04:29 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

...
> For something like wcslen() the answer is "DON'T DO THIS". Because
> there is absolutely zero upside to trying to recognize this pattern,
> and there is real downside.

gcc also has a nasty habit of converting:
	for (i = 0; i < len; i++)
		dst[i] = src[i];
into a call to memcpy().
If I wanted a memcpy() call I'd write one - so will most people.
But if 'len' is very small (may even known to be less than, say, 4)
you really want the loop - which is why it was written.

I've even seen (not gcc) it converted to a 'rep movsw' 'rep movsb'
pair at a time when a P4 might have been a likely target cpu.
The 0 to 3 byte 'rep movsb' had a setup cost of IIRC 150 clocks.

	David
