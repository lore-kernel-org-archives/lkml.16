Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C21DDA18
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128765; cv=none; b=LKQmjm61I/mDgtPXEwSO51ab8ws4BeVm/gJw55SuWupvEkn99UINA3duGoxScmPsUQDPXnvHJL+xxGwRPfa5rPU06n8RM2+eNwBjEkgR8G9T4AleLf9yMXumWBihsW5d2f+uyy7g0IWi8lez+B5nlMJijlZtu48mmqN/q58K4cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128765; c=relaxed/simple;
	bh=NY6vJD4bfvHx2WAT2VVCtdPSXGmyW9DHyy+RXKVoSAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8Kfbi+USHCWS+ijS4jNjGlLIUH9Zu94vBVwIwKgWqqC2iyb9ySR3INGjMf/2D0LIP+TGYB/Dd/WDDpo+Ibr+9Q6+I81JE1qmX+lwNnHh3qyXJpkn8JQsvqPhON8/15himhml+1fl20KOpJjCS1ajvaOnbyt9mysZWxqQejpvM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGrLbBdN; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGrLbBdN"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6969713e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128760; x=1747733560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY6vJD4bfvHx2WAT2VVCtdPSXGmyW9DHyy+RXKVoSAc=;
        b=oGrLbBdNe47+XhC7TJrOpYDGraecVQIUsdahLRDkYTEymSZekogcC9clY4rGX9O4EA
         SyGRIJJh0KYEzI1izldRcXez2IEjVPslU2GReqr2wr+fOVx4IYJS/S9t5HG/akhS82Do
         OPPrsCBOQ8AWpPhx4vm95xqFL46rh9IpaTOHLDlcr5XLQtVMbMLfPk3Mpws3ppXoRDLn
         kLl3zs65IlT0EhhCNwSejQ+QcaMoACgv2iS9rYXXw641iq/Gd0Lamug30VZq+iv7jSWJ
         04f1dt5xZOqCLOHc7oLR1Gn5xUpcIys2v40BmxnNdOPxK0mRaoPW96Q9nU+lt0KCCMYr
         hzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128760; x=1747733560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NY6vJD4bfvHx2WAT2VVCtdPSXGmyW9DHyy+RXKVoSAc=;
        b=Qj7xPf1Vq/+EUhux7wW95kMv/0SEsOPEziMyjpgCer75n2NC/kx9dOTmTW0GWbLQIq
         U8AWRKr2rlc4GVmN6MCOfB47zRrPteIqVgTXKN1uRm1hmaNOmUnXDrLd70x3KJKOwSyL
         Aj1DlTVlpWXl+obgJ6PW7P6rtgCYmHXGiAM7BS504tu/bg1oUalXNsTNhTX4G8hhKODm
         da1pciSNCHQ3E6/HMANVED8J9BmX3ZfUIvE6N/ci34Nev0dtisBH4KKuFKsI+kpQs5Jf
         9YIoXpd0T4DuV0gX8mug433aiqV7+EkiyEQWFHn2CFvAc5Q879TOXH4OnLrYG0HsmMDl
         CC8w==
X-Forwarded-Encrypted: i=1; AJvYcCVfqed3QMQXUzLSbL9YrQ2pxeAxQ4p2OVQMqm0VXmKxoL2M5o/NNkrAYGzoU+myuBPIiPEZrBZEiuFHiNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL2d6Xk+t6cUkA2OljCeU82IuvqCOhU3eMb9cgsAF5VlKDD8fg
	CndYGDXEQhkrx0Sfv5oxjTJHMKMVcDxCIZgsukiTY/unU2urLnne0Zg/fdhAv1rq1J7RNI6UhZO
	SChYZTL1lkJ9gd24wAlYm8KkO4mfE23mudNc+pw==
X-Gm-Gg: ASbGnct1oiifHvbL53KvaGSjDqXdU+jACnbRDCR8UpLnXB0spWxtgTeVqN5P2jWLI+2
	n61/d7LGE47YrbM1UBlrbBSgNkyiuBFD2LZHUucCnMVqbmtykVeDdtCZxTmso6l+lJjwF3YcggA
	7XgjXl5dDrdZRakJHqvp0bX/r0CkSQs+x6zqkILrCLgck=
X-Google-Smtp-Source: AGHT+IFnK4yMmep2oyTd3Pj8ao8ZioYGFRMefY/RBKYSi7PGi/PRviB7Soxar1b8q/3OFeF6n//VAYjpNJYFXydwDaU=
X-Received: by 2002:a05:6512:ea4:b0:54f:c17a:9ec6 with SMTP id
 2adb3069b0e04-54fc67ed719mr5685544e87.55.1747128760174; Tue, 13 May 2025
 02:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1745605382.git.Jonathan.Santos@analog.com> <f76579f8aa040125568c044c86761211a2e2f5ae.1745605382.git.Jonathan.Santos@analog.com>
In-Reply-To: <f76579f8aa040125568c044c86761211a2e2f5ae.1745605382.git.Jonathan.Santos@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:32:29 +0200
X-Gm-Features: AX0GCFup66n6QQY-S1ZUx_c9rDRe7cXgMWjG_C9fMa-KAt7hqRpUWdgbNpUpBRs
Message-ID: <CACRpkdZG0h+0vDJZSt_UyukYXVTX2wLjK-JReqgutJJ8zJS_yg@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] dt-bindings: trigger-source: add generic GPIO
 trigger source
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, andy@kernel.org, 
	nuno.sa@analog.com, Michael.Hennerich@analog.com, marcelo.schmitt@analog.com, 
	jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	marcelo.schmitt1@gmail.com, brgl@bgdev.pl, lgirdwood@gmail.com, 
	broonie@kernel.org, jonath4nns@gmail.com, dlechner@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 2:12=E2=80=AFAM Jonathan Santos
<Jonathan.Santos@analog.com> wrote:

> Inspired by pwm-trigger, create a new binding for using a GPIO
> line as a trigger source.
>
> Link: https://lore.kernel.org/linux-iio/20250207-dlech-mainline-spi-engin=
e-offload-2-v8-3-e48a489be48c@baylibre.com/
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
