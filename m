Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB822B5B9
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751380; cv=none; b=lW8299QHUb16evWr42e2UwlNH/6FgogYjQJdU5o8hNUvg03O9GADGnm/Uy6+kKJYYj0uj4GECEvMHBeJ3nLg7bqk56UdJR6XXHG+4hoXhr5OAmPRT3ON9IjR6qxK8+RkSmd8Tl/726IJBqRgvIDVIYY8drapCyBJ3wpk2iCunOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751380; c=relaxed/simple;
	bh=WI78ijGtjowcHXJYrXtfWT/69d/eQD/yPSkusz9kD7Q=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mt125zZEmDG5XZ2O9C5UeQlNP7JPkyd2bKD6gtoTUHuV9oi6+A7VzEHz3CpCXrd1wk+6ng6bUpr529gOnXBqhqVK0dnU5IbpHWnYineOgAiKibSqlys/l+SobCfhw3IFxyDX0W2dkU9WlBTU5quSFMLy5r/iU+TIqlvBc166FOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=FAtARg6h; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="FAtARg6h"
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 28C6D3F671
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738751372;
	bh=6p5dlNzJ/YPPjs/DSFQLsa5sUOHCa5xG63IkAekOvh0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=FAtARg6hgwwQSPh5y5NmSeKybqTMW5Owxwd563KoOAs7dd9Qu933kSYPe619Li8gn
	 5LbeRVQdxwuNfc1ItPLJhdaEhX+yaDw9MgSgT8pKhVc44RuRKHSPwiHmv/65CwEqH0
	 /TOJWWQAl8tGoAQoDIWnRocCGaAm8FqyoJC+Jyyrl+Yox4vFl9tw/qmLlyD1GQc3fh
	 2cJuEmqeJpsVwCm/MwSQhCU95bKP7+Bb1gBcE8rWrnC1by16VHK6aolbHkxZLlIxg8
	 /6KCnSgfpiLS8JGjcFI8zct7JzvpGjIoO8TIiv59OWtnasoKtpDOm31u63U8x6iT4I
	 ZY54ZpU3PJIBA==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2add2f6f16dso10505815fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751370; x=1739356170;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6p5dlNzJ/YPPjs/DSFQLsa5sUOHCa5xG63IkAekOvh0=;
        b=G/vAIlA0JYocoQA+wsnTI6uDvGlsJU88aBwRjt1rK2uYHMQSr8T421AFEUdx+UC5PN
         Lgu2qGCmYPIvZLXRTAbq6vfUKp7LT17zynT3zao2qhUM2sEqDQMPDE4ga71vHbqrI3wD
         yQsC5j7ydG/MfBqKA2RSR216X90IUWBCBgI54Fnt+UwtjiD75Vj/0rUVYeSiKVGG9ytg
         oFqOZBUaiUcS2r3gdkPszpve4X+WK9Z/Fj5PNLKJ8rH0Y+cI66XwovAsfwxr69MuuKZY
         C0OzRG7uu3UV9Gdd77beioy86xly41k9hkkUsm8esLKgoel2Ii0ybSJFOYEXq81bmml5
         4YpA==
X-Gm-Message-State: AOJu0YyocCNeM2b+AO7RfT3AXZhIELY5FVKhIW+48LEuAWn5F5pkeXrr
	7c9S3LoVlX6r+gdiwA5g1019/S/zS/7qdVDn6X6BMbSQgcrUFUcqhs2AGzPTURg5wNOiGOqNTqv
	pnjobx8ZJBPjI59LXfvdkHHRdybkqj5IUU6RuAjCDswjHW1ovWor+xgmivrM8uRXBmWiTGR0xZk
	K/6v8O7o7IwIAtCxBnsO5+1d9Cxidl8zVM63WAcuaisYEKxym2zkCB
X-Gm-Gg: ASbGncu7mhhymM+D6Wami+f8GSFlzViUCt0BCkiY0c+bIlKDbWIwD7j8+wSyXTMDb56
	Uvzh8hkGxDgOdXK4iJK8Dr+YSiRV0sRuce9pR88XbEVPB/r6eYk71k6CkWWfFje3WfE+kjd0T3g
	ol8ZrNeRamrixj4Js=
X-Received: by 2002:a05:6870:15c4:b0:29d:c764:f873 with SMTP id 586e51a60fabf-2b8051189e7mr1412752fac.31.1738751370730;
        Wed, 05 Feb 2025 02:29:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED9P+bVZqPUW7UO2uWic3Ql/tfX6w4dwltPlCCIcZdxoXy1RTbFe/BWTDvYa6FU+eq3MorrYQsqOpUrQqy/Ck=
X-Received: by 2002:a05:6870:15c4:b0:29d:c764:f873 with SMTP id
 586e51a60fabf-2b8051189e7mr1412739fac.31.1738751370456; Wed, 05 Feb 2025
 02:29:30 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 10:29:30 +0000
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 10:29:30 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-4-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-4-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 10:29:30 +0000
X-Gm-Features: AWEUYZkWYCph906PZJ8Zu7NPROce5GWqOyVjvIksBicpE8lH4z17iclUJfeqp4U
Message-ID: <CAJM55Z95pwTZmw-WPcUaB1BGpVoNgaRYYjUnqSFcLTNyVmZahg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] riscv: dts: starfive: jh7110-common: assign 24MHz
 clock-frequency to uart0
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> Set uart0 clock-frequency for better compatibility with operating system
> and downstream boot loader SPL secondary program loader.
>
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 8a59c3001339..6bb13af82147 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -635,6 +635,7 @@ GPOEN_DISABLE,
>  };
>
>  &uart0 {
> +	clock-frequency = <24000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";

The uart0 node already has a reference to the uart0_core clock, so it shouldn't
need this property.

/Emil
