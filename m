Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAEF2E889B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794407; cv=none; b=qQUXRs/u0kAr7coFKTxY6gbokGZk/SLJ4JeFbk6Xp9GiD98MNTGCTU7YF2tUgY0/AyJU0EM2Mp9auNlpG8xPgW19j+HF9vAGlocBzDJnwAr79kb2llr0WtIfUk7jLb9imkCc5y0fPNE9h39uvevpDN0Kp5u7mR96PkTke47P9rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794407; c=relaxed/simple;
	bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AidupOJWxB9soxUmpXzNEJO8FMlSNtcghkBUvNC45LRcWjDFBNFq/qC1H4BEEmfgozh3igJBi/TQFv1vd1I21K82JAjdqNQAv04aKDZ8exrkPMnprhetClnu5909Wqhx23dX/tv8CHA8pqAiqv5yKhJw1iz02i5eH05iTwBYhmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZK64ZpQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZK64ZpQ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553d52cb80dso248285e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794402; x=1751399202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=VZK64ZpQTEt9hL2LxW8l6wfKpbOHWR3TNjMgYRQTap1lD84dGIejNLJ9NU56lEA9sQ
         OY6YCr8BDg0/opw7Uu5vmWNmD9vGtbUP5Rzcuv2T5GZO2IMwggT2Uu0WpiTzWnBV+UMt
         MGou6zlqWylzILsmpc4yaS9mXK8up4RL2oeoHof18cN33eLXVg4DJkIxQhx1DJ+izAmz
         QHHFW2CPXhg4JdtfZntdB9UYrDOEHQnOr+vYupVvl3xWqE8H5K93AdAMOEMwQt6iJJ92
         R036d1iCOQeh6p2WTN7GRq660y685JFgbRizPKVNFM8YfOoegUuOdmifJYXhJzmnPcvs
         XPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794402; x=1751399202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=a9yuVuFjO6cMbNZNMVhKrDYtHsqo/jC32g94SPQVW1NTBirmTQytobGYOrnOogDWS/
         8ApIQu4wcHJUoeDpJJGwSS2S1uM+zokDTmHU+oUTYv8MwsoHyPfgkIdHtvNOvJV4Qos/
         Teu6CzyQmor+8N1jd1S2RAaai61CLVVKslzhG9D1gC1QEUro7uuUloz8IpYotY6a990i
         iub9Q9w/jW143oH34A0roXwfRr/gprnUgX1jDmu07eqAcRzbyXc2DmgtR5SwCM1i5R7M
         mC1Lec5m0JRTFACHNxrD04dheylVIsPeUeFPtlw8uUnpbdsvFCaeLUa+5In/pDtOUNmd
         50VA==
X-Forwarded-Encrypted: i=1; AJvYcCWKvP07VcalYWQ7xhVKr5+EPW3GYhlb2xyIuKaJtWErWInp9xNtQNO5mE7EufdOWgWR8u71aDwabVj3sks=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBiuHD1aWHlzHjWJRlyfknk0zsTHjS4XRI8CI0XnYS3L1NJDr
	DQ9tUQfwMrq4Z0kh3BC5Ufs+9C3xO8OYS9Yy/YvS2S21bq8O/Wi6aX+nFOD2ABVtCJssxYTMg+M
	o7/70skJlWQ87kXt6cyrmouVv0DBEFTzsfudi6VX9qw==
X-Gm-Gg: ASbGncsPmPFzCW3LOVMGYA6Ilb7jGfAhF/9+0qIlbdV8DoVvCYM2ViCzmlw4CRRUJlz
	QOvNTOXu09Z4rOUz9VT/kJN7zv/beRTWORgsckLMZVAZxgKfuuTvRopvFNk/1Wc3TrM5dZauVvl
	sFcwIRfcXfMIV6asZU8SY4WVmolrQJrM+V5sv7Sy40DaIkl9peWQpiQQ==
X-Google-Smtp-Source: AGHT+IHdpwQMLs1O1YXsE7OYJDSqDv174xvDSUigjOl1MX3lK4+jDay8aiOLOcZL8anmxuKl33tiqVeqknlI9Y/jdlg=
X-Received: by 2002:a05:6512:1114:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-554f5c85c83mr1548662e87.9.1750794402146; Tue, 24 Jun 2025
 12:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:46:31 +0200
X-Gm-Features: AX0GCFtNgkCX1W_AdlK11ZGEmJmRv7gODCrJ0s33UaorzXY8ZeRx0-2XaShZXAw
Message-ID: <CACRpkdZ0zsBCXLqdXKoY5Fyn835xqunesRLrAMxUu6ASWU7iBw@mail.gmail.com>
Subject: Re: [PATCH RFT 5/6] ARM: s3c: crag6410: use generic device properties
 for gpio-mmio
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
> The GPIO device in crag6410 is registered with struct bgpio_pdata passed
> as platform_data to the gpio-mmio driver. We want to remove the
> bgpio_pdata from the kernel and the gpio-mmio driver is now also able to
> get the relevant values from the software node. Set up device properties
> and switch to using platform_device_info to register the device as
> platform_add_devices() doesn't allow us to pass device properties to the
> driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
