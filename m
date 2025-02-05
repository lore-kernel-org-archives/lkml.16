Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D8F2063D8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751590; cv=none; b=oyV+MPGadCQtuGq5i0QAB2NbimTVYZ7AnR1CgcL8/SVMaZKDSOt4iSMNtx8l13vHYQ+uHprm92RWGXSW0dOUT/rH2ab3JYOiNq1blDhYIp7OwkxIAQin8QN3Sb0w9GGXupFwqOMmyveQ2jc2+IuxoOHr/0yuXtdgEU9ulJFThus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751590; c=relaxed/simple;
	bh=mKe8Vh5nnbsvkAVim7x90QysHHsU1yLN+LtjLZnDFYk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLyUkECKnuW3SPY+AGWjehRPnHPeP8v7us4lp4zxMPjGZvajR9w5SObupljCQ4Vb7pYqJqrrAwIP/0PJMZeiQOv2Ye2XMYU8WzCpC8KTj3Xy0UzoxIdJn/7K/0Zw+moi6sF7E9AEh+G16mdrYoXSMcb4BUaMf0IWGZm1MT63+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=H9+iJmE3; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="H9+iJmE3"
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E68D33F277
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738751585;
	bh=mZz6uOkOdetjWn/MYSWTPPdVo/eDrN/gD1mRQKYgsoY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=H9+iJmE3Oj77vqYVsBTeohqo5EocjCEFsupFI8mxIVTnETp5/odVf8v4zSkeaN3p/
	 BScVOdiVB7urNAWLphGp9W9pFF8x3RzI8j1wxwOjb3qOsH+/N/+58wxO48mb9A/J5T
	 H5yP/pg03kA5yyRJ9SGQdvRfdLuSSE3Q/yozipAjEncE66OiemlH3/D4wgZfAVgnmc
	 COkRNqPb3ZAJxJrSgE1d3aqDGME47Epe+i1lwfe7VxoGCOpwY5cxOEPivuIAkbJbSn
	 HQogjBcYxGPGd3UZUPqNqh0lx+SA4V3gWuXH+OwT3IgIzr0r13Ubvk8CVAlh/KXErK
	 UXNHGqlg6WvOw==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2b268f6e85eso5412908fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751584; x=1739356384;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZz6uOkOdetjWn/MYSWTPPdVo/eDrN/gD1mRQKYgsoY=;
        b=xTzy3b7WsIObI+8PSaKWF+l8eJPe21JdsAlMCANJC/mdZggCOu8kMAwJ0aK23kndNt
         RwDVp16B0Y2Y3Sy0+HTybfzxd1XSH+WajEJWjblNP0hNxukYrlD+rGnzTrI+iAIHsCAE
         ukjbIBLQ2IRjtBXPW9TepfS7JaGwqys/63vAHe2WzX9KtHXuBCHrI9EXLNowAEVqLyb0
         8P9NMLa24OvQ7k4ZDVdJseA3Ocp+HL6XEiHgc6QcWGHSr3KLDM1oj+v+ByeSjnUyyw7d
         jfC/BnBCD3G6rMGQO5KQKthesAGNXRPrBTEJ30udiDl3s2rPA3CbFEQLuyi/4CVGsMuR
         Tcyg==
X-Gm-Message-State: AOJu0YxgqVeohUmgu96rHj71s0YueYMvnXSzrUelQd/P0vjuRH1cusw8
	U0aaVF6mwNdLRHuQUvketqdMAwJe22oHwCkyGgSTfOnDAZqtpgl23glDNvNK0F4ZmaBaVK8shcr
	OcH3mb/M5CwrHX9N3QWFK6WJd4zLiZEAtQPgWjlh960vR9goAWoaoG9qkmYoj807lJXPQ8ySzSr
	7RByiKK1Hm993xcBfo8lfrch0J9XmjH04u+EKcq9phW83y0tJsiVnB
X-Gm-Gg: ASbGncs+DOaCtavVc8Vl1GbX9GuUadSeRwI5x9bmKYurCXoiDXL9J6xQYZIuG6KRkYp
	1MABdKQLpV/utVO/wBFNtmojn4FifcXECfHmmtUrcBt+4JDgM5ckeI6PK3cVosnOdP/VTDTR8oG
	DVHYtSjubWMPfi6IY=
X-Received: by 2002:a05:6870:6120:b0:29d:cc2e:8493 with SMTP id 586e51a60fabf-2b8051216bamr1463359fac.26.1738751584163;
        Wed, 05 Feb 2025 02:33:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmH3qpvoZrzko3vHbJKUwQH9D1C8J2WA4SgPiTgjAd4v0yRXDEmDqB72GVyqzhsHQ7yWRzIEithsQQ5N0993Y=
X-Received: by 2002:a05:6870:6120:b0:29d:cc2e:8493 with SMTP id
 586e51a60fabf-2b8051216bamr1463354fac.26.1738751583861; Wed, 05 Feb 2025
 02:33:03 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:33:03 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:33:03 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-5-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-5-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 02:33:03 -0800
X-Gm-Features: AWEUYZnqN3UQuAdW8pBfGnZxZ0hwMrrOPqtAk4UJEzsjOBu6DnzhDSeCSBC-YNE
Message-ID: <CAJM55Z8MVK8bB2qyzOsmgOC-vOCFEgAXcQ-yETH+KFF2yF-bmA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: dts: starfive: jh7110-common: add eeprom
 node to i2c5
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> StarFive VisionFive2 and similar JH7110 boards have an eeprom compatible
> with Atmel 24c04. Add the node so this may be used with the at24 driver.
>
> Signed-off-by: E Shattow <e@freeshell.de>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 6bb13af82147..30c5f3487c8b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -245,6 +245,12 @@ emmc_vdd: aldo4 {
>  			};
>  		};
>  	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c04";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};

This looks right to me, thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
