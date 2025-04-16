Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEDC225A3C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792522; cv=none; b=vBp6y7kGMjn+3RznSqiYEm+mjdQocPLVfc7cCLAkX28t/GVCEA4Gkw/XFXfmhs8mB1MZgVJAxsZUcnrY1/vxqnFwDvJi9DmpdmP2PFeO4aFhRnanHWfbRf0ML9bRf/poyNVCbzcfrpsxffZ+4/EERio+YFkP/L8S7WmJor6re5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792522; c=relaxed/simple;
	bh=U/aqoPDk4qPcIGtIJdWVdsmpBx0xCpuPY/P1kNqi40U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vnys56VqyjDZXK/7xLshDt9R4Wmh1YO3VkmH496zIa1WPQD0nwIIozoDIFgVjVA3JYF0cplfglbxh6mJgdxCxMCnuSI5aJVEQEEVZ7JVuBW1yWwOvYnCPw55Zy+XMaLHCUjQo/U5sx/W8r9wNrNDEU6gjz4/nH3lYnNcBz58P+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rbi00JcH; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rbi00JcH"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso5364841fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792519; x=1745397319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/aqoPDk4qPcIGtIJdWVdsmpBx0xCpuPY/P1kNqi40U=;
        b=Rbi00JcHKOXvw5OCBFZjml4lzlCEk8uL5ZQEgLAypzBrxipnS3TX+WdMXAflSnSiNu
         Zmd0Bao9/1kLmF+oqBuXv4TMdsT5uOYR3/sQ8ZJ6Q3i8iJap7ix/d/GYcYOmuo0sM7l3
         Vwhyjn5DjmCXs27Menx+RWYwIYF3D0Oj5LFd6fZ2s9yI3Gfr+OdOmGwKFvOldKcVA6qv
         IyXJN8+Rv1TCGWQ4QMtnS8HUcWhNnA4SqkmxRWElhKD90lgT/QOnKhD9OzPdITUdBSXD
         3OSXpe5j2u2zCp5HOwJtNoObbfS6rBAx2uww6SKOGwGZ7QyaXBpTpDJ0Vw9dd6pqOQt8
         yoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792519; x=1745397319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/aqoPDk4qPcIGtIJdWVdsmpBx0xCpuPY/P1kNqi40U=;
        b=KoJxJgV8kIuP5dev7Gvb4cIVbW1VXdMV1urkuWPz/zYOrvonnh6KDQI1F0ZeP42rAp
         FR0bbI5LPId57La8JBYBQT8PypUrOt1HVKxE94yzAiOFTiAPjc+12QzmKdNvqIQu7dNF
         1Lu9QpR15NVViXROLw1YhsowkRot/dBaW1jRFLGhitbgK7LadsHm2ymSQddwK+/+AZ2C
         uUO/T+SjPIgQ+1PRainXif4iO8fY0SuN3BIaQmsetgFTouusgXyoWo5XZuvR9akWJQ/o
         qvds7F3/oIkhePiYC4Oqpse2O97pS8UY85ohveZVdDddrDlAdESVVxclIFT7Vm5fEYrZ
         6k/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgnOP8sYpEuGfoA614hENRKVA8clb2VeUr04nI8uduRQ/ojgJtnNkzAjf6cTDFK3a+7FPyTIjhzcDJN4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAYwX5Yj6gcv/XtEHjc7X83DMuBtCgSrruKn9XCIlp893mC8nc
	wf4Z7vaa0h9tqKncKsRe/PmU3mwPDenpM9yuFIAqoDtQNChs5/YvvzFPiDkhPb7+YMD24tQRVA/
	emckdEZyyPUWftfWejJMZQVIIL0xlROrRjS+cbQ==
X-Gm-Gg: ASbGncv0YeeFpIOf04fymmIVCjmWGbytoCnyC4/8HF9zjgmdlmbLk8h/nRXTABnvujz
	PrpVWWxIi6e0fIgc+TsipymyqlwlhPX+setNjeLye65HfcCMrlRN29wARqXXkslq6PwYk8jdQkP
	HzwadbnH3bl1sLjJQ5hGAzbA==
X-Google-Smtp-Source: AGHT+IEk01/SrahZkX/WwPGiS0BGB/c9p/43YKQ+5wZUlyCgsVLcawfd7xSjA1Eg9Ofa6Sx5qYOZluvwYSJlMTRuqyY=
X-Received: by 2002:a2e:9e0f:0:b0:30c:799:8418 with SMTP id
 38308e7fff4ca-3107f69607cmr2192731fa.4.1744792518989; Wed, 16 Apr 2025
 01:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com> <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
 <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
In-Reply-To: <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:35:06 +0200
X-Gm-Features: ATxdqUHN29Cyzw5aGGyEp2xHZ9Bkh3-8G0lN_prliWzQGyvEc34B3QIRU94x59o
Message-ID: <CACRpkdZqyTphs0k6k2tOXwYzT_K=Jbt7h1CZX1Rh-2LDjWhxcQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, brgl@bgdev.pl, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 2:11=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com=
> wrote:
> On Mon, Apr 14, 2025 at 4:24=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:

> > Seeing the __irq_startup() code, my proposal would be to turn the retur=
n
> > value to a signed int, but I haven't exhaustively checked codepaths.
>
> Good catch! I agree that using a signed int could be a better option.
>
> Dear Linus and Bartosz, could you please share your thoughts? If
> you=E2=80=99re on board with the change, I=E2=80=99ll go ahead and send a=
 new patch.

Yeah that would be great, thanks!

Thanks for noticing this as well Theo, I think your team is the
most important user of this code right now.

Yours,
Linus Walleij
