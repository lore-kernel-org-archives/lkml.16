Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E071D5176
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590549; cv=none; b=Ro8qX8mi4K1LwMllc0gXxsquI1Te8xOsx9bgTJji0BV7bcBAFGlUu4azsgE3hndQ9sR5RVqj261Zk6VxgArt3SHsbevsxwjjRftXb08OT5t2vphpksVlVpImdApz3EObUW26+ftt3gQy9J00oloxK6JDMsZoBFQt2WxU1ptqKzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590549; c=relaxed/simple;
	bh=PaUoTg+s0DRnpI0cS7URjSeb8QGoW3OPJ42Hi/bmi4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O3e1nyK3Ux+H3Ljw91GVKtJC/ygyLC0uLjGg3JOcTHO4os5B07SEThYxeKoy03/V18TzLB16ezidoIClMS1kIJS9HtcTLgBPB5RCEf44qvKtQRC42suykTLgefLdl4BS5bQB07lI7S6Qhe4v/2XHa3JcO+ytnTS7P3fJf3/C6uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NHwkM/Wb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NHwkM/Wb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738590546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCnbh2rHtvG8ufUpmEcsV5kGVSlh2z7m5Sra0NhDUy4=;
	b=NHwkM/WbpjqIHDTFgMBvimdpDexk/hqBg39TssIbqkCdqBpa+qEaTHD/H3ZgBWOWNhQL75
	XlPc18xZ7EdZBGRblbzjGeaVJuDDP0Jbo71AMOUTzK1uL3q9g6uLSoFYep1ORFYKHv0TM8
	IONYBGsS2oPYAICsSvGox+prQj6gk58=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-PakrxYT0PemHemDc6nTZkw-1; Mon, 03 Feb 2025 08:49:04 -0500
X-MC-Unique: PakrxYT0PemHemDc6nTZkw-1
X-Mimecast-MFC-AGG-ID: PakrxYT0PemHemDc6nTZkw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4388eee7073so23767385e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590543; x=1739195343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCnbh2rHtvG8ufUpmEcsV5kGVSlh2z7m5Sra0NhDUy4=;
        b=PR0c9Nxg5YSUSGmyJYUhzfxyyUXCaTSOkkZVd4yCpOFwwbpip1QGtJUBQ39KTAQikt
         /Cvk8+S0lMq8U2XkvTHGwhUARYO++Bc5PGe5r5EuhXwMjJYdiZ1np56RNYxyoHub7l+t
         Iq9FanBi8kCRj2POBDcTifmX2NgSvuzvBkqbx0cAUdhGfQE+jBN7+toYYlI6pNVDtyb0
         DFuhCmoj6+Ho+0hpZBYZO62dyLmSs299ezPQPnAkXxCizfVhl3zV32vLVn3/oqwh+Jen
         DO1+kLtxHALcHzpnnGAomoPVMyu13TpT6iWYRhhtjJxHqb6ySjnzR0vvM5BXrfTrcc7V
         ipCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO0kNg7ROEO2dZuwtSV5TlPZ913Ux2unsdMZXSyOAf1Zf4OuFNMtQCPJpFMJHmOLtyzVhb/YAlMro2U/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQKwbTvd3gAFeawyV2YyfkcTILqsoNFjgREzgOBky3ngMGqZpV
	Zl6nZtmeZRNdtMAltLtM7vTI+gmpVY31zR10Ufz32M+UVur33j2Aw6jL6aUHS4cDqEGpx8Pustt
	P/57A8qJWis21MJ9Hh0Qr+fcqYahk77LySFqZlt2wO2ScXemdOJhYi32wS7HaIQ+HNOn6ig==
