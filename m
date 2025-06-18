Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5C2F4314
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750273105; cv=none; b=nMTeJyZDKFGmAkmd6DdRfcng1zE6sxUAMQyraNgeRZS/b/at35Ba/h2ajeU2ZXYBK/Lv7E9IrbmNJbjoVdjdCc7VFND/0CGP1h83sBnh+e5tvowJJf2hP1AkqZPxSvX628+2pSFldVC2SUD7rZF7bBaraav/7JblM+szl/qPaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750273105; c=relaxed/simple;
	bh=v/wrVBdc/cdLMr2StNygjQifKGT//wKvIc86r/goIT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6ZpHz3yHh0byftREqhADDdlai+1ctH7xi7Ca4nDHCY5TPACA3VZVHWebs9TBPXi8Ol0ZHUhgVGmqQuYdhsKxQul1nDUYpHuZjTwKFcEG2S+/DBO10+hEFfMp0vBTqzjE0WCv/4EqXGiu/QqtZv7pD3EdBYpIuzpVjAImvPIGGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NgNTGDgx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NgNTGDgx"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553d52cb80dso944315e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750273100; x=1750877900; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d1SfNpeyWXhxKz6xUZHfg4gP5Y8d7ButdePpS/F1OHg=;
        b=NgNTGDgx7791idV8TC3GfcB8Q8vJcw2HVozM4edGXJ0TM/aPl0jTSIi8Qfhgw9aH2Y
         iqCTp+UkGaqEkxLblKYsB0Xp8qfzXEgnjGUSJzzZnGV9K6m5xaHoLGsKHWz+udHeWUki
         UWE/zoEFSPU33IKJNxtrnPZZafeE8yOKZrWa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750273100; x=1750877900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1SfNpeyWXhxKz6xUZHfg4gP5Y8d7ButdePpS/F1OHg=;
        b=RRoN9UViKY+cOAEkra2/TmK8xXTG8XuSrGmKgPZTzGgOIwMnQIFxph305yvE08M7aK
         gh6uqz9KsyWhH91rqUWo8vGReJ306SNlwfXbf71RauQcn5/h1YmvtjKcRX4SnKRtovw1
         xWodyOheI77FAKeyhD3pWuk+cDP/gZFtkuPuQFA1QtnqxOxahbhUAPRuCEnpcT+YeTl5
         yxKr4P0/YiE2B1OkXE5yY+XFJcf+2mvL1ohY//ngu5v2lDMiDK+/ivC/jzLGZAXYicNe
         /p94x5MmuIaBCXzaG3h4K+foNiTt7ViQd8C6UbmrNK1i4lSdNnqPJGONs/OFp7JAW9er
         0QNg==
X-Forwarded-Encrypted: i=1; AJvYcCVQFVOz8WRD+6eIRe85d3HtuFeaA2EAoRvY0WRu/lKwfFLkOCJg4TL7cv+ppzpwZvilRleD32CNT1knU/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsKLrAxVjTbeflz6ewDDXIbOZATz+37uZWO3GLDc6Rz5aeoHb6
	zV8hCFbjhptR7RefQZXwcjS4Ulso0WefetJjDfpNEIM5CyvR11iTAVQMh1pOX0j7A8yBSAFSqzg
	MNHyAdnT1MKXuaAVDg0m78Z/qNMgpJwhE7Oannfly
X-Gm-Gg: ASbGnctAx+XKLAZMmuxCfpHDdXz/rl65DHcuUIlwav379bAA/ZOkQUIncTrz4nviYlj
	37bqswukXHQj2HuCIEuf5M96noMyaJhHY7H82/I2v4Opk7RSZwTI/bdAVhfs4ztxTsTWEE1lryX
	7DllegcldTZR9z4SX2Yg5DaBsWZfXl6Xu/7qNZDdC8OXdR
X-Google-Smtp-Source: AGHT+IGYurP8k2LEh7vwdS9rEUPjzfZDQNT4fopSCpl/Z7g8cNeQVl4GT7t1d/nQ7i+qJw1zjE0AiHSdGRY9PL9W0Gs=
X-Received: by 2002:a05:6512:308a:b0:553:2375:c6e8 with SMTP id
 2adb3069b0e04-553d97b0066mr302318e87.1.1750273100197; Wed, 18 Jun 2025
 11:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616053209.13045-1-mani@kernel.org>
