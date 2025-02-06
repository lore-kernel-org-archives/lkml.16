Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088722616F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834761; cv=none; b=Wh3uIKLK/ltNIWD7elzd26B9YO9WTy3mXr84tCoDFqdTMj4Ex3ghaCQ93DxST/xLdVdLkODlHLDspQxgaH0/EGMSFQ/MsEk43ho+AymfwXWFyrYoIxvh6S3/zl3SgZyBIGw++dSDnvk1HGmF7U3bJwcJqLXG56m4dteANxAOK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834761; c=relaxed/simple;
	bh=QxqCdZ87Rgx4ITls+sBoaB5NXU+rg+6sFyys6kqsgrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaGn1m3Fu7/mLKA3MzWfC3zX8q9MrD8eNGOYQcWQGlrXjChLBW4ljhDQ0oGfJLgA7B8NMNiSVrZtvsGjs0OpD9qJ9qzfjIgTKjK3tb2zPb3ZEmaOYUv3l29gwTVNcKdC0GBx33xy8XxBHUf4U2Lftd+V3htsXyjC0CwWNcla1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=licLhQ5e; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="licLhQ5e"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5440d1f506aso805386e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834757; x=1739439557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxqCdZ87Rgx4ITls+sBoaB5NXU+rg+6sFyys6kqsgrM=;
        b=licLhQ5eluAjHoFsYIbW48leUXFFrxtQZp+uT7wowm2HOsPHZS0jcfoTUJMckdz5Q3
         Jfh9DeT40HqnUK7zLqMjbUzW8IFVc9DT7Sk5w19tf+M5zO+J+Fe20wmBeVrjdtdcT0q9
         GrYRgeOfHC7Hll22udPz93wCAAbfvD8Qy0ck4ZdggdcHHnGnOWchX4fJ+IYU1Zl1QN1z
         a2WMRH25KGl11EIFVZRTPTytWmkSF03w0a5/of72MmZSLewa/4qLD6cvOg7RvDYHxGF+
         r2Ii5U59SwZfrL9joMoskb2bze8zTD2EXP3ZSRIIYUiiLj2Z9w+YpYl2C10IU8A/r81w
         qkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834757; x=1739439557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxqCdZ87Rgx4ITls+sBoaB5NXU+rg+6sFyys6kqsgrM=;
        b=Lg87sk7DYsDcCsFjDDj8n1G7r1mp02BaG0wnmUPRZlLgw9ZivyGzbBtxlkXseM+Mx5
         5ZrIHV7udMFdnj+h5EaMBWoa6Bk5Jxgu9DPUjlccyGigS7rWKXrj3bnczsnU+Cvb9f0y
         AyYwPVwrYH/OJTra0x13cwtasQzoU7PWkG7Nh71ZDpbIITSh5vDjkLtUYDfd79VGdG9x
         doLxItvDMVOSAv1RnOFa4Bo36iC5uAoUglWtvrW3mc9KkgasBozgpUua3FqOqbWn/y99
         Lcsf2vavK9U/byADdfWlbk1ChLbZjh/cZ3YchHGlznwZ+HFjx+sq4hlf+OzJ3HsBssDB
         47nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbYQkhbI3xZGpT4YMJj6sEXquzAlcsMXEGnieLooSad6sdGyvopYwueGJW5Pf1QvozXYhDYxO9Nll+kbI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Uio5IiQfja3P4vlirQsh5uug/R8cFN55ZN+OeGacV3c+9q7k
	xGGXVVSgaNZUuISvauG9W3tQIpKGGqtFT4sKI2xQ7pSqMWq+0gok8u6/ZgMfxy/d9TUdXR9PUVM
	zV3/E3Nzq8r6ZYHeqarr0hJ37a1kmGGephosHgA==
X-Gm-Gg: ASbGncuafR1k8LibQhqvGuMWbOLsChnNIJZOX8J2HHHHxTF4IUnPU7ClLDczIUxCDtR
	2GxFlKPdNTGpic9n6iM2FuOtBSzbxKnxhZrJM6RKbHGaObVCkOzu2eW77C308Mdb4nkJ5Q+w=
X-Google-Smtp-Source: AGHT+IHy2erTOylDXjPHhr46b25AbKpq4hR75UITsDiNv3fd/IuGBDeoE5/TCxFr0JD6443xhniX9GkOIwD7QR0zOhc=
X-Received: by 2002:a05:6512:1385:b0:543:c3d9:418b with SMTP id
 2adb3069b0e04-54405a0c5f6mr1856455e87.16.1738834756940; Thu, 06 Feb 2025
 01:39:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738328714.git.mazziesaccount@gmail.com>
 <3d85fe979fca352bed4d9841e3233c055dfaf154.1738328714.git.mazziesaccount@gmail.com>
 <6867812e-7269-4686-9fc2-55afd9fa91bf@gmail.com>
In-Reply-To: <6867812e-7269-4686-9fc2-55afd9fa91bf@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:39:05 +0100
X-Gm-Features: AWEUYZlG4xyNl-aquwRcbpurNNF0W3dgBH-PwD4_WNVA671mh_9EE2XioA6hXcg
Message-ID: <CACRpkdaP6biD8ueeezBDw1P3LP6ARoJw0zfkmxC-QKK0fw79YQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] pinctrl: Support ROHM BD79124 pinmux / GPO
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Nuno Sa <nuno.sa@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Dumitru Ceclan <mitrutzceclan@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Matteo Martelli <matteomartelli3@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 2:40=E2=80=AFPM Matti Vaittinen <mazziesaccount@gmai=
l.com> wrote:
> On 31/01/2025 15:38, Matti Vaittinen wrote:
> > The ROHM BD79124 is a 12-bit, 8-channel, SAR ADC. The AIN pins can be
> > used as ADC inputs, or as general purpose outputs.
> >
> > Support changing pin function (GPO / ADC) and the gpo output control.
> >
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > ---
> >
> > NOTE: This patch is not properly tested. More thorough testing is to be
> > done prior v2 if this pinmux approach makes sense.
>
> Just a note to reviewers - I dropped the pinmux from v2. No need to
> review this any further.

Why? Gave up on the idea or want to pursue it later?

Yours,
Linus Walleij
