Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB621B9D6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629724; cv=none; b=nkfmcx9X1dZ8Sb6pjX4RSVkDUmnzVD6DvsJ/smIT9rB4p0/GtHLTgV6egoekJt+6ADkrG10owaMXsuzL33tXkpfKDdqj+gdQNIiKD/johr7MzQj/v5oGzPObUoT85Iupqti9niy1iST2nqtYDjf5SP+/5BqHeF/ENNb6olCm8HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629724; c=relaxed/simple;
	bh=HrK+fjXuNMTzaspbfpBJkL5+ySGJqLECAndyoYw4+FI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZ5uOWAberhHeDDqCxC3I8wVnqMW3ZUQJXas5svBO5pC6LUNEpyKBx99ClEHwfilWhSiXTR929qerZOBQKH5JDNty0+s3FMZLbAHmxThUzIZOwwxfKCTzvPs8tkzGvZJHyX+GZ7OAaGjW0txUBsav5ASlg1KcLKPkXUH6Nuocbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDRZqO4C; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDRZqO4C"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5532f9ac219so7338857e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629720; x=1750234520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrK+fjXuNMTzaspbfpBJkL5+ySGJqLECAndyoYw4+FI=;
        b=DDRZqO4CiP6+iw1QjA/n0pien15XMCJPfU44/gPw8Cj+73JB5xUv3TwKqJaOhDaQZF
         KNctPy5+8y1VY9cEc+dHU975CWNYfm+VW8DQhGpkRGa9byfvvhOM/3WX3xebbslreFTx
         pShuwY2ABRucJj06pDmYTOViQbGna9sAl7Dlz8fFQqdk4ljeS2t3hkg3+au+7Hjatfg2
         GRdey2xlvQANzXzG4GTvMdHiC2AlkqIB+rMxJFx0I8DWWMor0jqrGwGlcr2QlF9vjU/t
         s6uh9uxtjK5HSFPrJyn4ah3iu56IVIfUANCjD2XsZ2QX2bGxf6YR4hy4LvVkcoa7zQXg
         9v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629720; x=1750234520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrK+fjXuNMTzaspbfpBJkL5+ySGJqLECAndyoYw4+FI=;
        b=e1gD83mvmLvNrJoZQqw4Gw9xvePsom01HqI6AODrT6cP8F2dCYQ+B9c9jn3HS/QQF8
         qR4pqfkNK6h2y+lFPQpxxfkbgdC/hlE+1T1Z5Se/jEphnxUs/mBG/Fu/RV2IfxigbKC3
         PVERHIUrqA/eKBGSm/dShtE/wAl3/MU10fnfG5NG+3jqT43ASyEqdpcyzMIvbIQbwN7f
         1jLLUrN5ZFN6mo1i9a4cuYAHjgcMaq9+GpRIHY6GyJlg1R94Nm4RzxR+dGKzpxCBzPVW
         6YZ1ymcm+sjSDVTIF9Uq84CkKyzOJRfhsbdw+FceOwqWlbn+KzudB5SigZDnV7qry1jD
         njdA==
X-Forwarded-Encrypted: i=1; AJvYcCV0VIWS+nEHD+gr597YNh33WDwTcHKXBXZ/KA4AKtp1afMldIGoi9mlx371ZUnygB+E55hs0EQEsBCw6RU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9IDCP8PVC63cEAPDjIImn8VQ4hkk5ajoKpJIfdVgyPfJFdEoA
	x4WcmsNrmwSpSqEQ43H+4V9Ly38zMb1oMDyGuFubO/hYNBngBf4XO4SLmgDs04h+BC+LIeQbHh4
	+UeVd16jdQZgL7Sn71fdeKCB4uPMYMXxDUCGMhvAocA==
X-Gm-Gg: ASbGncsCGRN/DZqjcCXy1Rgfz/NWGaBK6aHpNlQ79rXoWL/kNzsaz3dM8doTIb4wU+Q
	0p5I0IkCG/jhpBa17QGWn/stQsZW1u8ZoIfxgNBFEYof30f6ywlR9FJPQL2fUCK5BobG+BZ/Ull
	9NSC3+/RwEPwAEQGQUaut7M0ambtXSlTB+O1zH3TaMhbE=
X-Google-Smtp-Source: AGHT+IGR0Y/93VVyrH8AzUrFWp70nlSDqNruUFMm4UV7jm7BjftROqjtX30zSjJ4NBa9AEQATxZYP0Rwq1AxFIJy4b8=
X-Received: by 2002:a05:6512:3a95:b0:553:5d4a:1cdb with SMTP id
 2adb3069b0e04-5539c0ba692mr751444e87.5.1749629720259; Wed, 11 Jun 2025
 01:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-1-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-1-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:15:08 +0200
X-Gm-Features: AX0GCFt1XNmDQpiNmSvIlyyQmR0jxybKOgH-Yc_e-uNH-Qplwmkg_68xB-OSgLk
Message-ID: <CACRpkdY4p5wn==AWupxH-=j9a8RDZuR0+0UAVWkpPgJy6OdgWQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 01/15] Documentation: gpio: undocument removed behavior
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since commit 700cdf7ed00f ("gpio: sysfs: make the sysfs export behavior
> consistent"), named GPIO lines are no longer exported in sysfs as links
> named after the them. Drop the misleading bit from the ABI docs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
