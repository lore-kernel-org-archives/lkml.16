Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A96944E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738932373; cv=none; b=G3M/uqTxxZotRnMegCF6BfdSxkZ9NUJY/yvxxKzzL0SZoP7NN25keTWna8wr9kXpmWeDUR0PfvFXcKTvMyp+PUdaxW5vK8pfEwtI1o8GsUYpaL50ENnMleqkilZZWIub/UIMcebO3tfogaAgsctdXcMHldYh4GNtveLP3UWi6L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738932373; c=relaxed/simple;
	bh=fjwoDgTcd0sBN1WicHu/k9TRQMUS1W81Ig5M2xU9l7o=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Content-Type; b=jn+chQsNpyjbWnIL5xWDT0e13ZUKMP6RZv1esyA02xIwg9EuGxlXcKHe3Tgqn3TBO6OReHIgkCw9YdN3yH5XdpcGMFOyR9g2c/fVEy+The4f5XzKNhQm36QBcIeFQtEijHZBYwuz8YkCmhm0/MHwcwP0sS2988tnwXD1G3/iy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=fCFBhiQk; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="fCFBhiQk"
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 53A173FE64
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738932369;
	bh=2ZwUPJofjuVtYyvUvViroJ51go9pRIvg6aRbC/noSgE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Content-Type;
	b=fCFBhiQk+dHfmA7QV8FRDm0NxYcENWEy8owF+Qx3L97DxHt+ja3t0WLIrNqQAEVlR
	 9G36wUWbs/COxtP3On5TRLEQ+4UwjKtXWTVnMHc6L44Jyh+WmmSsFMZhy+k+1JXnKE
	 5YWzJvYv13uDqk6WqAPc+vt65QV7DXk5jl2/H41upg7JIKT+CsuzaL4aF3QNtSgY0f
	 LINK9TN+ScCIGBXh8egbIMYPBtmgt85V4+q4ty+7LIeOqw1IJTq96UoSaH6vKCpOuv
	 cQqGPY6JA+J+Rsz+CGhbGUy+/8A7gL4brhwQWjUzfHURe0rViivjauw1dHjpNjHDmv
	 6850BtUfNGtAg==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2b7f8307574so1986916fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 04:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738932368; x=1739537168;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZwUPJofjuVtYyvUvViroJ51go9pRIvg6aRbC/noSgE=;
        b=YMTmTCAx7PVim8cx+B1FzYAzja6lbrx8X1N63NwmyrKjHsq9/JOM88FPCGmeBPUIl5
         JNcywRqBrhK/0fXakVrA7sqeh9k7kDyc4QVg+3z9ga0SDVY4+h+60SIR8emrWFI5I5n7
         nVPy4PlfZQMu6nCq65Hz7hBzNxA4gGatRfdK7S+v/w+f6mCzwdSDizaXxVNv5PtNzgeK
         DE0D1R1x4m0lzpdyPuzDj1m4KJQq9Ya4akX9KK0HXecSJuq8Jt+dOw6Q3rwwS2kw7s6R
         zEPRYE6ghEsCuTtGxReN6C0fwKJUdg/QQk4gEOfogA7NVtBAFp4upAtRAXiQcxAhxAw+
         dgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY/CX6vSztx4oOFsLnXO83rZ09aYbfn5Ha+pKu7nVGd2jrGbM2wssRv3V5yVkabY0xLukJ0ADXJmg/m4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5zmJ9VRNK0d1wHXVzsUn99mty4/+1q6bIn95kf56eEG7uQDfb
	nINt/JDrACwUzaN9YyS7DuaAU67geTEcQwODCEuP9H91HB+I+9RBJprS/FC0tiamTStyKlYl/sl
	A2kIllEgHCIlZGLgRSOnUV60nuFrDTmhMgv88KvL/XkitMMXNSvVIMwM3N0QUzCip8dpxHr5B13
	M0i6fx1q1NphRajEZoFwoeu+jj6MoXvO5GqkCgOj+PAo6rFKm68fmG
X-Gm-Gg: ASbGnctA/uII2s+LzEv2UGZvxU6WQpJIhYTdXhNWO3Il1W9TE7qlVZ5dJIQs4qjUVLN
	aCxnZVXKD7qC+cmyXEqFx0CG8pvsqEXbe3ZkUgg8gr5bNwB5jkSWeJIuV6LqPZg==
X-Received: by 2002:a05:6870:c4f:b0:29e:354e:5fdb with SMTP id 586e51a60fabf-2b83ef92ce2mr1639813fac.37.1738932368242;
        Fri, 07 Feb 2025 04:46:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8717iINw6GQLmXUMzAsQEraXJmnomHeDq/9rOE8N8dSrNmc1FXULqlUBnU6Vyo0eCApuqsrLIMq5Hi2dty7Y=
X-Received: by 2002:a05:6870:c4f:b0:29e:354e:5fdb with SMTP id
 586e51a60fabf-2b83ef92ce2mr1639799fac.37.1738932368012; Fri, 07 Feb 2025
 04:46:08 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 04:46:07 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Feb 2025 04:46:07 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <TYCPR01MB8437F6FCD14E116B6CBBA09098F72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
References: <TYCPR01MB8437F6FCD14E116B6CBBA09098F72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 7 Feb 2025 04:46:07 -0800
X-Gm-Features: AWEUYZmHbacGaT6tTq_P7xegNAmTpSpPwRhBA5Opynsjcw0ztqQPHtv9Yj0u9dM
Message-ID: <CAJM55Z_zuaXSchVFwdiCzJJ3j2fHKg-w6j4GP+sqKB3AgvipxQ@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: Unify regulator naming scheme
To: Shengyu Qu <wiagn233@outlook.com>, conor@kernel.org, kernel@esmil.dk, 
	robh@kernel.org, krzk+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Shengyu Qu wrote:
> Currently, there are 3 regulators defined in JH7110's common device tree,
> but regulator names are mixed with "-" and "_". So unify them to "_",
> which is more often to be seen in other dts files.
>
> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>

Thanks!

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 48fb5091b8176..dd2eefc295e5c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -233,7 +233,7 @@ vdd_cpu: dcdc2 {
>  				regulator-always-on;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1540000>;
> -				regulator-name = "vdd-cpu";
> +				regulator-name = "vdd_cpu";
>  			};
>
>  			emmc_vdd: aldo4 {
> --
> 2.48.1
>
