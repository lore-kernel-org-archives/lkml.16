Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF100288C22
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617320; cv=none; b=BC1b9X875T7I3hru1GDk0/CvRDX6ItZ1BU7B8O5z8WXid3ixGZ30ZNeRehFXeXr//2P622RPomFThv7fZhtPvAKPwhqWMQj36MrZI+u8AGcq10EF8s13GtahRTzNaNxf23YonjkRePT5jztV2goKSgulutFxoDOYP3W/Fvu+nCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617320; c=relaxed/simple;
	bh=BqF93+TAjohew7xEc+xhLbJwBdMg2ZtKZkD6/ZYDjFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0g/znrUS2K8by2IcdqP+VqA/R1oOvDRS1ykQm2PJSEDGoAL28aKQnMI2aWl1MfhupuSztBuqh1c8zEyg/pcFWp4lI9cpQQqor0a2yV5AQQqXObMzHGWGx3Y/PrqWv809jk6vABD3QXbdvv/i6Ftxr80GF3CMQ/wvmlslES9U8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZUJqo3K; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZUJqo3K"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553bcf41440so829556e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751617317; x=1752222117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqF93+TAjohew7xEc+xhLbJwBdMg2ZtKZkD6/ZYDjFY=;
        b=GZUJqo3KLL8gYQ3Rb6umJI92QObJm/vnWe2jXRA7jwBFz5IeUq0EpdAtGvYNU28gBP
         6HoQvx38Rllu9bZRErlOzyx+5c7PiMng4T1OjdhoGZuhUR7ZuUqVVNPjk88OD4cuGgZb
         9uxGXyV7Ui3H35ReYfqENPx798Fygmo698V0AUGd7TKFPnKWyit6BKheOklo7hvFHJdO
         sZYshB7gnl6/y1PRtCNT5D6UQL520Rsbalz4lCDia58eC7cyxSvDVI6UEgHjj+ugrIX9
         21D5mTdsLnOU6RWa+u12Vs92UFAU0b6XzToJ1tKvMspuOiQ0vVPSL5nAARUX5/8kaExw
         1tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617317; x=1752222117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqF93+TAjohew7xEc+xhLbJwBdMg2ZtKZkD6/ZYDjFY=;
        b=qXMlddZZPn1Rbf5bAISFEaD3OU+po8DQdV6UJ6xookIBbnWjQbUKtih37XTwNCzsGl
         109Mz6PGf/t1fa5heGRl1qYICoBnfSCSPISEf7G1U90LOzkd9pgVty8lUk/37Lr0J/CT
         5B6f4jYETXEaDGHOfnOpSK3+cAI/rutZZOy5ZrEsn5IAaa9E3HZLzuCJvRay78XLWn01
         ULfZvyCh7ehAF8CaQVI5ok2Kwh2L2oiSnN0oTKz69sTdJAmPu3vvzKbatOP4TkUTlEZm
         fkf5nfcYpz2L3XsqMBYc0gbh+nqF0/lZ+/mihf3bLo2rS28aZV1EI1L78XIsLzCOPMvX
         u3ww==
X-Forwarded-Encrypted: i=1; AJvYcCVaenSdfK4pmMPvCiK5PJMLTDnXUU9gP/KJXsW2TDfLzgdv7wn7e/F30bA2Ps+0K8MomSTJZifA4tW5c30=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCXEDheOFh3TPovJdR6M6HRUsxZotF62y/2cyqTqMOvEVKMUWX
	egRTl0fPM3l5j1HztRbxVzqhG8bGybIFfC3iM9f2iqLVbsCqjDs0CpuDqNpyk/DcPb82U6IPH2/
	W4+8R3AkG4YYY01BbTduwYziDImVM9ViNDZe+eH9tVw==
X-Gm-Gg: ASbGncuTNEQwPszwooK9YJTISZ00yz2Hiy2vroGyVk0VG7VyZMf3jOnlGYanvTb7OxU
	IGMegN0K+kEq8lEW5OOTecdn8lu4Hh70TgTAF2lWen6055tXmDALe9JybNG4NX/emjtbgrl/Uro
	1E7SOKN2YktulcymsM/8Qz5mGR0hX4ti0XJKkxnaFiCfg=
X-Google-Smtp-Source: AGHT+IGFwOhG8+m1BfQFADC0UUWHtQFbQV44vnBFvtrzNfXOTMJLGYBZ3rW0/F4C4PngHF/NaTUtYXRmX+TsiW/pxqQ=
X-Received: by 2002:a05:6512:110d:b0:554:fa07:c56 with SMTP id
 2adb3069b0e04-556f1f62fbamr490777e87.26.1751617316841; Fri, 04 Jul 2025
 01:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com> <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
 <aGUeRczCNJLg-KON@smile.fi.intel.com> <CAMRc=MexjmozQ+vkLz1L4_Vfb+aqqwNSxKtNVA7zb-=r5eCMQw@mail.gmail.com>
In-Reply-To: <CAMRc=MexjmozQ+vkLz1L4_Vfb+aqqwNSxKtNVA7zb-=r5eCMQw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:21:45 +0200
X-Gm-Features: Ac12FXyekbDQxpchxSNlzOVJJqHOd-HyTMawzBiFpK1wdDITbhXtGu3_5sBoCBw
Message-ID: <CACRpkdYD5nT=f-uCARniUvBScu2gA+oY7ALgjYrdX-T_XRxEVg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Kent Gibson <warthog618@gmail.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> Whatever your opinion on this is - if user-space wants to keep the
> interface, then we need to support it. We can only propose
> alternatives and hope the users will switch. Please read the
> discussion, it explains why people want to keep using the simple sysfs
> ABI and why those specific users will most likely never switch to the
> character device. At this point a bigger concern to me is the global
> GPIO numberspace, not the existence of the sysfs class as such.

I agree with Bart here, the global GPIO numberspace is the big
problem we need to get rid of, if we move users over to the new
sysfs ABI and disable and finally delete the old one, we can get
rid of the global GPIO numberspace.

This will be needed to conclude the work inside the kernel do
move everyone and their dog over to using GPIO descriptors
instead of numbers.

We would maybe be able to delete <linux/gpio.h> but without
also getting rid of the global numberspace it will feel very
incomplete.

Yours,
Linus Walleij
