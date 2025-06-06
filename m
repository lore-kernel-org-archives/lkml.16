Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF508283FF6;
	Fri,  6 Jun 2025 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198417; cv=pass; b=mkpdnf9EvMbc5uHj/ohs0EKHf7FcVFYyXtLFdPqT6moLh8RK4E+Lopil+gMAFc3hPyKr7cJceXJVBRgnxsq74XwgjqohAKa7cns2eiThxA9fQdr0cWrjJ3rEOWDWDWyB0KZK7K8OxCkXBDW6LuuWeEjgYjNLmvrgQeNlNSeRb4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198417; c=relaxed/simple;
	bh=JzybpB9O50HKqd2tQryFsC67T6tQEyKjF0z8lV3FvkI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oz9IvDi8W4rKnHVL3hIpGC2zzIrJx9G1FtIBjGHcgVsk6VL1Oe3HDC+DSStdEgpRMs+9i5+uPDk8ep40g+bAjCVdwBrKiaTmuouh7XqQter54ZHyPJs3XjvaqPbPkWnNuCuP0FKQH0b7jN+zA/l5maJW3iq0x7hQydzz8xsk24s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=c9OJCCPX; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="c9OJCCPX"
ARC-Seal: i=1; a=rsa-sha256; t=1749198402; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b350DFtfUedur7zBIMRauTVll3wzUq/8EEXa4/OZnxG4gtK048GBPd7gBlTKV7+QxtNWFmOMdLgbCTq7ca61CNBIMDPzuyNcF7fVuLkv2T+W8DmLB4Y6cRbnJn/sDfiLkP++JzF6JyG8bFg9kKYhFt021kaGwlLLn2G9U2CmnLM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749198402; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=RaYpsPgJJHeNg4Z6G85HvxDq+rrSNHiEHejBmAZBSBs=; 
	b=EJ6G2a+EznvdWSFMcrOZ92fnTeugzxllS4zd13h7jTOg2oR+CIgG5Nfk/zHh/PIvl+t5S8uNS8wCnmVIp1hANxeGRQFkE080kjhogModZ7hmVV+IC/myrDSnQUPQFl06iRUcdTWLQ/XAvf2OFmZQzzVXxV0h9MSUOFgW5k0AB/I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749198402;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To:Cc;
	bh=RaYpsPgJJHeNg4Z6G85HvxDq+rrSNHiEHejBmAZBSBs=;
	b=c9OJCCPXAHT6EhmKgJ6A2wg23RjKUXmZWwGn/+UUqIypKLtpwDBG5YNShBPFkU/S
	428Z0fjqPBHjLMtw6dzxYtIAokLSiDRN2qVkC+NEi8MLXN9KBhxkimFMYOannJ9BBV2
	bulOUHREm+9SPPpKO58YV50moLjw28r84Tmzcj/k=
Received: by mx.zohomail.com with SMTPS id 1749198399941963.5389095677118;
	Fri, 6 Jun 2025 01:26:39 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pei Xiao <xiaopei01@kylinos.cn>
Subject:
 Re: [PATCH 2/2] ASOC: rockchip: Use helper function devm_clk_get_enabled()
Date: Fri, 06 Jun 2025 10:26:36 +0200
Message-ID: <2895073.PYKUYFuaPT@workhorse>
In-Reply-To: <3f589ddf-e421-494f-85e5-1adebd19d03a@kylinos.cn>
References:
 <cover.1749006565.git.xiaopei01@kylinos.cn> <24654754.ouqheUzb2q@workhorse>
 <3f589ddf-e421-494f-85e5-1adebd19d03a@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 6 June 2025 05:27:13 Central European Summer Time Pei Xiao wrote:
