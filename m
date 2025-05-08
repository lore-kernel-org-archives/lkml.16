Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A70C22687A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708008; cv=none; b=mfqw9Nc1lmD8n+aG/34NGUDHu4qE4gQjB+jj1qqFUuO4TtdWNw/k0x2eB+xGjQVtpGMWf7FpxjNqTI+RXOE8ERyTY38SXBh5butu4uZ1Lq0CeVTTBfa5mZ/6PvJkYWbGGgCjA0zoOCqLoy2hTQRJk22VHsh4yCP47w7yHbQs1gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708008; c=relaxed/simple;
	bh=k5BZIpNSbnLLVf6GsMiXvLOEULV8LNBcK7VhrImMes4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLbkUFJJgZZi24O8KmvKmO4mfJA06pdePktSFQv8MsxJhOxK8JzCQ8v7UsP0R4E1BXErnrAa/DvIpah6XLs1T7qj5URkFidjL7kXXlmcLzFgTtfEMbmMvpQA6EW5o9NIDEgxB/2LMc4ONgTHHWZjokDGNtVJLD7nNkQWMlaLGjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q7+J1Jt2; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q7+J1Jt2"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3104ddb8051so9588441fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746708005; x=1747312805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5BZIpNSbnLLVf6GsMiXvLOEULV8LNBcK7VhrImMes4=;
        b=Q7+J1Jt2QiiD2hZwMmzCr9aLKbiZog6DelK3WZjUKzc5Ckbh5fKs2QL8oEfdmhuCAg
         K/6j+TI2eI3X090xIWs3im3Vio2k+qMbecXuP5dYfXA1VBAhgVBOWwsGL5FWx6jZvu6H
         3Ms0Y7rCoAidusL2T6LL9w5J1iqoWtJyk056M+4mdn5aCwlIZN3TdOkatC3SlDyJglUj
         Q0bD6tMjZKftNpzJnSGXDXNSrCC1LGD4WmmzbyW16YZ9HxP43hFP/4EYaXuNgfK/KlRn
         ur5e/z8b4OYzWPTUJlCT7G3tlMFVgh7RSBdXs60MzyT6d6evqG9eJtyjfTnD9j94i5Ac
         fN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708005; x=1747312805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5BZIpNSbnLLVf6GsMiXvLOEULV8LNBcK7VhrImMes4=;
        b=Zj9Ey8h/7+ziZ9anQUfqy9lJvbE1+6yhmbFBeHldbXhphBUbEOVtyHehDpGXs82ZLe
         t6Vyt4H5DBf6pR1J+Lt7OWdzmWhMiMSd5XbrzzKFtRmbj4bwbjYbfwj0GmKgWLK1h8oc
         Ai92XW/FoPzoXFVdeuF6qsJMEkH21uid7t57Wrr9gLr89V5HkWVgqpavQ/5rhKlA/tDN
         NgVrOmAibVjtE3BTLLSoQ8P2KwubAtgFb2flbV7y8lBcIy8N9UlShrVzvhTsZsFwrZf4
         ViN7CjaxSrHaL3rFZHIC+cJDy1JDLAfcWOt/zBggKY4vJ36IOXVjdFCOI2ZJkVqih0jw
         ti4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLA2PNmA6sw8K4Iis8Ql3qCclWRgEIHJ5uPuVl41UVvr87kCmqUFYwcxjhf9peB4YG40D7eSKOetdVz1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YysRi7V/6kp2nAPiMGVxPbw9xH1MgOvJaUFxZZ1u8BdAyQX4bpT
	BovWIVlf2YPDlqoj8qf527Iddhhlmc3gc0qfp1ozh527HEFRLN8Gxg9icoYTi+meNR4xY/viZfp
	4weee4snrUn9UpXp5g30xV4lyVhpVz3Aw4QPhvA==
X-Gm-Gg: ASbGncsmInVzqLGskvNIZR+1vrN6P9CWGqIRMq8NPHLNYWMWjq0n4IMpwwijW0By5vG
	XCHwTrn24snnGyfcoldmaNxiGvwP+oCUWwhyDfRPSNtX/HVgPaGaYO82gWGpBbJtk15/ihtAUVz
	c21mNTu+NrpdtpgKmR0aArRQ==
X-Google-Smtp-Source: AGHT+IE9Q77Fc9oOyWJ9mYq6tNAso+9Vl6Y1CISquo5bvdrk2LvAwCog/GBR9BhmJk3ThE6vNrzoMsQVh3TPJJ+DPTE=
X-Received: by 2002:a2e:be28:0:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-326b88dc5acmr12360541fa.33.1746708005111; Thu, 08 May 2025
 05:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506092718.106088-1-clamor95@gmail.com> <20250506092718.106088-5-clamor95@gmail.com>
In-Reply-To: <20250506092718.106088-5-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:39:54 +0200
X-Gm-Features: ATxdqUE6Q61XCWcHKJmDK0yBWijzJI2jE1ft8w41_6SRUeW_38JBflpJsCLlEk0
Message-ID: <CACRpkdZ9_GnsH=gYFumDE4a+Ois8eSyrn=s3qVFhHA7YyV3Y9A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm: panel: Add support for Renesas R69328 based
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 11:27=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:

> From: Maxim Schwalm <maxim.schwalm@gmail.com>
>
> Driver adds support for panels with Renesas R69328 IC
>
> Currently supported compatible is:
> - jdi,dx12d100vm0eaa
>
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
