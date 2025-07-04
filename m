Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E25528030C;
	Fri,  4 Jul 2025 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614014; cv=none; b=jIgbN185bLEZoJL2dSiiT37BNMvK9KmRSL7tIxPvrDtZY+fB5D7eBiuiUL3N95PHnqFDsSe4cETEgREsgpE6Q0JunY1lCd6UDr6VITYrsQDOiKbpi8C+MpTc7dnxhGT9dFup3l3l1m5KpU8JdMY3Kx9/z7KRRTS/91IJDCu1fkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614014; c=relaxed/simple;
	bh=t+0bJUNlahtrSxCfD4FMqTrweoAS3ZJ2lbuKDDpRKxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZMbaO38raInWmVExhF5Hi9v9D6QlQdvY5os3XQT8pssSeCFd1/oJr7Z/a7U+UoNzljH2mJFcetDBIeB+XT5TRNLENAEXVfzahQiE+8S8NWrV0S79/AC6DDmC88RoDoUyCYLHhUV4/ItPM17AjjtNERaJIuMtkiIFuqloCzL2Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAFqxvNu; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAFqxvNu"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3137c20213cso809801a91.3;
        Fri, 04 Jul 2025 00:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751614012; x=1752218812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+0bJUNlahtrSxCfD4FMqTrweoAS3ZJ2lbuKDDpRKxI=;
        b=DAFqxvNuMuN+79HeVfCejrivK8GukVhaytU8zJFsG46f/wD32RGtWVvFAE0TlzF3Jo
         tE8/ra2bOXN4GP7RO1P4u9/pfGziXZj/BYnkldeyvDaGxh9T0wmc+bqXVfmegL0UR8b1
         9Bqp/9YQhNJT72QJWoAqqANHA7cLEhgO3UvWMtZdEpt5sfoV36lGSKUpUpuS/MQF3Wuv
         eK/29qvT95+jgguy1qcS1joVdC0LD9bImcKHZOEf6BSRAyHKhfm+wItIMSF3rPj+FLfX
         KAhl5oloAbDjT+i2AMVjZMjkx3bawmZkpQvHo0WeZ5O+OMmRKZ0o8OFQONCsJt3WMqQt
         NVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751614012; x=1752218812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+0bJUNlahtrSxCfD4FMqTrweoAS3ZJ2lbuKDDpRKxI=;
        b=DVdD325VYQ7VdWEcIrKKZ8q/s+9GqefeqqK9iFu9+rmSbsU8vPEEqTvSF0748kVCH7
         IvaKg35Kom9I2JQ1zfvJjAdevPO/8u5aHzL0PlrDB0YXtwVVOGtAB+FBdqWVizAJwed9
         r37CRMdh57Tnca9qckrEoA4f8wcP9MwxlYn6drLob0Pl0KMnQqKVhZcLuXYN659OtQNd
         GeLKUERvCJeCRqmDSPMRQr905jF1bjCah4bPloTYUWazeLreo1KGJu6SlLV02Ry1aDeb
         zbG2R/51Gq3Jj5rIkQr/HRvDs2MUzjGKcSzUJwoiWDUkL1VP9wO0lta9nF0LXsU2aME0
         NHcg==
X-Forwarded-Encrypted: i=1; AJvYcCUltjyCjWEKhaNjEjZKe0VYQLDqKk2093vhjFjEqqramR2y1dJoJxbmwzbMQ6qEct7wFZjpEk8QzxIO@vger.kernel.org, AJvYcCW0B0iuK0l/BGKS6sOs16XArYcNojPJwGB4WZyAIon1mj9ENS/qVSh++6xQFRrdMvfKH1Vyu/SfTqSN@vger.kernel.org, AJvYcCX4wl4ltWLcd2bxYsA5kK44+BBvgkWZ+Q4SNv/kTy4QbSRrCcsfjSa9m0Zg5DZPyc/aweY/dIV6B8val+wi@vger.kernel.org, AJvYcCXOex70C7/z+NNGl1IuGTygfD8M19EFLV/lhxsttSuf4H8M6HdMko3ExajFRmHxhWCBGhXbM1AWUe15oog=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9rvg6SJyACN+z5ZSuqqb4xoBDEyhpvqIfqynDmpD2XT+YLMs
	3qv+VhCMRa91fFB6N292/H+DwUTi6KrKGsWkYSaKvC/MHKBavXNW3p91q6dNNNfihu3JjYvTgnE
	Sh31YYWAFka0F5Ddv2qkIVH7a4iRP8Q9Ru8f2
