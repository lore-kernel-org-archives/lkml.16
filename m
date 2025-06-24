Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265293074BB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793657; cv=none; b=UsL/6xaj02ARHUDM1MgSMe1n6PWJtUsv/a3oUrEVfGJ4YHuHvcElii1JtyGkD5FC+PvanraarYCpKZowSjJHQkRuMVDFz7NZLx+fFzG76sJ9ZjnH2U67nZXF6T8yWbOyg6vHtAkJnLGGKCUXBdWHdl7ZiyaAb5D7C+COYZhDYGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793657; c=relaxed/simple;
	bh=bU3KO1L0t1fcR/rV6xWKqb1UBI7JX/TLS2TMN1o0VCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZWTALkttNkKQrXBrL/5LZr++TCcQiQpQbqTYOjCoAwXC+OKsbVrPoV6mOrlh9Bmck+8HR7jeGGoJIR2bEBmjlAewRBYDzp8DUWPDvQ1aeMIXw5sllWJ73pPdLMQ4m9BEHn5PDC3L8gR5vpzM2EzcpTmAVkTEfnspeRuejRmlEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DCX4X74J; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCX4X74J"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553d52cb80dso238130e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793653; x=1751398453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU3KO1L0t1fcR/rV6xWKqb1UBI7JX/TLS2TMN1o0VCU=;
        b=DCX4X74JVMuAPITdgoKzQmqcHbzTiJdrEcpATelj5KGS13vHXMXT6Vw3CzalD+eD1y
         y3XkIjzGRvFEMzdV9ONk59F4F5dFR0A0SmK7/f9x/0udNVzZ0YMpxCNzTk3U1g6qD1aQ
         Y+zSpqX1T7N/bX7eh/o7a6w6En8/y4m+vz7tA25WAV0QwBSG6ZnIz9mfOQaQbQ38l5vX
         oOiNVgwoDIBnWEmpD3LWWzthbe1p/ApsYZJ1dtruXlK747BLQ8KD4YpiYRRhJEPwhJle
         TP9OtxjE06IbrSxcgOIIO0pkMCsN6Pskbo9GUAVgFeH92N2oNQzba6lWd49/RvudsMO5
         Sl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793653; x=1751398453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bU3KO1L0t1fcR/rV6xWKqb1UBI7JX/TLS2TMN1o0VCU=;
        b=m8HN0ZclDzoc4fRIYHqKUGJv92ApALzlJ9YcgCOovZ70uIzLCWySdETtz4o97RDYTY
         iWJ95H2mRSFGm3Pa/icsse6a3+PucwqOCQV2t9nDuQWmp+TxuFg162xx/iD6w5wUT8AP
         DN7Z/DZij1/11EL+z4SzicA/PKcghqhQ6iA8MAuXAYDfO0oiSwKcjdRB/H0hMkmsN3Jc
         moQkamBlTWlnKheSYV+Rkv1eYPjkx/eztZbvm51qD/cIcraxjciMLUhrOAdasBxd+Voh
         zr3iJXWzDkJFkpdYiu7h8HViw8feQ9wu4GGBIwZCPG7Bk80C8w9h1wsBuZRKlk7lEriv
         v6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW0GbxNMwhyckPYqgVRkk2Js3+79t4kysFZhNKaY92yKSIlAD21TQU6vZNO4x9TjP/AJYV2ncUNunkpy1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4sWEI40hchBwuru8k7oZQ4Mb54qoGPXyegna+N4IH6y+pCl1b
	sl5jUe8VY49jZ29XIDBf5DZ+eujt3q/+IHNTsxJWHzbpK2s1CJPGn93NWK1w0jT7VC1EUkrZW+3
	xwZyoqRQs5QWX8C1U8zXVWbBivwA8hCWZAsti9o95Xg==
X-Gm-Gg: ASbGncuBki3z18U5e0FqIv9cJRU9rfAgYWmcOiGkWheDtI0B0QQ9OqQE6Yi3HQ0ARaF
	1IoVf1LlGjk6ebAxYaKDWThDOg8I0up+kliv+qrNMHy6Bv6WnHTP9qGWD+js/Zq90XRmpM8Ap+1
	oHeDdc8UKFvgmP0yNsyGzyvXxZElPJiQfisAHtTe+M+28=
X-Google-Smtp-Source: AGHT+IHl7hPSnI5mX8RLNibKiwoqKczQwNlNs+Uj/iNiYleuZcULDBMvGvOcH9ObL5jer06JWd8Ot/gTWAhZUETFSzM=
X-Received: by 2002:a05:6512:3090:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-554f584ad60mr1619230e87.0.1750793653060; Tue, 24 Jun 2025
 12:34:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:34:01 +0200
X-Gm-Features: AX0GCFuC7Gn3GMNbMQvgOm08cDu6dLXLn4qFkj1zBDsWaRY0kXNKc5IjwKGbBM8
Message-ID: <CACRpkdZ4HeE2hEvzo4WQ0ASRyToHrZE4yXDcNS3Yox1tb806jA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] gpio: sysfs: rename the data variable in gpiod_(un)export()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> In preparation for future commits which will make use of descriptor AND
> GPIO-device data in the same functions rename the former from data to
> desc_data separately which will make future changes smaller and easier
> to read.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
