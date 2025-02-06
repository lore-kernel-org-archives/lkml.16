Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7C22F3BF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840178; cv=none; b=bf48V0TKtsRCgtAeD3kBHSCZkYDAbqHR/LcAzc1iI3Myy0WnmfHQ4dt6q9NCvgiANMuSZcTbz3MwTi112aqzc+1r9UPhnIP6GBUjGT8I12Efpu7kQZYUWlaaIGGWWcKssJqo3RG4koz38/ZTR8fC3NAjp9DZWk28GppOa+OAgak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840178; c=relaxed/simple;
	bh=d0un1LuLw7HMSErt4NnkoGmTmHtLreuFsAmfu1Z1cbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uxEZHJh0XySQoeIMtJoaLXCdCMTENQiF/IOt2aGZT2vJVXAev4Kt7o3LEdGn4Ndw9Hbge53DSwy4g2Q1yd2X49cJ7dB/JV4xeg683T3crds6hYaWIsz1sgnx6ZeAtNaTDkqI7PMq+Z76CtqxXlkV/omJuymZTsGmUF1njZ7FoxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oaoa2Qg8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oaoa2Qg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738840175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfMgTRg1Wc9WHtz5P8mj3g+grMwMYX6N1F/GiRx1ByE=;
	b=Oaoa2Qg8OUezjF8Xo4eqI8HXg/kEZl8Wuux/Cm12xWSxM2X71xYImXA4mDUePWD6DqtAzU
	dSdm5NKF4DlcNZyf/bxZdMVAsr3fuiYDyfpX+tPnkQS46Tw0VBK5M2g8vojjRELXxTzCtb
	UT8MBH5pJPEcm0rJCKFkXG/+Mr9UU6M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-DwaOWpkvOySCTawi56lODg-1; Thu, 06 Feb 2025 06:09:34 -0500
X-MC-Unique: DwaOWpkvOySCTawi56lODg-1
X-Mimecast-MFC-AGG-ID: DwaOWpkvOySCTawi56lODg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4362153dcd6so4207535e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 03:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738840173; x=1739444973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfMgTRg1Wc9WHtz5P8mj3g+grMwMYX6N1F/GiRx1ByE=;
        b=Zg/utvI3nPC1v6HXLyV4AE+5T33uhhRgo0dRZXZMc1IN3+5yWpdh0+Nt/XSdC07U9b
         w/Gw/ue6L2HujMbZTqZarBVTN+CX5aaL3FrmTaKSOvEcEopKWiac2mFIvu0kwuZC4x0d
         7bQTidESxMrXlL+UJ3NE1itgGKjmeQ/xheJPFGkJY/HFoDKf6vLoVjYOW2VNs/h5euuj
         FtsmP5sd6AIQ2HvrWrEXlsjyYXmglGm/f11fG8cvL5X2HLPra3uJkBAGvW0wUnB5lOMY
         Rdl5eaF1G8Zm1/K2vNU9ZdktFZjsvbR8D3mIBM70uakyPDTfdCEZRY/Vm4+aKS2v87rp
         f45A==
X-Forwarded-Encrypted: i=1; AJvYcCVU6FffvJTS5AskWci90VUtareAIXXyNL0AH0PU2bjOs2skcg6V7lmADFA+9pz7HTG9LwFy+J8T2gj+ty0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbqt9PVkg9I0F80Qgx1GVGUfP0OJ5a1TREmTorOzIlsROB7pkV
	tpET131l/hvPdVlpQEsvZ/V5N80oWNTzR37xmVPvW5pZ5MdZA+dx/xwI7mBdRDRp6qIhl0hfQfv
	0FEyOl2oJjvu9heALc3HzIoyaugaRLeMHlfjMM7gshOnOdVZI5trMQwst+Vx6hw==
