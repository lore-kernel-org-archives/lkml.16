Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837C18732B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664158; cv=none; b=bc/xpRxDHeW4vmvEEYMQQ290Q0cV6S0MEfXegPaxLP4d8d9IhZ/heJ7HzZWGeeJB/DDvLxEntEIU7UF81nGc27rJE/jaGw0qauo/Q0icXvLey+tKXsSSatVIvrCF3FBt8S9M82HxtYfwIP8xEha2sEovhFFWWQP3SlZrT8pPrPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664158; c=relaxed/simple;
	bh=DHnHqc7xTPXIbcMBbnMmP6LtCGcfSw0B37npJ6vzXxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdkzAXC5IJsg1T5skIXk4QgZnzzzvnWr0LaSokBsoR0QxZiLM7idtfLMIvA5QBtuHHUs5yTZHqP3swvsHb8ovojKaE9C4ept5OA6wFR/AksHxXKSV1gpkp9umfbOvFRMjzOPMlqCqx9PgUoG4mIZLMZQFLvKYLSzqdRsOhvhLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVXmLeM6; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVXmLeM6"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so328869e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743664155; x=1744268955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFoq87g3RUpItgd7yRqH4elpvnagnn7yUoA5hke1FAM=;
        b=iVXmLeM6OtKhJSq/8TFEXdeVWNLhOlE8+ec60ClNtqGZMZpE/H9/iXJ///JIc7ZnAj
         k4SDo1VVUUF2oDJStJa4mzxHJboyNLudOH99s2tfpK+dB5blbZYNUFPQQJ2gQerok5nV
         iaVpcXERjFZFgX9wPewW4y4VBXTLfLJ0MuDNOYmfieNZB7Ypdsbpdz7c0chO9X/CiSjf
         COjP7DcyoEU+O1O+wezEa61D1wKUEIqkQ7mDnrGYLghelOuSG2O9phorPvAhw3rusRFe
         hluMnFwooChhbPw1yrICxYFcSDiE3XJN0t3eSZ4rUrBKI7taOPL0bwy7hI769w5QkWHn
         ku3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664155; x=1744268955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFoq87g3RUpItgd7yRqH4elpvnagnn7yUoA5hke1FAM=;
        b=MCLRtc2NH6LMOcmk32IC7N1uLgMFZijIMLaBKviqx2vX5D9oXxrCGQ+AsvoWWSWtyM
         wLT5mqUp4MpjH6aqW5mCzT8KFcFs4X64zEDXrS3U0mDOl1FJrz29quzT5AMhw7Gxk/bk
         bzWEjT8jcb38CTmsSRl8pqEP5b4VHPwPswG24Wsrbb/K55CaMs95pvqG8RL95y/qiaAl
         TGOeLPSkuCnsgg8zjGrNREE43o65ysMvikCCKsEvkSv7GXOWy92/TnCBdDNEfB+QodY+
         p0FlZUSTn2YbVW8KEZUzZKFpK8bo0ByuXRpEv7INVewo2GQlGFP1ba+JYcx6NRYDpEtr
         59VA==
X-Forwarded-Encrypted: i=1; AJvYcCVTJmVsR5EY9Kl/vlfk2VApj9x4e3Hf9MyNNPN3KKa4PUimqpSS8wSWlI/Z3Fw4COdcmDsHvcszSXOqz7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKJuvo55abYqZC6jVE5w+MgEtTq3ztLb/Iko2h7Q7dVl1UDd8
	IrRAKUlEfYY6siQlhKspCPYCKs1MHZQkNrnCqEcvVzYdA0VFAzYjx5tI/NpzskTxsp6Lu/fGPq7
	2s3ZryqeR5sJGas1LqyfLASUTeOk=
X-Gm-Gg: ASbGncvC7jQm7cs0CNm1Ane3Vl8Nak2E+8hsaBKqtDarAbSATjtjwhGJUcFDR3amZ0L
	dOnv1RE+ikM4IejSaqhBPIWGYL/N+gbclafU6aIWn9aseGTWgACkSaQOfiBwg6qjgV3XpvB8dX2
	0fjORCHDHjLvfmGSeKJYDX/sYHMVTfRO1jr6x/4L4=
X-Google-Smtp-Source: AGHT+IFOYY8o5OXC7BNOpL314Y2KkesOlD1Thnx9JW0TD8ulbkyEzlFqBnntu4H/6eYSqGX7s/EYQq9bM8bUmRQAYio=
X-Received: by 2002:a05:6122:8295:b0:525:aeb7:f22e with SMTP id
 71dfb90a1353d-52758da72d9mr1008296e0c.7.1743664155396; Thu, 03 Apr 2025
 00:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z+05IEjV3pczMLNQ@HP-650> <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
In-Reply-To: <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Thu, 3 Apr 2025 08:09:07 +0100
X-Gm-Features: AQ5f1JpGQqeJrBUB-VvSXTgpFhMBgMWSpDUjQtsyK6vTde3Vr4caK-xmt4hx0DE
Message-ID: <CADYq+fb04joR=8b3zERT-K41y-+Czo=U0_M8GsQWPZbpAov=0Q@mail.gmail.com>
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

Okay Noted.
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
>
> This declaration doesn't have the same alignment as the others.
>
> You should also check whether this is a structure that is read from the
> hardware.  In that case, it would be a concern if the bool field does not
> have the same size as the uint one.
>
> julia

Thank you very much. I will confirm and effect the changes

Adekunle
