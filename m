Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3711DF757
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748791328; cv=none; b=u4piyWu7918QNg9M4v9sNAJJg1sVPCZUFWFqBrJB71mDZkjt05SQiGl/oticbvdpP2loKe2EVgOn3WfhK1HW6aDHN7/kKdETIL2phNCzmAxuoVlA7p/fVr9ugEfhrjWPLk3Wy4niymQ/MO4Paahq2Agpa7RnqZ9R6GnVue4DIY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748791328; c=relaxed/simple;
	bh=ZWlsEbLLjAaCv4BuA8/UppFHgvPukzjx4SMXwLnm5Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJrOsY0Ghokfi4GT6MJT662xEgWMPRdlpTY44umoQ9JF1kbXJ5M9Y0APFLuCxe4qZBCT0C7ajIWFxs4/p6FBhiHk4LIq8VWsfgaoCVCTFPjrH6yNpovuMIQpBgbi0afKWGa/7x/PCp/hMERtnStCoBeLcRYZMxNsvwlDLqBhlks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DoMgpcIr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DoMgpcIr"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234fcadde3eso43191875ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748791325; x=1749396125; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXW1/YM5zz+CF3xJy+mpJXWMMDbrJMLFqUUrCR702J4=;
        b=DoMgpcIr3+j9jveptIHnnmhjxXlkroqXJsX5WHePW9RilVbjMJXQzeZq9W6MmNURQT
         bHN8OBFkR5IZvBHHQHPp/8GHUllsV1xnG9jx84vBntsyRA2KUgJenoFQswm/JolTCIQe
         8s/6T0PMBiqrsR1Hh7yc4mgQf67HRvW0pYu5m54Q4RB/9XlqUaWxUFQNeZ4HDqnmQhyr
         lSFZfbLCOlpAOzcGG0Ydis21FhvGjcUuBQ0g09cTKGyyq22spNX1TZT3/5cVxpioZ8hP
         ZoBXeGlu2XNNBKWiwYgrmRgH34s3eWeygnHbbTOSoQ3TRfDG5WTHrM1GJlCcJZe1ETLy
         79oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748791325; x=1749396125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXW1/YM5zz+CF3xJy+mpJXWMMDbrJMLFqUUrCR702J4=;
        b=LMpn1nJqzIzHAT/7Mi7ucX0946PD/txEElAJY3/ZbpT20naWyQ18u1F7/XVQKp49hJ
         XfcG3r8JfdhjRIr0qzpPbfugi1FImrvGLE6EGpEVBeaxlyyeafjLXAHSQws4DYXyttFd
         wKDtsxZ1ciw7nvkqy8H6ga6XRmCxPzwnJ2vU6pvWbQTg2UqF+5hL01s1j2FGsCfBerKu
         BqtuEPpn/0n3aHcI4wOiHbK0qK9eooTUU35NjHuk0R7lHm1EkjbC5p0U3r/UaL+VNXP3
         yRP1eXuD8ayi55LaItO/kxCh3y8nq6yifgD/RXJnmpXvP+TOdMha9NQXQyh4b94wdGiG
         /6nA==
X-Forwarded-Encrypted: i=1; AJvYcCXPutERhxXRzqB5iEjkUA3rPZ4DoiMtkOc3fl7h2KdayyZeBjRZMStTqIzTCl3O678AekHEzUkOfvDS5EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRy7oJ9lSzMH+FoZdVtsQ+y2FewLdEqWF0jyPhKMz3kmQz6SI8
	8JsZtxdtdJ7pRFfXD0uQFHyvy6O1AnbJ3aPoiN4MQbTfdYPmvGDsyVhgyi22E1/62Q==
X-Gm-Gg: ASbGncvvCBda7dGd9X+soskaZy1R7P6pK2joEz/Az+JQmvzTH/Is+yN4v8DlFIdRwTt
	NvxUaSWqqtsPKxei9JGO7a87mvrNZw3nTT+uFXobvToC9/srRyHfBcAHkKaL2nvaR8HHCoUGk0t
	gE6JtIai7UYijeDu/H45ij+RlI+bTHHDJzFFFLeo57JcD1oBQAzt2ryZhmv2AdSU1/VhrUU6qgO
	2eV4UMUsRCBklGrKJ8Uss5YAvWTPNmUpDv5B2RLECX8WkCYeBdT/wy23427itdaAUePiQ+6y8tM
	Gd+cBLhIdIQB6XHWqCz5AXqhLavUEIBw46AJUBkLZbX/pJayKI4LvJoCIUrMzE4=
X-Google-Smtp-Source: AGHT+IEJfc8pHNvgATHLpZnaIzj8JyRGFCc9pjej88kFaniJEBRrgyJVFmdFH5e4bqy8CSn/z6tt1w==
X-Received: by 2002:a17:902:ec90:b0:234:be9b:539a with SMTP id d9443c01a7336-2355f9ef410mr75898605ad.40.1748791325354;
        Sun, 01 Jun 2025 08:22:05 -0700 (PDT)
