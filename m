Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3161E1D88D7
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365380; cv=none; b=a8AFLyd2bu+U/BIWtH3Xd4vmRMqrSU1Z5Qh+BoyfbYtBsW1px4CdOpEcY6xqrdG6Q5Cpsi8JHLmXani5jXtNh7NtmLnx827YUich15eBHH/Bn9IAJ7BDvrNc/1y+26n724SFBkRITaApGzs8u5lWmH8MZctno38y9gOOQeC3bJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365380; c=relaxed/simple;
	bh=aVeuz6U3ZP8Pi2cSgrUYzQBvgbejSBQthrlVk69LKvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+qvFgqCt1RhNcW4A0xnhLBiusE5SxKeOgTMrVKiNoUfHmXFsdRtNYam2ICwGH3AnueOCgTrDGVHAyPYS5w/PqJf9uwthxl4WbHG6iu1cCgtDtuxWi+1y6OhS8+5PrAqbsfroGtoMrP2+DQSre4a9YoT5+BcwtBjn+keF6kQWfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VXalhx7A; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VXalhx7A"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-310f3c7bd87so2606718a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748365376; x=1748970176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1cD0wSUoGRAfow7hZRrSlocwlqH/rpj2EVVATTYGe4=;
        b=VXalhx7A6Df94AlQnqojUxxGVDkk3fUYEwRFcfTvNm33R0JwqGLL0J8+epfv66KVjL
         /4Tc6wPPqOArKcMNeTaR6+I+xV3jzUaPlR1Y4m4pMcf8Fbk6ZFowHlBRZcWFubd0XQQW
         SOTKXHWrytrRqDgAz47ezIkUuqE2bd7H1hWqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365376; x=1748970176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1cD0wSUoGRAfow7hZRrSlocwlqH/rpj2EVVATTYGe4=;
        b=G9rr1lCdcHXG05cF7oXJexsqFbKoYUk4bEseX+pNSnBzLdjtIkile+PctMYQq+0Kei
         WnLCLa/uhPJGBsWOCdlTxyyiuPbChTwp7QBTWVzhxleDLvOLik4Hle+bsG6kqhFiV4O4
         zBmJIiauDmRc3AR53j4ynoo5qcxunCeuit0qUfzDLQdjc0oLXGz0bzKBy6vGkimmCtK5
         R8kRW5iz04org8Xfl441Ag0am3Vo+lQcpn2FVkR5Qh36z5zr8kC0hZIlajlsPyPLAwlO
         oB4otdZTR4tIQPPMZQQdH1xf6rEmlpkOKmDfKzZNVOHBJqrEiPKxPRwpOk49i7VjjXqc
         LEKw==
X-Forwarded-Encrypted: i=1; AJvYcCWzd7K0VrgDy8CLpXxYdJ0bNSUbNT2W9wFEz3PJmUQaUIAsq9NkY1FiUUDffAv8ps5Gba8JlNlQZC/mlnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/D8CYc1vterzhsFsNZkwIpPWauOAvTIALw+kal6ci9Ieei35
	MY8eWL1O01QRsVJ0eIMSmZbAfLmqBucviqS6Wo/XCFdIitWzervt+/gViRVjKuYrrIM2z+BWKiL
	wPW0=
X-Gm-Gg: ASbGncubj8jSOn3EgEShqr0vYuPuo0dKysNiF+BeSAuzUjKCjogG7xpmszl23l9n1P0
	SSwg4iTZ6bzquLgyrSCsgv5dUAu4nv13relb4luZTAdhI+hZbGMCrG0+If24xAN9QEVvfOICXXE
	kP9Qa2IqqRwhE+8Ye8TLHBcS+/oe4b+7dLP4ggxvFZ0SBOr/nFk65ivfYYXmePwXFJm1WqXLXh3
	SKiH0Lk7AG7b+clFPUhWjc4+vRMXl+XyNF2IoW05qKVWf398BgoM/9LKH5rpJD91ANSwFJU3D+1
	fjnCNPTFlII8zveIlYE33Hkpr5PTOFiIJUmIuPfzgcKiHHfrrFiywnwcJi/Q7JXO60pUKbvK7lS
	uzt/USxil7TvFIXRUp9A=
X-Google-Smtp-Source: AGHT+IEPm1h2H8x4YzSxfD2qWVsamBqJB4qdduk4xKnNgAW4ZtgE0eHfgnwYJrT22N/jUv4KIFBzig==
X-Received: by 2002:a17:90b:17cb:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-3110feeacfcmr22162240a91.24.1748365374074;
        Tue, 27 May 2025 10:02:54 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311b3ed5206sm1419547a91.1.2025.05.27.10.02.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:02:53 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2c384b2945so1374489a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUB4iR1rs1Ozyb5B5hOrFTrexTOKLBzLwE1vjyzMcoloa59HKxlqoVGUYynDq8oS3EVtiG5mayGNLJdMpY=@vger.kernel.org
X-Received: by 2002:a17:90a:d60e:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-3110f0f9b4cmr23039125a91.10.1748365371916; Tue, 27 May 2025
 10:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz> <20250524-tb16-dt-v4-2-2c1e6018d3f0@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v4-2-2c1e6018d3f0@oldschoolsolutions.biz>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 May 2025 10:02:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1-xhzWjftAkSiwTR5AE=2nGxFSaiv18_KXFJkKL1USQ@mail.gmail.com>
X-Gm-Features: AX0GCFuyCqgo7k3OkEiBoeoIIm92d204Z5xqTgDrr1m_iEfNQkkSSlBFML6TL54
Message-ID: <CAD=FV=V1-xhzWjftAkSiwTR5AE=2nGxFSaiv18_KXFJkKL1USQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/panel-edp: add N160JCE-ELL CMN panel for
 Lenovo Thinkbook 16
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, May 24, 2025 at 4:48=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Panel is widely used in 16" laptops, and also in my Thinkbook 16 G7 QOY.
>
> CMN N160JCE-ELL EDID
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0d ae 2b 16 00 00 00 00
> 20 20 01 04 a5 22 16 78 03 28 65 97 59 54 8e 27
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
> a6 00 58 d7 10 00 00 18 35 30 80 a0 70 b0 24 40
> 30 20 a6 00 58 d7 10 00 00 18 00 00 00 fd 00 28
> 3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 36 30 4a 43 45 2d 45 4c 4c 0a 20 00 95
>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[2/5] drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo Thinkbook 16
      commit: 126bf397bf58485cdd631824190cdcfeb86f5d9b
