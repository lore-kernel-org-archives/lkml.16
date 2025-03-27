Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73020B1EF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065445; cv=none; b=sz9MAliW1NNhblX6uuE/IOueL98Fc+O+BbK1+5dQmlHEYhzr9WEdfwK2VSCEzIXwYxI+G5csJiYQ03ez93OcvdkbFnd3dD8QbfWYTWVzPG2wjxJrxeF3j8H69PAaDNL5TgOLLg6M7JACu9Q6jgIRUuqdng/xTVvuLP4BppAPn5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065445; c=relaxed/simple;
	bh=SSuwDDlCfqr5CMC3oPcQO21KrxISnnKr5CAAJcA5Nlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVNzpZJihGstKCOoEbGZoa9X9iBJJm0bz2Admd5vKu5xSsYaoDiTPrWosPwim6OB7KFPvEGizCBaIXX+6efZQW1W6wg20cVhFNUi3PbXRrscGPLubKVMiC6y0sJ5MMqmPqTQcTlBYvwvM6aVlpmOEUPPjXuR8oioWKenh9wVebY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cJcfeXhf; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cJcfeXhf"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso7753011fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743065442; x=1743670242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrCm7V9nLgr1fSaq78mJmNgFm9htZIYRYnkNXr3wiks=;
        b=cJcfeXhfn0oAM5iO1RFH0NqwYN6PKK0dEBx9wf0jHwjBuHk/CpksYvnfirNW3fgMUh
         dMuDPXuE4ZDSMGLOZBv7CO73pKUI34VC6SoZNX+nkZS6Bi8IEGnGdmMURJkEbBF54deI
         VR0fzs9pZ8OfuGlvPTicWKxeRvoI1TslOmGEXpZmxdv1wl/KsaeENQ3lf9hL9Vdbqyp7
         K6F6WavIIxoofDravsJBe2la6npdnqXk/10FOeGR3rwmyXmgkr5nM1BwmFFUocbAtsuJ
         3HJkDqwC4sI+/DDDXEdUlS+QdtI2fcEt4eDZUiCPRXgo2HsnfsKe+nvLRHsOAAbibtTN
         69Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065442; x=1743670242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrCm7V9nLgr1fSaq78mJmNgFm9htZIYRYnkNXr3wiks=;
        b=XCpc3qErm5hExLFvCWxOBHcbxrlfgYFXdW5qsgtsPpIGG6rm8aoXfwsihzUO6tsYHS
         YDLahQCfKRYsoiTNK+QECjYanWmYXx39lDMo4j0ufdZim2GRX0JfAsEpdlFSm4SY16hO
         FwBjyJ7nZ4/oZAhKOPXiAvYOQGavKCkx0ou8ZVihd1JCClN0cOPN74351vBw8qWCP3Au
         8abR0qxmzbneF0e8t9+JkYBmJkI+t4QuwRqu6KS0RkxgH8A8R/DCOYrkIAiYeRC2RTvE
         7QHBDCbnTsNyokQlJCHyTsQx8O4OmAnEFmyg7mkYkGQTFClxitl8maB4MxVaC9wXowS/
         GCEw==
X-Forwarded-Encrypted: i=1; AJvYcCW0d0tGWkmdvEz0pZbAViLJhcy9gq9bGm16OZRd8sj1A4eBpkaGBTZVJkq7LsF+SARFiQckZExV9deReZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhcIDaH8kjXqo1lCyFWNhaYCO04ntfkcZx/hX4DiSL7120lu0Q
	/qSqaQih3vH68l0KMC11t37pjHGdTl7q3YVadKO9pt7TunDix0L+fIyQBamiKj5eNiLPaz9Uo/i
	qkE0QdstOPUeJqv2xLtKcml1JlV/Sbln5sZvc4Q==
X-Gm-Gg: ASbGncs2OlsJAQ2bK5SqeSWtcJlSWduj69Catm9oisURxYqe9hrEXFVcxA8gkgOFN3+
	qsrtVo7huOHYEyoXB9ilS+oQtAPCP91PaO6cHfsAZBQrrxSEzzykDbBNDA7ZjJZG4/hCV5WBhFB
	39sM8piBW0ToSb3tALQuxh5ReY+q5hIXaljN+zVRC0cYTkBbbWxuq+ilRy+w==
X-Google-Smtp-Source: AGHT+IGxgIMt5kbHn2L71WGjDAcLR0NypxnTQNv9HahK/pVgRmQpyy7Nbd63iN4iNHaoEbc5XYTKgBpyYWSQHq3EHrw=
X-Received: by 2002:a05:651c:198a:b0:30b:b9e4:13b0 with SMTP id
 38308e7fff4ca-30dc5e52989mr11888081fa.12.1743065441577; Thu, 27 Mar 2025
 01:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com> <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Mar 2025 09:50:30 +0100
X-Gm-Features: AQ5f1JrsE-JcUTWn7tcgiR5us3IYvBsJJdLl84KolEecUKrVowGr9GOKOQX6-6k
Message-ID: <CAMRc=MdXvwyXTjUj2cNQm8_c_fCoY4+kLA0C2D6k6MmNGkTEdw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 12:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 mean=
s
> output low, set value 0 means output high with gpiod API.
>
> The in-tree DTS files have the right polarity set up already so we
> can expect this to "just work".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
