Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4701719A2A3;
	Sat, 21 Jun 2025 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750504219; cv=none; b=HUIAvyXBZ6jkyRE10RJCHa5tQB9Mz+i+AtTg7vCmxvJt2XSSJIHLEvt5vfDnSRsqNF4XBZo0B7D1pIkYsg8qTyzbE/85446pgUdyFMB+EfpnR4yzqlEQ/IFwQ90IOBQxYOSGjklCSQ7YTK3tJbYix+5swPpRiNS1R/Dl+N7LZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750504219; c=relaxed/simple;
	bh=ldQYMyu30F91c9EamhYo1fhn0ulnE2mF6Pd/xq6bofo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoIOP8QKWDfwQur7xWKXhWWMglAnXiLXBBdgsBnK0JiJ507OAy9RbVLjuE3SZD7nijXzv3J9zyvaxnSMXf3cO9PhJWD6OSnfu34f6T8MXY5Mm9yvvPZ5/a6DCC1oSC2L35MKkrtGfvTkIH7VdGVbU/EuU+qT/7lZ2NUFWGy9u98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpDsmgcz; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpDsmgcz"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32ae3e94e57so18189401fa.1;
        Sat, 21 Jun 2025 04:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504214; x=1751109014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCATkS1iFox8++RsOPPrNMNCnqTikPTJEA4op0lJe48=;
        b=HpDsmgczaW68T59uTfxrSLJHaJbMqOMP6f6tN0D0z8bgFfrG3tvTfYFdLYUcgv7bvj
         4CkAGWo0KddmrIwP1edKzMK7b/grtb0N9kr/AzGlfy3GfO/QCNqvl+VWybChiYBvt/Ck
         BLFdiopEv/PcC6HSKwFYt2ZKDfa6UScwqmNKtTIGFzPIjiuRAKs910J5QVv7IPLk83oo
         RjFR/cSF3ndd3RW1tpgRAgMMZ6NZ+g096j/CgIz9JU3BPsjhPkDL1zR1c5bcmmAp5doQ
         x244ynLOqLMTUJMMyiwXFU2AgTlBGrIyUFmc8opC/kf2e2TiJ3vSPW55jepN6BF5AS9x
         A7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504214; x=1751109014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCATkS1iFox8++RsOPPrNMNCnqTikPTJEA4op0lJe48=;
        b=kJCftfyll/pg1PzzfmQnHVt4s3MGpOI5PHRlwyf7T2IqdIVOhoAobPNVPh6+RhR/d9
         UN4q5/qtp1Z9QfJnCquNhQkn5xYZAdascK9Qeyv0Zg7fEto6hilCpSMvhyq78zIF5pnH
         MyLCRZQzLRa5ernaFWWhtCXd0+7QjRH//zUqrbc5rwB10IDKU1fNz3HVcIGBKaILHEvH
         RMQZG0FsDUgwrAnmh45jQWnEKZ8vh8d0GuDfn3xQptwmUTSt64kAhZhXZ3RZfsi+Bfsj
         T8rLariUJosZDRQZQauCwwIVZ1/3CgbUcm0GvkaSImSglTz293YgF3laJseoTY5AYjC9
         PqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV01pxZT8EawnN36q9mOzO/J+2FVKgslGJYZhy9r2M9woUvUIt0OVkTYKPUAHAvN0Quehw27ozXcUgU@vger.kernel.org, AJvYcCXiKRRo1U0fIAZsmSwmjAPUKQ5sAh5XcUGKF/ar8Map4B7OsfDP/skyE9bZ6YxFWqaBWSIIa8yxZa7JKpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2uw6MeXcp7UNoAjD7Z3abHVGE99uHZmCO45g0XvFvcfqDCGuP
	25uQNra0NaGvDShzhCCzgvCXCXaZvhrDC10ee4CFJD6Tk2drtR8z/WPOe1G8sEQaXGpLOwzPx/U
	qeVI9EFWiFXGU3QwPdnYWdmFprjskuL4=
X-Gm-Gg: ASbGncuMQkmGKGWcCo5HcVkRV0i21whhEQkeFRJpNIEA204Z7JU3h9q9EGKFLFDdm1y
	xfeJTsRLdUBSDdm0aj8X35GHyIrfDr9m5M6EmvtjB3gE1zgVB/Fq3Uv1WIMmDv+DxjI1pdaTEJJ
	ri7+C7ogFODuoXBKJs5qnGLkMaqMnBMuDcFqjz8OvCCQ==