X-Gm-Gg: ASbGncuS9CC3JRPOiotz8+BJB3zzjbOKQsdl+BVbYMoyU8l1Sx/TYFkd1qeAhxFR48D
	GYhJAsD1pXMAEZLOnysuuWgQie6I+zPNamLRRMFPbK64HNo4JAD/0KHvJNfQdSXQ7vUmCJeRm+H
	m60gUsBTIj1l4ze6c4OkSH2Nhz1ppeOx9kza2Bo8jjbjrOkudXcKsaOttVG6lxE8OdNDUuTLZvI
	dTO4qvXGkYMDYMzp26dV4q6JnDFTtGDf0YIEB/S8sbpO35qI0oLs2uKFm36chTz7WUBkR4mOCf/
	q/jUDTljlN22tcHluGifwtm+/vEjLSwUdWm6kCq9pyco
X-Received: by 2002:a05:600c:1f8f:b0:436:488f:50a with SMTP id 5b1f17b1804b1-4390d43f16cmr48918605e9.17.1738840173074;
        Thu, 06 Feb 2025 03:09:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGunR/KekI/1dih4z71pcgMTvSxo3bFqVMi448h2fuXoJYCNEcHgyKBPgWUe1fMO1SZRFyE1Q==
X-Received: by 2002:a05:600c:1f8f:b0:436:488f:50a with SMTP id 5b1f17b1804b1-4390d43f16cmr48918255e9.17.1738840172631;
        Thu, 06 Feb 2025 03:09:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm52371415e9.3.2025.02.06.03.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 03:09:31 -0800 (PST)
Message-ID: <cd58f577-70d8-40a9-888a-6e459298034b@redhat.com>
Date: Thu, 6 Feb 2025 12:09:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Added support for the new device G200eH5
To: Gwenael Georgeault <ggeorgea@matrox.com>, Dave Airlie
 <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <alpine.LFD.2.00.2502051724170.31360@pluton.matrox.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <alpine.LFD.2.00.2502051724170.31360@pluton.matrox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks a lot for this rework.

When sending a new version of your patch, you can use "git send-email 
-v2" to show that it's the second version of this patch.


On 05/02/2025 23:28, Gwenael Georgeault wrote:
> - Added the new device ID
> - Added new pll algorithm
> 
> Co-authored-by: Mamadou Insa Diop <mdiop@matrox.com>

You're missing your Signed-off-by line.
You can use git commit -s --amend to add it automatically

Also there are some spurious spaces added to your patch context, which 
makes git am failed. I just replaced all occurences of "0x0A 0x20 0x20" 
with "0x0A 0x20" and that fixed it.

I still have a few comments below:

> ---
>   drivers/gpu/drm/mgag200/Makefile          |   1 +
>   drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |   3 +
>   drivers/gpu/drm/mgag200/mgag200_g200eh5.c | 202 ++++++++++++++++++++++
>   4 files changed, 210 insertions(+)
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> 
> diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/ 
> Makefile
> index 5a02203fad12..94f063c8722a 100644
> --- a/drivers/gpu/drm/mgag200/Makefile
> +++ b/drivers/gpu/drm/mgag200/Makefile
> @@ -6,6 +6,7 @@ mgag200-y := \
>       mgag200_g200.o \
>       mgag200_g200eh.o \
>       mgag200_g200eh3.o \
> +    mgag200_g200eh5.o \
>       mgag200_g200er.o \
>       mgag200_g200ev.o \
>       mgag200_g200ew3.o \
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/ 
> mgag200/mgag200_drv.c
> index 069fdd2dc8f6..1c257f5b5136 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -214,6 +214,7 @@ static const struct pci_device_id 
> mgag200_pciidlist[] = {
>       { PCI_VENDOR_ID_MATROX, 0x534, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_ER },
>       { PCI_VENDOR_ID_MATROX, 0x536, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EW3 },
>       { PCI_VENDOR_ID_MATROX, 0x538, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EH3 },
> +    { PCI_VENDOR_ID_MATROX, 0x53A, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EH5 },
>       {0,}
>   };
> 
> @@ -256,6 +257,9 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct 
> pci_device_id *ent)
>       case G200_EH3:
>           mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver);
>           break;
> +    case G200_EH5:
> +        mdev = mgag200_g200eh5_device_create(pdev, &mgag200_driver);
> +        break;
>       case G200_ER:
>           mdev = mgag200_g200er_device_create(pdev, &mgag200_driver);
>           break;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/ 
> mgag200/mgag200_drv.h
> index 0608fc63e588..819a7e9381e3 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -196,6 +196,7 @@ enum mga_type {
>       G200_EV,
>       G200_EH,
>       G200_EH3,
> +    G200_EH5,
>       G200_ER,
>       G200_EW3,
>   };
> @@ -334,6 +335,8 @@ struct mga_device 
> *mgag200_g200eh_device_create(struct pci_dev *pdev,
>                           const struct drm_driver *drv);
>   struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
>                            const struct drm_driver *drv);
> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
> +                         const struct drm_driver *drv);
>   struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev,
>                           const struct drm_driver *drv);
>   struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c b/drivers/gpu/ 
> drm/mgag200/mgag200_g200eh5.c
> new file mode 100644
> index 000000000000..8cb01116ac33
> --- /dev/null
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0-only

