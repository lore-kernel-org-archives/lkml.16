Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900821770C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743548151; cv=none; b=qr8B8flzo7JPC8ApUcy81p/dB7loa+oF4EHNdfR2qJQh/uJolfFTHFP0WocUyyOwmDKhU5jqgvvY1Tisa2ax0dd8TI8VZPIBEKjIPPLZ555mhKr+OSDw/F3XnhaTBXdKuVUHr5W6YDD8e9P0805WgVo4rL4n0i3OqwfTUGHO44Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743548151; c=relaxed/simple;
	bh=E+b9oIqFiwUc5seB+5eWGnt8Sn0wyJO2WTeDYuDualQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IE6Rs7zYi6FzO/E3gUpQEDKJYsgVRhgGFv3cjIg/rUyOM7IB4euFHhlv3pDuo0fFZjytx2EBJdyUt7CLApS4pg4Om6ivdMjHzCDqy092F+KqTndmCMRXX2QDqtkuhVoskjwerrEwCCNhm88zTSryfPoCKwyzcFnLSdbFfWlAPpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=yTYWTP7k; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="yTYWTP7k"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225477548e1so110190685ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743548149; x=1744152949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOjvUvD4SsraF3i83uhg6pN0Bc9uqSDvIgKmbp1S2UQ=;
        b=yTYWTP7kA8tWW4HpY8UG0cSpmkAcF5vtlDzznLfotHEXbZ+87fhRsfaAOuKZdcgdQJ
         POTPKIgVhLbrfMaG19bNbqvkqkh1PSULBB/3494s7JisVPBLqNmsZb30owRuUGTsN7tI
         ADFqT1cpptxsROYGpIxQHmkDu1Gun7kUZ0N2SzGcpXEErlsp2w8CEHIPDIn2npO+Kwnu
         WrzHIjUQk1/O73cis7Zv+NTmcQPtaJrQoG2atUTyotTpS96WgYKG0GJAxKcD8a8fqzTk
         mB/n3D7ggkCno62EZemxID385iGdflryam1mOi0Tt+TX3XrPh13CMan4dQx0STWpkPsK
         +tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743548149; x=1744152949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOjvUvD4SsraF3i83uhg6pN0Bc9uqSDvIgKmbp1S2UQ=;
        b=MXVUzDXcrlcR8/A8IKutH2kFD0NOXwGw1ByjOdmlC69yCRVcFwBaCYndn+UqFETx80
         HnouryQnKudo+Qa6jtCVfM46bavJRlEZWxjx0i9wKPyjRrhZfFmJj5nAPYoVMaqd/ly2
         2lEfEBIzdLCvadtYHl138nqye5Z4OtZ2f+6GI/5DROnEBGqlwrnB+o5Wt9TMjOyZYer0
         ry2x7Yd6xHqSsk9Hu946Y7ueYEV3txQDSY+A+IKcInfENIOpznWIjKAxNj79nfLzFd9/
         5PfzAvC5Vtl+Qkk7gWSXZw4wNSC21aOyzIqWNln1+Q8QVM3ZiTR3ZL5nZUACoORo5jH3
         8WqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9bGEO0p09Whr+6OYpYQzL3/9XZdV8z/a8VgMrmvS6IWpkgUFKRr+2ObnnBhnJs7bLq/I9b9OCvqefdFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaESeAmHzmE7F3sEaY9+DlOmSnZ47644IOJjnHir6hk4gVD4qA
	Vy4IeGRLRpCrwj6NvPei5eh4pUYqC3zsXDfxgpj5xl7YrwVF0k3ee9wMaqn1e1GBelBg7qth4ZS
	77YmvWFBmNgzdT6gf/nUv6TMrwlQlZENhzifz3w==
X-Gm-Gg: ASbGncunOFNh+P+xWGR5SNKe9LYStCSy7ZfNHvtlfQ8/4zzxL+69sQt2C73TkO3OUok
	jkzyPJbjk2dVZbCi+uBp99G2VKTwBreVcGerA13TG6HCBlMEzozcQyA+MtiRxkBJxKfacZToD/Z
	Xh7ovMBczp+UKHMfNpBgaU6cfQh2t6ZfI9D8RJwyoR9Vunc3+wPXps9ps5SQw/
X-Google-Smtp-Source: AGHT+IExmMPgc6yrAKEj+Wun1m65Eq0nFCLPlFD9SJcyf9Mm4KMXd4QfMnTRDK1kJTLibYa1qloy/8tf1AWnyuca7LI=
X-Received: by 2002:a05:6a00:39aa:b0:736:50c4:3e0f with SMTP id
 d2e1a72fcca58-7398037c9f2mr20232897b3a.10.1743548149206; Tue, 01 Apr 2025
 15:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401220850.3189582-1-william@wkennington.com> <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net>
In-Reply-To: <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net>
From: William Kennington <william@wkennington.com>
Date: Tue, 1 Apr 2025 15:55:37 -0700
X-Gm-Features: AQ5f1JrkfEUxutwJdGJvqOVTtWHYUegIU6mDj23C07Bw7_FIpmf5v-xoL4RzNtI
Message-ID: <CAD_4BXgzvFavEcfhY5_BEi9y6pK0wJ1q4oqFYC5ctP53c57=wg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: max34451: Workaround for lost page
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 3:52=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 4/1/25 15:08, William A. Kennington III wrote:
> > When requesting new pages from the max34451 we sometimes see that the
> > firmware doesn't update the page on the max34451 side fast enough. This
> > results in the kernel receiving data for a different page than what it
> > expects.
> >
> > To remedy this, the manufacturer recommends we wait 50-100us until
> > the firmware should be ready with the new page.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> >   drivers/hwmon/pmbus/max34440.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34=
440.c
> > index c9dda33831ff..ac3a26f7cff3 100644
> > --- a/drivers/hwmon/pmbus/max34440.c
> > +++ b/drivers/hwmon/pmbus/max34440.c
> > @@ -12,6 +12,7 @@
> >   #include <linux/init.h>
> >   #include <linux/err.h>
> >   #include <linux/i2c.h>
> > +#include <linux/delay.h>
> >   #include "pmbus.h"
> >
> >   enum chips { max34440, max34441, max34446, max34451, max34460, max344=
61 };
> > @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c=
_client *client,
> >               if (rv < 0)
> >                       return rv;
> >
> > +             /* Firmware is sometimes not ready if we try and read the
>
> This is not the networking subsystem. Standard multi-line comments, pleas=
e.

Okay, let me fix that.

>
> > +              * data from the page immediately after setting. Maxim
> > +              * recommends 50-100us delay.
> > +              */
> > +             fsleep(50);
>
> I would suggest to wait 100uS to be safe. The function is only called dur=
ing probe,
> so that should be ok.

Yeah, I don't think they did strenuous measurement of these values on
their end. We have been using this patch for 4-5 years now with
seemingly good robustness on the 50us value. I just pulled up an old
email from the vendor that gives this context.

>
> Is this a generic problem with this chip when changing pages ?

I believe that is the case, but this patch is pretty old at this
point. Is there somewhere to add in quirks for such chips that would
allow us to build in such a delay?

>
> Thanks,
> Guenter
>
