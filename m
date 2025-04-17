Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6439D253F23
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744907624; cv=none; b=hn02hDCtV18Q+SX3tBpRmdPtYXyUOTBsdM1+rlU7PiZT0CW0HGfPvkO9papLgvOPJvyQ2sU0k4+18rrC4xaz701uS4mBwoL3d8/fyA+Kn/O2eykGS2vhXwGAz5/KUg7i2k5xmRgx4b+U7naI/2XvgsQY0yHkftrbPYvgFx1Dyqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744907624; c=relaxed/simple;
	bh=jT21jRK0J8SRlzjyqosDW759opx+ZsN7MPAvUOaGObs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6BUVlNciG9scBONCbtBvkA5RcZM/tefupgSvgJimMud2hL4xtLt/tJumFMd7vwUOl+JrC35uyFTWLL/cHg3hvYRy9AyvYOOP9VRYP5Ys/diTFGWZtEvFJOyOa/XOIDOQFR/LV6Unr6qXHgbYekZYj1nsDNh0SFnHKA4q3+ylr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kW95vDOn; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kW95vDOn"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476ae781d21so9813641cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744907620; x=1745512420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qO5+04CaWSRFQ4SaFhOjMQvO97IJAoXY2FwR++5c1UQ=;
        b=kW95vDOnhaeljY2ezTd6XpKK7n/jbmTQj0xFSs13MlNWFYjUNbG5G4J8x6jROHmKtd
         zekhKghqDQjKaZZrAQBUflaR0hRzCD96Y2wjGYrEd4/JJFEPxkaRpKcsTVMAWNofm1tM
         t/vWTut2U+ElEcVdjwImcIGKcSEYPpvM7QyXwWHh9BlxpysiUW8/1ZarxrDAq+FFIwqy
         K8HJojLXsHYnDFgVddONdjEhvzNiQNYRlyZuE09+Xt1I+wVajvy7dWA9KJCAOy8mw/wH
         JApfMRQZ94oVo3IaC+gUgj+2GrGv+NL3eE5XAQuwNgZL8YARvDXbWDmSfubvhXLKDUWP
         vU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744907620; x=1745512420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO5+04CaWSRFQ4SaFhOjMQvO97IJAoXY2FwR++5c1UQ=;
        b=OalWJw6wwlODQSPl6W9Gs8zLDOudciv3LkyFG5XoZVg1IKHRocJxSff3oir7VXn31u
         VyGXLV7wlwgCB9bJq5fT+xT6K5sCU8DCS7NZJ7DILOB9I5cTSeb3jx0kYCRyp/08poGR
         cDF3wbVDztBXpivOV4eWkGTCrJpAe5pRXjTi+TTMhO8mv2Tghd7QkpBYmqjZ5ssSTMkK
         0nozolf4s63fkllLygXRpGvl/7O8ebM4MUvkV9O9E1SfdSp0oWHGAqVwDkA1kU1XQr8k
         Qj3SDaT1ex4o3s9/CH1BM9xF4PuR/tycRvO32lZtToRHJBzZ/cp3e/tgfv9JZ8waQAiM
         wrjA==
X-Forwarded-Encrypted: i=1; AJvYcCVm3xE7Ftrleee5DBTAwlFsvO/xC0YnLk7N1FQfw7P5Q/t4rHfgxLjrfLHpRPY8ptOVJi3Mn4OdWGri8ho=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPYG5346OuW02gPZg32zaUquejfwGMubRYxmpgZCTEDHnvRauZ
	92VMivWv3Psg1nwOoT255aIYNfZNqKVWA6VUtXDxfEEsjmHAZwJ4qN0ifY9a2063rsHlURLFJZM
	UTW7rw6yUcRftWDZJH+7/X13nDUY=
X-Gm-Gg: ASbGnct3Q8WHOT3jwYkhX5KDJEkdB2Yq/7OuHSiQmcmryIaMzaGHVpW6X3/RlcoupVs
	BJFR4bUzuz/+rw00KmswZwP+G7K90mrYes64QRofXvBCFNNFINd5ASo2191arJNuH3RgM116yC+
	La5B7UqFV0tWsjchqN38Us
