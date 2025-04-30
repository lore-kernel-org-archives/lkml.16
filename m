Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEB1D88D0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999381; cv=none; b=TBIkZFvKiXeI3nyGm6XEE4HxDryxf5pZBmWXM37yMtD/xw1Xu3EWYvosh4UzWAPXoRZyWxFS/ea4u93z8iGDZRI/JgNBuLcXFD2bdN27eoEvfE39BT5o05tXw2YNKhvE0a7pF7mmHfISF3/g9nzRu5CKB98+ndAowTX9hYyeg98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999381; c=relaxed/simple;
	bh=gagF1+Z1gth1Gl0G1Urrz8XqqkbbSWEjhw+Zkns/Klo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYRQUvNpwLIdlQXqTYcPgloognSRqJp3iUoV3LiqUydBnWf2eS5kHbd7IpntaGxyUwII5urfalEYU4ZFxr5GidMl5CaZwUh/wCWKbBHNvL3dVcotmwD2zbRRtik1skMpFCr26jIG45SKXB+4c5HYXCsPdQwLizYCfv/8I2ZDKQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QnI9E6uD; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QnI9E6uD"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d6f93316dso7915643e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745999378; x=1746604178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gagF1+Z1gth1Gl0G1Urrz8XqqkbbSWEjhw+Zkns/Klo=;
        b=QnI9E6uDkOC/qGzkyLrgvdJZYoPk2/B3lLMrJzCRjTjFhQ96OtGCJYPabeY0aDg74y
         vxsSkW7plPp50bKCZDKqLRg7+hDVFuM6oh0D1TKJnl1IYFy886As6D+sfMos1Kfxyld8
         16CaUXdM2s4WBpvsdxyJbjUV5u17RAPnbiGGh+aoFP4uvAJ+uW4EY9ev55abfrlmQTUQ
         7VSJ+QumrxAzI9SAy03dvByRHw7Xyh74Ml7Y1TWLD6kHn+HDqXO6c7WABvoMQ41W1zLc
         ZsUBckGLB7ozBGurfBp2UTZICcIkRd3FkKLQghE3Xi+ZNjIfAE/5/s4IXA5TxACqfyB3
         6SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745999378; x=1746604178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gagF1+Z1gth1Gl0G1Urrz8XqqkbbSWEjhw+Zkns/Klo=;
        b=Enkxsa9/eNByYNh6/aG9mfPcTHXaO9HwOm4m8FImVHsZ13La+ji0lfjJCsrR9F8GJQ
         TsbQQWpThomTFs8THI/cYoW3VkTNjSQHewhwYfSFBCXqaPgyMUkmlCAO7kmGAgO+yOoy
         x8Jz3r0cc1dcF/xIsCP3Q62jNjcYEQX3w8630xCx8+TIxuUohpGl3j2hPlM01kqnkf11
         n2QX58CRO1YGPBU3vg+pz1ek+cwar3ZOxkW9s9aXBseS4/2ZvaNDa+yGWTDU1s8BWQ+F
         cFHDGFd2l3w+B1tEnlN1AWbyTRjz17eXjVdiaTbzNkoc2GJX9eAnULPUluDLFgyJofH/
         RziA==
X-Forwarded-Encrypted: i=1; AJvYcCXT1uMh8Cd+HokWrvg1Drm6/dSWmdiyxV4nt1WgIv0UH9+OWXlIf3MrDTsc8n5Q7mdqa2iY0TpKHbu268w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCcvkvTBuNcEbMZnxMOsKbklEJjcRSVRfi5N9BNe/82mqWtjxF
	sziPDbsuwG7uem3wIDRutnk1gBZ95305H7TGvjbIVQ1bErtyPED7tf3S1UmTZqAIxjK54vxsciP
	xSac7vO6HlxMWlTlic2DhDI0x1Hq8mPFsGsV+xw==
X-Gm-Gg: ASbGncteBRUa63CWPAk6P8s0RxltfZZjI8EgL1VH+DJtUtFESXnje7WxknBukzWYrB7
	HgMmAbL6S+Lo2GdR12LirhrFA3xI16qubJMzClSx6PvcDH3Ud+T6M1TYuxN18N4XmZPIoVxqfM+
	R4aRASfZmX7xX2/lkJ++wZcUMKufu9S8O5LGTk9MADQr2ngV6O8Uu+TI2ETwD5zB/G
X-Google-Smtp-Source: AGHT+IEFFDno7HEPLhjBoV2o9bzH/IPZXO1S6zS44ofx30EX4LqTfYUZRthTkCT4/OrxXPozicJw0AVWJA64RH08fOU=
X-Received: by 2002:a05:6512:e93:b0:545:c7d:1796 with SMTP id
 2adb3069b0e04-54ea33aea24mr689451e87.43.1745999377970; Wed, 30 Apr 2025
 00:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <CAMRc=MfpE6M28P6jxFgs6K6Tf84LRhmaw5U4s8WgciF815M7Bg@mail.gmail.com> <CAHp75VfkJAG6EKf94NFKVKRgKiRKxB7WER_UXcY7sGMOqA=YNg@mail.gmail.com>
In-Reply-To: <CAHp75VfkJAG6EKf94NFKVKRgKiRKxB7WER_UXcY7sGMOqA=YNg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Apr 2025 09:49:26 +0200
X-Gm-Features: ATxdqUHrPhxGGHoiNszruLYa_2Dtad5uG_qc02QAby_LYfy0erDTwo0gD6qZhok
Message-ID: <CAMRc=Mf78f6yJPUEZbB6UWQmv22gLaP+6xca7S7bk54Le85TwA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 10:30=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 29, 2025 at 9:43=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Tue, Apr 29, 2025 at 4:08=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
>
> ...
>
> > This looks pretty good now. Who should take it - Linus or I?
>
> I agree, but it still has a few issues that need to be corrected.
> I believe the next version will be final.
>

No worries, I'm just thinking ahead.

Bart
