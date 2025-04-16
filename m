Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012441A2658;
	Wed, 16 Apr 2025 01:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744767682; cv=none; b=ZJe556NaSr8M0Ntc333rvCV1xpom22zEKrBcqKVJGk9ld3Cii/gBf92umkbTRhoe/qORURP5nVyPbWTnL3D6QWCce5NURg3jzpEOkky3j7U6tjfDdl1alNazdTWSii3Os63Gg1YVsu4e6rFPUaJcMUC+HaQ0hWlGCZUa9Q8nq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744767682; c=relaxed/simple;
	bh=QZ2Ud1Y/3tEvAgsIgosukIl8HjPWFwS4NpOavajMkUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFcTTznsriZRSsJIMdwodmudBAAD9JisPuYQC00oF6AVwpth0Vs5IR6FXjD0v9TcAQxvb7CQoAYOLHmC5J2VUlAuMEJfI6EgOmuqUxBCYu/CmEaSeaWYbOfY0m04py0XGJwv8E6GrYHPUVtyPMIA1ejz8O80kbXFA/TnGLbWy3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so1174723366b.2;
        Tue, 15 Apr 2025 18:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744767678; x=1745372478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twB0aG5oSy2aYBf8sj1I4DoY6eJcYgS5UGe7JOXKGEw=;
        b=kPmKQIxJhyNVcE8fvkyc2EBZfJBodSN9dABiGTvZMijtk66hrCu41GGtna5f2sMEBj
         2dwUj25cDtptJcpavCxQeiZTD2iS4AzJR/MDG4LyzZlA0qkbd2+X5LPGABLuFeOs86x5
         diXP10pI436iCzWSXGpYgQW6wDuCeOtNVGW4OH023sYe6+wocsJ8slfgMN04HWXf5gJd
         f0S+opTG0KQ/Z+FB+pY25RcFDyYGOFyF8yosdXCgRrYgIf8+gwzoADmLrZtkyrj/97wL
         lbNZU04Kn1cGS1ewyr9Y5mccI8xxxB5XZ47B7d+e5NpovPzJRdwBjnYDiZIXt1R1Qcef
         9TYw==
X-Forwarded-Encrypted: i=1; AJvYcCW8TT9s3mMHOKv1HbdOZqjVYQDHhjxj4t42gLpqO5MXzih+fozqPUcl267if0lVa8MyisKU06xekKe32IWl@vger.kernel.org, AJvYcCXZ50pict9zm05gnoSiQXq52cPA6rigHlB/kGBY+YzuXFJ/42Ufi2c8yPvAThz8dayu9YUafCteURV3@vger.kernel.org
X-Gm-Message-State: AOJu0YwQs6qnnyAQ8a9kLUJd+SHOEjYOC/hbFV6SphPjYDd1J1ZsEpuE
	l7e91b8t11A0EyEnk8oHPgkXUghonY4dM45EweP/jB9fNgf0DPgpkcZT5tN0poc=
X-Gm-Gg: ASbGncvnIi4ztC/UCxqSBz22v95l8Dk0cFGsYsB2BSgj7idhREQ9fLqAVDiB+VeDzQi
	qJPRp/1KZy6mgLZuRdH7BEKMsx6TEL39IMPsaYBSBEtB4j5m+4vV8m25pgwKuWV01O1tqAZtlL2
	NeA8rRAdonAAXayEETKJanGlCgjDaf6C41GNSps2fTn5jRtX7BxH/Y79KkdI955+XXOi4bjlhsD
	vXn7RVR1N87zfb9VrlOyTzItaGGd0dsJBwUgQKsNZSTcNqN5yXvNecINxQSE29zE6mXOeZ9sF14
	Oa9TOJqzYzcfedxzzVoOnmJwT7ylfZFBbyJWhH1lki9VGn5n6q8olFXK5bM+PCKSDLcvz1g=
X-Google-Smtp-Source: AGHT+IHjeYMz0KgvEb109BlBeZpdK1WpEsAfCmhO2734flnzWi3bgE/AMOEkhjCOQGwd3ueN/hAxlA==
X-Received: by 2002:a17:907:3e8c:b0:aca:a334:2d21 with SMTP id a640c23a62f3a-acb3849edefmr95950966b.43.1744767678387;
        Tue, 15 Apr 2025 18:41:18 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdda65asm29559766b.59.2025.04.15.18.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:41:17 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb39c45b4eso42728566b.1;
        Tue, 15 Apr 2025 18:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVA9MmDRcrPtZy/HrUdZJ/cqD99hjHuq+WpEfS10S4VpVArGSaiJmDqtg5uwOcIkYq/ul076abrhBq4@vger.kernel.org, AJvYcCVjPhJviI28hDzONpmo8fB4QyHx15HQhtxOMsJepskDXkomOCLsIFFdZVcbvDTUSBbg5/zIpMTBBVwoqwni@vger.kernel.org
X-Received: by 2002:a17:907:3d8f:b0:ac3:bd68:24f0 with SMTP id
 a640c23a62f3a-acb381ab306mr100622966b.7.1744767677634; Tue, 15 Apr 2025
 18:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com> <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 15 Apr 2025 21:40:41 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9YWME75EqPYNU6LuhUo0kgcWfOh2qoo3WwQx0K1vObyg@mail.gmail.com>
X-Gm-Features: ATxdqUFONgVQ32LYCamWZQFAdqw-HYKzsclM2qfgVOPEPhemzTQ_TdOV1fFem4w
Message-ID: <CAEg-Je9YWME75EqPYNU6LuhUo0kgcWfOh2qoo3WwQx0K1vObyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 5:52=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This driver exposes a SPMI device as an NVMEM device.
> It is intended to be used with e.g. PMUs/PMICs that are used to
> hold power management configuration, such as used on Apple Silicon
> Macs.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS                |  1 +
>  drivers/nvmem/Kconfig      | 14 +++++++++++
>  drivers/nvmem/Makefile     |  2 ++
>  drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 79 insertions(+)
>

This driver code looks reasonable to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
