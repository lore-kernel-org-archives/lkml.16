Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC331119A
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739046719; cv=none; b=MMLSEG07uK3kC1bO4YvXLCzaFMRGCdluV+TTbVLw4vBdKnUhNtrBTENUFhjAxlq2/8on40pafEFn1M/lxqgJ4UjwcU+m6EaDGn7+DAvUyGzQHi+wi22+9seRxbf0UT0n0veLJHQI5c4QpqNfNeC1vKyel2ToeeQT0NHCAp0wdJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739046719; c=relaxed/simple;
	bh=6FhoGigg93hbhRP8Lf1UPXwi8h34E9BhfLcHwuSv3ZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozNgtiIm6qVZeFFbiq6wT03MLws7Ze++oi4u59ua+AHgti3gREdWA/Js6/7XDTBMEshmcrTilaG7xDwZ27nWGJdyLyHs3uYPnmnmHLpqBY65R+7VKKkfjYLEm5s2U4dkc6zKbVdgUF8R7g5WFyJa8Ib/uw/meFNUE638tTcJ/7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hjVt2cAG; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hjVt2cAG"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de47cf9329so3070249a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739046715; x=1739651515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJDerw/xfRXHgl0oLYxXtpLYP2/HSeFnhpjbjeqGC3M=;
        b=hjVt2cAG3F6K4S671PUqqFI3BJ68SvAvsjYD9lGUO3mA5p+MnW4fNqUCtXw1aup5Yo
         aOpru3oRFWRL8o/U+L4XlkXnSm//KG/IeokNvegi4zVDhDEqSQ00RNopZr2vKJhD5Q3R
         Wkkxt1oyholLevRgQ0jiabC79nVLuj1WGqFIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739046715; x=1739651515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJDerw/xfRXHgl0oLYxXtpLYP2/HSeFnhpjbjeqGC3M=;
        b=cEOVLT9mfejKhJVWNigYhuN1FwX8AQpOFGlryKvBJ4L7KSxZ0rXyCuJb4Uq1FRH34q
         JU7RAv7rzYDFx4JwBklngzYT4OSc1KVPb/7ORIsNakZA2ZMEj+O6etQKgPfVmrzbx3pA
         r5GNixEMtmt+dVci7GkmPPStLX9xHtJSX+JW/ZyoVpzzIM8QUB7/a57bFCTsxJJwVWt+
         +xxeZgPUO5su5FUodt0HoozBKENzXfyPekkMOy53nDOx8jtxV9T0jgUUO6acRieAfhjP
         Ubmp58PaO12O5AEtRDjVC2BjWaPbevx6kFcHsWmjMzGtBJIuiSZYRSowWj2JVLv9/m/O
         0+bg==
X-Forwarded-Encrypted: i=1; AJvYcCXsVs232uQyVDL9q0b8yQmFj1QqNb3FKnxMfpIVBp75VzngbM1JPR8SVuR1Mp+h7yqkMaVlXn2pipDPfrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTH+4KdgpH50u9FO/g/n/NtOsgamH4Q99muPJkUCi6rNS/m5M6
	YFBMiaGBVoXZU2qwrH7E7GYf+GGuTiX9+MAnf4ueFetd+fXdQC1ixR1nQ25k1HjkXWAMtWmLEtB
	DEbIB
X-Gm-Gg: ASbGnctNc+mR7fOFiLHmD7rcdyanY+J646ba9qbI2HXLNf2PRegdQHmxGYpN+h54Xzj
	wdZ6IDOlVvqLrgg1DRZnMjPV32Cw1j4GR5vF4319n9pMaZ1mkJTH4FVYv8PPTOKrJP6i+7Pylx3
	rtI9yjLkZANDa1iXnr8sWWHrnVOSBgKr9jTnNylpi1J8L6LOTikluTYkJ/uHK7+8rOMFqHddIQ8
	74rvGzyBYesweU4tvaxc5v9f32lo8APPT3X4nnDw/8/jxp5P6eWIsfc/erMv80Sbb8i5iQ7zfP/
	8pOlvzHV8CGInZELQZ3k0OrcXKTIXZySQciGbD2lCjul95fvtVuKzbk=
X-Google-Smtp-Source: AGHT+IEADSXRX2tdxZqBxSn5Ukdupwo2gh/xSi6OhQkb+qyGJoqlnTNFBYcdXC6e4Pzohr/JQTA5dA==
X-Received: by 2002:a05:6402:42cc:b0:5db:e7eb:1b34 with SMTP id 4fb4d7f45d1cf-5de4500493bmr10651150a12.13.1739046715255;
        Sat, 08 Feb 2025 12:31:55 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de589ad711sm2333532a12.73.2025.02.08.12.31.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 12:31:53 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so745643a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:31:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXZheMP07agO2dD1czPr3L2w2LsrAWTq01ynaMer/W1tXVWEajqIwgsakDB6+Yq3jZFCJ1T86hNW9tHzI=@vger.kernel.org
X-Received: by 2002:a05:6512:1282:b0:544:d31:104a with SMTP id
 2adb3069b0e04-54414aa8102mr2388633e87.25.1739046313617; Sat, 08 Feb 2025
 12:25:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:25:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WYNRraERUdZuytYmiWuXR3UwSRybXMZ42+2K2nbkef-A@mail.gmail.com>
X-Gm-Features: AWEUYZmA-CBCC0QRXP02pRtLlgP78Gg6EgzjJkQUKaxMq3eMCZ3nTBRkI-JH_z0
Message-ID: <CAD=FV=WYNRraERUdZuytYmiWuXR3UwSRybXMZ42+2K2nbkef-A@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: display: panel: Add a new compatible
 for the panels KD110N11-51IE and 2082109QFH040022-50E
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
> STARRY 2082109QFH040022-50E. Both panels use the HX83102 IC, so
> add the compatible to the hx83102 bindings file.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/himax,hx83102.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)

I might have tried to shorten the subject line of the patch a bit, but
I don't think it's a huge deal.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