>=20
> =E5=9C=A8 2025/6/5 01:42, Nicolas Frattaroli =E5=86=99=E9=81=93:
> > On Wednesday, 4 June 2025 05:13:30 Central European Summer Time Pei Xia=
o wrote:
> >> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prep=
ared
> >> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now =
be
> >> replaced by devm_clk_get_enabled() when driver enables the clocks for =
the
> >> whole lifetime of the device. Moreover, it is no longer necessary to
> >> unprepare and disable the clocks explicitly.
> >>
> >> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> >> ---
> >>  sound/soc/rockchip/rockchip_sai.c | 8 +-------
> >>  1 file changed, 1 insertion(+), 7 deletions(-)
> >>
> >> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/ro=
ckchip_sai.c
> >> index 79b04770da1c..2ec675708681 100644
> >> --- a/sound/soc/rockchip/rockchip_sai.c
> >> +++ b/sound/soc/rockchip/rockchip_sai.c
> >> @@ -1448,16 +1448,12 @@ static int rockchip_sai_probe(struct platform_=
device *pdev)
> >>  				     "Failed to get mclk\n");
> >>  	}
> >> =20
> >> -	sai->hclk =3D devm_clk_get(&pdev->dev, "hclk");
> >> +	sai->hclk =3D devm_clk_get_enabled(&pdev->dev, "hclk");
> >>  	if (IS_ERR(sai->hclk)) {
> >>  		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
> >>  				     "Failed to get hclk\n");
> >>  	}
> >> =20
> >> -	ret =3D clk_prepare_enable(sai->hclk);
> >> -	if (ret)
> >> -		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
> >> -
> >>  	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
> >> =20
> >>  	ret =3D rockchip_sai_init_dai(sai, res, &dai);
> >> @@ -1512,8 +1508,6 @@ static int rockchip_sai_probe(struct platform_de=
vice *pdev)
> >>  	if (pm_runtime_put(&pdev->dev))
> >>  		rockchip_sai_runtime_suspend(&pdev->dev);
> >>  err_disable_hclk:
> >> -	clk_disable_unprepare(sai->hclk);
> >> -
> >>  	return ret;
> >>  }
> >> =20
> >>
> > Please get rid of the err_disable_hclk label, and change the
> >
> >     goto err_disable_hclk;
> >
> > in the resume failure condition to a=20
> >
> >     return ret;
> May I ask, could we use the dev_err_probe function instead?
>=20
> return dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");

Absolutely, dev_err_probe states the following in its documentation:

    Using this helper in your probe function is totally fine even if @err
    is known to never be -EPROBE_DEFER.

This means you can use it for every error case in the probe function.

>=20
>=20
> @@ -1441,28 +1441,22 @@ static int rockchip_sai_probe(struct platform_dev=
ice *pdev)
>                                      "Failed to get mclk\n");
>         }
> =20
> -       sai->hclk =3D devm_clk_get(&pdev->dev, "hclk");
> +       sai->hclk =3D devm_clk_get_enabled(&pdev->dev, "hclk");
>         if (IS_ERR(sai->hclk)) {
>                 return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
>                                      "Failed to get hclk\n");
>         }
> =20
> -       ret =3D clk_prepare_enable(sai->hclk);
> -       if (ret)
> -               return dev_err_probe(&pdev->dev, ret, "Failed to enable h=
clk\n");
> -
>         regmap_read(sai->regmap, SAI_VERSION, &sai->version);
> =20
>         ret =3D rockchip_sai_init_dai(sai, res, &dai);
>         if (ret) {
> -               dev_err(&pdev->dev, "Failed to initialize DAI: %d\n", ret=
);
> -               goto err_disable_hclk;
> +               return dev_err_probe(&pdev->dev, ret, "Failed to initiali=
ze DAI\n");
>         }

This would now be a one-line statement in the if branch, so checkpatch will
advise you to remove the redundant { } from the if, so that it becomes

    if (ret)
            return dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI=
\n");

You can run `./scripts/checkpatch.pl` on either a git commit range or a
patch file, and it'll let you know. If you use b4, it'll run that
script with some recommended flags on all commits in your series with
`b4 prep --check`.

> =20
>         ret =3D rockchip_sai_parse_paths(sai, node);
>         if (ret) {
> -               dev_err(&pdev->dev, "Failed to parse paths: %d\n", ret);
> -               goto err_disable_hclk;
> +               return dev_err_probe(&pdev->dev, ret, "Failed to parse pa=
ths\n");
>         }

Same here

> =20
>         /*
> @@ -1475,8 +1469,7 @@ static int rockchip_sai_probe(struct platform_devic=
e *pdev)
>         pm_runtime_get_noresume(&pdev->dev);
>         ret =3D rockchip_sai_runtime_resume(&pdev->dev);
>         if (ret) {
> -               dev_err(&pdev->dev, "Failed to resume device: %pe\n", ERR=
_PTR(ret));
> -               goto err_disable_hclk;
> +               return dev_err_probe(&pdev->dev, ret, "Failed to resume d=
evice\n");
>         }

Same here

> =20
>         ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> @@ -1504,8 +1497,6 @@ static int rockchip_sai_probe(struct platform_devic=
e *pdev)
>         /* If we're !CONFIG_PM, we get -ENOSYS and disable manually */
>         if (pm_runtime_put(&pdev->dev))
>                 rockchip_sai_runtime_suspend(&pdev->dev);
> -err_disable_hclk:
> -       clk_disable_unprepare(sai->hclk);
> =20
>         return ret;
>  }
>=20
> thanks!
>=20
> Pei.

Kind regards,
Nicolas Frattaroli

>=20
> > Other than that, patch tested to be working fine.
> >
> > Kind regards,
> > Nicolas Frattaroli
> >
> >
>=20




