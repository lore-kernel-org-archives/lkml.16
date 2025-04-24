Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0312066CF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482334; cv=none; b=hG7KBGfYVyoqeWRcJX5JzwvhRx/dqxkUMPdUn3pi4frarQUZfwpaf39sNn2HUKxGdC1vGps2beOVzP7en6Jh9gyuOrQ1AWxUGouv63EmQudPdCb8hlNM5Hb+WXPhhMEQqId+gZD+jHbFObmc3gm/Xo8n+GLQZPDu0A9vebT31Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482334; c=relaxed/simple;
	bh=ngjogseDjbLoUNeCcKqcDS1JihcnEkNMlcYUIV+DoNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PsSLThWO/EubqObLpe6PcbvHUpWlADZ6mzWxZnDgtO7lj39zp+M6GQH0m4J4C5qZuxsCzHAlV7Fd0K7CSFpK8UMP4XVfe9NrRmkco9F0vQh/DaQ27BhTUOwzyoyVyFWFY3rQp3tmhe58vhPSo5XUZZqZI6hIfRIb6xN3CXxIKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LRczqBk7; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LRczqBk7"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-317f68d0dffso3409351fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745482330; x=1746087130; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngjogseDjbLoUNeCcKqcDS1JihcnEkNMlcYUIV+DoNk=;
        b=LRczqBk7+fTEuqOuvf/sG+ueEjruAUrFhaa6WPL49sgTP+bsK0peeL6KsxCSbHVWkZ
         5hs+ARh5sedq/MXm0lAqvdTXTfqrhuiXFXSIpy1wI9XcpQKAfkO/KZHmQGBBqe72IUbX
         HmCjgMsXkWZvrsKBs8wo9k8HNMpFSWLZEcvQiZYy+Sp52l2dil0TjwSwG8KHwSDQVx+2
         HaJVaiOlMux1nfbZSf1xLy7kOe+mXCNc+2C49eYbrPMnSjGV8/5f4OJvu7CvBNwOZq3G
         coWbyXrvP+jB+lz27pn57MeK2cu21jrv1Tb3mmb4+C34APn50xQk0ZoKPVR67utiP3dG
         uILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482330; x=1746087130;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngjogseDjbLoUNeCcKqcDS1JihcnEkNMlcYUIV+DoNk=;
        b=Ri6izd6GO01TZ+2LdwJlNotPLduNEOmgEB0Q6TyC1tK7zJVRkBWuj6rLRbFU37K2hf
         /htt5Gr6uPUbIg1QEhUxWv8kstBXi7b0bnGJDxnqWg784gbGjuU3SUhlRxjMJFIkwvkn
         KP5SrL1LbcmD5CGCigzlQdihIRdz7qm8d77a5Ivvr30QGlLHEPPYBnvf+8fAbrC2jPJy
         nz+6Nf8cQCODtQ/uF5TT+xdi+8GyrliIkGarEu5Ka5MKuw1Xt6H1c/kkMT7rPzNicecE
         1m5zLdw0tvoeyIyrzRrOvyx2jyjvwrtPSL8XMWYyyBKkGs2T41wbwJzw+2oxFHvVmUWq
         faTA==
X-Forwarded-Encrypted: i=1; AJvYcCVi4w9izdhiVOXzgEUwdj77FlByOSvvcsb6tZqRWUaiANFiSGjmzu0SkTm42ldxIxD+DUzRo/X5PtTEUE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4PoClnoEqJya1hcQBBXTN+lqVhdpguplnEVtynwDHYlo1fA3
	Xcoy5teardp+YkthLVymj5MngIPltt0FkXB8193KhpNdsdKZtWjgKfqeCwEBTz6KP0+NwX3ZQIT
	cPhvjXb8QvObWJCWC9gHgESOJlBIc1Nn06arcpg==
X-Gm-Gg: ASbGncu9X/j6+li2jXi2lDWO7L10pEJPfLVu3qMgloGK7BKSPJ4yhBN7YXBRg9BEYNn
	YNonwZ3NelXjNbC8tjZci/cT653EAUPwNUMxUmjznHotqgxUHi+n+sZ74/UVZrjmEo7oTqup45u
	UwFvK95YUfiX42Vd+fNNUPKW+cXyYUkEf7+t/qe33S+cCd5G15BQIrkw==
X-Google-Smtp-Source: AGHT+IFbceL7o3clhs2RuiDyAIdchIBr6aL/LMDMKc7zOsM9dZhn008UBHhrWBGXFXtx2+8UxJ4Pdl2ytx5iQJL1TOE=
X-Received: by 2002:a2e:bd15:0:b0:304:4e03:f9d9 with SMTP id
 38308e7fff4ca-3179facad69mr7495011fa.28.1745482330540; Thu, 24 Apr 2025
 01:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
 <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se> <CAMRc=MeYs0W31Kj-o530_8+EvhoDNzyZunk4xu6PbwK8N1OE4Q@mail.gmail.com>
 <aAnyAASQID8SK107@shikoro>
In-Reply-To: <aAnyAASQID8SK107@shikoro>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:11:58 +0200
X-Gm-Features: ATxdqUGHb7ZpzSc5O8AT5fXNftZF_IaZxwgwcmYklmj1TMA5Isf7jQ0qXPGf3u0
Message-ID: <CAMRc=MfdcH5dugiBLigTtoqAAsqZ_-fKJpJXnrDzQuSbKfw6oA@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter callbacks
To: Wolfram Sang <wsa@the-dreams.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, 
	Andi Shyti <andi.shyti@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 10:10=E2=80=AFAM Wolfram Sang <wsa@the-dreams.de> w=
rote:
>
>
> > I just realized their emails didn't pop up in b4 --auto-to-cc. Cc'ed
> > now. Wolfram, Andi: do you want to pick it up or should I take it via
> > the GPIO tree?
>
> If there is no dependency in your tree, then I prefer to pick it myself.
>

No, everything's upstream.

Bartosz
