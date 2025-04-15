Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B459200B99
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702351; cv=none; b=rrNu7TbTaLSnCUG9OIpd7cWadiLeOlHQuxSbBSsraIb+pRqmdPI/DONYsSx0yDjWbECXSbmYeaY3NmxIpbvhDDLx4s01rgPIWnUSzyLQPnZQdpubMTazwXNH24Muq37fwrr6UelG4vGCfXbMBzp3Ytl4bMhaAq8LlmwtbRmceTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702351; c=relaxed/simple;
	bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLDOXdYKQ9f3SvkkK8D2p3Tm9Dtm0FOn0LojeDK0+sJyQ+ZznD+1b057jHxuciBnbxAOms1huwNRPcqrhcalZAXqrQIR0hqUEGETKZMKZLvNhKPYB4g30IyQS2OvPuXsstMLZdBp7is1ZRfOHan+3r65cmjAWCBIkDK7L6C9Jao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mkqh3D/d; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mkqh3D/d"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c091b54aaso46788441fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702348; x=1745307148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
        b=Mkqh3D/dmSu6RNgOfcdrjVSPdcVdZde8YYVrexI9bMo9KOUXSdIc7sqSI0Z/f7yqp1
         vim5v4Wf4HopX85KwCn3I3ChzRRlwj9cev7D0KjeLbehttsORUTHuLBKfU/37M+Gl/WQ
         S41N7QTl61y7PkzeisuuynabUCu06C4inUUCb3pHhT2eKixVKUqye0dyzPsyTn+TQRca
         S63S9DY1CVQGlPN3INEjHIZFGfFfDKaq+rJQ57wwzoFTykGwWD3MxP5ykxAQqs8BQ5Yl
         J2GVhn4ldYGxraCCjmB38UNOtbQHkBVrRcboJhhqwwEQcnToeoBEhGUzo9Xb2jvbvkOV
         TyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702348; x=1745307148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
        b=WRKo+yUTYTe7ZNHFW+cc993KRSt/CDXVYXgTMcd/04UftM3e9fi+bu92vkAfJXwmt4
         /8oi2ScQJXgPSFDiuUUyRA+NxRM1qRigwmBqUe7I/wTfwJs2+ufB5OwLcP7bnad7z0Bq
         J2BY7cTbJPvsq9TTd3nggoasl8cRSvP/C2RN88QRxxOfRuNAP0MrhdATQR9bRu9o1lNE
         a21aspwJg96QlQvAzvksbHo8QZZppBZi16K8idhdDiHtaH6PxXUvWqiygLjsLRIVqE/y
         bPO88OIkegIuYKpQNuBnAco+uKpOidXmvXH65l3XLd05wDhTAjzMa8vmnN6gNqt8sTTn
         yNeA==
X-Forwarded-Encrypted: i=1; AJvYcCW4em0FRfUa3dIBZGL2+9wxEss9UMFNG0EZqXMy9y76M0Oo2WJ5/Gxf5vrRPU6J9uulv4Yys5yfAmkKqgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC1I7JpNDZg5Gc9nMH50EBGS+VynWuCrz4knzdOPPZSlzMDCBe
	CbnyYIem8rMYGHriQMiYZQMfcw40hZS2r6yB/vxGTx6a0AD02CcAiXIyaTcX0WJxzs7Kr4trycd
	08bW2gPqi8oY+FFqlX5QZsk/sM/EJY3crNY0/JQ==
X-Gm-Gg: ASbGnctHLvpyoF751XgOpDdSwPTvwFRg4KPcfy+JklFUuEYVcTWM5iWzjMS5TxI6K+f
	wXl9eS94C4UU2H3Bb96E2aOK2IFb/q+gnq+PX05lfpTlZ+30W5JZipkBJgi7dN7kiVm7qrky8l7
	tHYJYd0ja4SPMUAw361hkw9XLmLFSSXF9H
X-Google-Smtp-Source: AGHT+IG5h8f4JUB78zhRjxaIrh0H1nzCuXUYX+YRVBh0UXEwBIrUvsqlLX3M1mFXVx5pHR23X5R+19Gz8uYR3GSdZ8M=
X-Received: by 2002:a05:651c:1607:b0:30b:d022:2fd4 with SMTP id
 38308e7fff4ca-31049a7d074mr52085991fa.30.1744702348175; Tue, 15 Apr 2025
 00:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:32:16 +0200
X-Gm-Features: ATxdqUG7_L4ll5R2NvuDSJ1DXWDqWrMJi8NcaoVkYOT_klHadc44zetWzT1zRS0
Message-ID: <CACRpkdZW0Y8rBux0KcvbnDH92oP=6oco68L79VX2a=uc+2VhmQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: irq: support describing three-cell interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Tue, Mar 25, 2025 at 11:07=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> In this patch [1], the GPIO controller add support for describing
> hardware with a three-cell scheme:

Sorry for replying so late, I was a bit busy.

I'm very happy with how this threecell IRQ support ended up,
and thanks a lot for driving the infrastructure for it!

Yours,
Linus Walleij