There should be an empty line between the license and the first include 
statement.

> +#include <linux/pci.h>
> +#include <linux/units.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "mgag200_drv.h"
> +
> +/*
> + * PIXPLLC
> + */
> +
> +static int mgag200_g200eh5_pixpllc_atomic_check(struct drm_crtc *crtc,
> +                        struct drm_atomic_state *new_state)
> +{
> +    const unsigned long long VCO_MAX = 10 * GIGA; // Hz
> +    const unsigned long long VCO_MIN = 2500 * MEGA; // Hz
> +    const unsigned long long PLL_FREQ_REF = 25 * MEGA; // Hz
> +
> +    struct drm_crtc_state *new_crtc_state = 
> drm_atomic_get_new_crtc_state(new_state, crtc);
> +    struct mgag200_crtc_state *new_mgag200_crtc_state = 
> to_mgag200_crtc_state(new_crtc_state);
> +    long clock = new_crtc_state->mode.clock;
> +    struct mgag200_pll_values *pixpllc = &new_mgag200_crtc_state->pixpllc;
> +
> +    unsigned long long fdelta = 0xFFFFFFFFFFFFFFFFULL;

You can use ULLONG_MAX here instead.
> +
> +    u16 mult_max = (u16)(VCO_MAX / PLL_FREQ_REF); // 400 (0x190)
> +    u16 mult_min = (u16)(VCO_MIN / PLL_FREQ_REF); // 100 (0x64)
> +
> +    u64 ftmp_delta;
> +    u64 computed_fo;
> +
> +    u16 test_m;
> +    u8 test_div_a;
> +    u8 test_div_b;
> +    u64 fo_hz;
> +
> +    u8 uc_m = 0;
> +    u8 uc_n = 0;
> +    u8 uc_p = 0;
> +
> +    fo_hz = (u64)clock * HZ_PER_KHZ;
> +
> +    for (test_m = mult_min; test_m <= mult_max; test_m++) { // This 
> gives 100 <= M <= 400
> +        for (test_div_a = 8; test_div_a > 0; test_div_a--) { // This 
> gives 1 <= A <= 8
> +            for (test_div_b = 1; test_div_b <= test_div_a; test_div_b++) {
> +                // This gives 1 <= B <= A
> +                computed_fo = (PLL_FREQ_REF * test_m) /
> +                    (4 * test_div_a * test_div_b);
> +
> +                if (computed_fo > fo_hz)
> +                    ftmp_delta = computed_fo - fo_hz;
> +                else
> +                    ftmp_delta = fo_hz - computed_fo;
> +
> +                if (ftmp_delta < fdelta) {
> +                    fdelta = ftmp_delta;
> +                    uc_m = (u8)(0xFF & test_m);
> +                    uc_n = (u8)((0x7 & (test_div_a - 1))
> +                        | (0x70 & (0x7 & (test_div_b - 1)) << 4));
> +                    uc_p = (u8)(1 & (test_m >> 8));
> +                }
> +                if (fdelta == 0)
> +                    break;
> +            }
> +            if (fdelta == 0)
> +                break;
> +        }
> +        if (fdelta == 0)
> +            break;
> +    }
> +
> +    pixpllc->m = uc_m + 1;
> +    pixpllc->n = uc_n + 1;
> +    pixpllc->p = uc_p + 1;
> +    pixpllc->s = 0;
> +
> +    return 0;
> +    }
> +
> +/*
> + * Mode-setting pipeline
> + */
> +
> +static const struct drm_plane_helper_funcs 
> mgag200_g200eh5_primary_plane_helper_funcs = {
> +    MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
> +};
> +
> +static const struct drm_plane_funcs mgag200_g200eh5_primary_plane_funcs 
> = {
> +    MGAG200_PRIMARY_PLANE_FUNCS,
> +};
> +
> +static const struct drm_crtc_helper_funcs 
> mgag200_g200eh5_crtc_helper_funcs = {
> +    MGAG200_CRTC_HELPER_FUNCS,
> +};
> +
> +static const struct drm_crtc_funcs mgag200_g200eh5_crtc_funcs = {
> +    MGAG200_CRTC_FUNCS,
> +};
> +
> +static int mgag200_g200eh5_pipeline_init(struct mga_device *mdev)
> +{
> +    struct drm_device *dev = &mdev->base;
> +    struct drm_plane *primary_plane = &mdev->primary_plane;
> +    struct drm_crtc *crtc = &mdev->crtc;
> +    int ret;
> +
> +    ret = drm_universal_plane_init(dev, primary_plane, 0,
> +                       &mgag200_g200eh5_primary_plane_funcs,
> +                       mgag200_primary_plane_formats,
> +                       mgag200_primary_plane_formats_size,
> +                       mgag200_primary_plane_fmtmods,
> +                       DRM_PLANE_TYPE_PRIMARY, NULL);
> +    if (ret) {
> +        drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
> +        return ret;
> +    }
> +    drm_plane_helper_add(primary_plane, 
> &mgag200_g200eh5_primary_plane_helper_funcs);
> +    drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +    ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
> +                    &mgag200_g200eh5_crtc_funcs, NULL);
> +    if (ret) {
> +        drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
> +        return ret;
> +    }
> +
> +    drm_crtc_helper_add(crtc, &mgag200_g200eh5_crtc_helper_funcs);
> +
> +    /* FIXME: legacy gamma tables, but atomic gamma doesn't work 
> without */
> +    drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
> +    drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
> +    ret = mgag200_vga_bmc_output_init(mdev);
> +
> +    if (ret)
> +        return ret;
> +
> +    return 0;
> +}
> +
> +/*
> + * DRM device
> + */
> +
> +static const struct mgag200_device_info mgag200_g200eh5_device_info =
> +    MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 0, false);
> +
> +static const struct mgag200_device_funcs mgag200_g200eh5_device_funcs = {
> +    .pixpllc_atomic_check = mgag200_g200eh5_pixpllc_atomic_check,
> +    .pixpllc_atomic_update = mgag200_g200eh_pixpllc_atomic_update, // 
> same as G200EH
> +};
> +
> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
> +                         const struct drm_driver *drv)
> +{
> +    struct mga_device *mdev;
> +    struct drm_device *dev;
> +    resource_size_t vram_available;
> +    int ret;
> +
> +    mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
> +
> +    if (IS_ERR(mdev))
> +        return mdev;
> +    dev = &mdev->base;
> +
> +    pci_set_drvdata(pdev, dev);
> +
> +    ret = mgag200_init_pci_options(pdev, 0x00000120, 0x0000b000);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_device_preinit(mdev);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_device_init(mdev, &mgag200_g200eh5_device_info,
> +                  &mgag200_g200eh5_device_funcs);
> +
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    mgag200_g200eh_init_registers(mdev); // same as G200EH
> +    vram_available = mgag200_device_probe_vram(mdev);
> +
> +    ret = mgag200_mode_config_init(mdev, vram_available);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_g200eh5_pipeline_init(mdev);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    drm_mode_config_reset(dev);
> +    drm_kms_helper_poll_init(dev);
> +
> +    return mdev;
> +}

