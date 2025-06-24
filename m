Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DCD24676F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792386; cv=none; b=kQhwtxmpzq1viYhh6pfF2EGz3Oh1hrYbW5bdBPoADCcBmYR1P2xPcSmD0+Bbqvgvza1tG1jeO6RSrNaDN+BS0UQyUJLsDTFPZkr84q/ATF0MY/WbsR7Qs3v0Kw0P1qLyHSroQoKTVt+NL9fS9kyjKEZndkOa8tJfC3O7huS8hRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792386; c=relaxed/simple;
	bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLidRTRJEeo9+xyZ3fPDkE0M0nSOx8JmB/8GNttXOvv+GbhJgCM0sd55n8Q1tq+OQ/ZPTP9AK8ct7ETyFwWfA6BniAjOsEN+pAKgi/NwMYkapoudEI2pxi2PONkTeTG0xHhCcrmdd5a3JMFaMdvy4/2+Od35waPm22sIG0YmF8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcEWnDsQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcEWnDsQ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5535652f42cso866957e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792382; x=1751397182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=EcEWnDsQfqK3E2EJB3dSSxyDt0C+Yl+uTkYLfXeSmKYzT9k+qyXXhAgorEZFjBsZLv
         Ym0ZGZOpq2VlG8WbfzGDrgNTLZRQbANcwtIMvlechN+AUTBychff0jY3NbL4GYnNZQ0v
         rbulk5r3iyvPqfnpSAYbtrosRJfLTnZrPapMuLJyWlRlB5BWE4fNwaNIpullHPyKRI9p
         ddjOhwA71dlrjBeARBDS7le5jENBtbwsuy3+p6YRBPXJ9PcpFDsGHQ+elcOna52o79B4
         HNqk3eRRco0LJE6dJPFcuSFtvtBLWk/FUBj5GoKwJs71m+U1QnwFMTJzIdTx7cA7Y0bb
         7lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792382; x=1751397182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=AzjeJgt6xZGgaWwJtTFgmcT1WZuLpNf7itEr/93v+W76Q7kxzqJTA9tf3N67wQrR0N
         MS3IRgCg5zHvBuEuWkggCyvzOz3Z6QLX822J7RhImQfN/UCMz8fC3qIMXBMSfZj9xJ/0
         oD3VodZQqr+QegKG21FUCJGaYwmj6ra32Y81WdZW4qy2nqlyhltHg17s3ffA7CFe8vP2
         xf/6z82efV4xdg+QQNTJzLnTqgwfy1QzEGcU4VWRHR73itvnTi0nAHTL8eG6rcL9dUvX
         iBlRbYEIU1z9VUFHlRhE3puGwhG5D9quxW+afbtAyUALIoZWo5B5FSOFhO2eeMlZx1kR
         2DWA==
X-Forwarded-Encrypted: i=1; AJvYcCV91fu84bF5A0zFZAE8oBiAmKPqGiI1bEjLYOLUD7/GiUV0z57tUskKdLrom+wrUkBmDgJVaKwRHS01IY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO41QqC3HeGgPJl8P/EOiw4+39aXt8oe+RagSB6gCaYJZOhyL5
	pGzQOyTH+gCix1a1IQVFQnGWzcF3qCMTV+675hKxZAqm4VjOJCjmHFywpd8z2QK/bDBtaWBqrsE
	zMHKWidAEGAmmLHAUqFGNy9xraUMRrC6ArWZzYS61Tg==
X-Gm-Gg: ASbGnctx/Qt+nbIKF6bAJvbiKwo5PmZLuYpahB7d/F4a5QKBUC7nIr119UQmJ9hHJSL
	riHhf4Yo1p0KRSawZ/Nct0FuoG3LQozutIQAxf/m0kNLc+Y+dycQJBt5kKREiGvrOHZ2tDJ+w0L
	nXHtzdK8UykX689WInDRYr4YsaUhCV3+qYsxCehNaDWlw=
X-Google-Smtp-Source: AGHT+IFcvsv4Jx0wPVU5q9HdOKD/NjVsRLZ8GzOGiSq6bCzhKJUr6IeEsytMxz0Nq3UnxW9fjOmi1xt9+Qqg6x/9RLE=
X-Received: by 2002:a05:6512:1247:b0:553:35ad:2f45 with SMTP id
 2adb3069b0e04-554fdf7c090mr5733e87.50.1750792382134; Tue, 24 Jun 2025
 12:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com> <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:12:50 +0200
X-Gm-Features: AX0GCFsyGEH8PEzLkMow539_Cj69jbmDRSN9FsVHKoXlbloZW-99abb_OrCBGA0
Message-ID: <CACRpkdZM75HEZ0DACqC3iY7S1gLurw29Z--C7TJxUVxPUTuNqA@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/mcde: Keep up with refcounting
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:19=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Put the panel reference returned by of_drm_find_panel()
> back when driver is no longer using it.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