Received: from thinkpad ([120.56.205.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d21f4bsm56574435ad.250.2025.06.01.08.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 08:22:04 -0700 (PDT)
Date: Sun, 1 Jun 2025 20:51:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v2 2/2] PCI: Add support for PCIe wake interrupt
Message-ID: <543ocn4vecyjej26ynjggm6zwj7bmn27rd6c4foo36gvxeltma@6d5dfdoscxwm>
References: <20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com>
 <20250419-wake_irq_support-v2-2-06baed9a87a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250419-wake_irq_support-v2-2-06baed9a87a1@oss.qualcomm.com>

On Sat, Apr 19, 2025 at 11:13:04AM +0530, Krishna Chaitanya Chundru wrote:

Subject prefix should be 'PCI/portdrv'

> PCIe wake interrupt is needed for bringing back PCIe device state
> from D3cold to D0.
> 
> Implement new functions, of_pci_setup_wake_irq() and
> of_pci_teardown_wake_irq(), to manage wake interrupts for PCI devices
> using the Device Tree.
> 
> From the port bus driver call these functions to enable wake support
> for bridges.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/of.c           | 60 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pci.h          |  6 +++++
>  drivers/pci/pcie/portdrv.c | 12 +++++++++-
>  3 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index ab7a8252bf4137a17971c3eb8ab70ce78ca70969..13623797c88a03dfb9d9079518d87a5e1e68df38 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -7,6 +7,7 @@
>  #define pr_fmt(fmt)	"PCI: OF: " fmt
>  
>  #include <linux/cleanup.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/pci.h>
> @@ -15,6 +16,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
>  #include "pci.h"
>  
>  #ifdef CONFIG_PCI
> @@ -966,3 +968,61 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>  	return slot_power_limit_mw;
>  }
>  EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
> +
> +/**
> + * of_pci_setup_wake_irq - Set up wake interrupt for PCI device

This function is for setting up the wake interrupt for slot, not for endpoint
devices, isn't it? Then it should be named as such:

	of_pci_slot_setup_wake_irq()

> + * @pdev: The PCI device structure
> + *
> + * This function sets up the wake interrupt for a PCI device by getting the
> + * corresponding GPIO pin from the device tree, and configuring it as a

s/GPIO pin/WAKE# GPIO

> + * dedicated wake interrupt.
> + *
> + * Return: 0 if the wake gpio is not available or successfully parsed else

s/wake gpio/WAKE# GPIO

> + * errno otherwise.
> + */
> +int of_pci_setup_wake_irq(struct pci_dev *pdev)
> +{
> +	struct gpio_desc *wake;
> +	struct device_node *dn;
> +	int ret, wake_irq;
> +
> +	dn = pci_device_to_OF_node(pdev);
> +	if (!dn)
> +		return 0;
> +
> +	wake = devm_fwnode_gpiod_get(&pdev->dev, of_fwnode_handle(dn),
> +				     "wake", GPIOD_IN, NULL);
> +	if (IS_ERR(wake)) {
> +		dev_warn(&pdev->dev, "Cannot get wake GPIO\n");

WAKE# is an optional GPIO. So the driver should not warn users if it is not
defined in the root port node. It should however print the error log and return
errno, if the API returns other than -ENOENT.

> +		return 0;
> +	}
> +
> +	wake_irq = gpiod_to_irq(wake);
> +	device_init_wakeup(&pdev->dev, true);
> +
> +	ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, wake_irq);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to set wake IRQ: %d\n", ret);
> +		device_init_wakeup(&pdev->dev, false);
> +		return ret;
> +	}
> +	irq_set_irq_type(wake_irq, IRQ_TYPE_EDGE_FALLING);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_pci_setup_wake_irq);
> +
> +/**
> + * of_pci_teardown_wake_irq - Teardown wake interrupt setup for PCI device

Same comment as above.

> + *
> + * @pdev: The PCI device structure
> + *
> + * This function tears down the wake interrupt setup for a PCI device,
> + * clearing the dedicated wake interrupt and disabling device wake-up.
> + */
> +void of_pci_teardown_wake_irq(struct pci_dev *pdev)
> +{
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, false);
> +}
> +EXPORT_SYMBOL_GPL(of_pci_teardown_wake_irq);
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index b81e99cd4b62a3022c8b07a09f212f6888674487..b2f65289f4156fa1851c2d2f20c4ca948f36258f 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -888,6 +888,9 @@ void pci_release_of_node(struct pci_dev *dev);
>  void pci_set_bus_of_node(struct pci_bus *bus);
>  void pci_release_bus_of_node(struct pci_bus *bus);
>  
> +int of_pci_setup_wake_irq(struct pci_dev *pdev);
> +void of_pci_teardown_wake_irq(struct pci_dev *pdev);
> +
>  int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>  bool of_pci_supply_present(struct device_node *np);
>  
> @@ -931,6 +934,9 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
>  	return 0;
>  }
>  
> +static int of_pci_setup_wake_irq(struct pci_dev *pdev) { return 0; }
> +static void of_pci_teardown_wake_irq(struct pci_dev *pdev) { }
> +

Provide stub for these APIs if CONFIG_OF is not enabled.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
