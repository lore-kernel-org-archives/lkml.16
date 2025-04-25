Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7069B220689;
	Fri, 25 Apr 2025 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576668; cv=none; b=UAFqLVNCRsxZWuklnRnrTbnndHcCXdFitxYEpYsbmwDmyWFU1aWr+PnU1UPS14cZyDxu0ckd2mQcbGvZCw8L267Nh3WnZ/0cnJcrOuJjQsJnc9k5yq68J4DdxXaSR9Dk0cJiuN/+pqQKKvgptsBemUqa9XnTl17mxDZaZOD1lMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576668; c=relaxed/simple;
	bh=aghLaj8CJNDyjLELUOs0PnmheziqEUj2Lr889K4xl+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aB1Z5sN6quLuUb1kOOFHYoiQnLUKwJGYWFnPlKWk+QJwvtc25bqeoemr1/OkMGh2fbE2lEwVpXdzH6IU8apqPxtVBohjrPZ/j86RLDWQZkjGSagzKuIdlkzJuDpbD4K4c2f8/ERYlEWHdVPY0kuQlxRidJMrBdhbjZvZO+WisEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4u32XIw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4u32XIw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4B4C4CEE4;
	Fri, 25 Apr 2025 10:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745576667;
	bh=aghLaj8CJNDyjLELUOs0PnmheziqEUj2Lr889K4xl+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h4u32XIw+nlD1FUJcoWeK7tKOX3/JT+fePuRhE+sszuKTHrIBUctdGUAFxb4veZxr
	 SlKIni7k0SPFR6neo+eHH9sGO8qotqIN8/rlcuIQhPfBEfdfemlpgnwWcwUFT4vSkI
	 lUS2Ry9Ze40zah66Ei78O6aE/7uYNUpAdk9gLpKZ8trvKnekEvVyfN/0AscqkFWYgh
	 ew2b2Ras/HakRlzyBJot9EGWylU1zAKQwue/QCoxM4eXUwA1RslHtQFtokLg+ip0jY
	 F+h5WovYxvRrLxaaarWSfrSnXlmupY8rYnS1/RFag3xW8TkB7lspp2Iq5A4ikZQG/Z
	 QtcEcl3n5a5DA==
Message-ID: <c38b3dde-f4ea-4812-a673-137d4727aefc@kernel.org>
Date: Fri, 25 Apr 2025 12:24:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: Add VIA/WonderMedia SoC identification driver
To: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
 <20250423-wmt-soc-driver-v1-2-bd8bf32521c2@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250423-wmt-soc-driver-v1-2-bd8bf32521c2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/04/2025 21:18, Alexey Charkov wrote:
> Add a small SOC bus driver to parse the chip ID and revision made
> available on VIA/WonderMedia SoCs via their system configuration
> controller's SCC_ID register.


...

> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/sys_soc.h>
> +
> +static struct {

I think const by convention is placed here - right after static. It
should be equivalent, just convention.

> +	const char *name;
> +	const unsigned long id;
> +} const chip_id_table[] = {
> +	/* VIA */
> +	{ "VT8420", 0x3300 },
> +	{ "VT8430", 0x3357 },
> +	{ "VT8500", 0x3400 },
> +
> +	/* WonderMedia */
> +	{ "WM8425", 0x3429 },
> +	{ "WM8435", 0x3437 },
> +	{ "WM8440", 0x3451 },
> +	{ "WM8505", 0x3426 },
> +	{ "WM8650", 0x3465 },
> +	{ "WM8750", 0x3445 },
> +	{ "WM8850", 0x3481 },
> +	{ "WM8880", 0x3498 },
> +};
> +
> +static const char *sccid_to_name(unsigned long sccid)
> +{
> +	unsigned long id = sccid >> 16;
> +	unsigned int i;
> +
> +	for (i = 0 ; i < ARRAY_SIZE(chip_id_table) ; ++i) {
> +		if (chip_id_table[i].id == id)
> +			return chip_id_table[i].name;
> +	}
> +
> +	return "Unknown";
> +}
> +
> +static const char *sccid_to_rev(unsigned long sccid)
> +{
> +	char letter, digit;
> +
> +	letter = (sccid >> 8) & 0xf;
> +	letter = (letter - 1) + 'A';
> +
> +	digit = sccid & 0xff;
> +	digit = (digit - 1) + '0';
> +
> +	return kasprintf(GFP_KERNEL, "%c%c", letter, digit);
> +}
> +
> +static int __init wmt_socinfo_init(void)
> +{
> +	struct soc_device_attribute *attrs;
> +	struct soc_device *soc_dev;
> +	struct device_node *np;
> +	void __iomem *reg;
> +	unsigned long sccid;
> +	const char *machine = NULL;
> +
> +	np = of_find_compatible_node(NULL, NULL, "via,scc-id");
> +	if (!of_device_is_available(np)) {
> +		of_node_put(np);
> +		return -ENODEV;
> +	}
> +
> +	reg = of_iomap(np, 0);

of_node_put(np) here... although this will be dropped (see below)


> +	if (!reg) {
> +		of_node_put(np);
> +		return -ENODEV;
> +	}
> +	sccid = readl(reg);
> +	iounmap(reg);
> +
> +	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs)
> +		return -ENODEV;
> +
> +	/*
> +	 * Machine: VIA APC Rock
> +	 * Family: WM8850
> +	 * Revision: A2
> +	 * SoC ID: raw silicon revision id (0x34810103)
> +	 */
> +
> +	np = of_find_node_by_path("/");
> +	of_property_read_string(np, "model", &machine);
> +	if (machine)
> +		attrs->machine = kstrdup(machine, GFP_KERNEL);
> +	of_node_put(np);
> +
> +	attrs->family = sccid_to_name(sccid);
> +	attrs->revision = sccid_to_rev(sccid);
> +	attrs->soc_id = kasprintf(GFP_KERNEL, "%08lx", sccid);
> +
> +	soc_dev = soc_device_register(attrs);
> +	if (IS_ERR(soc_dev)) {
> +		kfree(attrs->machine);
> +		kfree(attrs->soc_id);
> +		kfree(attrs->revision);
> +		kfree(attrs);
> +		return PTR_ERR(soc_dev);
> +	}
> +
> +	pr_info("VIA/WonderMedia %s rev %s (%s)\n",
> +			attrs->family,
> +			attrs->revision,
> +			attrs->soc_id);
> +
> +	return 0;
> +}
> +early_initcall(wmt_socinfo_init);

No, this does not scale. This is supposed to be module_platform_driver
instead of manually re-ordering code. Then all your memory allocations
become devm, printks become dev_xxx and you can simplify it.


> 


Best regards,
Krzysztof