X-Gm-Gg: ASbGnctWvkghIXl9DIZHAgFl5wHJpXdLqagWwFwf9pU64WJq57aTqGdyslLnVXsDkYi
	wkSup0YHGEQ/cj+MPjCIp8fYndCE1otMTGcuB3LK0qXQ+BinXcgI/hi3NCxuLwEN0o7N2JrvNrc
	iFMjAFvOKuxqcBkaOgBo4AKuVgsP+Qbs/2dStjnh+44YNxcyIxB+aYL9OuZAF11LcAjsks6Ufn9
	+3E1f9g0ohajbGIvaqX4vTIiKJuCVMJGjTaEdcgiH5rOuqXcSRHF26VfH5LcL+VCFHrwhyIUTyT
	8o27zxrxas+iKpHKNKR5U3nuGEmz24rm6J6OQblpt0pt
X-Received: by 2002:a05:600c:83c4:b0:436:2155:be54 with SMTP id 5b1f17b1804b1-438e6eaaab1mr106932615e9.1.1738590543046;
        Mon, 03 Feb 2025 05:49:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoALKOFXe9v5uR4kQ76q04gknKbEJgZlj7+pXVLgrpeGK21EvPnNDw1VXjZRv2PdNSQ2rXEQ==
X-Received: by 2002:a05:600c:83c4:b0:436:2155:be54 with SMTP id 5b1f17b1804b1-438e6eaaab1mr106932435e9.1.1738590542560;
        Mon, 03 Feb 2025 05:49:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f492sm154303805e9.38.2025.02.03.05.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:49:02 -0800 (PST)
Message-ID: <6d2e6b82-2ed6-4c78-9f5d-b2f6ba8aebeb@redhat.com>
Date: Mon, 3 Feb 2025 14:49:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Added support for the new device G200eH5
To: Gwenael Georgeault <ggeorgea@matrox.com>,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <alpine.LFD.2.00.2502030802150.30536@pluton.matrox.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <alpine.LFD.2.00.2502030802150.30536@pluton.matrox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/02/2025 14:07, Gwenael Georgeault wrote:
> - Added the new device ID
> - Added new pll algorithm

Hi,

Thanks for this patch.
Overall it looks good, I have a few comments below:

Best regards,

-- 

Jocelyn
> 
> Co-authored-by: Mamadou Insa Diop <mdiop@matrox.com>
> ---
>   drivers/gpu/drm/mgag200/Makefile          |   1 +
>   drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |   7 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh5.c | 212 ++++++++++++++++++++++
>   4 files changed, 222 insertions(+), 2 deletions(-)
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
> index 0608fc63e588..065ba09d109b 100644
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
> @@ -333,11 +334,13 @@ void mgag200_g200eh_pixpllc_atomic_update(struct 
> drm_crtc *crtc, struct drm_atom
>   struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev,
>                           const struct drm_driver *drv);
>   struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
> -                         const struct drm_driver *drv);
> +                        const struct drm_driver *drv);
The alignment was correct, don't modify indentation on lines you don't 
change.

> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
> +                        const struct drm_driver *drv);
>   struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev,
>                           const struct drm_driver *drv);
>   struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
> -                         const struct drm_driver *drv);
> +                        const struct drm_driver *drv);
Here too
> 
>   /*
>    * mgag200_mode.c
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c b/drivers/gpu/ 
> drm/mgag200/mgag200_g200eh5.c
> new file mode 100644
> index 000000000000..5e39504785d8
> --- /dev/null
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/pci.h>
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
> +                    struct drm_atomic_state *new_state)
> +{
> +
> +    static u64 ulVCOMax     = 10000000000ULL;   // units in Hz (10 GHz)
> +    static u64 ulVCOMin     = 2500000000LL;     // units in Hz (2.5 GHz)
> +    static u64 ulPLLFreqRef = 25000000ULL;      // units in Hz (25 MHz)
We don't use type prefix in the kernel, and usually variables are all 
lowercase.

Also those 3 variables don't need to be static. (Used like this, it 
means it will keep it's value when you call this function again, which 
is not needed as they are constant).

> +
> +    struct drm_crtc_state *new_crtc_state = 
> drm_atomic_get_new_crtc_state(new_state, crtc);
> +    struct mgag200_crtc_state *new_mgag200_crtc_state = 
> to_mgag200_crtc_state(new_crtc_state);
> +    long   clock = new_crtc_state->mode.clock;
> +    struct mgag200_pll_values *pixpllc = &new_mgag200_crtc_state->pixpllc;
> +
> +    u64 ulFDelta     = 0xFFFFFFFFFFFFFFFFULL;
> +
> +    u16 ulMultMax    = (u16)(ulVCOMax / ulPLLFreqRef);    // 400 (0x190)
> +    u16 ulMultMin    = (u16)(ulVCOMin / ulPLLFreqRef);    // 100 (0x64)

Here the type prefix is wrong, as it's not an unsigned long. But like 
all variables, just remove the prefix, and rename them to lowercase 
(either multmax or mult_max).

> +
> +    u64 ulFTmpDelta;
> +    u64 ulComputedFo;
> +
> +    u16 ulTestM;
> +    u8  ulTestDivA;
> +    u8  ulTestDivB;
> +    u64 ulFoHz;
> +    int iDone = 0;

iDone is useless, if you find the right parameters, and ulFDelta is 0, 
then you won't find a better solution, because you can't have 
(ulFTmpDelta < ulFDelta).
It's a small optimisation to avoid some loops, but the PLL are 
configured only once, so it's really not worth it.

> +
> +    u8 ucM = 0;
> +    u8 ucN = 0;
> +    u8 ucP = 0;
> +
> +    ulFoHz = (u64)clock * 1000ULL;
> +
> +
> +    for (ulTestM = ulMultMin; ulTestM <= ulMultMax; ulTestM++) { // 
> This gives 100 <= M <= 400
> +        for (ulTestDivA = 8; ulTestDivA > 0; ulTestDivA--) { // This 
> gives 1 <= A <= 8
> +            for (ulTestDivB = 1; ulTestDivB <= ulTestDivA; ulTestDivB++) {
> +                // This gives 1 <= B <= A
> +                ulComputedFo = (ulPLLFreqRef * ulTestM) /
> +                    (4 * ulTestDivA * ulTestDivB);
> +
> +                if (ulComputedFo > ulFoHz)
> +                    ulFTmpDelta = ulComputedFo - ulFoHz;
> +                else
> +                    ulFTmpDelta = ulFoHz - ulComputedFo;
> +
> +                if (ulFTmpDelta < ulFDelta) {
> +                    ulFDelta = ulFTmpDelta;
> +                    ucM = (u8)(0xFF & ulTestM);
> +                    ucN = (u8)(
> +                    (0x7 & (ulTestDivA - 1))
> +                    | (0x70 & (0x7 & (ulTestDivB - 1)) << 4)
> +                    );
> +                    ucP = (u8)(1 & (ulTestM >> 8));
> +                }
> +                if (ulFDelta == 0) {
> +                    iDone = 1;
> +                    break;
> +                }
> +            } // End of DivB if (iDone)
> +            if (iDone)
> +                break;
> +        } // End of DivA Loop
> +
> +        if (iDone)
> +            break;
> +    } // End of M Loop
> +
> +    pixpllc->m = ucM + 1;
> +    pixpllc->n = ucN + 1;
> +    pixpllc->p = ucP + 1;
> +    pixpllc->s = 0;
> +
> +    return 0;
> +    }
> +
> +
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
> +        &mgag200_g200eh5_primary_plane_funcs,
> +        mgag200_primary_plane_formats,
> +        mgag200_primary_plane_formats_size,
> +        mgag200_primary_plane_fmtmods,
> +        DRM_PLANE_TYPE_PRIMARY, NULL);
> +    if (ret) {
> +        drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
> +        return ret;
> +    }
> +    drm_plane_helper_add(primary_plane, 
> &mgag200_g200eh5_primary_plane_helper_funcs);
> +    drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +    ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
> +        &mgag200_g200eh5_crtc_funcs, NULL);
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
> +    const struct drm_driver *drv)
> +{
> +
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
> +        &mgag200_g200eh5_device_funcs);
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

