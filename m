Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F70629B8D5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559354; cv=none; b=HceiTX1gsmvjvoUg/NwgM0cpRnbTCAeD7TU5+K0Dlv7FnT2AK10I/ka6ZU1P9wpBNNxlStutHhTS221HNxZEcjAxC+S9fL69lE8QT0DhTHn6ScipkbEECbtPBbK+d+p8icVfJnz5OGiW+ES+c37E5CMN4Z1IrtFrwgsA8L/a5wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559354; c=relaxed/simple;
	bh=U6Na6s2P5c1DqTdnoC6CkwOGk4v/Ph4Wt3KUWux1jLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPNIs/L5ngpUd3TD57iNKt/l48ZWGKw4n7sfgB/rKa7eZxB0qA684dk+ceuOdXcbySzWx5YMeu5yTMSUMHNEf7MFIYBiGV9PZSIbCazIitUeZLDvmSCkf+gL8yyD4fv3kMRC7blEMqdwgFxCadaKKnVHEtUHUP5fPoo0X7CJ758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m8HBbj0L; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m8HBbj0L"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32925727810so45606411fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749559351; x=1750164151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6Na6s2P5c1DqTdnoC6CkwOGk4v/Ph4Wt3KUWux1jLg=;
        b=m8HBbj0L7i1RABUFxPposqPNyroZKieLJZOGFjMx+TwBkab7hbA8C2H/psaZLeSOPi
         sRQxVNWVZCEDHv28JUEyncQJwmAmxXZz/w+wT32fhcwLdCQcBDQhj1HOKFkNFBxv92dH
         mdzzYZ1PSW+Hfe/Tb/IIHq+S1Tm0CITtJuRbT22xOkNzG0fFTzUeomoobToNpkz1w9LL
         YrMU3WGaEg5dkNjJrCMyA2JUkr36nIop6D+T3Uuh2RDjT1kA85uu4B4mSz6c31EuMmha
         /7qhSQR24VhkIlaY/TpC0W0rvx06Taew5/Q6WwUjArn6gxdRgYofKPwggLDX88FeIdKA
         jqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559351; x=1750164151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6Na6s2P5c1DqTdnoC6CkwOGk4v/Ph4Wt3KUWux1jLg=;
        b=sqhGTRtxHDofmCWxs/xtVDIfRi+PnSxkwwgwCv1FRLDQxtuLG8PzRdp+yIoikbGZQC
         FK7awXFfHR3welL50hF3IcXQh4putijvND6/IflkAWGafO0KCIyw6ODcO4tsDsPakz2M
         b25++IlwOXsR3gK6yNJcZocVVO5aounXMknyfo2m8YVJKvZAB+CleEdx5SwUed23Ju2A
         5ENiw92zAi8eqBCQq5mUQ1PwJI/imUBRk2yGQ9GQbszQVfBMtDnBw0HQYAvIZfbnzice
         Tjt3CaBT/BwLEwmd3GNQtVGL9u9K4gE1qzM3CYLd7wR2xEYIvetFhFVHWRjaw2FX9xc9
         bzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7ddLgZPw0faDKGzjNau07sKEodn9KOwej8TwhKqtdSzihjnyS5eAi2aPrywcCTwXQ9Z/pQXmccN6Ui64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQiCOQJB3uRA36LL7yKNiIKQbSzyiVphbR2xNCrIK5Mk9NyJHl
	r0JVwnbRpCe57FKISvUA3bwhcDVgCKtsLjAu3lrR0PbYtPbVfMxn7IHBbWEkw6FJ2RFLHnP2999
	tBK4eY+8p5xq37sfSpIFBnacLu6lrHN3GePdplJ+jCg==
X-Gm-Gg: ASbGnctTyL+GVdnqT6n28Md77O7lIsxQYwHFSw22LfvS0qf5N3t/x4zq9FPvMfd84wl
	/xigiw1nwjYAzuefLPt1koILP29VAeDYVCfIDCGvuW+iDiT9tCd+Ee5wE9PbITL4hP+i8vDVGDF
	VMuyda/1GArcdsrQAuD0oD4hsnX4I82I2bshOEdpddzrG2GqSuccWsJA==
X-Google-Smtp-Source: AGHT+IGD5WXbHGGhhGRo5sVeUpYouurIwKWToxCb9XtYaZwZ9hBmk03t06DwUfTbDOn7DXb0nilwhoBbFz43CxKKxzc=
X-Received: by 2002:a2e:a78a:0:b0:32a:9a0b:4697 with SMTP id
 38308e7fff4ca-32b152d6ecdmr8013991fa.21.1749559350758; Tue, 10 Jun 2025
 05:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
In-Reply-To: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:42:19 +0200
X-Gm-Features: AX0GCFvbZS-4AQxpsQip_StlBivPF4rBRcoZGRYX2DDCi0OTfFjKlqil2Mw3JNM
Message-ID: <CACRpkdZpn5xy+6yb-mQd6wDs05X0QqRCQo7QpL6=aEWtyU-zTg@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 11:51=E2=80=AFAM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This is the seventh version of this series. Only few changes, the series =
has
> been rebased on v6.16-rc1, the pinctrl patches were dropped as they were
> already merged and a fix was added in upboard_pinctrl_dbg_show() to handl=
e
> the case upboard_pinctrl_pin_get_mode() returns an error.
>
> Best Regards,
>
> Thomas
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Looks good to me, some testbot was complaining about something
but certainly we can merge the majority?

Bartosz when you feel confidence in the patch set, will you queue an
immutable branch and I will pull it into pinctrl as well.

Yours,
Linus Walleij
