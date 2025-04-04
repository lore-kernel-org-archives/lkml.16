Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C71CD2C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 03:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743736613; cv=none; b=Z5dWTkhwTpNGYzXBveEkBuX15MH0hiiPWhMCCJc86h/Ion9SuCrKmQ+CgbkEwv5u9Kn2mapq7sPgHcTrdr4eqN7D+CXzgtvd1IjfZl1CMCqFbLijcbbvJsMKlr8kzBGhQ8YHNugOsMMfsVUqjQF0InLjT9CZZTmVeom3WMETyHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743736613; c=relaxed/simple;
	bh=3MXgIml+EW4PElL/Kwn4VTBpv63yRiU0nx0DB63Rm/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njjhH6IPkNIoHh8e6B87syBSdbUDGJe0FYbKnvcJliW5DmxBrNz9YFdIt72LE/ttRYrbJLqLzseH8ZQPQ/PjKGLgA3C7m0AjvE0VD0jyWsYwh9qKK46/sXLsVDMuzlXVpltJTpmLF35vq06WhrFYnhEjrvNw1PlqIm/lXY8fbDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcrFUwQc; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcrFUwQc"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47664364628so16904961cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 20:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743736611; x=1744341411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsSiuImgPZJSIBkA0BbQR6qiZItpPbtmLSDASH6V+tw=;
        b=dcrFUwQcdffASWW6nkoa0C2DMQt692Kl1ygLqNdDHbHQj30qgNRDvTDvTOkvQJtRLN
         +nO28nse1gZxAeaIM2EV3tqZ3kUAhyxzInBEjui5wD47nADQ3GzbXjBBtiMImZC/CDKI
         L0PiVJhGWPDsSB1aovHvlgf6Cbb9zclDhpCpc3wyEkPbYVFHB29ZZ1UjRYq+VTT9yBOZ
         XB+Cbo7kGojEKhV5PlMgQJwFpKPsowLvbiy9FgaQ4tfc2Kke9gqFtut4B7KY4dSAb1Ue
         tu8kXzUHkQjpUTtUPNO9e0UKJxry1O4RigRhpCi4KFgPqSaxv/LCkSQYfyQQFIzQ99ZE
         DjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743736611; x=1744341411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsSiuImgPZJSIBkA0BbQR6qiZItpPbtmLSDASH6V+tw=;
        b=m7JBfCRQQXeuIk/a1M+PnLmv/Ac+403PbzvOXSzerbPmyawIa6hPltQiaB1UdhQ+dw
         fNCVZ175RODZesPynkRGT1t/P7SGiZOD9JpMzeZDLQ77GS2Enb1OK3Jh81r7lbMOSejU
         rLMx9P7yA+oUgi1MdIesnZdOm+G9yNbmoucvI0qe16mQ7xuDRKpvuZV7872S1Ussj3sb
         d+kphIEePPklHJnw6aQmLwXdT3dqHAKM4dZITin5MY9tuQ76dnmVGyZtdWUxYfsI5XkF
         wcAk6dy/GvS7nXyVBzFQNP4cVuRMW9d23vH3rmKI/JuRokPOFSIdMs+KNRcdbZT7Z/Lp
         Hxkw==
X-Forwarded-Encrypted: i=1; AJvYcCVgQr62+mcxCy6GG5SVYslY2kCg0eL6BUhtD3q3XheW+deaIQGSE9oStWYeB/GYtBC6843ROHvp7eTZ/t8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUSe43ANs+b9WpHwpqmX7cdYTkMZDyphu0FcMEwa0/789PEmrJ
	1SwfJ8pcnfSgwhuzPOSUFlyaj+NaOCi8rX7b8im1uLbsFEudRmNcvDVFVokOiuNi3v2aGW/l8X/
	4N6czJUr1zPFzrrfA1zBe/VaAHU0=
