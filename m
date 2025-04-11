Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D738D238C3B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367833; cv=none; b=cBy9JC7O2txzBafENAg0nJCiF405vP1+uQT8FnVAXfkPWH/iZOhYTR55pwF7p/TmbswA4JBhsuBec5QodO/bt88jbebwx0HZ6+eqZGEMNsl9qQ8/b/Zbc0k345hZTAqB113UwaC7aXanmOWIaNWSYkIJVLjPJtiktmcOXobPda4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367833; c=relaxed/simple;
	bh=sLgEhosIiClkmN38ByDrkKMD8MCsL8n4/9O2uH1NbTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDZM6I5vwH094zcgDJjskUS6J9EaoY9O28NMLVNsm9cYljrciRUglhyXqlPPk+DdheSjHesWYSIPEEanZMkw/M9NRQIHRd3UpIygUtU4rlqbpyAR1HAhrdvMx5dYuUTxJ0FQWKJ4W1NYdgLE8eoORnpf5kvJniR+p/N/6a9ncfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eenrg+aW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eenrg+aW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac56756f6so1485337f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744367829; x=1744972629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dQWjyQgcrnSXNH4I07TDBPfUgXp/t8CB8smCTP5VOok=;
        b=eenrg+aWv3otnRHWSas1f1tob5PMx2b1JKqEn/XkDZiE5f/IpW/lVEjDls34Cze7Ti
         lgPencyn2aYWwtzFfV0SIlrK+B1Cm7/zLsmR5vJqFCwJnpgjgk3eMVWvxNRkUZ6XQHE/
         IC7sDR9jmRi39FtdefK4VDorghYk/G2gV5xNRRYGyZBnqtZhXJBiulOYp4oYTCloAevH
         eVzer/TOvY7pnoro1kVsQGurZUD5iI3ZUPSjeyb93qAFVbvtp1pSW40ZcizIk9tJCh45
         v0snRKldS1nE8v06bWdcGzQjFNvJxHp9xP+2SeYP3IL73UtQbC/GTnDgeVrY3NgzayRj
         jJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744367829; x=1744972629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQWjyQgcrnSXNH4I07TDBPfUgXp/t8CB8smCTP5VOok=;
        b=L+Q+4uo8tmyr1a5J+g6tnMRd+lfGX+siXFoj/mvJT4Yt6NYuQUv55I9nia5QcXtbwL
         tHkrnKTnrinuHVtsp1W7x2GcFCRCTC/xZL7TQfazdtp92fUAQ0HSmq0I9x+7JA2hc9zh
         ILO6K7M7nBmWPOHGQpdC5ypRQwUHZ3ahblzkEQroz4Dz3af9JOJxGQkqdRXVDwa3Iqrr
         GWhSSINUZ6aX10FOL8MDJrwbpuhIBvkif5GdYgO/gfCelh/9ZOHvRPZ0O4hdZZmfpFHI
         jhYXpu0C9acLyPK1opZlud4mLaNh6rcSi5VxMlzVZqOmp3exZ9NkCGf4YbDXyxPldNhQ
         HVXw==
X-Forwarded-Encrypted: i=1; AJvYcCWKbRsH39nB4QyBi7oJDSdFe0vnaAK8xsmYQafPmAjBTAb3cWkRbidLIJ4Van+AQSsdm8DF/FdybUKoicY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwHJx+CIx10hrNB3jBqMEfsIxT0MQcNfZ2koTRtbgDrf4JJ6I
	OUOrY4r0isqXF1LSPKnjMdoAPM/WchwyubUhcW69a7jvE7hNleC1j5yPY4Z8s7k=
X-Gm-Gg: ASbGnctbDXt75DuBX5as2swmWK0uuG4ZOKncJg0xx+4L9Nbf48w2+UV7SariMG1kJf/
	3OvAUB8C34RM31L3G43oQP7cG3gzsDnnoWpRGw3mN/0xnTp7E/Zq5bYXGaMv8ZZU20nv47EBxBc
	WI3lCEG61/4DiQeWvIoyowCZNM5xjx+DA9pu+7BIo9Erey5soA2LA/Z5MUuDVCNj5Y2l7VALJQU
	BYzlpxq546VCmghOi4NnRVusSPJIL3m/ntyLBTzI6Re5xkK9l6/TDq7MWFfjQx5bnPKC4tsyAYp
	FKfEkqHc7BKZaS44KxXsyDvpmuY5x+5LORg4x6JjNBEGoA==
X-Google-Smtp-Source: AGHT+IFIi/9zGRs3AClAo2EJWnN7AIzxihbTuvReSRFjk5w23zf+QxRBAsm62BO5WW6Htp4AsQx40w==
X-Received: by 2002:a05:6000:186e:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39ea5206fb0mr1660915f8f.15.1744367829113;
        Fri, 11 Apr 2025 03:37:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae979637sm1636544f8f.53.2025.04.11.03.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:37:08 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:37:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	andy@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
Message-ID: <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain>
References: <Z/bA4tMF5uKLe55p@ubuntu>
 <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>

On Thu, Apr 10, 2025 at 08:43:53PM +0300, Andy Shevchenko wrote:
> 
> > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> 
> cmp is good but not good enough in general. Here it shows the 1:1
> binary, but in some cases code can be the same, while binaries are
> different. To make sure the code is the same use the bloat-o-meter
> tool instead.
> 

I don't understand what you're saying at all.  cmp shows that the compiler
was automaticall tanslating the "& 0xfff" into "% 04096u" so the resulting
object files are exactly the same.

./scripts/bloat-o-meter just looks at the sizes so it's less useful in
this case.

regards,
dan carpenter
