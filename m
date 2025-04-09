Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A711D7999
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179589; cv=none; b=NGp79kExe6Z/1ZomYE6K4idcaTXayKNktBH99ReYJ9zzZScDJkTqugg2U7r8qVZXjyGDOkIgPdjCtQuStdj8UacgvMANMhCRlw0+qxPy1YD4wv2W8ihDbU9uvJ5FShrr52pbE24rNEP1dCB5p8UTOQIWBAIxrQdujrlIR+GELhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179589; c=relaxed/simple;
	bh=Dsos4Eph2hyrXoTpRMexeLNWHl9vYmg+WAx8jemvLdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRmJ9Az4rdrLh1+2qU68Y21BNalLpy4T7XMRhgSTUEQiogEzVnQCDfRCUbLpvSpU9y92g/6kxNsN9CukB/kTu0bT3Wt/3loo/uYT8IKnsEE+lHtEqTHK4JX3tcGNGLmDj1svKUikXaXevkEbNRoAG6LGVYelS1a2DAksi+DUXHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SSbdmMbA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SSbdmMbA"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so7954606e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744179586; x=1744784386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=;
        b=SSbdmMbAr9Wlz1uKVY1UYyheVxbLN9Io90AzlObkGV9TgmT+HDwSiJe4Yaa70i0YNC
         0W0lLj2Bq+Rc8RsLkSq86d6oqvLuztpe1JiSRfDW98mIOIqorwUYN4pQkj10jrDHmUME
         kOfNgR8hv94PXKPd4oK0od3ODJWK2ZHRActBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179586; x=1744784386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=;
        b=f3Pfd2Mex0cyVNPzGkxDaFSTJVtN6i/0cHtnwPauSU9rmUxeFT9fBXD8hNBrW92hJ3
         veOxgRG7rfRGT2pgsVHqaP5Y7fwPtIZE/uW2VTG+Py7mWvXykn+0rGCV8GkRz1q8HL3z
         NXRMaCisJ3ZGo9LzVnzXyetwYMt2VLjQFXBiY2hY3DQq5uCuERi7VYqp5AbLuUNp9tcn
         1uPkVv7RMiNGSJKHNev2sy6yWKpLPe4+58frgVdCBrz9YryCXQjyE7jurB10MYl2eiOJ
         pDuvgrZ1+30ExiOOfMPYJy4sp/WvCRiK8sQ8TCEpn1ujILCP9gAGhk8UmW1anflc0KKb
         KaTw==
X-Forwarded-Encrypted: i=1; AJvYcCU2mW66lrqj626GsK2ClpLOmuPB88/0JtpYVl3voScwVMkOGyMLjBjb7pPBXs4OcLrZQu/gCWRHdQa5o08=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzRyzpMhSZ5AVL005AZG4M9W4DmdSiyHF5QAf8MNsRg3itr0HU
	FskZrS45yMQkNJIQ4ad2aGiSV+0f1oiQ8fTsm7pMcTdDyCMSpugeQ/JU0yCboMQAOuazB2Z8sgV
	ffH3D7omHMzcFkCCGvv3n7waeQqew8QR/SkJm
X-Gm-Gg: ASbGncv2g0iIel5DLH6nE4rNozVHBWbgrvQP5JCj+XsjcEY7c/YLTBf/FOw+2ak+I02
	hQIwAryudJ9ZMYvEopCoj5Uqq+j5jvtLaUmpDld+02M/O+a2dljqk32uLydZeZo6j5iq7Nwbms2
	Cx5YUEetSoVRQlCrpO60sOFG3VSGTLe+jWRJ7jp5htf+8RARdK/w==
X-Google-Smtp-Source: AGHT+IF6USYpAM9lg3k8+AOqxfZjq6iN1XgABgZ7lN+hrkpyKB/hsy6JujD3QodyEr1gyD8+wAk4r3Qa2Kqqw1r74QQ=
X-Received: by 2002:a05:6512:1103:b0:545:49d:5474 with SMTP id
 2adb3069b0e04-54c4370f307mr358171e87.20.1744179585702; Tue, 08 Apr 2025
 23:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403110915.75322-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250403110915.75322-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 9 Apr 2025 14:19:34 +0800
