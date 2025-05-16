Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ABC2367C4;
	Fri, 16 May 2025 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399837; cv=none; b=e1HXXhgasdhEER+VXwaKASjgTFyB3qPi5R4/QFBNHFYtd9VCBg7ASudGqWr0nLUwJ0f9sW9VBJ7I+T6rK0qdC5exT1HqkX6zG0Fr+dF4NIiHen6+OvO9GRsR4H+upa6pBK9K5Z+rvKC2hByFaIaf2M558fMcaV5g1++e/SvI7ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399837; c=relaxed/simple;
	bh=EIeNaMhAQEKBU5kfqSd6zp7mh+1oorSEUk+so/0Y3jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GN3SAhrTKEiwc++4bpZpLH69ZMtuNIkht8h7RluCF4QJK2YgrqATnyVAwfT4nNoemSyR86HK5jDwJiE7Z28rOaCMKKWHaOZjB6kPCVUnfHkRXTiUi1yAVlVb/BLkEQrnPwtvzFjp+p88WkQdd+hbftW+4hsOL0ha7tY7Jq4Wd1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIEDDkLd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIEDDkLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CC1C4CEE4;
	Fri, 16 May 2025 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747399837;
	bh=EIeNaMhAQEKBU5kfqSd6zp7mh+1oorSEUk+so/0Y3jY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cIEDDkLd2GN9wC6gw62OtkCQ4AmdaKiNtCQK4aQQZjJCMCww6XGBE9JHmqee3Pne2
	 Mv2sHZpSRJZ9dcEjE6MNytZviH2DMQVRCXALbo++IBD+npUOE97SyRHXxGpi8hxw8E
	 +vhA6anJ8Cl/IMAJsbRBawmqKDoivpvqgZ5tpent1bcXulIomFlBWj0WSUGfaadEgh
	 1ZQCWmgI/nKmV6xEx1yO66aeHSjdmZ6DWqpEey1Tzf5AL1TZjmOxY08M2V2u/YQHLF
	 MXnGRMvLmxuwYrbKjwArq5hwQPbc03daP5tvjsORLxCy4hpX3qb7X3+oLd3BjfjFtH
	 LyJW82YoBSHzw==
Message-ID: <5e35d79b-06e7-4b19-87fc-a2087a3434c2@kernel.org>
Date: Fri, 16 May 2025 14:50:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] usb: dwc3: eic7700: Add EIC7700 usb driver
To: zhangsenchuan@eswincomputing.com, gregkh@linuxfoundation.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 yangwei1@eswincomputing.com
References: <20250516095237.1516-1-zhangsenchuan@eswincomputing.com>
 <20250516095408.704-1-zhangsenchuan@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250516095408.704-1-zhangsenchuan@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2025 11:54, zhangsenchuan@eswincomputing.com wrote:
> +static ssize_t dwc3_mode_store(struct device *device,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(device);
> +	struct dwc3 *dwc = eswin->dwc;
> +	enum usb_role new_role;
> +	struct usb_role_switch *role_sw = dwc->role_sw;
> +
> +	if (!strncmp(buf, "1", 1) || !strncmp(buf, "host", 4)) {
> +		new_role = USB_ROLE_HOST;
> +	} else if (!strncmp(buf, "0", 1) || !strncmp(buf, "peripheral", 10)) {
> +		new_role = USB_ROLE_DEVICE;
> +	} else {
> +		dev_info(eswin->dev, "illegal dr_mode\n");
> +		return count;
> +	}
> +	eswin->force_mode = true;
> +
> +	mutex_lock(&eswin->lock);
> +	usb_role_switch_set_role(role_sw, new_role);
> +	mutex_unlock(&eswin->lock);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dwc3_mode);

Missing ABI documentation. Anyway, unlikely this will be accepted.


