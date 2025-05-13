Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A221B3956;
	Tue, 13 May 2025 18:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161163; cv=none; b=WEnJRVBpP6pLSTtT1VRYPPLeXVANXEfXRfuYATCuFrIXJyDgDD154SW9IMhIH1WgH0FdcT8ZFoHkmrRV2hyIuDBZJhZX/G53LBXsqEyfbd+ukXOfB7k9/FZTo+Qpwdg6Ew2YZyL98dzi4WUhWOfD9R0I33GElf85X1XI19mC8J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161163; c=relaxed/simple;
	bh=PdE4BXzSIxxYV+ShgoxdrS6SnbAh1ZwSlgV7RDy8gpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjuaF/noStTpCpzWUlSzjga2WiuP5uUyX2BO+zPbd5eH7D7+1Re8W2hzS9cOvlszSfIg/m7Ieq9Rl7Dk61PZEW1mPe41tgko9AHXXFuPV4+1BT9fsoxwRq2dKZsgz8z5DIWdVg6JMevRoaH4HjDiEwEmi0E971Zu6gi8SEihzxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvWMFQMs; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvWMFQMs"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad212f4030aso862895666b.2;
        Tue, 13 May 2025 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747161160; x=1747765960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=akwSXElIlBzOR/I5jL7mv4gRrG5QX8k3BQY0kCFipgY=;
        b=UvWMFQMsYFboc9LjSX/80invQHmYSx4EGrH8dGfXJUy6i9TJTg4GmJ9zcae/R/dNVF
         R9PsPO9Hiqt1Ylhj3YeuuiuEwbS7Ne1/mfIghejn9Wsers+Lh34fmnPcZ2Hop/tYctkY
         7gfs4us7TbQpa67903tnsoTEcLr68OSMAnesqrqxSmifIBhIyMQRQf/1b9RtL5hTPa5O
         /WudgbSMU4aWYcYxHPxmtJuFhloTj+N8+Pay59Wt2mQ2/dG7fHx+To7cT2Oyd8XtKypv
         ac+rbRuCMTCTSJUaRUUZypGqJefTiJmDCxXeTYeN3uoMykTqUy4SdyV97LFZQBtYsJY+
         7+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161160; x=1747765960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akwSXElIlBzOR/I5jL7mv4gRrG5QX8k3BQY0kCFipgY=;
        b=OKS2VnNGGSp+JDSZkc4iUeCrszRdG1RaTznE7KT2Y+vmzhmvrSQeuC13TyAa7MWKtL
         a8qKV4IHBujuR+WvJE0ip6SoJLkV0nl4TlEl1ym24qkrX8W6icMfPIw16J6S4BaqEUJi
         ZWUg0tbbJdDDUq/nVURL9mAbttbLgjbtX0hnwGqPRfzgu5KZqFxQcRcvMR+Tem9Q0iYb
         XvtaC3LXRdgaD2GJPPd3s9DlOG0O2uAiE5poGtkBuI4mpSey31e2aRxT1Pg4Nj9MAdDz
         Tt7Ba8vFD8g1GymDKl9EF5iYbOO5xs3V/GhZWOcj+g5bi/uje8RgDW21ZQRlv7EXYOSa
         hRhA==
X-Forwarded-Encrypted: i=1; AJvYcCUCf2/ze0IbdKcmH3sBIjgwb09SCwdanCLg7IVf5NNlpUO2STteSGIorl0aAyvSuBTE+S5MbpEQb19N@vger.kernel.org, AJvYcCV+cuDntKNoz77Y1FYUQ5Ej8FdzKMX3wkQXDHZ8nG8uQelUY3PwwZS1KbYbO4ZZ3szPgSzJDNkcWFuj2TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySG3FOCPHr5iCW3SmE7Ppwn47OX4vokSo2LcoYsjeu+UuPT0Nv
	Katz+HNOqoEFLOHgAVfpdJexZrzUvJFM62lw8/J1XQkz8Q8o9Kk=
X-Gm-Gg: ASbGncs0rw+Q0oQcCaBAOIl95gjO6CmM2WiAS1shS3uNB5k9JqtZB2eHAr/HVxjlj9q
	ATkKGJ3ZR/VB54wyooEVdvMeSQXCgSHl0mpwptYF4sZm2560JVwsQQxHfhVxJk6P+Nuvu8hbP38
	ki0dpGhHRlO7whNnxfOjqEjGZICNoh387HH3+HqhaiaJlSgU1+rl2GKCNW2yuFUz1zaDY71zKOQ
	KnoAP3QfjQibviIGfre8YlCz9YJo6C+TgNuC6mqSH1rOK8qs4gypc4Cd/PgsGLCGvnHgxMgmHCu
	yIgeVhskCH2BIW3zdGwoD37k6fdQA2fhwCZ/gw==
X-Google-Smtp-Source: AGHT+IEFTPikhMg7ITYdt51I4WydcrqXrSNYl1Xo3s2U/g9Gd4xy0GQzSwWrxYhJsyObLBgEpKtZ8A==
X-Received: by 2002:a17:907:86a1:b0:ad2:4374:84a2 with SMTP id a640c23a62f3a-ad4f70f61eamr66956366b.6.1747161159554;
        Tue, 13 May 2025 11:32:39 -0700 (PDT)
Received: from p183 ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21937b329sm814376166b.78.2025.05.13.11.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:32:38 -0700 (PDT)
Date: Tue, 13 May 2025 21:32:37 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
Message-ID: <d5b360c6-1ef4-4344-9ad5-91ba5d962183@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <87frhcsrva.fsf@trenco.lwn.net>
 <77f03295-df5d-4bc0-9a61-5be829969662@p183>
 <2025051203-secluded-emphases-1c76@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025051203-secluded-emphases-1c76@gregkh>

On Mon, May 12, 2025 at 06:57:49PM +0200, Greg KH wrote:
> On Mon, May 12, 2025 at 07:08:53PM +0300, Alexey Dobriyan wrote:
> > On Sat, May 10, 2025 at 04:05:29AM -0600, Jonathan Corbet wrote:
> > > Alexey Dobriyan <adobriyan@gmail.com> writes:
> > > 
> > > > Every time I open Documentation/CodingStyle it says the party moved
> > > > somewhere else. :-(
> > > >
> > > > Of course, I forget where it moved to by the next time.
> > > >
> > > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > > > ---
> > > 
> > > No 0/9 cover letter?
> > 
> > Not really. Cover letter would be very short:
> > 
> > 	Tweak coding style to add things I've learned over the years of
> > 	Linux/C programming.
> > 
> > 	And stop making kernel devs look like aliens from another Universe
> > 	(see static_assert() rule and especially(!) "declare ALAP" rule)
> 
> Both of those are not valid reasons to change coding style, sorry.

Please read individual items.

I never liked cover letters because they don't get captured in
the commit messages so why bother.

> Again, learn about _why_ we have one,

> don't get bogged down in the details of _what_ it is.

CodingStyle is quite detailed at the moment.
Especially if some new details decreate bug rate a little.
