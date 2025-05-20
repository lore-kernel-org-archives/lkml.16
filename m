Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037B26658F
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731417; cv=none; b=kkMOywgPsUPph3rHFBUQ3Yb2PX1b7zmrU/cZejJ/NtBqY+0wGdvngmX1H3BmvQA3sEL7FIddZa3lYw/u33sRAaYJeC95wIpWabql0RwTBhjZZLotAXjpeKbmP9JTZptN89Fj0qWbahUnkwJ7C4rKdJCDyS3zh/yI9rjJSqZR5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731417; c=relaxed/simple;
	bh=dNk1iquGoMnmN2AYnRnJ01D03ODWXa9mlMzCC+k30VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XLvE/KrWkq7oDBvydabPPcu84o8RgFPfZEhj2stSIAhF5vcsKp/+WM00glegnhsl4761VKMDXdNGRcDKEqa6Ck47rneIJA0yCvDQydVaqH4GOVk6uaxqNr/6MurSOcdQjrYX9h11ivOb/VCUqlTiBkeG3aaJC6G4rqVcPUH24Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=J9OgIqkr; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="J9OgIqkr"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6H1Jn015494;
	Tue, 20 May 2025 10:56:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	knmAoVqqbraPwZO2+muP7+5p900Huds6/IjORYOFvnQ=; b=J9OgIqkr2AiNfTbv
	ZCM8CBVH/g5T3lWhmO2KdveFoMqjk7VlO22UzHXRyHkbabu2LhVSRjJjBH0Gy8gK
	sGIgPr8pWZripbSNqywGmXTuZtEnsiMOPqeQLTYdub4UPO2XGFy5aUIMKlAsWSLW
	8Likw2h9oJFGbLPmF+jCJXd8P0jjTtAeY0N95Hf+RwoVchfpoi5949fGRBQ5Vzf+
	Q0kcJaCutymGoLMns2UBPXDILE1+UHI+/ua39St3pXKbmRFOuFeQSm9x6OpfEqXa
	+RBID96Y6ZCOxKnEZ1nT5SfSM9DLsB93h7LsKVGZ8KDkDnzrs5CpbzGRA85G8HMc
	99OXiw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfka431v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:56:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D1D8C40047;
	Tue, 20 May 2025 10:56:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 23E9DB4E1FF;
	Tue, 20 May 2025 10:55:15 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 10:55:14 +0200
Message-ID: <0fb1becc-94b9-4632-a3d1-501de2607a7a@foss.st.com>
Date: Tue, 20 May 2025 10:55:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 2/2] drivers soc: add support for ST stm32mp13xx family
To: Rodolfo Giometti <giometti@enneenne.com>, <linux-kernel@vger.kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Eric Fourmont
	<eric.fourmont-ext@st.com>,
        Yann GAUTIER <yann.gautier@foss.st.com>
References: <20250519130859.3389704-1-giometti@enneenne.com>
 <20250519130859.3389704-3-giometti@enneenne.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250519130859.3389704-3-giometti@enneenne.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01

hi

On 5/19/25 15:08, Rodolfo Giometti wrote:
> This patch adds SoC support for the ST stm32mp13xx family. It also
> adds the special attribute "secure" which returns the CPU's secure
> mode status.
> 
> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> ---
>   drivers/soc/st/Makefile        |   1 +
>   drivers/soc/st/soc-stm32mp13.c | 253 +++++++++++++++++++++++++++++++++
>   2 files changed, 254 insertions(+)
>   create mode 100644 drivers/soc/st/soc-stm32mp13.c
> 
> diff --git a/drivers/soc/st/Makefile b/drivers/soc/st/Makefile
> index 6c71607f6c89..c84bf510928d 100644
> --- a/drivers/soc/st/Makefile
> +++ b/drivers/soc/st/Makefile
> @@ -1,3 +1,4 @@
>   obj-$(CONFIG_STM32_PM_DOMAINS) += stm32_pm_domain.o
>   obj-$(CONFIG_STM32_RISAB) += stm32_risab.o
>   obj-$(CONFIG_STM32_RISAF) += stm32_risaf.o
> +obj-$(CONFIG_MACH_STM32MP13) += soc-stm32mp13.o

