Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1F929712B;
	Mon, 12 May 2025 19:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076971; cv=none; b=igJgwBTvj49xY6gxAsqkXAW+KfwsCnEGdaC6lz1x2CVmgjOL2aCHZeI1bbmovImi8bxyqCjwkZZyBXP1xGr9NlKbZHSDtodBUr8W4tu8QLDEZwYIqJOBbrECbxZMgfsfPZwP5kInpuhDFCz7fkh7JIQbTntVAtZabUEeK28+c00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076971; c=relaxed/simple;
	bh=kS4EiEYQtpB4pncLyzyagF50S4NaO1jIJavYy0QuVgA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ama2h0KFEi20o+4sShoSll0MSqVALuB+PAIviOGf8BttpUZx+fRUCVfqWb+d0jzLabZyS9syKZAgjXvD7GKNtqa7PTEvlzfT04cPhIawOYsKqLaKaMBT0WHcmkrJhSC0KoIXRWiTQOKhreefj/QXPzezcI4mIp591krkGot6J6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQDp5vjj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQDp5vjj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441ab63a415so49188765e9.3;
        Mon, 12 May 2025 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747076968; x=1747681768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y+ZyUxqyekzIAsZAz8uROf/miqSCLrRGK87eoHnHJE=;
        b=YQDp5vjjss7eOF0Q9HkCagW4NvOJRpbKzbywWCGX5R0PGExShvD4p7yqMX7HX+3OqX
         x4xsGNt6Rqmt9wTfFxRTR2mtYs3B5XSL58SudN1ZGfARggKnQ1KHWbP6Qd/UuzjebmoC
         2cF5qw8qHCdjngeYkryS+X4O9wkuuaNIjRD+M66KfNxYEE0QSDIgudCiShM7ta+K8JA4
         fk1La3vStxTcPeL6R0XEsFJF27gfKWpI+cEkkPdHidQweMFtKAIFQ0JjlJam7GnOZDMf
         yuEBGLHARoO5t0z4vCtq4WtJY232rvLJdUuXaJRNfZaUcsMIidWXrD7Dlyz9Yh6l0exj
         D6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747076968; x=1747681768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y+ZyUxqyekzIAsZAz8uROf/miqSCLrRGK87eoHnHJE=;
        b=AiDBJ1icbE+ZyC11YE2L37M4lp27LVJjTamxga9aWaZDNezNecVXYVqwIlInltrHG7
         icr/8biTfnLyB86uSnRyhj7Hkrcck8gdm0XAcvGmbdW21o+d8LkgF//l2y+HRJZ1qK7v
         NqTNrUd4G44mlmiYjqOAeQCJ8SyT7B9YL2RtKcc+YHOmJ8TKkwSoMN5VCf8HDD2vcNXU
         Ax6drfplrvHcfIsYMddh07XiuVx+8VOaeaRjronWHKaas5Ftcuwn2ZwC9HKvn3yhNbol
         NMUb29scUDXV7mlqR2xkamg/vSKh9zo7zJpb6ggwkGg1QHWdTfZqmTlFddtVHZhp0jrR
         HrJg==
X-Forwarded-Encrypted: i=1; AJvYcCX2flo5tAAhamYk2LzinDZJftJhRuPCmUAohD7e64ZqtK0dC+63UiZCKAYq7IXYsB7iuwJiOIxs0QSk@vger.kernel.org, AJvYcCXpdg0pIsJ6iTYYiKyFygdS9Evkoxsry+dYbM5fGIcj3UB/eQfybPKEDdpR5H4DrCi5vlwvVaNCNXZdlos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3EsKfr9jEyDeF6keVQKRnYb7xVKhQd6YkMUv3dXMxaaQGK7uv
	e0GPMjvPzWJ0AA87aJ1Cg4NyFjb4KnFQKBsTyMWGg2CTEphQcDSzaBZx6A==
X-Gm-Gg: ASbGncsC27NT46gD4mddA3rm2TCVoHuW2NZ25TBCyBl492chdz8vQiLit7FGwJqJKX2
	Ij6esCvC1QfhV73Od2cvr62wGdqV85PlFNRA2MBVy8lqnz7xAvqnyrtdesdNBZETPPAVf1i78c7
	33LsgBVJUlAucSKl2mP5vf/fDk93809zJabIPQXFUu7GGV8BOKfg1jbPzD0FF491DDZ9yYIccvl
	3Nao2dgceoz/Y+n6kTpifAxCZDKWGyJ4Cm2AVL6SO6sOWMbDmndxHsqSgW+mvl9Wun1qndgO45V
	oRHdPmyU0amWhuQhAQjm2g4fn2NPf27GgZLCQL5048wm1/Vj7wlloUWc8cngwuoSzGU08VmrnTx
	weUwYR3AiW5W5wA==
X-Google-Smtp-Source: AGHT+IHEIm18FtPPp9iYppR3J86vrDdfNF2seQD1cayS7gUciFizs9uEv0jY3qdjem7sXz23Z6IbWQ==
X-Received: by 2002:a05:600c:37c7:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-442d6d379b2mr136024165e9.14.1747076967380;
        Mon, 12 May 2025 12:09:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7f18sm185136545e9.40.2025.05.12.12.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 12:09:27 -0700 (PDT)
Date: Mon, 12 May 2025 20:09:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] CodingStyle: tell people how to split long "for"
 loops
Message-ID: <20250512200920.0849462d@pumpkin>
In-Reply-To: <cefe24b6-c1a1-4fe4-826d-e08a856aa8e0@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
	<20250509203430.3448-8-adobriyan@gmail.com>
	<20250510195603.37279af3@pumpkin>
	<cefe24b6-c1a1-4fe4-826d-e08a856aa8e0@p183>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 May 2025 19:20:23 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> On Sat, May 10, 2025 at 07:56:03PM +0100, David Laight wrote:
> > On Fri,  9 May 2025 23:34:29 +0300
> > Alexey Dobriyan <adobriyan@gmail.com> wrote:
> >   
> > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > > ---
> > >  Documentation/process/coding-style.rst | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> > > index e17de69845ff..494ab3201112 100644
> > > --- a/Documentation/process/coding-style.rst
> > > +++ b/Documentation/process/coding-style.rst
> > > @@ -183,7 +183,21 @@ Descendants are always substantially shorter than the parent and
> > >  are placed substantially to the right.  A very commonly used style
> > >  is to align descendants to a function open parenthesis.
> > >  
> > > -These same rules are applied to function headers with a long argument list.
> > > +These same rules are applied to function prototypes with a long argument list.
> > > +
> > > +Very long ``for`` loops are split at the ``;`` characters making it easier
> > > +to see which code goes to which clause:
> > > +
> > > +.. code-block:: c
> > > +
> > > +	for (int i = 0;
> > > +	     i < N;
> > > +	     i += 1)
> > > +	{
> > > +	}
> > > +
> > > +Opening curly is placed on a separate line then to make it easier to tell
> > > +loop body from iteration clause.  
> > 
> > Is that actually the style - I don't remember seeing it.  
> 
> Check include/linux/list.h.
> 
> The point here is that it is either 1 line or 3 (not 2).
> If you start splitting for loop there are 2 obvious points to do so.

Yes, and there is absolutely no reason to always use both of them.
You do want to split at 'low priority' operators rather than just at
80 columns - but that is always true.

	David
 

	David

