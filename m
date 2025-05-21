Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4422FBA27
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815291; cv=none; b=EX6wQgPwCEE2hAHlO7zu1X+DnHLVWQHzr7tvGoCaZS7turG5iVf+8ti4HYntM5+9eo+TzNKbDV8FSLmBP6Wcr+FaVG5qzVhGoj8XIESNVJAjG7C0m3OCgG+QigcIH8XpOBBiS00XFU6NXhnTgz4Bcv8cPfdQNluDjgKVLwUwA28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815291; c=relaxed/simple;
	bh=syWRW1QS17gGwTZy100XkgZ2g2OOWPNtA8PCK20BwUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjRmybLGXIDmCy6eZkTCQVv26wUOozibUCW+92LCF759gSygAW1ma2+qhZLAHIrqDOTcyxfJ8kCc35nUbmI8yeEdnFzsJGo2flormErj9K4J1jg2P3xr4Ze2sLV61JwWrdFX68r5WouJgE5uKcRFKQsiaa2nrYeJsG17QZ/+bcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BIxKOeAU; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BIxKOeAU"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32803984059so32597791fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747815287; x=1748420087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syWRW1QS17gGwTZy100XkgZ2g2OOWPNtA8PCK20BwUo=;
        b=BIxKOeAUDgfgAF3oE5TMUAxn7/R4jQboq/lW5gN2r2XBkwZrTnimu9X/4dmIVpBNdz
         TLi9x9iOy1OoPijT5y5mYrlVue8/UB+97aBTtJ0hk7OjH5I327JLFjNg22VvG4os3BRQ
         Q9C44wwfXz8cyPXlq82bfLmmYXBkGgd3JuxbJk1SS3rk+C6eQwj3wKy5MyTL2NLFT5J/
         24GjFWRFgq5TOrNGsP1pQJCLo+5WtWl5ctndOjmXF4d05F7UB2WECd1E/KENoNl7Pj0l
         XDMnBKXzTo2NhE5+wODBN+PSbIjbqO2/IDPpwtkT56tSg/Te+cxHm8oXICm5e2NgtWzB
         7LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815287; x=1748420087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syWRW1QS17gGwTZy100XkgZ2g2OOWPNtA8PCK20BwUo=;
        b=TGAm7XPiwiLmJOmVbFGQiTfhbJY02KM/0CdsmFJrT3gCSg3hxX7zlYDto7czh6L9qr
         O0h5ckeinMBtsjS6e0/nd89dFkxlA7kxi8Lvc64qjx0SGLPGCr2t8oyTVgQNptlqS4zc
         f1SRo8WH4opwANoG0MAWUSL4ocZH5aRrgn88P3Xv5e8kXwRtEw6+bukO86QSoGv+DbOi
         bkWmTvIHHuHfnhq9VVuHd3IpmvYPuWv6DnJGOSvkl+WCVUET/+p5qmbLKMQ6szWZeIbF
         vJqpmRf6CAjN01KQZUjLtVlN+DUMqmpyJ0537TvemZZlJprx20GwPUl2dphcYJDTgqd9
         wQZw==
X-Forwarded-Encrypted: i=1; AJvYcCW3sSryoklsaeJXnyi7IFzJUNE5eVT2eadK6zhmxO6DsuCABEbEtxNJeiWTVjQgwAaJu7JhsGXii007Rpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz88noTvIugEV3/Z86tqpRLksJkquR0Lz4ylga1XsoHD7dIEyLm
	Sa/rpTzVyXrnXLWhU9sohoYrkAwUlFk8xH6ZlQS5IqUbKehXbtg4Gtys3m6OOF5c4IfETn6uTgb
	cBpO87+cxj9JjRZvxEfPsqCdtIFcyLUZ7T+UGokqwng==
X-Gm-Gg: ASbGncvRGDcYVF/vruJnWJk3SG9MYOmpgvKely/pHIYiWubDya30gO6taMFFIA5kiQx
	028mepZw3az1Md6lumDHcUHKw7RAIHf15H5n9w6NiaHBUGTKglIPyy0r67mkCC5TxGbDmcHHq3y
	hKM2HJAXcPL4yeeAPTmutv676mbj58N6Ff
X-Google-Smtp-Source: AGHT+IHILmbPR8KRF+4SEr3ivnimUHNzW6XL9Ylnq56KWMLjwrQ7rryGxn+GsjFLNI2sRbNKvbZuorXIXsMm9bnTEw8=
X-Received: by 2002:a05:651c:421b:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-328075fafd4mr52489051fa.0.1747815287325; Wed, 21 May 2025
 01:14:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com> <20250520-drivers-mass-convert-part2-v3-23-f7ae7b723c68@redhat.com>
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-23-f7ae7b723c68@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 10:14:35 +0200
X-Gm-Features: AX0GCFv9zMlrePDsYgVeRnE8XiqwGw7een3n-prsmH7v8cQLhUvcN7vdAxWFTzE
Message-ID: <CACRpkdaY5SqeFW7qfjgHuC4LCGH1gJg1haTgpk4_s+h==81Q2g@mail.gmail.com>
Subject: Re: [PATCH v3 23/30] panel/novatek-nt35510: Use refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Michael Walle <mwalle@kernel.org>, 
	Jagan Teki <jagan@edgeble.ai>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Jianhua Lu <lujianhua000@gmail.com>, 
	Stefan Mavrodiev <stefan@olimex.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 6:11=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
