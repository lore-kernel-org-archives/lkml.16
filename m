Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8D22618D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834214; cv=none; b=d1sS9UZUodEm82v7FcF78AgnjgyrYTyFvQOaaRPEcstCZnXW/9z8a4Q/9twwxVmrI/hZkhhy7w70zMgn3uSlYVpUpwyfwLwmhibPxgG8WLI+hK2GetOkKC8vh1BO0vnDXl9J3cn9pzjBDmHXAejaPJtkVK03ouoTAi7ojoUgu0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834214; c=relaxed/simple;
	bh=SdgHInAsUXSdKixwpkgWNZ1b6pPlCjYH0d4wlVq+enY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0jK3H2CfIlfCgy0oJjF7wbKdZFIQMJbdtUK2vYYawXD/GY7/GPlPcoUll+XrmBPJXg0J/bTyj0JlFuqAVRwqbxtYZv8ktvdL6Y6m4hcZwCB7D4mDJVlbmOzV3WRuThaZpO0gnGSraLAdyeyK8k9fh/dvetCVVoGo7So/xPY3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OxNOUIG+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxNOUIG+"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30229d5b229so6002431fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834211; x=1739439011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAC13CYCSM1LP7N2TeDcVK+j1mbZEQhsK8lcbic5FlM=;
        b=OxNOUIG+jXADCLJKP4P6wowQBrbW4U/BSzS4ME//2SNl39zdIkW/e5DAfRo29jsuu4
         gHVuoVlJiIRC1Ug6QM9FvE9FbdSWJhJczEoF/w7U9NW2kfMqCU8pWT8A3wYBJDtczRd8
         p6LicACJi7+eEt3nAj5+5bkBnsQeGseCWYwJhrXp15fO4OIQNGDQ/UR/wJwwzxV/i/PU
         Bz0Mu+enFvxMjHVWNgAQRULeusF8r2V1r87OLlSsWUyGtG1nk4FW+hC7KsRfLda5rUna
         FKWaOxKya3+x6nMJOhvYJh1j6qtkmsxuKdpo+39cFyetIwzh5v9JSVO7WvYN8ei7DVBT
         h/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834211; x=1739439011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAC13CYCSM1LP7N2TeDcVK+j1mbZEQhsK8lcbic5FlM=;
        b=W9UR8LbebWOTIS/A5dvayFwneu+c+qrtgZFidiuoCJY7P3MeqMYbIPM7H/KgD5aK4a
         K7DDmiPILVUgWm8YNLb4MY/qa4sCXrp7coqIb2fAIi+UOGx2vKOd8BfgZfpBF3QzEWzb
         xSeO2l7NDm8sR94+2PJQjLmcT19I/TKXx5ntAbGxQDjLLim8BoYjhiujeSQJKmjzmCbd
         t+oPqM2gbyEkXpbBAT8gwop3P0t/eA/j3KP4c/+3OneowudSIbwcVbi5JETS1WzxEsuW
         QIh6YTMyoZ5uDi5SiuzKDH5Oupw6Vm9i3/kQrM6UB8TT3bGvghVx/gRC/+/Pn+7btwr0
         I+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCW3mwj2pnVeivex/O5tlUC98dRNUIrlwXmeQiGdnRCDd6qiz0yQV51LTzrMhGDQzHcGNrXinhf2oWwbgxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp6uAAhV3HkiA0cBf7VIcYxKbCQxjEJeGsH2FwfjwvPzHrUgxI
	f+RPG/G4Rf5RtXD5a670qL2w/hDbC9vi2olHkiBTqpeLKLY3JOf98U3mIYQx1Orjn40rD/FSQS1
	awhtcI7Ssaq6kFwkqX4IzEF8RJsEJkfA7UYSpeQki9zK5IR7e
X-Gm-Gg: ASbGnctMQEBvBbGSCxs3fRcY2YGa2er+b8pjZKlXsfuwy3pGF9HdAZ1qyYQ3+saau17
	Av36xIs4goujWXVbsYVIrRijDeX+JLZDf4LiTdrPR3JGWYXyPiv57+ypytVADavcQSRm2DrI=
X-Google-Smtp-Source: AGHT+IGCbK5+XwCvq93+VgFVenxmOMdhIuSf3XKRCy/oPksbUb9k5UbqbrA68zfdY7TzalRQv/7sFEWCNRM17b/N9ow=
X-Received: by 2002:a05:651c:2204:b0:300:1dbd:b252 with SMTP id
 38308e7fff4ca-307cf2ecab4mr19091371fa.7.1738834211024; Thu, 06 Feb 2025
 01:30:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129020048.245529-1-linux@treblig.org>
In-Reply-To: <20250129020048.245529-1-linux@treblig.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:30:00 +0100
X-Gm-Features: AWEUYZl5g2Z6K7OUBqy6qoL7Spv6SuqCSicSmBmwEYZK1dgCVgMzmZnyxigQlWw
Message-ID: <CACRpkda=jnUV+N_UCdh_c1mKboaxkK25UPTc0XyrUXNNX_EOug@mail.gmail.com>
Subject: Re: [PATCH] serial: mctrl_gpio: Remove unused mctrl_gpio_free
To: linux@treblig.org
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, brgl@bgdev.pl, 
	corbet@lwn.net, linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 3:00=E2=80=AFAM <linux@treblig.org> wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> mctrl_gpio_free() was added in 2014 by
> commit 84130aace839 ("tty/serial: Add GPIOLIB helpers for controlling
> modem lines")
>
> It does have a comment saying:
>   '- * Normally, this function will not be called, as the GPIOs will
>    - * be disposed of by the resource management code.'
>
> indeed, it doesn't seem to have been used since it was added.
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Looks correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
