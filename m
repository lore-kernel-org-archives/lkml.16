Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F9E19D092;
	Wed,  7 May 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632747; cv=none; b=UN73I/DhIsEUaE5ux32PsIRT0q3pS9w7939AFZtg/wm6dYj58Y7Ss90/YIBLzYIw3PL6lIkjfrKNSSC43muOhjZ+0A8dKRPTORoKbhKrdffrf1rNbyd8MdIchGy/RtBrTwv83LfiaODLJ+C7njLGCQhYgOOEVrpd4gG47F6yYHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632747; c=relaxed/simple;
	bh=snxIgqDfv9AzTPRASeTgnmdONS2s/uweYA4rLFpghpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9mtRYxpTenpQwfV0Ogbye9XTN9nmkunHLzenGhp6gCL2OW6ACUA7rlc6LJIfSLAUfxAuJy4aC4G+NHpC1/LCQaE/iwDN+Ods2vE2yNcq84e0TxX4SKoNVnRwJeRnfYVzs5vY1LOCuCIkkX5K7x08OOvRF7LfFWFSFYui8/rtW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54e7967cf67so5370e87.0;
        Wed, 07 May 2025 08:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632743; x=1747237543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUchLAT2CvoC+0spmKn93ymH4pNN6dMT06ZJPIMdE5s=;
        b=w6HhOYKk+UN+FGVFpBVLFdHnvr4E+PmKQW0WIvRxTH7gYZ6dWPFhKPCnbHi0HJZWG1
         WJNg/zbHBybwbQU2XBS4BexI2SuZ1tjHzvFt4kt6TpCuPZalamaE2hL7xd+VCyzu2dCE
         F74EIykoGzxr0CGjqmqt2l356olnnI0Qm6zFg0snADx9TZHIYYed/ev39JnHpxZfOOKj
         CnKe32qbCiego6cWayp0JMIeWpT/MjxV7h/6f10NtFzKQDvniBCFRLdnZqTx6wbwFKIp
         cpxxtZ0Aca94BG8gfIZVD/SM1Zcq/ElTUpFEgCC2nM1QWdvJKgcfP2iiT+SaQZvR2yyZ
         rD3A==
X-Forwarded-Encrypted: i=1; AJvYcCW7XXwwSFcKTdcGCwTA8ZssqNZgLuu/SqhaswcYNBvyabTiz6bvP800gseLYoccf3ZJG3vzSJ/ha3RTtmRd@vger.kernel.org, AJvYcCXCKB1nprcaYcCx1+L5N1QByiiC7BlV6nu42z2N6zdscHRkjhhkjUSyZrI2zCJQEjiBqU4IygpIlPOM@vger.kernel.org
X-Gm-Message-State: AOJu0YwwcP3TuJuUjvCKdNZB4mdiZoiFBKUXVx+8xS+wRJ2uMnsZuF5A
	cbUYuwZesv3xtEstjLv6qqIia4rW55B6cxyZaPSmRjwYfLRALx0S96zwdEXU
X-Gm-Gg: ASbGncsmvJ2ZjKgZVZEezq/b9EaG53JGByzJzjWQQolwaGVbAipzzm06IkbZeo4OqZo
	7es9HwkY9OUOtYDrud8Gn/D1MhM2eyjaEau2Y+k6QTwDVmKTNJp6VhGQR5TWN1mtBDGqifteiJQ
	2Cv8rQlXSCuUmxztFUUALwxuwKE9uD3Y0IBR4QiUMIwaVcYCCdanrVFhu3ViidX+qZKHt2MNM+j
	g2uYKIa6ZVbqN91xczuwzFKUcJUwxSalQux5JhJTLfTBocCMx1Wo0BOfz8CHNDhG+Tru8bPY/o1
	hZsdXf2POgLP+9BZvhuXmX0+I18XinwiJC6wloPoiiwkmi1jf5VyHeAfbaN3hOObFSM9SQ6mtg=
	=
