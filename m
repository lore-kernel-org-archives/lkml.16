Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C38A3214
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739155829; cv=none; b=dU0XoZzov7fUEytLPYCA1i2ft6YJGlsi3oNvcWedu+/pcLvVQpzl8AcX9N34MNuTJSZjRp0yzBXKi7aCRpyP3fu0x7vM18QIGGECHDJKYwDCtCzG77/ItN3MiKU7DLNIji5h52BNEgf8zYyQbTPPiodmqwMT6vRAY82RcZrxjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739155829; c=relaxed/simple;
	bh=wASpFzfn9fyx2NU/WZ30oug3+0IjE+caYQVCZRc9u6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvVPpQ/GryPsC1PicB+ZcWmYS+NvpEKa8YYYo6DZ6+4vU4G2yzg6mQlWRwEcnaJtRFwD5+g11YNxcAJE9zGXY3JwC07jzeKZr+X4gLhJrn6nXIKz6bO9OlU/s9pus1KoYe6ihFa0AQltdYXKyxKAtMj4zUZ9X+4Lk3dFmj3YwTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie5UCsdp; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie5UCsdp"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso5976023a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 18:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739155827; x=1739760627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6wJOWELTsLR3RwU+AAGVqeWv/Z38nHm5I3vNjcGvBg=;
        b=Ie5UCsdpt4qn8/+SA6K6DsyrYGRZP7HWJLt8d3UixV4IiDdwmRdSgqMpcbJeDVPMTt
         IELgTa3+PBMujpETEImIHTyKh/GjImiZ4qF9a1PC3mpTn6rHPAMHqQyEBb7JRyFR1DSo
         jSvjozNPnchhUChjcdX7Vvx0e57cTHGkxFkiDZQY5Hj4QE4SyHHjDz384gH9cI+bSHTp
         F0M03xsdbmPaDsFJEqtTShM9UEgk6EKeAPNUebtlUO9CkhUY8ovcSIiqaat8//u9G3n6
         qkNKIPeUUBHMtG74eHsT6Gdi4UXjKT0WcEIKe0BHFxarR9MB3Z21jxZHo0Qzfm5tuskz
         lFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739155827; x=1739760627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6wJOWELTsLR3RwU+AAGVqeWv/Z38nHm5I3vNjcGvBg=;
        b=urCjLosSE64o5Fa1dSkH8yPQGeT//Tiw7dx60MIy8kFt6JQfOUTYDk/fjBg+PpKHah
         VinqKRcNofzUcDp5O8adXw7s2ByYB9GAVDD408DPxT3LAfsrzfzIhmt3nEaTKq5LAyjt
         5Ff7QKO7qgQpnSNGV88Ggo1FYVq4RRivwDNTnwpzFby2QkBFso+K9RpUtfZdV7DXNJBj
         BBi51++YjnWbIfAXZK5n5t9f1vp3V1tTOzNKHTHQU7uOF5fPVBFFvioKiiee6ri1Oren
         prfkh4bVgx3zd7byQ7LROw/UE9CTMJCmlDkhyloFBHvDG2zhm3ZoYZaqDOd1lw5YHuWj
         GlTg==
X-Forwarded-Encrypted: i=1; AJvYcCXLqAF+Olg9kcr43SyD1oWM1g6yO2y6gn2TRNFZtnmEDAguXUizjL+9etKV9wFOiFeztMLk7TH1+BS0fPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Ii7IslwVJa7ye0vrDzFFV1UmRDHqkbBC5FErq5OfkEYa6J4T
	3WuObTEySUEcNSmom8BKc/2/GkE/I38cudtSh1aQfcyTtqAnU4FEsuj+O597DGBI5yav6AN8KYv
	3sGLqVrdTNTlRCr4b7QSQ86M6y/M=
X-Gm-Gg: ASbGncsJu1DeJv0tlM9hMQue+5DgJFLKgUapnJB9/zHs/9/9/iRZiUXmhQLP0nBBT3Y
	lS6FNn3GfB/khSCg7DgiFUatIrFyfNIJxckCeQ+rSGGeDmWSlQsR5jcLUdGTyZYyx6CxIzH6Z
X-Google-Smtp-Source: AGHT+IFrD0ZOqN+mBcQv2gPeap0XFft+z+PmKmHDVPeq0Bc0B/TPciJtKw2QC5KGBhrXwlk0nt2+GWYWKxIArj1WtgY=
X-Received: by 2002:a17:90b:5282:b0:2fa:9c9:20a3 with SMTP id
 98e67ed59e1d1-2fa24700cbfmr19649885a91.0.1739155827420; Sun, 09 Feb 2025
 18:50:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122065605.285145-1-linchengming884@gmail.com>
 <20250122065605.285145-2-linchengming884@gmail.com> <878qqj3sju.fsf@bootlin.com>
In-Reply-To: <878qqj3sju.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 10:46:19 +0800
X-Gm-Features: AWEUYZmW2VSUp9JJdlVPQz6fJe6PttWR0Fd_M-kLgR0JsCS0S0XBLUDR7Fg5UXE
Message-ID: <CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

Miquel Raynal <miquel.raynal@bootlin.com> =E6=96=BC 2025=E5=B9=B42=E6=9C=88=
7=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:13=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hello Cheng,
>
> > @@ -687,18 +691,43 @@ static int spinand_mtd_regular_page_read(struct m=
td_info *mtd, loff_t from,
> >               if (ret)
> >                       break;
> >
> > +read_retry:
> >               ret =3D spinand_read_page(spinand, &iter.req);
> >               if (ret < 0 && ret !=3D -EBADMSG)
> >                       break;
> >
> > -             if (ret =3D=3D -EBADMSG)
> > +             if (ret =3D=3D -EBADMSG && spinand->set_read_retry) {
> > +                     if (spinand->read_retries && (++retry_mode < spin=
and->read_retries)) {
>
> I believe the condition should be:
>
>                         if (spinand->read_retries && (++retry_mode <=3D s=
pinand->read_retries)) {
>
> So if you have 5 retry modes, you can provide 5 in the manufacturer drive=
r,
> and not 6.

This was originally based on the configuration in rawnand.
However, I agree that your proposed condition is a better approach.
Thank you for the suggestion.

>
> > +                             ret =3D spinand->set_read_retry(spinand, =
retry_mode);
> > +                             if (ret < 0) {
> > +                                     ecc_failed =3D true;
> > +                                     return ret;
>
> Shall we try to set the read_retry level to 0 upon:
>
>       if (ret < 0 && retry_mode > 1)
>
> ?

If we set the read_retry level to 0 upon, and set_read_retry fails
when retry_mode equals to 1, it won't return an error. This could
potentially mask an underlying issue.

>
> > +                             }
> > +
> > +                             /* Reset ecc_stats; retry */
> > +                             mtd->ecc_stats =3D old_stats;
> > +                             goto read_retry;
> > +                     } else {
> > +                             /* No more retry modes; real failure */
> > +                             ecc_failed =3D true;
> > +                     }
> > +             } else if (ret =3D=3D -EBADMSG) {
>
> Rest lgtm.
>
> Thanks,
> Miqu=C3=A8l

Thanks,
Cheng Ming Lin
