Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1502412CDAE;
	Wed,  9 Apr 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212562; cv=none; b=EDUKzTswluR/gndZtquUgGaWoD0sJzAWwrD3WBLxzfW4d724uU/z5YXPCa5+OxKrOsmjk8KU7QgTclRnJOwvCIM4UgmtSgT8NbW0+UoASgZpqEhGEt/ODz9aXI084kPH3DgnsDe2urUbsUgJNWiKCRjuoz/5JNhrdbZhF0Q7UIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212562; c=relaxed/simple;
	bh=/1SbtZj8beAyfhwz2+xNoWN7WktXt/kcKxlWjhv26yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lhSa1l1wufV0MjPtCo4GWyBtVU3FGI9P7L/Nx9rvkXIdJLlSl+yKPZncg6RA8OHWqpq5VrzuowM6wxom/1Fdo9E8MnS7LTP5RMnStJnridFtUBooue72x+S1gRYQtMzSIHdEzu/eXhmXBxcG+N6ZBZzHpfFN0iUk0HZNX7DcJRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=eiayKayA; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="eiayKayA"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539D8icv003194;
	Wed, 9 Apr 2025 17:29:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	hpa9K+wNh4oJ2LRlmAIjHvhW9aEqVDhXK75Pfw8BenY=; b=eiayKayAVUwlt269
	w+8CDjJhSdvdAl2e4z82UayeCMnxMHjC9y3JxI8djkY99/rCKCIkm2ndQfxFV6QI
	tx+3xbuYMDDYjrhzhVrDqT6Jhmpz6IEYNalUQYxWRirRh5IHmBXBA6ShcV0G/TA6
	4qZK3CzlgMVdh69aRZ/1y+po1pyxwD3L2gfus2KF32H1D0qMxo8jGFntOWDf8t6/
	E/vrkVpH8ERbFRNeRxo2q7VWMf1TZAwQ8lyVcR+TG9NN/J89QhlaXcoV8Y9c857Z
	OrhyJnx/yrd0Lc+HCONwox+XHHWkr1uaUVxD1ZJ/3CxrCCwgI3EcyYRos0cXV1yd
	K5/v7Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw5gbutv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 17:29:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8F28640052;
	Wed,  9 Apr 2025 17:27:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 337489FE57A;
	Wed,  9 Apr 2025 17:27:08 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 17:27:07 +0200
Message-ID: <cfa0826d-92b4-4cf5-9f24-737ed1fd16ed@foss.st.com>
Date: Wed, 9 Apr 2025 17:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] memory: Add STM32 Octo Memory Manager driver
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <christophe.kerello@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250407-upstream_ospi_v6-v8-3-7b7716c1c1f6@foss.st.com>
 <20250408-shiny-whimsical-pigeon-4e2c9a@shite>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250408-shiny-whimsical-pigeon-4e2c9a@shite>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01



