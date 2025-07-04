Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E7A3074AC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616603; cv=none; b=QlyS73BMvueEN6+PDyAUhw+sWYIHchEr8hpVkvXj9xX+D32QYCAEl0dugK6+HgXxmsTRYu2Wrz6R+z6NARTGnJNt++3PxdtnmJH3cCtaZGVDI8hr/ZKfxKdZJx1gyojr/lKd/piadCtN19GOIF4HiHPk+gct4fiSRFgqoq2fzzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616603; c=relaxed/simple;
	bh=SVTv3A04ZbfNzzCBC3M52V2FsbDet2cE5mKOx3BOEK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TV5tub+dNufPxLeKm3hiHe3XXQYCZqoVtzklPLg3TDlUVYflefg89KCFJrvBlvmd1bXcLpb9aM2VabhkYD3GcKA3xf5hPwYAfjUiYVcwQYAI/EjOBySaRkOGvLp8TuH8YlzShQ2glCD1/kl0JI/8AzKO+elIQ8+n17pEEj2dM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZf+qC+t; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZf+qC+t"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b9eb2299so1615740e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616600; x=1752221400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVTv3A04ZbfNzzCBC3M52V2FsbDet2cE5mKOx3BOEK8=;
        b=pZf+qC+tdfyz4RuuTVk4mOfcbG7+UO7k4PzwTkaepcRDG48lRpBelA/MMYpthiuuxK
         Po8uLmiOvFJ7HLXNNl/IlPe/ASrRQI7CgO09NpfyKsNTMoPKtoCJxb+STWdeIyPNQ8Mg
         1eln0KcoFh+3UgXWDd/41PitpKMcN0jpN0sIKLzB1aV8sRxcA3ok8msIkk378k9AfGcN
         1QvTpMPh6exKciHlzXlUIoT2zHdUoU+IvMLsRlatmt8PGETF2QyKOv+bn22hh6l0midw
         MD8e7aaiwDld3tfteC78FfkyL1KpEad18obZwB8YdVSU9wP1TKI1hwGLPTL3mNZYwuPZ
         wWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616600; x=1752221400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVTv3A04ZbfNzzCBC3M52V2FsbDet2cE5mKOx3BOEK8=;
        b=dkCG41m7kKtZnLZGYJxx6yYBpA9CN96nd46qXnPbNIWVCh68+b0BbuEMWO4RnDLrdG
         v73yTTvx/llkq4mNcEj8WIU48++bKjamw3zfrYVH4mOZfbrMAzlWQsyWVflI7DBKNRj7
         sRY1wmt4eIWLIff09mTZH0nYFGNc5Fy62iVTsBifnmqpimLqNWC6j7bjajaYdYSv0Z2y
         4Kx69LS72uaEyMi/PWneBb7te49mVMoaW7I+y+AutwZPEfOFSEz+5VRfzHwlyH5jq36w
         TJKmC6AZZmwl1b6znl9aV5Gd4sQGKGRCXTABGEqYnMBFYD966YrcuMHbj1fX59feE4sj
         vEcg==
X-Forwarded-Encrypted: i=1; AJvYcCVCcaZqnxqN1TDoHdORpX7NEU+HpE5wPDQ147JffITje/ltzlmMLr3RkBy1g72Tz3diw/k1kRoR6qRw9dE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlb5adELgbtuzRu1YGeD2meG0wMGSTaR0KKALXEqssBsBbloEr
	sZ+QUPw8CidrCuK9Zo6yq0flvuxkqnP6NDKnjefxb8mit17Y1MBs64Oi4GJuiOztAxxsoH9xn+h
	b/4Fu8X0wLAgkBGvX0VTp2yhgQQJhFz1ORC8nkYdF+YJ4RsQOEvuXCyL3WA==
X-Gm-Gg: ASbGncuT3DMrJ44XHBTGKnKWnH/M1130ypJcamJrsd+NflQZuiifDHhgBEU8h/k4eF/
	LtYF45bIm3NquAdYcOtiYSWwTLYOOhcq+utijyUIYlr/lrSYJcE8t6LueshP7s4qi87aJlou3Ea
	XV39Zq0Kj/EhhVgDfSmh4BLrBk3jI57oV7rJbspEU/Bng=
X-Google-Smtp-Source: AGHT+IGTpG/0eGIAKP8lBycN3vss409uW+QvILO2grjOoE21AbFlZrVluebK7kmCN2btM6bnR9uZ3ew02rKohEH+QB8=
X-Received: by 2002:a05:6512:3e12:b0:553:243c:c1d3 with SMTP id
 2adb3069b0e04-5564325acacmr726753e87.18.1751616600011; Fri, 04 Jul 2025
 01:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org> <20250630-gpio-sysfs-chip-export-v3-10-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-10-b997be9b7137@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:09:49 +0200
X-Gm-Features: Ac12FXzMHgmvCuG-Y0llbY7URG0KwopPOgFzDKxtaQTHuGgn8hiqaDntdlZrfRc
Message-ID: <CACRpkdZTKBErpxwR8Bfz9Mu2osSaNyagVnCc-_e+BXGpayjHpw@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] gpio: TODO: remove the task for the sysfs rework
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Remove the completed task tracking the rework of the sysfs interface.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Maye add a task to delete
default y if GPIO_SYSFS
for the legacy sysfs in a few kernel releases from now, or whatever is
required to
shift people toward the new ABI?

... and then a task to just delete the old sysfs some years after that.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
