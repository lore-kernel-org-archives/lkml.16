Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0BE1F9A8B;
	Wed, 14 May 2025 06:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203169; cv=none; b=ezatxbR602nHnpWGHTwZbWMpTN4YNej6vV8FJcfhwo/OW+T/rdhHj1Dg2drNc1TNDdf3UAI35deCpS9iHzzyk1oljmoJ496npNd901dkZUp4QJeC7t1Izy8QXT+YEDExAImuR4QI56EEny3yVvIoDigjL94+4+eK5kbP2qLsM8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203169; c=relaxed/simple;
	bh=MbKXwjmaiYScSHrm+SxxJd9acFzoJ4VdbPHk3vs5hhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ze8W/YkVW33URug8IzxMBp3UV/I4jsaDdfzJ8jh5ntuu38pryIbzAj0XL8nD7EPv8v1rM9G1PbtjCwPsCI9YNyRHCPPlwAg2KnqfxBTrJ34QG4MJUGXcnZq0XKATEZmN4OCIJ1skvN551pGS+VJ60hO6WJL7f/A2/IOD6Qt6TbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6GM90dt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6GM90dt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467CBC4CEF1;
	Wed, 14 May 2025 06:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747203168;
	bh=MbKXwjmaiYScSHrm+SxxJd9acFzoJ4VdbPHk3vs5hhM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B6GM90dtSVJKerKJ3NbZ8dO7dGwlu3/fzlsq2Rlgu6vk53sYPeSDuKknUbwXeSDrt
	 zX9tC4jVD8hFfKZ89Ur0823xCZVsSjcHLy3SplGFJKroAKkJ1Txa+qZUc8d4Nl6AYZ
	 MjTwkSl0ctCe0C4YZpfehadJv1c/94vnbIODXbSreq0xh0AtJnMMvsp7ezSN7S2Aza
	 EgLnh0cag4E/B0Jvy2my/vFJapFzvI3BuW2cxns1U5+42KQ4DQts3v49RLzz+SMhCT
	 x8KLf3CU5D3zwWhdJISOYy2buI/w5z6GglsajqK7Lz9/l4cPo+rgaLilX7IMowAAGP
	 H3ZPVeUz3uNVA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-326b49bed68so65474621fa.3;
        Tue, 13 May 2025 23:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV76OLFQIZIslFO1dOFqm6X6jJbH3drrcZlFPNcNaSFgiSV1b8np9hBOYTVDC+mptiie4TPXJb0lMpdqpE=@vger.kernel.org, AJvYcCVo/2hgsptCFjIvKLGBJfc2lbVV1sIvgfmNdN0XqnAlSC+lON4kFWMGW05zrqcKXEEX88h3XlbycIPbeY1k@vger.kernel.org
X-Gm-Message-State: AOJu0YzgR1XmjtSxR9Dv5TSPnCKD6hgucdX5P4OAA6lSoTa0HZ1rOYWE
	zpL7Y8H2fARnnr1vg8sJ0AEOlP0l8LIPtAi9OuRYeroniga/QFiRbtTMaQ8kNRdFXc0TdwzcuCZ
	F3Tn9ykM5AwsuO8IuvHt9dhpOW8E=
X-Google-Smtp-Source: AGHT+IE7DHAZQj4/Ereixflgo3F4NNkUTgRVWPRf2qjeU/KsJr+A3dpr6FzsR7MAZQBC+dbm0hi3E8kBOwaN1yV4u5c=
X-Received: by 2002:a05:6512:440b:b0:54f:c101:4c04 with SMTP id
 2adb3069b0e04-550d5fe9641mr766678e87.46.1747203166981; Tue, 13 May 2025
 23:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512161006.7787-1-henrik@lxm.se>
In-Reply-To: <20250512161006.7787-1-henrik@lxm.se>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 14 May 2025 15:12:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQoe6iOGyOkuda365mra+TYJs4aeh03pBd5xB-PFuY2EA@mail.gmail.com>
X-Gm-Features: AX0GCFtyccKWid9sCDJZLAXpRyIaoaKkhuYgu1aOIdkqy1bVLT1M2p58eskh9As
Message-ID: <CAK7LNAQoe6iOGyOkuda365mra+TYJs4aeh03pBd5xB-PFuY2EA@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: remove dependency on archscripts for header installation
To: =?UTF-8?Q?Henrik_Lindstr=C3=B6m?= <henrik@lxm.se>
Cc: nathan@kernel.org, nicolas.schier@linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 1:11=E2=80=AFAM Henrik Lindstr=C3=B6m <henrik@lxm.s=
e> wrote:
>
> archscripts has nothing to do with headers_install.
>
> Signed-off-by: Henrik Lindstr=C3=B6m <henrik@lxm.se>
> ---

Applied with Reviewed-by: Nicolas Schier <n.schier@avm.de>
Thanks.


--=20
Best Regards
Masahiro Yamada
