Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A29215058
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685052; cv=none; b=kXTX9X5OYTlNx0bjE+r/XjRIiguTeu/OufgWiLyqKgTkyaZ5S22A2EJV+0aef9DPduwNdrgJZ/0+tQzi1GRJJjvZjFJq+BJqAbPTM1hkUGAckHyP8ArOJtMyHSr3nI6Q2HoooadOkk0dhq9Pa/xYGaqDD1RVvAwThdWnXxRDeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685052; c=relaxed/simple;
	bh=bKm2zrSZMDS55/PulBVvNyZhtDXdsceOimQUO3Sqlrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7bt0DSDIoHAnOuu4NXVxRpaov6MnLP8m7xsKU7uP9OAXvdqwBJBbQRNZ603z/aobzKK9LJjsn85L8yE4RKOTL+6BzwTslC8UoawhGffbaZatXhgjQVqoN92zPk9o15Phy64f6mmqY0xhf+94ZmJwwd0FzT78L0RdUGbr0r893I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtNwbyXS; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtNwbyXS"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e53c9035003so5133635276.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 08:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738685049; x=1739289849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WANx9O2MqxxPgH7NFbnRWmJ+E0+Q02JDckfqFnbdozU=;
        b=vtNwbyXSGLzxafsyMNIQrOJ1EVCuk85uLeAy7Rg3D34DlFrWQIblnCb6nyZThVwAn6
         zbcppfOmCrCh9oIeqUFVo02E3INUwb+kl0uxUe0q6/ARf96gi8GhA6o+cjNbdbnwNWMk
         KKqRfwEtM0JgBqQ6+ITBEFyI3IyWCmPRle4EndMYLA6wr/gsd5fublLpYictl4FU7mFh
         d99o3umU1dnbbTm8N+6vkyoSyGmXFGId3yCjNFHtublmgVt6COdKHeYl5pwfGOiNBsHQ
         RPOwrVKTrdl/f6ZZRrf/pPm6lU5mV+Gm7YiL291iV+myyBFNVFizwHODKm8U0l04AtqP
         7x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738685049; x=1739289849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WANx9O2MqxxPgH7NFbnRWmJ+E0+Q02JDckfqFnbdozU=;
        b=q35u5I15O6CyDyUIH0/k67oEAF1dncszWswWezszdyopKm0//kM31EMbFsrBTPKge+
         QxIyOg1j9+M8BpySe6ZpV3lydmnkQ+sADOgusq/I1GUbpi1CTZ20YatWay1vHmPin0ee
         x4QKoFEJBWS07ByVG7r6zKs0c36Ari+SpsYULMyQdDdk1yxcb9ZRfpOHuEGQ44v2wNwO
         N6P6E7DgztfuTHFFgMLNtWl6dHfcI4NgmJL1+NMNbt76Ud+UaCtQxKZUs/uCoJNUh8hC
         UVCKgd1NLH7Nt+IGEia79iwFM2xIaI1V9BrOo0AX2+AKnAVO5PjBBHc9lFHIXEmA6bhT
         PZGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVljo0DnxJLfcwHaWqRb/BfLb04VcSNSpe8BFkfG8OoE4eI2tqCSaGgkBxbCixRxQZosx2NbzgrB+a7ddI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOe6HCBOX+afAwu0ff4Lwl1V6iJcnBKhgVgZACpp54sxkIiETi
	rVj+FQKhqaqojjMj0ElifK+vKL29F5eDVxhltHiFUStxc7N/7DwLj2SeqIvR9UUYrBSHeDNUhHX
	y+gefPbu1eIRFc35tiOosOXokbth/HcEb6NMe5Q==
X-Gm-Gg: ASbGncu4SZe2npV34cLOtk9Ydz2qnnREQQsq4EwUnlkTbYDaC7y8ovDz4LzgJG0nB9J
	DcC9QxVpYNwza4nfZVkkNUiFEF65SZHvRbQXtu11nQhDbOuvfcUn/hblekitA3WZIGfls701ffA
	==
