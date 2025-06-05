Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C442356B8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130157; cv=none; b=Y4LeAECf00+tVAj4eLh0ayqv+ju1L/IEJaalNy+DhNIHP9CPkA8vlAC3l9WtMRGI/x/025crEmYmGohtKzA/AMcf0eQNYZnH4kjL0O00Nbzp2qCV3s4Ec1RaoiljH2MOOQCIV3dckSNhqghpoXGH/qdF+XjYLftwh4buLBL8kPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130157; c=relaxed/simple;
	bh=h/yqq5HFi78JCobXR8PcMZdAb80vQUDHwHsEUDOOT5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGW3hvLJ2nCunrS9POva2+EkHerqRIElrT7zjItspw9lZ3O33K/mb9qkCuDwq+hdd99NSKlJwaateqxzU59OPmHl+I7lHRMHOJAC0ycAty1EJKPS60R4hc+ZiHHkjgxGgnwAhL60rPxshPcah295mXdeRI+l7s55/I7Hfyehjx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRvrueY8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRvrueY8"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55220699ba8so1174902e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130154; x=1749734954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GUAkxOIFy9jpQLSmntQ+q8BrdugRJdUj6yz2GA9p8E=;
        b=VRvrueY81niv9A4KBpHJnqMYu/vk2w7Z1qxHgvP75rDkVvY1kXuf7AYy5nJ3f54D/y
         E7SMk6+kJ+lZQCz890DmNxVcoCleXmk2BFMeuJLfVTss2lUsYv9E4Uet4wClzb5rCIp/
         xxmiBRcnezswDdLmlXrMyNXVMEk9M8AJCDxbmxiN2TIUC9UfL7DG47O57CKA5yWwPqFm
         aH8svGBXySxBVolzWOCPoJ+VoqXcvznCN/7u/QscIVL0HxMW17OHDHeh8zDmqGrHZeNi
         ThRtD4DCIrZlxjzWqa9CNKS+f4Wq3BvNPctqd2bM6qgRDWS4nlQtjnjynFGQRQJh6ctY
         fSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130154; x=1749734954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GUAkxOIFy9jpQLSmntQ+q8BrdugRJdUj6yz2GA9p8E=;
        b=snQ7sQzltFqWFeFq88Xi46b/xJ4j313BeIjnDXC0kAGuI3uQT3uha2MwlRFYtGAat5
         ncRJF7Va2wM0HM8DxOBW/ZNaOVlqARn1Iwucz9OyBIpVyoHvAnUA3y/4XGj5yH0Rahbt
         gQmbtb7421GaIjJZ0Zj9gvb062P38oaETGcl+5Amfc5ao8Ix52xFkyutMGOUv1YCy5af
         FjeToa/bYb09WHTdsq1Q5ZwQ42q6ZZxFo2rFaluoqtnuPeBX6g/gufeRmi3tBaBC5qQK
         n0KFzVs5Wk8uauGKdkKurIwx7mi0xn6S6B2hk3IpkbIED0q1XqswJrdY8AeBwEm2S1cT
         zgSw==
X-Forwarded-Encrypted: i=1; AJvYcCWwKrieaa8pEUp257sTPVPqAsh1o3xk4bhnAUhjL0HCPlURpLs/Gdz08SJ7UViFfT7iMQgAi2wNT1d0K5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgLsaXlhFLU/ZnMP/OUaTdLdMI9uYVrV4hBDOX6RdyAsrE80iO
	PA9PmLSGMkdczB7XF+Rrd6KU5dfAA+dV56sLLo35xv0/eZ5P/JpcVw0P7IDeUJzG90uwsPuvgtq
	z/Bgwk7VCD4pvRQjaoMv/meOlnLG93wDjyjnK+OM9Ug==
X-Gm-Gg: ASbGncs9g6nUSIA72JYVg9uhoim+wq2KCvWxn+3vWGR/SV1geOhPd6wKJUzY4aHmcRv
	jQrNe6wITI19E+6t1fGp3NhiiSwCKKlgq+HeEvzyeDODms9323me6Z/OFCwfqp6tBQxYnnJDwgi
	Sq9t8Pc0jezNEkBYJ2utIduz2aKLnEzhEA
X-Google-Smtp-Source: AGHT+IHQ5la5bmYfspb0z+rHTezHnXmn8S0sJvRzX+sgZ7IiaN7ipgyy98pOXOBzrw28bsqpF2v0lH7bNQ0EOyTmIHU=
X-Received: by 2002:a05:6512:3ca8:b0:553:2a56:2e8d with SMTP id
 2adb3069b0e04-55356df1dd7mr2038017e87.40.1749130153902; Thu, 05 Jun 2025
 06:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com> <20250602-rk3576-pwm-v2-1-a6434b0ce60c@collabora.com>
In-Reply-To: <20250602-rk3576-pwm-v2-1-a6434b0ce60c@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:29:03 +0200
X-Gm-Features: AX0GCFv01J_2f7I-yQlAWEluILmgAXhjV0w8aFTFPw9c58Y0wmETNUPszWxuq5c
Message-ID: <CACRpkdZRjLFa3Bni=wMG1LBoWnW+Zenj2FVP=_2s+U_1eykt7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: rockchip: increase max
 amount of device functions
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Kever Yang <kever.yang@rock-chips.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, kernel@collabora.com, 
	Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 6:20=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:

> With the introduction of the RK3576, the maximum device function ID used
> increased to 14, as anyone can easily verify for themselves with:
>
>   rg -g '*-pinctrl.dtsi' '<\d+\s+RK_P..\s+(?<func>\d+)\s.*>;$' --trim \
>   -NI -r '$func' arch/arm64/boot/dts/rockchip/ | sort -g | uniq
>
> Unfortunately, this wasn't caught by dt-validate as those pins are
> omit-if-no-ref and we had no reference to them in any tree so far.
>
> Once again kick the can down the road by increasing the limit to 14.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Is this something I can just apply?

Yours,
Linus Walleij
