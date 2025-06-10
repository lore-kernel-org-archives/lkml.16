Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD4323C50E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573316; cv=none; b=c9nzQPssLVeGO6og0ME+F2+ssngOf2nBgWIThA/PrpxWVR2qXS9Ogpdz+6oEbY2385/OHtBpIGlbXDXvyTg34rqhG4uybUivrR4FRNxZPTsJnSN8OppwEOycrCpGtSGzFTdkLuAFKMPKOzN1OT3aHJV9Dts52UxwkBI/74gWC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573316; c=relaxed/simple;
	bh=E9uy+WeeyTRFWQAhgxLER4hMEEGRG4YhfQaDeAKuSp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcT6UeGTKCUu1BXy7ukhBzbqD49RTmpUd/80Ohu2/CQKe1eHU+kLYYbHX3678Zd1mzb7kDqZuee57z3mJ9qca87AhiYmrj0gbvpHbxhIfGZOi1u4KsaBA8cOEeG8g7QL6z8kcfIBi9VruLf0iBVnUu7v04qLuv44eZOLNLNzCZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DgpP/8dx; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DgpP/8dx"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4067bab37a1so4802096b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749573313; x=1750178113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRKty4r5poxGqV6J4DOkHwQy0EnjswzgP31JT1/VNiE=;
        b=DgpP/8dximKpiZrny1GUVXOvXilQs2mIGbhSKJdCAVrGJB097EiyM72GTjg2QU2+Bm
         Gi7muDXHS/UA/Zcy4n4nVDzF8s3775IEYXDQkbcYR3FUomk+qibRw35RXEb5N565BMHr
         o+2LH+0t++GpuxMmFzex8uArAyeeh9v4VtgaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573313; x=1750178113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRKty4r5poxGqV6J4DOkHwQy0EnjswzgP31JT1/VNiE=;
        b=qXKFmM8L0uBC85oh28pMxlSvTl9kLexSwAOFzcKS8LpM+bbvJGun9imcbnsriGzWei
         sPb0kx7gAn2QxQcWULG+27QJ4lvxamyZSZ6uruljXhTSqyR8F4cH5fvi+66zqDTojOtz
         OkPfcj1295tPztPj/y7UZbIlsm91YIxFmpnRj1kJW+TRDTDK+koiAbCOiGvoEZZ2aBhI
         xkFIDeM0UV9guAe8rxJqMYd9gl+1nBUns+b3InXUKfSHEYKwVhrQOV53U8lgHqt3lRXT
         clx93j/iGYGyEB+JJ/9s5P5b/nWRSUruMpnC0YKNX9344RPZxvPTGiUOt6hwSWk9MQR9
         N/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXJVZNwFa9BTs9oD7MyxJaDRsvs34TgDCnvuD4PsvxMwIkZGgn7QpynxiT26wUbiP+PL9D0mtWfCW8eqW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNIJlsJtDQPIpVRWPhqOscXL11SwoxFxZiVFWP9tw99BT5P+QX
	uttIlRQ4foR1wst8izsVnBkXB74zAns4Ty01saYfYlEEyI5bd9vj799FeY4A51R5yQ61UTlUiWk
	VTyoabQ==
X-Gm-Gg: ASbGncuthIY60OJ+Hp7G8UonMtkpKdS/QIxBfCWy60tTWxQry8k5y/JOE8WuelS1gyS
	jzLHt96XYDCsTWLBI4mI84rJXOhbFdHqnNuOY33PWXqpqgxgGCE3TNuLS415NpkxdFt+qzu/m1t
	YQD2O9JuvYdqBHw1GViGo/KOtTcPyNixpLGI7UXK4f/mZjh7S+aYhBWZQiWVjv1rJMNmybpmR/b
	d/nDWjpueH1P9/PKnJmVy2otoIT3SvCNaNkwiFnfHvnX06UUDik326sQsJ74bDHugoIlv7L1bVA
	to45HzRydW2lUqCtDJxNK6ljzzJgilRCKSnnvfUNNZD+mH9C3S48SkZ3UQFSIxqxSg837+mhYp1
	K2ufb/PH8JBz/bR7CpmpSu3PwdQ==
X-Google-Smtp-Source: AGHT+IHRfPIzghVdk++vUccwWLrRSUuTdVKVJc7w01kRULgMunh5LAMrGUxC1z13qXbW7I6xP8QIOA==
X-Received: by 2002:a05:6214:d6a:b0:6fa:fc96:d10a with SMTP id 6a1803df08f44-6fb2c365da6mr1903476d6.27.1749573301772;
        Tue, 10 Jun 2025 09:35:01 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09aba071sm68815966d6.24.2025.06.10.09.35.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:35:01 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecf99dd567so72275836d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:35:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiY8KRjqOwN18Xz0uYp8c2J0pauj8VdEjgEuTawbB2/mS5nGhkVB/jXsO0dj6pfAJWXZ7FAOD7ql9yxNo=@vger.kernel.org
X-Received: by 2002:a17:90b:3949:b0:313:1a8c:c2d3 with SMTP id
 98e67ed59e1d1-313af21cf49mr214070a91.22.1749572858943; Tue, 10 Jun 2025
 09:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 09:27:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
X-Gm-Features: AX0GCFvetYujnkiaHWr_4-CoTJH6_0-yjm9ImscbNd_BInX3tRbNZVj0ki_sWAE
Message-ID: <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 10, 2025 at 5:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones.
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Looks like this should be fine to go through drm-misc. I'll plan to
apply it next week unless I get overly distracted.

-Doug