X-Google-Smtp-Source: AGHT+IEcRGbY27V9LDU9tTnEdUHT83kyWethAu8wzs4LLENYLbhYvB5hnKQ7sgV1vRFpPAr2Hsu1cGDkxrJ4lWmqN84=
X-Received: by 2002:a05:6512:3b29:b0:553:399d:58e6 with SMTP id
 2adb3069b0e04-553e3bf3e68mr2312939e87.31.1750504213974; Sat, 21 Jun 2025
 04:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr> <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
In-Reply-To: <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sat, 21 Jun 2025 16:09:57 +0500
X-Gm-Features: AX0GCFvJVISjqcev-lDUZRK6hgKmzgeZVy_yG5gOpNIHjCrFRLOu9HQsvLYwb18
Message-ID: <CACzwLxiybz489fCY3+CSbU1=yPR7mKXCbDadK1E-p25onDAGkw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
To: nicolas.bouchinet@oss.cyber.gouv.fr
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Kannappan R <r.kannappan@intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Pawel Laszczak <pawell@cadence.com>, Ma Ke <make_ruc2021@163.com>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>, 
	Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>, 
	Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 7:27=E2=80=AFPM <nicolas.bouchinet@oss.cyber.gouv.f=
r> wrote:
>
> From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>
> Plugs the usb authentication implementation in the usb stack and more
> particularly in the usb_parse_configuration function after the BOS has
> been parsed and the usb authentication capacity has been controlled.
>
> The authentication bulk is implemented by the usb_authenticate_device
> function.
>
> The authorization decision enforcement is done via the authorized field o=
f
> the usb_device and the associated authorization and deauthorization funct=
ions.
> The usb_device also contains an authenticated field that could be used to=
 track
> the result of the authentication process and allow for more complex secur=
ity
> policy: the user could manually authorize a device that failed the
> authentication or manually deauthorize a device that was previously
> authenticated.
>
> The usb_authenticate_device returns 0 or an error code. If 0 is
> returned, the authorized and authenticated fields of the usb_device are
> updated with the result of the authentication.
>
> Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> ---
>  drivers/usb/core/config.c | 51 +++++++++++++++++++++++++++++++++++++++++=
+++++-
>  drivers/usb/core/hub.c    |  6 ++++++
>  drivers/usb/core/usb.c    |  5 +++++
>  include/linux/usb.h       |  2 ++
>  4 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 13bd4ec4ea5f7a6fef615b6f50b1acb3bbe44ba4..45ee8e93e263c41f1bf4271be=
4e69ccfcac3f650 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -14,6 +14,7 @@
>  #include <asm/byteorder.h>
>  #include "usb.h"
>
> +#include "authent.h"
>
>  #define USB_MAXALTSETTING              128     /* Hard limit */
>
> @@ -824,7 +825,50 @@ static int usb_parse_configuration(struct usb_device=
 *dev, int cfgidx,
>                 kref_init(&intfc->ref);
>         }
>
> -       /* FIXME: parse the BOS descriptor */
> +       /* If device USB version is above 2.0, get BOS descriptor */
> +       /*
> +        * Requirement for bcdUSB >=3D 2.10 is defined in USB 3.2 =C2=A79=
.2.6.6
> +        * "Devices with a value of at least 0210H in the bcdUSB field of=
 their
> +        * device descriptor shall support GetDescriptor (BOS Descriptor)=
 requests."
> +        *
> +        * To discuss, BOS request could be also sent for bcdUSB >=3D 0x0=
201
> +        */
> +       // Set a default value for authenticated at true in order not to =
block devices
> +       // that do not support the authentication
> +       dev->authenticated =3D 1;
> +
> +       if (le16_to_cpu(dev->descriptor.bcdUSB) >=3D 0x0201) {
> +               pr_notice("bcdUSB >=3D 0x0201\n");
> +               retval =3D usb_get_bos_descriptor(dev);
> +               if (!retval) {
> +                       pr_notice("found BOS\n");
> +#ifdef CONFIG_USB_AUTHENTICATION
> +                       if (dev->bos->authent_cap) {
> +                               /* If authentication cap is present, star=
t device authent */
> +                               pr_notice("found Authent BOS\n");
> +                               retval =3D usb_authenticate_device(dev);
> +                               if (retval !=3D 0) {
> +                                       pr_err("failed to authenticate th=
e device: %d\n",
> +                                              retval);
> +                               } else if (!dev->authenticated) {
> +                                       pr_notice("device has been reject=
ed\n");
> +                                       // return early from the configur=
ation process
> +                                       return 0;

Returning 0 after rejecting a device leaves udev half-initialised and still
linked in usb_bus_type (the hub driver only aborts after this call).
The next hot-plug may oops on dangling pointers.
Please consider returning -EPERM instead of 0.

> +                               } else {
> +                                       pr_notice("device has been author=
ized\n");
> +                               }
> +                       } else {
> +                               // USB authentication unsupported
> +                               // Apply security policy on failed device=
s
> +                               pr_notice("no authentication capability\n=
");
> +                       }
> +#endif
> +               } else {
> +                       // Older USB version, authentication not supporte=
d
> +                       // Apply security policy on failed devices
> +                       pr_notice("device does not have a BOS descriptor\=
n");
> +               }
> +       }
>
>         /* Skip over any Class Specific or Vendor Specific descriptors;
>          * find the first interface descriptor */
> @@ -1051,6 +1095,7 @@ int usb_get_bos_descriptor(struct usb_device *dev)
>         length =3D bos->bLength;
>         total_len =3D le16_to_cpu(bos->wTotalLength);
>         num =3D bos->bNumDeviceCaps;
> +
>         kfree(bos);
>         if (total_len < length)
>                 return -EINVAL;
> @@ -1122,6 +1167,10 @@ int usb_get_bos_descriptor(struct usb_device *dev)
>                         dev->bos->ptm_cap =3D
>                                 (struct usb_ptm_cap_descriptor *)buffer;
>                         break;
> +               case USB_AUTHENT_CAP_TYPE:
> +                       dev->bos->authent_cap =3D
> +                               (struct usb_authent_cap_descriptor *)buff=
er;
> +                       break;
>                 default:
>                         break;
>                 }
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 0e1dd6ef60a719f59a22d86caeb20f86991b5b29..753e55155ea34a7739b5f530d=
ad429534e60842d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2640,6 +2640,12 @@ int usb_new_device(struct usb_device *udev)
>         udev->dev.devt =3D MKDEV(USB_DEVICE_MAJOR,
>                         (((udev->bus->busnum-1) * 128) + (udev->devnum-1)=
));
>
> +       // TODO: Check the device state, we want to avoid semi-initialize=
d device to userspace.
> +       if (!udev->authenticated) {
> +               // If the device is not authenticated, abort the procedur=
e
> +               goto fail;
> +       }
> +
>         /* Tell the world! */
>         announce_device(udev);
>
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 0b4685aad2d50337f3cacb2198c95a68ae8eff86..76847c01d3493e2527992a3bb=
927422519d9a974 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -46,6 +46,7 @@
>  #include <linux/dma-mapping.h>
>
>  #include "hub.h"
> +#include "authent_netlink.h"
>
>  const char *usbcore_name =3D "usbcore";
>
> @@ -1080,6 +1081,10 @@ static int __init usb_init(void)
>         usb_debugfs_init();
>
>         usb_acpi_register();
> +
> +       // TODO : check error case
> +       usb_auth_init_netlink();
> +
>         retval =3D bus_register(&usb_bus_type);
>         if (retval)
>                 goto bus_register_failed;
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index b46738701f8dc46085f251379873b6a8a008d99d..e9037c8120b43556f8610f9ac=
b3ad4129e847b98 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -431,6 +431,8 @@ struct usb_host_bos {
>         struct usb_ssp_cap_descriptor   *ssp_cap;
>         struct usb_ss_container_id_descriptor   *ss_id;
>         struct usb_ptm_cap_descriptor   *ptm_cap;
> +       /* Authentication capability */
> +       struct usb_authent_cap_descriptor *authent_cap;
>  };
>
>  int __usb_get_extra_descriptor(char *buffer, unsigned size,
>
> --
> 2.50.0
>
