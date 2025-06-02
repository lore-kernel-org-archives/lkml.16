Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728D52F509
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862062; cv=none; b=r6ugXjqTYTjiZXRwjpAsCbVp4pLMHVP5Uah5mi5rjTqIL7ebJ2fj359AtF1jMBWlF61BlK1COrSxNTdpB/v7XN5XuYQcXvAkDvUH66De9qRhzT0ISiDC6Yy7gwL5ubA9KwU4x8qJhbSd0zBUm5pvM3Id/Ly+VXHIAgU0rRRnBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862062; c=relaxed/simple;
	bh=hl/euo6Sdu63YjYGLOEeGJpt1NRGT7Z7ek+NVDBVv2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxENr19oARfwM5HKgzlPWuXmIiSXdO1LzbwZsshy1QmPeiTwiwqvEZfWr79j6m87OlewnI2wRh5xrNr4cVlcVL6+Olszr9nn8MYXVgpIBg1aC5EXpmRuJT7XyjOIgeW59OAsNCZab8f0sEvoW2To6A+yrZuHmwyEq7hCaVVWtt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7bFXCtv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7bFXCtv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea341570so28477945e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748862059; x=1749466859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APwGN0/eqz9/45Et2ppeGaMN2T+hRqNScPGgnQKWid0=;
        b=n7bFXCtvmn1CN4dqe79OjmIvlzKvZ3QLTQVC8jAtiP2bzHSE1L1mwXIMNhbxQglMGo
         YPp9WJc3+H7M+kpGPvqv6qcH4+l0whhebiHH6B8COWqfkqbpLcb/3a9+j7sjEePc4sqq
         oUfL7IkvFv5ua2vgFqHXomBgP1VQ5KWWJPocJhVxVlX/KEVDaEAD0iTKuaokakmkM1S+
         KFsC/Jebpu9aPPvvrd/OIbtX6HqxdA8fJRzKYt/2Qa9V6OZqITpoH1fRWy+hD1eEiCYu
         Ps8VA+bK2LsjnLMP43qr1mFSUJs6PwB3mcovprJ8fVA9Os63qoE2xxjqNaXx47+V87DG
         f9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748862059; x=1749466859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APwGN0/eqz9/45Et2ppeGaMN2T+hRqNScPGgnQKWid0=;
        b=PJrg9CL1w2Cqw9TvRdduJLho4kJ4CGeqEc45ZZumIBajxOY7b+9ECnmcndYPzv03gV
         dllCuzKw1TdTBdQMxXaRZTQj9ijnY3IYAAUIxov6mpBroRcWKVUa+eGYJLnN88/9ABBh
         NmDaoQIIt+NJhGeNCtqyyGmrsNJ1kdqRUJn0av1ASI3x6cRDXZRCYoeglH+9kh6QXETe
         VR6JeUW+c4xMErathx5vZ3s4w0oDGL2YT1az4LL0eHcXBEhEVX36ps5j+SsjgCFsvFzJ
         3jk01MVc0NbxRnSNzhZNbwhu5wA6TcD5wY0/qKMkEqJMFNfuIeRn6zxscbU1gytGfdr1
         3JYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6RruOH8Y+Gi/rw83yWOo2dTvdUY3HGQI87EPy+jULpo6LqM54pPE+tkcGEzwL2IfmUGiU4LVpihgJXFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxacI330DgKOljGx40qmcC8AYYcaakVxrb0ZDKB5CgkG02KkPPh
	ltxXeAo2v7v3pAC1yIlP5tgRSIf+GFhaZlXQBxUfO6EHWu50kf+Y3+PDPr0G+twQHOI=
X-Gm-Gg: ASbGncsaTtnUMVxqh2oCcIQL5TDt3Dnzr/dp9QsOgV68yxP1PT0CaeVYwZtLlBktbwC
	mztIVhV4S5P8BwbOD9q2/XcAsuFZItJtF8tv1XyR2uSJ2YOLr0I/sTAbOs6V3e9pcmz/oifuOet
	eoLzWcE5d055RSw/084HmvcN0QvhY474x8AHivhDjIUirOOl9GRf6qG3pqHucWO5FrjFUHBlp7I
	Kdz/ryBwx+jPIOyIEdw0S7rEV7j2LlUOMKg1Xc90jY2mVUiQcXkV5Zi4hyQJMjJ6otE8Pja12iX
	K1Omr0xg8tNXuYEGlh2dI1rxYRHLlfjxyuYW8wSCIn3u4vbdFQSvyRs=
