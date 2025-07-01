Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBBF13C3F2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379754; cv=none; b=EIRYndDbnKSUNkIXn/bTzVQuWnREp32c4FGU0k8pt8nQ//RHFjHUwGWRriX1tfU/lOT+DZR/xSIRJmn5TqGbnkHFBRd6Ivl7VAGfQNB/BR//IN2s/hxWA4W3Rt1Yy1C/zdJnyaWPEARZgHYrZUQE3HowANMsW3VkOC64Jbxse9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379754; c=relaxed/simple;
	bh=8SNUHHsLZlbYQEbttYrEHI1FQBZFRL7HmeQ/RQy+dws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtiLI2c26d2LP4bVofaul3nhShXwZB0ZE6MS4BJhZ//zwpUK1aGwgURxWcYzBBvYPN0UdiIonRhV8GihhVdE6DzdfFxgK/9GgrW89seVpkkG3BIYksodwvjHubV+YRxlF4+MI8FdHIfMrCs/viH3edSLsA4eqcs1BP8va3by5xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ulj1MEd8; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ulj1MEd8"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60eefb805a4so612457eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751379752; x=1751984552; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8x0R9yhBqb5Y1VdS7ojeB/NMJonErKKyGe0msuTxWs=;
        b=Ulj1MEd8NodvkIiE2JaJkeoIM3ADNVilqidh0+V3y1F7GAVN/Yq9qQAwQ+30JyOiQk
         jYM1xS8Ry+xcCrnn5ROBM2swzKKvj33ZptwUhaXCIofnTGfJQ+OAA5V+K2gqDgcap6ZL
         klEJwyAHkdb/VTwKAJLH+MjUzkXf/uuQBJIwZQOpUn53WqZhB/WpqsHUbUeZ3PfgmmhO
         YcbErjdGBrTwDppUGOVrr4TUV0IKQJhpvmhRuBqWmqesbQGhcZe0xe6WKynkODkcwGne
         IGJYkzfT8CgopP7WFP0ZEPxA4sm+B4NUnXGIa7OcEILq2K/jzAw79FrNG29zBRPdi6Tq
         sb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379752; x=1751984552;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8x0R9yhBqb5Y1VdS7ojeB/NMJonErKKyGe0msuTxWs=;
        b=hAp4ZQrzXmHRde1qBmBdbDok3Mxbgi32Ej0SZh+/oFvOkkT+jW5fmD7EMNIAHpcMil
         19rg0HsJ6kIsB8OydIicQZ/Zs1KtBqLjMsQvo7ilQe/lUCh9nzX3ItpdpTVnD+8kHqqz
         VDmbkbJh/OacupL3RmaXbJDN8U8f0FompGktsqNX2vZBhRriqtiVzMeRlWZsK+CwOk/z
         BYNqkrNw66i1j9sbl4RJNYWoKv6N4mD16jYluFZAml1UYjcFkifM8gfL+Kn0CCs0a1mh
         EODW91S1Dv+UG78VkXzSDDpk3llysOUeTKEyCIgKyMH560rQ29InXJorQhbjy/FzRo8d
         r3tg==
X-Forwarded-Encrypted: i=1; AJvYcCUBLWp7r446nswpy31SFoQZEhvzpPXL5uHIliA/uDxuaboF2n6JqewB1obm9YzdxSkiDWaJrgIXD2LBHKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlqfhbUlkO8pkxbMr5CXjqWdS3xUorafdvVHn4HqRS7812PXh0
	I1zAL9eSzhblyasyJAwFxaIviOPUkmJDp2o6kuWmACyshbdfHGVo9F0afA6zEsvYm1M=
X-Gm-Gg: ASbGnctTGxr7lqML2je1yG1cHlLexnrjb9zqJ6yAW5tN8WvvzgVX2gQU1V8pW68N4Cb
	N87cd4xubGXWDKHBZTS9O4sIdZ4ivIN3lqlOowwvKbYiwh+GA6bda1WaZRID+mIGJtKOgnU9m3D
	0ff9Mus/puWMQk8OT94CWdgEl0GPWRLx3eGAjEeZLI/b2qx/5SZXHMykaBOjYKz9BTIOHhci8Za
	mFkbqQr2YgQ4WozRXul5VJtnf4tWH/941UzMqgyGwFyvmcVG9cX76RMWktIPkA3TOSmVwqRZayW
	ociQSai9xH7NUwD2NNqWfgunM8Ko6LQBq8u6ugbt48hCmbZaqu2zW/ZsDt31fjE02V9ftA==
X-Google-Smtp-Source: AGHT+IEpvP/IKG4XnE3h2afzTDYxxLm0xCTQLhlMLnl5t9v8LU08VB6RFSQVJksDddfCJibRGqTUbQ==
X-Received: by 2002:a05:6820:189a:b0:60d:63fe:2472 with SMTP id 006d021491bc7-611b901bd7bmr12009783eaf.1.1751379752307;
        Tue, 01 Jul 2025 07:22:32 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b8474de3sm1394279eaf.3.2025.07.01.07.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:22:31 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:22:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
	lorenzo.stoakes@oracle.com, tzimmermann@suse.de,
	riyandhiman14@gmail.com, willy@infradead.org, notro@tronnes.org,
	thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <89390196-a23d-4410-a8ff-b068f1795653@suswa.mountain>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
 <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
 <2025063022-chump-pointless-6580@gregkh>
 <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
 <2025070128-amplifier-hyphen-cb09@gregkh>
 <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>

On Tue, Jul 01, 2025 at 10:03:50AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 1, 2025 at 8:14 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jul 01, 2025 at 12:47:22AM +0530, Abdun Nihaal wrote:
> > > On Mon, Jun 30, 2025 at 07:16:38PM +0200, Greg KH wrote:
> > > > This patch does not apply to my tree, can you rebase and resend?
> > >
> > > I think you have added both the V1 patch and this current V3 patchset to
> > > your tree, that's why this patch does not apply.
> > >
> > > Commit eb2cb7dab60f ("staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()")
> > > on staging-testing is an older version of this patchset, and so it has to be dropped.
> >
> > I can't "drop" patches as my tree can not be rebased.  Can you send a
> > fix-up patch instead, OR a revert?
> 
> I think the cleaner solution will be revert and v3 patches together as
> v4. Abdun, can you do that?
> 

I'm reading my email in the wrong order today.  I thought Abdun came
up with the revert idea on his own instead of you and Greg suggesting
it...

This isn't a case where we revert.  The patch we applied was acceptable
quality and it worked fine.  Just do the additional cleanup on the top.

regards,
dan carpenter

