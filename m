Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C528DF0F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140967; cv=none; b=HHxQvaS6G8TM0e81W6eOlfU/CNNJF2MdTyHiYC104OPoNMAQ4V80x5EtLTUjCSme8KNCcKoU50iux7fTXgaUdkLDyHIajDuM3KEumpK1VYt59P+FABz3eZpFv0pEAP64g2TlNdP+SewO2eSePK3sSM96w8C4sv6bD6OPEfRsPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140967; c=relaxed/simple;
	bh=3DeTAi1I6ja/kcy7TOnjzoICqTpw6MKwiMgn5ZsOA6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BA+zSpbxV0ndBBRLbRdeNuUsgGg2o6FyTBcPlfDippF9y3mGVIR4yQoX6243nquTf24U9A4hpldyCSl0fiKBo4Lvc2s+4Mswiawvw6LVUiOWrUsotyT2iy5HCt1jXJJHj+Wn9dX7m9OEJS9YOVkAWX7MZFSxJi/H4HpgzHlBlqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wuxVo5Z0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wuxVo5Z0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54fd1650b83so3228930e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747140963; x=1747745763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnrDtFR/wUG3jSxJnmOhIX6bU0T3LAwlfTt3Gj6//94=;
        b=wuxVo5Z0jdBa6UwMTXEIhfKGNV3eQdRoW97gGbTQNavJdsrUTUHZsbzie1bmR2MNl/
         NyMumE0PVCLvF1Vzuuj/O9RilKnwZILxqEfvBHxy4cUcJSnoyk+ZLnEzkOCHcvTi1cat
         7XiMUjdQToWpasxXShuMQIzIW1olS1iu0HAd1TGfw32hCjBd7Sn07eHo2aR4vn7cVg18
         xFY906MYgNsQi0RHUgVm1N6GYEvGFb4hL/9yXtswkLyhwtBBEjX6qBo4bK4Tr9Ptl2hC
         b67hCvzTjDr4wdfRiAdNgEZ5HYRH9EYuxlEqYRuJDkUbFZinDQfsUQjGqrRazsZg/N++
         fKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140963; x=1747745763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnrDtFR/wUG3jSxJnmOhIX6bU0T3LAwlfTt3Gj6//94=;
        b=mzL13fb6OqrjCb9QDIRghoffhgKFNWy4X5nYzATTXw8avdu39Y+RYRlr/sCIKZ1GE8
         civ42t/U3nkZmQTDqONehdxVD9P7DB2acxKrtEYd7LQlEDvDHhxL7sVC60dUK+mYHyJ+
         hxHcqVBUT8fJejmtpa360tUvJqy3gtW/IjFqQwQXL1jv3xzImN0icfhOBxkwyCLz14yR
         OKGLIfFeEDL/tWYZ93fUphAyYTHeqSLHjdIW/BmeQ7V0Kf/Shg9Fw+SGzz3QBTEEhkod
         W3RER4Oo6GZAoz0PAPq+CfFsl1g/2B3YXLbjJYvffWV4itwIJjZuMEXt1gkzdwaJQzW2
         Aq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVgheMM5chkxlevpcqprHJPiWfYFFGeajatTG4w+7ZqQatbE51RkYJOD2kHLWALGPE5oWSXb+sW5rxgg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KFhhiCo7fGCxvOgDRsF19lhRDjHMXCahgzDy7xCIFXZrjceb
	ms7rsqKYEiYOjY193roLodKyNhEd7onBMyGb8c5CcFg8oq0yOOAkOutdVmmvvnPZ2WmzzGIT549
	9IPX4+gkfyfenjmP9bb4tS4YoASCFLmeHJophKQ==
X-Gm-Gg: ASbGncsB+p3vy1MElHHaTZASF3wMGUfTAeWhGHloaCknebHo79BJMh7bZKB9ailZsEV
	wVJshWsIx4GvlFadDWK5kTYHk+BvahrbG50wrg7J2qs5yya+0ffr5QcE4KY4mNcD83vX0RYiIUi
	1ZMP3a4nYwyydQF3Zd3otH4fWIPSA/aiC0
X-Google-Smtp-Source: AGHT+IGn3b+7Zh7S//+wx+Xxtb6ZBtSzHkIJbXRsy4U2x/LmPx9JYtJc5JoaPFpYaECnMq8H1yt+/F1ni3yf6HVA9Sc=
X-Received: by 2002:a05:6512:1194:b0:54a:cc04:ea24 with SMTP id
 2adb3069b0e04-54fc67e7ea7mr5900714e87.46.1747140963389; Tue, 13 May 2025
 05:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com> <20250506-csl42x-v3-9-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-9-e9496db544c4@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 14:55:51 +0200
X-Gm-Features: AX0GCFtFzSwk7eRmxngH80W_FVCoWA7VvCWFx4m0A5ByX0Uxkd3cGc7bhazETXQ
Message-ID: <CACRpkdbcCGVQca4arnRD4rc1W+4L5g3yT8VTb35G1CrwgBfvAw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] ASoC: codec: cs42l52: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 9:31=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.
>
> Checking the current driver using legacy GPIO API, the
> reset value is first output HIGH, then LOW, then HIGH.
>
> Checking the datasheet, the device remains in Power-down state until
> RESET pin is brought high.
>
> Since the driver has been here for quite long time and no complain on
> the reset flow, still follow original flow when using GPIOD
> descriptors.
>
> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong.
> And the binding use reset-gpio as example, not same as driver using
> "cirrus,reset-gpio", and there is no in-tree DTS has the device,
> so all should be fine with this patch.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
