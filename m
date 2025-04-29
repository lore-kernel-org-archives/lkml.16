Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197127C150
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915296; cv=none; b=O8jQIzU27hkPfnPQ8R0FRJsqiuY+9XNdq9UJ9FaPs4CY1T2ZoqNBXsB0j79FyGrTZjh6QMQea/1dgUT94WtWdw/7V1FVTJE9eAM2Ns0TpUhGOAuXaoILhKfQoI/ldlbV7v/+rxq0e43GBgDupf4nOQwbAejOmo0+YFfqTZ6oL7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915296; c=relaxed/simple;
	bh=MU91rq6x6AMWRP8hSHtEK8HMpJbScePsSH9FDG38Qdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uc4ayQB+IpGjzVEGeF8P64en/rExudd+7+esYhUlD6DR5NLSay8FTOPBu1Lj6WYcxlftZWLcgf1VQJFnF2yMFuLKLBEq3Nos0AsDK095rSLJN/YAIMNiAPQnxN8OewbxfCN1iADefYx35+KC9dzoSh9SnrZqlRoCd+g7XWDOTwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fk24WV+J; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fk24WV+J"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30effbfaf61so65446591fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915293; x=1746520093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MU91rq6x6AMWRP8hSHtEK8HMpJbScePsSH9FDG38Qdo=;
        b=fk24WV+J6KW10tWbbqU2BsRFu5BGpNaxjtT2QXApK39EK5FBDTijtCTmVG7hB/qgqY
         BX3g3bZc8DMJyrZjnE17T/gKusSSV39cIs/GDhS0rDmtL26hEihhQymCrC3VmwZUGHuI
         eww7HHTRPf7d6VFB599wkPndRZBUr+3zWjRcv5oRSITZqt5oe0GrxgoDmULu3tP6mbVY
         hh/UQjNR1FNmAT3hUltrjI/ONXuMqE6/Opyy59bYMbV5hs1FiI0t1D0yjrqeKEoCeQSK
         c1Fl1EoQ5ET00+enQycOTs0TCCVLCGo2cPJfGkqeZcL8o7Mmyp6hQ5rfPFxW8EUMhveG
         p+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915293; x=1746520093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU91rq6x6AMWRP8hSHtEK8HMpJbScePsSH9FDG38Qdo=;
        b=ZrVOmV/JwZA5pfuzQMCPaP2KqbXfI32Fur80lmMkk8397/nbEoTYiGefY9b/wA/4N9
         UlQ0RtYav2TxouHbOpSrlbKzc3MwUGeddMPmJ4QN8U+25xqaVinJy2hKiM9Q4feHQT7p
         PbTGDRtuowUq9DCaYWNHVFQFH9fxhOXUAkpxmVZM4SYoRDZZADebcwPOr3u2SpNkq+Bu
         m35Fr5b4oiAh4wQMlGaGbV1TcKxEvV0gMFqI/ZOunQqZC+fyWiP1bc2dY8Z7rY3y4XhD
         hADRCkkKSgvgNUYOdUGRXUsoO81MHnWcpaHH4CiCnxD7fjs55tabkR0WdV4Y5hpv8Roq
         CCEw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ow+4ajAS5X5AldMGDOSK4HpXhDiZMs1+VHJn5jw8dQIR2nlsS4fTNWXSkfiSftfBNYUEtdwH758s90Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJVir8T4tggrkwV+ZeKddMtg/vfbmQg6PY7zAlZMYc42Vempc1
	ybyyYf1LtMob3c2itV432w2bT8r6KOxBLGMCHtyfMH3p5Z5B3ZICwf8Oavq20OsByEpap9Zj4zN
	0iiulZX8Aw4GW8QbQ0Gi42NGN7dJxLwdyEdlthF2I/dcnH29/
X-Gm-Gg: ASbGncvu5Db2DJUYVSRV7eHaQNctKq3o6HdD4k9lphxs4dslZDKBRt8ukGP9lGGZeuE
	erc8AJS8vaRPtqgoG5eVcIk5810hNXcfIhJ24gqC5kt+rhnCZvRXyt2lBq1Q4iCNqZobE0m4EmA
	1EZ7W5J5oLstXH/6WDy9cDyg==
X-Google-Smtp-Source: AGHT+IH5LFe76433BEhCOsz93hsXmpw541f+gjc8j0FntokriJNT3ta3i7KCJ9pJ4v6e9KkWJAHiRLsRkg2/T2I0yMs=
X-Received: by 2002:a2e:a915:0:b0:30b:fc3a:5c49 with SMTP id
 38308e7fff4ca-31d45e2fefdmr6111831fa.9.1745915293027; Tue, 29 Apr 2025
 01:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-pinctrl_sm8750-v2-1-87d45dd3bd82@oss.qualcomm.com>
In-Reply-To: <20250429-pinctrl_sm8750-v2-1-87d45dd3bd82@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:28:01 +0200
X-Gm-Features: ATxdqUFs24UJ9rCBZu0rld2DCgQQfVXx4UwFsW9Kaw9n5MBKTnSUAjPVfLDjQgc
Message-ID: <CACRpkdbyZjfU3dh+3Cn+hDr6Pisf9iOQYuN=mAjrE=+OE0fs8A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Fix PINGROUP definition for sm8750
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Melody Olvera <melody.olvera@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 6:02=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
>
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
>
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

Patch applied for fixes.

Yours,
Linus Walleij