On 4/8/25 09:00, Krzysztof Kozlowski wrote:
> On Mon, Apr 07, 2025 at 03:27:34PM GMT, Patrice Chotard wrote:
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		idx = of_property_match_string(dev->of_node,
>> +					       "memory-region-names",
>> +					       mm_name[i]);
>> +		if (idx < 0)
>> +			continue;
>> +
>> +		/* res1 only used on second loop iteration */
>> +		res1.start = res.start;
>> +		res1.end = res.end;
>> +
>> +		node = of_parse_phandle(dev->of_node, "memory-region", idx);
>> +		if (!node)
>> +			continue;
>> +
>> +		ret = of_address_to_resource(node, 0, &res);
>> +		if (ret) {
>> +			dev_err(dev, "unable to resolve memory region\n");
> 
> Where do you drop reference to node?

right, will add of_node_put() here

> 
>> +			return ret;
>> +		}
>> +
>> +		/* check that memory region fits inside OMM memory map area */
>> +		if (!resource_contains(omm->mm_res, &res)) {
>> +			dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
>> +				mm_name[i]);
>> +			dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);
>> +
>> +			return -EFAULT;
>> +		}
>> +
>> +		if (i == 1) {
>> +			mm_ospi2_size = resource_size(&res);
>> +
>> +			/* check that OMM memory region 1 doesn't overlap memory region 2 */
>> +			if (resource_overlaps(&res, &res1)) {
>> +				dev_err(dev, "OMM memory-region %s overlaps memory region %s\n",
>> +					mm_name[0], mm_name[1]);
>> +				dev_err(dev, "%pR overlaps %pR\n", &res1, &res);
>> +
>> +				return -EFAULT;
>> +			}
>> +		}
>> +	}
>> +
>> +	syscfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "st,syscfg-amcr");
>> +	if (IS_ERR(syscfg_regmap))
>> +		return dev_err_probe(dev, PTR_ERR(syscfg_regmap),
>> +				     "Failed to get st,syscfg-amcr property\n");
>> +
>> +	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 1,
>> +					 &amcr_base);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 2,
>> +					 &amcr_mask);
>> +	if (ret)
>> +		return ret;
>> +
>> +	amcr = mm_ospi2_size / SZ_64M;
>> +
>> +	if (set)
>> +		regmap_update_bits(syscfg_regmap, amcr_base, amcr_mask, amcr);
>> +
>> +	/* read AMCR and check coherency with memory-map areas defined in DT */
>> +	regmap_read(syscfg_regmap, amcr_base, &read_amcr);
>> +	read_amcr = read_amcr >> (ffs(amcr_mask) - 1);
>> +
>> +	if (amcr != read_amcr) {
>> +		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int stm32_omm_toggle_child_clock(struct device *dev, bool enable)
>> +{
>> +	/* As there is only 2 children, remember first child in case of error */
>> +	struct clk *first_child_clk = NULL;
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +	u8 i;
> 
> iterations are always unsigned ints (or ints), not other types.

ok

> 
>> +	int ret;
>> +
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		if (enable) {
>> +			ret = clk_prepare_enable(omm->clk_bulk[i + 1].clk);
>> +			if (ret) {
>> +				if (first_child_clk)
>> +					clk_disable_unprepare(first_child_clk);
>> +
>> +				dev_err(dev, "Can not enable clock\n");
> 
> That's unnecessary complicated. Instead create error handling label,
> goto it and unwind iterating from last position of 'i'.

ok

> 
>> +				return ret;
>> +			}
>> +		} else {
>> +			clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
>> +		}
>> +
>> +		first_child_clk = omm->clk_bulk[i + 1].clk;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_omm_disable_child(struct device *dev)
>> +{
>> +	static const char * const resets_name[] = {"ospi1", "ospi2"};
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +	struct reset_control *reset;
>> +	int ret;
>> +	u8 i;
>> +
>> +	ret = stm32_omm_toggle_child_clock(dev, true);
>> +	if (!ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		reset = reset_control_get_exclusive(dev, resets_name[i]);
>> +		if (IS_ERR(reset)) {
>> +			dev_err(dev, "Can't get %s reset\n", resets_name[i]);
> 
> You should acquire resources in the probe, not on every suspend/resume.
> Then you can use `return dev_err_probe`.

ok

> 
>> +			return PTR_ERR(reset);
>> +		};
>> +
>> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
>> +		reset_control_assert(reset);
>> +		udelay(2);
>> +		reset_control_deassert(reset);
>> +
>> +		reset_control_put(reset);
>> +	}
>> +
>> +	return stm32_omm_toggle_child_clock(dev, false);
>> +}
>> +
>> +static int stm32_omm_configure(struct device *dev)
>> +{
>> +	static const char * const clocks_name[] = {"omm", "ospi1", "ospi2"};
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +	unsigned long clk_rate_max = 0;
>> +	u32 mux = 0;
>> +	u32 cssel_ovr = 0;
>> +	u32 req2ack = 0;
>> +	struct reset_control *rstc;
>> +	unsigned long clk_rate;
>> +	int ret;
>> +	u8 i;
>> +
>> +	for (i = 0; i < OMM_CLK_NB; i++)
>> +		omm->clk_bulk[i].id = clocks_name[i];
>> +
>> +	/* retrieve OMM, OSPI1 and OSPI2 clocks */
>> +	ret = devm_clk_bulk_get(dev, OMM_CLK_NB, omm->clk_bulk);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get OMM/OSPI's clocks\n");
>> +
>> +	/* Ensure both OSPI instance are disabled before configuring OMM */
>> +	ret = stm32_omm_disable_child(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* parse children's clock */
>> +	for (i = 1; i <= omm->nb_child; i++) {
>> +		clk_rate = clk_get_rate(omm->clk_bulk[i].clk);
>> +		if (!clk_rate) {
>> +			dev_err(dev, "Invalid clock rate\n");
>> +			goto err_clk_disable;
> 
> That's a confusing label - it jumps to PM put, not clk disable. It
> isn't matching the source of error either (get rate, not clock disable).

ok

> 
>> +		}
>> +
>> +		if (clk_rate > clk_rate_max)
>> +			clk_rate_max = clk_rate;
>> +	}
>> +
>> +	rstc = devm_reset_control_get_exclusive(dev, "omm");
>> +	if (IS_ERR(rstc))
>> +		return dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
>> +
>> +	reset_control_assert(rstc);
>> +	udelay(2);
>> +	reset_control_deassert(rstc);
>> +
>> +	omm->cr = readl_relaxed(omm->io_base + OMM_CR);
>> +	/* optional */
>> +	ret = of_property_read_u32(dev->of_node, "st,omm-mux", &mux);
>> +	if (!ret) {
>> +		if (mux & CR_MUXEN) {
>> +			ret = of_property_read_u32(dev->of_node, "st,omm-req2ack-ns",
>> +						   &req2ack);
>> +			if (!ret && !req2ack) {
>> +				req2ack = DIV_ROUND_UP(req2ack, NSEC_PER_SEC / clk_rate_max) - 1;
>> +
>> +				if (req2ack > 256)
>> +					req2ack = 256;
>> +			}
>> +
>> +			req2ack = FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
>> +
>> +			omm->cr &= ~CR_REQ2ACK_MASK;
>> +			omm->cr |= FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
>> +
>> +			/*
>> +			 * If the mux is enabled, the 2 OSPI clocks have to be
>> +			 * always enabled
>> +			 */
>> +			ret = stm32_omm_toggle_child_clock(dev, true);
>> +			if (ret)
>> +				goto err_clk_disable;
>> +		}
>> +
>> +		omm->cr &= ~CR_MUXENMODE_MASK;
>> +		omm->cr |= FIELD_PREP(CR_MUXENMODE_MASK, mux);
>> +	}
>> +
>> +	/* optional */
>> +	ret = of_property_read_u32(dev->of_node, "st,omm-cssel-ovr", &cssel_ovr);
>> +	if (!ret) {
>> +		omm->cr &= ~CR_CSSEL_OVR_MASK;
>> +		omm->cr |= FIELD_PREP(CR_CSSEL_OVR_MASK, cssel_ovr);
>> +		omm->cr |= CR_CSSEL_OVR_EN;
>> +	}
>> +
>> +	omm->restore_omm = true;
>> +	writel_relaxed(omm->cr, omm->io_base + OMM_CR);
>> +
>> +	ret = stm32_omm_set_amcr(dev, true);
>> +
>> +err_clk_disable:
>> +	pm_runtime_put_sync_suspend(dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int stm32_omm_check_access(struct device_node *np)
>> +{
>> +	struct stm32_firewall firewall;
>> +	int ret;
>> +
>> +	ret = stm32_firewall_get_firewall(np, &firewall, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return stm32_firewall_grant_access(&firewall);
>> +}
>> +
>> +static int stm32_omm_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	u8 child_access_granted = 0;
>> +	struct stm32_omm *omm;
>> +	int ret;
>> +
>> +	omm = devm_kzalloc(dev, sizeof(*omm), GFP_KERNEL);
>> +	if (!omm)
>> +		return -ENOMEM;
>> +
>> +	omm->io_base = devm_platform_ioremap_resource_byname(pdev, "regs");
>> +	if (IS_ERR(omm->io_base))
>> +		return PTR_ERR(omm->io_base);
>> +
>> +	omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
>> +	if (IS_ERR(omm->mm_res))
>> +		return PTR_ERR(omm->mm_res);
>> +
>> +	/* check child's access */
>> +	for_each_child_of_node_scoped(dev->of_node, child) {
>> +		if (omm->nb_child >= OMM_CHILD_NB) {
>> +			dev_err(dev, "Bad DT, found too much children\n");
>> +			return -E2BIG;
>> +		}
>> +
>> +		if (!of_device_is_compatible(child, "st,stm32mp25-ospi"))
>> +			return -EINVAL;
> 
> continue;
> 
> or better just drop the code - you are not supposed to validate the DTB.
> DT schema's job is for that.

ok

> 
>> +
>> +		ret = stm32_omm_check_access(child);
>> +		if (ret < 0 && ret != -EACCES)
>> +			return ret;
>> +
>> +		if (!ret)
>> +			child_access_granted++;
>> +
>> +		omm->nb_child++;
>> +	}
>> +
>> +	if (omm->nb_child != OMM_CHILD_NB)
>> +		return -EINVAL;
>> +
>> +	platform_set_drvdata(pdev, omm);
>> +
>> +	pm_runtime_enable(dev);
>> +
>> +	/* check if OMM's resource access is granted */
>> +	ret = stm32_omm_check_access(dev->of_node);
>> +	if (ret < 0 && ret != -EACCES)
>> +		goto error;
>> +
>> +	if (!ret && child_access_granted == OMM_CHILD_NB) {
>> +		ret = stm32_omm_configure(dev);
>> +		if (ret)
>> +			goto error;
>> +	} else {
>> +		dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
>> +		/*
>> +		 * AMCR can't be set, so check if current value is coherent
>> +		 * with memory-map areas defined in DT
>> +		 */
>> +		ret = stm32_omm_set_amcr(dev, false);
>> +		if (ret)
>> +			goto error;
>> +	}
>> +
>> +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to create Octo Memory Manager child\n");
>> +		of_platform_depopulate(dev);
> 
> That's odd. Why do you depopulate if populate did not happen? Anyway,
> don't mix devm with standard error paths, so this all should be handled
> by devm.

ok

> 
>> +		ret = -EINVAL;
>> +		goto error;
>> +	}
>> +
>> +	return ret;
>> +
>> +error:
>> +	pm_runtime_disable(dev);
> 
> This as well


ok
> 
>> +
>> +	return ret;
>> +
>> +}
>> +
>> +static void stm32_omm_remove(struct platform_device *pdev)
>> +{
>> +	struct stm32_omm *omm = platform_get_drvdata(pdev);
>> +
>> +	of_platform_depopulate(&pdev->dev);
>> +	if (omm->cr & CR_MUXEN)
>> +		stm32_omm_toggle_child_clock(&pdev->dev, false);
> 
> This as well, via devm calback.

ok

> 
>> +
>> +	pm_runtime_disable(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id stm32_omm_of_match[] = {
>> +	{ .compatible = "st,stm32mp25-omm", },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_omm_of_match);
> 
> Best regards,
> Krzysztof
> 
