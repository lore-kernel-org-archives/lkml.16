Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85AD2505A2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288296; cv=none; b=Dryg+/bKoP1DgJAgvZkaqCOhTacVvzqmT9dagT3Asm2VxxtThtlkfMQDEO2kDbz4oYugfqp/9kf3C0TBj+PyDDFgVC4Ncn9Z5X8YtFnRzzKT2U8pXxJYmWkPoo68JE74Raxb7fcKWB9SGN8OBvbA95zrZHQsNVn6TuWeysRiWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288296; c=relaxed/simple;
	bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQUvkVE+jDvx9pv4NcjZfEgy34BKdw74ZDQ3dtNpXhwx3EHNjw5g7s7V/pQIs0L7GQ7Qnrsivl8/ngZF61i/epIKWcTJHicIgHM/kwewbudp8mlmTfsJarYyntR+nFiF1cOs5jZ3VMaPk8ZSeVxtiBzge3cv3yeMttAYPiRXB/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AnbOpYRx; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AnbOpYRx"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30762598511so55688951fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739288293; x=1739893093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
        b=AnbOpYRxf7oK2fKXP5+HD+qWExDkvPfFxoD+BT5fqzFvFbUL1ZTffudblhH4gRjy2F
         MgSeJ5fS8Lq6GyrY5hwTWMbM051uq2keqs5sgHMKsflfpzB9XzTuqx6MGYBeWpERn5oY
         EiMxK4ZlugMAIO+m0jakOQKXVteVFgwpmO8yAjidELOkBLV9ZPcF/jT8L18I0fPXxbAw
         RwbBtZ2V4Odhc0yomUo5dhl1AMwnuDzHCEZo+uUwNShjPGYboH78utPZFVJaHgvcE+pZ
         +OF4ciBRDzeMkRJqIEcxZl7G/tX0dKEeOAIES3kpFgocECaiq+tupMPK7xCOGeJZe5e9
         tFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288293; x=1739893093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
        b=PyDCgqkKrxSDgC1A2kL6i5VFhtcxAH9muQgT+2eDZpHZ9EIEoFfoO97tOpo3ciSOiQ
         Fg9+gUoGbRbQtiwQNjkRPKRLpTNFDq0pRmi4Z5nzwrTu0fjJQuGkPzfgYRoa9VeLtGx0
         lY6NneaOU4LArlLhr7W5XOhQwbtZ0R4DKal4ymWdOz46Jgpi0GjdQqkwLuSbfVbfyjbR
         lsnRKiS0XmEzvcxK0XztV9aSn08tUI8MwsDI8kPyk2rkANIRifsDWxv5TQgeGIjYuJDX
         mrmt2wjX8yzWBonbgKY+PfqgvZnSJlQbbYVe3+vnXDV9kXBEEiYiVQz/eQd7UuLg08sr
         5YXw==
X-Forwarded-Encrypted: i=1; AJvYcCXTj64go7lla4Blri3lRXeMzL1ID3j3qF4TtN2s//PEAabls8b7Ccklml2Pi92OafcLEyHYFI4CAnW1nMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyR4W8kJnMm1DCpjsPz4NObb6gz73abokT0GNVfVXJfWEqhbFS
	UaX+xz9oGUQ5oXVWusL6VkflDX7E59XbVU1pqSrUevlm94bRam97qFxA1M+6De++t2gchVH89/I
	4A7alXSD5sw44cvlJSiAkOBx+lLKNFDgmtDMf2A==
X-Gm-Gg: ASbGncsq9nWqXs8GdFaiTnkkEzRKZPkQ/MN3PFih54iteQQMb0stFxXqX1A6Fbjn1zq
	Vh5y/Utzv7OYqGVgFmetXzjyVmSw7CkupkT+tKlbA07SSMmj/97lqc15UpxUgABlSLJMCq8RPcj
	zMpVBvLfWNMaEK5l8DoxkAFRmViqQ=
X-Google-Smtp-Source: AGHT+IErfIT8Go25NkDLkQfR5NhzuzlhLOzheD8LdphohjPe9lEedbA+M9hKeD09JvDHlwEEcEqYU/xf/b/UxeLa/b4=
X-Received: by 2002:a05:651c:2129:b0:308:f01f:1829 with SMTP id
 38308e7fff4ca-308f01f1f54mr26709121fa.6.1739288292563; Tue, 11 Feb 2025
 07:38:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211144300.964-1-vulab@iscas.ac.cn>
In-Reply-To: <20250211144300.964-1-vulab@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 16:38:01 +0100
X-Gm-Features: AWEUYZleW_jmzFJ6vP032FNVqBGUdDWvspy9Oc7CZIhN6a5pEweY78yBo9eHn50
Message-ID: <CAMRc=Mf+yuM-g1XMVpTvOXfMvf6t+saMJYfKXuCZU8fSfzxdtA@mail.gmail.com>
Subject: Re: [PATCH] gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 3:43=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> The stmpe_reg_read function can fail, but its return value is not checked
> in stmpe_gpio_irq_sync_unlock. This can lead to silent failures and
> incorrect behavior if the hardware access fails.
>
> This patch adds checks for the return value of stmpe_reg_read. If the
> function fails, an error message is logged and the function returns
> early to avoid further issues.
>

Would you mind adding Fixes: and Cc: stable tags?

Bart
