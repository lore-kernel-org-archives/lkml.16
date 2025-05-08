Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912A2253EE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707963; cv=none; b=LBk8YYy3cNN2ecqAruaYs0jTDvpkXGKtOZkB1W83HZ699xDv212Xr6g7QOFNY2jO+5Bg8hrP++TzkTN7+4qwjyJqLNtsk7veGRqazy9oGisPUcRG1tFmOzz61bgrQ9iYcdH+8MZzTYBfdk1KOabL/oHHlt4D5Bj/Qza3pGTJX2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707963; c=relaxed/simple;
	bh=fxy4oDHF1pn8d+iuTx13+tfCW8RZDyCkPpV0oh3yr24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtU6v/lsNHL0SR61ik530/UaL050riEblbSvh9Ayk7hAWPqdn62bgFI8zkRCoqeksuFaBAXk/HLJ7TsSGfkX/YOYp+aPyfXF5aieIMvhG8tQxF4+5LGWDfmq1n3CnBStgU5RddqFBQxPwCQsRl0XNdthc0qCGjAP2F5DddTWAD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+/jNG51; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+/jNG51"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1074564e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746707960; x=1747312760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxy4oDHF1pn8d+iuTx13+tfCW8RZDyCkPpV0oh3yr24=;
        b=a+/jNG51ZFMoPW3SAcoGPQ2sIbsOXvPMx5ZFLSErX37O4ZYItpC9eO9U+dbjgpSpi+
         7DxY22+yYQWWB5W1M2Ob9WiTPnmUDmLFi+F22HlV/PHqRYy9vFzkqqgb7NaHObfhYjiM
         URJRnHjdDwYDXkIwEyrIYNWjKt7ba6CJpY4OsV3NUF77LoQoChwW05eQDCqxnCO+sG5B
         u1QhMbjtFdMKRaTiKvW6+9YZv4imGe3ECKcBH578mXvPgZrc7XB8XeUwIbj4bNRvW86I
         jsEGsVuJ82Tqt1GsOwBUP/C9LkLheNcqZDQxaDUSEG5rFtGbI4YuwcDaBxYuF1qwnZWd
         zyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707960; x=1747312760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxy4oDHF1pn8d+iuTx13+tfCW8RZDyCkPpV0oh3yr24=;
        b=NHLStYNZCs9Iluk7+M04PvVQ4nzbO9wlPPrqw/XaZMsaAn1LW7C7Qqfq4+PtRJ0fid
         Pz72R6CQKMW7iYUliEjT4LWXSoDQNwpCzJdMenZqgMGVZR5N0MTM/himyAan20Vcuy5C
         bP3zgpYE0h7eF0+Szw56bj6a74jhBbm2j7Zfz6k5XBpNwjiZB973i8hqRt+WH6qF+IVY
         Kjw0LeSyfxxR5PytkSK2zm/V91CTIEua6UOGMAEjqY84cMAsYPCflg5j5MqD0EUQs8aT
         TpTz/0QDAh47Cc0SozsnKToNnHRMd/zG0MVTMi/FVJvxHhEXk+Rh06WAJk58aEUtusA5
         rV1w==
X-Forwarded-Encrypted: i=1; AJvYcCXxAKfs8GjF9ud2vlY8nArGlmPoQ7hSi1wu2+tWQkD/MYUKtyv9M/vYjXC4Tx1HwAeoC2rQ+CUc6pu6nUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH9Mfu/gl436Cmv4oU2r26rnMA17txemsjVqn4NHmaTJLRSqgk
	X03hM5cB6PPfCSMYlijie4UDifE0ytDJzh0TMkKkGJV+oWFBy91uoqhG0kWEG3xxorF2A16I0XU
	D4T9LHeMELBTsrQwdD48GkvdOJY+QTQA2MCzAHg==
X-Gm-Gg: ASbGncsZf1EKRAuVhvxfQakUg73wQ0gbCOqH1f/UY9emv2hNBiS7Z/8Lf3ZFZOfpRH0
	v1+5nCQx70oNCThbuSS5fyvdEb1A5gvcaqHXAV8w094T8qQYespfC8n7wWYH0B2HaJObSpQNiwg
	sBNqFxWsUrSJrVWhk9Kd1RUxgLJ4svJJ03
X-Google-Smtp-Source: AGHT+IGGrMdIbK+l8vxSoUfLVyEvO0Z3NdZDVB36nn2Anll0m3eQKniQ9zV0PNvk8wEmAkWUY6p2JaDvTo9TjiBiOgs=
X-Received: by 2002:a05:6512:3da9:b0:549:66c9:d0d9 with SMTP id
 2adb3069b0e04-54fb95b8cf9mr2506333e87.53.1746707959903; Thu, 08 May 2025
 05:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506092718.106088-1-clamor95@gmail.com> <20250506092718.106088-3-clamor95@gmail.com>
In-Reply-To: <20250506092718.106088-3-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:39:07 +0200
X-Gm-Features: ATxdqUFbxZHQaqT_16mFZM1zpCqWLrcrUnDz75se3Y3SyvtShCLzKride0am1Uc
Message-ID: <CACRpkdaOiFUPf8fTGZk0RR9=oVni0DEaYqdUziZRLUr5mZjtnw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm: panel: Add support for Renesas R61307 based
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

> R61307 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
>
> Supported compatibles are:
> - hit,tx13d100vm0eaa
> - koe,tx13d100vm0eaa
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
