Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D619049B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715324; cv=none; b=rXf6Pbu8XARQG0v+MG0n4NncqO4KwcRb0YLIeLioIt2DYi3iXQsPnPwFTGMjKtgRDV4CkTIG1F0nrHlxqPrXaSntIff83X2RfT1qOjWsDjeiW+gua4EHYfN5vXUwiyV6d7wyiARfZ6LvJSXZVIvVstWySzX9sH/nP/8f3dAZyUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715324; c=relaxed/simple;
	bh=4bYjjF2yI77Na1nfsIj+g4X8U6tLp5T8SWhZcd9HNQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJK0ru+k6Wb0r75OUxFRUUarzOcsouG1MpkfLUSRi8S6bnGMH+JzmWzIjxAHyiY6dKZFz6Ee75wT0uiN/OGH76+ermiwqFVPzVnU6utg09koX7fNsAtuoHSoZ9UC4ycnre+tZnu9DFlDQ+yuuLgePLtAoDJQvj1MBXB0mcD/wCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C87dIOdB; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C87dIOdB"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b43846e8cso38708101fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750715321; x=1751320121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnU+QVcxCYxEYL6PbzPZLje0addWyJna8P/l/C/lVg0=;
        b=C87dIOdBKEHiRR4ASB6zeIVNydIg4vXXMHRB2eSnxdu6Xmg1YM/ZB/XV/UH+dnKX8y
         Fa+b0QGkAGRh+BY03nBCQroT2iyjAqOBatlfLU4iPmVgRCxFa/9urbBVLAATmI7pYCVy
         ArFGjm94IyXezHc0arYfoG1Gjzg4bKRyE06HKJs6zOg+4HDa0QY8Q8QpKaiUOk9EvkWE
         6JcQVmglXz8LjQTt34uShPjORshpZIgvpnOomAPhtvLG5aapyx+Mf7SBNwAWNNSCSiJv
         t337DfPivHq8AUIHLn9UaItSg7/ad9v8Xjm+8zR+vF2CnOkKYia72VUSzCfjHk/trSOH
         h2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750715321; x=1751320121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnU+QVcxCYxEYL6PbzPZLje0addWyJna8P/l/C/lVg0=;
        b=Uyp16CzDjok+P6mPI/3z4z6xFol0YMoNhInj7Rzu91di9JAt7ZrTgMUh+fAZeET1DI
         2mY3T0qMMaBYCs+zVSmp+Fr7JSpqAPxM1mkMWhY5B25NcswHfTo04PqGhvWWfAI7ecID
         NSTx+I0YgJhpecuEJEPDN3mwzJoU7kRTeLqfNTrw/RsgphRiS+ISEPHGiZgVIuvFhGh4
         3kXnu4VVYnTD8+Ohq/bGF+4cZPF5attOUDqirE6/UxNbNNP7ee0JcA9MfrZWKYdHSRZp
         Dw7lM3rXyq2AWdUHrFMduhDr5lXsa1yb9kpFkl96SyVZQ0LoPTk9OHPTpA6Vei6VQMpe
         GusQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCXl9jUOxjT66QXYys+MhCuwwLVRknCofFssnatfgQ3Or/nOUQZFySyamDr9UzEjCdJ9xZ3uo4ILGlHIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwCwK3fX5rQegqE/WBWEzJPa1UUAk2gk+tde4kOFGscAjq9KFz
	N7Go+6/H0ZxOL6e3iurmIJ9CGF35KsP7hEYix0x7MwopSZ1LuE7FIvRrB0XlyIeEyJhXzB5+Nge
	+Kxw2NwGfUkVbl7T3qQZBWD45bUFU0Wq7FgF5GCiMR5zxXgpzrdgleLA=
X-Gm-Gg: ASbGnctzlhzyWjmxJpXut4thCbE655jLnyJXvSuLim6/yoneAQ9z2Dj5SWb/yyBg+aO
	Z9ZL6cFIjNyr/c5CkLQkq49d7yKG9dxdgt9CvQm+TB0RrYlsXKeUeD9776RTlJAWp67MAicOjrF
	Xnt7ED2uyYTaA8wv8rS531I7WICDi3311QtsPp2m+fbZDI
X-Google-Smtp-Source: AGHT+IFEqza0DpEdoJWsbOSXs+4vZVjClIQT5f7IxRB12yNjDJQmhlzB577QjPcTEosoLth3err0U0r4QBcPWJHQ7Rk=
X-Received: by 2002:a05:651c:1a0c:b0:32a:8c12:babf with SMTP id
 38308e7fff4ca-32b9918b02fmr47960381fa.2.1750715320985; Mon, 23 Jun 2025
 14:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-0-0766f6297430@baylibre.com>
 <20250620-iio-adc-ad7173-add-spi-offload-support-v1-2-0766f6297430@baylibre.com>
 <aFj5eEvn2uw_HSl0@smile.fi.intel.com>
In-Reply-To: <aFj5eEvn2uw_HSl0@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 23 Jun 2025 15:48:30 -0600
X-Gm-Features: AX0GCFtsL-oycWVZVWTYTg3bjp_VLHo3OYdhTaf-OnhrFfyHZtM-ORpccSVZDA0
Message-ID: <CAMknhBHuJY=8rxgJsMhvRNxZskmPhEZc1jJMQnHzQHFFoucWRA@mail.gmail.com>
Subject: Re: [PATCH 2/9] iio: adc: ad_sigma_delta: use u8 instead of uint8_t
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 12:51=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Jun 20, 2025 at 05:20:08PM -0500, David Lechner wrote:
> > Replace uint8_t with u8 in the ad_sigma_delta driver.
> >
> > Technically, uint8_t comes from the C standard library, while u8 is a
> > Linux kernel type. Since we don't use the C standard library in the
> > kernel, we should use the kernel types instead.
>
> ...
>
> >       unsigned int reset_length =3D sigma_delta->info->num_resetclks;
> > -     uint8_t *buf;
> > +     u8 *buf;
> >       unsigned int size;
> >       int ret;
>
> Wondering if in the cases like this we may make it to be reversed xmas tr=
ee.

Fine with me as long as Jonathan doesn't mind the noise since it looks
like I will be doing a v2 anyway.

>
>         unsigned int reset_length =3D sigma_delta->info->num_resetclks;
>         unsigned int size;
>         u8 *buf;
>         int ret;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
