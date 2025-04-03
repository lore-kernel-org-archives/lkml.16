Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47A13AA2D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688974; cv=none; b=T4ImHocClpzmbfVWIHUMnGWs4iTr2fU6Zrj6vLOIQRWDGgkBmiGjARxcgZQO8hsgCQGlsWYBJWkBdQ3NF/BEndoxSG6OY5OJx4nrJr0U5ItxQTjZpcY1ZN9JC/7yIzf03wgJWH4+puFK/eo6PKGfmN5NR4+VP4sGZaKHAfflB84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688974; c=relaxed/simple;
	bh=ySplVsZrYa7uam53Eqf2wzVsuoFtCZr2JBmfEDqL/9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqAgD+2B9WiLuM/cc7RBjJqxP5mf4bSbUsDNJb/D/1Dbebwu/7uOEXF6AFAz1EfRebvooSQbRKkn4gjrl+RodOxorfDYLhw2CdMtK3S1ZsgaS0dP/GZ+dIP0cU8iB0yoeSRi9C+YYfk/jBK/c2DuWMMaBz1sRdxVCK10oJBY5hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BdmjGGja; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BdmjGGja"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efc457bso590570f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743688971; x=1744293771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+P/fcwwuOwqQIjU9mMQ4nxLBcbO4x0MJwAiL+Bionew=;
        b=BdmjGGjai1OzwNGchhTf3cbs97Jbl0uGmrAtcaunDi97XUyCqqUc6Sgm5OyNcB82R6
         H9opB5sdR3PYzKRl7zLaNXtNTSKTfRG+nHtZc/a/hE/EZAcJK24Y311Oy9aV6YxyjmEF
         +rNoxdf5ZcqE1rqLDEt9M0m24x9Db0a1n5UI8shwxLkR0MEwb6BZ1+6Yxr0TiQ4qqZcv
         ufDEfCvhhP8xwOfsmUg3i0YbJp4AxqJ9zNd29htV+m5FrZnm05Prn7cb/pCSlIxuSmfo
         xkcDA3t4V1Bnon6zxFI5I/JsYlyCf4dt9k0X5U5kFxcmbx1p6pFIy12lDiLIv/b8GPkB
         gIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688971; x=1744293771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+P/fcwwuOwqQIjU9mMQ4nxLBcbO4x0MJwAiL+Bionew=;
        b=uhrSUy5ATadgr1/5kMKO3ocStntRblcVaEqlLoC9cZrbh0KmPpIBKbl9ZhRSVIdHBp
         AueoRzA2XRMNhDSzv4UFR+/OSjT6PEBRXKiP+U1an1PySbqvENXJpC+ku1LDIXFu+UbL
         a1MBJ/8C0L9altGnJTngOe4CODA98uUFwTHYeIBqD+YHJr92nQry9958pOAiEkjqxVNL
         xu0d2tG5BSyO2jdnrHvp0QViZSMSd8KWofiFAGjsPKzF4AhcJgDppcqVy9RP9dUdaFgJ
         bLwigv5TQe2F/hDIQENcDylLqqgYFigMl9ZTKBQrL+nunR9oIUgUNbVQicZlEXCkzXEa
         LrhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5rvtPufqq6d4suGL/HIvXyWkEkzr2aLBKH6PU63zi+D86U8hc7ces7V07fx5vrj4jsrKaHGM35spcv7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4vVpmCGSAAvOdtukjhkATU47U7qYrl4WhcKFyTxYO3E0/ESp
	79SY/5PJa2XpJbPKcKbdfxpvkgBN3QmWtcOdnFY+UCyqz7Pq7etnF1ZwcF7Bo0U=
X-Gm-Gg: ASbGnctM9kc2FnqokoGsj6tZp2RMHsMzyarzFj8EvBzAxZBlnqL/NjtqkF+iQLxRSoD
	jd45sSEnv0byil1xdagBy/7N8GGVPw77NpGrTQxFBBRouftFACR2Q2M2BQnINi9PXRYrTGNP8+j
	C6TAMxsOuGP/cKYvhKYEzXYvrRt5t8b6KrJ7zIzDjMUXMm6DhiaiIPUvh6VTeRPRPX1nzIkGwo8
	7KXtB3bPbHEbZZxr98wp4IRsdYyS1KZ5C3ghUbYyZIo3yGc4dzK871guWt2GbQ0mviyfzUPDuak
	VwLDbY37Zz9Won4qUhne8MGn4e4CEp/iqF841TYF+jTwkK16
X-Google-Smtp-Source: AGHT+IHdAKPVx7bRmLNoSto9EYVr8heMhSN7sP5UdtAYzrd+fzO6tg2jM76VfLIEkZhp8W8Fo8l1pw==
X-Received: by 2002:a05:6000:430c:b0:39c:1f19:f0c3 with SMTP id ffacd0b85a97d-39c2f951283mr2442185f8f.46.1743688970579;
        Thu, 03 Apr 2025 07:02:50 -0700 (PDT)
Received: from localhost ([41.210.145.136])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301b72d5sm1858765f8f.47.2025.04.03.07.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:02:50 -0700 (PDT)
Date: Thu, 3 Apr 2025 17:02:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Samuel Abraham <abrahamadekunle50@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <c3ae531d-259c-4bfc-863d-45d08bdd6189@stanley.mountain>
References: <Z+05IEjV3pczMLNQ@HP-650>
 <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
 <CADYq+faUTmNcUgk5jB3YHT4UCQZhf=Wsah1WUcPHqky6kp_cUA@mail.gmail.com>
 <2025040304-overdrive-snugness-8b05@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025040304-overdrive-snugness-8b05@gregkh>

On Thu, Apr 03, 2025 at 02:54:01PM +0100, Greg Kroah-Hartman wrote:
> > > > diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
> > > > index b3535fed3de7..63343998266a 100644
> > > > --- a/drivers/staging/rtl8723bs/include/sta_info.h
> > > > +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> > > > @@ -86,7 +86,7 @@ struct sta_info {
> > > >       uint qos_option;
> > > >       u8 hwaddr[ETH_ALEN];
> > > >
> > > > -     uint    ieee8021x_blocked;      /* 0: allowed, 1:blocked */
> > > > +     bool ieee8021x_blocked;
> > 
> > > You should also check whether this is a structure that is read from the
> > > hardware.  In that case, it would be a concern if the bool field does not
> > > have the same size as the uint one.
> > Hello Julia
> > So following the conversation here,
> > https://lore.kernel.org/outreachy/bf8994cc-b812-f628-ff43-5dae8426e266@inria.fr/T/#u
> > I was able to compare the assembly code of the file before and after
> > my patch and this were my findings
> > 
> > Original assembly code for
> > # drivers/staging/rtl8723bs/core/rtw_ap.c:392    psta->ieee8021x_blocked = 0;
> > movl  $0, 436(%r12)    #,  psta->ieee8021x_blocked
> > 
> > Assembly Code After Patch
> > # drivers/staging/rtl8723bs/core/rtw_ap.c:392
> > psta->ieee8021x_blocked = false;
> > movb  $0, 434(%r12)    #,  psta->ieee8021x_blocked
> 
> So the structure size changed?  That's not good at all, and is what I
> was worried about :(
> 

You had complained about a different struct.  struct rx_pkt_attrib.  It's
fine to modify this one.

regards,
dan carpenter

