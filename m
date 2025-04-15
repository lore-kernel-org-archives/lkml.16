Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F9A27584E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701717; cv=none; b=bx8rMp+Ek81CqZk3GwA4wPEh7yhdpwDuxqxaNAt/1lQBzu6S8OOvuvKBWxcYxvwbjUwdxcHIAo0Y6IsudhBZWLPN4T+pxrXoRvHtMAc4JuS+kLviKK+L//yRneaOZVyIzJ/3As40a0BQcHYHLfr9D4zSix+vQ2sTJyg1dR9uthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701717; c=relaxed/simple;
	bh=eFsTWyuxYY/YuxE/bwNDIbnXBjWIwIeYCmpXbUubXmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hp7R4YELChzBrf50WeKG60vVH44OReeWVsifFr3vpRgBTc9psEBrqZCG3Y3YsEmO7EJtF5xIWomQel31+Y8ogLKnBypo5tR1EQhVOv5EEX7qWJE4Hg1wesGSvJCWJhI0XoYW10HeTsxvInbFP/V+0BI/BvF7nA0k9Ucq+mS/eNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAOzSlQD; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAOzSlQD"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d42884842so402817e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701713; x=1745306513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFsTWyuxYY/YuxE/bwNDIbnXBjWIwIeYCmpXbUubXmE=;
        b=QAOzSlQDqzYo67M8m9edNPe6vccMaKB1g6ksymGQJ3FTE1+kEmYXPNO3eQOc9yBS6a
         CXu1MD5OZFy1b7gcdedNE81uwqhj3ZbLdT4uS0+XOoAsRP0ZZlPkwS3DetcNTk2GLfuX
         KzY0sweVqJceSqvnRGs3CUOKdBDCIu9E2zZB84OfNcg0YbNcS9NbTE0CQNjzJcCG8Y5X
         9gaTlkQyocHZWoSmIak0rvs7wlRr4063mncdnCI1PBrpxdXqVWMvLIggANOHiMFPhNiK
         Y9sqaYYwVcdjQRqww5YlG76YKL3e6fmqGAgZ+tsXyfIB8ldIA86i0c9ZitOMzJ84yPIf
         +gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701713; x=1745306513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFsTWyuxYY/YuxE/bwNDIbnXBjWIwIeYCmpXbUubXmE=;
        b=REEdbNKlxl8kIdfdlaOr/zx8IFfE+WdzdbVcbJ9m2J+Zo+T2GICV0agrpQUy/qEjBV
         waPeJFS41GfZcNLpi7uQAkpSutRaCPIL8cipyYDHD/GwOLunGIWEJ4JyUwR7daTgONyf
         UmOOavT1dtcW5iiEDfNt6upy8GSC7Ilffy+WF873tVvogk/YnsuK1dOgl/eJ7b5DzEvF
         BYQD1HM/Jsa0c408iR+wI4io5UKvB0cerfv3WjIrgYT1diCcTGgOf5dgYaRyErDkobG9
         fpa6K2KEv41p4UvnRrqByfzWqKX9s850N2ZQXJWBszEex58p4AoeBgqWfb8YPSaPxzW+
         frgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5LqqLkVc3FS/XfezdHzyeANwYcXsJreAm6ZI4OAO0yN8Zu0O3r+gPdMX6NCvsibiKraJtfmIpiZCKnx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/0IoZfC9zd+O+ZyHGlwHJa6lf5L8M8aeEs2LC4v8c+g+VFQIf
	+/dw72lNqmSVs0MoiipFZ8CAwRcwvsNNWPAuCNHNdwAQJ0j6WwCk4yVXjmAsiWwTsDbMSQhlnsg
	jP1giFdHJAVrnX6Bai5Mr4vtZ37URwZGIuO4fGQ==
X-Gm-Gg: ASbGnctOSDVYozqHPGs7y2L9ct9kdT6LniLued1vxRFi8qyFuWgseNlfJOH1wVqnA05
	j8ki8O+6+HHgQuWPjsbWexG11+MTQ82g9qntaMpTZy6QSaHKJRHPJwfj3xaRKUCq0ryZzNy/VOT
	HygXX6GWQJk4+TOPGs0XpmFg==
X-Google-Smtp-Source: AGHT+IFw6QC29o6y83Ew4gV1rrLV7OzOu0H71UYaa/kxGSsVv/o9K3r8vj3ssSpN67/x7bdfuOhN2dAXxRaPJ5uBNbA=
X-Received: by 2002:a2e:bc01:0:b0:30b:fd7a:22e9 with SMTP id
 38308e7fff4ca-310499fb07amr37295851fa.13.1744701713410; Tue, 15 Apr 2025
 00:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8cb9c8b1-3ce2-4a2a-93ba-a38ee66a1643@emailsignatures365.codetwo.com>
 <20250314151803.28903-1-mike.looijmans@topic.nl>
In-Reply-To: <20250314151803.28903-1-mike.looijmans@topic.nl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:21:42 +0200
X-Gm-Features: ATxdqUGQOzCo07rUGS7fbuGaKRtUvt7ykk_FyjbaWn1yBc1ggDHONN9md_suB58
Message-ID: <CACRpkdYLDLM603DHJvkMbDRo8pVZZfB6DT+ck4070zVAB4SCBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl-mcp23s08: Reset all pins to input at probe
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Mastykin <mastichi@gmail.com>, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
	Arturas Moskvinas <arturas.moskvinas@gmail.com>, Andreas Kaessens <akaessens@gmail.com>, 
	Radim Pavlik <radim.pavlik@tbs-biometrics.com>, 
	Thomas Preston <thomas.preston@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 4:18=E2=80=AFPM Mike Looijmans <mike.looijmans@topi=
c.nl> wrote:


> At startup, the driver just assumes that all registers have their
> default values. But after a soft reset, the chip will just be in the
> state it was, and some pins may have been configured as outputs. Any
> modification of the output register will cause these pins to be driven
> low, which leads to unexpected/unwanted effects. To prevent this from
> happening, set the chip's IO configuration register to a known safe
> mode (all inputs) before toggling any other bits.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

Patch tentatively applied for v6.16.

CC to some mcp23s08 users so they can check it out.

Yours,
Linus Walleij
