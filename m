Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1D4C6E;
	Fri, 28 Mar 2025 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147311; cv=none; b=W4971xwm9HsZBYuSQNvLMyjpjME45dqcJ+Jm2/dO2VhGmlZSPBeKNLUbRcvSCy40klJ2YRakrbiuDSMoOk+LcJs9bfR8QlXydkX5oD1F4do+4gOwrthivfz9bIj7R7NHb+Sbb3O55ycvu8yoNs4KAmXOHAU4UMaTqvJJA5i/Lek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147311; c=relaxed/simple;
	bh=2nGY6VpTnccaSHFXyO/+bd9BLgSqnKh65lb9Acu5gQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vASjRwHq8yt7ipcI+4XCHvf0inHNkDo+cq5tnSooH/lkyBQjhLigZrY8kEAhYbEZIfZD3AVxZnrkVQAzfBdMx/q32sOFe7VMFrC9XsAx+ANKZJqrQMtPDf2YYHLjcxf8BFw1X5GU6BxuUaW55F1wbV+wOGTEHrMst4lic1SGPVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zmw4xKGu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zmw4xKGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6E8C4CEE4;
	Fri, 28 Mar 2025 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743147310;
	bh=2nGY6VpTnccaSHFXyO/+bd9BLgSqnKh65lb9Acu5gQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zmw4xKGuWDCQirrNEolXXnj2GZwOhtVLy3aKHL8d48fzaElk3aBjqsRNPAFt7XHfi
	 HkYAYQopThOjaZ7Bq9eY4xHKkFFp0YpDEoSSn3lRvShX7ImmoCWieyHkc43t4yWRMY
	 jRFBbuFTbKHL4DTTsZT9MwYLJY6df0dk0pRpdjSQtjJid50Hic69gTZMA3NDnpIWWS
	 T9OPjtFeLILrJpLyCgJYvzIbQyEvP0BekdRgDnOLY2MpKa/AtOufSEegGzeq77ECnG
	 PfTeb3yXAUm+cMr6my6cnXi4MRyJm7TSdXnMJmS+t1m3rY96PLtYeHc6UVwWsof4sJ
	 ck9cu9kM6bdmQ==
Message-ID: <464ac98d-115b-45c1-9a42-d05a104105c4@kernel.org>
Date: Fri, 28 Mar 2025 08:35:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mailbox: Add support for bcm74110 mailbox
To: justin.chen@broadcom.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, jassisinghbrar@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20250327221628.651042-1-justin.chen@broadcom.com>
 <20250327221628.651042-2-justin.chen@broadcom.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250327221628.651042-2-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 23:16, justin.chen@broadcom.com wrote:
> +static int bcm74110_mbox_init(struct bcm74110_mbox *mbox)
> +{
> +	int ret = 0;
> +
> +	/* Disable queues tx/rx */
> +	writel_relaxed(0x0, mbox->base_tx + BCM_MBOX_CTRL);
> +
> +	/* Clear status & restart tx/rx*/
> +	writel_relaxed(BCM_MBOX_CTRL_EN | BCM_MBOX_CTRL_CLR,
> +		       mbox->base_tx + BCM_MBOX_CTRL);
> +
> +	/* Unmask irq */
> +	writel_relaxed(BCM_MBOX_IRQ_NOT_EMPTY, mbox->base_rx_irq +
> +		       BCM_MBOX_IRQ_MASK_CLEAR);
> +
> +	ret = bcm74110_mbox_link_training(mbox);
> +	if (ret) {
> +		dev_err(&mbox->pdev->dev, "Training failed\n");
> +		return ret;
> +	}
> +
> +	return bcm74110_mbox_shmem_init(mbox);
> +}
> +
> +
> +

Just one blank line




> +static int bcm74110_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct bcm74110_mbox *mbox;
> +	int i, ret;
> +
> +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	mbox->pdev = pdev;
> +	platform_set_drvdata(pdev, mbox);
> +
> +	mbox->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mbox->base))
> +		return dev_err_probe(dev, PTR_ERR(mbox->base), "Failed to iomap\n");
> +
> +	ret = of_property_read_u32(dev->of_node, "brcm,tx", &mbox->tx_chan);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to find tx channel\n");
> +
> +	ret = of_property_read_u32(dev->of_node, "brcm,rx", &mbox->rx_chan);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to find rx channel\n");
> +
> +	ret = of_property_read_u32_index(dev->of_node, "brcm,shmem", 0,
> +					 &mbox->shmem_offset);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get shmem offset\n");
> +
> +	ret = of_property_read_u32_index(dev->of_node, "brcm,shmem", 1,
> +					 &mbox->shmem_size);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get shmem size\n");
> +
> +	mbox->rx_irq = platform_get_irq(pdev, 0);
> +	if (mbox->rx_irq <= 0)


That's not correct check: look at help for this function.

> +		return dev_err_probe(dev, -EINVAL, "Failed to get irq\n");
> +
> +	mbox->base_tx = mbox->base + BCM_MBOX_BASE(mbox->tx_chan);
> +	mbox->base_rx = mbox->base + BCM_MBOX_BASE(mbox->rx_chan);
> +	mbox->base_rx_irq = mbox->base + BCM_MBOX_IRQ_BASE(mbox->rx_chan);

And all this suggests DT properties are not correct. Why would you
offset base? What is the memory layout of all your mbox controllers?

> +
> +	INIT_LIST_HEAD(&mbox->rx_svc_init_list);
> +	spin_lock_init(&mbox->rx_svc_list_lock);
> +	bcm74110_mbox_mask_and_clear(mbox);
> +
> +	ret = devm_request_irq(dev, mbox->rx_irq, bcm74110_mbox_isr,
> +			       IRQF_NO_SUSPEND, pdev->name, mbox);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request irq\n");
> +
> +	mbox->controller.ops = &bcm74110_mbox_chan_ops;
> +	mbox->controller.dev = dev;
> +	mbox->controller.num_chans = BCM_MSG_SVC_MAX;
> +	mbox->controller.of_xlate = &bcm74110_mbox_of_xlate;
> +	mbox->controller.chans = devm_kcalloc(dev, BCM_MSG_SVC_MAX,
> +					      sizeof(*mbox->controller.chans),
> +					      GFP_KERNEL);
> +	if (!mbox->controller.chans)
> +		return -ENOMEM;
> +
> +	mbox->mbox_chan = devm_kcalloc(dev, BCM_MSG_SVC_MAX,
> +				       sizeof(*mbox->mbox_chan),
> +				       GFP_KERNEL);
> +	if (!mbox->mbox_chan)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < BCM_MSG_SVC_MAX; i++) {
> +		mbox->mbox_chan[i].mbox = mbox;
> +		mbox->controller.chans[i].con_priv = &mbox->mbox_chan[i];
> +	}
> +
> +	ret = devm_mbox_controller_register(dev, &mbox->controller);
> +	if (ret)
> +		return ret;
> +
> +	ret = bcm74110_mbox_init(mbox);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "Mailbox inited with %d channels\n", BCM_MSG_SVC_MAX);

Drop, drivers are supposed to be silent on success.



Best regards,
Krzysztof
