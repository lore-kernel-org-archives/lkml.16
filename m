Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED75199385
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865619; cv=none; b=ZYHbRAChj6qOx2yD7qD+QLlpVlmWETvgFzbWAVH2KamU30EWjZhiYdXno7JjdwRgCp/NZJ9I/t6s+wnn6/LRPQZGB3B35pVYTYp9NtHphJEEHGpSvcvgupfAe8S1yWEnW8kHv5kxPyMyxowOxYmMFFmCnip0ZSQmwuuw0K61hME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865619; c=relaxed/simple;
	bh=V79jeN0tsHJXSx3cEymAS1MszNtH6Y9+4E36m1Ag3NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fozwflMlvwlFzPIJmYniaZNi12m9FiuFJCXHrm3PfSi47djjWGAgDSEV6rrRGMMgUjVQuChPIigHTsLleZZ9mXxuOEfdVOnFDrPcZGuptKMK0SQeVNPEBPLsIorit83PP1Cw1uMnk24sF5kLLyt9GBmWJjaSY+NnVeSo4y5Nggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AaZ/UHGp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AaZ/UHGp"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso2053581e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738865615; x=1739470415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rsc6zr7PmrWPbYfK/47bMrwsd9aMEq1+Dk9kwGENv5o=;
        b=AaZ/UHGpi7R63veGtDNUX/KUi0ollf5xpfU/DhTcTDQ4iA6uWb3yyrsjAeKZw/oePI
         xW3EWZEapR+QkD+6uTztDcKl0r1rId57pmTOId9xkQ4josu68ip55NbiARgDk2UmKLHp
         GMHC0Vpha4s2Cmfv/3po5DdsPmuc6vaN9fz7X+B5ZTLlumpRbvzEdXnE1WaQo3D9KMHk
         ZV2vRNecSxhIAPFE/lozCh6fK+fogz5hoOktRheB90G60ojZIB34dUpqVLFPs/nKYInd
         cT7mUM6y8dOw0CCmSxNQV9TZwTJlB9fgpCmQjV3bzXzVRXcTk2nFJ8a22fPzG90BG5Qb
         lTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865615; x=1739470415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rsc6zr7PmrWPbYfK/47bMrwsd9aMEq1+Dk9kwGENv5o=;
        b=jXke56Z6zCEWgs57zJd9Ke9dcXrjlSCLr6PjAFrbCP07gLkHxF3pUqajgtBUi/zjXn
         iaxD5qDOxIKP0h6B8CV3MZiy8cZqdXF5UK4LFQU66aEPW3KcIAwUI0GUmcN7VJ0XytWn
         ZOrgBHaR07SEpKqTB4QWpvro6fZY2vHYBnctvCLNy44wfz4UZMpgKGXQyYlgGx/6UEB5
         eQ6n2KxGL/2kB/ca9YF7pBz0VRZRlshaH5yOATbsHBJVr7iAEoY8Q2JirErnDeEE8od6
         omLmx+/03I+7Ssg5cV20FovLugwP0NNPzOK1RWK8QZXEY4+rTqQeK2P6+8LP6CuP9H1r
         ZbEw==
X-Forwarded-Encrypted: i=1; AJvYcCVlSefw25qYDlfbaSRnjVM8xaDVvnM51rancZ1jsa6o4GdWIUQQc6SrBFNE770VICOT7S3DXrIzjuoIN+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+tMyOLLiieBJKPqRXxu6rTZmoDqpGOOhh+AacXPdbA2fdWUtu
	CsgjsHEHD/nMod/WYCB9GONkXwWp4KoSl/KV1xPmX5BvUsTaa1/6uEEnXXKtCxNhbRxC+2l1Zii
	yTP2JqTeVVI/mqP1Y75leNq5uAczRKFPQ9mGQpA==
X-Gm-Gg: ASbGnct44GRafH0KRRlF30d9xLq0JzzcSrStIiAOyguY/T1lqbZSHoFjoTc8IVjKMK+
	OF7lbJGo4F+f/3bl7HYPYjgQwTSYl+guvIKjMe/y8um2DzpIykmrpLjONEQm9zlLju7Rq4VA=
X-Google-Smtp-Source: AGHT+IFwrBUSdTF33fVZo5ZV4gid8WDGNMNJOaEdEoEhmoUQDAR23eXv8h1spnhBCw68+AF8aIOa5q/drMpa+oLxkek=
X-Received: by 2002:ac2:5f66:0:b0:540:2fbb:22fe with SMTP id
 2adb3069b0e04-5440e6b96aemr1178814e87.26.1738865614800; Thu, 06 Feb 2025
 10:13:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
In-Reply-To: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:13:23 +0100
X-Gm-Features: AWEUYZniqNW7wQtQ8_C815KDVnvw_narU0YUPqt-9SDoXe8RaCViVJAVIYjHGNM
Message-ID: <CACRpkdb2fDukNdrzhcVi5+siY_HO=ndLBOCRH0Yxcs_bZFaaKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: bcm-kona: Various GPIO fixups
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Markus Mayer <mmayer@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 6:46=E2=80=AFPM Artur Weber <aweber.kernel@gmail.com=
> wrote:

> Fixes two issues that were preventing GPIO from working correctly:
>
> - Lock/unlock functions tried to write the wrong bit to the unlock
>   registers for GPIOs with numbers larger than 32
>
> - GPIOs only initialized as IRQs did not unlock the configuration
>   registers, causing IRQ-related configuration (e.g. setting the IRQ
>   type) to fail.
>
> Also includes a minor fix to add a missing newline to an error message.
>
> Tested on a Samsung Galaxy Grand Neo (baffinlite rev02) with a BCM23550
> (DTS not yet in mainline).
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
