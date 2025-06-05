Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77122FDFF
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129940; cv=none; b=GR6+7ZXVMitZg+8Xu0hVr7/gSL9sCrIha3lrYhtgHWDEJocbzP1Kf7dIlj+1litrmcw1lbAWHr9JLhrpiWTSZjIetJf9E2Gb7h52ml4KsGOsAIAtLl4VomHyBVQuWu6lOGMu3s6mx3/DlSkMUClI6OOf5gJvlzl+Pl0XcUUi05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129940; c=relaxed/simple;
	bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZ/dfzTogELmAg5kS29olE7gbrop9dqQ6/FvxmFo5StmloEKqls59nUYTmzKDtPMeDRb3Oh45Y83FwTwYZYgiKvWYfDSI3bYa24/SXRfs3mphVx9ZwR3hrCJkBXadvvgRwX0xMt0TMbweZOgdSoXZ4B/QBHsp6mv23j3BT/YwT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXB16Xx4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXB16Xx4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5535652f42cso1022072e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129937; x=1749734737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=mXB16Xx4ng1JVwsH9BePsKNPf6mXIE9Ogtyrd6h7qMxYXSuFU4rGZyHe8CpjiZiqb5
         JLSJqbLSH4kqzeUgXVFVBSIKOxccdopB2FA2t/I3MWmU/U9t6x3II+YaXh5QlwcqrVXy
         IyukmVxpLzu5a3YfWWZCoKvX3Ot1TFV0OX9dZTn8zzBpdQAtmwdBL+mdSHlNYVZBOhwM
         96vY/J7BclkCB4/5AZn+3LNwsh0Nyg6gWMfTktTCqo5b2GV5zi1xzN2L29ltkGfaiVAo
         a7amm3oquRPa8wL13zraL4K7XiceKDVOWL3BtDy1INVBQKJayMN2s232j4E9uxfFK1U4
         5YRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129937; x=1749734737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=PdEHYC+9a0d6hjjbe57b/ZIlPQ1REBW88kakqBSgnHPwuhZJjF9dWUQBCQgBC4Kslb
         p7x0kxpQ6OMjdEImFJCUPuIiargkNF7Nczrj4XB3kKFJJXAoBqyem2/dJWIWGZyvkf9f
         I/pelMwVWSsYAx8a8CUxagm9nTgwAFu7Cf/dd6a8fFQ6MyVE4HK0pW1GBv2jigEyEAdE
         vM3VT5z6WNcoLFQODR6CeBn5Ue9sEEpE5CR1CdP9P5Tn1+/yY0ofd9pbFtmZ5gBKp6Vu
         dP9/EnOSrs3TNV3QNm04UYJZ4EeJMYvH7JN2K56c9Wxk2y+HUj6bgKLJhlh6gKdXhGcQ
         xyHw==
X-Forwarded-Encrypted: i=1; AJvYcCWpoizoqz66qZBHSnWX/7OJg+cw+DtWHyvId4M6ywSRCB66e/kpbEUa1G27QveKdC4WaeRpuU6b0DHxOtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5FnT9+BkpsF2Qk88Tsvf0b4qUzIMD6uQNDv7dyi1ne21BETs
	PptWc7fffdY1G6uBSGnxO5SugVkeaKM5d9uhWkK5V9P3FaNCoJjxXWiZgkt9OIQ+dcpDtua2Quh
	mF7SjikK0Epdz3aOzY49CMj9tFuG/o5gac1VSqdTnrg==
X-Gm-Gg: ASbGncuzsqdtIqWVBZ0kRyNSiaaytBi/n4wyMUOuzdfTIeWdNofQafm1S0YM78YrQRQ
	ga7jmwWhLPv6j7Qhs9FghGqvCvUkOi+CSqGbIxlaYfTeede39aMTAGSU4eyDmeJPF7EOLGaOLri
	/P2nUFaEcvBrX182NYjJTEPBxTVhnKDifV
X-Google-Smtp-Source: AGHT+IEXDLuUxYBO7fxS8P8ms4WiU/xJFKvEp/hKMmovCR15hms9m/g0A6FghTW4kUyhFWDODOXMqMLjOLenFT8s9LA=
X-Received: by 2002:a05:651c:994:b0:30b:f283:5ef8 with SMTP id
 38308e7fff4ca-32ac71bfedfmr18601411fa.18.1749129936758; Thu, 05 Jun 2025
 06:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-36-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-36-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:25:24 +0200
X-Gm-Features: AX0GCFsdE6ka4seBq476pc4kVds9Z70NwuFBL-Ad03eDGyeURiB9xBYNtFeP04Q
Message-ID: <CACRpkdbbwGOF6URoYtjci-muvBHUhT8pRu6JXR71n3LpicgSzQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/46] panel/tpo-tpg110: Use refcounted allocation in
 place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Robert Chiras <robert.chiras@nxp.com>, Markuss Broks <markuss.broks@gmail.com>, 
	Artur Weber <aweber.kernel@gmail.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 4:52=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
