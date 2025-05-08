Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FDD1D63F2;
	Thu,  8 May 2025 06:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684591; cv=none; b=skHnTJjIqYXXnalR4fWaXQVch03clas+YwfNGAKbjABhWJ26uSM/pg4FTf1igdrM+IxxtyuxQpIU0gKkUgjrImSfrln5xiFf8CGe9U5dPPfcTeo0R0knT+2u0wABDpees4rNJsPbT+em+LoYVQpy2l3tjzL0RJjderJYn9gH/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684591; c=relaxed/simple;
	bh=Z80F9z9GraktP1zuEnOSbvtvZHgeSRsmasvGgpCHS2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4mWAeBj3jLvBwNh+6aIr6ntGsDvX/75qiznIhuqX8THJbfXpuwg5j/4z8yFMkwB/M8TsQkRquVoUQDguvvF4UMd7z5gq042ouV3M+7oMXlwFg3Les79Ria6LrYz8ttSBHDidhCgv4XkxQvWsp4YCLKOQMj0cF89iMPqNvNbGdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2ymhibG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2ymhibG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE59AC4CEEB;
	Thu,  8 May 2025 06:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746684590;
	bh=Z80F9z9GraktP1zuEnOSbvtvZHgeSRsmasvGgpCHS2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i2ymhibGX5u2LCwFHdcnUEYYLqxtt/H8FRpTWknBISLI2kBCCiPzbL2Bs5+sZeHgc
	 pmIbnCYW+uHQPx4ZDmLYXSzhdaU3pnVuRRyDJgUCwybXOvcANifCG0q7Sqf9LgyFRF
	 LX2MSAIWx1CxrM4enRzAT/7XBpUAmwR67Kww576xN3bRiPvaiAMMlzpJstRk5BEaP0
	 DLrVnvqc+Rz8bunkmCTjJf1GtcuhxFtBzoaHEnxSAvrju/8tMd2qpvEyp4sForRbpO
	 ETzD196k06hZQMVChd17ajwp4BUFODpivldMIfAmNuu0C/FAYkJSCSPoSgyd8bdfK+
	 qYk7yeGftdOdA==
Message-ID: <b46e3766-75b7-4635-a505-3039e4394f07@kernel.org>
Date: Thu, 8 May 2025 08:09:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub
 device
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
 alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com,
 shashank.rebbapragada@nxp.com, Frank.Li@nxp.com
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
 <20250508045711.2810207-2-aman.kumarpandey@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250508045711.2810207-2-aman.kumarpandey@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2025 06:57, Aman Kumar Pandey wrote:
> +
> +static void p3h2x4x_of_get_tp_dt_conf(struct device *dev,
> +				      const struct device_node *node)
> +{
> +	struct p3h2x4x *priv = dev_get_drvdata(dev);
> +	struct device_node *dev_node;
> +	u64 tp_port;
> +
> +	for_each_available_child_of_node(node, dev_node) {
> +		if (!dev_node->name || of_node_cmp(dev_node->name, "target-port"))


Same NAK as before. You ignored the comment and nothing improved.

> +			continue;
> +
> +		if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
> +			continue;
> +
> +		if (tp_port < P3H2x4x_TP_MAX_COUNT) {
> +			priv->tp_bus[tp_port].dt_available = true;
> +			priv->tp_bus[tp_port].of_node = dev_node;
> +			priv->tp_bus[tp_port].tp_mask = BIT(tp_port);
> +			priv->tp_bus[tp_port].priv = priv;
> +			priv->tp_bus[tp_port].tp_port = tp_port;
> +		}
> +	}
> +}
> +
> +/* return true when backend node exist */
> +static bool p3h2x4x_is_backend_node_exist(int port, struct p3h2x4x *priv, u32 addr)
> +{
> +	struct smbus_device *backend = NULL;
> +
> +	list_for_each_entry(backend,
> +			    &priv->tp_bus[port].tp_device_entry, list) {
> +		if (backend->addr == addr)
> +			return true;
> +	}
> +	return false;
> +}
> +
> +static int p3h2x4x_read_backend_from_dts(struct device_node *i3c_node_target,
> +					 struct p3h2x4x *priv)
> +{
> +	struct device_node *tp_node;
> +	const char *compatible;
> +	u64 tp_port, addr_dts;
> +	int ret;
> +
> +	struct smbus_device *backend;
> +
> +	if (of_property_read_reg(i3c_node_target, 0, &tp_port, NULL))
> +		return -EINVAL;
> +
> +	if (tp_port >= P3H2x4x_TP_MAX_COUNT || tp_port < 0)
> +		return -ERANGE;
> +
> +	INIT_LIST_HEAD(&priv->tp_bus[tp_port].tp_device_entry);
> +
> +	if (priv->settings.tp[tp_port].mode == P3H2x4x_TP_MODE_I3C)
> +		return 0;
> +
> +	for_each_available_child_of_node(i3c_node_target, tp_node) {
> +		ret = of_property_read_reg(tp_node, 0, &addr_dts, NULL);
> +		if (ret)
> +			return ret;
> +
> +		if (p3h2x4x_is_backend_node_exist(tp_port, priv, addr_dts))
> +			continue;
> +
> +		ret = of_property_read_string(tp_node, "compatible", &compatible);
> +		if (ret)
> +			return ret;
> +
> +		backend = kzalloc(sizeof(*backend), GFP_KERNEL);
> +		if (!backend)
> +			return -ENOMEM;
> +
> +		backend->addr = addr_dts;
> +		backend->compatible = compatible;
> +		backend->tp_device_dt_node = tp_node;
> +		backend->client = NULL;
> +
> +		list_add(&backend->list,
> +			 &priv->tp_bus[tp_port].tp_device_entry);
> +	}
> +
> +	return 0;
> +}
> +
> +static void p3h2x4x_parse_dt_tp(struct device *dev,
> +				const struct device_node *i3c_node_hub,
> +				struct p3h2x4x *priv)
> +{
> +	struct device_node *i3c_node_target;
> +	int ret;
> +
> +	for_each_available_child_of_node(i3c_node_hub, i3c_node_target) {
> +		if (of_node_cmp(i3c_node_target->name, "target-port") == 0) {
> +			ret = p3h2x4x_read_backend_from_dts(i3c_node_target, priv);
> +			if (ret)
> +				dev_err(dev, "DTS entry invalid - error %d", ret);
> +		}
> +	}
> +}
> +
> +static int p3h2x4x_get_tp_local_device_dt_setting(struct device *dev,
> +						  const struct device_node *node, u32 id)
> +{
> +	struct p3h2x4x *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = of_property_read_variable_u8_array(node, "local_dev", priv->tp_bus[id].local_dev_list,

Nothing improved.

Just like for first patch you send the same buggy code ignoring review.


Best regards,
Krzysztof
