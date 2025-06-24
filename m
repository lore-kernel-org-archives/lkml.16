Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5408C24DCFD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793684; cv=none; b=aZtJa9OFn1+nhPZMnD+93YvPzGQAt5Bf4cE1Vb/OKKsdgSXciA5yCBnmz1mlyYrX313vzGtag64xIzPxuSjyhSu02wg9lDLMAJ9tsRdJ9gXTEOdSXcUg6zJaylk0Ty5aCfg2jFOFefBR6z9laWLAVOlLoC9OSJOrqrX9FcTkMqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793684; c=relaxed/simple;
	bh=Lz46qTX/CMxria6n5v2ZBDFTKKy8QkwQzt5/KGpgICg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EG6P1WPfoNvm4W5qCRn6bCJ4EGEhGeQeakhBboRnPP76XONNa80GicjwcHY71am/Ilc4NzJdezHKUXQ6kv01oUFwp4ZgfQtBOAHzJNc9zyOPM6F0US6ghqbfQfVnlM2I7QU6HG5P0qpEm1mIbmOFMWSWKf/SsGZQOd93gn066VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVACXzPI; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVACXzPI"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b4876dfecso1998071fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793680; x=1751398480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz46qTX/CMxria6n5v2ZBDFTKKy8QkwQzt5/KGpgICg=;
        b=TVACXzPI4vQ2TLJsAuq3V9XsWJ/0AgHbOE7MJ+qHQubTgmYqJ7hahY9Wn2hEFBG6Z/
         5CgbUKRvxPvh1ajolJd11bZvtowQBYDkuRlGTqli9Gvj2tgB4dGHpa4DTClnh/jUwVdm
         YRcEjjGlPzXn6PL1SHk0MrOjVNkDE7hGoqZENhrLrFj/7NRZIsd4qUI9+mUuqqFrRneq
         yIH7vyCy/8Pg3XcwQ1X2IZFTNvrHZpNz6lXbBJxBv2fLKzVRqiG9lNTIjdNrmdQlxzOs
         PBkJ7v/EaFe3RbroN0D/DxHsnBjLuquesosmCCjE9l7gm5Tloti+UYdMaKDuSJLR/krP
         57Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793680; x=1751398480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lz46qTX/CMxria6n5v2ZBDFTKKy8QkwQzt5/KGpgICg=;
        b=oA+j3xs6CS/1eav1gpaVGxkM/f9pZM1azFD8b2QwZrzG/S/CypqMbTa6VbyEgQaqyD
         scUpb+AaagQlcKcnR5YyUpe97L4PHx1uQv3lX02Wp0V1zj6iWoik4P4oigOGOjKrZrYb
         hvjT95CRKIUzu4GSN6155MQh445djBB/BL/XemiA6sPU7QiVXmyW1QoBLecwyiJ9Fz2d
         MJNxrAwp8vnF65lgQCUgHp+Zw96+G467B4eWc28tnXwaJaPwHbKwIK2F1OnAgoUQDPh6
         r6vFNoJyj5nJT1EFo5UGDmbGwiPacKMCjce9p4zsv8OcewTRkcEjbKgQ6VLYNna8F7bE
         2buA==
X-Forwarded-Encrypted: i=1; AJvYcCXhLq3SfY3NLgOdmYTJoSNlOAu4uEiXkGebWKedcwYB2yZRy6NBVqPUBqzkO9OAQQ4Q+sHDLSM6S08JJkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9wUbe479vQ4kYToyAxDYsXlJarn3ClYwHOKGa+AxhAr0o7nRv
	M/crJdUQb50thWxYI+nPK/LEAnAuEfwwo1YOAnDj52gZTvw9E1zeSdwhQVmj4+f1DyOMEqv43i9
	qysguvqjlOXOp6Y7nQ4HKc8I2sQrVXmMwD8APZ/2B2g==
X-Gm-Gg: ASbGnctOdVUWCJnUr1Nn4a9hCyzizTfWsNzQLEyvv/XFiDGM+hTDdc77PNqPTiEyUOb
	SBjEj3q9KfUAQQgbkXUXuhb2VZXzQ7LqxMzfNtOvQ4MsKAvRuRe4SzLPyIOGn7uMuILfeWI4KzD
	dRYAZN2R0BaonxGV4Yt+oELO/jm63euUEJ0dVVe7VLCyQ=
X-Google-Smtp-Source: AGHT+IHVbzotA1uZ2hNwpUIwoe3RWPlgcD8haXKd+NQSeQxMA5bi55+yxw7JTIg82biNKU6SrxAw69xhLcO0tTP+OA0=
X-Received: by 2002:a2e:a58a:0:b0:32a:6cab:fd75 with SMTP id
 38308e7fff4ca-32cc6004477mr330481fa.11.1750793680368; Tue, 24 Jun 2025
 12:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-6-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-6-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:34:27 +0200
X-Gm-Features: AX0GCFuaTSNwHq8uOXhRGW_DUmsnsB2rkVRNJbeJDAHqfl22Z6mXPr004Wu0yp0
Message-ID: <CACRpkdbeeMsqNJ-cTz94zZHkTXg1suaCYoD3e78qekhqwg9R3A@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] gpio: sysfs: don't look up exported lines as class devices
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> In preparation for adding a parallel, per-chip attribute group for
> exported GPIO lines, stop using class device APIs to refer to it in the
> code. When unregistering the chip, don't call class_find_device() but
> instead store exported lines in a linked list inside the GPIO chip data
> object and look it up there.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
