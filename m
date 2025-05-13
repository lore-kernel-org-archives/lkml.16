Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F71E570D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128524; cv=none; b=pjmNsORQd3cR4wQvR6x5t28042eK4QRYP7QSVe5DGhkH8PhfaonpofSl3ZgDa2h1KqPLiHY9moq1Q7Ip8dBMmK0GAsdL9UJEBDwVbSqHYOLlaAK/9T8kLPanR9bdVzEKxT557MijdGaEpRhurscoF/h2WnAyWh8jGq6/QYSDLuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128524; c=relaxed/simple;
	bh=sdWO6ko67mqTWcGMEtMgDVXtVTLim084V1a605JGgT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkDqC9v9I/AZSiXWRSxIF7/y0Jn0820YiMok4dO2cbdv2S2WLQgy135+uMvxVVI8GoeZJ3ueCVpajLdNpkSXWqSj6t13Ta4IWdJM2YEjA8QXB/oiQXxsU8y3B5GmEP3W8ogbogp9E0X2kBm1Pt/4hxBxjXgApqyxNSsusxRHaIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtXHVIrE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtXHVIrE"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b10956398so4905405e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128519; x=1747733319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBWoBdG3lbXFBJdWTyceAqfFC9xtnHUxGj7C5Wu4R/Y=;
        b=xtXHVIrEJxQpK/jITVVUxFeYQH6C6fVt+60KftrSUEpcV+ZgECys7tjl33Recxr7ZX
         L7cAZzCkuXLXDSq+UBPQxzDwe3EAx6RXkgsGPDSMgJFAPpWug//zhfP9EQ1mMmr089lk
         ON7zUSjCE1WIPfjfoRXGxeJ3Tw4BeKLG9ig0T4ZLxNikNCJ4OQYaGQUXooFKybdpY/T7
         AMm8SHkM9O2FjGJUt8Ci3XHtWKPFztGf1DCdGpPN0gnxkn7sbr5Fz7WtbZo851wbXmpS
         MPDbRY7FwNXBVIJp6/xsgRe24iiSqb0qly7RXgUHdobJjCtrq3hpnrZV91xj2d8Cghkv
         FdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128519; x=1747733319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBWoBdG3lbXFBJdWTyceAqfFC9xtnHUxGj7C5Wu4R/Y=;
        b=H0j4l2CxoeGAnMi41DiH9s+jY5JE8t1FXM77jp50QW1TC/oC45xTBGoTBT54pbRTxp
         MhWDpADWNShOlP+JziXzvuR2WnQTTWYkLgPwEhiScRgEj6yIJacUlQAbtJfZj1Ok7uVg
         LjGDK/6VdHSEe/RZ0LFXY8FqTYhQHukcxWQt7WiUgc/QgC6t6BpRodva8qlGiLQmVUmi
         LqIGG0b1PU0BfHiJs3wNskk6A69hSwIRXj0JJcKud4X/jMHJzrcVyo6lHgjWDF4kP/0J
         qOLLhcCr97P3vUUPzMpDw8iId957uxL+00vAhG01qhqNUzOBsTnrFc+Y1YiVwZ4eHic9
         n/BA==
X-Forwarded-Encrypted: i=1; AJvYcCWBuw0o2zBGPya0YF94hVBGTocgtmyojNwTX+uJNrY/YDRPVFxx+iCKPuxIboJ8j0YLKxIyCLiH+lNGAnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgns5L3LG0+eY13c3Dg8shzrePe02Vc3tm014EpxMT3yMIT2T
	jLE4S4IATgvGD2RY0kGoC4zKUdT7AcYILGOPVmfE0giaEc9oTa4w5+/4/Z7nS0CJTGECj6/5L7L
	Yu+BWkBQJ7unnAUvt3XJslR8yCveobWOYMrFp7Q==
X-Gm-Gg: ASbGncvZ154gxfZauM2AKx/rm50vSMS/lvxtJqDUm4VwRlZ07u8HzUKoVpxeiUjqUKE
	LqhEAjJy+mQ45jUAqf8AvVaK6FFdTIZR0VzSDHIQdXtyi7WbG4XM5cafE3PKYP9s98AAr1YSG8L
	XAp0R9ihvjHHDrSvu/TvPNjNm6k8k7TtK7
X-Google-Smtp-Source: AGHT+IGPsCaQsVwlbGypFhudSFOc2s4QHLHTEndYHt5ArHEoc7abTls+1/mAIN2RUHgXYU7cdExwVaSdPdvNIIu+maw=
X-Received: by 2002:a05:6512:1385:b0:549:6030:a720 with SMTP id
 2adb3069b0e04-550d0c09efbmr969887e87.23.1747128519475; Tue, 13 May 2025
 02:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:28:28 +0200
X-Gm-Features: AX0GCFu5WhS-D41dmYNwbrb5PKy-0pktNjYekORF361g_nOjHNY4p6UTBXBPCbc
Message-ID: <CACRpkdbcm3AkcT9SxWfEYz1tsZQSLMUgY5nmTD9_iEq3Xs+shw@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: qcom: several fixes for the pinctrl-msm code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Sat, May 3, 2025 at 7:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Fix/rework several issues in the pinctrl-msm common code. The most
> important fix is the one for the gpio-hog handling.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (4):
>       pinctrl: qcom: don't crash on enabling GPIO HOG pins
>       pinctrl: qcom: switch to devm_register_sys_off_handler()
>       pinctrl: qcom: switch to devm_gpiochip_add_data()
>       pinctrl: qcom: drop msm_pinctrl_remove()

Nice work, since it is core stuff it'd be great if Bjorn could take a look
at the next iteration too. (I'd suggest to ping him on IRC.)

Yours,
Linus Walleij
