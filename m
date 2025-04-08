Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F026B972
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116824; cv=none; b=iEWP6iTtIAgCW72oMOzNFFyuzFY88e3wMIWesA24rnFYr4tQNuHk37KH8sCg9mqSqKSH7PXh8oacoJ+9qUFUdTCqfrqdI5LxLVCWhvo3QMa8HY7w90Sea3KRxaCkOirEmLv7Q/+qJjspdhVbLkbv/+mYc+PQrVIRrTg9T+poIZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116824; c=relaxed/simple;
	bh=eDQnZvYqzPIHj3GXOYZ62c9kispFDw2UFftF8wYsUPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ld1dT54uYJsNWwaGeA8OdNn1JiZsdd2/BtQGzun5prCo9oR/gYYyEIHDeLOW4ZiNyV5B5imYKlN6qJ9psYJBIRCHlnwHNV3lDBLf6mTJnjA1MkIwfhgDRBbUuqt5gHDm3FnhiOX6IgIl+4Qvq+cdUliWjRUz+pbhTbpjnqDGEN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbaqzDZM; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbaqzDZM"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5240317b3e0so2010706e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744116822; x=1744721622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIq/yQ5RheCuvsfWtElAvvAAikClpQGQxOw/BQ1qNWc=;
        b=ZbaqzDZM2ljUI/oap1s8vjtWiQGNSocWXhXUyMKoCJ/ZLK1JCxohT8X9xsgj/4hoAA
         5VaPlIfpavxnIRkKbx2NK+23gh3t7s1LE7I4zJuJeQT7IjdGZqqvsu1s6tis40UlL5cN
         uOBIvLyuZvk3GG+IOw2GO0hBdAoc+yMBAsR4WrhWutEzciBIVOwm/84S9HqopYkb1xvJ
         oU5LH3m5Q3ZJHUodLEMM8PremezAXY1WYcWaML9hhAF8FEFMcaSAHdPrNskdeCY6NK2V
         QFt1HTLMTGdIfQVA0G5FNJlq5T7HiAtMeXFBS3co9s5yK2dHyVKhOM1gr+THT3ta3G0B
         xJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116822; x=1744721622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIq/yQ5RheCuvsfWtElAvvAAikClpQGQxOw/BQ1qNWc=;
        b=GO1wwBTC6/N33e84GJPxCd8up9aZ4w9nLSvtEeRp9sGe5iczxZLkQdGC+UqOsg+Rw9
         uj8Es17mbFg4tpQSJGGbP4WSBBx2GHWkKoSfvn+TQiojn8qJyTZJidqAa9TQYl0kAYe7
         oWNT5/xrh9K1ZDTpTG5RsqaByDJrnSi7iBV7Z15wwpNsft6Lbom1uNv6Vk5ZZI9QBfcz
         v141GxgMfowG2tjlKpDozthOHgAaQ4a5T0aEB6mLvuh6OS1o8nehaIMYXx0vWLZvwYq6
         wqpLso59hrjHRzYHT8E4ERVIob2cd0hgfQgZgh0DTv8cvi/Mmf59u0j499MNweeRphBQ
         UioA==
X-Forwarded-Encrypted: i=1; AJvYcCXlgiKCSyJGn5kMB3vlpO6AFg/8B9DWEwS0D22u/DlVyEerqOdTCNGZw9VyLvh380KOUi0CJN79LArZ6zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzghD5UglFQB8bp/zltbMRDMj2HKdP02Q7N3WAtIZT+uPXBo7O8
	gWRs8H1gSpqspKXH4IX9XPQZ4J2pGOJSjAWdwFegwkGBM8NRdbWevT7jrRA3FFzYCVrzG8JwFDt
	lkc5sLCRKBagXA3ZpZbWT1N7loxY=
X-Gm-Gg: ASbGncuebdCSpwX57D0ru9yjW9c3wKVgUS3rrnYfAQiYsaoveNtnUQhzN2CeKnc6pgy
	sSDt5r630ro5vJCcvC2xoZxbR+/s+wvUNJ+e1gj4Mq79puUnbvy+5awCf5BAJqw17RxETnnSHGC
	dvZdXPuBQLJ2iRdNQN2LWaaQjz/w==