X-Google-Smtp-Source: AGHT+IE4idesVJbfBpDU0f7s2AN3M6p3s6pKSMPlvXAD9e1BxdSCSWbd9pa0w12jqplFp2SmbkOk0RlJN0wo/OSTDWs=
X-Received: by 2002:a05:6902:2804:b0:e5a:e8e8:b1c3 with SMTP id
 3f1490d57ef6-e5ae8e8b2f3mr10122299276.9.1738685049136; Tue, 04 Feb 2025
 08:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126050309.7243-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20250126050309.7243-1-manivannan.sadhasivam@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Feb 2025 17:03:33 +0100
X-Gm-Features: AWEUYZmE6knt90eWxfiurrcN4EWivox7DsLcZz8vXGHj-AjGXDsgLjGwDSxuXJc
Message-ID: <CAPDyKFqfJmpFvNgjj3P3+vmiSooiU4sr=dnVuBfXOijPdcbt-A@mail.gmail.com>
Subject: Re: [PATCH] nvme-pci: Use NVME_QUIRK_SIMPLE_SUSPEND for Qualcomm
 Snapdragon 8cx Gen 3 platforms
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, rafael@kernel.org, 
	helgaas@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jan 2025 at 06:03, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On these platforms, power to the PCIe bus is not retained if the SoC enters
> its own deep low power state called, CX power collapse state during system
> suspend. Once the SoC resumes after going through CX power collapse, all
> the PCIe bus state will be lost. So the NVMe devices on these platforms
> won't resume properly, rendering the machines useless until forcefully
> restarted by the users.
>
> To workaround this issue, the PCIe controller driver is keeping a minimal
> vote on the PCIe-MEM interconnect path in its system suspend callback
> current currently. While this gives a working system suspend, it also
> results in increased power consumption during suspend as the SoC never
> enters its low power state. So with this change, the workaround can finally
> be removed.
>
> Also it should be noted that the actual fix to this issue lies in the
> PCI/PM core. But currently there is no such fix exist as of now and the
> consensus to reach it is also taking a lot of time.
>
> So use this quirk to allow users to save battery life on these platforms
> until the PCI/PM core comes up with an API that tells the PCI client
> drivers when to turn off the devices.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

FWIW, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

> ---
>
> Hi,
>
> I'm sending this patch as there seems to be no consensus so far (as been
> discussed in this thread [1]) in coming up with a PCI/PM API that tells the
> client drivers when to safely turn off the devices. Since coming up with these
> kind of generic APIs are bound to take time (I do intend to pursue), it makes
> sense to allow these platforms to make use of the existing

In whatever form you intend to continue to try to move this forward,
feel free to keep me in the loop. I am interested and will try to
provide as much feedback as I possibly can.

I can also keep an eye for a conference where we can bring this up
again, last time we discussed this was in LPC in Richmond 2023, I
think. It looks like we have some more data for discussion now, but
let's see how far we can get on LKML.

> NVME_QUIRK_SIMPLE_SUSPEND quirk in the meantime. Once such API is upstreamed and
> used in this driver, this quirk can be reverted.
>
> It should be noted that this CX power collapse issue only exist on the platforms
> based on the Qcom Snapdragon 8cx Gen 3 SoC. On other platforms, it is a more of
> a policy decision to decide whether to shutdown the devices or not. And these
> other platforms can wait for the generic API to be made available by the PCI/PM
> core.
>
> [1] https://lore.kernel.org/linux-pci/20241118082344.8146-1-manivannan.sadhasivam@linaro.org
>
>  drivers/nvme/host/pci.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index e2634f437f33..c52dced952a1 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -3162,6 +3162,16 @@ static unsigned long check_vendor_combination_bug(struct pci_dev *pdev)
>         if (dmi_match(DMI_BOARD_NAME, "LXKT-ZXEG-N6"))
>                 return NVME_QUIRK_NO_APST;
>
> +       /*
> +        * Qualcomm Snapdragon 8cx Gen 3 (SC8280XP) platforms doesn't retain
> +        * power to the PCIe bus after entering low power CX power collapse
> +        * state during system suspend. So shutdown the NVMe devices to have a
> +        * working system suspend on these platforms.
> +        */
> +       if (dmi_match(DMI_PRODUCT_FAMILY, "SCP_MAKENA") ||
> +           dmi_match(DMI_PRODUCT_FAMILY, "ThinkPad X13s Gen 1"))
> +               return NVME_QUIRK_SIMPLE_SUSPEND;
> +
>         return 0;
>  }
>
> --
> 2.25.1
>

Kind regards
Uffe