Your patch does not applied because the file does not exist. You can't 
take a patch on our github, push it as it is without rebase it on 
mainline kernel.

regards
alex

> diff --git a/drivers/soc/st/soc-stm32mp13.c b/drivers/soc/st/soc-stm32mp13.c
> new file mode 100644
> index 000000000000..cf45dbeb926a
> --- /dev/null
> +++ b/drivers/soc/st/soc-stm32mp13.c
> @@ -0,0 +1,253 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 Rodolfo Giometti <giometti@enneenne.com>
> + */
> +
> +#include <linux/cpu.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/sys_soc.h>
> +
> +#define STM32MP131A	0x6C9
> +#define STM32MP131C	0x6C8
> +#define STM32MP131D	0xEC9
> +#define STM32MP131F	0xEC8
> +#define STM32MP133A	0x0C1
> +#define STM32MP133C	0x0C0
> +#define STM32MP133D	0x8C1
> +#define STM32MP133F	0x8C0
> +#define STM32MP135A	0x001
> +#define STM32MP135C	0x000
> +#define STM32MP135D	0x801
> +#define STM32MP135F	0x800
> +
> +#define BSEC_RPN	0x204
> +#define BSEC_UID	0x234
> +#define SYSCFG_IDC	0x380
> +
> +/*
> + * SoC attributes
> + */
> +
> +static ssize_t
> +secure_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	u16 val;
> +	char *str;
> +	int ret;
> +	struct device *cpu_dev;
> +
> +	cpu_dev = get_cpu_device(0);
> +	if (!cpu_dev) {
> +		dev_err(dev, "failed to get cpu0 device\n");
> +		return -ENODEV;
> +	}
> +	ret = nvmem_cell_read_u16(cpu_dev, "encoding_mode", &val);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 0b0000010111:
> +		str = "open";
> +		break;
> +	case 0b0000111111:
> +		str = "closed";
> +		break;
> +	case 0b0101111111:
> +		str = "closed boundary-scan-disabled]";
> +		break;
> +	case 0b1111111111:
> +		str = "closed JTAG-disabled";
> +		break;
> +	default:
> +		str = "unknown";
> +	}
> +
> +	return sprintf(buf, "%s\n", str);
> +}
> +static DEVICE_ATTR_RO(secure);
> +
> +static struct attribute *stm32mp13_soc_attrs[] = {
> +	&dev_attr_secure.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(stm32mp13_soc);
> +
> +/*
> + * Driver init functions
> + */
> +
> +static int __init stm32mp13_soc_get_rpn_uid(u32 *rpn, u32 uid[3])
> +{
> +	struct device_node *np;
> +	void __iomem *regs;
> +	static const struct of_device_id devids[] = {
> +		{ .compatible = "st,stm32mp13-bsec" },
> +		{ },
> +	};
> +
> +	np = of_find_matching_node(NULL, devids);
> +	if (!np)
> +		return -ENODEV;
> +
> +	regs = of_iomap(np, 0);
> +	of_node_put(np);
> +
> +	if (!regs) {
> +		pr_warn("Could not map BSEC iomem range");
> +		return -ENXIO;
> +	}
> +
> +	*rpn = readl(regs + BSEC_RPN) & 0x0fff;
> +	uid[0] = readl(regs + BSEC_UID + 0);
> +	uid[1] = readl(regs + BSEC_UID + 4);
> +	uid[2] = readl(regs + BSEC_UID + 8);
> +
> +	iounmap(regs);
> +
> +	return 0;
> +}
> +
> +static int __init stm32mp13_soc_get_idc(u32 *idc)
> +{
> +	struct device_node *np;
> +	void __iomem *regs;
> +	static const struct of_device_id devids[] = {
> +		{ .compatible = "st,stm32mp157-syscfg" },
> +		{ },
> +	};
> +
> +	np = of_find_matching_node(NULL, devids);
> +	if (!np)
> +		return -ENODEV;
> +
> +	regs = of_iomap(np, 0);
> +	of_node_put(np);
> +
> +	if (!regs) {
> +		pr_warn("Could not map BSEC iomem range");
> +		return -ENXIO;
> +	}
> +
> +	*idc = readl(regs + SYSCFG_IDC);
> +
> +	iounmap(regs);
> +
> +	return 0;
> +}
> +
> +static int __init stm32mp13_soc_device_init(void)
> +{
> +	u32 part_number, rev, chipid[3];
> +	struct soc_device_attribute *soc_dev_attr;
> +	struct soc_device *soc_dev;
> +	struct device_node *root;
> +	const char *soc_id;
> +	int ret;
> +
> +	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
> +	if (!soc_dev_attr)
> +		return -ENOMEM;
> +	soc_dev_attr->family = "STM STM32MP13xx";
> +
> +	root = of_find_node_by_path("/");
> +	ret = of_property_read_string(root, "model", &soc_dev_attr->machine);
> +	if (ret)
> +		of_property_read_string_index(root, "compatible", 0,
> +						&soc_dev_attr->machine);
> +	of_node_put(root);
> +	if (ret)
> +		goto free_soc;
> +
> +	/* Get chip info */
> +	ret = stm32mp13_soc_get_rpn_uid(&part_number, chipid);
> +	if (ret) {
> +		pr_err("failed to get chip part number: %d\n", ret);
> +		goto free_soc;
> +	}
> +	switch (part_number) {
> +	case STM32MP131A:
> +		soc_id = "131a";
> +		break;
> +	case STM32MP131C:
> +		soc_id = "131c";
> +		break;
> +	case STM32MP131D:
> +		soc_id = "131d";
> +		break;
> +	case STM32MP131F:
> +		soc_id = "131f";
> +		break;
> +	case STM32MP133A:
> +		soc_id = "133a";
> +		break;
> +	case STM32MP133C:
> +		soc_id = "133c";
> +		break;
> +	case STM32MP133D:
> +		soc_id = "133d";
> +		break;
> +	case STM32MP133F:
> +		soc_id = "133f";
> +		break;
> +	case STM32MP135A:
> +		soc_id = "135a";
> +		break;
> +	case STM32MP135C:
> +		soc_id = "135c";
> +		break;
> +	case STM32MP135D:
> +		soc_id = "135d";
> +		break;
> +	case STM32MP135F:
> +		soc_id = "135f";
> +		break;
> +	default:
> +		soc_id = "unknown";
> +	}
> +	soc_dev_attr->soc_id = soc_id;
> +
> +	ret = stm32mp13_soc_get_idc(&rev);
> +	if (ret)
> +		goto free_soc;
> +	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%X", rev >> 16);
> +	if (!soc_dev_attr->revision) {
> +		ret = -ENOMEM;
> +		goto free_soc;
> +	}
> +
> +	soc_dev_attr->serial_number = kasprintf(GFP_KERNEL, "%08X%08X%08X",
> +					chipid[0], chipid[1], chipid[2]);
> +	if (!soc_dev_attr->serial_number) {
> +		ret = -ENOMEM;
> +		goto free_rev;
> +	}
> +
> +	/* Add custom attributes group */
> +	soc_dev_attr->custom_attr_group = stm32mp13_soc_groups[0];
> +
> +	/* Register the SOC device */
> +	soc_dev = soc_device_register(soc_dev_attr);
> +	if (IS_ERR(soc_dev)) {
> +		ret = PTR_ERR(soc_dev);
> +		goto free_serial_number;
> +	}
> +
> +	pr_info("SoC Machine: %s\n", soc_dev_attr->machine);
> +	pr_info("SoC family: %s\n", soc_dev_attr->family);
> +	pr_info("SoC ID: %s, Revision: %s\n",
> +		soc_dev_attr->soc_id, soc_dev_attr->revision);
> +
> +	return 0;
> +
> +free_serial_number:
> +	kfree(soc_dev_attr->serial_number);
> +free_rev:
> +	kfree(soc_dev_attr->revision);
> +free_soc:
> +	kfree(soc_dev_attr);
> +	return ret;
> +}
> +device_initcall(stm32mp13_soc_device_init);