X-Google-Smtp-Source: AGHT+IF+1GF9Iqdb9twp+aheYHmHxlG6UmiaDmWmwJgTii/i+RPjNbiZu6npNwyTdDwS042MrCkog9QKWRra+9xpJuw=
X-Received: by 2002:a05:622a:178b:b0:476:b783:c946 with SMTP id
 d75a77b69052e-47ad810e2a9mr124221401cf.33.1744907620151; Thu, 17 Apr 2025
 09:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu> <2025041402-colonize-rocker-1db1@gregkh>
 <CADYq+fa18G25hfTeWTxwyxc+A=xHmk_je_9kjWbDdwbo0seaZQ@mail.gmail.com> <2025041448-destiny-hate-1b70@gregkh>
In-Reply-To: <2025041448-destiny-hate-1b70@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Thu, 17 Apr 2025 17:33:30 +0100
X-Gm-Features: ATxdqUEL1gesoQZzTPywh9XHBFhXyu8wX2c91GK7fMi0Vlnqf3F6jGWNea334bw
Message-ID: <CADYq+fYWFqPQTJABt4sKo3NsENLrDbVh7Sn+uu9sLNumc0wt9w@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Greg KH <gregkh@linuxfoundation.org>
Cc: julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:00=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Apr 14, 2025 at 08:38:53AM +0100, Samuel Abraham wrote:
> > On Mon, Apr 14, 2025 at 8:23=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Wed, Apr 09, 2025 at 06:48:02PM +0000, Abraham Samuel Adekunle wro=
te:
> > > > The sequence number is constrained to a range of [0, 4095], which
> > > > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > > > used to perform this wrap-around. While this is functionally correc=
t,
> > > > it obscures the intended semantic of a 4096-based wrap.
> > > >
> > > > Using a modulo operation `% 4096u` makes the wrap-around logic
> > > > explicit and easier to understand. It clearly signals that the
> > > > sequence number cycles through a range of 4096 values.
> > > > It also makes the code robust against potential changes of the 4096
> > > > upper limit, especially when it becomes a non power-of-2 value whil=
e
> > > > the AND(&) works solely for power-of-2 values.
> > > >
> > > > The use of `% 4096u` also guarantees that the modulo operation is
> > > > performed with unsigned arithmetic, preventing potential issues wit=
h
> > > > the signed types.
> > > >
> > > > Found by Coccinelle.
> > > >
> > > > Suggested by Andy Shevchenko <andy@kernel.org>
> > > > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com=
>
> > > > ---
> > > > Coccinelle semantic patch used to find cases:
> > > > @@
> > > > expression e;
> > > >
> > > > @@
> > > > * e & 0xfff
> > > >
> > > > To ensure this change does not affect the functional
> > > > behaviour, I compared the generated object files before and
> > > > after the change using the `cmp` which compares the two
> > > > object files byte by byte as shown below:
> > > >
> > > > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > > > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> > > >
> > > > No differences were found in the output, confirming that the
> > > > change does not alter the compiled output.
> > >
> > > This is version 11, right?  What happened to the list of previous
> > > versions and what changed down here?
> > >
> > > confused,
> >
> > Hello Greg,
> >
> > I collapsed this patch to the previous patchset I had worked on that
> > made the same changes to the same driver.
> > So this patch was collapsed into PATCH v10, which is the last version
> > for this change.
> >
> > The change log in "[PATCH v10 0/2] staging: rtl8723bs: Improve
> > readability and clarity of sequence number wrapping" explains this.
> > This patch was collapsed into patch 2 of this patchset.
>
> Think about it from my side.  I get hundreds of patches each day to
> review.  If I see a v10 and then a patch with no version at all, what am
> I supposed to do?  I would assume something went really wrong and just
> delete this "obviously old" version as it would have been the first
> version of the patch, especially as there was no version information
> below the --- line.
>
> So, what would you do in my situation?  What would you want to see if
> you were in my situation?

Hello Greg, I'm sorry once again,
Please, do I send a PATCH v11 for this change?
It seems my mistake had made you delete the PATCH v10.

Thanks.
Adekunle
