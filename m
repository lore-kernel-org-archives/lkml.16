Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71DA1F19A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745887468; cv=none; b=hnOu0VKfbbSYzh48zIky8+tAYISU/iUBtAPYAgnnVf2JSQ6y3ggdCWb005S+9Da3nO+18Cj7hJUJdWIB+A5OSEogC1fXJFV4/6xkHEG8OqShWiXLHU/x4nEwbWry+CxJd0qpkGywdLVBNZVQ8O8gP95OK4Tb8s0rY3Xk+Pd7W+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745887468; c=relaxed/simple;
	bh=+aoBAoeFpkctJ6JqzIU/vyQwUkSp0QwqX2H1qRlEkgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gd5oRsjvX8y5DewHET4qpz++bc+GW36hrGKzTFqS8hCO++DFRsY0yTWohxbDlqAlMcF9mLUmjj8isXljQPTHrbS8taHV6Ct6Ddwrrsk4QbYQXTGSSeOV1NvrTKPD22R3126R8YKQi9kD1BeYLpQcGwZ0KpeNcCt8EpIQ6Qg1f5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com; spf=pass smtp.mailfrom=lessconfused.com; dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b=BXMvipnJ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b="BXMvipnJ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301302a328bso7640984a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745887466; x=1746492266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aoBAoeFpkctJ6JqzIU/vyQwUkSp0QwqX2H1qRlEkgw=;
        b=BXMvipnJnNGgwGVJREc1bfs0tD3FhKnXimxSY/Yu+IEJFhM9+P9N88EJ+H6MBvJNHk
         fWrxsXy7huyrAUHF2bC/2yQvYR/1AUaqcB+yh1Sr0Ezle7bTXjg4PLPfMu0FXP46qRc4
         JGTMpFZVxnw3YJPCMz3eKXJqGvmEC7iYOsTQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745887466; x=1746492266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aoBAoeFpkctJ6JqzIU/vyQwUkSp0QwqX2H1qRlEkgw=;
        b=fWSef7h3GxiKw++Day0Jx4jNR7WE5guLTcjZD0hd4pQOCVoXnhj96H/+navtV+Jrub
         VJaqqlYAririU7/9J/Hdy8rvRB8BL2tmfDql/lbkaKdj5xLyTIIivYYE9v/lkn1TqfBb
         S0fMYljq8BS75ihCdHlQ+fzmP1faIqKgMBgNjvQD9S6rYSYVH1VzdgEHv9iK5zSU89lQ
         n/KQ1weMkldlHm+mNB7lF9ZRyZYwEUY36rc9+Z8cnwWN8SL0+L9W5SLnkWZmATote81E
         8HMC547SE1KAnygie9hOXzNj0tv4ugICQss6PL9DrVdFDF3ERICsE07Yn/rK2fOI3Akd
         OEAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJmXMXfiOvugLjdlZgJNgowEHLVNl9Z/d9YoVkOebXQO/vra5s2VRxIP1kpBORS4vmbErnDNHxrtIz5w0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy06Ab7QsF3UCZMlkaqhVUjlYW6Zw9MEcArv5HPtKgeYhTDJz1N
	O0tdyqiqQ4xbtib/ZA5MIjuaMyKsIWs84wyeSZgpJKJV8qV9V+KuLf2TKdmOxDmLGLDjJsCNuy/
	NFx46h72yE3WYaj3eY6akDuzjzKUt1T1VxK7iTw==
X-Gm-Gg: ASbGncsxYehpi87VXDf1bXbzBhTnIFDruZ3dCu8Ja9VA6YHQQMeBv/tYFv7KY8O5ZTc
	TNslqwB9dE/Cbp4XV46hOaVdnbJ3zGX8ObWKEAPe++uV2+HlB2Jk49y5PlYwCr6WX6l4UnBnRs1
	HBVpXydv43PV7rI4nGVCiOq4evx7QMm++ZAoO4tUyegUPYsiYPTqqJQOE=
X-Google-Smtp-Source: AGHT+IFjPL18h5P/u4F4dyTMOcvewGcroYbUT0gU7VtQUvVqhIshw60ZVQaT8g8ZD4qgd/tbKkO0lKtc/fcYY5m9kdU=
X-Received: by 2002:a17:90b:280c:b0:301:6343:1626 with SMTP id
 98e67ed59e1d1-30a21546d6fmr2342151a91.1.1745887465903; Mon, 28 Apr 2025
 17:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425192009.1439508-1-da@libre.computer> <20250428181242.GG3339421@horms.kernel.org>
In-Reply-To: <20250428181242.GG3339421@horms.kernel.org>
From: Da Xue <da@lessconfused.com>
Date: Mon, 28 Apr 2025 20:44:14 -0400
X-Gm-Features: ATxdqUEf_AoTzAnuf_I1pvf8_AvQf7sxk_KOWa8wGk2GqUmGhIm8SEm3MmjT6RI
Message-ID: <CACdvmAhcBmoDNyuu0npZzyExfhyLKdyPw9HvHvV+OdADxEfJJQ@mail.gmail.com>
Subject: Re: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using
 internal phy
To: Simon Horman <horms@kernel.org>
Cc: Da Xue <da@libre.computer>, Andrew Lunn <andrew@lunn.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-amlogic@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 2:13=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Fri, Apr 25, 2025 at 03:20:09PM -0400, Da Xue wrote:
> > This bit is necessary to receive packets from the internal PHY.
> > Without this bit set, no activity occurs on the interface.
> >
> > Normally u-boot sets this bit, but if u-boot is compiled without
> > net support, the interface will be up but without any activity.
> >
> > The vendor SDK sets this bit along with the PHY_ID bits.
>
> I'd like to clarify that:
> Without this patch the writel the patch is modifying will clear the PHY_I=
D bit.
> But despite that the system works if at some point (uboot) set the PHY_ID=
 bit?

Correct. If this is set once, it will work until the IP is powered
down or reset.
If u-boot does not set it, Linux will not set it and the IP will not work.
If u-boot does set it, the IP will not work after suspend-resume since
the IP is reset.
Thus, we need to set it on the Linux side when bringing up the interface.

>
> >
> > Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
>
> I don't think you need to resend because of this,
> but the correct syntax is as follows. (No trailing ';'.)

Great and thanks! I just set up git send-email so I'm a little rough
around the edges.

>
> Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support")
>
> > Signed-off-by: Da Xue <da@libre.computer>
> > ---
> > Changes since v2:
> > * Rename REG2_RESERVED_28 to REG2_REVERSED
> >
> > Link to v2:
> > https://patchwork.kernel.org/project/linux-amlogic/patch/20250331074420=
.3443748-1-christianshewitt@gmail.com/
>
> ...
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
