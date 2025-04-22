Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E3214C5B0;
	Tue, 22 Apr 2025 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344524; cv=none; b=LYuGXXJdWNwgeo5TrpnC6ZnImDkqzNeKKKYSAe4UrYlwn0P25zXr62mKEP9RYEo/xd8RO5esO65RKZmzfWO8g9SaOf63jgXGZfulzgeyiXowAHoSL+P/9mRiZnhcmeDDVuvhIPnEAH0yFreXLqcTVa9xuOxHq46wmY0mAWC9NYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344524; c=relaxed/simple;
	bh=AnJYD61jr/FSt2EiDXtslxjpjqF54+ODebn6BtqAd44=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=LLvaVC8lByFCQCSCfsmuKs9GrDpRLaSuJG78hj4gMFyPK3FkzWSvi1CY+HAEHLHE403wDo8RKLLuJoEn/S4sNaUjvkUWMysglyzA1BW40t4+O+cevU8ehopKm9um6wBjEvydXcSWOOJxxXg/KSxcC/0oGKgpWLK5/eWjJGgZ4/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=J2Es+qjo; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="J2Es+qjo"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 7HpquBgvsJby27HptuKR9x; Tue, 22 Apr 2025 19:55:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745344511;
	bh=qHWt4pZ1VXASLNsb4uqGnAGvHepdPrEexGPZ0W0j1Mk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=J2Es+qjoheXsjvjS1lVN2OCPyR8/TtNEUx8DBVLyZOtTbFiEhvPkNdHvL/51sMmPw
	 eI2PMl7nflgaFlguc8DaDIj+AUZ3RkAGZ6r8HsmwA6/wYX2o6hZqJ2lMcYetoNrJjL
	 1JZ5PxKMYWR/8Ympb7gb8q06wBihys9yph5vd+NmTxme+x8HXzWgM8YFJhv/GpZFZK
	 KmuQKIIyySNd+y7M0PxWzxUozMfcqpkNs3LOJ/EVNqFPd6rR2FNERctJMiwb62ywYi
	 lnjlaO1+Syxd65UhUfDJ4Oid0ghM6h+uZ5gPSqC0BdKsExN2sxozKG0/6wuM1vZiZR
	 Ya5pJ8rKIHpCQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 22 Apr 2025 19:55:11 +0200
X-ME-IP: 90.11.132.44
Message-ID: <07f67b94-adc1-41a9-b7f7-9e1f8f751290@wanadoo.fr>
Date: Tue, 22 Apr 2025 19:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] memory: Add STM32 Octo Memory Manager driver
References: <20250422-upstream_ospi_v6-v10-0-6f4942a04e10@foss.st.com>
 <20250422-upstream_ospi_v6-v10-2-6f4942a04e10@foss.st.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: patrice.chotard@foss.st.com
Cc: alexandre.torgue@foss.st.com, catalin.marinas@arm.com,
 christophe.kerello@foss.st.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 p.zabel@pengutronix.de, robh@kernel.org, will@kernel.org
In-Reply-To: <20250422-upstream_ospi_v6-v10-2-6f4942a04e10@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 22/04/2025 à 10:44, Patrice Chotard a écrit :
> Octo Memory Manager driver (OMM) manages:
>    - the muxing between 2 OSPI busses and 2 output ports.
>      There are 4 possible muxing configurations:
>        - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>          output is on port 2
>        - OSPI1 and OSPI2 are multiplexed over the same output port 1
>        - swapped mode (no multiplexing), OSPI1 output is on port 2,
>          OSPI2 output is on port 1
>        - OSPI1 and OSPI2 are multiplexed over the same output port 2
>    - the split of the memory area shared between the 2 OSPI instances.
>    - chip select selection override.
>    - the time between 2 transactions in multiplexed mode.
>    - check firewall access.

Hi,

2 small questions below.

> +static int stm32_omm_disable_child(struct device *dev)
> +{
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	struct reset_control *reset;
> +	int ret;
> +	u8 i;
> +
> +	ret = stm32_omm_toggle_child_clock(dev, true);
> +	if (!ret)
> +		return ret;
> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
> +		reset = omm->child_reset[i];
> +		ret = reset_control_acquire(reset);
> +		if (ret) {
> +			dev_err(dev, "Can not acquire resset %d\n", ret);

Should stm32_omm_toggle_child_clock(dev, false);
be called here?

> +			return ret;
> +		}
> +
> +		reset_control_assert(reset);
> +		udelay(2);
> +		reset_control_deassert(reset);
> +
> +		reset_control_release(reset);
> +	}
> +
> +	return stm32_omm_toggle_child_clock(dev, false);
> +}

...

> +static int stm32_omm_probe(struct platform_device *pdev)
> +{
> +	static const char * const resets_name[] = {"ospi1", "ospi2"};
> +	struct device *dev = &pdev->dev;
> +	u8 child_access_granted = 0;
> +	struct stm32_omm *omm;
> +	int i, ret;
> +
> +	omm = devm_kzalloc(dev, sizeof(*omm), GFP_KERNEL);
> +	if (!omm)
> +		return -ENOMEM;
> +
> +	omm->io_base = devm_platform_ioremap_resource_byname(pdev, "regs");
> +	if (IS_ERR(omm->io_base))
> +		return PTR_ERR(omm->io_base);
> +
> +	omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
> +	if (IS_ERR(omm->mm_res))
> +		return PTR_ERR(omm->mm_res);
> +
> +	/* check child's access */
> +	for_each_child_of_node_scoped(dev->of_node, child) {
> +		if (omm->nb_child >= OMM_CHILD_NB) {
> +			dev_err(dev, "Bad DT, found too much children\n");
> +			return -E2BIG;
> +		}
> +
> +		ret = stm32_omm_check_access(child);
> +		if (ret < 0 && ret != -EACCES)
> +			return ret;
> +
> +		if (!ret)
> +			child_access_granted++;
> +
> +		omm->nb_child++;
> +	}
> +
> +	if (omm->nb_child != OMM_CHILD_NB)
> +		return -EINVAL;
> +
> +	platform_set_drvdata(pdev, omm);
> +
> +	devm_pm_runtime_enable(dev);
> +
> +	/* check if OMM's resource access is granted */
> +	ret = stm32_omm_check_access(dev->of_node);
> +	if (ret < 0 && ret != -EACCES)
> +		return ret;
> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		omm->child_reset[i] = devm_reset_control_get_exclusive_released(dev,
> +										resets_name[i]);
> +
> +		if (IS_ERR(omm->child_reset[i]))
> +			return dev_err_probe(dev, PTR_ERR(omm->child_reset[i]),
> +					     "Can't get %s reset\n", resets_name[i]);
> +	}
> +
> +	if (!ret && child_access_granted == OMM_CHILD_NB) {
> +		ret = stm32_omm_configure(dev);
> +		if (ret)
> +			return ret;
> +	} else {
> +		dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
> +		/*
> +		 * AMCR can't be set, so check if current value is coherent
> +		 * with memory-map areas defined in DT
> +		 */
> +		ret = stm32_omm_set_amcr(dev, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		dev_err(dev, "Failed to create Octo Memory Manager child\n");

Should something like the code in the remove function be called here?

Also, maybe return dev_err_probe() and return 0; below?

> +
> +	return ret;
> +}

...

CJ