In-Reply-To: <20250616053209.13045-1-mani@kernel.org>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 18 Jun 2025 14:58:08 -0400
X-Gm-Features: AX0GCFvBc2eY84r4JbOye0QGCUK6b1ep-B-W5GIi9a1SA21NGoNAGrRIDgNdODw
Message-ID: <CA+-6iNyE_6yES6rQZgiuvTE7hg+COjgkNkx2mwCF6K-4kEOuOw@mail.gmail.com>
Subject: Re: [PATCH v3] PCI/pwrctrl: Move pci_pwrctrl_create_device()
 definition to drivers/pci/pwrctrl/
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, brgl@bgdev.pl, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lukas@wunner.de, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006d68900637dd366b"

--0000000000006d68900637dd366b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 1:32=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> pci_pwrctrl_create_device() is a PWRCTRL framework API. So it should be
> built only when CONFIG_PWRCTRL is enabled. Currently, it is built
> independently of CONFIG_PWRCTRL. This creates enumeration failure on
> platforms like brcmstb using out-of-tree devicetree that describes the
> power supplies for endpoints in the PCIe child node, but doesn't use
> PWRCTRL framework to manage the supplies. The controller driver itself
> manages the supplies.
>
> But in any case, the API should be built only when CONFIG_PWRCTRL is
> enabled. So move its definition to drivers/pci/pwrctrl/core.c and provide
> a stub in drivers/pci/pci.h when CONFIG_PWRCTRL is not enabled. This also
> fixes the enumeration issues on the affected platforms.
>
> Fixes: 957f40d039a9 ("PCI/pwrctrl: Move creation of pwrctrl devices to pc=
i_scan_device()")
> Reported-by: Jim Quinlan <james.quinlan@broadcom.com>
> Closes: https://lore.kernel.org/r/CA+-6iNwgaByXEYD3j=3D-+H_PKAxXRU78svPMR=
HDKKci8AGXAUPg@mail.gmail.com
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>
> Changes in v3:

Hi Mani,

Thanks for working on this.  How/where should I be applying these
patches?  I've been using torvald's latest master but I get failed
hunks and have to manually fix them up.

At any rate I'll be testing whatever you are posting.

Thanks,
Jim Quinilan
Broadcom STB/CM

>
> * Used IS_ENABLED instead of ifdef in drivers/pci/pci.h (Sathyanarayanan)
>
> Changes in v2:
>
> * Dropped the unused headers from probe.c (Lukas)
>
>  drivers/pci/pci.h          |  8 ++++++++
>  drivers/pci/probe.c        | 32 --------------------------------
>  drivers/pci/pwrctrl/core.c | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 12215ee72afb..22df9e2bfda6 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -1159,4 +1159,12 @@ static inline int pci_msix_write_tph_tag(struct pc=
i_dev *pdev, unsigned int inde
>         (PCI_CONF1_ADDRESS(bus, dev, func, reg) | \
>          PCI_CONF1_EXT_REG(reg))
>
> +#if IS_ENABLED(CONFIG_PCI_PWRCTRL)
> +struct platform_device *pci_pwrctrl_create_device(struct pci_bus *bus,
> +                                                 int devfn);
> +#else
> +static inline struct platform_device *
> +pci_pwrctrl_create_device(struct pci_bus *bus, int devfn) { return NULL;=
 }
> +#endif
> +
>  #endif /* DRIVERS_PCI_H */
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 4b8693ec9e4c..478e217928a6 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -9,8 +9,6 @@
>  #include <linux/pci.h>
>  #include <linux/msi.h>
>  #include <linux/of_pci.h>
> -#include <linux/of_platform.h>
> -#include <linux/platform_device.h>
>  #include <linux/pci_hotplug.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> @@ -2508,36 +2506,6 @@ bool pci_bus_read_dev_vendor_id(struct pci_bus *bu=
s, int devfn, u32 *l,
>  }
>  EXPORT_SYMBOL(pci_bus_read_dev_vendor_id);
>
> -static struct platform_device *pci_pwrctrl_create_device(struct pci_bus =
*bus, int devfn)
> -{
> -       struct pci_host_bridge *host =3D pci_find_host_bridge(bus);
> -       struct platform_device *pdev;
> -       struct device_node *np;
> -
> -       np =3D of_pci_find_child_device(dev_of_node(&bus->dev), devfn);
> -       if (!np || of_find_device_by_node(np))
> -               return NULL;
> -
> -       /*
> -        * First check whether the pwrctrl device really needs to be crea=
ted or
> -        * not. This is decided based on at least one of the power suppli=
es
> -        * being defined in the devicetree node of the device.
> -        */
> -       if (!of_pci_supply_present(np)) {
> -               pr_debug("PCI/pwrctrl: Skipping OF node: %s\n", np->name)=
;
> -               return NULL;
> -       }
> -
> -       /* Now create the pwrctrl device */
> -       pdev =3D of_platform_device_create(np, NULL, &host->dev);
> -       if (!pdev) {
> -               pr_err("PCI/pwrctrl: Failed to create pwrctrl device for =
node: %s\n", np->name);
> -               return NULL;
> -       }
> -
> -       return pdev;
> -}
> -
>  /*
>   * Read the config data for a PCI device, sanity-check it,
>   * and fill in the dev structure.
> diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
> index 6bdbfed584d6..20585b2c3681 100644
> --- a/drivers/pci/pwrctrl/core.c
> +++ b/drivers/pci/pwrctrl/core.c
> @@ -6,11 +6,47 @@
>  #include <linux/device.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_pci.h>
> +#include <linux/of_platform.h>
>  #include <linux/pci.h>
>  #include <linux/pci-pwrctrl.h>
> +#include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
>
> +#include "../pci.h"
> +
> +struct platform_device *pci_pwrctrl_create_device(struct pci_bus *bus, i=
nt devfn)
> +{
> +       struct pci_host_bridge *host =3D pci_find_host_bridge(bus);
> +       struct platform_device *pdev;
> +       struct device_node *np;
> +
> +       np =3D of_pci_find_child_device(dev_of_node(&bus->dev), devfn);
> +       if (!np || of_find_device_by_node(np))
> +               return NULL;
> +
> +       /*
> +        * First check whether the pwrctrl device really needs to be crea=
ted or
> +        * not. This is decided based on at least one of the power suppli=
es
> +        * being defined in the devicetree node of the device.
> +        */
> +       if (!of_pci_supply_present(np)) {
> +               pr_debug("PCI/pwrctrl: Skipping OF node: %s\n", np->name)=
;
> +               return NULL;
> +       }
> +
> +       /* Now create the pwrctrl device */
> +       pdev =3D of_platform_device_create(np, NULL, &host->dev);
> +       if (!pdev) {
> +               pr_err("PCI/pwrctrl: Failed to create pwrctrl device for =
node: %s\n", np->name);
> +               return NULL;
> +       }
> +
> +       return pdev;
> +}
> +
>  static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long a=
ction,
>                               void *data)
>  {
> --
> 2.43.0
>

--0000000000006d68900637dd366b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
mOAplh6h3nMZUZxBguxG3g2p3iD4EgibUYneEzqOQafIQB/naf2uetKb8y9jKgWJxq2Y4y8Jqg2u
uVIO1AyOJjWwqdgN+QhuIlat+qZd03P48Gim9ZPEMDUCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJQYDVR0R
BB4wHIEaamFtZXMucXVpbmxhbkBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYD
VR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFGx/E27aeGBP2eJktrILxlhK
z8f6MA0GCSqGSIb3DQEBCwUAA4IBAQBdQQukiELsPfse49X4QNy/UN43dPUw0I1asiQ8wye3nAuD
b3GFmf3SZKlgxBTdWJoaNmmUFW2H3HWOoQBnTeedLtV9M2Tb9vOKMncQD1f9hvWZR6LnZpjBIlKe
+R+v6CLF07qYmBI6olvOY/Rsv9QpW9W8qZYk+2RkWHz/fR5N5YldKlJHP0NDT4Wjc5fEzV+mZC8A
AlT80qiuCVv+IQP08ovEVSLPhUp8i1pwsHT9atbWOfXQjbq1B/ditFIbPzwmwJPuGUc7n7vpmtxB
75sSFMj27j4JXl5W9vORgHR2YzuPBzfzDJU1ul0DIofSWVF6E1dx4tZohRED1Yl/T/ZGMYICYDCC
AlwCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UE
AxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMSO43VW7D5NP1X/KD
MA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCBkuobZrltCfHzUYSfIgPs+rNnJawkp
84P+nWGBHOE9czAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTA2
MTgxODU4MjBaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0B
AQEFAASCAQCH1sj34cajNeF65q6Uf+LITKrzvFCD9pI6MB/rxO2xsSZWEU72sMfJYkaNdRhQfqpK
3SHacDnF0+2wkKOJxrySj2CrM23gH7xUOHmanRDcrOgWbykEqzV/ywJJ6uHj3m3G3h6ynTuk8aq5
ZSRP64HN0nN6OCjxzAhQYT4KeHrosjvsNo2G1kToaeQJMIirIYd7AWxfCWv2pKq2UpeVP7aTu8oN
yYsRP27zvYmUdpL2xYijSFfKIxp6NAhZZh4iz91BvJk+PDynUiACiDr7jTkTf6/Vtvgz1rBQ0wko
hnqtRO6rfCHxZsB8SNJfGB871dHrzzzzRv+ygp72T2V2sOlZ
--0000000000006d68900637dd366b--