X-Gm-Features: ATxdqUGA8j7J3cMwwhvKkgHKxtLogzcNaUx9TtG6kN-tP3TulVKQHf_ux6bE6j8
Message-ID: <CAGXv+5G8kUg87+JzuCW5sZKHTBA3-CnwSFdrucn_k1rgcpJHOg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
	bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 7:09=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> During probe, this driver is registering two platform devices: one
> for the HDMI Codec driver and one for the DisplayPort PHY driver.
>
> In the probe function, none of the error cases are unregistering
> any of the two platform devices and this may cause registration
> of multiple instances of those in case this driver returns one or
> more probe deferral(s) in the "wrong" spots.
>
> In order to fix this, add devm actions to unregister those and
> remove the manual calls to platform_device_unregister in the
> mtk_dp_remove() function, as those would otherwise be redundant.
>
> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayP=
ort aux-bus")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 3d4648d2e15f..3eb685a46d99 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2648,6 +2648,13 @@ static const struct hdmi_codec_ops mtk_dp_audio_co=
dec_ops =3D {
>         .hook_plugged_cb =3D mtk_dp_audio_hook_plugged_cb,
>  };
>
> +static void mtk_dp_unregister_pdevs(void *data)
> +{
> +       struct platform_device *ext_pdev =3D data;
> +
> +       platform_device_unregister(ext_pdev);
> +}
> +
>  static int mtk_dp_register_audio_driver(struct device *dev)
>  {
>         struct mtk_dp *mtk_dp =3D dev_get_drvdata(dev);
> @@ -2658,18 +2665,29 @@ static int mtk_dp_register_audio_driver(struct de=
vice *dev)
>                 .data =3D mtk_dp,
>                 .no_capture_mute =3D 1,
>         };
> +       int ret;
>
>         mtk_dp->audio_pdev =3D platform_device_register_data(dev,
>                                                            HDMI_CODEC_DRV=
_NAME,
>                                                            PLATFORM_DEVID=
_AUTO,
>                                                            &codec_data,
>                                                            sizeof(codec_d=
ata));
> -       return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
> +       if (IS_ERR(mtk_dp->audio_pdev))
> +               return PTR_ERR(mtk_dp->audio_pdev);
> +
> +       ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mt=
k_dp->phy_dev);

Wrong platform device given here. You want audio_pdev instead.


Having briefly looked at this driver, I think it needs more cleanup. :o


ChenYu

> +       if (ret) {
> +               platform_device_unregister(mtk_dp->audio_pdev);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to add codec unregister devm=
 action");
> +       }
> +       return 0;
>  }
>
>  static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
>  {
>         struct device *dev =3D mtk_dp->dev;
> +       int ret;
>
>         mtk_dp->phy_dev =3D platform_device_register_data(dev, "mediatek-=
dp-phy",
>                                                         PLATFORM_DEVID_AU=
TO,
> @@ -2679,6 +2697,13 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_=
dp)
>                 return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
>                                      "Failed to create device mediatek-dp=
-phy\n");
>
> +       ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mt=
k_dp->phy_dev);
> +       if (ret) {
> +               platform_device_unregister(mtk_dp->phy_dev);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to add phy unregister devm a=
ction");
> +       }
> +
>         mtk_dp_get_calibration_data(mtk_dp);
>
>         mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
> @@ -2848,9 +2873,6 @@ static void mtk_dp_remove(struct platform_device *p=
dev)
>         pm_runtime_disable(&pdev->dev);
>         if (mtk_dp->data->bridge_type !=3D DRM_MODE_CONNECTOR_eDP)
>                 del_timer_sync(&mtk_dp->debounce_timer);
> -       platform_device_unregister(mtk_dp->phy_dev);
> -       if (mtk_dp->audio_pdev)
> -               platform_device_unregister(mtk_dp->audio_pdev);
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> --
> 2.48.1
>
