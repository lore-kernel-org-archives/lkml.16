Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4AD215F7D;
	Mon,  9 Jun 2025 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485004; cv=none; b=GZHyhp2JFBy+YyuHDSG57LS3+SUQ8Hd3fPHZW8YgtxkUpiJZjb9T4kIZydmnweEiRtY/f5rKtWdo/wcssOp/6yNCcXh10jMFhZ5X4GpC0ZC4a4ZGQ7UYAYcTV/v3rOVQbihcCTiG0v8zPuYazZ9NnV2980W7kZ8KNbnh2dfBmIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485004; c=relaxed/simple;
	bh=gV9OvN7Z/m7lwoJ68cb0bTusXwgD5lGYRItsGb9vMb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTgm5Mdl+BYo656R/wLAbW3N8c7N1g9y/IiiimCOY/CkqalGERpjjBp8nUFKnMaFB+ml/K2ZhLWYj4ICnJtJUCNJBuFbkZJPzL6CfYt0+G5CfVwCyI+L6Fpkdpx007Vn4SQ7gxDe6UYzTUJLvINOEwpDI2B6MG9DkFRPjK+bCu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/cSCSxv; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/cSCSxv"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e81877c1ed6so3850577276.0;
        Mon, 09 Jun 2025 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749485002; x=1750089802; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JLWa8pfmRBA0MCYaPm56slHNdbjbr5WNg/DtpiVizww=;
        b=e/cSCSxvMbpHvxGk7wJXzmbc/GyzLKX32ghE/t8U34qGJue+ab7KZZ4ZAEyEym+bAj
         BlZT9d2Ob0Cujz2mtd6bV+oLpfUaX+JOI5JXD6lesbujs8BlDQNblVq6uK1p8FCcUW7G
         FRzPvHUv33b4ccRXIMP1VUfOKWrPCjlRZxPQVWFbTLyCBtaQ+ruibbUYryHFgdlJjXHa
         S2EhWV59jMCOZlmfHqxNS1sBSmSmLSt3Fjji+xTi96Mk/DmxfyAJupHfEUy8rVqJLEAF
         D3LCtRYsImIuGpqGYmTCTeETlWVS9QPelllJC0PSxkg0sggH6g7ZFfhH93zK8ptB7enj
         P7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749485002; x=1750089802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLWa8pfmRBA0MCYaPm56slHNdbjbr5WNg/DtpiVizww=;
        b=n1BWWF/ogm+30SQyN5KeAL+LEIjjcezohqFOXsZGqlM+Ay4AqGYG9Xbnn8MY64ABx3
         uxgw2h5UZijd57pLf/aDVqEejhwZnNiyg4x1/wd69B/Jv2txERoZXmEUPtdry743FwoP
         OxI3vwqmGeTPA/LguVNaoEolMGCrfttpSv7rm8Ol61eQVtL2bEvUNnLkpSc5m4nyxPAf
         TvD4GQuy8wAROQiLuTNRVn6E3XOxlLTRyKpRziJ3mFzEFID3goDHdBmY4jzZvIw/xGS7
         G5vxzOHXYYXWdvqlm7xiNz7FkglEXIoBp71I0rfe+JIiGFWrUw4rGJtDHTc0ENB8zq+h
         M9Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVGgjhG/xDm7k6CjGAlkF/oDzaEcnEJ5hBjcBGkEWETeEzGq1Ns/LES8vShHl+f3pe9InadCifiC64n00Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQcsBQDg5i6qW36zbxww7s83OXm2GjM/SK6/F2c0Ml7Q5drwj
	ckfqXQqB5GUwqcU+hgcMceBAGTjVfrHtDqbD+Ouh2+uZHp6YqO+cDwChd2M9Eb567uL+qZYnenv
	ZkEWopVdgJiNXY2fX9ja3I/HnNSHX5bs=
X-Gm-Gg: ASbGncu8i+UldTdoPoB8T18yk9h1vZ8mMYokHQTelqFZQnxH908cfjbEdL8aRZPvil1
	tLHZXd/i7otpQLUUhIe0alM08bEH3jzO9524fjb4U7GUqely/ub+JT0S0s5y3Hvv/60HOH8I6wY
	eeNTE8pUc7eFoBBU+agV/ijTDoCwcLU2k=
X-Google-Smtp-Source: AGHT+IF8YB2n9mCmYPR48pr+o1aUFiaTFY5AD9mJhNaEKQ1/FqOU/CjUow2q+WRwE9E4U1hY1d1vM5OnXCj2EM4U9jY=
X-Received: by 2002:a05:6902:1005:b0:e81:d2c6:814e with SMTP id
 3f1490d57ef6-e81f077a159mr173187276.8.1749485001629; Mon, 09 Jun 2025
 09:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609140643.26270-1-stefano.radaelli21@gmail.com> <ca71a8b8-88b8-4d81-a17d-1b46e10e55a9@lunn.ch>
In-Reply-To: <ca71a8b8-88b8-4d81-a17d-1b46e10e55a9@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Mon, 9 Jun 2025 18:03:04 +0200
X-Gm-Features: AX0GCFuCh9zaVJsj5GtkuGSyeDwmhGTIAn0kUEeZIZink-bLJ3BuuR0gMcCu7GA
Message-ID: <CAK+owog8_f=s24NCbasLiNZw_zErqNpozU8uQvKdYbi=FKcVTA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

> +                     at803x,eee-disabled;
> +                     eee-broken-1000t;
> The commit message says it is a Maxlinear. So at803x vendor properties
> are not relevant here.

You're absolutely correct.
The at803x,eee-disabled property is specific to other PHYs and has no meaning
for the Maxlinear MXL86110.
I mistakenly copied this from another configuration without considering the
vendor-specific nature of the property.

Thanks for pointing this out!

Il giorno lun 9 giu 2025 alle ore 17:17 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> On Mon, Jun 09, 2025 at 04:06:42PM +0200, Stefano Radaelli wrote:
> > Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> > integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> > MDIO bus at address 4.
>
> > +             ethphy0: ethernet-phy@4 {
> > +                     compatible = "ethernet-phy-ieee802.3-c22";
> > +                     reg = <4>;
> > +                     at803x,eee-disabled;
> > +                     eee-broken-1000t;
>
> The commit message says it is a Maxlinear. So at803x vendor properties
> are not relevant here.
>
>     Andrew
