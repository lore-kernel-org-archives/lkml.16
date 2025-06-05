Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE11136349
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106841; cv=none; b=I+oQ1fbrsnlLcnN+DfHbdKcykQDdG8kjdyguUq3NZG3YEX4ed9zQYzlhCNDc+S7rkPge4Go4HT1A/2hrptnNNxH0lXhAic1jzLzqOSO2xPzkOev6W37rSobKq0tFzb8sPvERdFvhLssZyeaDwA2BnGCLsWKs0yRL66FokPjJQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106841; c=relaxed/simple;
	bh=3rnYonGtJFZXruHaMe9ZO5GVQEAUIhG9h2AP+LhsiM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=itUQxlqZUCMwTIYCF8aOF5jerkmArkYNiW90/Vo7i5z1E9tiMliPQkCLf6w1j/vwEjfWwjb8QpHc35wlt7JF0MmDoKm/aWhayFrRAoysAZMCXMGqXsp25lCbf4yM78YcLltMfJ8ZyBK2CYmHeJFzQzSqr+c9dIwynEQebwhUq1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCJyoHHE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCJyoHHE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a52874d593so453563f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749106838; x=1749711638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlK7s9hxYkP0fqG8NeRDwRlzrAkK56Jhj+uxNhhkaGY=;
        b=HCJyoHHE3ytKlceY2kaf+eDmc8i4hvj2hLh1eN7TvLxzZtqgqsTLSG7T1tC0SB5sgR
         0Ft5rwAw8o3Rgn+8Lzh7uj75D6RRf8wKEv+yrdc3gq1LDgRXJJVAjZQqGVIjupGqjC3C
         lKIEgXAAIbUpWee9rpgiJ2CFCgJYTWogU4GFcGXJO7O2KH8xjwoNYp5Da6iplxOLnp6Q
         FDtA5BBZPXWcP46/scEvKOUnxO4NqljGcqteJvW+U1iN/R1pNYgTujYvAwnlN6gL9D7l
         4UZao+ffbHoqgNsmP81AHdNMkqjwgdqv4iXWvBBybThR+rmaIPUQEtDqhWXXGJpKtpqi
         UU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749106838; x=1749711638;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlK7s9hxYkP0fqG8NeRDwRlzrAkK56Jhj+uxNhhkaGY=;
        b=ftykph3pKyO+WxS4Z7WDD8tRgUpRVslr4M6pKcoAarL3KIRZ0I6z7xKqRjuN2WkeiO
         y/5bvTcHPSDsLry9351FSGbp0udGRhYS34nLfMYytQ9eSm1P2OWOsn0FJdSmIkDTwMDC
         NqYFYicxCWYgv2tBM8yDoplUGS1yZKK9/Ra1l4MrvugPtCnTXRpvPGO614gXJ+j5IcqD
         V9DxWYcEjD/jUxMwCpKHn0flsS4oWxV/6QaMon9u7CI+IGDSZABwEJ9qK999Hs1MeK/Q
         sc9BLgAJ7z6fNjSg/FT52FKzqUmvnks21eHpOISJtEX4vUm714l9mfAm/0LBwRHegO9O
         JUyA==
X-Forwarded-Encrypted: i=1; AJvYcCVzXKbLYlkybI4EuPxEfBUBO8LPJzQQ8HydruwczU9nt+gTpFg8rDV4/J6dDaPKAZkbFVClf/tjEdofICM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtXYkC8mKS4R9/Yrzr30WHky25FhagXm7Jw/wU8cWcOz08eXT1
	cPJlRZ+GTTZqzC2+WbTRPz8ADx1PYWVrrbZet3hTOXDZ8REKsyvy6YkhGecMlIfMwmk=
X-Gm-Gg: ASbGncvnRHwm9t6pxbOtcFhlXJg1tHJWau4m9m3N3puoe4cXGaQdvZ5NVoo4eMIbtI8
	3IzQCYAY3uv60dOxhb8NZ/QoOWFWjU8WDTPmWvHHGBZew5F9dsJWe24i5vgC/ha7Z9kdGRA505i
	tA80fQM3/dH0ryGIDgoPrYYQ63mQV8Lcxb2FmZ69MUe89yiTWFzPWQpZIm3E9x7u6OgO23h2cLe
	7ARlnVtTDp6cIST6AZ4gxD56yHdUzw9rEopqZKd03wpAQCgFrFB6ExM6L7H3JDNshginAfcVmqo
	YR2o7PPqDXGBEKFPvBt/qFx+qJPoyVTTyhPqxwaWj9+uxV+y0hom7UnXPlQhdyF1KMlm2sYD
X-Google-Smtp-Source: AGHT+IHRa5OR95z8ChTOsgh6ZF0ULPxGBqO+Qh7XGD0tx0MVnd3aFcSf2jaAuKX7fF2f7gm0uQ1fwQ==
X-Received: by 2002:a05:6000:381:b0:3a0:b940:d479 with SMTP id ffacd0b85a97d-3a51d97982amr4562193f8f.53.1749106837754;
        Thu, 05 Jun 2025 00:00:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f97f79b4sm14517935e9.2.2025.06.05.00.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:00:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Douglas Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
In-Reply-To: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
References: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
Subject: Re: [PATCH] drm/panel-edp: Clarify the `prepare_to_enable`
 description in comments
Message-Id: <174910683704.1447880.16330281361195978590.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 09:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 21 May 2025 17:32:05 -0700, Douglas Anderson wrote:
> It's unclear why I originally wrote in the description of
> `prepare_to_enable` that "This is not specified in a standard way on
> eDP timing diagrams" and then also wrote "It is effectively the time
> from HPD going high till you can turn on the backlight." It seems
> pretty clear that it's (T4+T5+T6+T8)-min. Either I was confused when I
> wrote this or I was looking at some strange panel datasheet that I can
> no longer find.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel-edp: Clarify the `prepare_to_enable` description in comments
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0b3d99425891e3c4a87259afb88fbd1168dc7707

-- 
Neil

