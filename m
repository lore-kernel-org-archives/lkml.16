Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58D31F8AC8;
	Thu, 27 Mar 2025 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080417; cv=none; b=BY5m+CeZG/Of0kzripOpj9OSDI/M/v4COsRLx6CMTTXlS2oGcIojrLwHWsMgm/stovknAXJjrQJ0anhhWi8+2rZD67NDKgRM5kttVwVwcYuq1Bu1VkKpWnm+zzh0/fZg4OdAk4GyNOua4U6gV462of32Xd7C4ny4r7Ul46MCWCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080417; c=relaxed/simple;
	bh=gtvYZMPr61yWIT09B80LDMBXQ/aBdz1UXra3GYTBwC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQHC2ozsmaoLyYYCMj9VYTKGE9lveAjuN44cQpaiwPLTBgTJIXoCCHY6JJuorq6eceQ+wPqqf1xKc3BSMMIIKomnbQtObaReYfnEuaRmyO++m3biKuiAU1FTZwZ3HWjaJV2o8im6EBSAOvcM5V3ZfC9gyO0sniqgiQNqO9NEXK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwsgQ79v; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwsgQ79v"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2241053582dso25288105ad.1;
        Thu, 27 Mar 2025 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743080415; x=1743685215; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6b7sWVXjkhrJaD2m6/tPkXhOgFWBsjjzpPJnK8wguo=;
        b=HwsgQ79vqD9V2PDTvjeuq+z8WIZMJWXMSeKqe5+snPOshtYHwTCFZzv6MIMSfZ7GR6
         QBWYa0XdrFBvXV5xDuNnZYhMs36CPEgjDHcTY5TQr0fCNczUKFWA6mqZY/I0BekCje2i
         A0F8OOAnHUkKAOv2eUQSyMSpmX64QO5t7/XlrA6e+57zlfgW00q1BkLdXSRXlAd08JPV
         r/rR5iAKaQDlrBOqOhETmPK1eXKqjOluEyPm/L0CDXqeVZC4obXLpI9cIdAKCAN02g4c
         ZImiRWPm15d9e51598bDD/tAeYFCWw5sn8D/mX5nDiLe1F7T23NCgFlTREw7XqCpNHWt
         q+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080415; x=1743685215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6b7sWVXjkhrJaD2m6/tPkXhOgFWBsjjzpPJnK8wguo=;
        b=amHZQgmo2V8FTgqy5IThRZtx1X9xXFVKOAWJYfg60gYbVa5mC+XrwlZCGjNjee2aL+
         J44NG+6Eh9CjLvnVicuioarYKYR92Z2tD6NKNuldPyrXwcJkWqDeIEB6jQwpRAbj1aH6
         S1rhbLymweIraq5IUnYnPKgnT+z29C8gTqNtUEKKWfo7dttwhuw5oXNRTzGed9OBZinb
         s2ef6mBGZwT0tbrq9opscJA0DgFsPwnP+8Mz+3Xy+GPmtkZb4xDH4B3VJHDOeuxMrv2V
         xHHmom08A6uwOfUM5Kj+/C51VaX4SPBCCPjk8w8Y2ZbruP5nb1zea86ncR8QQPntCTFp
         l84A==
X-Forwarded-Encrypted: i=1; AJvYcCVaBUWfVkCZem2eWmul+XSDcll0XBYG4YnN0jfkkmHxvkUn9WJFWB3XpD+NV37EUKcpVecZagnCfwEcawpk@vger.kernel.org, AJvYcCWibGEaLIIKRRPyNlAcX96dJ5ZbVvqNne/bdErY3dQNnOxO05ead9jATGudvZ3B1xuKduaW5dMF3Hxc@vger.kernel.org
X-Gm-Message-State: AOJu0YxWntN6k1dZKqgqTJ2QthvUXlq6w9ZlHXZ2DBBItGwZp+DoNqHA
	qi/WfVhzZJkMEu6r8lswRW9kDgce9jcNze9jUxMYXTUaEUCRUsV4jfQmMJ5gzZHNnY+ao3U3FHd
	s6XMv+QbME3exwwAYwq/ZncNnbrU=
X-Gm-Gg: ASbGncsAL4xNkWNRWUgn8cERTcXIncKRbOJaV8Et7yAsOKivRD4XiWwxx/7zw0chDrx
	UeTLa6f79tpQLKKSYy7fVJ3KeZnrelr5Jo+mU5oGC22WU6INtZIDHH6Mb0VldhtGDkq3hnfCk37
	oWumOlnGIVcnXKkgNfLAalewI=
X-Google-Smtp-Source: AGHT+IHOx1vxujfIGQkM2NnfBK5kG0HOb/N8CJ8A+AmXs1oiNNEb5E+p3ftVq1R9qljzIuPzJrCtsq9rtR73AjSqNrU=
X-Received: by 2002:a17:90b:3c0b:b0:2ff:5ed8:83d1 with SMTP id
 98e67ed59e1d1-303a8164697mr4599906a91.19.1743080410136; Thu, 27 Mar 2025
 06:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327120857.539155-1-martyn.welch@collabora.com>
In-Reply-To: <20250327120857.539155-1-martyn.welch@collabora.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 27 Mar 2025 15:01:37 +0200
X-Gm-Features: AQ5f1Jrb0eLYTMXk2wVS9fPQ0Qq3m1Z8Jo5KryHhA8RkTAv3fjuFXtjyUWNuMVA
Message-ID: <CAEnQRZD15J9GOHFL6MfaLtSkgaN6ksT_YL7GvG2U_St8q2+KgA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Add device tree for Nitrogen8M Plus
 ENC Carrier Board
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	kernel@collabora.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +       mdio {
> +               compatible = "snps,dwmac-mdio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ethphy0: ethernet-phy@4 {
> +                       compatible = "ethernet-phy-ieee802.3-c22";
> +                       reg = <4>;
> +                       eee-broken-1000t;
> +#if 0
> +                       interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
> +                       reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
> +#endif

You should not have dead code in the final submission. If it is not
used just remove it.
