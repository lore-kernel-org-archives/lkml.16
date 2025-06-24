Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0D2E7F02
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793405; cv=none; b=l/PIy/KUEXD460eNNCj4KJikLxdGGUxpYMRThZeg6OP/6/4EivYKqM6Ey4iHnrLBLeQiu3HZM8TP8IyeHGRBnF88kLcfsN8bFNDAUD/qjDWxpyXu6LhVUHJd+aejzmOmLHwzcyg0YOVK2IczXjqNWHXANUXYUq0bhKS0BDU/jIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793405; c=relaxed/simple;
	bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFJlbrSmNdYhzrIXt0jHGrkMImg+SdsjoiZcMXURuJAwnF/r9M+MIUb1M0GbWgGXNHyjrplShKc/jzFK7bbnRqu65PWrz+/q6wEYKRxENIJoMGRyuB7HMd2Tc7VHuaECqoiqoqCEbedByNO6zooHIca6DJl4Pr209Soe0lskj0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VaWXAwSH; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VaWXAwSH"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b4876dfecso1958681fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793401; x=1751398201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
        b=VaWXAwSHMWTSB8iXs3tNBcPEkyg3Ut9qALJH/2Ic/D/VODoZh0rUy/q39YkyNh23mS
         iWl8+ylBoLSPPXoaIqH9b2oHLZHaNKKH/kw4URcfs9SjCXeRGacvzME7xsH/OvPNS6MN
         5JnMC3ceRISXtsjaCNt++OdGEK3dqRGYRSigNAcCME7fBT7qPaMh/pAZi+l9QWyK189O
         3F9+4w6uf0qIPfq9PfGq74bzOGfRKMhXi4Fvyc8A3dY49UWSil37lDTHdnDyIZpkJePX
         QThexcetNkhUg5z0wTSey5S/fERMP8phgVwL1McntJo+qhi0CKvzZxnhmwV+9mOlnPe8
         otsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793401; x=1751398201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
        b=a6tTBg9Y6ETdlZewEo6gcfME4yvGkkSJF2OY2LOzJSqzsnCqH9NBfqItheVkehmk9p
         bd06peBe2zL6MPpqzf3H8K3fjsZJFzo/WkeTrTpUzSZiwQ3yClIBBqgg5hd1hBkim4qe
         OrQjGFzLL27FQaNgacEV4SCWdS0MC3doiRK29EFmsf4kue2x76oDDd1G/ahtXnQYoeV+
         RpWCGjOkbByIJnvractmgnfEYimHO7NR0CirTFmMd4xlYdNA7s7lQ3oNDycd2gtb01N8
         2H+D7zc7kbqyjKfeOD+vxJgEyELyigS/L40OQuUMV1jItalNS3eY/A3dsp9GvffcFzou
         g78g==
X-Forwarded-Encrypted: i=1; AJvYcCVQn0lFjXZvltAhOyNDfnoiUy2esqzXzzaXRgWUtDIEGaZRTSro01B4tUxY4q6l/VGG5CeRv+wwQhOwdpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YysDbGLxoCi338dQ2dDpg/38CCd6UW5u8lzPI1iSDzjbI9AO62D
	lk5UkYHMfEE91LidtGJNpExMto98FCo9XNsbN5Rx1rVavHsB8Sjh8s5QkYYE9qOidmeZdoiTPBu
	o8mPwLVvwi+d/CgIF3FrXHCg99g+u2OYpO+yZoSwNUQ==
X-Gm-Gg: ASbGncsB+G0QQgkQb9BffyXiYbKhLQxV/cr21yn3oHX63psaiPK3P0Y82GK10R16qxA
	m+vSm4RKuAwH3BPl2Jc5yLRGcJ8yCx3+1k/0on60Lt/I8273J9kNfDiARFEdIAxBwZq6a1dIktA
	R124Il0kvZrFCb6JyRbBlNOUIPTXhr+jU8T3uIdje2zAo=
X-Google-Smtp-Source: AGHT+IF98ZSPZ/cGMxtHIlOFYXqQCIVwb3pGxoVI1+8dIHaRQQbONGD63qWy0teQhv/zjiwvc80I0VajZL9v8jDE+HY=
X-Received: by 2002:a05:6512:1114:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-554f5c85c83mr1536330e87.9.1750793401366; Tue, 24 Jun 2025
 12:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619022337.43900-1-da@libre.computer>
In-Reply-To: <20250619022337.43900-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:29:49 +0200
X-Gm-Features: AX0GCFsG5W-9LgBD5SxFAUBKe02Az2IUJvG3jsvR1-qxVNZZOZnEgYf3pYYd0gE
Message-ID: <CACRpkdbxLVncSn_=030PiDnbtOc6aBz-Et+5WPSARHj2Gc5Q+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add g12b pwm groups
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 4:24=E2=80=AFAM Da Xue <da@libre.computer> wrote:

> g12b and sm1 have additional pwm pinmuxes for b, c, and d
>
> Signed-off-by: Da Xue <da@libre.computer>

Patch applied!

Yours,
Linus Walleij
