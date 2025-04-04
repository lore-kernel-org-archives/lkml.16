Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7229D7E110
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 03:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743735813; cv=none; b=uB0cxaDobUGSGSv0T1I0ZOnxYkYuL6pLFrx3cSq5xGmjDMPlv6yAP8u9aXacxxe6l8ThK0mRdNKltqVuE6vUzwD9PsSGQIzeJNFKY5+Owe7wMCyfDsmrQY0cvEpHJN0VYa7vmKM49UFRVqYjw2A5ctKpQ31/4vJ/RtH8ncln9g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743735813; c=relaxed/simple;
	bh=XiaaeIh0ZZaVHZtsslFXr81gPq0X5PY2zA05Qtiub74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chVdJCB0w7vaKjAeYpPthPeGbwfHI+ppILoZJZupaM6w0II0BAuyQmG6uFe75jBC/6nLRj3FmnMnVq4F2vv7F25FY+VpJXtMxeOsNrpzkSObNd3z6CMF4hYm2UVfKclVIxRK78ak1N7QV1ZoSIsWA7ozVoC54BBYOPalVIr1iSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj7w7gIG; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj7w7gIG"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4772f48f516so26312331cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743735810; x=1744340610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UE3DzoQpmYHs8xWnfdPWXAlmV19fVHBgLJAWXS0P6k=;
        b=Aj7w7gIGCJmCwPBlk6k11fHANcR8Ws6SN4MXEim4hRL4xrJIdcf9Zp1e/MqRCJ6O4y
         r0XesYqh9LEN6+DKqyL8S8MLcW07V5dezcVzO5aVCQvhDm5J3IVI3qO9MAslkD7H586k
         /6ybQvCgyxXhfABjhL4+UEOnlc+BIx9PY7lL9rcQcfUVAGXPDIk8M3VhGoc52UDDh7oY
         E6WNZnWA6BAmsXTK5lugTkM+JCtN2ICPf5cyoquP7lPzZVN46z6RLwXhuO8fgibVUfLs
         bYYdV33h2TlkrSrb1N7rSYQPIPfIHbIJX0WAGA6D3iFF3LfMlxi+7ChY4sikadPTNqX6
         F9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743735810; x=1744340610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UE3DzoQpmYHs8xWnfdPWXAlmV19fVHBgLJAWXS0P6k=;
        b=CkVcHikdS63nmFCQoTUrxNfuIE0+XDMvN/8sCXn9L22//ZsOuX8u7PZEJTmXD5Vxoh
         ylSx3MuHfh356k/QTMzQlD/2DHns1T1gn+TX4Uz0LU2HQXz246Rw9hZJWseUYWVlA+y5
         QXgbfrXPsZqJvXbBOTm0IUX1ptU1PQSMj+Tbg1XusPMAawas+e+4ZM6NOHy+DJftoVmo
         2QRHqQmY8U8FMuKZj5nXyjwN8JpP5ByYbBIlJQ6IHqdAWo+lHju+iyUCEH3XLMYwWJW6
         6bqWVgxImdgPJUjGynfRhKPrhsLLQFhz5vgayDtJBnJbCoDf+G0kltf36WPFJRIWtAO4
         Gamg==
X-Forwarded-Encrypted: i=1; AJvYcCXLS4e1pgPgHaCN3ds6lZ9nlQqWWaYAwjst4RaGIhpEVYSfXQRpcjalvRrvAMr5rtykUN+Jm/nfJBhnKZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7/143tJLpsGsOlLe2qJGUUyg73u6hS1Qg/lgLeLwXDu0lzUuS
	GZovK/pSOt/z0/BXaXGJtF+ri0IPyQKiET+0NQt/mtV89M3M9NN+m1OtMhLzSi6AX3xjPBcFXxy
	YOVihCObAdRa2NDfd5BH/8Gh2EUo=
X-Gm-Gg: ASbGnctt8TQYGpuz0vAZzp0bZxG33SJPJ+vPIM/Thb+titDW8B1M2+7a8Dza+Lqz6eJ
	Xc4HC/dtKixwlQstPlOHGI+qaLZYYGfqYmeDyao+YE+AlmC9ckDN+o/fNENdq+yRC49tWX/eUDc
	wYSm36P9K/XXPv34KlwKXdHdRkRlFm5GvURxBU8YD/kBHXbWxQARAfLSLm
X-Google-Smtp-Source: AGHT+IE67I6IaRfM0rS55FHF15LclgBp91ol+WbrPbsE/bvJ8JLhseURL3aCgdYJm7i1B1fW0+AJ+lCmBZeaTRnm0sA=
X-Received: by 2002:ac8:57c1:0:b0:476:fdb3:28ca with SMTP id
 d75a77b69052e-47924deb441mr25796501cf.24.1743735810315; Thu, 03 Apr 2025
 20:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402124207.5024-1-gshahrouzi@gmail.com> <2025040350-footnote-fanciness-50ac@gregkh>
In-Reply-To: <2025040350-footnote-fanciness-50ac@gregkh>
From: Gabriel <gshahrouzi@gmail.com>
Date: Thu, 3 Apr 2025 23:03:19 -0400
X-Gm-Features: AQ5f1JrLNamMMZyLaUdMMmSLfqTt1l4dcqsI5TL7NKevMMIIyEHzOQcagU6MFCQ
Message-ID: <CAKUZ0zLTCw3HDxmyiPD14TxQk-g90h=-7=e1Zp9ucDXQosPB2Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Remove trailing whitespace
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	eamanu@riseup.net, linux-kernel@vger.kernel.org, 
	kernelmentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 02, 2025 at 08:42:07AM -0400, Gabriel Shahrouzi wrote:
> > Remove trailing whitespace to comply with kernel coding style.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> > Changes in v2:
> >       - Resend using git send-email to fix formatting issues in the ema=
il body.
> > ---
> >  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/stag=
ing/rtl8723bs/include/hal_pwr_seq.h
> > index b93d74a5b9a5..48bf7f66a06e 100644
> > --- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > +++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>
> This wasn't made with git, was it?  You are "one" indent level off, the
> diff should say:
Interesting. Not entirely certain how this happened. Since it was from
an earlier commit I made, I rebased it, amended the changes, and then
formatted another patch using git. Apparently one of my other patches
for an earlier version had the same problem but the subsequent version
has the correct indent.
>
> --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>
> here, right?
Yes.
>
> Anyway, because of that, this does not apply to the tree at all :(
>
> Please fix and send a v3.
Got it.
>
> thanks,
>
> greg k-h

On Thu, Apr 3, 2025 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 02, 2025 at 08:42:07AM -0400, Gabriel Shahrouzi wrote:
> > Remove trailing whitespace to comply with kernel coding style.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> > Changes in v2:
> >       - Resend using git send-email to fix formatting issues in email b=
ody.
> > ---
> >  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/stag=
ing/rtl8723bs/include/hal_pwr_seq.h
> > index b93d74a5b9a5..48bf7f66a06e 100644
> > --- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > +++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>
> This wasn't made with git, was it?  You are "one" indent level off, the
> diff should say:
>
> --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>
> here, right?
>
> Anyway, because of that, this does not apply to the tree at all :(
>
> Please fix and send a v3.
>
> thanks,
>
> greg k-h
