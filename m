Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C795D1DF749
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845922; cv=none; b=lbr2v+ot90+QICmKEBljNEto2ILKExe+/dkBHhRvjsSntl3HtJsWnzs9R97zg+AJXm/eDItACGf46irnYhEXahMZn34Mmnc0JAgT6hKExO9jb7sT9lQMt5E4SIFcUJDNi15jok/4JtJJ0Ur4OIhpmznWc4QVzlqRYcwpSwOS/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845922; c=relaxed/simple;
	bh=6xKfQLYxQrQT0vEeA6XiT41ZdovNWLUZMpAYKaRFfyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vuc96cqFQHQP34zh0baKuQ91evW0zbNDfsgO4V5mAY4uZ9nhSLPIB3rBgUj28Cq55gref298UlxpijFKhWbKHgNTaN1rP4yW1btrgtNuBPF6jEK+z+bPFBRvQR2MwtKEdOFfuI893ghu8zVNsdEk1lMtE1FyUXwHbXqMH3qGF/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bCPsYZkz; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCPsYZkz"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e84207a8aa3so3994208276.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750845920; x=1751450720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xKfQLYxQrQT0vEeA6XiT41ZdovNWLUZMpAYKaRFfyA=;
        b=bCPsYZkzDxKCP0SSRmbgL5TySayRYaZ0pIkGeg0Tw7azGM/gcF8xhqoyQvZqpfqzCw
         YkSiBdU5LkMVU2vnvz1EhTWNP4XI0f9XtohuwlX7Dmaa5bListw1nrfFjPwn//SnPnUd
         Cx3jZ+5aWPRWsod4iWsiwXSBh9tRsWmNPufWWeQYS5mdh/wiZHPs7YLYWqZgQBIGAkjb
         GoKKlmrKGg6JTK9zJIz4uGrzP2dUZKEqKRk1qa7taimmDDz1ibKbM+iR9RHYyxC/jCKq
         1XqZNElkCUib93l2JmEnC5heQFF8ahvrxl4hJZCyho/+saNpIhzKliWEi57MRR6Pp7on
         IlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845920; x=1751450720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xKfQLYxQrQT0vEeA6XiT41ZdovNWLUZMpAYKaRFfyA=;
        b=IEz0YbJeszkxNWLW3p6V31RMYcjKKr2QtXiiFuPyIKUk6ASJhkCk7+iscXuJI5hKbE
         ts0v2eILBObN1nSrXM23+P/cJEyx4MiNfltgydwSYsMdK1gP2utBRBdqhwmQRZRepF4Q
         cd3AUvDb9cB1fJYrFo/VcYNo6HmOp1ABr4K5PpIGJZ50Uy1Qu6RiAooHCyO2oLR5qQoG
         b/dTwVcvVCilqqn64zbv9miYyU5OnoirA5FxE/V7YCOq2ujjBF87mzZ9O9yhanqfbMk0
         nqm5CX9plZyptqKFWcrcxyElK0HB0ey57I6FW1TrTA0oMRtvNUtqlpPzWWQbj0txrqOb
         UsYg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Yd/VhagL9gwOf2cxFXepreo/TlRHqoKHCX59h9SzDuLH/yMqVwZKOQQbl7iez8ghJ8D22qr1TARONFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykmNsvFSz6c79EPBpDPJGj76vDc7U3jdYgw/C84r+0h3cePyvh
	HkBe6cLepN08YcWu9wUtLb0t3sfy3CVrqKk0bRhJX794MSrdHBfGlpoTyW8erOwiK/9yeHc9RfW
	q4z20w9tjS8hi1Q2lEA4wxENmLhmHJy7fcpT67//GGQ==
X-Gm-Gg: ASbGncuilBRVYXJIdB149ZJSjietNp563y6XJx7k/oUqjj/6ZVH6nYC7ln1DwiBzfDk
	230uTyQAz9euCIKglX5UF6gl+mnis1qgKtbSyEBKlx7C3d9kQ3lFPpIg8fw4PajWuYODvSJjLQX
	uVb32d//okj0ycd2WTewYnl57upFTwsbrUwM+T53+JH4w=
X-Google-Smtp-Source: AGHT+IEJrS2tphZ7UMREypIClsxlSmABIBla9pP6cK7b0bEY7VGBFV8Zh4V9DmKzTV5zBXNgMqCqlhwI6mHWvsv490U=
X-Received: by 2002:a05:6902:1703:b0:e81:9aa9:88d0 with SMTP id
 3f1490d57ef6-e86018ef2f7mr2643332276.40.1750845919338; Wed, 25 Jun 2025
 03:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624141013.81358-1-brgl@bgdev.pl> <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
In-Reply-To: <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 12:04:42 +0200
X-Gm-Features: AX0GCFtiYC7fRWb7mfaCIbLmQje2hb4McQcP0uGJDzj7bHa1BymRJdIDLbPQ_rE
Message-ID: <CAPDyKFq5G1CDL+VJxuzWZahZwUM0mVQJwU_WYYqNuDMDE3H5TA@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain
 trees for v6.17-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Jun 2025 at 16:40, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Jun 24, 2025 at 4:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Here's an immutable tag containing the thead 1520 power sequencing driv=
er
> > for the drm and pmdomain trees to pull from.
> >
> > Best Regards,
> > Bartosz Golaszewski
>
> Just an FYI - there don't seem to be any actual build-time
> dependencies between this driver and the rest of the code that uses it
> (thanks to the aux bus usage etc.) so Michal, Ulf et al: you can
> probably skip the pull if you can rely on this being available in
> linux-next for run-time testing.

Good point, I am not pulling the tag then!

Kind regards
Uffe
