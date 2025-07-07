Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EA3293C48;
	Mon,  7 Jul 2025 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881944; cv=none; b=DKRzEGUHHDSOzH0avwPJRweNKf+I46MsmXdnwUKGuxhzfauYxd+IceLc56DishFomHNjEzVD3CS36+PfGKaHKd+vcKnw9UXAyoOhxqxl/mdMQwTNRkc0TOUvIK+Ej9OzBnesuZ3zLaOlkYjVf1a3kkuBJtAUSasTWbbEGg466rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881944; c=relaxed/simple;
	bh=g7c3NUc4IT5dshb3pb/tBZWnh6ur52gnuT95JaH4Vpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hyi2eNVs/1CFyTz6Ws5AkKp5R1n2bf0v2pWMbg/XfGsPyHaSsFMFVlmuezfJig7smCIq3bFGxqcBhF83x7y4KO/pD0EgMQqZ3bl94MdurEvCbQBg5N7tBuwk1gVWp7xB3oaw2yYbuATG0MaiXm08pUpCrvG+sFokRktdVkqeI40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJsxJKb2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJsxJKb2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1707458f8f.3;
        Mon, 07 Jul 2025 02:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751881941; x=1752486741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXqFqGPfF+AW+wteaTEiwFi6gfdID37R12FXEDON8Cg=;
        b=mJsxJKb2/9Cq4+a0XgSR7EaclP+vX53o7q1EWgjst9SvWvOYeCksNnmMuLGwPIMGd0
         vSLDR9xsoVA6cHrnrQozBwZBv0Yn9rWEu5rLubl2HTq1QFdmzfl9FTJuGPeoMs5MJkWB
         uEgr+PCGenI9O0odmpmmyF5Gn/v+i6L/kItIVnSJ/fbyUnp7dhBOcQJn8IoYlPyGn0Oy
         at45xiCrdhaSO1jy0Va4CW3EJcqkE0q3CjsqpI70hrbcCt8iGbi4mxAQUEcEPRaUbrIJ
         YJW00Bj4R0DqI5DbzhnFC8NIdPF5uF2Y2tQKLeOv3h4tDKNcrRbvKtpkdNeMrdAedn1G
         9IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881941; x=1752486741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXqFqGPfF+AW+wteaTEiwFi6gfdID37R12FXEDON8Cg=;
        b=W13RmxeubQSs/u1UubzyAhPrjmQUiAUvI6kSTj5C4wCaRQHB8egM6Rhd9DI/266dQe
         Ev5uZF9AFJ72cy2Gt6E+f6xoNqFDWBXI48mnzzDVIOQiejW7FUN75mA5usWySPlHLyXj
         l0R3+1pvYUWcDX8roZ4fgJlwTDbfGrYmCw81q57hlZzei5Sr/43x8K6zlGOQ4nmD0W0M
         sDEsTiXBe2egNqTDjD2/h6M+ngj4zCEZjZN54+Aoq7iBYqjurHIB1RS5gxd5P9LDFDkT
         AwXZN5JBi+VU04lMyO/xYetDEzYanrU383Vw7WdsF0wQpcNFw1EZqbHnlMxRZofOtozi
         XALQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZO8smzU0z0H6pY7rWx19w1pU9SdAbZ6aJQn0l5VhmO3wimeZ5KKV9rxCqzrs69/xhfN5cCR2g96USDDqm@vger.kernel.org, AJvYcCWHqHZfDA782r8J1wcA/AV1rMY2Xl3zIyGZRSdRH8I+AXD/PJJQdjx8I+Ski9vbzLu+7PR1u6M+J2ax@vger.kernel.org
X-Gm-Message-State: AOJu0YySQZcFO6WJ6vg/D5JWhdHCmeVcc10SucAB6AoApn6P0gV8qfQS
	4FbSuOloEc9ImaA2EeaKlMyjCKIhNc6Ge7hVjxjHWn2KlIY1o1jD6L505w3tFyX7FoqnaUeVkx1
	iziBA0/dr3/QO2UB7VBu+RtQqcZ3zE5o=
X-Gm-Gg: ASbGncujvhREo+EnsGUtS150kVm3oy0OTIf3rPiQ1eBVnsbmCaVOiP2A93uE6WgQhmf
	L5rlaNfNqoY71aAeR1iRCL3/9t3ShFuHUetpqXAqhZlI/lbqBzuYuo5o+wzr/0ouSrvBRVB2q+s
	Nx5hdcgxx8IxjjIW3YQ+ahzEuQrFW4SIZKQtt4R9quoD/7Sw==
X-Google-Smtp-Source: AGHT+IGCWmZhb0r9sYITwhkx4phvDYGw0yLaPOftSXO4F/VMYxZRVNmoGGfSVxUPKVSCtCXeM9hZJCmRyjyHgQZxDpM=
X-Received: by 2002:a05:6000:208a:b0:3a5:2698:f65d with SMTP id
 ffacd0b85a97d-3b4964dedf7mr8113866f8f.27.1751881940919; Mon, 07 Jul 2025
 02:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704081451.2011407-1-ben717@andestech.com> <20250704081451.2011407-4-ben717@andestech.com>
In-Reply-To: <20250704081451.2011407-4-ben717@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Jul 2025 10:51:53 +0100
X-Gm-Features: Ac12FXzomKy393V9aXimk4vifIzB-hw8ENrGJMrYh6XFujGnzhanbBX2A8ZFbvk
Message-ID: <CA+V-a8tdtRNh6WMV7RUyr4h99o3OqOU1HnajU0t4i7GHFKykTA@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: interrupt-controller: add Andes QiLai PLIC
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: arnd@arndb.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	soc@lists.linux.dev, tim609@andestech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:02=E2=80=AFAM Ben Zong-You Xie <ben717@andestech.=
com> wrote:
>
> Add a new compatible string for Andes QiLai PLIC.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index ffc4768bad06..5b827bc24301 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -53,6 +53,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - andestech,qilai-plic
>                - renesas,r9a07g043-plic
>            - const: andestech,nceplic100
>        - items:
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
