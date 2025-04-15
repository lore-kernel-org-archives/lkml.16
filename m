Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2126F129A78
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744752792; cv=none; b=RfHPF6DROrRhV+ZOMRrlo5w2E6l7ix9n7xKa3kTGxl4C2cJSdMlGqx9LXu+DI8Pgc6qoT0RXZRGW1Dpxwxs9KTVIPzyKvHrH8MBqQQrvfuHW5MHhv/ocWeUuQ+Ou0Vlo65m0iXUo/Ohdq7rZfza0TkaXx0EcntPVzILFrrWchMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744752792; c=relaxed/simple;
	bh=YFZbjOYvL3XWX9zYO837GJEEHfNhtkIC3obvjgRgC9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJo3ISNSuxucq09L6G5CqX1psF7TugQ66YQuJlXjKFXTkr0U1v3qdA9YR0tA2xE+U+qb0+zG0W1iJ8gElB+m76MA6o7Yp+ONLkAfmWOLW095MHmfz6bqUGQeh5mwPhF5VVXbKQ78yKR0hgmDV8GhJqoprA/xOHxxzoSvtZz6wrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcCfDXKh; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcCfDXKh"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30de488cf81so58360251fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744752788; x=1745357588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFZbjOYvL3XWX9zYO837GJEEHfNhtkIC3obvjgRgC9M=;
        b=EcCfDXKhkEseCVqVobSv+W2S8zfWuQuLn7dA9RuHxiSYcCLRq+uMd2oMlCVi7IomU3
         3EeJ3Bh0hDaPyIPw1aPjyQwu1m73lJhSkAslYgfpSsLSOYNw7EIz5LEvhJ0ugHoldinC
         7HBmdGmi/1lEj1pgzJAEBHTsMo7PV1QHZDQHyqRlZvExw/8Mc0r5vFwoUn2A5suOBAPP
         qQCU2/ZnVRReshiIJgDuAp4p+OzVrM3jc3lIEP66MiNdcu7B1wYErFJ3C37FY9Ke7kML
         4VGm0lCJ7B5B6obycSgb4+qxVvcJY47JrdPjZehd+6pqbDA2DeIdAMsA0YVFdFTYdDbN
         txMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744752788; x=1745357588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFZbjOYvL3XWX9zYO837GJEEHfNhtkIC3obvjgRgC9M=;
        b=UseYgtujCptN9HiTX9NI/J9jOCoyRf2X+RbO8cDRxGAooHXe/SLp74hSJrqm14VfUJ
         P9kUThD4raIebnY4VtpV45IOljX70ktn7fKrjTx6DWBL4MsRMrxBshWLNBcQ4Flwlqhi
         8r8yTz10ZqH3oXvMlWcHxYiShbHs0I9ey7JR24TntNuTe0BkP5+DcMrxfHY/fUbEwPEQ
         rr6XfxTcCbqAHWSX76FrOQucFB1Luv0j4IoiEk4oaLg+V+XpSa+EtAKxPc983/oOYyql
         fzbzBG9q+twqsdTF7POXdyjiGBYSv8bnTUxIHt5T3njOH0Xc88zNoXXfrhiXQNwCNRSo
         QIcA==
X-Forwarded-Encrypted: i=1; AJvYcCVxUqlMJp+WqN4m6IxpMpjwaXnhnlzt+tQrnpLbZbNEWs472JrH5hItks/zXd2I949CsB44dgNJl0g7QLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwwRo7F34kzdfAGHX2Di+nOG1fKd+gnQcHya6zOEk+f4kliaO
	6jZZW++cNMMLR3UiWTdwH44Ngn+ming4g1AndQckKxYuWkms7RoAwZF+siMpEE7cxe2dxLy+PN5
	v3+Vpsus9LIGGa1FtO625CttIiTvzjD2P7i8V9JKUIJqMZSab
X-Gm-Gg: ASbGncv0FDt8D1iOTF7gc7QEqfe6V01NVGoeapMuqTYYCtmEPuJhfzOxM6mxxswazvB
	ypF3aVdzQvV+SCy6p+10svj21cPNQvZ6lGEaS0AP8dbKTJ948Ps7lQxBi8lcDUF8WLTt4UzxfaZ
	RIOOGz5qxK/GTPwwR+IC4wIVaOmgOkuPPe
X-Google-Smtp-Source: AGHT+IH1fPwXoYdrYrXs1HiLQVKcj1Nwq0ZaBfB+nrG4HDkRYGKbjDxTH83CFz9bMaIy6Rb3CT8kdAniAZ27nk0a6L4=
X-Received: by 2002:a05:651c:312c:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-3107c317096mr2058281fa.32.1744752788108; Tue, 15 Apr 2025
 14:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk> <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk> <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk> <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
In-Reply-To: <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:32:57 +0200
X-Gm-Features: ATxdqUFVO-oOAadK97uz-Zvz-g6yn5__IY5aUh4Sy7yRB8wzgdG91TigfSAKxqk
Message-ID: <CACRpkdaBNVyXUwErHTtGBnUjh4+6Ojb6fu9M4E7LnRCu_Oovpg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

this caused me to think about a thing:

On Wed, Apr 2, 2025 at 12:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> This is bothering me. This is the abstraction reversal I'm talking
> about. Should the regulator drivers even be concerned about whether
> they share resources or not?
(...)
> The part where "the higher level users want to understand that there
> is GPIO sharing going on" does not sound correct.

There are precedents for this type of semantic IRQF_SHARED
is used whenever two devices share the same IRQ line,
and that is something the drivers have to specify, i.e. the
driver has to be aware that it may be sharing the IRQ
with other devices, and whenever it gets an IRQ it has
to check "was it for me?" and in case it was, return
IRQ_HANDLED else IRQ_NONE.

Yours,
Linus Walleij
