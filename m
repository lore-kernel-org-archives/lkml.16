Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826CF296168
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792997; cv=none; b=VRaKpQz7Lvv814gch5wuFohYg9kywMVG8RhXQnwBS4xDje4UTI5euJFeibw3/j7mmoondmNz9xc+W3D4Tmz7rwdGibVk/lDXOmI6ABAyhwOJLmCMqQ1UT/JWqOzUSwfqPNZDQkQIPIi7muhS0G8a41SB7D29RlmV/ATCpPNc2Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792997; c=relaxed/simple;
	bh=CP3899a1XZQx0Jl/TmHHHzTMQ4Rf10RcrAJf2x/y+74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObjmFIJQJYWwblkEmJCY+LtlRTNGrGc2fhItmn/kel/EX9DxQHmtvPumrEd5dDe5NQHAlTSrFRaPq9TFtLJEsnEe21Fb7N6IoSFgkcKsx/vZ8MPkduYuCW331beSZTwNW+/UMYysDUxUljRBzm5ARfI7XQAr9n1G7sTlcsREeNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOnyHgEK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOnyHgEK"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b16a0e38so876202e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792994; x=1751397794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/UFxAiIcZi1dPs8TYtrtg7zmzlP4h3MZPtKJSw+Yfw=;
        b=xOnyHgEKYMkkraMODI4HPTHED2Ywn3U1+Xnd1tOY4obWFmWMkQxC4qr5YwvFVllDHc
         rNb8hWrKfDWZaW+Y6m5xcoHEUJlpHPdnUa24KvFW3zvPXvcMSum6m9nToZvWAZgUUhRq
         8u6dLWHumIULuG+X7aiO1kYve7WoFr/iCS7xOIZapF/oexDUU651rIvEhNj+w5q/2s2j
         uPYlhVZ+gBnKXKxgPbyqmhN9iiPNAx8WrSr7A8VcTd4FYFSSmfxQu07+quXRV03RWYJS
         0sEq3Xfx+sOFEsw769vaZr/FUpYctOMMZjx4W1hO5je8dHYLJij0gdWEmEdPdWOSlFKl
         Sr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792994; x=1751397794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/UFxAiIcZi1dPs8TYtrtg7zmzlP4h3MZPtKJSw+Yfw=;
        b=PaRPQ7MvpTNoI8l63uZez4M+dWgcKb6rORVGIudEl3peNQ9Nd4CMFa3e8naH+S7z9x
         0SHMpwvgX5mO7C1wuRl6PXBxBfrbZ6QDcxLU0aza/edRRMfozqUpQk+sMYDxZfETXVcA
         vd4FLcV0rBvWZdTC/lnCVwTq6tMmfOPNXngDv3XhkFc7g6mZN5JVgvOebvEy0winlJPB
         YXc1NXwE0S69qADrAZlr/0d286a8qNaOFG7FG7KLHfBESU68hLhGbTl6xHRZXZot41AL
         BTZOXdXIWDawGjpkX4l4w606QoT/tZuqHwdv8rQE2fblUzwBN1DNU+HAtOJ/I9dmwJ25
         yong==
X-Forwarded-Encrypted: i=1; AJvYcCXHlU9zPuYdp4+iCpUvTcoSJmStI4EhnjIVX84yj94Iem8G0TJ+lTVJjmyK5ea4pFah8DQqnz2aZvT/n1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MS0a3dL8QecIvendPNaimnnhg3vHZxP7IoBQ7USfFuS1c5yx
	Kt8mGkCtlzmMuXCF9DYPHQ/usF+2yDM6FmA5FhsQTpKT1JDp+FwZOoGvEWIzP68wOAQ3FXQHWlW
	zCCWlQH2y1QuBDXm4o966ClqiHzmF1DwmR5h7lgc1qA==
X-Gm-Gg: ASbGncux8db99BpnDGpWPdLqQOddOye/kL+hOGWe4woTvbyyqFGooRWdpKG9dOg9/uz
	M+WV9QeH+1U6brwckvEN4hHYVWB69GqtZo2qnV60Bpooto9X/AqyvPFIemePwqTvsCaC6tXGPxu
	CgxqFOswhUfR65Px+c6ghkZhHJ2CkCxOLNRjZgJrczPIk=
X-Google-Smtp-Source: AGHT+IEQrGGsyqnVuCXY2SAMp6l3KCGBrmui26MSLy3zJArRILHjzRl76wsp0MjlRIxxxv33y62YI2I+Vs3QmNkcSI8=
X-Received: by 2002:ac2:4bd1:0:b0:553:202e:a405 with SMTP id
 2adb3069b0e04-554fdc6c2c0mr39915e87.0.1750792993704; Tue, 24 Jun 2025
 12:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620130814.2580678-1-arnd@kernel.org>
In-Reply-To: <20250620130814.2580678-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:23:02 +0200
X-Gm-Features: AX0GCFsBvVRaa1Qq7VqTxo7DhnDvZDOO4w1pWejWErZyay2NZMLpK6_RMnT6isw
Message-ID: <CACRpkdbkqgad8emWwRJo8kAwLoA93=rp6RZKFds77tkeSpWc5g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: zynq: add CONFIG_OF dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Pratap Nirujogi <pratap.nirujogi@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:08=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The zynq driver can be enabled for compile-testing on builds without
> CONFIG_OF, leading to a link error:
>
> ld.lld-21: error: undefined symbol: pinconf_generic_dt_node_to_map
>  referenced by pinconf-generic.h:231 (/home/arnd/arm-soc/include/linux/pi=
nctrl/pinconf-generic.h:231)
>           drivers/pinctrl/pinctrl-zynq.o:(pinconf_generic_dt_node_to_map_=
all) in archive vmlinux.a
>
> Prevent this with the proper compile time dependency.
>
> Fixes: 1982621decaf ("pinctrl: Allow compile testing for K210, TB10X and =
ZYNQ")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij
