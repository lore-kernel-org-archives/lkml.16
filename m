Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B422A817
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750585; cv=none; b=kND8mK3M40nAn1eyjgBtsxbUaMkf5yXfu7aNCkAM0zCEvRMWYGQPx4tAZaCEkZ6aBNfHyXGvUgTX1L1rqRvL7lvXkhrFA1MeRUCUPOy4qSpHXC5GkjTXX/m0LWnxG3wdh1LFLH5B6f3LESQeNxAt9nRD9E1pF0E6HPLE2OVDq58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750585; c=relaxed/simple;
	bh=LrHrY9n2S9h3yUKire6ik9WE0kNm25rk74SGsY/v5BE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amDz+KRyYPUQPi8J0elcm3LAcvNGoRfz4/kU3XGaqci5hg1tVJK2M9pKbGkSQMSS6xECzfp7+4xvYMm/5ikRbkZKi7qxok3cT1Nf2WNUtL2bzyTwVw+TGg2OwKhcEnvTIlcElKeZpzrFHFXwl9iU8Z7uUli2eQ2AW8QphNt9MpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LSeUVzux; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LSeUVzux"
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5AFF23F682
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738750577;
	bh=Av5C3NG7n6JTUOYj8LuXVH2zlqsaee6hvA/xGrgK+Rg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=LSeUVzuxX5SYKPd78DDZTDR5Boe67EHhQpPXRsa9XSAR8Ohz98sEfrVT7As15n8lu
	 hA35gjSiNk4lAvoDVMO7QtSGfgjl1iPi8OmubZu74yjPmUxXbfI1hKuJtXURGYgB4Y
	 E1BKYoIl9b3praw246jksmGS1I6ux/FmcdJMxTuBAOuCIV5Kj54ydlaIpZbXBc9JAU
	 Muh3Stke7y7CpGknBhIQRcdlagXI+/tg5rr9dBPYw2DUi0mQVcVOVenVkaWuxCArx+
	 o4a+JoFmyS4JDPCltIosLBvZCxX0o4VIkExrKqx970X2DIK5AI8eCFj74lFXx/dhHI
	 6hVDR6iGG4b8w==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2ad8e353167so4220602fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750576; x=1739355376;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Av5C3NG7n6JTUOYj8LuXVH2zlqsaee6hvA/xGrgK+Rg=;
        b=PoczcvtDT2buZjFFFjv3KGNr9DJb2SzhDPCE6dNFwj20cxl3fz1wX3XbJejSyCDDOn
         18suyqskJYi9FIoF6Y6yaRsjxKFOf/iYLYTdb2TLJ3BGHMc3xMsw6gCkXY6CzK55x0rl
         ub3USxn9bIPNURhMyMPt3f5T8ZxVIso8C1syuzE0FrRx/SuOGcDsrh+eqKSqb4vwuxN9
         VaBQwRE2LEz7NiHddKEpJxRTC45lW9JFVn8x6zf92YEDptsehtDFpOnzYt+ApYuZysmk
         kO4CX2EUWlC66HBB8Ga6b+HmavZH5/mUoX4AjnVPcWr2a0E9/gZZWfgHWOzqy9+SCSrK
         VZQg==
X-Gm-Message-State: AOJu0YypCTSgohbZSj4mrfH26ZGDSq2+uIikKMp2G9kMji0RnmI9T1I1
	f4cFtiCsDFcouBJ0Xba4lYNyN72KhnwXfuPlj+dzLfbsV26l7dE5dhUrZKIG28F5Dky+Q6uFQcx
	Ca2zkDfZN0BZrt8NcIpp8gLWuTuPYy92QI0gBklVpN7NX5ue14u7h/VzFgIai2VBeWWgkLn3PPb
	riH1NrJpCD2bSITHySdQE4J6/JdyLBQjewB8wR/+dENPN63xJ6xuqb
X-Gm-Gg: ASbGncv+Aqg8rsyIHPwsFg0uF/48BFs4Oc7sSw8MO1Rho3u+me0bSVAXW5PYAQG/LcA
	Y3/tlEAPcy2PzR2DVdoF1840X7gaNNXfhGAbGKLaOBMbkaWhxW4a+rtSvEnynHO330zqQD+Qm06
	07EJagRECOfv1fgiE=
X-Received: by 2002:a05:6871:36c4:b0:29e:4a13:603f with SMTP id 586e51a60fabf-2b804ecdf7bmr1499788fac.4.1738750576036;
        Wed, 05 Feb 2025 02:16:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsJQ7P73/5n5tnAPQgpI0ua/1rwM5j7fLIXzbO141ngEH/FiC2y/KSAGjHe9WOZwY5cCBqXocuueLiB5hV4nY=
X-Received: by 2002:a05:6871:36c4:b0:29e:4a13:603f with SMTP id
 586e51a60fabf-2b804ecdf7bmr1499777fac.4.1738750575796; Wed, 05 Feb 2025
 02:16:15 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:16:15 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:16:15 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-2-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-2-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 02:16:15 -0800
X-Gm-Features: AWEUYZlJTl1Ykr0gfo45PSvnnmc9ItZ-0-EmoaBAoCqlMDbSjYPKQi0nAWkDg2Q
Message-ID: <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> Replace syscrg assignments of clocks, clock parents, and rates with
> default settings for compatibility with downstream boot loader SPL
> secondary program loader.
>
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 48fb5091b817..a5661b677687 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {
>  };
>
>  &syscrg {
> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> -	assigned-clock-rates = <500000000>, <1500000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;

I think Conor asked about this too, but you still don't write why it's ok to
drop the 500MHz and 1,5GHz assignments to the cpu-core and pll0 clocks
respectively. You should add this to the commit message itself.

/Emil