X-Gm-Gg: ASbGncsPq4LwUQzjo7f8vFjNes81bAx9OMdsMw3cdIGxvcWClnJk8JXlaCyeKFTPUSO
	Z/SbMkepFI7x9qNX28AE5PBR1sGOvx5TKfIffuZKHWbVBh/PyPbxQn8L+YaeHvDClZYmCYEuU21
	hDTNHBt9O5vXzXAecBHsh2bZjYQo2SEcDQp+EJBd3ANZZo+LMmda34tHqU
X-Google-Smtp-Source: AGHT+IGpiTixZuIRs+kppE3urPHfFJtlPJdUN9hFNOYrJjnOkr1+zSXc2rpdSynGOjeQZuL+Wsd27x7L1AuRkS0L988=
X-Received: by 2002:a05:622a:143:b0:474:f5fb:b11a with SMTP id
 d75a77b69052e-47924c30da0mr21099711cf.3.1743736610677; Thu, 03 Apr 2025
 20:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402124207.5024-1-gshahrouzi@gmail.com> <2025040350-footnote-fanciness-50ac@gregkh>
 <CAKUZ0zLTCw3HDxmyiPD14TxQk-g90h=-7=e1Zp9ucDXQosPB2Q@mail.gmail.com>
In-Reply-To: <CAKUZ0zLTCw3HDxmyiPD14TxQk-g90h=-7=e1Zp9ucDXQosPB2Q@mail.gmail.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Thu, 3 Apr 2025 23:15:00 -0400
X-Gm-Features: AQ5f1JpalCZLl5SlsRZLQ88v9o549GZADtvsvlsr_FcvtanpDT1fJqMtiuQkCSo
Message-ID: <CAKUZ0z+iL1TOLbddt5qbqNb_kAG5Ltta7Kw97wO0_S91DrQ8hw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Remove trailing whitespace
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	eamanu@riseup.net, linux-kernel@vger.kernel.org, 
	kernelmentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 11:03=E2=80=AFPM Gabriel <gshahrouzi@gmail.com> wrot=
e:
>
> On Thu, Apr 3, 2025 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, Apr 02, 2025 at 08:42:07AM -0400, Gabriel Shahrouzi wrote:
> > > Remove trailing whitespace to comply with kernel coding style.
> > >
> > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > ---
> > > Changes in v2:
> > >       - Resend using git send-email to fix formatting issues in the e=
mail body.
> > > ---
> > >  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/st=
aging/rtl8723bs/include/hal_pwr_seq.h
> > > index b93d74a5b9a5..48bf7f66a06e 100644
> > > --- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > > +++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> >
> > This wasn't made with git, was it?  You are "one" indent level off, the
> > diff should say:
> Interesting. Not entirely certain how this happened. Since it was from
> an earlier commit I made, I rebased it, amended the changes, and then
> formatted another patch using git. Apparently one of my other patches
> for an earlier version had the same problem but the subsequent version
> has the correct indent.
> >
> > --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> >
> > here, right?
> Yes.
> >
> > Anyway, because of that, this does not apply to the tree at all :(
> >
> > Please fix and send a v3.
> Got it.
> >
> > thanks,
> >
> > greg k-h
>
> On Thu, Apr 3, 2025 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, Apr 02, 2025 at 08:42:07AM -0400, Gabriel Shahrouzi wrote:
> > > Remove trailing whitespace to comply with kernel coding style.
> > >
> > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > ---
> > > Changes in v2:
> > >       - Resend using git send-email to fix formatting issues in email=
 body.
> > > ---
> > >  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/st=
aging/rtl8723bs/include/hal_pwr_seq.h
> > > index b93d74a5b9a5..48bf7f66a06e 100644
> > > --- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > > +++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> >
> > This wasn't made with git, was it?  You are "one" indent level off, the
> > diff should say:
> >
> > --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> >
> > here, right?
> >
> > Anyway, because of that, this does not apply to the tree at all :(
> >
> > Please fix and send a v3.
> >
> > thanks,
> >
> > greg k-h
Apologies for the duplicate post. I initially replied only to one
person by accident and have resent it using 'reply all'
