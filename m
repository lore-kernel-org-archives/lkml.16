Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6691A24A078
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581310; cv=none; b=tha5JKWBA83T8FPlRhGx+fRhLdjfsgLHXLPJ7+nQtlYH7ekVdS4J6LyGOrEpSsFyJ2lSgq+Y/91b+LZ/ZGs1+PcUDx4MHAy1179t7RhnHYGbTDfP2Ej0qw7eGAUf186pdDunNvjlrJY0Gmg60NMRmgpt+nTQnTFgQwFcGISweoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581310; c=relaxed/simple;
	bh=hXa7xVr03JFbcgBBljLOZWrTDtWUk6UBg/vmRmvPVoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0MuM1IFKSn3VBdwncL2E6xFxmNU8wJu3btKE1K82JEcjN73OCbVUIgkI74qjfDSi9j8uDkvfvtAY5+bbJE58z5HEXu32CuPUFlZqlyDmuLYlz7WI3hfyVMwwmpNWOjzpESzMWVY3Vw7gZV3psDOS5j39xlSnPKnYiGUlJi0Pl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s06L0ePE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s06L0ePE"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55516abe02cso413861e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751581305; x=1752186105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXa7xVr03JFbcgBBljLOZWrTDtWUk6UBg/vmRmvPVoo=;
        b=s06L0ePEV+Ik/W++lG6RnHh2ha8t1mhR9yAbOmBc/IokvzgsMjUYG2PGa5hCfZfyYu
         7suCgB0NhgU8mGTFAZE3l5VeQRtkAR48nM0X9mIan6GXsHMLV/MI5JL1h2WkOgLa4vjv
         mKgIldSipKXKAg695Z58qM0JMF0JDcv3nj5MGoG297pVRjK+Sy0CIWOFM6YUBdGn38sF
         zZEVUROaG/Eggrt/Cemq4QpG/jU1RWDVhm0a0f8iUbxp47Lyn+MmfB3hoKwSXdHwyqtd
         uJJ2z1pJcgrWs+5Dt1m91CZj1ftxAJMLJkPpw0MVns+3YRo2A5+0nuuD9WohhQN2sQBo
         87JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581305; x=1752186105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXa7xVr03JFbcgBBljLOZWrTDtWUk6UBg/vmRmvPVoo=;
        b=UA1+DWsPEXX+n9Gr0yaAAW/tO8eVGxHSdKhu+3POd25bBnThmmHNAfSJeH5mohpbTz
         AWr7py6Fss/kjx4K2Dnp67s5hfENTGUY9GIjvIscyg5l5xb1YAsDWg20RXcOgk14WKcu
         K+ZDPNe3vnUxLnXgTmH0wmnegoEcdSkAqIHJUziLJa6FDtRrhFg7tJiHoCSEHvRHLVsw
         uXnZ4uBAcStYoyrGCTNKPypTy63tSXrM0D2QT16yynXIrHNAi7+++gycvhC8XxINXUxF
         3YpHaB9RM57Eq3pj2o0H05/nblszBv2hTsyp2wTbDnV4mcHmfcplRtQGyF2iAJOYjES4
         +fqg==
X-Forwarded-Encrypted: i=1; AJvYcCWlfYQZgZVM4/n81YNK3u+08Yjk0mx+9HB5Dr0/mI1dUtF+ruyW2FOADyA2xryLPBDPdOWzeTqUl3W1oSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsnCtaFUFsY4GYoje2jJWqYt6V2DfMFOWDxvRDEHsI/DTe8v3m
	O+c8Fk6B7ZMgwyxQR5V2HbQSH+7ADfAMLvSEB+aNZfRMiJVUxK+33HWVwPK63XwDgOQKrXt0mno
	r9IaplipN+2l+NvhLq82qXYKbAlh66llDTBOuiL5slH5W3Wsa51wc6jpc9w==
X-Gm-Gg: ASbGncsh8gFsKsstkin+Lh3AzZjT+L01eu+h2U1SOTJ7DPum6xPuuID1Mw6z3RaWawM
	madf/yaRWpYtqOsuOybdhZ3Vr+opJpiddmHjnsLXRWw/8eqMOjnPJ9INvI1uErJEsKI6A3iYL9L
	EDLqTK4vg6vBY8p3msEbIFYBnyQ8KRT08oiqtiB+zAG8M=
X-Google-Smtp-Source: AGHT+IEdCJvHXhlmBq1702X71zoM5ng69d7Mh6npUYCQ1PTXuNgk3bG87vuighjDtFReOyDckV1OsZwH3mt/qEZLkiU=
X-Received: by 2002:a05:6512:3f0c:b0:553:2969:1d6d with SMTP id
 2adb3069b0e04-5565baa76a4mr164653e87.13.1751581305466; Thu, 03 Jul 2025
 15:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153711.194208-1-brgl@bgdev.pl> <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
 <CAMRc=Md=ABd+aSc7DE-2dsR5rMnpnvbetuexw8vmrf7_zzT31Q@mail.gmail.com>
In-Reply-To: <CAMRc=Md=ABd+aSc7DE-2dsR5rMnpnvbetuexw8vmrf7_zzT31Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:21:34 +0200
X-Gm-Features: Ac12FXyNl8F_EhX9xgzHWQ-gwTL-nTjQtlFOhsSbHuo_tnMvAihEfroUUjENXQE
Message-ID: <CACRpkdZTXzyROqb3mGoQrsO5X_Y9-yDSU2ESUxivpb=N1WsP-g@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 10:26=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Yeah, I would be surprised if nothing broke.It's probably worth
> looking into the implementation of the strict flag as it makes every
> muxed pin unavailable as GPIO even if - like in this case - the
> function *is* "gpio". Of course the "gpio" string has no real meaning
> to the pinctrl core, it's just a name but it would be awesome if we
> could say for a given function that this means GPIO and as such should
> be available to the GPIOLIB API.

Can't we just add a special callback to the pinmux_ops for that?
like

int (*is_gpio_mode) (struct pinctrl_dev *pctldev, unsigned int pin);

That the core code can call to ask the driver if a pin is in GPIO
mode already? A simple strcmp("gpio", ...) is one way for the
Qualcomm driver to implement that.

Yours,
Linus Walleij