> +
> +static ssize_t dwc3_hub_rst_show(struct device *device,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(device);
> +
> +	if (!IS_ERR(eswin->hub_gpio))
> +		return sprintf(buf, "%d", gpiod_get_raw_value(eswin->hub_gpio));
> +
> +	return sprintf(buf, "UNKONWN");
> +}
> +
> +static ssize_t dwc3_hub_rst_store(struct device *device,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(device);
> +
> +	if (!IS_ERR(eswin->hub_gpio)) {
> +		if (!strncmp(buf, "0", 1))
> +			gpiod_set_raw_value(eswin->hub_gpio, 0);
> +		else
> +			gpiod_set_raw_value(eswin->hub_gpio, 1);
> +	}
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dwc3_hub_rst);
> +
> +static struct attribute *dwc3_eswin_attrs[] = {
> +	&dev_attr_dwc3_mode.attr,
> +	&dev_attr_dwc3_hub_rst.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group dwc3_eswin_attr_group = {
> +	.name = NULL, /* we want them in the same directory */
> +	.attrs = dwc3_eswin_attrs,
> +};
> +
> +static int dwc3_eswin_device_notifier(struct notifier_block *nb,
> +				      unsigned long event, void *ptr)
> +{
> +	struct dwc3_eswin *eswin =
> +		container_of(nb, struct dwc3_eswin, device_nb);
> +
> +	mutex_lock(&eswin->lock);
> +	eswin->new_usb_role = USB_ROLE_DEVICE;
> +	mutex_unlock(&eswin->lock);
> +	if (!eswin->suspended)
> +		schedule_work(&eswin->otg_work);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int dwc3_eswin_host_notifier(struct notifier_block *nb,
> +				    unsigned long event, void *ptr)
> +{
> +	struct dwc3_eswin *eswin = container_of(nb, struct dwc3_eswin, host_nb);
> +
> +	mutex_lock(&eswin->lock);
> +	eswin->new_usb_role = USB_ROLE_HOST;
> +	mutex_unlock(&eswin->lock);
> +	if (!eswin->suspended)
> +		schedule_work(&eswin->otg_work);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void dwc3_eswin_otg_extcon_evt_work(struct work_struct *work)
> +{
> +	struct dwc3_eswin *eswin =
> +		container_of(work, struct dwc3_eswin, otg_work);
> +	struct usb_role_switch *role_sw = eswin->dwc->role_sw;
> +
> +	if (true == eswin->force_mode)
> +		return;
> +	mutex_lock(&eswin->lock);
> +	usb_role_switch_set_role(role_sw, eswin->new_usb_role);
> +	mutex_unlock(&eswin->lock);
> +}
> +
> +static int dwc3_eswin_get_extcon_dev(struct dwc3_eswin *eswin)
> +{
> +	struct device *dev = eswin->dev;
> +	struct extcon_dev *edev;
> +	s32 ret = 0;
> +
> +	if (device_property_read_bool(dev, "extcon")) {

extcon is not a bool. This is just wrong... plus undocumented ABI.


> +		edev = extcon_get_edev_by_phandle(dev, 0);
> +		if (IS_ERR(edev)) {
> +			if (PTR_ERR(edev) != -EPROBE_DEFER)
> +				dev_err(dev, "couldn't get extcon device\n");
> +			return PTR_ERR(edev);

Do not open code dev_err_probe.

> +		}
> +		eswin->edev = edev;
> +		eswin->device_nb.notifier_call = dwc3_eswin_device_notifier;
> +		ret = devm_extcon_register_notifier(dev, edev, EXTCON_USB,
> +						    &eswin->device_nb);
> +		if (ret < 0)
> +			dev_err(dev, "failed to register notifier for USB\n");
> +
> +		eswin->host_nb.notifier_call = dwc3_eswin_host_notifier;
> +		ret = devm_extcon_register_notifier(dev, edev, EXTCON_USB_HOST,
> +						    &eswin->host_nb);
> +		if (ret < 0)
> +			dev_err(dev,
> +				"failed to register notifier for USB-HOST\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init dwc3_eswin_deassert(struct dwc3_eswin *eswin)

That's wrong annotation. You did not build your kernel with DEBUG
SECTION MISMATCH.

> +{
> +	int rc;
> +
> +	if (eswin->vaux_rst) {
> +		rc = reset_control_deassert(eswin->vaux_rst);
> +		WARN_ON(rc != 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc3_eswin_assert(struct dwc3_eswin *eswin)
> +{
> +	int rc = 0;
> +
> +	if (eswin->vaux_rst) {
> +		rc = reset_control_assert(eswin->vaux_rst);
> +		WARN_ON(rc != 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc_usb_clk_init(struct device *dev)
> +{
> +	struct regmap *regmap;
> +	u32 hsp_usb_bus;
> +	u32 hsp_usb_axi_lp;
> +	u32 hsp_usb_vbus_freq;
> +	u32 hsp_usb_mpll;
> +	int ret;
> +
> +	regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						 "eswin,hsp_sp_csr");
> +	if (IS_ERR(regmap)) {
> +		dev_dbg(dev, "No hsp_sp_csr phandle specified\n");
> +		return -1;
> +	}
> +	ret = of_property_read_u32_index(dev->of_node, "eswin,hsp_sp_csr", 1,
> +					 &hsp_usb_bus);
> +	if (ret) {
> +		dev_err(dev, "can't get usb sid cfg reg offset (%d)\n", ret);
> +		return ret;
> +	}
> +	ret = of_property_read_u32_index(dev->of_node, "eswin,hsp_sp_csr", 2,
> +					 &hsp_usb_axi_lp);
> +	if (ret) {
> +		dev_err(dev, "can't get usb sid cfg reg offset (%d)\n", ret);
> +		return ret;
> +	}
> +	ret = of_property_read_u32_index(dev->of_node, "eswin,hsp_sp_csr", 3,
> +					 &hsp_usb_vbus_freq);
> +	if (ret) {
> +		dev_err(dev, "can't get usb sid cfg reg offset (%d)\n", ret);
> +		return ret;
> +	}
> +	ret = of_property_read_u32_index(dev->of_node, "eswin,hsp_sp_csr", 4,
> +					 &hsp_usb_mpll);
> +	if (ret) {
> +		dev_err(dev, "can't get usb sid cfg reg offset (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * usb1 clock init
> +	 * ref clock is 24M, below need to be set to satisfy usb phy requirement(125M)
> +	 */
> +	regmap_write(regmap, hsp_usb_vbus_freq, HSP_USB_VBUS_FSEL);
> +	regmap_write(regmap, hsp_usb_mpll, HSP_USB_MPLL_DEFAULT);
> +	/*
> +	 * reset usb core and usb phy
> +	 */
> +	regmap_write(regmap, hsp_usb_bus,
> +		     HSP_USB_BUS_FILTER_EN | HSP_USB_BUS_CLKEN_GM |
> +			     HSP_USB_BUS_CLKEN_GS | HSP_USB_BUS_SW_RST |
> +			     HSP_USB_BUS_CLK_EN);
> +	regmap_write(regmap, hsp_usb_axi_lp,
> +		     HSP_USB_AXI_LP_XM_CSYSREQ | HSP_USB_AXI_LP_XS_CSYSREQ);
> +
> +	return 0;
> +}
> +
> +static int dwc3_eswin_probe(struct platform_device *pdev)
> +{
> +	struct dwc3_eswin *eswin;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node, *child;
> +	struct platform_device *child_pdev;
> +	unsigned int count;
> +	int ret;
> +	int i;
> +	int err_desc = 0;
> +
> +	eswin = devm_kzalloc(dev, sizeof(*eswin), GFP_KERNEL);
> +	if (!eswin)
> +		return -ENOMEM;
> +	eswin->hub_gpio = devm_gpiod_get(dev, "hub-rst", GPIOD_OUT_HIGH);
> +	err_desc = IS_ERR(eswin->hub_gpio);
> +
> +	if (!err_desc)
> +		gpiod_set_raw_value(eswin->hub_gpio, 1);
> +
> +	count = of_clk_get_parent_count(np);
> +	if (!count)
> +		return -ENOENT;
> +
> +	eswin->num_clocks = count;
> +	eswin->force_mode = false;
> +	eswin->clks = devm_kcalloc(dev, eswin->num_clocks, sizeof(struct clk *),
> +				   GFP_KERNEL);
> +	if (!eswin->clks)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, eswin);
> +
> +	mutex_init(&eswin->lock);
> +
> +	eswin->dev = dev;
> +
> +	mutex_lock(&eswin->lock);

I don't understand the point of it. Explain me, what are you protecting
here from what? How is it possible?

> +
> +	for (i = 0; i < eswin->num_clocks; i++) {
> +		struct clk *clk;
> +
> +		clk = of_clk_get(np, i);

No, use devm_clk_Get

> +		if (IS_ERR(clk)) {
> +			ret = PTR_ERR(clk);
> +			goto err0;
> +		}
> +		ret = clk_prepare_enable(clk);
> +		if (ret < 0) {
> +			clk_put(clk);
> +			goto err0;
> +		}
> +
> +		eswin->clks[i] = clk;

Use get_enabled and bulk api.

> +	}
> +
> +	eswin->vaux_rst = devm_reset_control_get(dev, "vaux");
> +	if (IS_ERR_OR_NULL(eswin->vaux_rst)) {

OR_NULL? Why?

> +		dev_err(dev, "Failed to asic0_rst handle\n");

Syntax is always: retrun dev_err_probe

> +		return -EFAULT;

No, return proper error codes.

> +	}
> +
> +	dwc3_eswin_deassert(eswin);
> +	dwc_usb_clk_init(dev);
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "get_sync failed with err %d\n", ret);
> +		goto err1;
> +	}
> +
> +	child = of_get_child_by_name(np, "dwc3");
> +	if (!child) {
> +		dev_err(dev, "failed to find dwc3 core node\n");
> +		ret = -ENODEV;
> +		goto err1;
> +	}
> +	/* Allocate and initialize the core */
> +	ret = of_platform_populate(np, NULL, NULL, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to create dwc3 core\n");
> +		goto err1;
> +	}
> +
> +	INIT_WORK(&eswin->otg_work, dwc3_eswin_otg_extcon_evt_work);
> +	child_pdev = of_find_device_by_node(child);
> +	if (!child_pdev) {
> +		dev_err(dev, "failed to find dwc3 core device\n");
> +		ret = -ENODEV;
> +		goto err2;
> +	}
> +	eswin->dwc = platform_get_drvdata(child_pdev);
> +	if (!eswin->dwc) {
> +		dev_err(dev, "failed to get drvdata dwc3\n");
> +		ret = -EPROBE_DEFER;
> +		goto err2;
> +	}
> +	eswin->child_dev = &child_pdev->dev;
> +	ret = dwc3_eswin_get_extcon_dev(eswin);
> +	if (ret < 0)
> +		dev_err(dev, "couldn't get extcon device: %d\n", ret);
> +
> +	mutex_unlock(&eswin->lock);
> +	ret = sysfs_create_group(&dev->kobj, &dwc3_eswin_attr_group);
> +	if (ret)
> +		dev_err(dev, "failed to create sysfs group: %d\n", ret);
> +
> +	return ret;
> +err2:
> +	cancel_work_sync(&eswin->otg_work);
> +	of_platform_depopulate(dev);
> +
> +err1:
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +	dwc3_eswin_assert(eswin);
> +err0:
> +	for (i = 0; i < eswin->num_clocks && eswin->clks[i]; i++) {
> +		if (!pm_runtime_status_suspended(dev))
> +			clk_disable(eswin->clks[i]);
> +		clk_unprepare(eswin->clks[i]);
> +		clk_put(eswin->clks[i]);
> +	}
> +
> +	mutex_unlock(&eswin->lock);
> +
> +	return ret;
> +}
> +
> +static void dwc3_eswin_remove(struct platform_device *pdev)
> +{
> +	struct dwc3_eswin *eswin = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +	int i = 0;
> +
> +	cancel_work_sync(&eswin->otg_work);
> +
> +	sysfs_remove_group(&dev->kobj, &dwc3_eswin_attr_group);
> +
> +	/* Restore hcd state before unregistering xhci */
> +	if (eswin->edev && !eswin->connected) {
> +		struct usb_hcd *hcd = dev_get_drvdata(&eswin->dwc->xhci->dev);
> +
> +		pm_runtime_get_sync(dev);
> +
> +		/*
> +		 * The xhci code does not expect that HCDs have been removed.
> +		 * It will unconditionally call usb_remove_hcd() when the xhci
> +		 * driver is unloaded in of_platform_depopulate(). This results
> +		 * in a crash if the HCDs were already removed. To avoid this
> +		 * crash, add the HCDs here as dummy operation.
> +		 * This code should be removed after pm runtime support
> +		 * has been added to xhci.
> +		 */
> +		if (hcd->state == HC_STATE_HALT) {
> +			usb_add_hcd(hcd, hcd->irq, IRQF_SHARED);
> +			usb_add_hcd(hcd->shared_hcd, hcd->irq, IRQF_SHARED);
> +		}
> +	}
> +
> +	of_platform_depopulate(dev);
> +
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +
> +	dwc3_eswin_assert(eswin);
> +	for (i = 0; i < eswin->num_clocks; i++) {
> +		if (!pm_runtime_status_suspended(dev))
> +			clk_disable(eswin->clks[i]);
> +		clk_unprepare(eswin->clks[i]);
> +		clk_put(eswin->clks[i]);
> +	}
> +}
> +
> +#ifdef CONFIG_PM
> +static int dwc3_eswin_runtime_suspend(struct device *dev)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < eswin->num_clocks; i++)
> +		clk_disable(eswin->clks[i]);
> +
> +	device_init_wakeup(dev, false);
> +
> +	return 0;
> +}
> +
> +static int dwc3_eswin_runtime_resume(struct device *dev)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < eswin->num_clocks; i++)
> +		clk_enable(eswin->clks[i]);
> +
> +	device_init_wakeup(dev, true);

This feels odd. What is the point of wakeup if you disable it for the
sleeping periods?

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dwc3_eswin_suspend(struct device *dev)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(dev);
> +	struct dwc3 *dwc = eswin->dwc;
> +
> +	eswin->suspended = true;
> +	cancel_work_sync(&eswin->otg_work);
> +
> +	/*
> +	 * The flag of is_phy_on is only true if
> +	 * the DWC3 is in Host mode.
> +	 */
> +	if (eswin->is_phy_on) {
> +		phy_power_off(dwc->usb2_generic_phy[0]);
> +
> +		/*
> +		 * If link state is Rx.Detect, it means that
> +		 * no usb device is connecting with the DWC3
> +		 * Host, and need to power off the USB3 PHY.
> +		 */
> +		dwc->link_state = dwc3_gadget_get_link_state(dwc);
> +		if (dwc->link_state == DWC3_LINK_STATE_RX_DET)
> +			phy_power_off(dwc->usb3_generic_phy[0]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dwc3_eswin_resume(struct device *dev)
> +{
> +	struct dwc3_eswin *eswin = dev_get_drvdata(dev);
> +	struct dwc3 *dwc = eswin->dwc;
> +
> +	eswin->suspended = false;
> +
> +	if (eswin->is_phy_on) {
> +		phy_power_on(dwc->usb2_generic_phy[0]);
> +
> +		if (dwc->link_state == DWC3_LINK_STATE_RX_DET)
> +			phy_power_on(dwc->usb3_generic_phy[0]);
> +	}
> +
> +	if (eswin->edev)
> +		schedule_work(&eswin->otg_work);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops dwc3_eswin_dev_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_eswin_suspend, dwc3_eswin_resume)
> +		SET_RUNTIME_PM_OPS(dwc3_eswin_runtime_suspend,
> +				   dwc3_eswin_runtime_resume, NULL)
> +};
> +
> +#define DEV_PM_OPS (&dwc3_eswin_dev_pm_ops)
> +#else
> +#define DEV_PM_OPS NULL
> +#endif /* CONFIG_PM */
> +
> +static const struct of_device_id eswin_dwc3_match[] = {
> +	{ .compatible = "eswin,eic7700-dwc3" },
> +	{ /* Sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, eswin_dwc3_match);
> +
> +static struct platform_driver dwc3_eswin_driver = {
> +	.probe = dwc3_eswin_probe,
> +	.remove = dwc3_eswin_remove,
> +	.driver = {
> +		.name = "eic7700-dwc3",
> +		.pm = DEV_PM_OPS,
> +		.of_match_table = eswin_dwc3_match,
> +	},
> +};
> +
> +module_platform_driver(dwc3_eswin_driver);
> +
> +MODULE_ALIAS("platform:eic7700-dwc3");

Drop. You should not need MODULE_ALIAS() in normal cases. If you need
it, usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.

Both of your drivers - this and PCI - are in very poor shape. I suggest
redoing them based on latest upstream drivers, not pushing to us your
downstream code.

Best regards,
Krzysztof
