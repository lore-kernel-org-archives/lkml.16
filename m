Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D7524293C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272900; cv=none; b=X4qnE/PKmMnjBs3t2R3gVo4KOgWd8GrueJC0hT94yq01D9bHSS1kAiu0czeQVfeAdtyGadukQ16wAje+3WTxQjN6BfXZTLUz1IGhOwqrIYjMYjbVIG7TjRvzsxhtJ9Ws9S0JC9SA6NZihYEdtcqhSEOSOcjUwlYI4Ji5Shs4NAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272900; c=relaxed/simple;
	bh=0nsH/jPFimKcYRT+Dej7GBk0eLvCw6VGTXNdgPojo80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxBym5NgZeLfm6FNytWXZaQHXfAMqIWYFUhM6I9F5TO8MqbiFx+MyA7YwtJkc1E9SsyaQAl2q0ex9xfL6fr+fvK3EmS/uK69utdJOtIEOzaf5w08Fppi1m25tB3FhVSB/sEZJSpOazkNtFuVFzGda3Ei1uK1JjHmw2scS+eFWfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V9/WyvAD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V9/WyvAD"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553c31542b1so2076850e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751272896; x=1751877696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRm2HAodZH8jnTL2iZ/znuEcvyS0+/KEjlCARzXweYs=;
        b=V9/WyvADYD9xu8d/4sh6bFB4I4oQOPpNu97lDgC+xv7V5R9Yzb6ilzCeybCT0CM5Un
         po/OtU1nLFflymRCoJTfNtJqdMWTsUvEzpFor7gGcre9/wzsdUbp2mLGHZFJB/DxvFDw
         tztMbjwMDO5Xw3izF/Ydez0rzGAReNewf1CVHReoWjbTYo9LKKZIJ/edsIGG69k4hnvj
         8/H+XzJ4K6OnMzVIr4C6XswJs8yAnB+p7UKEms9aTdQYEwyY2RJcCpfUn0l1rdeydxMK
         5kNABesZcprZe7pBygauvqLEBKIqkpfuJsFTLnonhrpmBEAaovCUZcB4KwEs7ziI0vM6
         DaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272896; x=1751877696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRm2HAodZH8jnTL2iZ/znuEcvyS0+/KEjlCARzXweYs=;
        b=f4WM49Me/gMA9xtemCK8EQWmsSvf7BP+OUcjmB+Q8H95k1l2JjvUqcDk9ZswB41lGE
         ImrXkEG/oaQOCH1pBdElPhbylijTZF2TYljWj3Q0O5yH5UehgPQjx8TKs+NXlnGS3sWs
         dU6CFSDOIbKXenQmhsPtHa6lyL7CeY6/xcna55BJOpPtkDTJ86ufDDTOuAX4mtYn2ly7
         QETvJW7+a3twlQlJLjkwtAwcTrqZRzxMo6ulhR7l0OQQz/BiwkR9sEFe1oA9pN6rA0lI
         D4kSm/Ife2Uf/S4qf5Ah7U1jhHCzJ4okhwlbth1NkfD+RsS1ztnlFutelTykGl7teJ48
         qTbw==
X-Forwarded-Encrypted: i=1; AJvYcCXOPQMdkzkxwnJKx5tM45DZEqcQyB/QNOaThEuZLCv87RCILjXVJav5DHE6XVu1KIwDGk/FDVTU5WkmqCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy8mdsLW7ikKWgIcyVt4znHVavfHXmvp/wjvyCkbMWFGGyC8jd
	nU2f3b7SLISYCupxoVGTJaukY6NcF9HV9vC4/E51SEovMBf6NT9ai6Nu0ReWW9OoqmksozjcKbR
	nNJbDjBS33V3VTCxmPIbDJDUHB4ZWIhNkZ5QuAVLN9g==
X-Gm-Gg: ASbGncvbdlWUSkHMGYX9TGoaXmtpibpgJsai+iSMXAkrV0vXuXNLc2m3ot/BCWK4UNx
	QTyWObOyAMEqiw1zO2uAwUFsmcO2ym+vbkpZ6IcUIdpwTIzKG9CMs82eGtDu3Kyh9W9pAMSeBOf
	DfYRYj1gfI7F0rR8R/3oX+V7kooPepE6jJ9P8QKOcQWMM8DPEbjPijg1InXbt74q/Nh2gOPgx2B
	GI=
X-Google-Smtp-Source: AGHT+IEVkjp3/UTpRnXdrJVLRjIhG8hGS6F3a+RhUQK26Dswruo4c3C75jqgDprOKOEDLW283eg5n0iCi0K8/sdqhjA=
X-Received: by 2002:a05:6512:318f:b0:553:2355:1f26 with SMTP id
 2adb3069b0e04-5550ba29382mr4281546e87.50.1751272896591; Mon, 30 Jun 2025
 01:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-2-d592793f8964@linaro.org> <aF66Q3Jtx1c6rmki@black.fi.intel.com>
In-Reply-To: <aF66Q3Jtx1c6rmki@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 10:41:24 +0200
X-Gm-Features: Ac12FXxZJoDHBHEC0Mwhn2czBh3vtNJKqm_zeBHA__WbbzEBsToG9ReKBkITdRo
Message-ID: <CAMRc=Mc3EM8UXKaKgsNx21wR0NAKwqW3iJQV93kmBfk56hbrSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] gpio: sysfs: only get the dirent reference for the
 value attr once
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 23, 2025 at 10:59:50AM +0200, Bartosz Golaszewski wrote:
> >
> > There's no reason to retrieve the reference to the sysfs dirent every
> > time we request an interrupt, we can as well only do it once when
> > exporting the GPIO.
>
> ...
>
> > -     struct kernfs_node *value_kn;
> > +     struct kernfs_node *value_class_node;
>
> This change is not mentioned in the commit message. Why?
>

Yeah, I'll mention it.

Bart
