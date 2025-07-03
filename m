Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE589176ADE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549655; cv=none; b=tVieoTN8+hlUT7214dwmMAROv5DWtu8vZb0PTLp7o9tO5Oo4Ikl7L2V33eG42p0KTKXusA3l/hDG0rfW6cUs0fn6aZWEWFl9aAh2Q95Bvx9miLywOQYunwZ29jYWkV6hkJqDJUsCd1R2Js9TkExbLJqUqwuNMLekRyJNWcmjSyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549655; c=relaxed/simple;
	bh=c1PJ1Un9oNgg0AOq+9JVmkeC3QT75Zi2xmOGMC16Joo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oR4sWMVmW86nFaILHVKHtLdEjKRkuGdeWoNo5KRY4qQYrUyi9t1Ka0EadrsK1veekuFnoBjpfFItnYYpYFNnxF16PFoj/MLi2KF7UAZS768IBuvUcyLJErLwhP5betXvWCKfL0JjRVfw0kI9KMrwqR+MEhyKJKWEVOtZpRkAjPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=DGRdDBvF; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="DGRdDBvF"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so1099931e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1751549650; x=1752154450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmo/fL676NN0as95wsShyLbjMiQpqOELVTFN9T31jG0=;
        b=DGRdDBvFRyQJUh4xBQJD4zRJTxtKWKqN2D/mFZ1EkOLAp73RwLxGJ67cctp8rHFv4C
         uy/cwd37L4dGMt43d86jQO8QnTLS9aoVrY0dePJyw9o6Y3r09I1JHvQCWrF1vkiBKN/p
         DNZZe1avldchksgz4GCGDSKQJCYrwEiiJrfM7XhaTBQP1A14WLUqIKPLNQAPz9lYioSM
         zvIfAOp6RMJMvTD7+A6DfYhjYF0udgSV++uFKJBtLDiG1zn2F3aK7Kk+RkNkVS5QPhQt
         UY8XIEjR6htlxua9Q903e2OVx2Rs3W2SykfCvQXDsfRjJoWADeonDBR4S2IhCnMDdZ56
         sIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549650; x=1752154450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmo/fL676NN0as95wsShyLbjMiQpqOELVTFN9T31jG0=;
        b=tdvl2CrQpfFkWaI36z/Ym6Gfk0i6kcH3lGFqhjhX8bQ8Nwg1zRJxVBEtqxL0d8DXtb
         xlVurcRMWMfiHZQxAWa6OMVKrZ03pITht4YnYOnZPqVn7tOQYvCSDe2jVKFY6UBtmxBD
         R1uZVGQUYuM/kVIxR4zITgYoE9/JHxZisRLdSx/kDZwG7CF8wayfwAWaWWG76wEjG4lW
         MAEdyJe2D6jIUxdZ82B8CB4iKZjv9tp1zb7TtOVQTK8oBhLRTyJPHNZrX9beYAjCzo2C
         4ZLs1IBVEFK+sUj84qsFkA35A+eFk0Q9l9C7n29rYh6oX7flf7dFPmE/kz7GeKZvvx/C
         8Vng==
X-Forwarded-Encrypted: i=1; AJvYcCUl7N/o6tN+dIrdnbgMbwgqxj59dSvVJH0bE/kijL6cSQi+JmJL7qn88NEy2+oaQXgsurUPMaCzO1XB9a0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9UTO0fEfFRX7l7VI8o+LaKmidPlsvfbDyMJ8+sA/7A0e4uq2u
	OBQJJZD0gNYbd2rLV7kH++8Rd/mNRbctvrnOfpow/nwqaHZvLw60jZbQL7yPFwR0mGixAJ26whr
	kUm9pAHsVT11Lcwi+autBj34/V2X8H58UnALjVOFDOg==
X-Gm-Gg: ASbGncua8LNK0fAhRq+tb7SStujylC0/mnsY1/NdaInwTCMKq1xv+sHPztYYdll7DcY
	eghoX94MaUfRDg1ushjtyYOFbtVFYnyAPoORpP70Yyv2ROBbD3CN/U2zwoHSkTsHA7FKSbaoC0Q
	qv22cOHlHot0OFrGEojO7H0g0q34qRW+7359LTtWHcD9ZicEdfXqeEIGNBhFAGiA==
