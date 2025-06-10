Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEF239E9B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569590; cv=none; b=LvFk8P7omNVcizxqFmokI5xXD1svjmFeMR7IE3wOk85GnoekZUJJYEU/1jqJkfvaxZhZVlECK1qSFn8NB1IfSSrNwvrQS/8xyJwfzNXwO2nNc9bUDW3lIkzd7GN1fWF2YSnO8sSPXA99Y9srBgrhKnqpiOAEvoFvbOtWRYvPwas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569590; c=relaxed/simple;
	bh=bp6yjjTLV7IPhWsZQeYxGqlOtogpgQvGIcdZj1dlExU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9UCTDewYoST9Ejv0U2ZuSdQadZTibbMyUj/RyWtQ0mK2hb+TuwCIQG/Ljl78kWXQGFUwiPmmC6n1oEd7apWb1drs2MHvKDG5B9sJ79OrbuRcJcWkkuXdtLheP0FaiKURsYn4xJLQL1x5UBG8QlfNi2OdSYdxh7eGyK5+8zoZko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=emkml6A4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="emkml6A4"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5533c562608so5477224e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749569587; x=1750174387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bp6yjjTLV7IPhWsZQeYxGqlOtogpgQvGIcdZj1dlExU=;
        b=emkml6A4scKtYToH2UfRwmtkomcJA92cboDZo5Wbf2QUBl192QiChEA2OksFv5Uzwh
         lyGzfbgxsJnSljo7itb3IRTHZoFbZFasBcRwuzLeVMb3KCJW4Xs2UU92aTrK7VCV2bE+
         3qvqoINlpbyoSzKxbNbltaoJPpeedmXr6hkwLLc3PeVds3Ne63gx6vvkvIZWROKDQKFJ
         dvhUC6h0l5XMSeD7x5PcBlt3BnfBpr5r6YEzufTmUzpA8MbkYLXYyms96r8nd4nGGe7W
         yMrAXbhlOz3dxV9JKHx//xV7MyHtg5njqzbralDxqbKhKdw4i7TaLEKR1J/IAdISUbo1
         V33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749569587; x=1750174387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp6yjjTLV7IPhWsZQeYxGqlOtogpgQvGIcdZj1dlExU=;
        b=VWcxb/RstFXvwSa0lG6qvEs8Lj1cpNnvbYnkxJr2+NrKJJ+3SU1g8NHXdOXVbbx+kv
         RF8NXxbLJDGsK2CRngi9aGTOfZZeOcFOa46FxcR4K/IcCiRX3MUHEN4KLIc4cK0Ke1HN
         XeOy3+4MRH55QHt2uOX7IJgjqQYoy3iON2JRs4H4zbFDQbsUqDclHUqcu9Bj7hR6MdEk
         s4zQsR78zZIAg+9mV7ug6QT4S67FGA0WcUPMSeP4PjUOE6ezvQBVrAI5toMOx0CEkomK
         Ull+SWbv4BVe1bjiV1gxUTqt3qsYR3LAQ7TkXP9JQ5x4TyHqduGDntYs9WGXToKlwNiJ
         qoGw==
X-Forwarded-Encrypted: i=1; AJvYcCXarUHt/nA0zmgEgyycxtKzvu/D6DgQWRXfbwjmKWpJmlQBhlbwndyKsHkVrJZQ2fY9i3gWCnfGXMC0dRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhuvEFcwJoMsCSGGojdB/BuPVYqzqJ3K6tfHZsUq+SQAYC/EjL
	3QNZAjQWruu8L1BV0MwpIURPjKYg1o5M7Jz0sNE3uqKFhboWjqd25RWQFnA/ltJ7NmvL0Of+neA
	DiERjlM6ShS+Q3qQdqjDW9QUZRuhCkkK+sI395vAo4w==
X-Gm-Gg: ASbGnct50JfMq7BAN9reJad0hstwBsAdKn35J/qQ9adPaOk5qU+9Gf4f4ME0HnpnbSq
	MWbHmJ9Byca+1Ibi29BBen90tBWF2+BrxZfrXRGuq8CLbdJ40fAGUncgNHYVZEILGY3vYy3t4tz
	ACt0egAMQB4gLUiLuWt0Qw5oeGkrhPH/XERXVe1iJO/Xj70Y4HX6u/6Bp7g62gq04Hpp2EEwk3
X-Google-Smtp-Source: AGHT+IHGiKRnkaIlNk4u6LKClD4MxD98f9NAtcNzrwse7wwO6WLcbYkMf2R+94+P+5WFQq+X5DJHtk2xMP667cpSuUc=
X-Received: by 2002:a05:6512:1320:b0:553:51db:69c3 with SMTP id
 2adb3069b0e04-5539c1f9ebcmr6861e87.48.1749569586725; Tue, 10 Jun 2025
 08:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
 <PH7PR11MB845555F9AA0823B53EFD48BF9A6AA@PH7PR11MB8455.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB845555F9AA0823B53EFD48BF9A6AA@PH7PR11MB8455.namprd11.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 17:32:53 +0200
X-Gm-Features: AX0GCFs4hmh1CGl7MqLsRMX92XhvhaRT6oxbXwW1TT6_s3aNJC4HGWUWBfcKYDk
Message-ID: <CAMRc=MepPni55s9mpCkZ_XrWtT3hOhSTN_QTzpNr_Qzk-YKP7Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: intel: use new GPIO line value setter callbacks
To: "Miao, Jun" <jun.miao@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:30=E2=80=AFPM Miao, Jun <jun.miao@intel.com> wrot=
e:
>
>
> Excuse me,
> I have a problem
> echo 631 > /sys/class/gpio/export
> echo rising > /sys/class/gpio/gpio631/edge
> [18090.472396] emmitsburg-pinctrl INTC1071:00: pin 119 cannot be used as =
IRQ
> [18090.472408] genirq: Setting trigger mode 1 for irq 245 failed (intel_g=
pio_irq_type+0x0/0x130)
>
> How to set the gpio631 as IRQ mode ?
>

Is this a regression caused by this series?

Bart
