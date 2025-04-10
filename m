Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D8A28A404
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307074; cv=none; b=VWl9u3l0x3Unbvc5m9mC/FXsQ+KOivlZK6Az8Kb5qatdDxWGwW1RMAJMjRR2d6qC/W23EdyTNW5Fn4K/L9S8qnzDjfU25JrBKXCESZy9k2fQWPiChBf3TT/1tl9Od7hGfytNL6MQosleq2Ev2rjMaViCeqH/G0qo7H+BF/24mdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307074; c=relaxed/simple;
	bh=xUxiQ4Q5+6RLC3QRv6BX6/IDgu96e2jqXLwCQl0lOAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ob/0wk1eL1p6XrwPnqnhsH/ydm/P//NePwp/F8s0D4AdnVBLwrWlq9A4GNHBNHsg7pvA/P+HLP+4XREp3EOzviBlit38UoPp9sW2a5Eg9LvDWiZ655mcNCFvNraLXhQtegQ6EXdL29qmXwKXeKKj1ZT/BB9slmO9NO+lpsAPaPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/K1kBM0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/K1kBM0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac25d2b2354so179399066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744307071; x=1744911871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUxiQ4Q5+6RLC3QRv6BX6/IDgu96e2jqXLwCQl0lOAw=;
        b=M/K1kBM05tyF3Qni305WTXMcfnnf50wl79BrBR77TZ4Gp0D0OOJ+aEeQIBGChYAx9s
         irOf8X6v8KmlSqBttvtRyp2bNIns8KXCRKc8sO5Zg7rytNGMPbxhu603zap3utX+P6UE
         9QlJXaesECBOm1hY0YutSf1Hx5ScXvcJIE6Uvz0np2O7IRMiOWCvsEm1F5lg4zc+Ynv6
         sTgKK9YTJ6B53w8ZCjq2WSI8OxeMMjJFcB8JVQ6Z70HoZVs/JmByrma07jqPuzp6wArK
         AKM+IaZRyy034jW/9wSoogaYwP+0yumhwZtBJNjz82MhRXszoDTgpJ55frruoJl12erh
         15mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744307071; x=1744911871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUxiQ4Q5+6RLC3QRv6BX6/IDgu96e2jqXLwCQl0lOAw=;
        b=UWx7l5o3brPEHsZn/XwHL6k2R6Yo+T2kHef0SqHXiccsr80cldK+JNJ/6cXm1c7tQh
         pEdduB9rYWin8NAuNyGs+Rr4dMgMcBy/3MkQ+i+JSshczY81HiL0JgE10gwPu4N+HZqc
         YVPSpn/w/da3lIhNWq/AYjoc4FUIJzHDBzzMyYyYSV8zcgGIUman6pblZdDZzH5MamUM
         dU4WMHS8KG7rIA53n3zAag4Gr7BugmgGeAm7E0tgZ8/v84yEW6IazrCeo4UUJBi3yigJ
         jQQXvRN/gEn86WuQFVfl6k9fi9IOZQbXGF18vKbsg6uKHKnfJPT/UXzznMJs5ul6KqIv
         EZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDZdwtqlO44YbbByRFoaEdKZup4lpJ6pvOr6miVMMSPRGDmSz1+17TgoQqOlMDy7ZGOs5UOYCERQwc0PA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6pzgcHUNGxEfxOOdjGcjgUahFIWOVuWkH//hU6C8tzyGamPWO
	Du23UEk32B+C8w/nWd0eWJb+kKkA35bXAgNMg5ik6pBVmYtkAgMBozO3ZzAeRJDXklCqap8Xakj
	+WHRul3D3WCgHZ6fw/d6FyiVSnJpXxvBKijc=
X-Gm-Gg: ASbGncvqp0h/1IzZMz9CtipySPmkiZOtknYY6F4mk5QmLpulFvXyse/qBuGUmIPzu89
	9tWy7eRUrfgpoy2+3OTcVOnjPVnyJqBlRXLOspJBfwGORzjKSPWq5ZPfyD+ndrtQFmy2hii9gLg
	7BUXp49LYTwDW9E9XCOMvbfg==
X-Google-Smtp-Source: AGHT+IGai+2iQma1v2ML/vmpldbNN87lYaO+i9MyFhR/mev8BzsVZSMB8PjTqxdyLC9BpAbqz80qyNUO9NjyLftm6R8=
X-Received: by 2002:a17:907:2da1:b0:ac0:6e7d:cd0b with SMTP id
 a640c23a62f3a-acac00c859dmr248885866b.34.1744307071104; Thu, 10 Apr 2025
 10:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu>
In-Reply-To: <Z/bA4tMF5uKLe55p@ubuntu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Apr 2025 20:43:53 +0300
X-Gm-Features: ATxdqUEQ6x82ggKBkTXOkdVXbmSTS8JdhJGKblrlfmSSA7OXmeEZzvZ_zLSv_lg
Message-ID: <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 9:48=E2=80=AFPM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `& 0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
>
> Using a modulo operation `% 4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the
> sequence number cycles through a range of 4096 values.
> It also makes the code robust against potential changes of the 4096
> upper limit, especially when it becomes a non power-of-2 value while
> the AND(&) works solely for power-of-2 values.
>
> The use of `% 4096u` also guarantees that the modulo operation is
> performed with unsigned arithmetic, preventing potential issues with
> the signed types.
>
> Found by Coccinelle.

This should be folded to the initial change since it's the same driver
and values most likely are related to each other.


> $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> $ cmp rtw_xmit_before.o rtw_xmit_after.o

cmp is good but not good enough in general. Here it shows the 1:1
binary, but in some cases code can be the same, while binaries are
different. To make sure the code is the same use the bloat-o-meter
tool instead.

--=20
With Best Regards,
Andy Shevchenko
