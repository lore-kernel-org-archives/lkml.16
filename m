Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51954214A97
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749243852; cv=none; b=YNPNkgklzvNYuO8OU1SAE8BjtqCBXXoH5ivPKgaewzUwESmlzh3pAV6eGenni0hX98Z+tndFKYuT83zi3Ib5lsvUDx6UbtW7SrjIZKS6hwf07aSviGu9W510bMzio4QoVTX4stnmjiiLDUSC9xSdBdrC3EkI2cw2NtnKK0M3juc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749243852; c=relaxed/simple;
	bh=1Xc1REoGz59kJ4M9DicrjznJxMvjS5pOb4T5OcmR7Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPvSDwSaX/difuruKxau3pu8TCrXVxKeRm9hBBSKvjSLWrrByNfVIAe4v2SwRvhpUWwqLTwSjLAUJe9UVR7gSh6NzvUaXK6AO80DCnJ0WPeptkCdWnSRZVsuY04adWCaCu+p+dhDOdlEZoO4EH01K8VaTFElpA9dyrcO993Yvjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=qBviRiQs; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="qBviRiQs"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7db5c13088so2159118276.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1749243849; x=1749848649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5BUjHtvSQa2fwgei7fhihebHAmQMvtk7aJVJVyEqtY=;
        b=qBviRiQs1e8bmNRMIMgsHrgDBNWw5USv2MfZ9oEUvYTjgnlLegIjC0qKuHfk6YQ8Ky
         9YjTaoVUD6sUoyQhObR1W5SYc44XVThg9A7LvsQ9RFpRn8JNotkSgzjNsax6pF7JeLm4
         MwQH4u+PpFlKfF/OveeS9MnZ5HCxmcQTXDdpicuHLJ4CmX4RjMWsdcO8mwsKyeqCAo9y
         0B11Y0s7ypP9KelPlFoG0e4BnGweEg8BAY3eFc3f/Zii8hT9jq6qTduSJhXGT09HUhbb
         gCiNyDdCzbsTZBXh6wcR3ru+fxQ7PrW+Fwjc676AWxBCEe/fZU+13zMnwANjoWis4JPU
         zxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749243849; x=1749848649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5BUjHtvSQa2fwgei7fhihebHAmQMvtk7aJVJVyEqtY=;
        b=TP/U7lEclIDBwd0K7fDoQXQ5+BhQ8llL5rRezwltrDStmdcda0et0oQyDlethsXcW4
         ZCT4dIaCSxMrcfkz2SZAL7pE9dcYuaA+250n0buWano/+nzNqM25vKgFFjqDclhhhdVH
         LykjYKsRXXLlP+ciymRRvVeYqb8QVTiXUVh2H3kv8e9rqToDaW9iXt7bE4afx6l0x8Z4
         9ZauR7ohyPpFoboZLvfsdsxJ7o5Sx9oi/iJjXTzXezVjjm4bffgaAVg3hZXkQ0R2ozgd
         cWQLqTRLUKK128+rQybvmhtxBljwIr/jgA4neBofXgl5ZW7cS6KGC9U02N3Ng4iiBr0a
         ip9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnQdA6OeOenb0kZJvbmJkpiRHVzRIRG/+3/ilJ4gYdJxcnSCiiOOyLwhrP0RcG6x5JfqRFgEgaddFp2ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp97dQ+QC2hJoUB/WFyJEmBVK+elZOxOIpj32d6BJuNGmTF1od
	wzJeWM1Etk8NDqgk31HlzrNJ10RF88Ynp4oDRzELJCFWI5wxsk/TFAUIVvD3pdy5XEaDdJrWytb
	hrCD0ri0uW194tRxjvadp6chDfhqDGQlePUJ8lz0SyQ==
X-Gm-Gg: ASbGnctDaUczFkQoVNVtKWLW1pJbNMZ6wMCYkHfmOpHaXNGqmAlgyo0w2bKPmG8bO29
	g4DpHgYGYJWJ/nsNNl7MKawpdRxoJKfj60+SbXHlA1AIcZN82slJCGdVhqY0CovsIMeab4o0piQ
	CU8MooJVuVUsILeAwdPbC2n2pXvLO68gIN
X-Google-Smtp-Source: AGHT+IHz5Vh1WV9nsY/ZJiTiB1W8ok9w5HzbkMh2HaPQU1ew8kA+sOX9MHLa7aQ/uKATj0C5Wdv6l/pIEuTUkbDn4co=
X-Received: by 2002:a05:6902:138e:b0:e81:566c:3085 with SMTP id
 3f1490d57ef6-e81c0fc6b57mr402062276.1.1749243849237; Fri, 06 Jun 2025
 14:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com> <20241126075702.4099164-6-hongxing.zhu@nxp.com>
In-Reply-To: <20241126075702.4099164-6-hongxing.zhu@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 6 Jun 2025 14:03:57 -0700
X-Gm-Features: AX0GCFsPTDn7iA-rHigWV1JSUeeni9XBl8RHjYyReEuG_dN3ujPTRzbBW4231V8
Message-ID: <CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] PCI: imx6: Deassert apps_reset in imx_pcie_deassert_core_reset()
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org, 
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 12:03=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com>=
 wrote:
>
> Since the apps_reset is asserted in imx_pcie_assert_core_reset(), it shou=
ld
> be deasserted in imx_pcie_deassert_core_reset().
>
> Fixes: 9b3fe6796d7c ("PCI: imx6: Add code to support i.MX7D")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index 3538440601a7..413db182ce9f 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -776,6 +776,7 @@ static void imx_pcie_assert_core_reset(struct imx_pci=
e *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_deassert(imx_pcie->pciephy_reset);
> +       reset_control_deassert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> --
> 2.37.1
>
>

Hi Richard,

I've found that this patch causes a regression on i.MX8MM and i.MX8MP
boards with hotplug capable bridges:
i.MX8MM+PI7C9X2G404EV (this switch does not support hotplug) - no issues
i.MX8MM+PI7C9X2G608GP (hotplug) - fails to reliably enumerate
downstream devices about 80% of the time
^^^ when this occurs PCI_PRIMARY_BUS (0x18) for the root complex
0000:00:00.0 reads 0x00000000 instead of 0x00ff0100 (PCI_SECONDARY_BUS
is 0 instead of 1 and PCI_SUBBORDINATE_BUS is 0 instead of 0xff)
i.MX8MP+PI7C9X2G608GP (hotplug) - hangs at imx_pcie_ltssm_enable
deassert apps_reset

In both cases here reverting ef61c7d8d032 ("PCI: imx6: Deassert
apps_reset in imx_pcie_deassert_core_reset()") resolves this.

I notice the sequence of events here is:
imx_pcie_assert_core_reset asserts apps_reset (disables LTSSM)
imx_pcie_deassert_core_reset deasserts apps_reset (enables LTSSM)
imx_pcie_ltssm_enable deasserts apps_reset (enables LTSSM; this is
where it hangs on imx8mp)

Is there perhaps some issue with de-asserting this (enabling LTSSM)
when it's already in this state?

In the case where downstream devices do not enumerate some
investigation points to them not being happy that the link drops so
perhaps deasserting apps_reset when its already asserted drops the
link and restarts it?

Best Regards,

Tim
