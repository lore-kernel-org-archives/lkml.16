Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7518427F727
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841346; cv=none; b=eA+zqn3nT6okYwGD8ec3Z04VG/hiT9Nw03ueptE0jH4Rfo4xhPTtnLgQEjNAeOoGqzJfAp+iOOkecH0JsQj8GEAzkBpRdNGCmF7UvMKVqK2RkkcBVYZwi0gQJnQxWvkDTPFRMl1l5sBem3jxejBVCmBEPdIU44zg+HYEv2scB90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841346; c=relaxed/simple;
	bh=B3qA9zwfpMRJL/FzUeX54kCiEnXCOJesL1S9ExwYFa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLLg3t/PA+DzAXz0XiLkTcdfjGbF0UBArMaKznttoZm4W8uJ2se5MUUGqiq+Ssch+KPUXQ/gacqp6IHw209qDuOTDfdRhSPpNAuSDO/AbadIFCwrhA3pXm7LU9i/zL87jbLEuK97+hixjVtr93SMC0DLvXvHQTpW7PFpZb3+BV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WypY8/il; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WypY8/il"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a52874d593so6038573f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750841343; x=1751446143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gzuTLj0h0BP8Faa4F4QGiLAR1aawV6atkUr8dq493UA=;
        b=WypY8/ilZvnr8XQXF+nHD3oXDtrp6abxHUbKbbDGFYiy9e4wa7F91Z4XN+gp0HNaNX
         LPJhOVWKMtlIECB85h9qI8a0G77qHZxcZHsBdmEK2i0y5EGwSA7U0Ig0qylO3dNRrqoL
         4BQhd9umPSKKtXYf+47L06M7TeNrjRzxheHz7qOXJcOwC1ZYnsXJoHVdW1tzbGw11xjN
         6kjVE+D9M67tJG/+lX2MNvW31rdg0Z4EuYpGW5e+wRf9j0CyfTmeRT9w+abcTFXD3QN3
         8rDRlSqT4YFVNP1MJ3OwSnyQsMNqtAlmtIb9C848zmb1mzmtnwznZ/IoLh7AkUDcmkRt
         QBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841343; x=1751446143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzuTLj0h0BP8Faa4F4QGiLAR1aawV6atkUr8dq493UA=;
        b=Yr791FSZSknYE33RPAeod2d9uTeHccfjDHL4PsroalF0kwV2AtRnQWeFRoYDWi93QP
         TYZOcOnKrFQmlxpIuiUG9SbLqy/Zy8wHp1PuiGxUPtIwdUbs/mS8BwLFJsQkbRhF5smn
         W2Bp2z1f+3fNLa9ID3PqSwg5+++UWXYKO+F7SWVf/Fmxe0D1TbwBUHjEhyiC7luAUk1d
         +6CTdCun75xGxPFqPZG15N5pREeK3a4WKQa0NWwFYyMCsjOD4ZpvTCTC59/DwYzHNEUV
         IeSwDXyEDdIT03pDXnwAsH3V7R36Eql4p/Y/Z/Rj4bC6uvfe68kAQJ2xOIhIdyD/nNlq
         6oTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE9G7gsecNUOHa/WPsiARvOTZetqYxRA8Pp34Fvq1AWLjyZipz1i/6EgNrMV69S3ZyTXZY3sBw4DSxx40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZB+02qcVI2SgPwZQfl8sAP7Z/QZvRVu85VOrwLet0FSM1pF5E
	6YO7Jh7R6dxppte9KUtdOQknerG4pPF6rXURvchEgkBvXsUqWxA9/q4QcRU8sFMiGys=
X-Gm-Gg: ASbGncvdadd8YPQvUHfIYwaR9xcMRB58HzAJy5lCZY+lpvQDtebUn5hxKiRbOtqJayU
	/i0ruvF2D4kHFM5+mYNOVa09C6wFoiXF+kig3zYJiy7hhzCtmDUXvpkqWoTyKOcAXW+A2Ayn022
	1Dh77nKNQPAYuM68KbZjGBD82y539HHe12yc8T+GylAvO/Kfi5HsPr3WWDNdVyYn+NnghCt86UO
	0rCsV/uvs+0TQWGxrHoL6ZPuffBfQCl7cS0CLsMwtwCnnboDBEEABXPTeVFvNdiUhsX94hwMsrX
	WUQ7h8345DVYR4FCLz+Ww3Y2VEMb/e+5wPWMAAQJe9QbA1Ym+KAB9C8FBOIfFY6+
