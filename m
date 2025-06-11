Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF723643F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629841; cv=none; b=NdTZBzLhrgKEvYR7Sk+gO28emVh2WApIzS3wV8gNaW05hamB8Oh9zkYtFYXK1xdxxlyVrO8c+HPHEMWHvae+MJMkcrIVaBoCmsp3JOO640SuIxa2PS+6YjOc/X1uJ1BXanE/kHeLxHs+WNovV+oncDjGxgYpqOH2sy03FaCn5SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629841; c=relaxed/simple;
	bh=ShwVaKjDpG7+4o74DNAGziNbXdTpTI6IUe1R+SDL+qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbzNq2UNOGfGxqUPx/3507XwHBo69uuibq/BBTsgc8U2s3Db+318258tYGS7ZT9uE5lHFlGc5rMqS9AdT4f8JdNL7F8zLT2H6186K/0eOqOazfG4XGkVLuF1McaAlG14tfWlJ3H7qTabjPLbeur608KujXYX1ZoQfFugJU6nj/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MR+m0cra; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MR+m0cra"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32a64f8480eso6604261fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629838; x=1750234638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShwVaKjDpG7+4o74DNAGziNbXdTpTI6IUe1R+SDL+qw=;
        b=MR+m0craEtskW4SVjgVWm58Zyoxb4VDsnb/oipuhqBQtffAtWKUhw5c3YtcO67LAoX
         LZ36/pwTBWr4iQC6im0vgihdxOTfRwPiHvajLmZ6406X67W6IDW0xV1P7PdaQK8RpvfL
         3Dm7df9D60cWUtSANoXAk0UTsE+S7d5WVCYrAUUV0EY5eIyx7pt2oGZL/U77Z6UIHw+B
         hUycFOPd4fCbrcsgfnj/9k5zinzW0yJot9RT5kpX8T2kyO+CDpG+KOeyEO6u34MVXviP
         jKxM2r9TzbLfUJb3uDmfWm8WIwxdVQvCJ60CUsmtEm3zsJRSDlGgHpD7T8pn4au6+yQB
         pi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629838; x=1750234638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShwVaKjDpG7+4o74DNAGziNbXdTpTI6IUe1R+SDL+qw=;
        b=NPkXPzSVXxR2s1aAZ8fVlShwqBjUHqFmceIEuaJBBQaobyJPAKQhFDvpJg5dE/iDde
         8HyhbLet7fzb1TY1iYSzu4zO4aPA7BtxsEJw/u6VeuKDl5nEjmJrL2sMWi0T54MLAMis
         DBySkkY4BV3M9yIam4RIlxn8Hi5znpOcAbsbbduCVeR19kv/jjs5RI5D80zG6HA4bSxI
         XuWTjV+5w/HW0SekDTu0EyVnrK2CxXTGRp4FJcFPtm2629j9KYBvhnB4GgJqiXmxIw2f
         tMSif3C4mM/FsVzyJhilKJ4AhGiqYavWvP/0IkOz2rGhgQzGHORYsv3jbBfv09UqjBnA
         E9tg==
X-Forwarded-Encrypted: i=1; AJvYcCXVOUi/mF5XMiq3EahytPGv2XyeYUEHqxe+P7gb3N73oGupLXQrAJoXvsx8nvD76BqAEQTD1dQlimIHenU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+k5JM8WERoxPR4sTGTCHz0G0KfER3MFH4XJuA+c7HtwMhvC2
	1rhYFgESwvfnJ/XxmrFPNdgbTYt9G+8lXqchZ0onz6GChv/3suL5bGrsOrzohTNZh4EJuI+y277
	sA2v47IrgV7iLXHepWsHmHJEqK28x8Yu482FMcc6Orw==
X-Gm-Gg: ASbGncuD9EcAxC4tyRIv8GfW/1I5kS2P1BFwwUuobB97mRGjTPAxKi64Qx0w2Mzz7QH
	9Fq9dFK96itCk10zSXm/tWjZRLAG2RUlPLGr8z62nJnsMhIDHrxvLoKzHTizQQOxS+ljgSrGLVU
	Hc3cqdW7cKqnIUR1kD3/ezFKJ2l6nFnc/P9LijvAEJRjk=
X-Google-Smtp-Source: AGHT+IGXS3heA5qyRtrd+4PAKvbYklR3zvJzrJ3RBT7cs+jAZdxvkJTxT5aBLkTN7bCTRwZRkYwgSDQCPTjbpUlVI9g=
X-Received: by 2002:a05:6512:308b:b0:551:eb51:bf6b with SMTP id
 2adb3069b0e04-5539c5ff0a5mr584462e87.17.1749629834228; Wed, 11 Jun 2025
 01:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-5-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-5-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:17:02 +0200
X-Gm-Features: AX0GCFtVhaGSB5A9mmhgCWL9dI6yqwjiUrywoul5APbUdTYmKPZGBXV4WSO__vo
Message-ID: <CACRpkdbXoutC3cUm8u-_NE4Cnp9HUpzSQ4kWjprwUyQyoK6ctA@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 05/15] gpio: sysfs: remove unneeded headers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> No symbols from the linux/idr.h or linux/spinlock.h headers are used in
> this file so remove them. We also don't technically need linux/list.h
> currently but one of the follow-up commits will start using it so let's
> leave it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
