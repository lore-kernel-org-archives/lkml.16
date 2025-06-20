Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC4713774D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435968; cv=none; b=M+f9Y2fEsXDCZ6XDBSAsCz/m/ss1Q6MJu74ZlrZrUTVDkFwqn4kqzE9o8bJgNTAvU0dlgwjn+URhTTc8EtyTMMWq3dGIUaQDdqi2CZ9wWf2FCdQY+e0CbhrSxdeGmFdc7ydBCm2Eyd014KDT9Pcs0H9BOdEisdwhqPH1QyeLZXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435968; c=relaxed/simple;
	bh=dSrlAF32I5lH3btMaCGJWgljcuhVLfSPBYtyqJZd7k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrDDd5KA5+mHvXDdysbLCj0lbr7bGHb9w1Csz3ifZW/KJVw5IwFMt4nYqjrNWQAPaO16X4TYE9iRj9Hlt5WXlUekTJ5lraZtsT3SjKXk1GmA1CuCLbCf7BKuldYgXxgiG20i9rPiYD0XQt/vGx/AQEm6eTXDu2PzgR38zyBNmnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=lOMwqZrp; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="lOMwqZrp"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60634f82d1aso508604eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1750435966; x=1751040766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk1h/OSRQW76dr7YBIYqdBe7lZw8tZ9KpxMBcLXXza8=;
        b=lOMwqZrpYw47239a5gbVxV4UugHMwf1jWYglWSLvgqTiklguqYBsn2wxqCMfTtSrjN
         AmcFBn/laW7MYphhKRHo0oAarn9o1QR+vwuxkQO9E8GortvmGYm85lc9AZY3xWb4vLrh
         FEbuY++jPa8u4pfNomINHaafbpPzG0Ypu4z1p6t4yq2J4C7CewxQ8U40mBTEde22Egob
         i7WCwGJPEeU6C0v/EcMlaD5nnCTa6nJwK/ud+AuHMjDnbWk0ZRVDT+FVJVTHRVML094N
         grLzQe0e4EOaOTs3tN4hVuk8wzJGEmG/DIjp+sajNiOqBCCIQa67JEs2IjQiBWxJ4Jxi
         Fihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435966; x=1751040766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uk1h/OSRQW76dr7YBIYqdBe7lZw8tZ9KpxMBcLXXza8=;
        b=wX9KviyzZljxZWkZ4YH8YYL+w82aovLRGqqqeIGYPEykw2zlD4yjU5loXZ6uTyrous
         uX52Y6+TbKIB2RqDwaus/kn0rZ9pm4COvyH4XKWbC72aIpWugPS4xNIu/7ZDjCSM0gRn
         eb1aDLh9I/eT0UYNGucvyJSKoQTIt9IGiSTdMGL9TapXl0FhI9+9Oye7UJQ/2SBGPQzu
         p7WwXzHnFm6oKgkhFqOqFBQDJhDyISKRgLPg5rNMr3y2Ga3YwadlgciMIu9tBMl/XMaf
         J1pqLLy3eb7A7md5mGcvDVvPfUN3O8gF2dJtPBgoU5TxI+Ff6b8qCSy2QIYDzwLV0vF/
         Cusg==
X-Forwarded-Encrypted: i=1; AJvYcCVEU+YsdaDcbyqwTqLyT3V4SCuUasVi9OBJr8sYPnLav1mqiVwSiKj464tNNCq2cG8dock0BVVEv7ztR+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPlHr/avRBH8p0YNapTZYZ3egznhp3iJlhh/Ktbm8K/giBs9qC
	JTV4wOGWqcjC6uj/gQhec0ILOYd/BWi9dncu/wD/Vr6sM76UMLGLym1uvk81G//7VdduVcdaDwO
	0j7ymuQnF3eYaATCaZehVJLi/Coj18V2iA+B1ZlwhDw==
X-Gm-Gg: ASbGnctNaqAgNm0UILm4g1ZY4tG9VbjNUWfW29BwhAW5ZL+WzdjCZg+fqubpa5GHwlI
	aZ8HSXH1rRYBlXWhgeebyLoIn3SPe9fO/BFiP3a2BEg6sNJPtWegI087gm20XxmSt/Hc2HtMsJZ
	YfBRgeg73omFe2aD49lw1veP/DBX+/MX8yndvx/qnfBYE=
X-Google-Smtp-Source: AGHT+IEWHRk01AMNXUO3Iti/LVUHyPY06MPi2HY582F4LaypQ5ZkZqqgLLKeo/FHsS0LAg4XUMcQcmQIpTlGgPfCCxs=
X-Received: by 2002:a05:6820:1e87:b0:610:fc12:cbb4 with SMTP id
 006d021491bc7-6115b8a077cmr2461053eaf.1.1750435966109; Fri, 20 Jun 2025
 09:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616085742.2684742-1-hongxing.zhu@nxp.com> <20250616085742.2684742-2-hongxing.zhu@nxp.com>
In-Reply-To: <20250616085742.2684742-2-hongxing.zhu@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 20 Jun 2025 09:12:35 -0700
X-Gm-Features: AX0GCFupqyePYKY1h7Imt92So6Th1StimJuRSWH0VvVxy1uS8kPjLbLXM76L3Es
Message-ID: <CAJ+vNU15XpyLuxO4EowyqO9P+ZUqNApoH2Wu261iu-5b2GrkGw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 1:59=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com> =
wrote:
>
> apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
> Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
>
> Remove apps_reset toggle in imx_pcie_assert_core_reset() and
> imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
> and imx_pcie_ltssm_disable() to configure apps_reset directly.
>
> Fix fail to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM, which
> reported By Tim.
>
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Closes: https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcM=
HDy+poj9=3DjSy+w@mail.gmail.com/
> Fixes: ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in imx_pcie_deassert=
_core_reset()")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index 9754cc6e09b9..f5f2ac638f4b 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -860,7 +860,6 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx=
_pcie, bool assert)
>  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_assert(imx_pcie->pciephy_reset);
> -       reset_control_assert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, true);
> @@ -872,7 +871,6 @@ static void imx_pcie_assert_core_reset(struct imx_pci=
e *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_deassert(imx_pcie->pciephy_reset);
> -       reset_control_deassert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> @@ -1247,6 +1245,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp=
)
>                 }
>         }
>
> +       /* Make sure that PCIe LTSSM is cleared */
> +       imx_pcie_ltssm_disable(dev);
> +
>         ret =3D imx_pcie_deassert_core_reset(imx_pcie);
>         if (ret < 0) {
>                 dev_err(dev, "pcie deassert core reset failed: %d\n", ret=
);
> --
> 2.37.1
>

Tested-by: Tim Harvey <tharvey@gateworks.com> # imx8mp-venice-gw74xx
(i.MX8MP + hotplug capable switch)

Best Regards,

Tim
