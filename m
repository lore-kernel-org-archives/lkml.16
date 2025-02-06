Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FAA224B05
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830980; cv=none; b=IJHHifCL9eXfQ259Y2MyXIAwup0/aT94XNKyw6ySVNrl0C313irCdqjJ221p0Q20PoKkJnSKNRsFk/ZPN0yshBhLNP8DlG6iID7CK2uqhyMOSIUsy+N7ozUXEjCfQYAbbyTWpLCjXftWAMM1aZGP7yvJMdG9haQvnaSTGKXxwv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830980; c=relaxed/simple;
	bh=qFyDcHuolhwabbk+3u+V0yf8GLJ1OA3CKQqwTgd2ZhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=saJNKbhjOv76z9t+v1ZwrLAo/4jfApi0e1cDi41nnZsZHEB5k50VF3MWpLcG8Sa2IP+1aX39dmqyCIjUXGecIqaY7odoRQvhqTQyZYXErd+rib/pem52Ke1ePp93fbTSkheH99O1fiTR3112yYfwZpAEI51tN7u/FwmzUNzGSR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ESxHOkSG; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESxHOkSG"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30737db1ab1so5253641fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738830977; x=1739435777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFyDcHuolhwabbk+3u+V0yf8GLJ1OA3CKQqwTgd2ZhY=;
        b=ESxHOkSGySg5sK09YWrv5F0oKSehfafxzb4DFzMYWEdyaO2bGzoF2PJtht7rE31Nrx
         k4FLpro3aamDq1NX+yykrdx3T+BIlhXev28062M7lSBNWbi+UOqKCgSDN8LO3Ub88aOB
         0z4Bw4iHsBIBF6CCjr0dCpXufFG5rq+ilrHGdgznmsnsHEdaw/VHB2lCx0uWwCGSc58R
         s/ea9hmGs5STlH1RhiePofMTb1m/hJUV1AGyw8nv2KPYBferksmgqJeCxOM7cKHz5BJj
         qLKv+F/cW6UEuBtfEkM0XKGkbCnMfwPQB80rmmOMSaGFinIFYinQXse9b5WqrsEKCD4R
         ALow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830977; x=1739435777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFyDcHuolhwabbk+3u+V0yf8GLJ1OA3CKQqwTgd2ZhY=;
        b=m33msloPWpz1bP79iH0qc9Oy1UFWlay5AgLtQhhWw2MaDjUdQRate6nVwdQs9dq88W
         J0jFr1uBpU6FMasP/T4azAm0SCSIPckS/unjjPihshRtQn/inlGUgnc01UY18RoGfdR4
         L2BO4XbVxZ58ENQaw3muWWiXYOGPHQ0bBJwwCkiI1NJSjdvghKCYsJgfxVSz+hanfQhP
         f9Udsc9B5+dg0+etAkhgFDUMxMmVVnGjcf19eWoFul6ZteMsCpVhH7uEtIs/aOd/Tt8d
         7+UjOrv/1RBweh+g7M7d1md0KSmweHoMfXaGF/z3fE4hf3s1aQ9R13yNlBKI0Io4LaaU
         tCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPWUwiP5pied7GcLHySpTVgrLvd4AaK31mE4MUkthvvAmuFScKMb698kpg4YqvIvssHv8e5bHO4ztREJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJsqjx81tQhllNtc/hPd2sPxJgX4N/gIUv83/ICtn03Oldb/wy
	dELUM8OldSD2/eFTcBFNg9VnXdq+MOQd45RAShgyGV2GyBfSQh4KaVqWdsxy2rPX9mmBKOZCX6Y
	Beq7xvLbcKryY7cBMezTVwTkLraqKx6zQ2CSQxQ==
X-Gm-Gg: ASbGncvvvXhk34yjwGi7QQqqNS36RlC9Xd5DQdZ/yNkiYZ4cVvfMIV9LzxUaa5BwoKJ
	qDsiDKIL/faHWTruh2WFJv1R4OmFZ0RuBxA4tR99hSj8/2Zkrc7++xP45TwabGskuMdPxBRk=
X-Google-Smtp-Source: AGHT+IGqiKXm4L+YeLeVQFHSImQCXh+mD3hItVntIkXUihVI1KeHuhPJBTqcl5axbPLpaaqFc/QuLj084XF3Ho3zDXk=
X-Received: by 2002:a2e:a909:0:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-307cf314370mr25665811fa.17.1738830976947; Thu, 06 Feb 2025
 00:36:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118031334.243324-1-yuehaibing@huawei.com>
In-Reply-To: <20250118031334.243324-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 09:36:06 +0100
X-Gm-Features: AWEUYZkX2cnuZf9rPQW-0wMag-z22j76Wt6UnyFkyZ9657h7xwcCtMF7wIeVba8
Message-ID: <CACRpkdbDXYRi-CvWGU-3y3mrVLSTj6EBUtya8X=eruaLBydyYA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: nuvoton: npcm8xx: Fix error handling in npcm8xx_gpio_fw()
To: Yue Haibing <yuehaibing@huawei.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 4:00=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:

> fwnode_irq_get() was changed to not return 0, fix this by checking
> for negative error, also update the error log.
>
> Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driv=
er")
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Patch applied!

Yours
Linus Walleij
