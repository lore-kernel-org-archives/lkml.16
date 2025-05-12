Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FBB1DE8B6;
	Mon, 12 May 2025 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066829; cv=none; b=OVc30VISLRMcssN/s+HZiWBC7lKQulNHD3Ybz0Q1abmPP1dwFTCm04eEFpJikuP9D+KXYhYUJ6WP6HOGlU7DJVV4BBpWzwNl4sXxHczEWjjPMgRZNpzq7BzkOzguSbldctwRMcWnJPM4iZ3il+t9FQ/saWhiitOuhPIiw9ySesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066829; c=relaxed/simple;
	bh=HJwhokHd0VhygHfftO8z2+m9NXTsP5Icq6jlDn+5Mdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OK98Sun+zeTVQOEb/o0nMSZlzHc425QJPDCvRJj+VgUCecxAFr6p191zKfLJYUbyba/okAbh/sDRQD1HupLp/mMl6SUl/UyiQohYlJ0wWujewPVlKHVImRY1BfrMh6foVVa9+DZ/RUyCDOERLG7JZJnTqWYB+zzwiiIYLGygaBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFBJV6JB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFBJV6JB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fc3f0a5506so1107316a12.0;
        Mon, 12 May 2025 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747066825; x=1747671625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7oJNkUQRKjMJnFWIbreE56lOFKclkxKh8SbQPkPiWu0=;
        b=TFBJV6JB/jF5RBWjGXs2GaiAt+TnP9BG0n6a/A3UtRk01GMnK5/xqld3udNkSSaWp1
         k10cukYv7v4DfKRcxSrIPghpn+lo8dSEDvJy9ZXrXQ2X+VLR/fw95/umaEVfqsVKIEtL
         6kSSi5ZNXuGsfAutAvl0waxf0RD7gavwGf4e64OTpOHA9yjtqnhlhr/RgCyZbIIFWtOH
         jTJ/B27/r4FmPT99/soww7WhLOizz38Ycuyz1tsZFQLl/4S1wev4S5iNy5ZN73mKS7oM
         3nGahMEwNZIA2LX6Xv3T7zgKcU5HyGmcuem+uyJsBrA/igv1OJ9HpcungJ3uHUTXzb5e
         4IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066825; x=1747671625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oJNkUQRKjMJnFWIbreE56lOFKclkxKh8SbQPkPiWu0=;
        b=uaGLmdXhkR1yn+16qddgOGRqkq2B6IL1epfmQ53EW9mwQZeB5TwG5cOsxZtKNmBeR3
         dNVIGObTrLdoKAbISJfvs+o5IgwWXUdAsln2fdCF42uHr+XYfB46VlG4/NF7uaPvamdX
         P1PYcEGOzkP5JqUV50nCrwUAo3t8UokUVl27dE8QFchVryr5baFVXJhQ66QnY9tQGV/k
         rTyfoZNdaeEfYuaMp4h+Cq6bue3bs25LMMbctiwSlKvEhkCil8vgi4nWRHGrPCPuFQHR
         +ukj34hjRT7AeesoKH/y5LAjrbvwGYGbAPwT/19INKw+UWIAyMxxUALGvrN0WYmTx3pX
         isyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUKCL0HRE0ggs4bsd0m56X3g6xCIW250Kf8CEcIR5HGnYe0uA8olt05gBWLI5xC9CT61jnRyeYNOi4@vger.kernel.org, AJvYcCVZcUdNw1+cJ2/mq5fSPmSYXyEjVw4Pf7UwDqY5Bt/0p//hzEHlDVHdQDL4yEsN/t44jiCCpG4LeGuWe7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYLJ2VKSA1YqEN92KwGN5yH2CKe6ShNZaFW+TCabo1m4tYtQ+0
	ixSd7azuNXdoiDYan/vmABgJNH2r8NCbau6MVg0D+9vAIJGQkwQ=