X-Google-Smtp-Source: AGHT+IF1swuTytOZ/mOzx/aDJsTp0hYVrC347nQzODYODKZFAGNs/udBAXxCCv2VIRKBSD921Bw3yg==
X-Received: by 2002:a05:6000:4803:b0:3a6:d191:a835 with SMTP id ffacd0b85a97d-3a6ed646453mr1182080f8f.41.1750841342692;
        Wed, 25 Jun 2025 01:49:02 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83ea243sm132652565ad.72.2025.06.25.01.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:49:02 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:48:45 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org
Subject: Re: [PATCH 2/7] printk: Use consoles_suspended flag when
 suspending/resuming all consoles
Message-ID: <aFu37RyHZ4wYF-ZV@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-2-f427c743dda0@suse.com>
 <aExBo-8cVOy6GegR@pathway.suse.cz>
 <84y0tmiidg.fsf@jogness.linutronix.de>
 <aFpkQHwNCslbKSP6@pathway.suse.cz>
 <84wm919z9i.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84wm919z9i.fsf@jogness.linutronix.de>

On Tue 2025-06-24 13:10:25, John Ogness wrote:
> On 2025-06-24, Petr Mladek <pmladek@suse.com> wrote:
> >> > Variant C:
> >> > ==========
> >> >
> >> > Remove even @flags parameter from console_is_usable() and read both
> >> > values there directly.
> >> >
> >> > Many callers read @flags only because they call console_is_usable().
> >> > The change would simplify the code.
> >> >
> >> > But there are few exceptions:
> >> >
> >> >    2. Another exception is __pr_flush() where console_is_usable() is
> >> >       called twice with @use_atomic set "true" and "false".
> >> >
> >> >       We would want to read "con->flags" only once here. A solution
> >> >       would be to add a parameter to check both con->write_atomic
> >> >       and con->write_thread in a single call.
> >> 
> >> Or it could become a bitmask of printing types to check:
> >> 
> >> #define ATOMIC_PRINTING 0x1
> >> #define NONATOMIC_PRINTING 0x2
> >> 
> >> and then __pr_flush() looks like:
> >> 
> >> if (!console_is_usable(c, flags, ATOMIC_PRINTING|NONATOMIC_PRINTING)
> >
> > I like this. It will help even in all other cases when one mode is needed.
> > I mean that, for example:
> >
> >    console_is_usable(c, flags, ATOMIC_PRINTING)
> >
> > is more self-explaining than
> >
> >    console_is_usable(c, flags, true)
> 
> After I wrote that suggestion, I decided that the naming is not
> good. There is always confusion about what "atomic printing" means. For
> that reason the parameter was changed to "use_atomic". Basically we are
> specifying which callback to use and not the purpose. It is a bit tricky
> because legacy consoles do not have an atomic callback, i.e. the
> parameter only has meaning for nbcon consoles.
> 
> Perhaps these macros would be more suitable:
> 
> #define NBCON_USE_ATOMIC 0x1
> #define NBCON_USE_THREAD 0x2

I personally prefer this variant.

> or
> 
> #define NBCON_USE_WRITE_ATOMIC 0x1
> #define NBCON_USE_WRITE_THREAD 0x2

This one sounds more precise but it very long.

> or
> 
> #define NBCON_ATOMIC_CB 0x1
> #define NBCON_THREAD_CB 0x2
> 
> or
> 
> #define NBCON_ATOMIC_FUNC 0x1
> #define NBCON_THREAD_FUNC 0x2
> 
> Hopefully that gives Petr enough ideas that he can come up with good
> naming. ;-)

I thought about better names yesterday but I somehow did not have
inspiration ;-) Thanks for coming with the variants.

Best Regards,
Petr
