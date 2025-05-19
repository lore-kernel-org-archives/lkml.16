Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E183A1C5D5A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679669; cv=none; b=pf6Fa+TVm14cPynU8ParEBIBN0mEBPWsfMZnFi+eLJOQyQ4ju+OsdmqSkMwqPgkRZGqgZvzZLd8/UKXiEJAuh3hyjnfBipHfPjSuB9hw27X/4fZk41l/4or1tRsrbfdLbOnn9FM2VjAy3SejOiz47NbvCf1SW/0sJMGK/wVgWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679669; c=relaxed/simple;
	bh=I8p7dHIFU3oycXQq7e4uJVPy62H5+5yuG2v02eSywN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmLy6mXu1GwTT8/bwyOp6nb7K+Qf/q7oVv0NiMQApqw3CAyRxEjFwvtZIjWzeicRc6sxHAPYkWd3CZtbtCezFBsZZ37MureAy1yVQ1GAFSl8KYxoUcpV6V2Ky7ChT3glgHfJUzfgIULtDGl1PzCBwsVUdvzlnaYng73rJYDsaWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6v/EGBB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6v/EGBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA67C4CEE4;
	Mon, 19 May 2025 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747679668;
	bh=I8p7dHIFU3oycXQq7e4uJVPy62H5+5yuG2v02eSywN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6v/EGBB4lql9PnfuYYYs35NoGyEwpJD4k70H1Cy0Hr4LU9e5wHyLeVrotS2QeFi5
	 DuE36fDLC29GInulDohhtDS/38l1AYRpXC8TjhZI93bZ6hJqOrYgcwZUDxeylavtQ1
	 +JbAR/Gi5E4jpeIDAi00EWB9GZE5cYQ+3Ul2bpOlqyrEkMjW8aiadXTP5VJY+lqvec
	 wqJeuRE436QoKwW5k5xbUH5k8c0MIIqIY7R1ax/UeNPieKt3KSYgHT6fLf5l7Zk3aO
	 NPksT2lxvoRFULAj2mFbF5pSZjtH+xe0ykNipLPISosN7iqL17339l/taP4Kidl7/6
	 KVBOeC75NG22Q==
Message-ID: <4566f4c1-f4d0-4f32-8fcd-bb3057b5d1fa@kernel.org>
Date: Mon, 19 May 2025 20:34:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 2/2] drivers soc: add support for ST stm32mp13xx family
To: Rodolfo Giometti <giometti@enneenne.com>, linux-kernel@vger.kernel.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Fourmont <eric.fourmont-ext@st.com>,
 Yann GAUTIER <yann.gautier@foss.st.com>
References: <20250519130859.3389704-1-giometti@enneenne.com>
 <20250519130859.3389704-3-giometti@enneenne.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250519130859.3389704-3-giometti@enneenne.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2025 15:08, Rodolfo Giometti wrote:
> This patch adds SoC support for the ST stm32mp13xx family. It also

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


> adds the special attribute "secure" which returns the CPU's secure
> mode status.
> 
> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>


You Cc-ed linux-kernel, so I assume this is patch for mainline kernel.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

...

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

Where is ABI documented?

> +
> +static struct attribute *stm32mp13_soc_attrs[] = {
> +	&dev_attr_secure.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(stm32mp13_soc);


> +
> +static int __init stm32mp13_soc_get_idc(u32 *idc)
> +{
> +	struct device_node *np;
> +	void __iomem *regs;
> +	static const struct of_device_id devids[] = {
> +		{ .compatible = "st,stm32mp157-syscfg" },

No, don't add compatibles for other devices into the driver functions.
Use standard methods for binding, like every driver does.

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

So this will print and spam every dmesg for every user of the kernel.
No, this has to be regular platform driver and only one print (see
kernel coding style about drivers being silent).


Best regards,
Krzysztof
