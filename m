Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B01A2417C8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703296; cv=none; b=YYVMNfIPs8G19aNtYEGEl0d0rnRYE7QmSYW6zWmMUGT6CpArGOz0PxLrESKSHI0LzmbkCvKbTkjtvzIE+8MWUsRU2es05g80BEdqgnLJCk5goWlLv3yNsgCMBmPWW3Zsl/oGiisc9tCz0645e2Yj18m2inq1zBKwBCBLjhR0WTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703296; c=relaxed/simple;
	bh=WDqE3ZdpGrwEFvKaxNwZCihWc5F/am4cZdY0BZmxrg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFJHeMitwvnrOVH7dXSYZbRGw0CH03h32lW4LoF5XH5ykF97DscR7lVeImtTN3vH3JWhsHoXjW+ZOR7pSfqxQ5r9p/FTHv0YZhcw4IFKsHfOJS33F3qArNl6hYfQ6v8/uc4IwcqaQEflchUPcCuz49uFIKiOS7co4lg4WvUWkDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UDIReWPX; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UDIReWPX"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54acc04516fso4996833e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703293; x=1745308093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDqE3ZdpGrwEFvKaxNwZCihWc5F/am4cZdY0BZmxrg8=;
        b=UDIReWPXFfI9E0ssUknh1/3g7xsPoW2Iu5emOHLRspIUWKyddeazTeBU3vNIt5SsTL
         nL0oDYaHT4z9So6i88oX/58BPVR71MqATQ/Fx3pvRJrBmbT7mrZuB0acU2qVyH9jEhag
         NusyaPoHgKa+VEaHoVaCE1xbdSmqpGorSWNY/J13exIlpF9i4ufSpPmGKZ3voHEgJHcd
         YUtspxeel5HoRwJM1C63ZNvQL+hoi/VgXKoGq5uwVOxxZM/50CsCWL7Na64nfPZQZil+
         n5fKg4NX/+mu0xRt1ewICDzUuQCAALp4++NdaCqW6FvzeApVct4hGswz9yLczAnJoANG
         mnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703293; x=1745308093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDqE3ZdpGrwEFvKaxNwZCihWc5F/am4cZdY0BZmxrg8=;
        b=vb/I6KLyv2NtrsRet5Ig+p4thgNvFAKqX5YkL6fuFGbwrpPSIoje0JF+p8xU2HK/Dv
         3q2zELQp2MzzWMge75bS9Vlj/CzXMHQL4bYWv8OLji6GBlLA+qYYnCczFQve4hcWxEXK
         eBzLP5jP6N9ek5swQU0T7CRSWnA6NGlP0AH7LFCFTBAdRBuWsOKKTSYsuZ6WQvtLVHGI
         tH8zD2BXyuxwpS2s1LdzN+vgm4u0kiVLQ8eB6RdZ7ngcq126vuAUemAQF2vKsvarqgpR
         +auVVkY0DOECRodKW2E5Ru5UXgdoUoRkYBk+C62K+3NmjyfxBx06hEf1LssUI8qXJ7tZ
         FTJg==
X-Forwarded-Encrypted: i=1; AJvYcCXUx51CiSszslwjB2VeRm68AxzRscjz4OiiEc2Dut371Ksg6/PQ4dv2rQ6wlAE/6AbjuptYfQrjbWIs0dA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQuNlA0v3E6IkeiPlW/DKbEyupABWA7Rzn4NtAmLhxQuH2NqMx
	GEEyT0ZfW4ZD9kdW5nyjZfq8aMzzgGic94VoTMjtcu8NqJvto7TkvmZ5g76F8BbGmPOWnVUR8nf
	kshlF0EcsrXz/hnIwjZynh8C3XfGL0huQl+0dBQ==
X-Gm-Gg: ASbGnct8msNJvAZwuDA7whjyBRuCH8OERAtaArTSbdpUcLHBuXy7Shg2sReCHlS+NlG
	3du0GhKkCtpc5d8vuHiCWLIHoHACfAHvGK5ndJmvC9VqbIxGOZhsrEWojTtOMGSjqEjz++JZI9G
	cD8951l0sg8JRQ3eFsjlEGMA==
X-Google-Smtp-Source: AGHT+IFby36R+QGppxoSzbZCjMCamLL2J2djIjQfwLtsJH1weaTQ78Om7gEcgpbdZzAsB23OqHqRE0OJYLAWIGrBLG4=
X-Received: by 2002:a05:6512:398d:b0:549:48c6:2a9a with SMTP id
 2adb3069b0e04-54d452ca0f3mr4196820e87.40.1744703292632; Tue, 15 Apr 2025
 00:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:48:00 +0200
X-Gm-Features: ATxdqUEhHhTQTxPlC1zh833yjXc_zv64fmsQYIEONqwjdaMf0Kb9zmn31Y6MG6w
Message-ID: <CACRpkdbSouYkMHvuVoAeFUiqTVvZwN1thzuewqWYUYMuRGYuBA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: define the pull up/down resistor value as
 60 kOhm
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 8:01=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The public datasheets of the following Amlogic SoCs describe a typical
> resistor value for the built-in pull up/down resistor:
> - Meson8/8b/8m2: not documented
> - GXBB (S905): 60 kOhm
> - GXL (S905X): 60 kOhm
> - GXM (S912): 60 kOhm
> - G12B (S922X): 60 kOhm
> - SM1 (S905D3): 60 kOhm
>
> The public G12B and SM1 datasheets additionally state min and max
> values:
> - min value: 50 kOhm for both, pull-up and pull-down
> - max value for the pull-up: 70 kOhm
> - max value for the pull-down: 130 kOhm
>
> Use 60 kOhm in the pinctrl-meson driver as well so it's shown in the
> debugfs output. It may not be accurate for Meson8/8b/8m2 but in reality
> 60 kOhm is closer to the actual value than 1 Ohm.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied for fixes!

Yours,
Linus Walleij
