Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A4E224AF2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128247; cv=none; b=c6psuu89Yn3PW1mss4M/+ad+N+yEtSvY4ZBEbgSp7/WH1HYP+2kfPwkfze3F9JlR0iQ1YhwwG4Tj3wWgjq6YJJELH7vxguPKd64x9ZboR2roWIfJrTCRqMgCYxyILsYb+N28bsu6fJv7ht5IyBm1/4RBOWQFFm94cORGHDgxO5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128247; c=relaxed/simple;
	bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABcuJRH6Q4LMjPpC3X6+eZhGjLiOaaxA5JwgHSNQcXgjlA/0Du7v0KMogDdSTQ9sPFXZQtRo551YxMVqvK8isxifh278Huo4ir/OS72zBHeCchz3jEcO1SheNclG6AWwwFxtlySbZXqZ5vEfpNMH27cfV3VtRBoms9CRqmesLbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vn7mUxlR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vn7mUxlR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5534f3722caso1161934e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128244; x=1749733044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
        b=vn7mUxlRdflpTOj+Pf9h6Fm0Dl5dGEFlK9pjKAPnan8AFHnwLq+6TKGggDeqbtGyrO
         5cbtnk4Kpdd9dvchLv5QGnmwL7LSGaR3OmvsrWT13zWRSaLcgWPQ8ZPXZGSy+CRsk0hZ
         NaCFxmu71OseErHcESTxxNzfnv1iGf3xfCUU2U+IrE5qcy9W++J4OHwn245j38RElxla
         mH6ba4yabjVinzeAUjP1PvzZTgmKold+bzopLe25z3XFM9SaXwf1tqP53wih1RfixaNi
         WGkT3Y4fgIKpIZ31dRXY2crpLx5a99+1S4ERkiG4dq2ickkWxoMnnZ0ma8h7iFOycTEr
         RHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128244; x=1749733044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
        b=NjfPbv+fZxeYwrNPY6OKe8sdEMBpqStkRZj4hle9o812X6ODxt8AHW2llEPnomyg0C
         K/0koowxz8H7UP+Oi04NSjimlRmWX/8D1aKRNuaDaYA+DZ5SlgHIWf7dbBlLfy2/xk8J
         WQwR8nrs19VysC5DOy6UDag5+mG+ZiDXigpeDNo2v68uN5yiWjLEHUx4KZ8YaJW5WUr1
         y9txJWcvUpXiw+OoZBYfk0yU2UMdgmn4Js4k3Cl4c+Wilzx6MwL1uNmXQJE5k5Nngub7
         o2k1mnPNSlS54QGFAYmsEak4+L0iliv2RHXi3BF9r5cLmXtVBSuvKFWwdY2pNt0Myxs8
         rurg==
X-Forwarded-Encrypted: i=1; AJvYcCUlhURYfys2exTkobPwEyxLQAMU7AfEtvq324FY4yhsvF5kq9cSLRKloyxaVWjEYDjqDCwfidizDPjtAvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYoEj8/utMvMPg69AOfislKtAnip4sJYbZelg9HxWXoJ1JcM8
	ESa/0CyOonpGHQpGi/8PPuot0n/87fQY6/tyndFVuj+daJsjTOfJjTDGXTBrwymY4m+5HQYd0y6
	iLjwEslkY34ioOl/iAxySJiXipsuQuPruGXkLdPffVQ==
X-Gm-Gg: ASbGncsGwnQMZrISWyNYARxlZ4fnujPSjwUJodTSdA4qr3oXXgYv/9z8eMsFlQQh5Fj
	jfCM7d0sEzWfrX7MgoReNl1t6M5ZNLSpvSjhEYhMHv5aiNZqeFa+BW8SlqL5H5YHWvUTGEtOp5T
	qmyHsa07/h+mTznvpw+fQN/2ESSn160TUY
X-Google-Smtp-Source: AGHT+IH9Fc11r+z9z+t3mefrHIVAfP3iFGxFMGaJxOiqNg6l3VU72qxYnBUmiH/fduZ1DDpbUCP8vP1nlENlTDvVodQ=
X-Received: by 2002:a05:6512:131b:b0:553:2cef:2d2e with SMTP id
 2adb3069b0e04-55356bf062emr1989659e87.22.1749128243632; Thu, 05 Jun 2025
 05:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com> <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:57:11 +0200
X-Gm-Features: AX0GCFtoxtlGiRHxvWStpchY7_DopJKwnpQcArCi5YFUYLwYh-hGYulMuAzYZ6s
Message-ID: <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] ARM: dts: stm32: add alternate pinmux for HDP pin
 and add HDP pinctrl node
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

> Introduce hdp node to output a user defined value on port hdp2.
> Add pinctrl nodes to be able to output this signal on one SoC pin.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

That's nice, this is exactly how pin control is supposed to be
used!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
