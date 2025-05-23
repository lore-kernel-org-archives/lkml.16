Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AC920F088
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748041017; cv=none; b=UJCjMOAyvu3021LHilwXXTbKrN0Wm4besmCXOEzzuQDeV4B2ERjpMKF2C5WQrGxkbGcotG/7kkJ4yXg/Zq0RNR54jZKeNmxzggmM1cvynOSW9kfxA2KVDuuySE2+ZDTpY5rnS0jNjNSPX4FSL1ARunbDSlXryl/7phWlujo4GFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748041017; c=relaxed/simple;
	bh=dntSCcQiLzCRhumjJj/CO4eZXWWAP+HHfr/0SBpYju0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5P02LKx154Up1amcoo2RaWiReTdMw28PS70XWlWdcS1NzP+YLJJ8H4vGfvGcd91xeYKQdTLRz5Obet83aaAXXGTWnwfuTTAhIxipl+8zZafQUI3GmCoKXTc6X9DJNThSIHV8NG4CDpQ5XbnRZHjlMsDuubM5mgVJoBTd2lmZDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JX+E/04f; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JX+E/04f"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-601968db16bso718637a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748041012; x=1748645812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhRe9Ol2fvQjWsyXrHmDNwPTO2nfCPdRJOsATdvROa4=;
        b=JX+E/04fEHhTx0yYdujdjt5SzDJxvORUR+ITbDGwOD88GzKL7xj1Xxcec6fbIl3RgQ
         RA7KArgCzK1F7P65XFRZrfffAC/eTW7MM4EUOUUpSfn6vmhCgbD//1s0zeUtbDc/YJpd
         inIpuR7ajt+tsThn/Fr4qNfM15ojPYtMcm06L21fgJHN6BHicTVIbBWIdo0BP/bCTRxd
         YbmovqjGpvyXOaiBEcoLxTJk0zVS5efPSEznOxadSFvuaJ3oOIXWy6dzZUfKNJs8wOvq
         +UTXuOvAu5Bc282PiQ1dn9+F8uCjqXSDtZ57F2yZYhpe2VIUOopy9jtZdOWqk/g9C6ru
         S6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748041012; x=1748645812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhRe9Ol2fvQjWsyXrHmDNwPTO2nfCPdRJOsATdvROa4=;
        b=trNRm4zhT1uor3VU0Iuv+a/8Xl4A4qpH1RMaYCHNSmlO196qCFjMwE6STYmkq5LTJi
         O2mlh+GZZzCa5i4xVRSQQBSmjRVA3v78Zg1xGtNSYRd3D4KOCvrzQwv174urNh2IGIqU
         nvTWw4g3uc75XswvesIFc+RGoWx7nQvjJGh2Mwmy+GWaz0VHLu6ndAkxKQ2LiwpmgIwl
         6RGNqW1gol743ZyYxv6oUG6Y43zLlhUdUUxsJBaqV4xAIeUKmA8MaiCtJVQJEdErM+RE
         Vfd0aR2JzcufzEL90Y9k3MlCdb6mGQaXnOSEQES2Y9pjvZ0Q9Kpd710/IjqGfKYdrQNf
         qYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiHszzvLSvPnuUFgHAPcI/5KHYyIZImTovqtj3fiP9KmVwNO7NJfDVULz59utpmWo0yDJThwlsWIpvoUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7dK2wOKLt8JkZQuxIu539DojisE+i0JtuZcOfzypPCQ8AbvkL
	cR5a69n7le0SU+jp5pjunYxtfh2p6eoPtSFgzgeJA8xSYe+P05jjn54iN7+usKVpSG66ZyjFNcm
	KC2EeBaBNIiwdZcR3e8lVVxUwuYbMw5zB0goaldNAaJnwaEpepo/aeVI=
X-Gm-Gg: ASbGnctm1DQGrDvKmcPYRq2mTbWDlAHglDwIhRZyG/SzfdZfHmuTRqIQbFp2P8Mty94
	06gcEgiL1VCOXpiNgDau8my78kYaScTLK+u6D4Kn3bvQ8iM+fiksb7PYg5mng62LIxDjcO2g0/e
	CMUa5PKw8D/lRkdOlo6bsGvE2/XGTXe3MxWIwg/LkJ
X-Google-Smtp-Source: AGHT+IF1oqxF84vSiDek+wWYXJgJTFh3bBC2O4MVq/PYB7ozhDL5yfg2J+dKsqh1ivdx69/cg1PUCYLwhGnkdKh0RM8=
X-Received: by 2002:a17:907:c26:b0:ac7:16ee:9112 with SMTP id
 a640c23a62f3a-ad85ae09b3fmr87016266b.0.1748041012455; Fri, 23 May 2025
 15:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
 <2f6201d1-4e18-43ab-aadd-27643d57dab6@infradead.org>
In-Reply-To: <2f6201d1-4e18-43ab-aadd-27643d57dab6@infradead.org>
From: Bill Wendling <morbo@google.com>
Date: Fri, 23 May 2025 15:56:36 -0700
X-Gm-Features: AX0GCFu4cXD2lDKj-K_F6rPvyyDIMrdsBz0CFHo0hkeu0M6YSBsNc1WSDxFl1as
Message-ID: <CAGG=3QXQkJ6n0J1gZcgxfEb68NWN2y200ZCuxxDtqPRgWPci=A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: check for a NULL pointer before access
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 5:16=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
> On 5/22/25 5:07 PM, Bill Wendling wrote:
> > The call to 'prop_get_symbol' may return NULL in some cases. The if-the=
n
> > statement accesses the returned value without checking if it's
> > non-NULL. After inlining, the compiler may treat the conditional as
> > 'undefined behavior', which the compiler may take the opportunity to do
> > whatever it wants with the UB path. This patch simply adds a check to
> > ensure that 'def_sym' is non-NULL to avoid this behavior.
> >
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  scripts/kconfig/symbol.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> > index d57f8cbba291..9c5068225328 100644
> > --- a/scripts/kconfig/symbol.c
> > +++ b/scripts/kconfig/symbol.c
> > @@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choi=
ce)
> >   if (prop->visible.tri =3D=3D no)
> >   continue;
> >   def_sym =3D prop_get_symbol(prop);
> > - if (def_sym->visible !=3D no)
> > + if (def_sym && def_sym->visible !=3D no)
> >   return def_sym;
> >   }
> >
>
> The patch is missing the source file's indentation.
> (spaces/tabs are lost)
>
Crud! My mailer borked. I sent v2 and it looks to have kept the whitespaces=
.

-bw