X-Google-Smtp-Source: AGHT+IEHB/H9Zx51XBa+bNpK+8kfLf3aYgLj0AMK8itP336eyoFF/iW7S/dMcwS8QaJoGoxnRarogoVf8Q8WSArFHZw=
X-Received: by 2002:a05:6122:2016:b0:520:6773:e5bf with SMTP id
 71dfb90a1353d-52765c22e36mr9606626e0c.1.1744116821855; Tue, 08 Apr 2025
 05:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
 <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
 <Z_TtyXwkOBK1MXGy@smile.fi.intel.com> <b89c8837-4aa1-4073-bb09-f71f37b5dcc6@stanley.mountain>
 <CADYq+fZ-LmoyGrAFsEHBwM2WJthpqGYhPLmAJ3Ea0B=NvmC8aw@mail.gmail.com> <7bcdd745-539a-436a-a0df-bb2cd8dc7340@stanley.mountain>
In-Reply-To: <7bcdd745-539a-436a-a0df-bb2cd8dc7340@stanley.mountain>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 13:53:33 +0100
X-Gm-Features: ATxdqUE_dphc2k6uzLw_C1GT06QIbYUlHzPUkh4Z-A6lb5uA7H9AiEW5_qnOICo
Message-ID: <CADYq+fas148z7WFMVk1_0bj4EmaWSV4_mE3sDr1VfTdFfts2-Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around binary operators
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, outreachy@lists.linux.dev, 
	gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 1:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Tue, Apr 08, 2025 at 12:51:03PM +0100, Samuel Abraham wrote:
> > On Tue, Apr 8, 2025 at 11:36=E2=80=AFAM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > >
> > > On Tue, Apr 08, 2025 at 12:35:05PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Apr 08, 2025 at 10:22:44AM +0100, Samuel Abraham wrote:
> > > > > On Tue, Apr 8, 2025 at 8:20=E2=80=AFAM Andy Shevchenko
> > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
> > > > > > <abrahamadekunle50@gmail.com> wrote:
> > > >
> > > > ...
> > > >
> > > > > > > -                                               psta->BA_star=
ting_seqctrl[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > > > > > > +                                               psta->BA_star=
ting_seqctrl[pattrib->priority & 0x0f] =3D (tx_seq + 1) & 0xfff;
> > > > > >
> > > > > > > -                                               psta->BA_star=
ting_seqctrl[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> > > > > > > +                                               psta->BA_star=
ting_seqctrl[pattrib->priority & 0x0f] =3D (pattrib->seqnum + 1) & 0xfff;
> > > > > >
> > > > > > You mentioned Linux coding style, which also requires lines not=
 to be
> > > > > > so long. These lines are. That's why a few versions ago I sugge=
sted
> > > > > > you to change these to be two lines each. I don't know how many=
 times
> > > > > > to repeat this (it's third one).
> > > > >
> > > > > Okay, sorry
> > > > > I will add a third patch for a line break before the patch for %
> > > > > operations since each patch should handle a single thing.
> > > >
> > > > I am not sure you need a third patch for that. It lies into categor=
y of space
> > > > and indentation fix.
> > > >
> > >
> > > Yeah.  Let's not go crazy.  Do the white space change as one patch.  =
The
> > > rules are there to make reviewing easier.  Splitting it up into three
> > > patches doesn't help anyone.
> >
> > Okay thank you Dan. I have collapsed the spaces and linebreaks into one=
 patch
> >
> > >
> > > In staging we say, "Fix one type of checkpatch warning at a time."
> > > That's because it's a simple rule to explain and it stops people from
> > > sending us huge patches that fix every checkpatch warning.  But this
> > > patch is small and everything is related and it's easy to review.
> > >
> > Thank you very much for the clarity. I understand now.
> >
> > I already asked Andy, but I would also like to seek your opinion on
> > how I should version
> > the next patch. I already made this current one v6. Do I send v7 with
> > changes in the cover letter,
>
> Yes.
>
> > or changes in the individual patches?
>
> Both?  Put yourself in Greg's shoes and do whatever is easiest for
> Greg.

Thank you very much, Dan.

Adekunle.
