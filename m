Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5F1A8F93
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012290; cv=none; b=JT40QfuokfrIMkJzK4vueSKV499o0ECK4yt4LzaTXGvpg5dn3b67yW/eF5zQd5X21znFw5zMMmIeA1Tml4bNxcacYQRRI3gcw7Lvdi8h3TCDfBH12Rl4q8GrB5DjxI9q9YI47Q6hPDQnNd39pYeWRLm8738IHltUTDWt3qHtVjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012290; c=relaxed/simple;
	bh=o79E6iz8ZvmNeQP4Cpdd8X6btgIvg0exYvYyzn95SYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g38ZvEGwY7OABfXsiVhL3by0LhCI7PK28oyIMNpYsPNFph0gIjyEOaGyuOUafYCu4xZsk0Dm6b/jiYs+qbk21vQMgBfRZgYvAHdgIoQGDs8UGcq4eEQM0o7zvvCSThUkksKV6eGofjbsxJmYeAHJ2/L56+bENQY7up3d9gFKS0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILu/WPpC; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILu/WPpC"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5259331b31eso1861072e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012288; x=1744617088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtZuEG+pnGVzzK4h3p2dQVU+EpheroOcxlaBk0xAm9k=;
        b=ILu/WPpCAM+qNIb8SmOxGjqPPYpMdEA2BhfyBhgNOLk5980N4YdJwfvwM0+hbI435U
         1BhiYN5iqk3c4BGXlAgrL5km122WAOqR/Oawf6k0MYSSXtwIihaHah4IbAXVCyt8d+y7
         A1WXhKZ2RIBaIcM63VpVwjC4Usp/+jy5r1k3NDVE9xJweMQZbiHo+YUcTMhlF3ZIKH2C
         ZnDe38dhh5rPbGHGb+SRIyMK7MDG6EZXgDCmXuZIgn3dt3fUTobmMm8U63fLZFGuhQcJ
         AArz0YF73pyLdfuXUstpI71+e10p1oQWYPMBe21CDA5qYMY/MdupR2P7r8q77e34sfVu
         n00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012288; x=1744617088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtZuEG+pnGVzzK4h3p2dQVU+EpheroOcxlaBk0xAm9k=;
        b=KSVYjK0g+kK9oVP6O/tqQhNwJRfynw6MINR9xH+2Kt8on/SR/Q31XlzOKX3BEv3XuC
         DAnybFRCWTkK6uiRS4WrmSkkMBm061ct+R8GPh3N6KT8es/8TPQh6Lzf0fEtGgoETOm+
         gun7fjM0IGTaP/CQLfwF6HSbS0U9WUPli4csSHYcHrlhsj3WzWJUNJxdxSJvjvuLLSr/
         WsjMGVUll1Hq8h7dti/Gq/d0k6rEWWVAnEE2iCkRj+yZzQ74EatfqgxaY/5wLCSBIgfa
         h1s8b+jL/nWunNirois9/FJ49lRKFV/hxSqs4ZTyOvof5Wy1uiwr8n4g6lohZkOZPikl
         2eTw==
X-Forwarded-Encrypted: i=1; AJvYcCUpIAhTaHHiBYy0L/fPGByz84MMqyqdVXEmZVCTig3xtDYj7a4pvHMiSz7ozoDwVaP54WKsgw3vvCZqUag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb7GeDBaGb0HN5ZwksKrm0xQ+2VCSSWaxH/IVyQ3sTC4Qng8Ej
	uao9PK/QIervN4Q98BOUV1QzEhnx/whINzQ3G86YBnL6txKpzimeei7Imel+RZSEUSvLEbHoLIZ
	YVmD8HD03EhbHQ2YrVAG4wq3nzrM=
X-Gm-Gg: ASbGncvziCXbOf0i5jhAfpsaPgtvnHRlOgv4px35NLSSR8Non1oMVFW3H38YgcJDmDr
	ZcpZ7d2JwAX6Qg6XZhByGwLblUMZ0f+6xzH3vcXDDCiyskTvBJSR6kHKk+d9Z+y0Q6OdPVUtpDv
	WRh6d99U5rMTgU9tHMWFz8shQttZrk/FSbuQJb1A==
X-Google-Smtp-Source: AGHT+IEAhKw6pvZfmPU11eW7Mu3LcNdcjaDj2yQ40iqTe/wDunpLy0Cg0y3QthniLyQYYJJKkqC8V1utCVDnjNxAHfw=
X-Received: by 2002:a05:6122:1816:b0:523:9ee7:7f8e with SMTP id
 71dfb90a1353d-52765c5444cmr6470357e0c.4.1744012287790; Mon, 07 Apr 2025
 00:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/NxGilPLPy7KSQ3@ubuntu> <2025040757-clergyman-finalist-0c63@gregkh>
 <2025040752-unrefined-labored-8c8c@gregkh>
In-Reply-To: <2025040752-unrefined-labored-8c8c@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 7 Apr 2025 08:51:18 +0100
X-Gm-Features: ATxdqUHhyM420ZVP3BEml1GrGZKTTewJQJc6Tjl2jKwdFNU2DbODlPxG2XuGm5I
Message-ID: <CADYq+fa0nJdq2+kMkwwb-s0ePH_8qN_R5Lu6SfNpH1pUsdRksg@mail.gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Greg KH <gregkh@linuxfoundation.org>
Cc: julia.lawall@inria.fr, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, andy@kernel.org, david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 7:55=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Apr 07, 2025 at 08:36:35AM +0200, Greg KH wrote:
> > On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote=
:
> > > The sequence number is constrained to a range of [0, 4095], which
> > > is a total of 4096 values. The bitmask operation using `0xfff` is
> > > used to perform this wrap-around. While this is functionally correct,
> > > it obscures the intended semantic of a 4096-based wrap.
> > >
> > > Using a modulo operation with `4096u` makes the wrap-around logic
> >
> > <snip>
> >
> > > -                           psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 0xFFF;
> > > +                           psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 4096u;
> >
> > I do not see a modulo operation here, only another & operation.

I'm sorry ...
> >
> > >                             pattrib->seqnum =3D psta->sta_xmitpriv.tx=
seq_tid[pattrib->priority];
> > >
> > >                             SetSeqNum(hdr, pattrib->seqnum);
> > > @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, =
u8 *hdr, struct pkt_attrib *pattr
> > >                                     if (SN_LESS(pattrib->seqnum, tx_s=
eq)) {
> > >                                             pattrib->ampdu_en =3D fal=
se;/* AGG BK */
> > >                                     } else if (SN_EQUAL(pattrib->seqn=
um, tx_seq)) {
> > > -                                           psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > > +                                           psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&4096u;
> >
> > This also looks odd, nothing is being "AND" here, it's an address value
> > being set (and an odd one at that, but that's another issue...)
>
> Sorry, no, I was wrong, it is being & here, but not %.  My fault,
> the lack of spaces here threw me.

I want to add spaces for readability. But since the changes occurs on
the same line,
I am a bit confused about the best approach to take
Do I create a patchset, a patch for adding spaces, and a second for
changing from & to %?

Also, should be second patch be based on the file after the first
change I made, or it should be based on the original staging
tree file.

Thanks
Adekunle.