X-Google-Smtp-Source: AGHT+IHNv43yQ0XMxXTp2ef+SSEuzoS8acT42g8yBYYlV1yP4CPRR+Oir1K05oVETjo++6ub9AQKMpxraY8UgbEsyWU=
X-Received: by 2002:a05:6512:e92:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-556309cd03fmr914034e87.9.1751549649417; Thu, 03 Jul 2025
 06:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630133934.766646-1-gubowen5@huawei.com> <aGaCTOJ30KNPOBIC@zx2c4.com>
 <aGaFsaUOuNd1xs8m@zx2c4.com>
In-Reply-To: <aGaFsaUOuNd1xs8m@zx2c4.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Thu, 3 Jul 2025 15:33:57 +0200
X-Gm-Features: Ac12FXx7Ayr31pcyKig9jqDUM_fXmneqv04K2EzIf0SOYCgCBbMMEX50kGxvYN0
Message-ID: <CALrw=nG8KaoWTvwvnhyqogMXv7+dre6_hMCZBkegFmktefNw8A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Gu Bowen <gubowen5@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lukas Wunner <lukas@wunner.de>, "David S . Miller" <davem@davemloft.net>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Biggers <ebiggers@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Lu Jialin <lujialin4@huawei.com>, 
	GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 3:29=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com>=
 wrote:
>
> On Thu, Jul 03, 2025 at 03:14:52PM +0200, Jason A. Donenfeld wrote:
> > Hi,
> >
> > On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> > > To reintroduce the sm2 algorithm, the patch set did the following:
> > >  - Reintroduce the mpi library based on libgcrypt.
> > >  - Reintroduce ec implementation to MPI library.
> > >  - Rework sm2 algorithm.
> > >  - Support verification of X.509 certificates.
> > >
> > > Gu Bowen (4):
> > >   Revert "Revert "lib/mpi: Extend the MPI library""
> > >   Revert "Revert "lib/mpi: Introduce ec implementation to MPI library=
""
> > >   crypto/sm2: Rework sm2 alg with sig_alg backend
> > >   crypto/sm2: support SM2-with-SM3 verification of X.509 certificates
> >
> > I am less than enthusiastic about this. Firstly, I'm kind of biased
> > against the whole "national flag algorithms" thing. But I don't know ho=
w
> > much weight that argument will have here. More importantly, however,
> > implementing this atop MPI sounds very bad. The more MPI we can get rid
> > of, the better.
> >
> > Is MPI constant time? Usually the good way to implement EC algorithms
> > like this is to very carefully work out constant time (and fast!) field
> > arithmetic routines, verify their correctness, and then implement your
> > ECC atop that. At this point, there's *lots* of work out there on doing
> > fast verified ECC and a bunch of different frameworks for producing goo=
d
> > implementations. There are also other implementations out there you
> > could look at that people have presumably studied a lot. This is old
> > news. (In 3 minutes of scrolling around, I noticed that
> > count_leading_zeros() on a value is used as a loop index, for example.
> > Maybe fine, maybe not, I dunno; this stuff requires analysis.)
> >
> > On the other hand, maybe you don't care because you only implement
> > verification, not signing, so all info is public? If so, the fact that
> > you don't care about CT should probably be made pretty visible. But
> > either way, you should still be concerned with having an actually good =
&
> > correct implementation of which you feel strongly about the correctness=
.
> >
> > Secondly, the MPI stuff you're proposing here adds a 25519 and 448
> > implementation, and support for weierstrauss, montgomery, and edwards,
> > and... surely you don't need all of this for SM-2. Why add all this
> > unused code? Presumably because you don't really understand or "own" al=
l
> > of the code that you're proposing to add. And that gives me a lot of
> > hesitation, because somebody is going to have to maintain this, and if
> > the person sending patches with it isn't fully on top of it, we're not
> > off to a good start.
> >
> > Lastly, just to nip in the bud the argument, "but weierstrauss is all
> > the same, so why not just have one library to do all possible
> > weierstrauss curves?" -- the fact that this series reintroduces the
> > removed "generic EC library" indicates there's actually not another use=
r
> > of it, even before we get into questions of whether it's a good idea.
>
> I went looking for reference implementations and came across this
> "GmSSL" project and located:
>
> https://github.com/guanzhi/GmSSL/blob/master/src/sm2_sign.c#L271
> which uses some routines from
> https://github.com/guanzhi/GmSSL/blob/master/src/sm2_z256.c
>
> I have no idea what the deal actually is here -- is this any good? has
> anybody looked at it? is it a random github? -- but it certainly
> _resembles_ something more comfortable than the MPI code. Who knows, it
> could be terrible, but you get the idea.

One thing to keep in mind with this project (and other projects) is
license compatibility with GPLv2 (I don't think the above project is
compatible)

>
> Jason
