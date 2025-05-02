Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3DB1F9F7A
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746217778; cv=none; b=UeblmNl44uolviJ7SOLerdS67tyJtY9NSTTlollxiyxGHg0dwuMn0h9UcU7Xn1EXQo5WTMb0SXcAHHn+MfsEWLCEz7iYI8b79wY+eddmggfmxOOW6L8IorqobkDInbOuM/p1tbq7kuRUo1tfSfpelTUbXalMGMtVo7t8GE8hT5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746217778; c=relaxed/simple;
	bh=Dyc4VucIA18bMQ/LaDxwZ0u3No29RUGoJCBcBQD1gr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guqrEOK7hu2zYd6bEx8Mlk4VfdQhkGKwXQU5CrESeenLSNlNwIXkFRdKpz3dvzcx6tp11pTii0CGibsT3NtqwkRyQw6XbURNmGKT7rPjMw0lT2CTUk40VFe2GxXe9fh0/aRUFxOg3PEOJA3rasCi0rltdX/V3S6yXDklLnjW/9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkX8ctaY; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkX8ctaY"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso23566461fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746217774; x=1746822574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dyc4VucIA18bMQ/LaDxwZ0u3No29RUGoJCBcBQD1gr4=;
        b=gkX8ctaYC44kdZJvcD/i6x2qKypvYMoxuk8qxyQpVeA+/OfvmnsuR4sWf3fCaUprXZ
         oDGuKJrpVrP+IoSwksFkWX8EgGMdfzq2lzcnKfR2B4WvehRCOJoSFtwNFeNbGgoihTBH
         b5N2d6B4qIkSvIMwz0OaHkfrF77FIN7uYMN0bRRu1kBU6RCpNriRJPIFhnxBtLkrWqKY
         /6xci12lIsj59h875vqMaqhiAdclf7Ayi7Me+XJotC3Dct4CYtkJ828+35h7UrwHhC8R
         XMpJpvoKV0QZ5taC1zg0IooAzqCvc1F30QsoopYMHfPiWYa36ZceFCXa3lSvMAj+4M6D
         mm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746217774; x=1746822574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dyc4VucIA18bMQ/LaDxwZ0u3No29RUGoJCBcBQD1gr4=;
        b=blz8t+5ERhpvoN1L/NjLJ5uPjQRPJU67HHZIuOWXfUl3bkQXFXTyi6x89k+Ct6XTVk
         YzRqXXuth0qSYA29UHe/2fM8Gkk7RvGALrlAAN7wtsJYz4tIgb+z8PhGMQ/a8h6PPx5k
         7rui1YfhIc/4M2CSQo7Wr1E4dMHve+xuHn7Dw+NEaBM2S89zvQE3kCnfmvP+ByvYtPya
         EhT7uvr4KTl1iViKS/2FWWkNYaq5k1F+xGsmCgKlZHOphmnKd5ztMepwBHMRqUftSaav
         CcDmUzg/5C5iae6BZtG/bK2k8chuyqqoxDGxF0CyQE33boxIYEdhGR3QQok4DNSjNdmo
         aRNA==
X-Forwarded-Encrypted: i=1; AJvYcCXESuHJfq9of+PS5b0/U+Z60HROvm9okEyc2PKOxdSlYoJF0lFYp3ylX0Zi/xrgJ2sMO2kTXikA3lKWlN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuPEZUe4NaUlBzg52p161qG4JOTyP5SWmy2MGTWxXJhbU1n9DU
	L5DIsq0wZdSJHMCY26IV+HEvP1ja++mmCZAMHNSFld1FZWTUiPxLPoZphpIVDd1c/zACGWdNa3h
	mtEw3nMijeLX4/HMPjsxlFt097QWZ8H6fuuL5RA==
X-Gm-Gg: ASbGncuGzg5wLkrEouh/3oW4HfnPvbPwfglNDKIaif/Drg1s3cPhirA381T+ZzmDBob
	lOfNW88l6Fs3NGpH3xCzKOuHwN21/Gk5BN6QIkragYUgO+gIHhAL+Mn2bdfkogEDr9HBPQwGx70
	wUwV0LFYEctyicVXmJNimvDw==
X-Google-Smtp-Source: AGHT+IE6YTt/niqKQC/QybVWYRM9e6shd/VbSY8KRysq6VEEG74icJfMuCm0qJps54EJDOCFiUhMQ2MFyXvrkj5LwG8=
X-Received: by 2002:a05:651c:24b:b0:30b:fdc0:5e5d with SMTP id
 38308e7fff4ca-320c3b0277fmr12099371fa.4.1746217774478; Fri, 02 May 2025
 13:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502013447.3416581-1-robh@kernel.org>
In-Reply-To: <20250502013447.3416581-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 May 2025 22:29:23 +0200
X-Gm-Features: ATxdqUHkisrPrxN0V8LxOcj69_oQIgjXM5hj0MkSydduFZ6VmGupMstVtA3t7To
Message-ID: <CACRpkdZ6ZsSTXGDFCLe_bFanKLeEm8+vY4_SvKrF5BrH068UCQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: Convert v3,v360epc-pci to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 3:35=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> Convert the v3,v360epc-pci binding to DT schema format.
>
> Add "clocks" which was not documented and is required. Drop "syscon"
> which was documented, but is not used.
>
> Drop the "v3,v360epc-pci" compatible by itself as this device is only
> used on the Arm Integrator/AP and not likely going to be used anywhere
> else at this point.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks Rob, I see the robot is complaining about a oneliner to
MAINTAINERS but I'm confident you will fix that.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
