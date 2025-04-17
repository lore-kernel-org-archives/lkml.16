Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2128D21D599
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876028; cv=none; b=F1shMY1KMOtVwx6orbMhKkXhFWdYjjJyD3F9CAh1MrlE5O/FbyAh/RXRaXdxThA3eWwnAeyzzk8rh3HP2KoV1lRCEldsq3MsVG6CAEejEs4jjhC8FW1gEmwScsmeRgBuylqqEr5OZMD/5jNrvXaspMI9jQLMw4r1ztkHgISEuCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876028; c=relaxed/simple;
	bh=WEyznqoBqrdJu6XKj04AtQkuSGwFcw9ym4LfF8stkeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5obFG39ndXdY4viP96d2r2euEbc7s+lH4auZJBRAt4mKBsawy9T+B/KBpk88rF1JrkrdmSC8RY15/IpCFoDeY60oxYYUxYUu/l7skZknexqIrIiPYUsVhzUNuVd1nNN1k1H62FRGh32EZgr5O9UoTq6S7wtrcJQ35zHP08QY70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IjLwB52n; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IjLwB52n"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-548409cd2a8so654763e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876024; x=1745480824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEyznqoBqrdJu6XKj04AtQkuSGwFcw9ym4LfF8stkeo=;
        b=IjLwB52n60q3Q9VFKKP6XWVr6fust+tzRAz6Jg9rFcPHO+R1OsIThj5zvLyXvAnsej
         0m0gnoYOfXokeje20IoVvefHq4k4vf+dGcw4l+ZD/de4DFG2ByzRpG4UQRdoc5vFTu0F
         wbis8hSL7RIxWyMpA7nugFAL+CDgUE8JItkfXWZVOKJLwca50+krEIuG22Ws4gIx/gMb
         fo2hqWtwkyHSlnAdvGdreeOKULJEyIArlVpbIT40ojQjy+f50CS9F9KJW/BPhEKWqnIg
         ziK9pJsXYBD2oPtAXbukwaGZsrau0Myv8dA7jqiGsahbxPnFFD7mq2ZHcB571Cbl5x21
         QkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876024; x=1745480824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEyznqoBqrdJu6XKj04AtQkuSGwFcw9ym4LfF8stkeo=;
        b=g0VSg5jN2fR0skkHuuEb6vTDbHQhYJnBw++9aWRNsmlXShpSNXhnK5XLiFBQj7/Lg6
         yeoNPgTDxwkNx22K6CtnPI0RbTaReXCz+qoa1ulwSMXo0Mtxs7Kgz1Pk7XlbosVQhdgb
         PQAp6KtGUtC1/Wf7XUdPmQWV72gFLKjWfJJUSz00uUsKE5+I0I1+3OKEW2fyA3slXUlB
         Ta9SO5nLAMDialOhzEsmVW7Zx4TZtWMlnNIXvdcjlsFCBeUOqheJCcuskaMcnGen6+QJ
         eBy6MS6LHpAJZjd3+mmvqYNmpa/ERECxGaotojKRxfx4U+nYcpZWEURxvJWOYQzib/nH
         kBLw==
X-Forwarded-Encrypted: i=1; AJvYcCUGEyw16K2/5Gr6sIAgU9bOguB150hXGRjDJjPpRAx2HqWVxX3Lt4u2Ebv7hbhTEZ7XeCsKNCTWiFEEobo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb82R0O5S5TbiAq+JhBppBKjWPded9c2zfqvgWtoNgNO2KCp0M
	+bxK7riOM4zrTZoVi9uiwl0/7joXODAuDTJA4M4H1flzRfHhOux/qvsUBTfPn5pLiqhJAbkmR+M
	24ajwgB9y/IISSMrFwG1lYLY7KPq9FPh/Bomq/A==
X-Gm-Gg: ASbGncvEUONUPqIkpDwPfjBODqE5zPOPUjpzh/JxBASBk1mbAAw0Dbj+AdBCBeV+vNt
	Pwv8qpKy4TKbS0LcmJavVcTMc6M9ZvNtq7Qg/JdTaMfv+lwQ0ELPEXkrQn3f6ujIntU/tiK7b3b
	4Rc6hIZy1v0wcmYyL4g6pFLg==
X-Google-Smtp-Source: AGHT+IHsWIAbtRpfryXnt3qAIwy3EE4NveEHC7HyLBuEny9/7E3MO+B1CV3UsgSfANPfkNtKQcLRY1ygdj94mYcsZKI=
X-Received: by 2002:a05:6512:3d29:b0:54c:a7c:cbd5 with SMTP id
 2adb3069b0e04-54d64aab2dbmr1542697e87.33.1744876024309; Thu, 17 Apr 2025
 00:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416150847.3422218-1-Frank.Li@nxp.com>
In-Reply-To: <20250416150847.3422218-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:46:53 +0200
X-Gm-Features: ATxdqUE6Yg7082az8t1vUSLeJgtF1F2xgv02wcz0LZ7Q-4BmoWJnqMUoGaW2MtA
Message-ID: <CACRpkda42xO+7tmp+CHPfNgx1YEXn6tYDoDXYJo-EnphH9cTXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: pinctrl: convert fsl,vf610-pinctrl.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:09=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert fsl,vf610-pinctrl.txt to yaml format.
>
> Additional changes:
> - subnode name force pattern to 'grp$' to align other imx chips.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Patch applied!

Yours,
Linus Walleij
