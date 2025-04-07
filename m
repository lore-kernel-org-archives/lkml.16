Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29307221DB9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013280; cv=none; b=OmY1ANGzyfuSZcIrrQctU/au6I8UR1+N9mat+fNdVN+rn9RvJg660Mn/He0NXYqzBCiUEDAbTCdYl/64awS4re2yQ1/0jM8a9HtqufmE1h36G74Mj1DOcULuv/8XMxAjAn13NZJNZJZ7cUt0uf6aOLxdfi6BQzGdvfKQr1ITRdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013280; c=relaxed/simple;
	bh=gogz4PVRzPA20Uqf+sKIQQE8c5zFtGKlv/D2k+58jaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTIIWmq/I2usamHiMs/GTVBgkD8xFsoqz9LudppALG2M0aymhEulppnl84kjeHVMCKG2q0pViToB/u8l1OkRCfjlrrh51806FmmPab6x5QZFjaLrubPmdP7w/jHf9t3palbFMFHYh+YTzbbR2JpWkB7SAjWtJ2bZx9HwwKbm4U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFWtvuY1; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFWtvuY1"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso5133586e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013278; x=1744618078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZtx3ksAyUS8ikBqruwfd9ba9TI50uTqddTgH9ayLyM=;
        b=iFWtvuY1rkp2lqM+c701stFBijzO7KeO7HEof18DT87vtT56bMhi8donMos5AO3s1e
         SvLUz2Xb77NxPTlSQhutj1BOC9oaPIVjQMSfUimaObGz0TKDE6HoSELrhEkyHliQFC+d
         5enRy6VH0hFbLhCLCEW04ebxu7D0mwnkcBvy6oGUs82tPg38GI72d6EAGfQ/FB9fTPbd
         dWEiy6t/+x3b1Oj2f5uSlcsGmRjfnXAdnt/dqecs6NkkNV3qIXM0apx5zH5aSrr0wMvt
         7sbbzxtSFcv7E9iu637ELjcYz6Q0HmkFu+YMFmrpTCKc7pLf5D26izlelpZF0KjNrlbt
         Bbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013278; x=1744618078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZtx3ksAyUS8ikBqruwfd9ba9TI50uTqddTgH9ayLyM=;
        b=lEO3RSrdXDOrlulC6FYI1MRXNOBSZbWct/rnIz9BL/dr+qDok0QZ7MzkicFZ8AU/d/
         oEooIMC9xYVMGexLc1WaLMMT3RVupLPDMyuRsCzGkWgTvf0DRWnmws0AgmoCdu37FXPa
         5+WFtg9VkC6HzGTU/lWKoDJBtTV6y2qx99W4GU2YFTkYYBO0okwWnx4j7wc4R3AtkUqO
         brgQadveZXIyc16IaVuVUq1+vNqyPunbYDjHKqAsMbqD5NAhk2iCqxBKsvQX/8hV3x4n
         LbVeQutMPngzMmdrr+HT12YVpTMpmadPrnaLRfweTc+b/Hc//qOnkk+eZYDp9r8wct5F
         0GUg==
X-Forwarded-Encrypted: i=1; AJvYcCXV3FP8i6OcHKL8zOURkuEYcV6GOlA63MgduRCdokMlx1qVzTe4Vn0dyOsXedpzUMq8b+sevDyHMvwkt/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbMD54K1UDyvNWMqAIzrVGBbpaMvrVnEJAvDkTqZD1BsoT4SBv
	ltQo39mKplQHyuxZLR+CvWDuAqAklS3MMmEuGkohtMD5aCQh/C21gDenBVRp1TyoUppmk0LZJpS
	I6x2j51/+88wIIK+UXcE01imxPzo=
X-Gm-Gg: ASbGnctABHsNLYeBKPQu+NNunr3Zuf2wMRM+1tx+xv/eOiizgYt1HNvaPGJxBME1sQw
	x+wyS2I8BG95T4G+5YjjEi5wGeLs2JR+CvtD3bYdLuf5KRVfAUYnkDwkajO4ZqrUE04/2R2tho0
	KH57nfKWEobpoIrLiE0ERqqhg9fZw=
X-Google-Smtp-Source: AGHT+IFjWZtJ1uBJ14jW6/1HkSWpM3zygwta8fDHCLQZuIpcJxqqJLqW1sc6Q5WxBvke0mvi1Gfk7C43RJNGvDU7ffU=
X-Received: by 2002:a05:6122:2516:b0:520:6773:e5ba with SMTP id
 71dfb90a1353d-52765c03cd1mr8651372e0c.2.1744013277984; Mon, 07 Apr 2025
 01:07:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/NxGilPLPy7KSQ3@ubuntu> <0d62aab3-bd51-4739-88a4-9419cca7159a@stanley.mountain>
In-Reply-To: <0d62aab3-bd51-4739-88a4-9419cca7159a@stanley.mountain>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 7 Apr 2025 09:07:49 +0100
X-Gm-Features: ATxdqUGWQwlFY26Wg3APhFZxKAYxTulMaapf6T8cGRl19pfw5zez2KaKE7FTPOo
Message-ID: <CADYq+fZ0uDxZg2SjqLJfjSY1EG9E16gHRouknqt8k-1HZqfh=A@mail.gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, andy@kernel.org, david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:20=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation with `4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the sequence
> > number cycles though a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power of 2 value while
> > the AND(&) works solely for power of 2 values.
> >
> > The use of `4096u` also guarantees that the modulo operation is perform=
ed
> > with unsigned arithmetic, preventing potential issues with signed types=
.
> >
> > Suggested-by: Andy Shevchenko <andy@kernel.org>
> > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > ---
> > Changes in v3:
> >       - Added more description to the commit message
> >       - Removed blank line in tag block.
> >       -  Added more patch recipients.
> > Changes in v2:
> >       - Changed the commit message to a more descriptive message which
> >       makes it clear why the patch does the change.
> >       - Changed the subject title to include `4096u` to show that an un=
signed
> >       module is used.
> > Changes in v1:
> >       - Added more patch recipients.
> >
> >  drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/stagin=
g/rtl8723bs/core/rtw_xmit.c
> > index 297c93d65315..f534bf2448c3 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> > @@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *=
hdr, struct pkt_attrib *pattr
> >
> >                       if (psta) {
> >                               psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority]++;
> > -                             psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 0xFFF;
> > +                             psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 4096u;
>
> You forgot to change the & to %.

Thank you very much, Dan. I will correct and resend the patch.

Adekunle