X-Google-Smtp-Source: AGHT+IGUtAzwPgtOkcNndnaFBO5XyKYfXW2FtKeY8TaXIyE0oH6rVJDuEkxV5qGfzK0WIzx5RS0izQ==
X-Received: by 2002:a05:6512:1195:b0:549:78bd:6b9f with SMTP id 2adb3069b0e04-54fb9296120mr1521118e87.30.1746632742577;
        Wed, 07 May 2025 08:45:42 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6d9dsm2354228e87.255.2025.05.07.08.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:45:41 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30f30200b51so72366081fa.3;
        Wed, 07 May 2025 08:45:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV49qSOADHb1U5Uk9f8RIfVLKRqDvJV1n1E8IjApCaCI1l4pvwmQIhSoEMKW4Kj9a88W5OumGex88j6TksZ@vger.kernel.org, AJvYcCXtVKLNnLsvgY+1AQE9QlAFz+oVVxZQigbhV7YVjFdnLV+73VA5G5yS4qR7Tzsa3/p/Cp+z+cqrWFBY@vger.kernel.org
X-Received: by 2002:a2e:ab1a:0:b0:308:eb58:6591 with SMTP id
 38308e7fff4ca-326ad33bc90mr16246971fa.25.1746632741134; Wed, 07 May 2025
 08:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506195524.601268-1-michael@fossekall.de>
In-Reply-To: <20250506195524.601268-1-michael@fossekall.de>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 8 May 2025 00:45:28 +0900
X-Gmail-Original-Message-ID: <CAGb2v671wD7y6n6n20BrhH-pcTGD8RzPp25gCWUtnFmRhh=naw@mail.gmail.com>
X-Gm-Features: ATxdqUGxuy4nk1up7F0wkRPqSR-2r-DSURGKLc-zVrNDcFGAmDsshfUtzZKSfic
Message-ID: <CAGb2v671wD7y6n6n20BrhH-pcTGD8RzPp25gCWUtnFmRhh=naw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bananapi: add support for PHY LEDs
To: Michael Klein <michael@fossekall.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 4:56=E2=80=AFAM Michael Klein <michael@fossekall.de>=
 wrote:
>
> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
> Add the corresponding nodes to the device tree.

I see from old emails that this was supposed to be updated? And if you
didn't, then his patch should be marked as a "RESEND", so tooling doesn't
get confused and ignore it.

I'll wait a couple days in case anyone else wants to take a look.

ChenYu

> Signed-off-by: Michael Klein <michael@fossekall.de>
> ---
>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/ar=
m/boot/dts/allwinner/sun7i-a20-bananapi.dts
> index 46ecf9db2324..d8b362c9661a 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> @@ -48,6 +48,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>
>  / {
>         model =3D "LeMaker Banana Pi";
> @@ -169,6 +170,32 @@ &ir0 {
>  &gmac_mdio {
>         phy1: ethernet-phy@1 {
>                 reg =3D <1>;
> +
> +               leds {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       led@0 {
> +                               reg =3D <0>;
> +                               color =3D <LED_COLOR_ID_GREEN>;
> +                               function =3D LED_FUNCTION_LAN;
> +                               linux,default-trigger =3D "netdev";
> +                       };
> +
> +                       led@1 {
> +                               reg =3D <1>;
> +                               color =3D <LED_COLOR_ID_AMBER>;
> +                               function =3D LED_FUNCTION_LAN;
> +                               linux,default-trigger =3D "netdev";
> +                       };
> +
> +                       led@2 {
> +                               reg =3D <2>;
> +                               color =3D <LED_COLOR_ID_BLUE>;
> +                               function =3D LED_FUNCTION_LAN;
> +                               linux,default-trigger =3D "netdev";
> +                       };
> +               };
>         };
>  };
>
> --
> 2.39.5
>
>
