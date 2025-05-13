Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AAB1A23AD;
	Tue, 13 May 2025 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161457; cv=none; b=jVnnNnzkmQcaymSUU/e5nV6TgQMjYL4tLAb7NJyUbPWXWn4YC/q7Ty38awwqSIMeS8+d/96758+hXWLU5VTi/RTEQ9sg1P8b+v7SC3HwdoKzToWlv9kHuHgHV9WSZNjEF0OCjuduSnKlYYO/Q4SJNLz26eVhHxa2WmEwlluBgXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161457; c=relaxed/simple;
	bh=AOMIXJ6sg6RkoZaOgzu0aWNysKuQo7Ln1sTD/WCWmpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpIpTRWroTf5S02DbrLheMoj946jhoG1CQggF3yHwQJR9z033QpEfIJZUKMRsTgK0wxAoDcZ6j2sQuV18eTNOUc7A4+Xxe+pN9vtvn3TzCWDXFx4x/OWF8LxhdA+y9F/w19aFe0xNVYO8DAFcnADXacITrd7GwtMcYhxpbD2UIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1IRZBCF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1IRZBCF"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso11048032a12.3;
        Tue, 13 May 2025 11:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747161453; x=1747766253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0SkrdnzhHsgGD2HspL2L7iQoMddChCO9cFvTBg9IxN4=;
        b=X1IRZBCF0P29YujwKSrjnNAFF7D5We42rgZOfWmILQYVQtN0hnht3wymRDh+ijEmUp
         w4rNzxixRHljZzdspau+E315nF2CFzCSDDarMt6Vu+18ZdGHIaW5Vrgt9EQHVlrI7WXb
         OE67PYvs2f2zAGaR2fQF8whsGnKtJjzqQrgcaVYaMKo/apy/HIS9GJENNMOYfu1sOiJD
         umXmflo9iucb/4xz/zQTM2PYVIKPhjeja4TrHOiw3r6uHV9baH4AdggsF1L5U89Ah5st
         izHi64nWxZGm8eSEfid7fVFKcIB4kOttYjGy8lE53AaLJ8CI3XiWroWzEcZGJ9I5DQeJ
         yytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161453; x=1747766253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SkrdnzhHsgGD2HspL2L7iQoMddChCO9cFvTBg9IxN4=;
        b=nNCsgLm4d7xidXogWfXcPUqiXYcTYT4MZ0a/kIhx0pL1rWwQqLNuoGM1YNK4YuSeD6
         QgM3QmvN7UHvIZmwjuDi3fEt5NbgqHS7R4C0aImpl3GOCz4a0g58D2jU8SWH55CErqdg
         zdrk1AXhv9DZliucU0VwZ5uUY8kLhj3QYx6txQEAtlcQ9AB80///cmZ1CZNYP1zqoec7
         I8/sjjA+HwCGp2wDVQ7kAp/kJz1VO7AsnQbqttHad2FwLc9Jv4LUEsACDN7+pRaD3q1p
         OHbv7QYHjxSOi6am9lrX+oRqtDus0G7nUaqjnGTIIYsrLdI5wYDxdwj0t8u9WF0EDAqW
         9G8g==
X-Forwarded-Encrypted: i=1; AJvYcCVhvZwadbdKE8qawMmfU3WY7HvKOdTMNfFvDMVjIRYr5VxsTVKyAi0oMVX6JfzIUJgawemN1bsUULy8@vger.kernel.org, AJvYcCX5FTDmm12BRp2T0e5+4zVaaNyRYyInOCtWNj7dXOaOgASnctgRW4zV8p/gPFfmN927ba4LogeBK6I4IEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySkhn6GyfOvtlVd5d+KE9HKYD/6TcQ80bmCXpUCWqyCIbjqoqm
	O19611Wo8BEPdQihtw4GEd6M9e0GXsWhLXHjqVTrLElL8gWS/q1BVR24
X-Gm-Gg: ASbGncuGUsTCGYyKMYNCVx3dj3ne6srjD2+7xh/al6jVT9hzO2AphjTyj35QZnUj3w4
	Bb3rJ3mvsHGwiQyKzGOHaykTQ5ZzW9f2n72MKSCNGnCpFWHWEENyRDR1UZ1zKTtdydNqkLzayGY
	I4GgfVUU2eH+1B+5NLBem32TMyEhj+0b/ni3LEZuHbmQX/7yaDugmeVIijQ+oZmnZ3iftIjk6KT
	KXIFC0qZgCHv0Ag+7d9mDlo1MPHILn5a7uhn90uG9uVvODXh3F+jajf0ducRqBHDvFRXSVcqmHb
	2BjyFKoahXy5vCUR93vbeEfPeFysp1QzM7BHQ1Rsrxpoich0
X-Google-Smtp-Source: AGHT+IFWjjoYqwpLRezhDI8g0Ya8/aMAwC96Ibj66AcEjYWU7XpNFgB0Q5w2c4AbN7v0tOlsQLqCrw==
X-Received: by 2002:a17:907:3d8c:b0:ad2:15c4:e251 with SMTP id a640c23a62f3a-ad4f7116e19mr66477166b.24.1747161453377;
        Tue, 13 May 2025 11:37:33 -0700 (PDT)
Received: from p183 ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad226f2466asm729401166b.143.2025.05.13.11.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:37:33 -0700 (PDT)
Date: Tue, 13 May 2025 21:37:31 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] CodingStyle: mention "typedef struct S {} S;" if
 typedef is used
Message-ID: <6513ce31-bb0f-4692-bc98-75232ce2ee70@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-4-adobriyan@gmail.com>
 <20250510124711.6b5d8b9a@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250510124711.6b5d8b9a@foz.lan>

On Sat, May 10, 2025 at 12:47:19PM +0200, Mauro Carvalho Chehab wrote:
> Em Fri,  9 May 2025 23:34:25 +0300
> Alexey Dobriyan <adobriyan@gmail.com> escreveu:
> 
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > ---
> >  Documentation/process/coding-style.rst | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> > index ac9c1dbe00b7..5c5902a0f897 100644
> > --- a/Documentation/process/coding-style.rst
> > +++ b/Documentation/process/coding-style.rst
> > @@ -443,6 +443,20 @@ EVER use a typedef unless you can clearly match one of those rules.
> >  In general, a pointer, or a struct that has elements that can reasonably
> >  be directly accessed should **never** be a typedef.
> >  
> > +If you must use ``typedef`` consider using identical names for both the type
> > +and its alias so that the type can be forward declared if necessary:
> 
> Better not, as symbols with duplicated names will generate a Sphinx warning (*). 
> 
> (*) It shouldn't, but there is a pending issue on Sphinx since version 3.1
>     still not addressed:
> 
> 	https://github.com/sphinx-doc/sphinx/pull/8313

OMG, so we are at mercy of static checkers _and_ documentation system? now

I've realised, changelog is bady worded:

Some people invent styles when typedef'ing struct/union:

	typedef struct xxx_s {} xxx;
	typedef struct _xxx {} xxx;

There is no reason to do that, just typedef to exact same name.
