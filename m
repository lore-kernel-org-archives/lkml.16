Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E2F2DBF7E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159736; cv=none; b=K9LCS13VAUDPiIsYWBixz/BZJcsbo+OuEX0F7l+4nuTkNuMKXK+GZKLwiJHMabUgJa71lIYILuLS+TvGunW6iScTa+I1XTqfLRMQdHv/OWO1YRF15pjG306D1lWH6UXBdluhJyzBn33hEv0jlIGjK+cCMC2KikjrPRi+tes9EVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159736; c=relaxed/simple;
	bh=rKqVvNw5lyKW3LX2+iL06fE/DI23RpfEtx3Z3DoV+vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orjOefPdFOey4SzUjPBEwqJ1vVYDWssBwNzpk9SF9rcI9ItOekLXZt10xmtxPVUgCjiCxBQ8LNJP9b5apSPpikiQP3XOE4Wk/b+T7J1oo5EXGFIKf1SmomKzp/UYzsOkaZticzNAVgExV59rZVCGmmXhQHbpLzs2+sAx4QWcgL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tqFpopGy; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tqFpopGy"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b60de463so3886412e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750159733; x=1750764533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKqVvNw5lyKW3LX2+iL06fE/DI23RpfEtx3Z3DoV+vw=;
        b=tqFpopGy8Cc73b4pE/J+FwS4fvtgJgIyDHR6WwxuUSk/q4YGBxay1eBzs0oV2z8/3q
         xCdbk/zp5tnNqqCF81SxWGBiiM+ISgp+Xf8q9lQ2u9HkKhUuOB0bszOh28KgQHEyj6kB
         wWvcZhgc9V9yHPjZYt5GWOsGjWtkVJL6c74Nx7vpCxmtX+tCLp0wgGrbLTpecSVfw7F7
         Ld6iDua1M+BrxBlupe2aVtZn6L63yZT5w7knAy3x8ZM6KldeNXFFt+7hywXOXoDIMrLo
         YpR7fviFSaLiSk6GNvO5QH9k1Jj4babKrVuix90RlBYFMkIeoc9DlZMJMGCpiTLaR/zX
         1KPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750159733; x=1750764533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKqVvNw5lyKW3LX2+iL06fE/DI23RpfEtx3Z3DoV+vw=;
        b=M7qFHvQMoRhCYhsr9mzq4DRM/sjfI+9YWP2zmeJOaKpp04MMnhOyPwvFyb4wXG0Dhb
         YDAveYDrniDaitdCWjzg+F9C/fTXeXwIpu/F8xm+Ckuxc5GRHE6QZU13SmxX6F5B+6TG
         3TLItIbfIY4dgJ0dUbbH6xRbTuUMJ8KpA6gV7jHSv8YV7CVGCuoYw4J1YQ3dFhsEOLEX
         RMtLnxv3W5XY6bWuni54u6o9cTXpYbX73yES77fm87WBWx14CoTJle74dXHZTTN8TDs/
         j312cOs51t5iBQjr19urVXBV+KDryTYVT2oaA/uf0GvaXVioxbf0n7sBBnMTQmds4Bc1
         94CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrtduqkHM7kvzd9Yx+qII0orJx9CfL8QeNsuicx/Cb/3uhIgYCCuq8K2H/50Tjds3kdOsJTEC0sr9EYZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgFfrFlflWG6E5j6aMXGuawYQ+7KsLmACbQEYkwIZQajwg/Wd
	apxw7PEyfobbkhCNotVR6SgPiWOzP72jNRdJd+wuizyJUe82g1JkO5EW6u1j73TtDVE3SElz6cC
	XQltcsx+6s9OSo3aJKL3aT059ayNHtEs4djEJpf70f/hE1+3Nmzi7nsY=
X-Gm-Gg: ASbGncvct8vlB83d65rSbufCrmy7irHqVcsPoYaXGR75NgOHFTlH67EvgVxtU9qeFjR
	ZKVBx8IUMbESUsSwtFn8PUGw+N53027mjrRyrjRcRiz9Z4SwLX3gFQChsoO65F35I7zMw4+iCAT
	Xc1GIiFZxjF4p2qiYA634PkZpy6Oo8hyg3RYUJTQ1J9s3Vdj9eULKiRm4zCnw15JLntI118P4aR
	+k=
X-Google-Smtp-Source: AGHT+IHFBHasejrt+vYHa1q+yyWQGNzh3xU6idx339UYt4amSi8DXGKZ9NJfBKCdaCs39R8/W/TUJxSI6bT+G4W5cw4=
X-Received: by 2002:a05:6512:3c84:b0:553:2159:8718 with SMTP id
 2adb3069b0e04-553b6f34ec5mr2709376e87.40.1750159732568; Tue, 17 Jun 2025
 04:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616143341.51944-1-brgl@bgdev.pl> <713cd518-935f-4501-9753-d33c9ea6aef7@oss.qualcomm.com>
 <CAMRc=MceV-HgyFFvqytXAiuY+y10PQbdPBxuvd57NCeSLVLXCg@mail.gmail.com> <vyr6s4wzw5jc5gt7mywu4s4xob6aeca5aclbe5tdr4v3yng2tn@yb7rn2b2btb7>
In-Reply-To: <vyr6s4wzw5jc5gt7mywu4s4xob6aeca5aclbe5tdr4v3yng2tn@yb7rn2b2btb7>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 13:28:41 +0200
X-Gm-Features: AX0GCFuz6389iQUm3yW4uW2Du3zW54O1SWWkQeThcuXo-yttR-Q71TT_q21DHSU
Message-ID: <CAMRc=MccuJe144NcwapPPRXtQOZbPW8qmybuEA2O9EtfKzs7oQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: add debug UART pins to reserved GPIO
 ranges on RB2
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 5:18=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Mon, Jun 16, 2025 at 06:43:16PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jun 16, 2025 at 6:20=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 6/16/25 4:33 PM, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > GPIO12 and GPIO13 are used for the debug UART and must not be avail=
able
> > > > to drivers or user-space. Add them to the gpio-reserved-ranges.
> > > >
> > > > Fixes: 8d58a8c0d930c ("arm64: dts: qcom: Add base qrb4210-rb2 board=
 dts")
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > >
> > > That also makes them unavailable to the kernel though, no?
> > >
> >
> > Yes. They could only be used by QUP - I2C or SPI #4 - on sm6115 but
> > none of these are used on RB2. I just noticed that my console froze
> > when I accidentally requested GPIO12 and figured that it makes sense
> > to make them unavailable. Let me know if this should be dropped.
> >
>
> I'm guessing that this would be a problem for any pin that is used for
> some other function. Should we instead prevent userspace from being able
> to request pins that are not in "gpio" pinmux state?
>

That's supported by the "strict" flag in struct pinmux_ops. However
the two pins in question are muxed to GPIOs as far as the msm pinctrl
driver is concerned so it wouldn't help. Turning on the strict flag at
the global level of the pinctrl-msm driver would be risky though as it
would affect so many platforms, I'm sure it would break things. So IMO
it's either this change or let's drop it and leave it as is.

Bartosz
