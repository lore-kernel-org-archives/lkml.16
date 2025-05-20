Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0E25EF93
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777404; cv=none; b=QfBQemj46biT5NjHXtgLX0ty6UZyO2Xdxz50aej4bw+9OdSYvLvzP3z1oTLPNNIsaFNkzThmo0/UE272Dqol0SPG8xeASXz0VyJhLY2d9UhMVrklvla6PjSFu15tJaTz/duIL7EVeEbvUGXVWDkTRkOhTXWwQ3DZC5oQ3sRopds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777404; c=relaxed/simple;
	bh=ZkzIX6B8EKK8PhGVq8MydiP2lp2DU4X5qXSyT/4mJuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCkl2nga/nZE3bmViwYVCf5AoKswdTQMy+VP2a1HlIDZFcQ43FYSJ7hhH5aV/NhGlqEGdP+thBWu15f+WCXCQjTgirOp5yfgcbKhHaYcxmOZJgeoOs1y4SiCtbZ/ZSteJttH2xwUC/TsoP6qKkehRl3ysOKpr2NgWuX+D2poRCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbI0Y6mV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbI0Y6mV"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551f0072119so3295267e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747777400; x=1748382200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkzIX6B8EKK8PhGVq8MydiP2lp2DU4X5qXSyT/4mJuo=;
        b=WbI0Y6mVNq1oydgnPoFVdKTl6U+8hIH+/PHFaVP6/L3EWF4ftYP4KWNrJ5f0Gk33IR
         CDDpGO3ySHVj7FRTjwj4fZhBGkWARhHKr7QKNdOu1M20ZvV9Y/y7qcNByRfJZo1HhsPc
         kc5w1vJklwyoyj2W8t29dOSZWfG4VYr8XvzcIcB/VG8gwMp9Wa5E+tA2kl9qmxvVUrET
         jj2JPox5+0Z32QAnPMmojlEiO7Q60BZ4nE3/UUDqX2cCPHGzvgaYePrGBHfcwLTj4gMM
         95DngqU4eWOo7hl3taHWqCFY5A0tq8Fv8WH2e+174sNC8F2w1IDObrJef1Ig6E0i90U+
         8mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777400; x=1748382200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkzIX6B8EKK8PhGVq8MydiP2lp2DU4X5qXSyT/4mJuo=;
        b=IRrpRV5vebeNrKPSoCIi0THK7qIYxNWlrsgOfoe9kfMa14A1awcrqsOmDs+kcXfLTU
         uuA0XFqI+O2A+ldLuVKTla2y6N+v9hVU18i2Y5zyB9Dtc1yX36CEOynmn5Ns1muQmJmB
         tloDt+qGdxorfeWzE+HxPb+VmlF9KRA1wcTtG+U+E85GEQ1W0AMtJ6RrGf/FuUe8rUlo
         X8YFOEwhomAuSqhjYkmlL+1HA2P1T97KvSOUqrFnrKq3dFDgcmvSeANNJhR0PlF/ieKQ
         6L3G0/5nLW9JTv/8BPEEom7ofpW8f83YTKkVrptI/Dd3AdvZVPsGpYzP71bgPdB+fbYo
         pNcg==
X-Forwarded-Encrypted: i=1; AJvYcCW+BxFjCoejL6klhT4c/UfMj5sk3lowccuKPqPkByv1mDP7E+n8hyb2mkjfaZINZh3aWpogGMFe542Q0gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNuG0mhR79zky9LlDxJeBEOqjPGax51opNXbLET8O0FH3n2gmV
	Zlj8TrUJXbTomGWFC+1UeVhx9da4dHqckasIpP4Ba0akf+wl1O5b33xqpbhhPiDItZ+qweyY9Na
	/kGrV3dK+IO6TZIoyOXVDue5CmdaNOspc0PAzRxjM1g==
X-Gm-Gg: ASbGncsQsY2HX75RPYcIzTImK8Z133Vk6OjuYst8e0FGYHsjShkXXO4rwF8dWSPxNTO
	5YSBWfDSAS7QqsaMNrKNMzUxrfLzT5C9DkO27IykSHym7ABxGAxb3gU9xD8dzgY26wUm+dVk3w0
	x19IWNtSbzmoKtJ4ol0iezGxa8LuMXBTr3
X-Google-Smtp-Source: AGHT+IF8sxYQYwPs1M87QK3eMhV+cFNvlhWyc3i+7XrWnhigNXZ8VV0IgUxf6qNyKDjghUzFOKBHeIzo7cNE1x0xtVg=
X-Received: by 2002:a05:6512:1383:b0:551:e99c:de65 with SMTP id
 2adb3069b0e04-551e99cdf40mr4151687e87.15.1747777400193; Tue, 20 May 2025
 14:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:43:09 +0200
X-Gm-Features: AX0GCFtiXGv3w0rhSo7VfJ8xdUZJIxrZrQmBXgjBoZzWgZEfr2JdrMnuBSFAqXQ
Message-ID: <CACRpkdYbzxsDJm=h+vzCcj=LpY9EHfu67otV-Hfv5r5owJhxQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: qcom: several fixes for the pinctrl-msm code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Fix/rework several issues in the pinctrl-msm common code. The most
> important fix is the one for the gpio-hog handling.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Patches applied for current.

Getting them to Torvalds as soon as we see linux-next is fine.

Yours,
Linus Walleij
