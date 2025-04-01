Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2959B71
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743475460; cv=none; b=Slcw39xIVgMSuEgrM1m/HsEuvh1nW23NqEFxcgt0p23o7wfri1VAX371N+cnmofDwykMhZqXv08Jn8TvMvvSdYQemsWD4f7HfyCqUYoWGN0nVB91nqcmyBH8JUJJgNpjDEBUlXZZ/R/L/Mx+k1NlkEjaFjkAS8Cxv2hgwmbPqjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743475460; c=relaxed/simple;
	bh=HkxGjWUqTJOgqG7g3+8MzEadXEObhK4uaNG+f+mMpaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIoTy1ZnjpWweamQqvRJ/gzs/KyLmcD9CXqju0SiNa2CN7MkDj5hLIx5MtbxH20nQXoKWNuhgh8AHUcjMDT6M/VPK1SqZKf6Zsh792DsMn+8S6hN0i0lRCtwcGodhZBva6CwZKgNaVPfvfemJyRKZ+iVOC8/b3UuasBskqvs7vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com; spf=pass smtp.mailfrom=lessconfused.com; dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b=eYyVXqjc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b="eYyVXqjc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3015001f862so6640544a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1743475458; x=1744080258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkxGjWUqTJOgqG7g3+8MzEadXEObhK4uaNG+f+mMpaA=;
        b=eYyVXqjc96cYAL7J5II6yGzorQAT7ybIEzwi28gXkn6HiURBAmrIv3U6wXYUhgKesU
         gtTRYfrbtzJRp3pJlejjL88m0se4Z5/BJH+G7jJ4760gZ2Lf9rjx6JJeLBIxsfp0hDVu
         wO9dAaNxhUjcjPYNh3wWxKVWDmTb3PZuZuV1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743475458; x=1744080258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkxGjWUqTJOgqG7g3+8MzEadXEObhK4uaNG+f+mMpaA=;
        b=VvTDQgCheEKFn0n8bRnVW8yDNIsvm0RuStWgWgT/mjMqKI0H/ein1eV/4wkgU0cPAI
         8N5SROoSuVyM+z8ZcjRqy3eqUKmaJgiCUJSAC+EdH9aeim799rSLJjnjbNQlI21xFphx
         8nITc5IZVi7EHbFqtxF3RkUCM+oAEerHqI/ygzUVkPPjEB9O6qLIXVFF648MQiJ7km6p
         FxZgtS58M10PShbGXT2530p12HS3WlOws70MAlzlod5bwVGNsuzS+zP+ojnWKOldZo8l
         XOTHO1AccvzdZpvUZvVcBhB2wSOR2zaTxJSCCXny34+gfnXTmtXbL14RzppvhvY+Mehu
         dSXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQfxwD09cH9bfKJiO9Hrh+bf9mYIAxkA2vVy2gU6ytOZaXoYHLRwRa84oHEONXdgxJLgEepYUPwvskCMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ptH5+baGsdhmdUUFDdMtEhYZU2Ptn3cBTA6UkRHub2KTVF1o
	26jz+S+O8bdyPx9OfpESTJi3JXExlUUkBVGfGpfl9lhnQHKfq+BoK/o66K5e1GA7ImB1o+5FEY7
	gU4JTZelJu1Mu6kAjYBjk65i95bGDt46ig2D0xA==
X-Gm-Gg: ASbGncuMZdxgEuLFpWb6XdKV6bkeytYwamTDh14AR8UHjkfVjZ980jckSgb1sqOy65P
	Df34r897xPArGrZI5yyHiwjmbv2f7n0HchfTgTzsCUQ3dS2g2pLHxTtD8bhTNT/wQCo1A6Bd1fN
	M0djzSc7p0M9CHD1OasPApQ7A=
X-Google-Smtp-Source: AGHT+IEpFvhBi+lUM5E7CGqIh8SlOtzaJBvCk79aI8LiSy+0QDNR3/3AA4vdH3Sbx11mdSvsVtvYulswYGsuHxWrLD0=
X-Received: by 2002:a17:90b:1f91:b0:305:2d68:8d39 with SMTP id
 98e67ed59e1d1-30531f9475fmr21374158a91.12.1743475457642; Mon, 31 Mar 2025
 19:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch> <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
 <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com>
 <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk> <CACdvmAhvh-+-yiATTqnzJCLthtr8uNpJqUrXQGs5MFJSHafkSQ@mail.gmail.com>
 <Z-ssXdmRLYqKbyn6@shell.armlinux.org.uk>
In-Reply-To: <Z-ssXdmRLYqKbyn6@shell.armlinux.org.uk>
From: Da Xue <da@lessconfused.com>
Date: Mon, 31 Mar 2025 22:44:05 -0400
X-Gm-Features: AQ5f1JqL8hh66tVHnQp1H53_t8VYOq9ejOXVjyop1xdABti6QeP9kvlxkmw2sn8
Message-ID: <CACdvmAgP8iftcUumv9RrHBLLHFtQtPeRVgDVp7YkWuPsW6Ybmg@mail.gmail.com>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Da Xue <da@libre.computer>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-amlogic@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 7:59=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Mar 31, 2025 at 05:21:08PM -0400, Da Xue wrote:
> > I found this on the zircon kernel:
> >
> > #define REG2_ETH_REG2_REVERSED (1 << 28)
> >
> > pregs->Write32(REG2_ETH_REG2_REVERSED | REG2_INTERNAL_PHY_ID, PER_ETH_R=
EG2);
> >
> > I can respin and call it that.
>
> Which interface mode is being used, and what is the MAC connected to?
>
> "Reversed" seems to imply that _this_ end is acting as a PHY rather
> than the MAC in the link, so I think a bit more information (the above)
> is needed to ensure that this is the correct solution.

The SoC can be connected to an external PHY or use the internal PHY.
In this gxl_enable_internal_mdio case, we are using the internal PHY.

Sorry about leaving this out in the last email and causing another RT.
I'm not very familiar with ethernet underpinnings so I don't want to
use the wrong terms.


>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
