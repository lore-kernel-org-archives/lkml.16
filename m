Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3022153D8
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261725; cv=none; b=TXpPK++AvTyi9RIqoQ2A9ENc5nxrngZg1O+paIY1+7KkcZZR4p21BKA2w00Oh6CdR3UFhrlXmazoPNZTvB9HMJKlSPI/NoRr3+MGxBSjYoRqtZimkZ1v09X1pJJ4AaM4NLQ7/53B8xPDqZU3tWexq6ylUbgoY6snyZe4poOCk4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261725; c=relaxed/simple;
	bh=ikg7uKNlFxdtInhouVVjlX/eWNb/Iocaf0FOoIsWq04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVyNqnpYK2r1hgTOtGJl5JhysH6KSOU3LOyTfUThJvlAPJ0cp7Wu0FCPaqfTWiRB2UO2m1RuXS/YEPc+nzGXbW5mCHsezJ0iJNwx1/lshLzWLxcSCFcb9OFXIdX8CtGHI4ee5TPim56YSlGF99uyJ4LVbDCkobsiTtanAhO4C0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVSWe5Ok; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVSWe5Ok"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549b159c84cso233113e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747261721; x=1747866521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikg7uKNlFxdtInhouVVjlX/eWNb/Iocaf0FOoIsWq04=;
        b=lVSWe5OkMpmjEy0mhYsTTltJfu0oaUtd//WBacEWg7ZSevmG1HqR+FdcNn9YT9vPPP
         5BOQetKQV+LeMQyoORqCJLjIDoBhtLFxdkpRtvP6xuq/keEFldb/aNQSDSQarbtL20oA
         9dxkgEIkGIs7oz4WTcdcE+EIWN6n5FVzOztRQDX1NtiShFJqDH/QHP/K9v+3sYM3HLvA
         O/qrQoBcK3YMD+2Rom5Bn32xjkSG8UNQ4CVXaPPzh6EzrdL6WoTY2p1jtmoRe/gu4B92
         y1+EI5RcIydRYBiulEyJJL9tkHHrNjv+sYHTwG4Th9rf/GG7zGWo0Y9boJoH1zQr8mUV
         yZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261721; x=1747866521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikg7uKNlFxdtInhouVVjlX/eWNb/Iocaf0FOoIsWq04=;
        b=LQtfPls0MKItHdhISA8fLrGFuwd9CrssQJTFMymz58YiaWrOr0LATdmfuW6g2+J/UF
         SfVV18C+VXs+06I84xCNLD19tLWOU69FINi0Mr+RaHbUvtXtDMaqLWd2QNsi41ZzcQoV
         ulngEtRXk8qJV0s/lw6sq2btmnwkdwhBgSXXMF1M/APkE4jSvFot8rmhXVNdsneMS8bJ
         3DGx6JyUx7fDEyY/nnCK2tydRg+Ii/fwRRqZ/9IuGcnQJ13lDSEgpbZY17QR+fgQJJEY
         dflzkseWrhMQQyFifP1cmSvNx68QYxRAIqDaIX0Ld3mepbhV8XXsnqL/IKwwLBwHulP3
         4jtw==
X-Forwarded-Encrypted: i=1; AJvYcCVpo4JUflUJBZpcwJltgfCDTjqe0ffqO8a92T/1/ANAYx5WVbpLmjUQbmy9j64EyGtSroFtJP4IuwUQjTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0o92+0+GCNW0FkJg05R+dF+5u1pUkA59bYys0MVxQULq81ndh
	WkCpNFNCQdK8h6FOUkfqMI/nsZrdRSxraujJrp5OKkntkcKppD6hMkwY86uSosEPblS1NUg//xI
	Vp7S8aZTozt9OYz8ziqeeDtm9pYN3COaQF6cxUQ==
X-Gm-Gg: ASbGncuO9ZjEaRPhdpm728A0458uYJCOauZUI/JdcMJocqUNRNu2kdWrQRHO/E2UqfL
	HVqat7CIFwpXwDk4pqbv19rdMC3cD1hRzeiruuUOBURjLbLa8bOFC2MBDfQ9ua3dKZR0spdUkbJ
	BBu/Ienh2FWozonV/Jkue9lhm9bMqvVbXoODLAVK1eM4k=
X-Google-Smtp-Source: AGHT+IE1Vp4rlvI75qMKlDEVkN1t9zzD3BxyByO5SW27Vl1zUjiPYHzMEgLHLW0x21yYIa1dbtvC8PDJZuRwP2Kenrw=
X-Received: by 2002:a05:6512:450c:b0:550:d534:2b10 with SMTP id
 2adb3069b0e04-550dd12aeeemr60274e87.35.1747261720610; Wed, 14 May 2025
 15:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 May 2025 00:28:29 +0200
X-Gm-Features: AX0GCFsW1KstBI2jcV_icDkbitXFWIRxmcRnuAcWr-VFZ0eu8OVxn2v41gFG6Ok
Message-ID: <CACRpkdb2Njam8GGuN5yeR+DYvi0xe11xbARaoDepoGk=gAK6GA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] pinctrl: armada-37xx: a couple of small fixes
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 9:18=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:

> The series contains several small patches to fix various
> issues in the pinctrl driver for Armada 3700.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Patches applied by applying to a separate immutable branch
and merging into my "devel" branch: we were clashing a bit
with Bartosz rewrites so I had to help git a bit.

Pushed to the autobuilders, check the result!

Yours,
Linus Walleij
