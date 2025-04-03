Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A984478F4A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672841; cv=none; b=pGtqJZpECPxOFsD9pkQawXN2iYTRaeAdPKbWpR1f0DYn/eLm6sAHqlzMd0jH0tumecFQIkPFSwVQh10+zK+0ULeYDsTmiyOAeyo3b25/URTLiihrMtfTap5ISs7YEPVJkKNLedLPGiFBZ91lRzTT8MECwIM8iezmU4DlQuneLZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672841; c=relaxed/simple;
	bh=b3qLvJ7aKUXqqTaHHPmb6zuSn6dJEibuG/A+uCPCHrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2Ks4XLA9WplWsV0rf1Cw2WbKwppVTZ4T4jYOZVmTDwuf3i6on/JZbtZqbjGbxzRMZvakUaLm/f3AUKP08XMDYPRQrhl4IYZjwnXPxJcu9AbtHKnaTTPx+VWK5irs3n4Ubq+G6WaSVZZ0yJZX6vm+C+cSoB5buybkrdWnOsWe94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7gF2/wz; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7gF2/wz"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-52403e39a23so620307e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743672838; x=1744277638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyHNwKmWPYx/oZJ6Nfv44olqkcbVDVp9NWhhY5rFfyY=;
        b=N7gF2/wzH2Z9yHH7JVYMXwFLxYeFlRvkX1pALStiilxfPNdgsclSQJ+p3UuFQZhBpX
         kXSkVTwDWpukrgBXyuHOuaIeX5WHVe1h+X59bXuliQltwd7DT31EN87fzM4UPO4PxjG9
         1dXptGHrTIZ8RcHLEi26r4tcFT/zIRXgU8ai4XwtBmK9uMgw8YtYc8Xuxu55aGAbTVFF
         UJn9RNlCVnIb5ZC6V1S6QI9g8UN2/4Ju8f5mVZiFycIs/G/R9HV9cPfdXWcFPlZEIcO9
         QqytOG8onxx5cvgCpDxS0fU7+aOZwFEUeWz4JcKlKNfH6QWEXQFuHYHjvRsnIbvX9p9a
         cQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672838; x=1744277638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyHNwKmWPYx/oZJ6Nfv44olqkcbVDVp9NWhhY5rFfyY=;
        b=mfDiEC8AbmgdaUy3EA71grQQw3zgukoxvyJZVlqDAev8y1mI6VORIWroCU/hC+sTFc
         eJfmRtu094a7WouAPUh24GmEh39bLtYuiejlfd94FsHpaouMFCdD+yb2TiPUW9Tmac10
         NX3KtrcDT/RiUlkXKw5VQ4ZHCpLuwOoqvrLQRM7Ux+6zsPpWr00DMmvNSECkSkM+9U2n
         cj5ajzpB1M0ytUsxPZ4qUXePs3c1S9UYA88dU4iJsK5177JNj6HRHvYhJxjGpjCVbMiQ
         1ASF5RTlg5t6+0I70zXQpatoVu2jjs0kHpSbXFVegwoK9x9lAWaYviX4xB6amtuiv2mI
         6LLg==
X-Forwarded-Encrypted: i=1; AJvYcCXXSqv7vPDZiZ+ublsr3+0B2wLTHS/c+bRIeQBDXA4Scz77gvpO++UXqVizWRkrex5eAxuGsBaDpsS45wE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/T2YwSdHryIAmQlvibbzBOIp/F5y9Vb/e9bBEzF2XSFQREZgf
	hz//15XZBUvC1KbqRWJRAl4ZZg7rLQsjVSDg2HqbxlhRrSGL9SBYxv3XibKV9U+Yy+1dDlu5A3G
	seThA7/G75DQ9LoxydEeuKxdIetI=
X-Gm-Gg: ASbGnctaEYyW3v1kb4v8v648jYSTj2x0AbZ0xAFdAnSopDwZXA1ACONAuit5grZMex9
	AYi350R2rqJwpnp8KYVJGxifTSZNyHkz8H3BLQDGpuUeVqh2yVDQgK6zuW0fDygCC522KB89nDu
	d19J0kqtPBwcRJWCNWi4c9cD3cHyo=
X-Google-Smtp-Source: AGHT+IFKeGVeNNklz5bYiUxd3ChgxF5PeXNx9MawJNiYFhmrAEI5lZGGi1tJUaEmG4k7AmalZlCWdvAxD0uTdZluzOk=
X-Received: by 2002:a05:6122:1820:b0:526:2210:5b68 with SMTP id
 71dfb90a1353d-5274ced08b8mr4069039e0c.4.1743672838364; Thu, 03 Apr 2025
 02:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z+05IEjV3pczMLNQ@HP-650> <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
In-Reply-To: <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Thu, 3 Apr 2025 10:33:49 +0100
X-Gm-Features: AQ5f1JoYltK67UO5VC8QqBH_de_-LKwsb5TX3KxWxyuXzokl4ZiRRavqztgotbk
Message-ID: <CADYq+faUTmNcUgk5jB3YHT4UCQZhf=Wsah1WUcPHqky6kp_cUA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: modify struct field to use standard
 bool type
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 6:06=E2=80=AFAM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Wed, 2 Apr 2025, Abraham Samuel Adekunle wrote:
>
> > The struct field uses the uint values 0 and 1 to represent false and
> > true values respectively.
> >
> > Convert cases to use the bool type instead to conform to Linux
> > coding styles and ensure consistency.
>
> This is vague.  Ensure consistency with what?  You can point out that tru=
e
> or false was already being used elsewhere in the code.
>
> >
> > reported by Coccinelle:
> >
> > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
> >  drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/=
rtl8723bs/core/rtw_ap.c
> > index ed6942e289a5..82f54f769ed1 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > @@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
> >               psta->qos_option =3D 0;
> >               psta->htpriv.ht_option =3D false;
> >
> > -             psta->ieee8021x_blocked =3D 0;
> > +             psta->ieee8021x_blocked =3D false;
> >
> >               memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo=
_stats));
> >
> > diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/sta=
ging/rtl8723bs/include/sta_info.h
> > index b3535fed3de7..63343998266a 100644
> > --- a/drivers/staging/rtl8723bs/include/sta_info.h
> > +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> > @@ -86,7 +86,7 @@ struct sta_info {
> >       uint qos_option;
> >       u8 hwaddr[ETH_ALEN];
> >
> > -     uint    ieee8021x_blocked;      /* 0: allowed, 1:blocked */
> > +     bool ieee8021x_blocked;

> You should also check whether this is a structure that is read from the
> hardware.  In that case, it would be a concern if the bool field does not
> have the same size as the uint one.
Hello Julia
So following the conversation here,
https://lore.kernel.org/outreachy/bf8994cc-b812-f628-ff43-5dae8426e266@inri=
a.fr/T/#u
I was able to compare the assembly code of the file before and after
my patch and this were my findings

Original assembly code for
# drivers/staging/rtl8723bs/core/rtw_ap.c:392    psta->ieee8021x_blocked =
=3D 0;
movl  $0, 436(%r12)    #,  psta->ieee8021x_blocked

Assembly Code After Patch
# drivers/staging/rtl8723bs/core/rtw_ap.c:392
psta->ieee8021x_blocked =3D false;
movb  $0, 434(%r12)    #,  psta->ieee8021x_blocked

Adekunle
