Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1F245025
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739506; cv=none; b=PCAsEQp/jc2veku/CsZHqu2s8f7L8vKO1UWTwcXE/nNY8lV73go5at54IhC1NxZW5zCzSEq0dF7GIuYiljoWCDH/a71Dx01YzMZrYu4PPyyNaOTQ7jEYSHuxign9YPT2riJFDdE6CgViEcp6K6yUB03j2YkPIqh/o2xs5i5ad9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739506; c=relaxed/simple;
	bh=wudRz7/AQO9EHZhb5YXMaPRFMRyJ84p5SKMJ9sMIwcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twGT5CZeTnbjBCuyoGlfVi6FnR5VdJyI8uy7nR6bc66MFF521rjhhdPH/KTIHINMysvi4Y/lR22vEIU2ym2Amr9vo8dEnkCbkGYtqh/SoA5LT+dMYlMSLWHKMQ6mNPfokgtIWUs6sde1B0iyhrvQFxTr/6z/sWdYYNQbKJfNkpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYAwnUYj; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYAwnUYj"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfed67e08so39480561fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745739502; x=1746344302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wudRz7/AQO9EHZhb5YXMaPRFMRyJ84p5SKMJ9sMIwcI=;
        b=VYAwnUYjk9uUicZkz7iikK37f2/HhyQok9vMGQXpWm1sWYqlHlW/nG7qyHtjVbJJcQ
         IaPIW6x+iTefZ/bLbPtXA5aL6UC3UMLjg3YzyanMR4OvuhVNVp7oqOb32zvia0/eTM0r
         9AfteDjSIfmw00AZWmSI9IFdOuGZJrLkDQJaB5NHVR/Q5B8wxHQYPK0Gptf5GNp8qX69
         1lvgCS94r19s1/tDLlfn7tFvIHTsDhGm6COWvlqMtvuUYs2mS8w9VfZ8rR2W2i+YBF48
         Db9mfRYlvsb+9tF4DD5WLZFCv1OsZTo5gSfis9GGQXQIpQjUVZqobvw85L/KgvHnIYgQ
         gggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739502; x=1746344302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wudRz7/AQO9EHZhb5YXMaPRFMRyJ84p5SKMJ9sMIwcI=;
        b=CbE7NTheqko5UJtTvFUvtVIdWPyrispkTJQf3lqJEADNav32WuS0YUnoMHVZCYov4+
         bcUSv4YJgVigSe259uq2okzU4JxxBJHAXzegjOkBvQnep0T9Kq4DsPRIY7Uj70yhM4Mb
         66Q3z3PrgIzq+Mm+pw7AsFOCyW8qaw3n4TO95zyGq4+TA0nIzTuFvyfSrYqOcVyVd4ev
         14ZWpFR4JG2ZQx3nnMlNHwVlPdacF7MX6JeWu5PvJFy2NhK3M6g7MqHIqYYquXzgiA0l
         v4UUdOBJx5rzcpTU2mj7CGdAsPLKHKrbLpjbg6D5AX+nZbAQoyhP2a726kG5YdVJSlGN
         uAdA==
X-Forwarded-Encrypted: i=1; AJvYcCVdxd9BZBHoZAEf3qQggOfq4cECNm+C9Pf4i/oKzDWkV5kKvbvMsSo+h1qchgsewkMmE2mWYsfvslYrlyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoxGCGQbDDFWmJEgThlbz5DCqUWVposAvWBZVlqlrCywcjLJYv
	kDsMeRAaHeDfboumw8hYQUm7FE0Nb+4OFlMAxYXa45unuNX2+nrh7zQ1WTKnJQO9irD+8LsU6xF
	dFU3ElfME+zr1YEBH024nWC/Vg5ugCh8p3y87Og==
X-Gm-Gg: ASbGnctaLgxZflxhJ1aDq0uP+76+A5Fz+UfdJCb4i48akoNjut0euM3S6CTBqkGxXSc
	wn5CLMesMW3BOEqK8j2mba/7TjViJXa4FZynNDb93VrttNJnAb013W6lC9GFRNZ3FQhlVsJnBIX
	YUnUUnMq58Te6eN6tfpcRqXDnBRik8cQ4I
X-Google-Smtp-Source: AGHT+IE0s6Y/2DxO2oROrDBBRGXlGGPZtUWHEiRyI3o907MEd15+YOXjnMQoNhz24D3InZPz100+EiGjxCAdswEVKq8=
X-Received: by 2002:a05:651c:30d6:b0:300:5c57:526b with SMTP id
 38308e7fff4ca-319dc020492mr13207661fa.11.1745739502282; Sun, 27 Apr 2025
 00:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427055020.176099-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250427055020.176099-1-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 27 Apr 2025 09:38:11 +0200
X-Gm-Features: ATxdqUEN0tZTG3EpwyOmhaizHZmLuZi7m9-yOjcb6bOSaW1uiAGqfGaE8fOVGtQ
Message-ID: <CACRpkdbn_B6QumJ6k1+jXDp-EXSD2CVKArWVMawUVTxPdroZUA@mail.gmail.com>
Subject: Re: [PATCH RESEND] ASoC: codec: sma1307: Remove including of_gpio.h
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: kiseok.jo@irondevice.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, brgl@bgdev.pl, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 7:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated. And there is no user in this driver
> using API in of_gpio.h, so remove it.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
