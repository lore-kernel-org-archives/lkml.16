Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F023A9BD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579662; cv=none; b=RdDUp6cJM2GdkhrFFpx4Z+LEQVG2S5BrE+O0mDzxdB7wV4BKXR6OZNnq3VHLxUVPDTBe4jGCNsS2JmuLmjh4WorBNJxEwqK6r4Xc9QzSytL7iSnEns42D5bcyq+SHgOMVOY91nw8OSUwYN0sNrk9UY0PJ+RHV6CpnL4KDcbLQoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579662; c=relaxed/simple;
	bh=LEo27SpxoT6z4tyv6TX/oS4QzkAl1cDA2pfjJ6uCnsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGlPjPW4dPCl7z7WdW8jKpo200bmjO9qB+NAnxVAeB3elajDrJZ8QEgQqEOLI8L0/8f53VmAWdH+2fznVECv9unc6O7I3Rg9GYL53dXb7RCPMDwXNEFqetPbO2WAgYvLMMXl5Jt1HbM1vbj0pksm13kbRHGzXePIRRzta8aw2xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LH/PsIz4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LH/PsIz4"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso434989e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579659; x=1752184459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEo27SpxoT6z4tyv6TX/oS4QzkAl1cDA2pfjJ6uCnsA=;
        b=LH/PsIz4Rdp3SZpO6iSO4RMi70OfPm1+90Unk2x8B5XbUjnIHXB7dpdjgq6tDRF+28
         nkqoaNOm3WVyYFejAqUT+gzgV+eO5EVsTAjxso65fqWpNSZEWs1bWFDm911HaBDkIJxX
         ZlnBwIR8Mg8d6qTxyA9v7yaLm2erhEbGpWbbO+ChWfUZ3V5QTtTqV5vr0vN3HlBA3ea6
         hjb2AtcKXgcrANkiWxyB+kiLcknGBofa4bJ82rJk8Bqg6wHOoS9pX3LijxfgEJtonbrO
         /Pbrmz9e+0+OpNtPdzLOTmXWDV6NYprGu1OKQVYcu4Fsj0iYooRzvTIQ3N35KPgtAeSh
         JR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579659; x=1752184459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEo27SpxoT6z4tyv6TX/oS4QzkAl1cDA2pfjJ6uCnsA=;
        b=JiRpBz14T3Y3KdGr9HVL6DuJ67aM6LXuGxj9CB/ect8P8WSrYw7XOXDuDhN+mgexFc
         YNfh0KK+kXI8bPswEQrrnoINEePQf1M8o7WwV/ulYdvYR5VjvKlaMjyDBwB70ZGhUUtt
         AB1zZMgqKZ6iml1HcGcypp5F0lxyg2LIrI7mvFPnAaJuFrjU3C7hgyVT+RkF1KyjSOgB
         /6S/Ce9vpiHUPhAf4gy8QeROD7Joxx+W4WIwPDws7R2JT8iJv3RIdZg5d1FeqCqCLzCZ
         i2qnmQqA1hNCwCA79vnAe80OZPDzzx8HNo1UdiYNKb7O3JMvxGwbgQJCBkDRCbFcfHJ8
         w1yg==
X-Forwarded-Encrypted: i=1; AJvYcCVEZAH69tp34EvOfF5y1mWBqCrgEhrkbhJx2CBVZRCQ2i7XRlRv73rbatbIUm1aE4nLVnNfZlzPzoU8McE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVy+8dj8uNAeTxrAUXnclCQjk0joMoMnvm7krwXRLUt+l7SCm
	gsIpo6+p4xSf5BWk9p5EqqYbp8feGwpYbbC3jh4vWGCdbSbTCwxTYLsmKcLbSBhQ9gE6PomO8IV
	N3dEJ5hUBT5+sKhpQz5JSEt61ui5b1O+d9fRYfPRn6Q==
X-Gm-Gg: ASbGncv40x7YNmfpiqZa84tpXoPxDPSZ+mH37UAeaW2WdiuPS4FbyaDA4D4i/C6LW+Y
	FPYRmvbgjlKmjFvr4LwdAy9PBlFlz2XHGIfsfZvvYwFP5FVFQ9KiW+y/FDPDWXbr6nk/QW3Hzim
	JGyOtGPS9k0FE/B1hNTR2tqH3rBqIjQrLwI0BYuICsJjw=
X-Google-Smtp-Source: AGHT+IFckUZv1qDN34YL9xP78RpLLOjoYJYZ+wKY65GHTkc4fwzbahypUbKLt2uekYZ4NWpbxz8d+9N/6fdIiPphiOQ=
X-Received: by 2002:a05:6512:252a:b0:553:d910:932b with SMTP id
 2adb3069b0e04-556de26ecdfmr19471e87.46.1751579658980; Thu, 03 Jul 2025
 14:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
In-Reply-To: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:54:08 +0200
X-Gm-Features: Ac12FXz8bSnZw_fU0LoXZXBdvuWYVqNdvL-IUi3U2zwuKMo-p81WILsJ1A0gEfI
Message-ID: <CACRpkdZ8oHJeHydLcMmtttJiKSGybX7vmhgPDEjD_4SDoxvCzg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl driver for Milos (SM7635)
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:56=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Document and add the pinctrl driver for the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm=
-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
> - Link to v1: https://lore.kernel.org/r/20250625-sm7635-pinctrl-v1-0-ebfa=
9e886594@fairphone.com

The patches look entirely reasonable to me, as long as the DT
people are on board with the compatibles I will apply the
patches.

Yours,
Linus Walleij