X-Gm-Gg: ASbGncsr/rcwdatVrpuNDk6OhPE8kw2HyxXHgHsbw7c2MA+d1VovSVpkFU6kOrqtkRz
	721w5i24bnU5kEfRtrJmPBkHEjS2eSc9HG4auQzYy+3ueNvUbICyorZqt+Gj23hnbqLq+acbbZ0
	400SYOVCM6ZoYPPgqOMooij1ZDmUpn7Rgl5+5nn5UEGtUIo5eEYcFKi9cuLHBC9YO8sGMAVrL8o
	ihyjg==
X-Google-Smtp-Source: AGHT+IFhWPO75So0JsJk5GvG9MEgOBhEkjqe1mwiXh8Je1HsPLlngJc7tGWImUjVOV2FwTcNuKQACDCsf2QsaK9sX5g=
X-Received: by 2002:a17:90b:57c7:b0:311:ffe8:20e6 with SMTP id
 98e67ed59e1d1-31aac432932mr2344759a91.3.1751614012223; Fri, 04 Jul 2025
 00:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701181228.1196102-1-noltari@gmail.com> <20250701181228.1196102-4-noltari@gmail.com>
 <c893384d-4134-4510-be87-11a2c9ba6cc7@kernel.org> <CAKR-sGeSPHu5DiFL2sX=SdET_jzbepo30qguscUjzYkX-Aub0Q@mail.gmail.com>
 <9df1cc49-34bd-42d4-96dc-ec9b512e0c5f@roeck-us.net>
In-Reply-To: <9df1cc49-34bd-42d4-96dc-ec9b512e0c5f@roeck-us.net>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Fri, 4 Jul 2025 09:26:16 +0200
X-Gm-Features: Ac12FXzX3jVR20bs6VKEPdEkV6NWwrwg2tdBtAlWnbRzNtnDm1U4WYY1z9_R3y0
Message-ID: <CAKR-sGcLkihNKAQpPR6y3u2aCA6xmTd0mp2Ko15e3QZWrc4Dgg@mail.gmail.com>
Subject: Re: [PATCH] drivers: hwmon: add EMC2101 driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, jdelvare@suse.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

El vie, 4 jul 2025 a las 2:25, Guenter Roeck (<linux@roeck-us.net>) escribi=
=C3=B3:
>
> On Thu, Jul 03, 2025 at 09:23:41AM +0200, =C3=81lvaro Fern=C3=A1ndez Roja=
s wrote:
> > >
> > > Add a comment describing what you are protecting here. It looks so fa=
r
> > > like you could just use regmap and drop the mutex, but I didn't check
> > > thoroughly.
> >
> > The EMC2101 datasheet is explicit about the Look Up Table registers
> > (REG_FAN_LUT_TEMP and REG_FAN_LUT_SPEED) being RO if FAN_LUT_DISABLE
> > isn't set, so I believe that we need the mutex even if we switch to
> > regmap.
> > I will add an explanation with that in the next version.
> > Should I still switch the implementation to regmap considering that we
> > need a mutex?
> >
> What does r/w vs. r/o register access have to do with locking ?

FAN_LUT_DISABLE bit can be set or cleared when pwm_enable is modified,
but we need it to be set in order to be able to modify
REG_FAN_LUT_TEMP and REG_FAN_LUT_SPEED registers.
If FAN_LUT_DISABLE bit isn't set, any attempt to modify
REG_FAN_LUT_TEMP and REG_FAN_LUT_SPEED registers won't work because
they would be RO.
Therefore, we need a lock to ensure that FAN_LUT_DISABLE is kept while
modifying those registers.
Please, take a look at emc2101_pwm_enable_write() and
__pwm_auto_point_temp_store().

>
> Guenter

Best regards,
=C3=81lvaro.