X-Google-Smtp-Source: AGHT+IFvqSbq/mxIH2p1mh4XibQErn6t9isHaT2vMWAsPAcME6qqAGy+0iLzr3WNRcfVG5XZiGtRHw==
X-Received: by 2002:a05:600c:4e44:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-450d882b3c3mr109348255e9.2.1748862058518;
        Mon, 02 Jun 2025 04:00:58 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7facf9dsm115376275e9.17.2025.06.02.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 04:00:58 -0700 (PDT)
Date: Mon, 2 Jun 2025 14:00:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Cook <kees@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: ims-pcu - Check record size in
 ims_pcu_flash_firmware()
Message-ID: <aD2EZRX8CVuvqjsN@stanley.mountain>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
 <131fd1ae92c828ee9f4fa2de03d8c210ae1f3524.1748463049.git.dan.carpenter@linaro.org>
 <202505281611.A024D45E@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505281611.A024D45E@keescook>

On Wed, May 28, 2025 at 04:26:18PM -0700, Kees Cook wrote:
> On Wed, May 28, 2025 at 11:22:24PM +0300, Dan Carpenter wrote:
> > The "len" variable comes from the firmware and we generally do
> > trust firmware, but it's always better to double check.  If the "len"
> > is too large it could result in memory corruption when we do
> > "memcpy(fragment->data, rec->data, len);"
> > 
> > Fixes: 628329d52474 ("Input: add IMS Passenger Control Unit driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Kees, this is a __counted_by() thing.  Would the checkers catch this?
> > We know the maximum valid length for "fragment" is and so it's maybe
> > possible to know that "fragment->len = len;" is too long?
> 
> I see:
> 
> pcu->cmd_buf as:
> 
>         u8 cmd_buf[IMS_PCU_BUF_SIZE];
> 
> and fragment is:
> 
> struct ims_pcu_flash_fmt {
>         __le32 addr;
>         u8 len;
>         u8 data[] __counted_by(len);
> };
> 
> I assume you're asking about this line:
> 
> 		fragment->len = len;
> 
> I'm not aware of any compiler instrumentation that would bounds check
> this -- it was designed to trust these sort of explicit assignments.
> 
> This is hardly the only place in the kernel doing this kind of
> deserialization into a flexible array structure, so maybe there should
> be some kind of helper to do the bounds checking and set the
> "counted_by" counter?
> 
> #define gimme(from, into, counter, len)				\
> 	({							\
> 		int __gimme_rc = -EINVAL			\
> 		size_t __gimme_size = __member_size(from);	\
> 		if (__gimme_size >= sizeof(*into) &&		\
> 		    __gimme_size - sizeof(*into) >= len) {	\
> 			into = (void *)from;			\
> 			into->counter = len;			\
> 			__gimme_rc = 0;				\
> 		}						\
> 		__gimme_rc;					\
> 	})
> 
> 	rc = gimme(&pcu->cmd_buf[1], fragment, len, len);
> 	if (rc) {
> 		dev_err(pcu->dev,
> 			"Invalid record length in firmware: %d\n", len);
> 		return rc;
> 	}

I don't think that really scales...  I don't know how KASAN works
internally.  I was thinking it might track the buffer size when we
assign "fragment = (void *)&pcu->cmd_buf[1];" so it could calculate
the valid values of ->len.  But that's actually quite complicated.

Smatch does track this:

drivers/input/misc/ims-pcu.c:856 ims_pcu_flash_firmware() buf size: 'fragment->data' 119 elements, 119 bytes

But:

1) Smatch doesn't know about __counted_by().  This is just a matter of
   writing the code in Sparse.
2) It's not treating fw->data[] as user controlled data because this
   driver loads the firmware asynchronously and Smatch gets confused by
   threads.

regards,
dan carpenter

