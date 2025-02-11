Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA81E0DAF
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296278; cv=none; b=XfK3XvudeBvCK5L0xF2lM+BqGKWQs4I8acB1NlqjC+ekMmqSihC6dli1wE9cmAEqSAczYjjmlsNtADP6znMB6bQyI7Kp7QcLMsjyAp26oR+9OREhNOYA7uKS2TDTzRq2O/7I7Hp2b534i14yRjqlBy+fjA9d0vdgHQzx3Lcbdoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296278; c=relaxed/simple;
	bh=fR0zgTi+/ud4V0inKPnP2XF/d+aFxcaqhBAv1SrgoSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqfGIwJAa6ByJjOu7Fgv1lA7wWrUWJ6Mk77RPndyE95F2CxTKISorQkBFZdkziZfIhktb58GjpE50xW0jBXyi3Jsl0tPiOoEQP4LA865vTHquY9JVPhYNefwxch+U8fGTgEo9jM6Tt+HY9yBjhSTt5z8AR1mrhZjcw7kiWA0S94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oIvF4uh7; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oIvF4uh7"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54506b54268so2867408e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739296274; x=1739901074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTSaH7qKhx86rkiYP1YP/HrBPskf3k4Y0bn254nyOfM=;
        b=oIvF4uh7ahZVS8MjPXvL6KGnk7rWI8Slh5ELZzJiOOcDV0BAUoGxbhaUVxBXH+r9Sn
         MP4gkG1t0XN7ppzPSE9k401R9MYG7X+bGCWz7UtI5BQqPIUJ4DMcPO4LwiFjxIjdx42W
         zS5rkN1itYKz/jiXyl/VRl9yFqSmzOmLwnYNF3Cxlp4jHLbYFwRyhomo1XjWR2kBayjj
         3uhLnJlz8V7HGzNlapUaNZu4d/pAntb0Uyn4eDWID7wDB5tyu8Eqbk4ZZ4frAnYJ8aKN
         iDbLrpMr08amnPp+ox2F8MQ11AzviS5DFQPqNvoidaeTl5H2xKe2mmkH37H3Gqa8PtR/
         Q8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739296274; x=1739901074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTSaH7qKhx86rkiYP1YP/HrBPskf3k4Y0bn254nyOfM=;
        b=c0e2FwbfcKBVMOC/YemxGCAGcrUT0DZUIYhhPVX+c9R3aJMRk5rNQzNZePEhDcmd2n
         Jm1LHbkPY7mbDkl7HGeylJFI5R/tGM5oPrm66WTMOWsSF9fMZWmHwcYDC1C0nnFPHRDo
         P2x1OBdWJx/un+RGAzgfdDu6zZBN8ktJmLvi0pEXs1YyPA2tnB1La/mZksGtW7ksucUL
         U3e979lV7/Y0L3A1b2pKM51hrHAZMIlc5a2qYJeR5vheaXP/TNC8LZ/lOow2Qc9szch0
         11hsprgXxGn1id3AWdabRDWb2x/Gn37dTe/MhpyY310zM/lLBIHXRMmmEjrhM+k9giRi
         o1mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4QL6wadOz0a1X+KxrNnoYevjwKPQ/52HXHI14oPSABbKl7J55XtM7vAOE+QU1RuWtM9yaKIDAYXhFiCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXGiBNHtfp7oqLbz15T/+mouXCh8QCw896oGrR4LaDKsVnDzk2
	wcWUt+UEpTBlcfzjyPIeLcGOf7mVgPRDGDogX+bIjQQne+RU0VM5y+oPQCu1adAtg1G8U+fxukS
	J0jT/A2GDYB1i8g7q9vXAebJfRMxSMM5LvSyeJA==
X-Gm-Gg: ASbGncs0c1JQHgW8mgpTXf0xtXHX2pV92fddAa7cgKTvGR70APFtjhTUYq6KocrOPP4
	DGdJ9DPHKg6PvvY69R36O6EeT8CFFachbB2gczreAcuJ9jU/cEd3TEoy9Dw6AVG35hz0pdJqB2H
	aaZKtapDst9mTRAPYKN1Ikd4e1YgU=
X-Google-Smtp-Source: AGHT+IHM10prpSU2tEYh3WXNcE4h+ufYvzwXjCvUf1TyTFGoPwbaxIAAya9aVjOyVTzIcIXr9fV5w15MZabbxVNEptw=
X-Received: by 2002:ac2:5687:0:b0:545:8c8:30e7 with SMTP id
 2adb3069b0e04-54508c833f0mr3052476e87.21.1739296273868; Tue, 11 Feb 2025
 09:51:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-x1e80100-pwrseq-qcp-v2-1-c4349ca974ab@linaro.org> <Z6txevdftVNww0wD@hovoldconsulting.com>
In-Reply-To: <Z6txevdftVNww0wD@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 18:51:02 +0100
X-Gm-Features: AWEUYZn_IQJJyFSf_EuE1HkQzGtRktRzq6jGfk2KkE1OYhjsgpGCzUlpPOVGM9A
Message-ID: <CAMRc=McApxN7TKKKAL2OmfkosKYA9gCYZXQZXFAE_A9a5qykmw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
To: Johan Hovold <johan@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 4:49=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Feb 11, 2025 at 04:01:56PM +0100, Stephan Gerhold wrote:
> > Add the WiFi/BT nodes for QCP and describe the regulators for the WCN78=
50
> > combo chip using the new power sequencing bindings. All voltages are
> > derived from chained fixed regulators controlled using a single GPIO.
> >
> > The same setup also works for CRD (and likely most of the other X1E8010=
0
> > laptops). However, unlike the QCP they use soldered or removable M.2 ca=
rds
> > supplied by a single 3.3V fixed regulator. The other necessary voltages=
 are
> > then derived inside the M.2 card. Describing this properly requires
> > new bindings, so this commit only adds QCP for now.
> >
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> > Changes in v2:
> > - Rebase on qcom for-next, patch 1-2 were applied already
> > - Mention dummy regulator warning
> > - Link to v1: https://lore.kernel.org/r/20241007-x1e80100-pwrseq-qcp-v1=
-0-f7166510ab17@linaro.org
> > ---
> > The Linux driver currently warns about a missing regulator supply:
> >
> >   pwrseq-qcom_wcn wcn7850-pmu: supply vddio1p2 not found, using dummy r=
egulator
> >
> > This supply exists on the WCN7850 chip, but nothing is connected there =
on
> > the QCP. Discussion is still open how to hide this warning in the drive=
r,
> > but since the DT is correct and the same setup is already used on SM855=
0
> > upstream, this shouldn't block this patch.
>
> I thought Bartosz was gonna fix his driver...
>

This is not the same issue. The one you're thinking about[1] was fixed
by commit ad783b9f8e78 ("PCI/pwrctl: Abandon QCom WCN probe on
pre-pwrseq device-trees").

This warning comes from the PMU driver, not the PCI pwrctrl one for
the WLAN module. One solution would be to make this supply optional in
bindings and use regulator_get_optional for the ones we know may be
unconnected. Does it sound correct?

Bartosz

[1] https://lore.kernel.org/all/Zv565olMDDGHyYVt@hovoldconsulting.com/
