Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4810B1C3308
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271206; cv=none; b=U/x2jQHdVgxTbm6K/zHANFeElNnkvEPzgSS+RqOhpCTRW9as0143Z+F3p+oB04N6xWDoafxoPK3GscTPhHYB4C+r/ewW86o+BodejoOgA3SgqHwbMW2sAnmhrEwaHWf+zLF6S8lpmtpQ1YYFrYA90Y5+dEUOgLLiHpa/nl6kprc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271206; c=relaxed/simple;
	bh=+9ihujGb5O78n4K42LCbT8oRrAiInrc6JHMi60TPOWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aYs2xH1cGA/JL2crbUPdtuxpoFYN+1pCUPxIU1WmrUQz4G9WRmivm8a6tfZzZYXF522BNvp3r5LY+GdHRVrrrDd/FRxwTleVYmzaL+zZjxx9Tle7QMV+NWE+BPk4ryOisuMWAkifXTNpQaymAA5Mj2RiBNKR8hyVCkyyzWIDzr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A6dXvT6u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A6dXvT6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739271203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCfA/JLLSoLn8ch9J9sitGb6Pc3wFs67ivzmN1gGOgI=;
	b=A6dXvT6u1opH/aPN2L2iYHzkBEAyUtivEo8fHlAXTvh61bb2AQggmEDYc3MVYWhul0p7pu
	m79g7fkcucepXP1/xKYjWPkSptGQsXwbbut8EEsK8d9w9DqL+HN99wrx9gyqgv6KCavyXH
	i2crAz5zPqs1+IBDfBvRIfuZs/viqvw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-PAZ6e9EZNZ2pXKEa8QsgIQ-1; Tue, 11 Feb 2025 05:53:21 -0500
X-MC-Unique: PAZ6e9EZNZ2pXKEa8QsgIQ-1
X-Mimecast-MFC-AGG-ID: PAZ6e9EZNZ2pXKEa8QsgIQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4393e8738b3so16218845e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271200; x=1739876000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCfA/JLLSoLn8ch9J9sitGb6Pc3wFs67ivzmN1gGOgI=;
        b=PCxV4Fy8TnuvxFPK5N5c7VcJu0nIyk60PHeJP759v7ZsUeBi3gnp1KA1RXId7hiBeu
         qEpjbYsIsz86xg9ni4jXCGjhd9QztX4qIzOf4cEl24GY6uRPk2ClKKOInbR4eRGbhLbX
         bkSA8FHk3hC26MB2eiiKhBYJR3EG4bEHhECUXRKjchhp1072uB2x3MH0fVVsgSNgKe8M
         MENGuNIxoGCHi7sur9cmHKNUdLCVcPB3JuJOdDvCirVX3WJ7TQxmYbiuvcFy3qfqFYq+
         6mYGyl6kkN550F1xny2CNbbbMB2nBdbXBKnvQJDby7GrzHRegY2MOkkeS4KiAdX8A0fb
         nDyg==
X-Forwarded-Encrypted: i=1; AJvYcCV1FtNuKxzX127AEr8Y3WILnoFoQq31ZU5EI3Z5mTQ71Jvdyoa0fVFwVL8OPKk4jrJHcVwtm4wSczDiYZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8fnEIURHh7pOcBrlJGu0YtOdVJM5n438NG4rO2QnacganuJHL
	Q5xIKyKtnpl6ydP/MfP3easm4Uw4OjnZ4IWsul+BFLYjSGod9EdS8r+3smHKDbvoo0whigjuxp4
	h7AcOt+f0V/3lk6r5prkqvQMNe3OhSbiCkohbfSSFSEzNeEST10R2ejE+P6SxJ9QzIDv+lA==
X-Gm-Gg: ASbGncvg+Ha184/hJo1c55LV76HPSO3H46JATIvo4gje1+nZ3np8QF+H3K+a4VdypPW
	mXRN3btMRAt76laj2cEaPYoaDD8BSd5BOuhJQkjxwTe8/YFG4yLqfP/44MWs/x2ty3YyArLzNxB
	5bRCLqYJd6gZ7Pxr8h72rq+relt/4RRtNCF6778N3mx1ZeygvEKwuDGwJEKzFRVQhui7ANKO/vT
	qnuF5MB1I3OWZZ3fAl+YLndY4oSh6XhDH8sNQTjFw0qa3eLYNY/VrYakWdrEqhQP42BADADUy6X
	qjZUrD4czb9ugPctbacK+0zWZ45oUSLGjHOgAG3DgKN6
X-Received: by 2002:a05:600c:8410:b0:439:5511:c01 with SMTP id 5b1f17b1804b1-43955110dc0mr14757385e9.10.1739271200148;
        Tue, 11 Feb 2025 02:53:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfXJQtt2mlSJu7QX/cjHKviF7AtHF5wgARCvfhZgvtBWe8KZLJyrEPiUoWJ4aqX5S50nFHjQ==
X-Received: by 2002:a05:600c:8410:b0:439:5511:c01 with SMTP id 5b1f17b1804b1-43955110dc0mr14757165e9.10.1739271199710;
        Tue, 11 Feb 2025 02:53:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb88d5e6sm11358390f8f.1.2025.02.11.02.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:53:19 -0800 (PST)
Message-ID: <253e7ad8-7ca9-4375-805b-4311896a8f05@redhat.com>
Date: Tue, 11 Feb 2025 11:53:18 +0100
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
 dri-devel@lists.freedesktop.org, mgi_lnx@matrox.com
References: <alpine.LFD.2.00.2502071401180.14188@pluton.matrox.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <alpine.LFD.2.00.2502071401180.14188@pluton.matrox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/02/2025 20:04, Gwenael Georgeault wrote:
> - Added the new device ID
> - Added new pll algorithm

I pushed it to drm-misc/drm-misc-next.

Thanks

-- 

Jocelyn
> 
> Signed-off-by: Gwenael Georgeault <ggeorgea@matrox.com>
> Co-authored-by: Mamadou Insa Diop <mdiop@matrox.com>
> ---
>   drivers/gpu/drm/mgag200/Makefile          |   1 +
>   drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |   3 +
>   drivers/gpu/drm/mgag200/mgag200_g200eh5.c | 205 ++++++++++++++++++++++
>   4 files changed, 213 insertions(+)
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
> index 069fdd2dc8f6..32cd8ac018c0 100644
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
> +    { PCI_VENDOR_ID_MATROX, 0x53a, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
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
> index 000000000000..2c4265293504
> --- /dev/null
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/limits.h>
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
> +    unsigned long long fdelta = ULLONG_MAX;
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

