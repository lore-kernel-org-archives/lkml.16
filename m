Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1972823E336
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793594; cv=none; b=jc99wB4onwzJolT4lZv+ag4U17OU8b6dEek4l3cjp9uOnIlEDo9GxT2ES0j/1ulpLkGgC29YDpJS1R9TbBp70m8ce3qHPHgiLKIW5DZf6MduWbu1/gDr3C6oZcyH4HzcGPGYwUl/PLomg+n9Q++tczdKbzEdY+KYicgvsIQbTLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793594; c=relaxed/simple;
	bh=+FJOqQLjKA3FPAz9/u6VSLqCQ/dFJns2Rrsa9m0Gy9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYAkU4hMmbnSzb1bUunKqmC3xA21qFp5virQ7etwsCJVfRHuFoGTBighNFLX4WFVryuhiHjLWF0PI0XRdEksUgeR5lY1U4yjmaIKGNdmRkR8Sm1jfXknQWLQ1dYbV3/hyye2ie+OYYYDa7G91o/8Jv2TvJi89x6rO9qNj/IKjcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wsa/htUH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wsa/htUH"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54d98aa5981so7774119e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793588; x=1751398388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FJOqQLjKA3FPAz9/u6VSLqCQ/dFJns2Rrsa9m0Gy9w=;
        b=wsa/htUHe9gSi9XPBGrBWNnjwlpKes/cqIlTI4N2hWACc3FNgXf1ko/ObhQ1c4xD4b
         hIZe0PkBOESMZyVu+ka9oNW5Mg3SdKYt+5LluAAVyNJDwdKaDRTzYgPdII+J0wUDzlhV
         3XPYS1vm7T1KZBKzJf4q+AQDiXLJVDZ5qutbWFRexrgi5JPD4Q7HzZLqoanLweq13tuc
         AxxAgyvBuabMgLm4Htr1YlRqdSPcPQhNfEd4wssclMbC591W48SNe9MAp4+mvZB66WGH
         d+ZyWifiP9tN+/pyuAsL56pmzV8MdQ3AQ/Oo5/ffgGCcbcD2URdoKUXH6xpu/HaD/ecu
         Le/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793588; x=1751398388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FJOqQLjKA3FPAz9/u6VSLqCQ/dFJns2Rrsa9m0Gy9w=;
        b=IVYpjPXJaZUt1gFGlBnQy6vqnUguR2vS8gbu+TOtZH8yAOk1A/UQ4x+Y/AmmUwSdXK
         uCK0WCySr3lAAaWg4/4i+80f4UCoZ7SnDtqqoR0I+x+LZ/T8VoeyIq5RySieaf/rB7rk
         6ArnmWjEPIL8fESHPX+3IQwHXWqqboLv97RucdfO8AH/QRdb/dcBLjTJa/U1fOU7dn12
         kCkX7JsmKuJLGUF4DaGfv5Fh96yYgPEzhEoMKZ9koJnAh251opVcSOb80/RWY8991QYu
         UM4S7c6mrzIaFRTn7moLcqUXeSjwEHUVAX4RGNPy4c7tHHOtt0WyeBOaXkvrB8LaY7+F
         ocJg==
X-Forwarded-Encrypted: i=1; AJvYcCUBcq/lSdVH2B9wvLIV/HiODfSa/T6OKfTNDsGP/WB7IyPLbJW2e+a7/aw5RfoxwtQJAFgD51ekCLaRUtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRC41ikcyXRmXzOPDXShfjYN+q5lqdAHb+1CL1EIqbQmePPyZ
	XnFAZhmAK9tWYcdL8HnwHnx+d/G4iZ4fAYGNPcbq15nEm6baP+33gALuLiE95ZJmMVwD5cq2F/i
	ljhBYrt3WuqF0LzW8UQsckCFTNDoUSO+toJbuvaBNRQ==
X-Gm-Gg: ASbGncucrwhOEPntzw6bwhsWBPDP/RWNU7Owri6LTe6Aru8DeNOQq7pZzGvEaNvGWP0
	IdDsAcz9k1Am0t7zrDdxyLPNgoa9qwnmpsJ0j4LislCLB2aU+fKTOIgRocp4tC6z4Z8lSgb0S5k
	0S0MNjGNzV2WWBJRNbmPoJsHnEd+hBebshFeTKESFQebk=
X-Google-Smtp-Source: AGHT+IGZ80jgQ5/QaQU6b52jWtgaL9I0ZMEDcbGeKLbU/YqRy3STTYOhxJTbm3ezdLgBlSaDRi5TUbGoCbNvvI8AGuQ=
X-Received: by 2002:a05:6512:10d2:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-554fdc6cc68mr54809e87.0.1750793588187; Tue, 24 Jun 2025
 12:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-3-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-3-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:32:55 +0200
X-Gm-Features: AX0GCFvObqqxUzSNF4PEsyFmzcRMOPhN1kQfNrt2apYQSOJRHnBBo_oA9pknBOE
Message-ID: <CACRpkdawmYNjWqeSnYNzdX6OB-avhBs1erydaW9zo2pa2ZB8hQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] gpio: sysfs: pass gpiod_data directly to internal
 GPIO sysfs functions
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
> To make the transition to not using dev_get_drvdata() across line
> callbacks for sysfs attributes, pass gpiod_data directly to
> gpio_sysfs_request_irq(), gpio_sysfs_free_irq() and
> gpio_sysfs_set_active_low() instead of having it wrapped in struct
> device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
