Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959D23F27F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942828; cv=none; b=VFMWYs4UobcNGaN4LaqmMX52lu/YvyRKXxbYHB/+3ilOj7YbmP/uLq6mnB95uV/ShXUAC9QZCCIA2uGMdYxodMzDEvVqK5CVRUpcl4UHq4wT7FWnum2GpRDNe9Zmy393Q5trN68dCJdjADlMjLe26oOKJyav1+302Cep6gHo5o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942828; c=relaxed/simple;
	bh=5tfmwwnsXkMCfpD5DPHkH71TxoRUnXDetDwiyRYLOCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTF3dYc8sE2iNYt7sARZPmi8jrEGHyfv94mZ7CSVXpUe/mYBeoIg6RBulsU50CvaAPsFQJsVbvq/eC06F79U7n7TD6wmqHIF80CBgGVjVneO7dVBIWhI25/y1cI25DOPaWiNPeq+8ZF6zB+0uYiqkadvy+YuAhPSXJasMe/Rwo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfGHWWpt; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfGHWWpt"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f9bd7c480eso4006773a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738942826; x=1739547626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78xz1A4WgmJ341XGWUR24O6ak1vHScxCshoNzxfmZpo=;
        b=jfGHWWptpXBGcalxAd7jAffSQq44m12Q0fuEKGLQajgIsvu3syy1pP33AQL7IhFw81
         RyEVdACmy3R58KFPCyoTXbRIDNeHheLA3BOgihNjNSw3jcLrkP1ZaJwHVTVKOaSLwofU
         p1rWdx9I75DOXiojUlcNxu15eZBxgoviMEl4uh4It50Oh3QkMPCEXVZ6vDJ+38joaP+D
         GUhawwV3HGfKWZZ/q29ouHBG/yjRBP3mRScwi7Jyq2n6IbyRopBwndIlLTutCvDktvFS
         7myq+8h+fTHPvBUVrtxxQb/XraBBFaTcV5jEx5Jpi2aka36SfD7897ZzwpPM5/N1FSUv
         6fGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942826; x=1739547626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78xz1A4WgmJ341XGWUR24O6ak1vHScxCshoNzxfmZpo=;
        b=BQ2vcl9+Es0UtN2fBbJ7bY78e/TldrGzdLazy/EaoUyXssmJPslKb01rA400McKd0v
         mNhziS+LZqMz+Q9IFGr3+L6lXmwnmKqa3SfpXRHP1mvrM7JXomcy7SK5JQbrZVSd78kO
         4Ep+2Tb/Xm4vphQzEsliEej2li3x4rr2kAuiPQCLP4xt6/NwFUHw+BX5JP8Z70bMuvQZ
         3LqE1B7Ee/ThQT62DpzCHupudVexh1zz//14CPQgCXTw8vsup9+8jLAeo/ahcGybEgPG
         Jmq0k3YbcKD9y1p/rs0tpMRbGqQp8i4WBgSLAMeOkEY8wSGp4dVehJJCaCbobAFUCcWz
         /23w==
X-Forwarded-Encrypted: i=1; AJvYcCVl1tUqA7dS4pv28I1D0hi49rOvpetClL4JWiLOe+IguCIkZtDGT+uy/7OqEfqxGqbjtxYBmpjtibGkYUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMPDUVJic7oFVHT1VN0Q4vEvww/bLryX13df8gpOWBubQLv8e7
	8Rv53KOGkH0DC4T1P8MovwLhWtwNYCJN7KhNsEz1JN0ryCgZeS3YlHFmakKY2a3VN32TesdlQCh
	x8qf0QuRwoIuVtOcUqE87mCB65RI=
X-Gm-Gg: ASbGncsqhLwnENUPHjM5bBWNP+1Qew0jXyrGi41OJYf6A8yNzf/kmQi5jEY7n5wmNAx
	vyCzY3L7HxqosrC6Etp/dAGktk6Id14aiuA59VAqOUKLUExnbQ8rnqmSGN2gCvrV3hvhV9c2e
X-Google-Smtp-Source: AGHT+IFltx7zRD5jBeHpJqboIqZSnAU1irCJwfY5DFXF75JTXaJu2pXSjIbgVKSVf0zyhh90zMi5In8p1URs1ahdVII=
X-Received: by 2002:a17:90b:23d0:b0:2fa:13f7:960 with SMTP id
 98e67ed59e1d1-2fa2406a099mr5504001a91.13.1738942825550; Fri, 07 Feb 2025
 07:40:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_195F1119DC8F547C905D5ED127D173EFAE08@qq.com> <CAHCN7xL7eMV2f04nURp3jCCmNZ0GSTY=uaOwoiht38AC4Oz0EQ@mail.gmail.com>
