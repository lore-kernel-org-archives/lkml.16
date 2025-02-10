Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC9226461E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739231239; cv=none; b=j5jOeKSTp5UrftZ/S2StM+GN45ZMjwwjfbzDeeR8kIp9CMh4ofh+d1a125Ld38xH3iLO/hlqDBH41MSuum08agWyFOs/lCn8PylnMvNu3glD+wTBxgerHSbZFVj3G6GcJdmCK+wsYLdE8WSCRk5zTgE6wXt15g7VItkJm6ExHeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739231239; c=relaxed/simple;
	bh=aC4ybPlV48rjAowU4w9KHF1AHWrEKFjedf/2S3XfV5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYxQbs9b3lnKwKPJDj0em9x3I4bIYFiIVrcJ1bFDu8MDSpqXh6u/25bdCDCTIuCy6dl/GsaWEhwjRb3GSi98sDtYtagttvnKuzqnLnAE+eJz9xRLdhyqPChHkRaCW44Z9kKe2YBY5bcDJgtWGGu+wySRPg9NJ1JQJyOJOtFGqcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNZLO580; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNZLO580"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fa200c3d16so1032653a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739231237; x=1739836037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7jeZyJjuwJYTqmC+cuXah+UwertLxBWiBj++4YpvRw=;
        b=XNZLO580R/utdad57dGxPqDeoyOsb006+tKayeODtZ3sY+H5Oc4fTwjD+VhIQBikO6
         rFnyDnO94S+wXQZvTmxKA7K769IMZhHgffpU7mNYkA/f7Ygli9Q+F4swpwoq69QWBPhw
         K+eqve9MC99f6qmzRNa6e7/Kq1DneVmo0zYR9HcZYLzIOy5FRtyIWr9TJXoBDfT78nbq
         DV2tObdqgM0aVf0zRw4DPjwtHi0jxpl6XLf+QyWsdwA7TF8nUB+fCuxDYHOGPOiUNkXW
         UouAzKqiBEOoXGXwpSl8eUefhGAdP7l+oKoZRcr7IJRKHebupQE7n/EirCH3d4+Q9I5o
         zxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739231237; x=1739836037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7jeZyJjuwJYTqmC+cuXah+UwertLxBWiBj++4YpvRw=;
        b=BsyZQGhGE4Gkzqy9WhVjMZkcKvUOMzg/lOoU21vgRiPKLwcl6rnNHY9mnPdWTst+y0
         RQ7FR641n1r9ocl+2hlqanezoVe7sBnzg1wHJGQ/mZwsFFSojZFsmaq2qAqMrpFTJiK8
         WAKpV0VCmsmOAMlvn4bBhHb3w4GUYE7ig6qGjtosLa1Z7MPW91Fnnmi8yEFjfTNNgePP
         Yy5MxElpTYn13C266Xn+PZNvMWQVMrNlwV0JXad0umqdC268cob/aey9s+bRjFh/4pmI
         +C8LTPUoT7DUVtvQ1lhqWhKMBeYt7+kJr1KFgbtXsnpiKV8kytv3DwTNafncCDU0DHxh
         0U4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUmDpYaPCWCP4H1iFZcq33lyYqv5ChBnJy7Fhfxdx5Z8+lTdb2QjL2caIY+7FbkwMg7+/OQtGq3vvuuWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzg0eba2DV+DOM0Is/rA9Lsc6b/vzNXahkOHJnGO0S76acGleZ
	/Rlzy86qodM4bUqDjMqPnqQaucJRx6sLCww5omMBVUTYW2FPXpO9ekmG59KCKNXyaIrQYN/Wbb8
	/W50Y3IqPQVnce94orVnYCmO0sJ5k17E=
X-Gm-Gg: ASbGncv0ru5V8ZI1/fG7fA41NbB+RaTIwKArgNWznLY1YAvOv15bqKqZ2u/QRQ4/Jxs
	UQye+EU20RH/mQLQ3rer7f3KIaMrjvhvAjR1TRb6CrmBeWgOEiu0e/9+tFfEKejcsxA3BOLXrtw
	==
X-Google-Smtp-Source: AGHT+IHY/LXlqOaD7ZOzErzg7GeUrF00j75Zb4wV3oqUsn7Bj26nZRuD/K5gtjziP+eybr9/lz8cSaNiO9Z7r9ZM9wE=
X-Received: by 2002:a17:90b:4a06:b0:2f2:f6e5:d28e with SMTP id
 98e67ed59e1d1-2faa4af590amr253495a91.3.1739231236960; Mon, 10 Feb 2025
 15:47:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120190720.322926-1-chenyuan0y@gmail.com> <20250210173358.GI1868108@google.com>
In-Reply-To: <20250210173358.GI1868108@google.com>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Mon, 10 Feb 2025 17:47:06 -0600
X-Gm-Features: AWEUYZk2ZnBu3JfqZ70nIPKoIBzDPa_C-CuK0bvrM9NMwn72hzUZA3IEMWm64aY
Message-ID: <CALGdzuqnAtyWSfgqpFbw-fVGvYnYHRGbSH2v8BUSJnpYPXR5Sw@mail.gmail.com>
Subject: Re: [PATCH] mfd: ene-kb3930: Fix potential NULL pointer dereference
To: Lee Jones <lee@kernel.org>
Cc: lkundrak@v3.sk, linux-kernel@vger.kernel.org, zijie98@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:34=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 20 Jan 2025, Chenyuan Yang wrote:
>
> > The off_gpios could be NULL. Add missing check in the kb3930_probe().
> > This is similar to the issue fixed in commit
> > https://patchwork.kernel.org/project/linux-fbdev/patch/20240114143921.5=
50736-1-andriy.shevchenko@linux.intel.com/> >
> > Fixes: ede6b2d1dfc0 ("mfd: ene-kb3930: Add driver for ENE KB3930 Embedd=
ed Controller")
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > ---
> >  drivers/mfd/ene-kb3930.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mfd/ene-kb3930.c b/drivers/mfd/ene-kb3930.c
> > index fa0ad2f14a39..60824d847bf0 100644
> > --- a/drivers/mfd/ene-kb3930.c
> > +++ b/drivers/mfd/ene-kb3930.c
> > @@ -162,6 +162,8 @@ static int kb3930_probe(struct i2c_client *client)
> >                       devm_gpiod_get_array_optional(dev, "off", GPIOD_I=
N);
> >               if (IS_ERR(ddata->off_gpios))
> >                       return PTR_ERR(ddata->off_gpios);
> > +             if (!ddata->off_gpios)
> > +                     return -ENOMEM;
>
> I don't see many other call sites checking for NULL - why is this
> different?

It looks like other places using devm_gpiod_get_array_optional do
check for a NULL return value, such as in
drivers/iio/resolver/ad2s1210.c, drivers/mtd/maps/physmap-core.c, and
this patch commit:
https://patchwork.kernel.org/project/linux-fbdev/patch/20240114143921.55073=
6-1-andriy.shevchenko@linux.intel.com/.

> What about IS_ERR_OR_NULL() instead?

Yes, that sounds good. However, I have a question=E2=80=94what error number
should be returned in this case?

> >               if (ddata->off_gpios->ndescs < 2) {
> >                       dev_err(dev, "invalid off-gpios property\n");
> >                       return -EINVAL;
> > --
> > 2.34.1
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

-Chenyuan
