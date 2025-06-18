Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C42C3247
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248249; cv=none; b=ucSLh8za5OOA6fxRWh+X7+cDEwEN/8e3UBemg6TkO7S9yGmj8ZVtWgEA07WIbsbL2gPsyIrFJgJmZzuxUi6i+ZzO/nf4G62OCS2yis7K5bxPZyeBGKUsKx8h+RF1oNY17IHGEwJsK5borQ6yMO1Z8g/e/kO6GQe6lKYXZ239+m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248249; c=relaxed/simple;
	bh=PTmy0HiGv1t5sWFCZ17SXK1kqhYyZoQXdPJkkAc72Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCue7Tz1j1gFk3fL4TYlnLSq2T0tbB41ZmPK5YfAJ38TT5IrnjJOVkimpAxuyrsX98UTmPWwVFx6OW0uEdAp64Sw1VZoj0eWjObYEcg2Epi5K3cJkfW9yUahbMvMynm7myWCPVGsIqSjc/ITU0cis3W2IvIcp5UUNDbVxRlbCcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jidkm8EA; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jidkm8EA"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54e7967cf67so6995130e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248245; x=1750853045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pw5lDMVe5PLgX2ttnQHBMbMYq8dC4LdNA8jYmEuyK2s=;
        b=Jidkm8EATPRg5VHH9TIMoiDnXjer4MuzmtdWCu8ovDjoAewYtg0zRrCaCnA7GwrbRo
         utF38UuVM8BP673WDjLNIhX4SsS6OPbZvCBNI5fpl4xUqmKh9yotim8urM6kosvGPgon
         a5npIovo9kYBfOynwlUzLAjJRehzQXiNWmWThS782P/qxdIiKZ1LCb0WnLE28oCRmaZI
         +Ue3+9zmBrW4cUKL7kgaitpg6VGu6gBU3BHjL8E0ghjbiHEbF38RLWIXUiDWiPYZMvce
         qyiZIpDOeQ3wKT2o4P7WmSWZ6oYe1ja3y9hclBcaztzb4c0krzIBBlf6JrXNr+HMXxyA
         0jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248245; x=1750853045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pw5lDMVe5PLgX2ttnQHBMbMYq8dC4LdNA8jYmEuyK2s=;
        b=sONWd/zm1JqaaXoCQRRFiJMDilbfRA+iRcH4QyHjqXCtkBzoM0qf/6/aHzg8rvLpOR
         JWGO+5maM2MsVLUXYCvvA3A3qyvEwFhctQwzJCkS5mngXKmHHu+6H7Blnj14H0Cc6I/K
         lssBjgcGJCPMyOuggxJjTUYFcu3QqisxH/DYeV5oUr9wGIMUqVqxqcgct2iQNkgmAjuG
         MsfnowDpj0hoWDI33d4+Ba+x2eYv7fSxfIhOdrZdMlL7j/xKp20q2zjDuGVzDUcYmNp8
         R5K8WYnf0/7YEd+VY+WLpGGplvri6wQEbnoonLSUsEpOIgpMkhorVp3067KK0UGItXb2
         i58g==
X-Forwarded-Encrypted: i=1; AJvYcCUd8Oufs3W1Uwpd+IwYC5hUIFBRGq4rG1L6iL4K3QNeVmrbZO5UIonJ9kYNGlvKj7+RWeXqWZqWMTJpwtc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6FOVBbaKQjAAiK8yfq6+/xvc+pwUsHazTxZa/2Fje8bgfEPwk
	nGHgqcl0wsXxvVVsGA57lwRIZLJWW6GR1PFi2ghW2m5tFwwE2FHEBmVeFDSyR+/4xINVkH2TXj3
	b6Q6oyrTKPMCmCz+R4dJJaDTF9Ac5jItMYIXEo+i0tQ==
X-Gm-Gg: ASbGncs/2OJCC/IGBTYh0q7y4UsCsXYXU0jdRoDlxpTvOUHnOpvrS1BHewGIFiFXNzd
	IRIUaZlXkz+1WBk09ZcszdnQHKisJsiDXz0onanevecyih9KHQ5sNHrrQOVsgAO270Rwd3pnAPF
	2OdzifLNqu3BaMAMPGKQqauTodLGNTaV/nXu/6HsWvr7M=
X-Google-Smtp-Source: AGHT+IEU7+cVw8RWzajvpd9J/titbwGwZeEUiqB65UOF2F1fN9VnyfLkaqO2QVzTwOrXfsDFPTbPA6/Eswa3w/UmtNQ=
X-Received: by 2002:a05:6512:3e0d:b0:553:2375:c6d9 with SMTP id
 2adb3069b0e04-553b6f4ee07mr4818857e87.55.1750248244152; Wed, 18 Jun 2025
 05:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612104539.2011-1-luyulin@eswincomputing.com>
In-Reply-To: <20250612104539.2011-1-luyulin@eswincomputing.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:03:53 +0200
X-Gm-Features: AX0GCFu7uLyX_FQipTQ9KLFWtnjX7fYjtMWgaWxutCWJs9ZMNam2b8u2qEvrRTQ
Message-ID: <CACRpkdYQBdkeJjAkTikxgQBHJLQUmgGSq45kGMGzJ9Hm9OAERQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] ESWIN EIC7700 pinctrl driver
To: Yulin Lu <luyulin@eswincomputing.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kees@kernel.org, gustavoars@kernel.org, 
	brgl@bgdev.pl, linux-hardening@vger.kernel.org, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, zhengyu@eswincomputing.com, 
	huangyifeng@eswincomputing.com, fenglin@eswincomputing.com, 
	lianghujun@eswincomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 12:45=E2=80=AFPM Yulin Lu <luyulin@eswincomputing.c=
om> wrote:

>   Implements support for the Eswin eic7700 SoC pinctrl controller.
>   Provides API to manage pinctrl for the eic7700 SoC.
>   Integration with the Linux pinctrl subsystem for consistency and
>   scalability.
>
>   Supported chips:
>     Eswin eic7700 SoC.
>
>   Test:
>     Tested this patch on the Sifive HiFive Premier P550 (which uses
>     the EIC7700 SoC), including system boot, networking, EMMC, display,
>     and other peripherals. The drivers for these modules all use the
>     pinctrl module, so this verifies that this pinctrl driver
>     patch is working properly.

This v5 patch set applied, any further comments or snags can certainly
be addressed in-tree.

Yours,
Linus Walleij
