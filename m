Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0596125
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746892848; cv=none; b=SVqZt9rNkN8DvTQK9MBm/mnAA63nuh/rfNSe5Ur5hsuh/7Et4MAR+1kJ2ec37YmwtNZM81VTqRQxkuwLmgNGM1Wblw+PUpDznmt5G6MMh73Qfw7zfaLd3tiZOxO6wh+DdN3H1hjb2lMQk0jZTo4u2QJ2ecfq+mca3Krvcpd8eo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746892848; c=relaxed/simple;
	bh=+5l24ce3Yi3dLqgaEQsSaOjQurXeuBkBLrGtXwdSccM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSDsGeHR7eTIk4FD2X4s64Kox6eXpAiyUsdFK3Bd8cjPkqP0IZZK9tMqHhjwPPC/xtiyqeDq2NwlljqbzX0JdxhBEIHkMaWkk1XH08jiAfZQIeiCnJV8lNR1gqP74rAMfeU7zUyTF3EOWfPunMaAdEjcztPDO9fiPxsRk1OWXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XZfjEyUa; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XZfjEyUa"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb5ec407b1so556480366b.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746892844; x=1747497644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=agAxFQa4ZuiU7cjsZP4jyMITjDw2hahHdYNvqVN9K0s=;
        b=XZfjEyUaTuJcHPfZxm4OIGLBLPrMTJRKfrOcKmG+K1gPd4MPYe+VfGI4WWdK0NVpwf
         sytrw1EBq/3c6trh39o9h07uQeAuj5nmUeyPc/SpDpgOOqlKdN4THzSVU2H6ZqAmUm0p
         u8JwsUat7zn+jQy5dUzbCRsX2rtUBo0+wIzk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746892844; x=1747497644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agAxFQa4ZuiU7cjsZP4jyMITjDw2hahHdYNvqVN9K0s=;
        b=ACFrBYmvaSnsoDrkw1J2d2J3aGMp9G7PGA8gvwNT8IASgi5UYQU8j9Sfn1IZONBdZ5
         +jC5wmSHn2O6Y5+YEnW5F8O/UQFVDYyt2GjWxjRPBtVoWP+IzFya+QnfzTvhf2tOMgCA
         IcUNHD+PxEM8EA1kurLPhstc5m5XHf7Zlsf/qsziBxXqfIfaoueH/XmCvzgbaCzWluH5
         l1v5p+08rDfLplruBag0gIJ0C1wg+5RoTGxzFd57LKap30AvyCkgmOqUpyazrHIGfn9I
         UaANllKKCAKmZj4/ODMubuyK81o9qT9tSEHyS9Jjd/vo9kUE1HI/M7hS+a+ji2eMo+WA
         08Eg==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZG9E8t0LTDj+/RPwZp0U9s/CfNc6eFAXf9YA0/72UHZ/Jw4GpJBjxa4AxRKF2foBBiI7UlaVYgjvQlg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx601qe92DYNgw3M+x/NfoIgbkFVZWmQJSmkmkF4z4UdaBw/DVj
	QHx4FKiE5waymMxuIFFQTJs/5V/i8eGQizPLvWE0F7GulNRbzr6nXAcdaprdnMKOqiH1KlRDniz
	BBlE=
X-Gm-Gg: ASbGncsT2f1SgMYyuyxphYe8/3+/1TwqjeERyeP5tIwnwORzi3LhKM9xEjNInw5q5nE
	Z8J+UhgwsO6NP04UAhCEoK6BdDKurXb2nu5w9X+MXFFVx4lQlS+GQkrd4WG/zEHxZp8yYnh4wrP
	ZwVrVrq8/BKyBwJh966nO9xMJGgQgerpScIhTHiaHhpRzxFpMzv5KiNmFgWcMmf/q2w6jBhUZDr
	a7BnHjO3GMf4wq5ZodbSYxVWBWzVpWdAqZf3QFZ7a9N5WTtAFQS1D5JgEW0bzI4K6JQ02OjNVDa
	w/4n5c57xJjzQInjkPePpqFJ5ReD3Qh8NjHW4fcOcwBRN4NUXRXXrN96skGJ2ylSvyzzoKRx3bA
	TZIJWBwRwi6DiTn4Ae4DRhGdgkw==
X-Google-Smtp-Source: AGHT+IGtv0skMUY5fBgiWrmY/G4cQf0ZFB2W+rSHPE714CBw26OJ6ZJbPCLQO6uRemAkSDsGW7W9PQ==
X-Received: by 2002:a17:907:9484:b0:acb:5f9a:7303 with SMTP id a640c23a62f3a-ad21902bd67mr615416766b.35.1746892843658;
        Sat, 10 May 2025 09:00:43 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd432sm329469066b.129.2025.05.10.09.00.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 09:00:41 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fc9c49c8adso2550368a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 09:00:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKlCuoYZ876cP6sJZQ/YgmICoWrK6IrdcugngA4IY8qtPAGK8vqbJLcSIYRKRkatwf1/9fHAF9HJLajt8=@vger.kernel.org
X-Received: by 2002:a17:907:da9:b0:acb:35df:33f5 with SMTP id
 a640c23a62f3a-ad2192be047mr714777766b.56.1746892841498; Sat, 10 May 2025
 09:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aB9aTNHuSV-5U15D@kroah.com>
In-Reply-To: <aB9aTNHuSV-5U15D@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 10 May 2025 09:00:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgiZ2kk73wU58o8B8_5fuNLReGQkGo_8HXsnsCE_YUsBw@mail.gmail.com>
X-Gm-Features: AX0GCFvyZc4aQ8D-XQTidiJpyLk4kbFSAngpvEX3ub4p-Ag_j-Y-P7VeUIs6hio
Message-ID: <CAHk-=wgiZ2kk73wU58o8B8_5fuNLReGQkGo_8HXsnsCE_YUsBw@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core fix for 6.15-rc6
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 May 2025 at 06:53, Greg KH <gregkh@linuxfoundation.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-6.15-rc6

I suspect you forgot to push out, or it's in some other tree.

Because there's no such tag in that git repo.

             Linus
