Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC412E613D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794324; cv=none; b=MgGhcOOq8Pz8lVUpa2UoYD0MliWozIYi/wiohx3j75aYBcjL0q2THZ75uX248BXrMVUBNHp2d3IQuXgIryYmNLNbZoIgEHrWYJFZQZwyArNwUJRso04im/ulklO3NXYJsZ7afujF25NTtrpo73aumHsA9yKImaEh+0LxClwbIaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794324; c=relaxed/simple;
	bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAYDVHAOxv410+ri5EjInco683jKykiNyMc9oJnUmiWBcxjJXKscxtY0xH4Ha4iecfjdhHu6GWjMLo2XE9BtfLuVXndsyInYqIDIuTrEZrreRJS5BDiMcyBN1imMqVJcQBFFWDsmn14oyJXvRSiB0XxjXsSZOUc5Z2te/FR4as8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hP/jpYyw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hP/jpYyw"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32aabfd3813so50313541fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794320; x=1751399120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=hP/jpYywfPh1JFB9YkQ1vVGg/+/Jg0mkwd74myvKZZ5kOqxrZlk74X8dd5v4JAWT+W
         +TYXXGddhgNvRRrlHEZfCtiWpzzVohLCJYSdrQv43nca7M7Y8hlHjkdIsEXKVEnNig9S
         g3Qxdegcxt2ZpMlqYqxX6wK6qsdDWi4sY8yYnjp9176ycdv/YCb/9ADGmM4Tv0ztjVoh
         eHxZm8FjnMw6nV8tUq0Wft+aCAM4N6QnenxX45+qPmgEJMwpEBuy9tkfduQyaNCz91dB
         BsOiOK9Nj1kxneUmoh+SGxn/EIivLF3v5Uqd0X7jJHYLmY4agFo6qcEyzO1G2SX93Uon
         Yk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794320; x=1751399120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=uhagbnTSlv+vmErmYD5vKZUvoIjoFFWptQSP7QbmzC6DjkFuARfQ/RpWgLZnvrvwKY
         s8MdncSEMYxL2dJk+NV4WvKV1VcncHCabp2vLZyMlYLSvVn/zvGtIQNbHHrhOyvxNcNV
         mahsqk3dWI1BcNBhuQT/o93+Fb4tukce1kl6GBx9b5qS8VXL6OFEJVXHqNuT04ervesv
         skjymxPb5js7EW75lJIOc6TDj3YduVYdzj6aEBdmFkKlK7Rx0kvZ4bAQVMBnIB1nTXp9
         SoBezcEJTucJvCMYto1jl8DCwaC22+O8v0SvDxkqnHxD8bpOhBnpPfoD0qxOKqb8QQsv
         WkNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi+uR8zgDqwmJ7Okq5H12tlJIJ49x1sXursPv36iLrkM/9zk0oBWhxBhFnfgfTwLC6JkBs8ChWzrWkZ3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwuWypNdEvzePSISwEhlEqPJ+0VN3kTA3jeQH8FbMIq6nNnPVa
	x8p4kTA9NSdCxUlTerfS+3NZz8hROhdH/S2/AVvNGqfEzlgQbR+OTeuO4KRmbK0zyw2LF3ArwUD
	MF79CDRb++jrD04fFzQ6YhCX4ASZTPORW0FDsR21/Vg==
X-Gm-Gg: ASbGnct2az5aIeV7vOqSQd6rkA+MhBXlEOurajb6IwA/UsJBrG/OUVt0tdOoEdiPkit
	R+GXv/OBArPMRNHAujWIgrhPswTUeiBsm7DMIhLRwkRJwROl7uwjJhMG6WRPBKaKyJ8FC4pufIM
	MJ7k2iWU8KJV6SqFGr49+6wsd+ChY2Rpknrb9V1R0pccs=
X-Google-Smtp-Source: AGHT+IGHrdlGkQUWphFDOu9KYoSs8Q372bw5fsoYgco33pNU9fbGTgKUqdcWmtZRyS8Ikc4JU9SHkbRiDX4irW201y0=
X-Received: by 2002:a05:6512:1396:b0:553:2bf7:77be with SMTP id
 2adb3069b0e04-554fdd0ba1dmr50743e87.22.1750794320312; Tue, 24 Jun 2025
 12:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:09 +0200
X-Gm-Features: AX0GCFu6Td3LW-_JOyLEYO7GYkA80dSGig80su6HVwjgXpS6hbnfvwIR-aklY7E
Message-ID: <CACRpkdahd=5cdjL4Je4_PqFmV8dkSuuuRLxdPB0n0-gyFKin4w@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Replace struct bgpio_pdata - that we plan to remove - with software
> nodes containing properties encoding the same values thatr can now be
> parsed by gpio-mmio.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
