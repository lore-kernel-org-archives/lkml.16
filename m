Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402F81A23B5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757612; cv=none; b=C+p9K/yvHvSGZ9Uscnc3xkmTfCgIOG/arkSH6sU/Ty1IGGYTmEo4YydJ0v2Lvs+NAaW07Iyj/uU1A0ukhOrxQAS7hlePhPN+KX1xVjnfItlqoSkqd0CzkVUCZcYtYAmCiVdNgHFSuesy+C4542m5OosShHq0JfpO/fIRMuCc8Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757612; c=relaxed/simple;
	bh=LiQ46ouCDxXoz7PhA3FK5YU4CmrYA+nC5a7ln5wLKao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bh2dI41BpjMi6gXW6g2KjzM4ufoz1OWsBYskxHP5hU/bAR3E6/T1ZTOstUocton03ywgJkK5fnMpD++zftQdGpHHhNVJas7yoFF2PSBe0i8XwZcagWwfmIXH06m6UFzOEAlV0U559sSy65wAfXrbT1B5BGczKUsFr0HCY8+3SXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLlcgEJM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLlcgEJM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso11422735e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743757608; x=1744362408; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNN0dd0sba8DZbYpxdoTa0gXIaWxVL18lbiCGdG4AkU=;
        b=NLlcgEJM8aiyq5gOdqyzdedpr3UUE/zTmDZIwPmRSYBkY7vvjxV/jMQacvzntuSitz
         BkGZRVqizlFUqZ0P6pIY6eZj56t26JxeevyCrCuzBGDMq08aHrtkOEdn8/UvQy70Twu1
         GwSI98TTDyE2DROeKg2E0rvpTXbDfoiUWuc9Azh6GEHuRHT2rmL317lGVzd9Ud5ECIlV
         fVun2q6uPfA9voJ3CKAv3hKyIKpI7+a7eaCywY7lXKc5S0xdWaiwoko1xpVlvKl7VPHX
         BORso9atl314UEsWdkTX2HuF8U3OdNFmnH3w6pqEANEDQx8YMgq6xp1Z9OvJNGaQBIfR
         XsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757608; x=1744362408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNN0dd0sba8DZbYpxdoTa0gXIaWxVL18lbiCGdG4AkU=;
        b=BRyQFieollKV/jbJmVztiSZ7BTuCzofcD8G9i+UU3ZJAc5F7jpw0obNesXs5iyJLFP
         oxd1VhBulBT3hCElre5MqiFfHrRpBT2cKRYB6ZwMqqZ6QV80rubiil3eMhKBU2cW+v1T
         nu2mpzbT33cHHbyb/ovE8TaARxLkrKT76LE90bryC7K3zyzw73NiMkHOLT6fw07qkd0j
         oxdJUcKiF9E9TRvQuAvpwlpBbhqmrX6mydMC9zb89L2vnkECGA49Vkvd+BdEJQUvkAQL
         ES+JsBzmoSWwN5RQXI/dh/72X/pqdtPY5JFMis/XdXwc3wPO9jf3gbwG+P0JsRbGLv7W
         SeIA==
X-Forwarded-Encrypted: i=1; AJvYcCWQjgHREwdjqNSR9ycNz7Dq2liNHxERFYyZdA08S8gk6iDFOlKehXr6t8sU3FXJ6D1fCOH5+D6UeTDEGyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/ocTtJCJ3OQxvJk3XDl3J9GHxLm0MtdvtQVB/tl720Kl4e4K
	d5GfGqIw6XyfT024MLDXZ6lS1sA+DfsAe3w4/dSJrjjX1g6k5uIKWWDitukkcT0=
X-Gm-Gg: ASbGncvGDDE3jFLEp7Pb8PZYzhk7e3SYb7lMpCL2mFwj7rBGlblSuYM3appUXbjYo7J
	lb1ZrF/UTOvPqvGEQq9nMMuuIIwecEGgIx0SByBE54LMnBYxYj16G6h9fnTyTI5it4VqhPw+Q77
	85cuXPgTGaze46mMrO5l2N+T3BLtVpCfgHyZXREjAjxIg9JcUHFd8cdyfpjkuybi/TAlxdSoBzf
	Aavbg0RF3X99u0R24zHZAo81oKo7dHgN1zJ51PyOj6zhlgz3C9DhUpHpB8lWnKgFeKU6UKMHuDM
	r4PD0IXkCu53QCEqlNp6IITU6AAdfaItGfoe8H8iRASERKJ99g==
X-Google-Smtp-Source: AGHT+IEs4WAr/WvRqznAIBqenfGhWasugs8mzBZR/+3rbAiz8TrwlXeYTlnArjanLukZutn4NE/qlg==
X-Received: by 2002:a05:600c:4fc6:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-43ecf86ab8cmr16814825e9.9.1743757608406;
        Fri, 04 Apr 2025 02:06:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec342babfsm40758585e9.1.2025.04.04.02.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:06:47 -0700 (PDT)
Date: Fri, 4 Apr 2025 12:06:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, andy@kernel.org
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a
 value
Message-ID: <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
 <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>

On Fri, Apr 04, 2025 at 10:53:22AM +0300, Andy Shevchenko wrote:
> On Fri, Apr 4, 2025 at 3:03 AM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value that
> > has previously been NULL tested.
> >
> > Found by Coccinelle.
> 
> ...
> 
> > +                       psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> 
> > +                                       psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
> > +                                               (tx_seq + 1) & 0xfff;
> 
> > +                                       psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
> > +                                               (pattrib->seqnum + 1) % 4096;
> 
> Logically it's obvious that you need to align all cases to have
> consistent approach.
> Besides that the commit message should mention this change. Something like this
> "While at it, convert '& 0xfff' cases to use modulo operator and
> decimal number to make the upper limit visible and clear what the
> semantic of it is."

No, I'm sorry but that's really against the rules in drivers/staging.
Don't mix unrelated changes into a patch.  It needs to be done as a
separate patch if we're going to do that.

To be honest, I don't even want people fixing line length issues or
adding spaces.  I would have accepted small white space changes but I
prefered the v2 version of this patch.  Once you start changing
"& 0xfff" to "% 4096" that's not white space and it must be done
in a separate patch. I use a script to review white space patches
because I'm always nervous someone will slip something malicious
into 100+ lines of reformated code.  It's really fast to review
patches with my script but once people start mixing things in then
it's a headache for me.

Also if the change accidentally introduces a bug, I want it to be a
one liner change and not something hidden inside a giant reformat.

regards,
dan carpenter

