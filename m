Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782162248A6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128328; cv=none; b=rpsIa3aYsaho6lHEJnVG4gdrW9VN0dwUGbaMx9Sh1Jk0XVZYTGmSgzjQH2+FmI3+bPF3lsMwlsUIVcwA9wN4sB725u3CJjGpFg2vnTbcGBU1NTAYiKakaBl0rtckbewwQSlzuVmwPDDfCwWdkByM7yyakT8ZCIqPyPfuCZ83mtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128328; c=relaxed/simple;
	bh=5F4J5fsk2zo51ye5xZxurgvmXqAk6TLsSVJ4G+IBpes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPKH7U9CcO7eKdUnqNZT7a+qHWI/VU7R33QNCnIDCHTr8VOS7xDSQKpdSF3EHhI/w2SLyy9ttDYATyzThOwVLNLZSPEUEvVtqgu2HcrGsge1T7EQRO10JJcsofNiYYY/DN9MCLsEfI22A16eagjdjiI/2qI+QGy3Rg0YJ7cNeuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BT3eqY1Y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BT3eqY1Y"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55324587a53so2050713e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128324; x=1749733124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F4J5fsk2zo51ye5xZxurgvmXqAk6TLsSVJ4G+IBpes=;
        b=BT3eqY1YjGowVD7zIW92iWMhbBDHsqhlDu05hSD+L2lblBHPr/MK6FBU/qC0U/osBc
         J/EH9/ck057rjD7cetbpOxspOKf6Dlv2N/mrDFkP7vErBLZLnojTkB1uB/QEt+8kuR2f
         qVTEORHO8/UUcEWgAHOenhhed2zzRHRjbUBg0cOt+wNFaYjceflBN+QR/U7XARQ0mGC3
         PdSl2OKKd6ipdRP8d72b9mUpznYiLeMq1OONEfSyHnBrBMm7GiXgcZE7Qho5lkOffdke
         RgvG9Kzq0Rz0+cYNiE0rAGRADWgbswlD6Jfc05RvAJsiQQmfpS8cqsFiFN1N+VMxl+w9
         3MCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128324; x=1749733124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F4J5fsk2zo51ye5xZxurgvmXqAk6TLsSVJ4G+IBpes=;
        b=T6QLriKeYN+Lox8FC16LgaY04bXyuWS9VpzZ4Wv8nfx4Q18JGRrpkKPmPxPJi+eE8/
         Xw+dNiij4GyJoN5XgOj1vekCqr+L4UUS6aOL5UQTtv+8DrlynF0joVblTIs6HVh50P3R
         pAyjznMKK8115JSBSCxlIcTT262YLkOeE8hOhni16S7WsMKalInoINSsgJcHt0uEpGzQ
         VhDLTb1iUk0C7eiEi3xQB/vPvaE5+O1T3AUXi5ffwa4IZY+YgIZDJ1URK0UQo0DVk5El
         A1ADOLMtxPioCfZ2RZw+qOttGbYc3xcgY+5VgZ1KBFdUZgLVEHZO+drUtDbp2JqeISya
         CG3w==
X-Forwarded-Encrypted: i=1; AJvYcCV1vSd/cNkE2OQuGTP20y/MRRI2GHgQstptfRm6HFNLMZ/JyBPTnF9hlr4BKXXTENX3RgAJca/8vnit8TU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhh8ClU1HY0JWINz92JzYTm55upca4Mm3WNL+67RDKyHyI1Kw3
	YrnuAFfhDJ7LyMART8l3gTJCm73CevV6rx+WM99xq/sSjqmKRR9ohX6Upg7gfH8L8tWTeBD7MzF
	G+oFNqzXm6LJyff1lhHIqspoj+JR04Dw+8dz9DkxMmg==
X-Gm-Gg: ASbGncvfuDjBjw/c7HHxv2OZl9qC29DFfErF6Vf1ycf/JJYqX6umGjmHMDPCZNbSI7v
	aaBAqRgZdv7K+X8VY3RphWkKEamWZTpVr4YpnuL8WoONAy6SEgsZK01eXVTXsZctl8at+Je18Eb
	24CF80Zw7oFGqQQXfXHDkMPKEcBpVvIpwE
X-Google-Smtp-Source: AGHT+IGlsLgaz+OzrX7gChqfwNLu6aN4e02li+U7R1p+y1C1vMiENS7zjDEUb53JJ0ECcJmO7Mh9wmCUqhcTsFjS6Gc=
X-Received: by 2002:a05:6512:234e:b0:553:2308:1ac5 with SMTP id
 2adb3069b0e04-5535d8f54e2mr916430e87.4.1749128324545; Thu, 05 Jun 2025
 05:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com> <20250523-hdp-upstream-v3-1-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-1-bd6ca199466a@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:58:33 +0200
X-Gm-Features: AX0GCFvp2kYXQryODv4yaq3ufj5OHSvi6P7gagdyzXCjgZwqYR5kV58IYRzsLbE
Message-ID: <CACRpkdYz5BaoTfG+y84Y=HQUxdSberU3qnaWDmv2=Fk8zcbm1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 2:40=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> When using bgpio_init with a gpiochip acting as a GPO (output only), the
> gpiochip ops `direction_input` was set to `bgpio_simple_dir_in` by
> default but we have no input ability.
>
> Adding this flag allows to set a valid ops for the `direction_output`
> ops without setting a valid ops for `direction_input` by default.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

That's a good solution.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
