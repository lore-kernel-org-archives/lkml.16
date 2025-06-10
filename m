Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439DF28E598
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557465; cv=none; b=PggNvv+ZbJJ5Rzl4x5EExVeeW8iY8W2KYkHQMC4Z+vBaQcKVP1YgmV6MB6dNs8sYwUi+EDFxNPRq3IVF59anbj3LWlg2ivkd40k3U2fdPzrRfnQ0K6EzOmmKF7bNCaP9j6O4lUtC8BDHTbYQnpgpy+vOHIkc0rWEJ3e8/GrXAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557465; c=relaxed/simple;
	bh=w1Llf8EPf4z/jroevvo0GVj85/0YAeGUzCIO2oQllTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5itWJShCPWVM+4Y+elpxM5fCwumhbdAYnt9PBhV9JMSetXGJtgxyc2RiN/OSzYFLfL8KOFAm6IwFO+//4B8oQN35Vs5spiZDAQIAm8SecOzEIVKliEsoL6VQC1QC97Y/OglyMbzQnzyWfiSZO0g0l/vh6HWGlRLKm7igBi2Eh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qA8OmISY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qA8OmISY"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55324062ea8so6987429e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557461; x=1750162261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NOuROJ72i5jBg6IZns7LWWw5bhW6PqP3nknc7q7Xb8=;
        b=qA8OmISYZhD/wD1r/7m77r5nkiZ/yepSu9M5PJdeI9QrKdqG8tEQZ5BcsjBUG9tR81
         kSHNoTSv6spY1XVsW9DWqY+dPCXr9VoU/LjX+j1C/FJitrrXQV7knzlax8BgzBTyuhZX
         skN5lUtVejn8o7EivsOyHszssiMwLoR/Boa1jjFEFKUv/v3tuKt72G0XPgJCrL8WQom8
         kM385dG5eBrRutefcIqQErfVaIINiU3km47wtKBa5as4jnf2QeSyUnobJjbaVxlFGI17
         NvRdlQg7pgULbdfdpQiMQpL/Qn49as9atSpRnus+dDjkVr8Jez6a4gdq76D6lVEBmlb2
         cSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557461; x=1750162261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NOuROJ72i5jBg6IZns7LWWw5bhW6PqP3nknc7q7Xb8=;
        b=iA0W9Lsh0wL8cwXhxrT2uLxOIHrQK/VEGV1RrbaayvnTQEKXf9RWxjj2USz923p1nw
         StflWy/pSQ0pqUxJzVNqM7fD3CVXcGsrVkBOWeTeJ/e1hyjJWvBpmvIKKF1raKotLGZa
         w9RUlsnx4xvT6Ok4Pi906JoMNg3R9W2BJ+5JXz5Lw6ab8Rtc3RjjBjGEEcYbt1PB8XTH
         /X4jhYAKvvjOCElSWwTGHxNNBWbuliiSntkvH12Zo01b8uQxh+5fMvUoJgGq0mgKeme9
         R+MPMLjUeVncWBw6Vum3GPAVeMO160I9enC++Bu4Pg71iI+ywsH4uuX1z0abmlK4pMIu
         CIKg==
X-Forwarded-Encrypted: i=1; AJvYcCWbIrfYiHHWrG/iuYj96oQl2Wto6KtzoyCVkdWBV1TzwP/K31QrkpSkT74Nx1uBwwqz6i1aO8v0JzJ2/MU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPzE+Zt6UuXIW7A0q6icBAQaZe3itcoowMyNefPGdTLKgWr0sS
	OYTImlwUi7lStOmLD0FF3nEPc8hwlWy/CdgEDh0pdVgMXmJxmWBzo0nng5sb8voKJyPLsmlgDH+
	1Cx0qiVZkdl7YCgQ4lj92jYLJoVResmLvB5jyVty68P5h1cIaAGwo
X-Gm-Gg: ASbGncsocWCP1JwTDdl/mscWlDXFrzY12ihjaYLxly7N472LYgoEwZNj+/WrQYdbtxF
	QZ9uRFIG/kdt5EoAfY09dsBlUbdM6V+mvPKgAU4LKbZijpLYsAOdjRpCnme1RFc4OyC15+g7Tia
	7QTvJ2TCRn+S1NH0c+11yvzkn7qzC/JTIjKZVe9+jPXp4=
X-Google-Smtp-Source: AGHT+IFOaMh8nguz7KHH0YUJYEvUW0KxuIsZirmTBD11BY3isr05ce1T1ObffoEpspV/AnboQI2h1yWBLpHu5xR5+Ac=
X-Received: by 2002:a05:651c:1545:b0:32a:8bb1:d971 with SMTP id
 38308e7fff4ca-32adfc290f3mr40168071fa.18.1749557461281; Tue, 10 Jun 2025
 05:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:10:49 +0200
X-Gm-Features: AX0GCFsNvqdvdVYFA3r4z4h1YT4-Cj2REHImr1bxE1u6VG-oVRcj138Ag5WMjho
Message-ID: <CACRpkdacp1YVjrjfGvHu_8Y2hq03LNwG8Yka30xMbTEwtQ_drA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add support for Amlogic S7/S7D/S6 pinctrl
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 7:23=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> Xianwei Zhao (6):
>       dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for =
S7/S7D/S6
>       pinctrl: meson: a4: remove special data processing
>       pinctrl: meson: support amlogic S6/S7/S7D SoC

I have applied these three to the pin control tree for v6.17.

>       dts: arm64: amlogic: add S7 pinctrl node
>       dts: arm64: amlogic: add S7D pinctrl node
>       dts: arm64: amlogic: add S6 pinctrl node

Please funnel these through the SoC tree!

Yours,
Linus Walleij
