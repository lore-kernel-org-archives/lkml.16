Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB11F1FF1CF
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985659; cv=none; b=DtBzF6ubhIfVIHcrA1vWxdj4FdWVh9dmlKjQiuFaTda+SM9bpsZHP2HrBkJfl6wcZTNDjMOOsob7NUsc3x+iYv59pDnl0IFiuHGHtQfYFzWr7xtMm6PphF6opzI7RSQWqtLosrpftuyItH0q0Rodr4kyhUOQlAhjeBalzKvcRNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985659; c=relaxed/simple;
	bh=Qkt6CzKgPN893+F10EPjsbnhOH/75Q3uShv5u11c144=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnNQ0fGclQJqnKXEoHXDp6g/vedHaJum8C967e53zPXJ13vif7pm6GlSs+WKN+pja3tx6V0IbbgTbZwOTv+qQMbyrqluCfTyR596o06HbIMjiKAFbMYabws3m2gUH6BI+yhjVUBmLXtqUQR+nrQKfB3kN1N3HmIXvKI8uVFqx5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8F14ynb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8F14ynb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so3726045e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747985655; x=1748590455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rduOkZPUSr0jN4EKie1NNkxovdysXjYIcidklDlsDmg=;
        b=W8F14ynbm84Q9eeHXUKOSzdgm7nZHSINHu9S1VpLeD8HYGJO1Wymw7HnZi5IjDfPuZ
         2DTw67TWpb9EjmYdtoMn9HAQ+06XzFkeOfidpkV5qDTvWdN3jKzv19EkvM0H1a21+dA0
         NwiKtD+yVltp4n5oAhjCAIhYhbHqF7jYTrsZentxB8r8rCQsxVCN7fekAWc1FAud2Bj2
         +rTj2HpvgVv69rhfKurimuWrT8qC2GfLEL0LuzJQvudtpn3OfIt9Ydsbe3GUIYSsBk29
         4P8BkBqxEpv2/xJacL8PhKzAVItT6pSB1fRTvKoeTW8c4j/ww32HN5N7TcKpWteCj8ct
         jjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747985655; x=1748590455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rduOkZPUSr0jN4EKie1NNkxovdysXjYIcidklDlsDmg=;
        b=QMtT5WXTg73eDfkWMDtES4Hr2ntz96xvbvBEcwL0MCqMZoslGIYnXhkr0nLO2wmNCu
         B7/QEJ97Lx/iVRdi7acaEUoF9bl3NyD3KoHZkDI35bI6Asxo/dBewIPJrFQx+J7AJdDT
         C97pyWM1+jdXUllEFdC9uL0qabGgXak7+QP+N7imDLJyPOzlsSTB0qP7KCU56zwItTse
         pzrvPV0rKSqYYO3M9C5X6ccl4KbibQXE3kkxTmYWk/yQRVtM+voI8C8scqLHHNrmzYHL
         JycrQOMGFlYoGzyT9tzleXPEUtJhtctK7xlHIdqetfkYMd2kxWxjbOFhGlYGl+Xm8sTT
         sHTA==
X-Forwarded-Encrypted: i=1; AJvYcCXkYBxvnNRmr6qfIS6UAw7xpgnfRvT4HZzuFtFBFVYNwqiZ7W0Jc9a+PFmKBloROiOtyMr1roO1wS8HDBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO6+UhANAa0LIvw0MCKbvlJvtZbHP2IUz/RJveA9/zkPRVtvSF
	jwYu/IYzQt9R97OzKPncGd8W6JhpT6Kx5iuGx33xneRGHOs02CMkkuINs6W9bUMtLn4=
X-Gm-Gg: ASbGnct3VOOmkPFe5gXOu7qFu//zVgbwRBJ5+qxlshVGcRMGZj6fFNs158RnBmtrNft
	NP9jLWwAAC59UHDjosZmI9xCRNLe+vFwU2KuqEvbwcJcdU3p4VM0puq3LotbsIp6c9uim9g98vB
	cdXaQej41V8Zum+j5ypX9IqDSkIWIEKioinecWaaeM9TOq5P7qzgpgOUfhgRV0R/mbdsjdlg0+h
	9GPlnYWRbaIth5+SprknZOZ4kyOdtrEa0om90cYhqsO6eLUuHerSqv6qnEK2EJuwMc6JAjILIlt
	YlC7IGfwjkFxIJKAqNhF4TKKPyqarNFrmHWXKHqF3mNGkQm+1Ec2LwWt
X-Google-Smtp-Source: AGHT+IEGzSRLRc18Yf011vkxlyBy+ms+Bypr7Z49E/z7Q5hD4YLlLfOvEpz0z0iR32i84oetqm+CBA==
X-Received: by 2002:a05:600c:34cb:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-44b51b67c5fmr21055805e9.4.1747985654946;
        Fri, 23 May 2025 00:34:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f73d3defsm127395235e9.18.2025.05.23.00.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:34:14 -0700 (PDT)
Date: Fri, 23 May 2025 10:34:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Charles Han <hanchunchao@inspur.com>, miklos@szeredi.hu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ovl: Fix PTR_ERR zero argument warning
Message-ID: <aDAk8pUwf6ZjDYQN@stanley.mountain>
References: <20250519041100.7611-1-hanchunchao@inspur.com>
 <CAOQ4uxjU+RC_8Ec62irOy-Kd7H6UGuqpasq1qb5fXmZgkj_tUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjU+RC_8Ec62irOy-Kd7H6UGuqpasq1qb5fXmZgkj_tUg@mail.gmail.com>

On Mon, May 19, 2025 at 08:43:16AM +0200, Amir Goldstein wrote:
> > @@ -577,7 +579,9 @@ struct dentry *ovl_index_upper(struct ovl_fs *ofs, struct dentry *index,
> >                 return dget(index);
> >
> >         fh = ovl_get_fh(ofs, index, OVL_XATTR_UPPER);
> > -       if (IS_ERR_OR_NULL(fh))
> > +       if (!fh)
> > +               return ERR_PTR(-ENODATA);
> > +       else if (IS_ERR(fh))
> >                 return ERR_CAST(fh);
> 
> I don't see what's wrong with casting a NULL pointer.
> This looks like a dubious smatch warning.
> 
> We could add ERR_OR_NULL_CAST() but it seems pointless.

The ERR_OR_NULL_CAST() define is kind of a horrible name but I can't
think of a better one...  To me, it's easy enough to just ignore
false positives.

This warning obviously does have false positives, but over half the
time it points to real bugs like:

	p = kmalloc(sizeof(*p));
	if (!p)
		return PTR_ERR(p);

Or copy and paste bugs etc.  There are lots of ways to get it wrong.
These warnings are always worth checking.

People should generally assume that static checker warnings in old code
are false positives.  We're good at fixing all the real bugs.  I didn't
report this warning because I knew the code was correct but I did look at
it on Feb 22, 2019.  It can sometimes be helpful to look up the warning
on lore.  We had a discussion about this one in 2020-04-21:

https://lore.kernel.org/all/?q=ovl_index_upper%20carpenter

regards,
dan carpenter
