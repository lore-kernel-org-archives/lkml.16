Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E229C15383A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738608584; cv=none; b=iV1fiR39Ml5nwqW8b+l8F4+LYQIDp7Zz2WiZS/rFVna1JGIg1UFtP6uCAwdGw+7Zu58uSAeA7wb7xiXpQQsnw494uB+wrehXD91qvL9aLpWY2qx7E/0ej/0BsOmk6U9XSSehkNj6Ln5xXGcUr6DytByqlqX5jJWdWElf/CoQhHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738608584; c=relaxed/simple;
	bh=e6mfjCAhjspD99GgKLJ+Kp3DDrQVj0wKKan7rFRR2f0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWG/hDhG4ksolgv2XxCYQ/mFb4uN/y7O6uf9+WvUvJ3gP4BPq7Bab1uw6AwPjdnYGggWjcud1LZ6mJzAr0BtGTygOE6rq5n2IdWHCTRjlaJ6XwNTuFxwYSFX9Z2Dl87fQLeFmF/HpEpOHAG730jelRCbJ9bybEngp76exPvo0YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSvxJvFF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSvxJvFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438DFC4CEE2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738608583;
	bh=e6mfjCAhjspD99GgKLJ+Kp3DDrQVj0wKKan7rFRR2f0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pSvxJvFF9UrjbVoIUYRuKL8lqdMqjS9oiOYB4XkfY+N/aKtbtlPuD3WnV6xRx4yfF
	 SGjNNta3TeOU6GasV3698gpylNBR3o+AvQRHdvl9gNUrzXnRxxzEKz9Io+Wa0Ytg9y
	 s0FjFS+x1I/yk3ZxLNgIyjb5ef9IN9gxgErdsVNdZc/ZzpaJARwOa1ZHt3uMaSEA1+
	 2JPLKv3q9llRr5B4w+x3yQa+/jd48QiMC9XqEc4C1Mbxiw9r2JOsy65WEtY7p7zNOi
	 /ECsK0HWi5hUNeRSDrD/q6u181GIBrqatCMVoDHGxU+wn8DMaXuDE9OWxO7uLUw5UQ
	 9tHTGyWcu92Rg==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso8524656a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 10:49:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2kN4tPs2MhHqtgmH7hTrcNDEUbDpiEUECfbAVpNErqLRNeZBnKnrrQrTikL5bsBP73e2aBppNhOMgQAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYZYqeq1DzgsfoB5Vlx/6u75Wk6pXRfIp4izuD6isQJ+N0/dj
	KQBXZje6d7x4nyEGCTj1Z0wZUT3nY3TEynLa3Td0OF9HjyvLtYNw2U9+uTH1zbr2815QN9Rv6KB
	y9cKE+iwOMYngv2aTcQ7b+IWFEg==
X-Google-Smtp-Source: AGHT+IHRZ8R8fpMxBKgCgw8bavXdzA9H5kA8wOOZn2wZu4+SQJ2Dew1ZJUxSmYvEqAH1df8byjuznOAH4vRk3K9otZo=
X-Received: by 2002:a05:6402:274f:b0:5dc:58ad:b8d5 with SMTP id
 4fb4d7f45d1cf-5dc5efc112cmr25980752a12.9.1738608581813; Mon, 03 Feb 2025
 10:49:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231163121.241543-1-robh@kernel.org>
In-Reply-To: <20241231163121.241543-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 12:49:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7jUGqfFcpv6-WahhF69xQb9ODTU_xxm-Q3ySJusyi3w@mail.gmail.com>
X-Gm-Features: AWEUYZmiVScQsdeQTyyJLHGWj9QAFvMynSzif201Zu1U_YbABWsPT1LJOWLY8wM
Message-ID: <CAL_JsqL7jUGqfFcpv6-WahhF69xQb9ODTU_xxm-Q3ySJusyi3w@mail.gmail.com>
Subject: Re: [PATCH] phy: Use (of|device)_property_present() for non-boolean properties
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 10:32=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
> The use of (of|device)_property_read_bool() for non-boolean properties
> is deprecated in favor of (of|device)_property_present() when testing
> for property presence.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/phy/mediatek/phy-mtk-tphy.c           | 4 ++--
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Ping. These now cause warnings in v6.14-rc1.

>
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/p=
hy-mtk-tphy.c
> index 3f7095ec5978..d36f68dd622e 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -1215,7 +1215,7 @@ static int phy_type_syscon_get(struct mtk_phy_insta=
nce *instance,
>         int ret;
>
>         /* type switch function is optional */
> -       if (!of_property_read_bool(dn, "mediatek,syscon-type"))
> +       if (!of_property_present(dn, "mediatek,syscon-type"))
>                 return 0;
>
>         ret =3D of_parse_phandle_with_fixed_args(dn, "mediatek,syscon-typ=
e",
> @@ -1278,7 +1278,7 @@ static int phy_efuse_get(struct mtk_tphy *tphy, str=
uct mtk_phy_instance *instanc
>         }
>
>         /* software efuse is optional */
> -       instance->efuse_sw_en =3D device_property_read_bool(dev, "nvmem-c=
ells");
> +       instance->efuse_sw_en =3D device_property_present(dev, "nvmem-cel=
ls");
>         if (!instance->efuse_sw_en)
>                 return 0;
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/=
rockchip/phy-rockchip-inno-usb2.c
> index 96f3d868a526..b5e6a864deeb 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -440,7 +440,7 @@ static int rockchip_usb2phy_extcon_register(struct ro=
ckchip_usb2phy *rphy)
>         struct extcon_dev *edev;
>         int ret;
>
> -       if (of_property_read_bool(node, "extcon")) {
> +       if (of_property_present(node, "extcon")) {
>                 edev =3D extcon_get_edev_by_phandle(rphy->dev, 0);
>                 if (IS_ERR(edev))
>                         return dev_err_probe(rphy->dev, PTR_ERR(edev),
> @@ -1323,7 +1323,7 @@ static int rockchip_usb2phy_otg_port_init(struct ro=
ckchip_usb2phy *rphy,
>                         goto out;
>                 }
>
> -               if (!of_property_read_bool(rphy->dev->of_node, "extcon"))=
 {
> +               if (!of_property_present(rphy->dev->of_node, "extcon")) {
>                         /* do initial sync of usb state */
>                         id =3D property_enabled(rphy->grf, &rport->port_c=
fg->utmi_id);
>                         extcon_set_state_sync(rphy->edev, EXTCON_USB_HOST=
, !id);
> --
> 2.45.2
>
