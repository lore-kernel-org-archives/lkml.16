Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A72701B1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398873; cv=none; b=KAIW9yJHZuQvXFM0ThAcx7H1KqdhDpdxukt5A+h1KMgJh++zoJMbR6KB5/RTjH0KCm1rGPl/YGm2i5aqY89vMBRcRky618hJD4YCN5kMbxt14DJxh4YKdQ4UhxUuwsUgijntaBFJXPsTkQJgyMnYLmdWNpRHmT5xzntUHbfP5wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398873; c=relaxed/simple;
	bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5f1KUgrCMa0+6jwlyOaUN5i7tnsbUkmZkmNibhWhTJ4b2nyYh4vsQhrJNPWErpI52gvsDFggpIfCbxvEl2xc6YvPHw7Xlth80roB5BSSRPnNmjorLM6ACSep6tFKHLFH77SrVQ9wEB9gXa1vbeuvYrcuDpILYbPGVFuVgNfjM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wmYogycs; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wmYogycs"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b10956398so913904e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745398869; x=1746003669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
        b=wmYogycsPxJrT5IkGprAIkXL+9jDAOIzLQieuEh85TszOBHxPFwG9p5PzljEidlh9+
         jxUbO3Bs7L3VzNxJCG3vQOvxvwU2DWndvi3ZmNqMjkOsvNHzS1Kd9Gwpt0ieuSIzpkzp
         E00k4LvPWP3IQWV+IIP0whnT3x7gij/Gn8YDAUqvs7vTHimgW3aRByw5dRewYdZYYv+Z
         TGpDFP0SUJl7kwYo4+Hd3Xxg8+05yyZQdtvEgL67A++QxvrTw+goSumWNlJvG5Dn90Js
         CuAsqfDh6ZQgnmmwg7gfNaf55Ns7AD3pvbd9IhMSzw/cieBV21UxQCLF9F9j0spVAjqD
         Obzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398869; x=1746003669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4ONh9IizedqA6W3QPhG+iwsoh6uJslCMo9BpNc/j+E=;
        b=prcItTOfvbSqpNa+xJiU/V728uARgwIJf0xcSFPc0U1Ei39/jb2yska4jlomYG3VxY
         8g51XF+PEvt8LYhUYc+5J+P6EwUB0GZY7RWVOcCwwd0vS7RoSmSIPjbtsAXiwEKfyVDV
         L2+g0JP5xGBB+yO/VzNvKrpFjUcrdQ7po8+AgzhPvUrWK/z16uJvbtc2+/6AJF9UtW0W
         fTTirlVkZLltnZuWFytnL01XgFhLkJYEwc03araJPvRUmRlm3uQjikhaxUQ5qR7b9O5G
         aTR2/bfVJkgL1Fu655z341LpwaWXuVhqQ4lDCnQ9O4W7bq/sqAZKNPlNN4YuKVu+Zwno
         k8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzBXBPLXOzkCDPd3YgPyLKOPlVk68AtXq5uihPCGztF6GaOZhn810aBtjQGsWP+hz4SwyXd0d3oxj9wo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYe1vMNgWtn5jU2oFuwY/fScVH7Rg15LYavaFPsQY3DKVcHzxR
	ux7ElcWzgO/agLJgzcEnyCDtwql9M7gl1lNp+Lh7KFWjwUjf/kis2ETMKZrkdBUEmMqU4tfNwxK
	7SmWVpKuEzbSY7htVxdQ2Fw3O5Av63N2HlZZc2Q==
X-Gm-Gg: ASbGnctud15NROLSXCxfwAApvKrxpL0o3ZTwUnELg7hbbl1NGnKWFBqh++fBZDDWNGx
	quIj415p/CjmqfCMw95rqtofLkTGaLBPNg6hp//60B6czppkktA+d83EyK9n/WtSYuX8xSUmXCH
	VBW2rGV+AUckRuFIXj/A598w==
X-Google-Smtp-Source: AGHT+IEEUsAi88UCbofnaku2lk+aEb48FzRJxri8OckiCKB/AVx4JpJsbdKyriMomMEWTnYqEIv4ataPoB16Fz19o6E=
X-Received: by 2002:a05:6512:a8e:b0:549:8d2f:86dd with SMTP id
 2adb3069b0e04-54e76b22a2bmr572698e87.20.1745398869092; Wed, 23 Apr 2025
 02:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417152158.3570936-1-Frank.Li@nxp.com>
In-Reply-To: <20250417152158.3570936-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:00:57 +0200
X-Gm-Features: ATxdqUFs6bNpuAZ8C-mefVn5vnH3rPvKnGkG9Xz5ALDijczN73qOaRKozbezrQE
Message-ID: <CACRpkdZkhQRdDCTBxOUifT3uX047us8cFExhZiuAUueegD-zeg@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: convert fsl,imx7ulp-pinctrl.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 5:22=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert fsl,imx7ulp-pinctrl.txt to yaml format.
>
> Additional changes:
> - remove label in example
> - fsl,pin direct use hex value instead of macro because macro define in
> dts local directory.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Patch applied!

Yours,
Linus Walleij