X-Gm-Gg: ASbGncsQJb9R5dQHmUiANkom5i8wN3kfGwC9qaKhbv7/J1BqCItlr/muWRwyff9eO9c
	nS6FIqIjzlQKEwjaQm8xhhkIaQ/MoQGDLWf27y8Lyfi98VSQGRxtO3T31atP6RuEkSRdCSwVl0I
	nulPAtA44C2XQI9MX9Y1oL/j+K54aBC6rbQOkpr9sLFIUMXHU7KtQAdqkiWURpAlxPJBXJz8I5e
	ij0cYvZM151FTzx8UlBNbiML37CGGncfwwqHJELzX3kwdhlsPres8wmpUq5LBBxlq4/VJo+dSos
	CTljIWAK4aJNW6DfZFveyekAhxIWNw7MnTc/ggCRuIrQgvs=
X-Google-Smtp-Source: AGHT+IGNAiVhtZCSq8Y4yavBec7sPQRqXmCEGuPnaWTD6aqLp7n88bmlOR0t1DA7yYBA2bY9387u4A==
X-Received: by 2002:a17:907:7e93:b0:ad4:5346:2fec with SMTP id a640c23a62f3a-ad453463067mr236081666b.61.1747066825005;
        Mon, 12 May 2025 09:20:25 -0700 (PDT)
Received: from p183 ([46.53.249.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21988cb0asm638585966b.179.2025.05.12.09.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:20:24 -0700 (PDT)
Date: Mon, 12 May 2025 19:20:23 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] CodingStyle: tell people how to split long "for"
 loops
Message-ID: <cefe24b6-c1a1-4fe4-826d-e08a856aa8e0@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-8-adobriyan@gmail.com>
 <20250510195603.37279af3@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250510195603.37279af3@pumpkin>

On Sat, May 10, 2025 at 07:56:03PM +0100, David Laight wrote:
> On Fri,  9 May 2025 23:34:29 +0300
> Alexey Dobriyan <adobriyan@gmail.com> wrote:
> 
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > ---
> >  Documentation/process/coding-style.rst | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> > index e17de69845ff..494ab3201112 100644
> > --- a/Documentation/process/coding-style.rst
> > +++ b/Documentation/process/coding-style.rst
> > @@ -183,7 +183,21 @@ Descendants are always substantially shorter than the parent and
> >  are placed substantially to the right.  A very commonly used style
> >  is to align descendants to a function open parenthesis.
> >  
> > -These same rules are applied to function headers with a long argument list.
> > +These same rules are applied to function prototypes with a long argument list.
> > +
> > +Very long ``for`` loops are split at the ``;`` characters making it easier
> > +to see which code goes to which clause:
> > +
> > +.. code-block:: c
> > +
> > +	for (int i = 0;
> > +	     i < N;
> > +	     i += 1)
> > +	{
> > +	}
> > +
> > +Opening curly is placed on a separate line then to make it easier to tell
> > +loop body from iteration clause.
> 
> Is that actually the style - I don't remember seeing it.

Check include/linux/list.h.

The point here is that it is either 1 line or 3 (not 2).
If you start splitting for loop there are 2 obvious points to do so.

> The location of the { isn't a significant problem with for (;;), it can be
> much worse elsewhere.
> In reality the 'align with the (' is what causes the problems, either
> double indenting (two tabs) or half indent (4 spaces - to annoy anyone who
> sets an editor to 4 space tabs) is more readable.
> 
> For for (;;) loops I'll normally try moving the initialisation outside the
> loop

That's slightly bad -- variables could leak outside.

> and even put an inverted condition inside the loop to avoid long lines.

> If a #define all bets are off :-)

It applies even more inside #define: #define shits everything by 1 indent usually
so more chance of split line,
it is harder tom see semicolons because macro body is usually colored in
1 color not the normal way.

Do you like how xas_for_each() look like?
"for" macros in include/linux/list.h look mostly OK.
