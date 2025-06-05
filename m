Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E997237162
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129913; cv=none; b=M2L1qVaMQhDD0MmBtpg3KpJYiG/nlK7difz95wdcLAn1srHh5Q77MFDq7FDecXOGospi44dLd4LFSptLBLPQMIt7/D44B3guftPQoeCo96oANfvvI1jRabSz83CCITUF9+5EPHWi5Wprv05t9bUrLTgezoUAFpsc5NgWoIV8EPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129913; c=relaxed/simple;
	bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtByoWiN7ojOeYExaCNsfhXAQXDjqIyGz1cRo7Arh6uyinGueb+wnULbHrlxpiePCwkHGhcoUCqGRS+jIWb/zVNHvAPvNdIfZZhzqLwqHFxXefCV9lRRJHFEpH6rNeoXZ/qfmo7jMKD/VWCbuUY+hV7kBHe9znJXGrTTsXlUTbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HihHu5UC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HihHu5UC"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5535e35b059so908361e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129909; x=1749734709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=HihHu5UC+6+laucZsVQUgJ8EdY4nObQk+LXuAc5f4t6fC2IX+BRDQo3T2FfsMPIZtw
         orxgApOOtlfMRR2oL0I3kTTPfCF0Ybjumd/TIbtgDPV275cIoLs8wSfHmh9U45bXl+XL
         vlcG5djNzrct45yHPHsypcXaHLvdtf5hF8BdetjsK//Bx+lVvCNtvM2TkjOxhb253org
         Ij0LpcNmz8D6UdTaUEuMH4iyU28KPP68kDW3qRSGoohHjOU2kYedycVA2DkC9CRDQ/We
         i3iuN7pB6khLdqwBX91lp6i6wf7vJaIpib0cjRQl2K7cdmQ/4LS/lfGwdp18ONRZDbQu
         WKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129909; x=1749734709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=J9RYNnNayji/Iy+dmKvcPbifuraiwR8bmaJI73wpbWm54oin+6ZZ1uqK2nrUJVo4B8
         qEjIlblJPjHimYyA2E2UMmDzXK8hPHa7bhtK4PESDIalgmXvc4y3OdvPfTtr4aDb5L0o
         p0kRnfPcTOjptHzFlYcoRQRgZJSnjWUIrYMesfPKKIThUibulLFs3m3w90C3HfewrfR/
         XBbv0VOWSObt2Q9JT4OjpTUqwj0lxOy6/oT2vf7B2yD/jC1WCB6nr4uFDr/UhnA8vGnF
         ubzwmhYaA1cdGtOHyUqpgKudKer2imW+Rjwd0AMauPKha61suRzxRCXkFwcYYVuP4bF9
         OQvA==
X-Forwarded-Encrypted: i=1; AJvYcCUF10qCZzN6I73Ky2/XWzjb6CoIR1SFQYqSBGEdaIyFBB0EFumfltZd0fIqXqRlaDRW4uCBKg9mJf90g4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YysSLtRdRh/tSXkLX7e5bvFDKGEGo68WzaqqfKgVBy0DnpFWsq1
	ozLhbEm5wXYvQlhksf+rvSLIem7VC4YmlH3cQBzSiP/0lcZFG6e+dK+s8RXZiEkUZt4Cpv+3cRi
	JEJKoxUNlo/2pmnEMyE85NLK8eT4ItUCTlBrExKDxzQ==
X-Gm-Gg: ASbGncuNnver6k3WRh4BaRbyJSCTpoAhQI7VyJtyt/KfnPPYKT6nhEkK0h5G4+sFTs8
	DjvyHhiTwV5N2sfVRECxOrRMto2X9Cto86cDOdpjNZHnwE+tup38N7i2RuSjZncjh/QwlYBHLGl
	Sno8b5WxgoEOSb9s9LNr/xx+0iBdOR5PK5mb5WRHr0WZs=
X-Google-Smtp-Source: AGHT+IF3sXGaPyJ0XISPPhd4itJm+I/bxd4yDXWrIuh/urkZa6iB32j4QI8PHWP6SsXF9fH8sesBFbcCxG3XmlTi4jA=
X-Received: by 2002:a05:6512:2250:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-5535d9382afmr1191878e87.26.1749129908619; Thu, 05 Jun 2025
 06:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-31-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-31-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:24:56 +0200
X-Gm-Features: AX0GCFsuDOnRf8VOFhj72Sq5BRDaYd4ZYfTzaT_rcR04We-Hc_s5kA1IErejF1M
Message-ID: <CACRpkdbisyKvG20fDV9tHcipr-+en8Hj+pZtvv0512oxzYwp4w@mail.gmail.com>
Subject: Re: [PATCH v2 31/46] panel/truly-nt35521: Use refcounted allocation
 in place of devm_kzalloc()
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
