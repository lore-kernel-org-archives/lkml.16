Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7D5253F20
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328956; cv=none; b=nExP6hVd2bDXi1sGOo6vgCbm2m3NhWH09FfGmnf9J+JAk3EuwC2muWssJUAN3viTiyJAYCIQRsx6lukUoAvcGSwWRJAHwEIrMKrRTLWOSNxjW6LoiZa6j58SLdUmHpwwci7YnfPlXdfgt6cJGAf19lm2BH7Le6Q0lSBoZ7zTPxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328956; c=relaxed/simple;
	bh=Z4ZyZX2UQL8KgyCkQWoLfIXDLEkXT0dEt8Xlszm0SQM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZ0CvnkP8xq+WJspxDtWv4wLHuNke3N+Na37n5chUJhOox/OQI9IsELh0Au72Mf1MaSNcGKOiAag2nKX/olJ6h7SXPZbhNJwILBbYbVgwA3ur7EODuI1CcdvYkhHJYPk907VpSd0gzdu2QzvzPNu0Sw9VSDjFRkH4j8dOVzAzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=L0tCFLJ2; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="L0tCFLJ2"
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 956B0497A9
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747328946;
	bh=EAHU3J18eD31/ymgQS39ucRDzPTjYOdwY+kBoX2CB8c=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=L0tCFLJ2xW6AJrOM0IUDvN9no0tqyGX1hi12PNoncmbvjKJs4feQ0o+PO6FtCGH2N
	 UYxANrNuprBJgH99/1B6BW73DT9BxkRABiTkK11Utir1oGUMwoRlI/AHnocKqyPNtD
	 vjCaks2f/a0dQlMHpYpqQKvgQtaORsflrlrrkdWCsGKb6BbcCE3AQgjx/QkpLEvqeD
	 ffpiX1PyC+33Wf1nGs6FtWvqBZdsJS+TEds5VF7MoRNEpqtN5Xes0RfCOR6By/t5jF
	 J3tmtTKwwFh/p6s0VftG0LyldC4vuggAcgTjfDiIO3/sN8MAXdym9ZLpfHbSaLfS6a
	 HZSC3b8dvcGdg==
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6061f07465fso655432eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747328944; x=1747933744;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAHU3J18eD31/ymgQS39ucRDzPTjYOdwY+kBoX2CB8c=;
        b=V0rcbbrv3r5Ew5TUr4DynLRkjMSCQG6GHfic45mo7r4Zft3X+bgAHsSKb2vZG7zDg2
         eFSL+KrT0penW8AodUJM5Ro7gfrqCIWjEW3p9E3J320NUtAeMeduE5tHB1QOBarPzNBu
         e2ywJ1ZsMkU+f65PeN3crcRpaHlLvEXAgk52YHC3+UeOZV10TvhrwO2Bfx0GQ6iYTnjh
         DAO33ad42az9erUAVkjtVI4m/ruTOisy3QBGqpOtkkAMaeenaP37pNmqchZAEoRDwygx
         0hHk77mloUXyq4PaSXk5P4uUjMkfp3aAqIrZuGer6qw7DqiKsR/ftsKgE5/G6arOvHoa
         KL+Q==
X-Gm-Message-State: AOJu0Yyqn/o+tULSjq9ZgbZuQeZWtykcyYuRHELh9rY6lWIAlVpz8jcr
	dteoWmPOIIYs1ds+UKxm2/ML/t40MyxHZmYFYB+GPbldek70k/VNrjZwOTXAeNydx58ygdR4NOe
	l2qMUhV23uI6QeYgXUo9KU08HEJaKhcLA2149HE1HJ86UygSa5EwGNrfdQo6R3cZ1nrSe04KB/P
	fWdugSzCISiualWIl6VEnQZhOWF5yrV6Jtg+FQ2tT8LQv0UfjMYuS/YQf1
X-Gm-Gg: ASbGncsauY7c10DVF9hjJQ/Hd3zEWsOjDsARllgqK8AG4TbZrZpS/6BPKNKumN8ft2s
	+i9s499OfhSpoFlEvYSoY9qJeLzeecCrccJV75FUg7BUpCUmh2RD62q8PQd/A0MttKjPzXg==
X-Received: by 2002:a05:6820:210d:b0:606:8579:4c5b with SMTP id 006d021491bc7-609f36bf4bamr161419eaf.1.1747328944561;
        Thu, 15 May 2025 10:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFLlaIpBSb50nrAEfKwrzW44A+wmRkrahI+IsmV1VZdoth2sU4ipKUE23o6HxNeOl35A87CWuYdetvBF/REIc=
X-Received: by 2002:a05:6820:210d:b0:606:8579:4c5b with SMTP id
 006d021491bc7-609f36bf4bamr161396eaf.1.1747328944263; Thu, 15 May 2025
 10:09:04 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:09:03 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:09:03 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250502103101.957016-2-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de> <20250502103101.957016-2-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:09:03 -0700
X-Gm-Features: AX0GCFs9vd2gnAh-5tFs89i_vEFOodBVMxQaK2XBrUlr3f41ZlKWfMl944u5vOQ
Message-ID: <CAJM55Z9g=YKZmdkq7BserR4hR-MxsvDLexUkf4u+L53m3vAtzA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] riscv: dts: starfive: jh7110-common: add CPU BUS
 PERH QSPI clocks to syscrg
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> Add syscrg clock assignments for CPU, BUS, PERH, and QSPI as required by
> boot loader before kernel.
>
> Signed-off-by: E Shattow <e@freeshell.de>

Thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c2f70f5e2918..f1489e9bb83e 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -353,9 +353,17 @@ &spi0 {
>  };
>
>  &syscrg {
> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
> +			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
>  			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> -	assigned-clock-rates = <500000000>, <1500000000>;
> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> +	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>, <1500000000>;
>  };
>
>  &sysgpio {
> --
> 2.49.0
>