In-Reply-To: <CAHCN7xL7eMV2f04nURp3jCCmNZ0GSTY=uaOwoiht38AC4Oz0EQ@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 7 Feb 2025 09:40:13 -0600
X-Gm-Features: AWEUYZnJEWSnAyZpvbvxi8GyVZXId-jerRmQTcMkcAD6TZ_EjsrysOmpqNVEgWk
Message-ID: <CAHCN7xJwZNc-mgxTqzRxqPshPxNyusrA-wdSUZBNq8UyAU04dQ@mail.gmail.com>
Subject: Re: [PATCH V5] phy: freescale: fsl-samsung-hdmi: fix build error in fsl_samsung_hdmi_phy_configure_pll_lock_det
To: xiaopeitux@foxmail.com, Vinod Koul <vkoul@kernel.org>
Cc: geert@linux-m68k.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 7:59=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Jan 13, 2025 at 2:41=E2=80=AFAM <xiaopeitux@foxmail.com> wrote:
> >
> > From: Pei Xiao <xiaopei01@kylinos.cn>
> >
> > FIELD_PREP() checks that a value fits into the available bitfield,
> > but the index div equals to 4,is out of range.
> >
> > which gcc complains about:
> > In function =E2=80=98fsl_samsung_hdmi_phy_configure_pll_lock_det=E2=80=
=99,
> > inlined from =E2=80=98fsl_samsung_hdmi_phy_configure=E2=80=99 at
> > drivers/phy/freescale/phy-fsl-samsung-hdmi.c :470:2:
> > ././include/linux/compiler_types.h:542:38: error: call to =E2=80=98__co=
mpiletime_assert_538=E2=80=99
> > declared with attribute error: FIELD_PREP: value too large for the fiel=
d
> >   542 |  _compiletime_assert(condition, msg, __compiletime_assert_,
> > __COUNTER__)
> >       |                                      ^
> > ././include/linux/compiler_types.h:523:4: note: in definition of
> > macro =E2=80=98__compiletime_assert=E2=80=99 523 |    prefix ## suffix(=
);
> >       |    ^~~~~~
> > ././include/linux/compiler_types.h:542:2: note: in expansion of macro
> > =E2=80=98_compiletime_assert=E2=80=99
> >   542 |  _compiletime_assert(condition, msg, __compiletime_assert_,
> >  __COUNTER__)
> >
> > REG12_CK_DIV_MASK only two bit, limit div to range 0~3,
> > so build error will fix.
> >
> LGTM.
>
> Reviewed-by:  Adam Ford <aford173@gmail.com>

Vinod,

Any chance this can get pulled into your phy branch?  Several people
have responded indicating some compilers throw build errors, and I
think this is intended to fix that.

adam

>
> > Fixes: d567679f2b6a ("phy: freescale: fsl-samsung-hdmi: Clean up fld_tg=
_code calculation")
> > Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> >
> > Changlog:
> > ---
> > V5: add return ret from Geert suggestion
> > V4: change to use if statement
> > V3: change to use do-while
> > V2: change to use logical AND
> > ---
> >  drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy=
/freescale/phy-fsl-samsung-hdmi.c
> > index 5eac70a1e858..6817ceabaab4 100644
> > --- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> > +++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> > @@ -325,7 +325,7 @@ to_fsl_samsung_hdmi_phy(struct clk_hw *hw)
> >         return container_of(hw, struct fsl_samsung_hdmi_phy, hw);
> >  }
> >
> > -static void
> > +static int
> >  fsl_samsung_hdmi_phy_configure_pll_lock_det(struct fsl_samsung_hdmi_ph=
y *phy,
> >                                             const struct phy_config *cf=
g)
> >  {
> > @@ -341,6 +341,9 @@ fsl_samsung_hdmi_phy_configure_pll_lock_det(struct =
fsl_samsung_hdmi_phy *phy,
> >                         break;
> >         }
> >
> > +       if (unlikely(div =3D=3D 4))
> > +               return -EINVAL;
> > +
> >         writeb(FIELD_PREP(REG12_CK_DIV_MASK, div), phy->regs + PHY_REG(=
12));
> >
> >         /*
> > @@ -364,6 +367,8 @@ fsl_samsung_hdmi_phy_configure_pll_lock_det(struct =
fsl_samsung_hdmi_phy *phy,
> >                FIELD_PREP(REG14_RP_CODE_MASK, 2) |
> >                FIELD_PREP(REG14_TG_CODE_HIGH_MASK, fld_tg_code >> 8),
> >                phy->regs + PHY_REG(14));
> > +
> > +       return 0;
> >  }
> >
> >  static unsigned long fsl_samsung_hdmi_phy_find_pms(unsigned long fout,=
 u8 *p, u16 *m, u8 *s)
> > @@ -467,7 +472,11 @@ static int fsl_samsung_hdmi_phy_configure(struct f=
sl_samsung_hdmi_phy *phy,
> >         writeb(REG21_SEL_TX_CK_INV | FIELD_PREP(REG21_PMS_S_MASK,
> >                cfg->pll_div_regs[2] >> 4), phy->regs + PHY_REG(21));
> >
> > -       fsl_samsung_hdmi_phy_configure_pll_lock_det(phy, cfg);
> > +       ret =3D fsl_samsung_hdmi_phy_configure_pll_lock_det(phy, cfg);
> > +       if (ret) {
> > +               dev_err(phy->dev, "pixclock too large\n");
> > +               return ret;
> > +       }
> >
> >         writeb(REG33_FIX_DA | REG33_MODE_SET_DONE, phy->regs + PHY_REG(=
33));
> >
> > --
> > 2.25.1
> >
