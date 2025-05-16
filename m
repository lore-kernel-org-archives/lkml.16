Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB9E1C2DB2;
	Fri, 16 May 2025 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411072; cv=none; b=YHg5fBnJz8Pc5F8vg8/Ru5/hJWzZ+UXv+2spnCWkCrVCUFLOciaZAhMI7k1QOprcEsEuor97SIRw/0x8hbqfrFLyu/ecYXGq10ZNvfCMJa2JjyT4Y2a82w0n8tTs8hzbEphF/zmZJlo2aVk1MK3KvTdBKzSI9DZiq5+GNvsq7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411072; c=relaxed/simple;
	bh=B5j3ar/jf/AzBKgy257B+T6vkiLJglRIzsGikIcAIs8=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=ll/FAXNpY6jVw6ZGcXQAhMZgD5VH+1EkwazYP/mu1dxn4yPyj6uAUu4Vu6MFMN3y81t1fDKjF0Uj6u53R6OgKuZwumCPLVSzTTDD7aW5zgdgP8Y+DN0RZGsXrhmaWuwQAMAVqnmT/C8GUVp9K5WcA3hwjPGKDhM5lmpvneoZ8Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=QxMFGWYA; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="QxMFGWYA"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id FxIcumXKYRPIZFxIcumfp1; Fri, 16 May 2025 17:48:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747410520;
	bh=asqRPGZ3Q7GAARmR/KH04DJepcIWDtXLyQJZqo1/rjw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=QxMFGWYAq2wQ4Z31PM1qAWgNZ2ukSYBvDNCpnTHpx8BGrXLYKc6S9IppW2Q+31q7D
	 Uu7fAosUdLjw28UysSDCa1U+sX6zT7lA8Rje866h947w+SPz9rYYSU4LjI2rjWilpg
	 MGJodAPG3NbqEA6AKKdHoBgJL9x5WYFAI5OAa3kmoIuQNvVI9optcW0jJ5u8q6d+/t
	 8m5bP78G744QYZ+jEvyAYcnQWD92jDyOnqF2YJWBNxrUx0yHm5T8LNyDxNHLcwsa2n
	 BybEJD8kLIW06ADLH+VYN044Rshlsk/1xPtYfBnin7spUXfJ5muCYh09iLJ2pyZ7ND
	 maZdPGNQS+W7Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 16 May 2025 17:48:40 +0200
X-ME-IP: 90.11.132.44
Message-ID: <1fb5c223-fcd7-4789-9cd6-33c712457a0a@wanadoo.fr>
Date: Fri, 16 May 2025 17:48:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] reset: eswin: Add eic7700 reset driver
References: <20250514002945.415-1-dongxuyang@eswincomputing.com>
 <20250514003209.531-1-dongxuyang@eswincomputing.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dongxuyang@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 huangyifeng@eswincomputing.com, krzk+dt@kernel.org,
 linmin@eswincomputing.com, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, p.zabel@pengutronix.de, robh@kernel.org
In-Reply-To: <20250514003209.531-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/05/2025 à 02:32, 
dongxuyang-sYo9T6QOUuK8M3too/+dENBPR1lH4CV8@public.gmane.org a écrit :
> From: Xuyang Dong <dongxuyang-sYo9T6QOUuK8M3too/+dENBPR1lH4CV8@public.gmane.org>
> 
> Add support for reset controller in eic7700 series chips.
> Provide functionality for asserting and deasserting resets
> on the chip.

...

> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

Would be better if fully alphabetically ordered.

> +
> +#define SYSCRG_CLEAR_BOOT_INFO_OFFSET (0x30C)

Unneeded ()

> +#define CLEAR_BOOT_FLAG_BIT BIT_ULL(0)

It is only used as a unsigned int parameter with regmap_set_bits(), so 
why ULL?

> +
> +#define SYSCRG_RESET_OFFSET (0x400)

Unneeded ()

...

> +/**
> + * eswin_reset_set() - program a device's reset
> + * @rcdev: reset controller entity
> + * @id: ID of the reset to toggle
> + * @assert: boolean flag to indicate assert or deassert
> + *
> + * This is a common internal function used to assert or deassert a device's
> + * reset by clear and set the reset bit. The device's reset is asserted if the
> + * @assert argument is true, or deasserted if @assert argument is false.
> + *
> + * Return: 0 for successful request, else a corresponding error value
> + */
> +static int eswin_reset_set(struct reset_controller_dev *rcdev, unsigned long id,
> +			   bool assert)
> +{
> +	struct eswin_reset_data *data = to_eswin_reset_data(rcdev);
> +	struct eswin_reset_control *control;
> +	int ret;
> +
> +	control = idr_find(&data->idr, id);
> +
> +	dev_dbg(rcdev->dev, "dev_id 0x%x reset_bit 0x%x assert 0x%x\r\n",
> +		control->dev_id, control->reset_bit, assert);

We test of control is NULL the line after. So if it can happen, it would 
crash here.

> +
> +	if (!control)
> +		return -EINVAL;
> +
> +	if (assert) {
> +		ret = regmap_clear_bits(data->regmap,
> +					SYSCRG_RESET_OFFSET +
> +						control->dev_id * sizeof(u32),
> +					control->reset_bit);
> +	} else {
> +		ret = regmap_set_bits(data->regmap,
> +				      SYSCRG_RESET_OFFSET +
> +					      control->dev_id * sizeof(u32),
> +				      control->reset_bit);
> +	}

No need fo { } around each of these branches.

> +
> +	return ret;
> +}
> +
> +static int eswin_reset_reset(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	int ret;
> +
> +	ret = eswin_reset_set(rcdev, id, true);

Would it make sense to use eswin_reset_assert()?

> +	if (ret != 0)
> +		return ret;
> +
> +	usleep_range(10, 15);
> +	ret = eswin_reset_set(rcdev, id, false);

Would it make sense to use eswin_reset_deassert()?

> +	if (ret != 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int eswin_reset_assert(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	return eswin_reset_set(rcdev, id, true);
> +}
> +
> +static int eswin_reset_deassert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	return eswin_reset_set(rcdev, id, false);
> +}

...

> +static int eswin_reset_of_xlate_lookup_id(int id, void *p, void *data)
> +{
> +	struct of_phandle_args *reset_spec = (struct of_phandle_args *)data;
> +	struct eswin_reset_control *slot_control =
> +		(struct eswin_reset_control *)p;
> +
> +	if (reset_spec->args[0] == slot_control->dev_id &&
> +	    reset_spec->args[1] == slot_control->reset_bit)
> +		return id;
> +	else

Unneeded else.

> +		return 0;
> +}
> +
> +/**
> + * eswin_reset_of_xlate() - translate a set of OF arguments to a reset ID
> + * @rcdev: reset controller entity
> + * @reset_spec: OF reset argument specifier
> + *
> + * This function performs the translation of the reset argument specifier
> + * values defined in a reset consumer device node. The function allocates a
> + * reset control structure for that device reset, and will be used by the
> + * driver for performing any reset functions on that reset. An idr structure
> + * is allocated and used to map to the reset control structure. This idr
> + * is used by the driver to do reset lookups.
> + *
> + * Return: 0 for successful request, else a corresponding error value
> + */
> +static int eswin_reset_of_xlate(struct reset_controller_dev *rcdev,
> +				const struct of_phandle_args *reset_spec)
> +{
> +	struct eswin_reset_data *data = to_eswin_reset_data(rcdev);
> +	struct eswin_reset_control *control;
> +	int ret;
> +
> +	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
> +		return -EINVAL;
> +
> +	ret = idr_for_each(&data->idr, eswin_reset_of_xlate_lookup_id,
> +			   (void *)reset_spec);
> +	if (ret != 0)

if (ret)

> +		return ret;
> +
> +	control = devm_kzalloc(data->dev, sizeof(*control), GFP_KERNEL);
> +	if (!control)
> +		return -ENOMEM;
> +
> +	control->dev_id = reset_spec->args[0];
> +	control->reset_bit = reset_spec->args[1];
> +
> +	return idr_alloc(&data->idr, control, 0, 0, GFP_KERNEL);
> +}
> +
> +static const struct of_device_id eswin_reset_dt_ids[] = {
> +	{
> +		.compatible = "eswin,eic7700-reset",
> +	},
> +	{ /* sentinel */ },

No need for a trailing , after a terminator.

> +};
> +
> +static int eswin_reset_probe(struct platform_device *pdev)
> +{
> +	struct eswin_reset_data *data;
> +	struct device *parent;
> +
> +	parent = pdev->dev.parent;
> +	if (!parent) {
> +		dev_err(&pdev->dev, "no parent\n");
> +		return -ENODEV;
> +	}
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = syscon_node_to_regmap(parent->of_node);
> +	if (IS_ERR(data->regmap)) {
> +		dev_err(&pdev->dev, "failed to get parent regmap\n");
> +		return PTR_ERR(data->regmap);
> +	}
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	data->rcdev.owner = THIS_MODULE;
> +	data->rcdev.ops = &eswin_reset_ops;
> +	data->rcdev.of_node = pdev->dev.of_node;
> +	data->rcdev.of_reset_n_cells = 2;
> +	data->rcdev.of_xlate = eswin_reset_of_xlate;
> +	data->rcdev.dev = &pdev->dev;
> +	data->dev = &pdev->dev;
> +	idr_init(&data->idr);
> +
> +	/*clear boot flag so u84 and scpu could be reseted by software*/

Missing spaces at the start and the end of the comment.

> +	regmap_set_bits(data->regmap, SYSCRG_CLEAR_BOOT_INFO_OFFSET,
> +			CLEAR_BOOT_FLAG_BIT);
> +	msleep(50);
> +	platform_set_drvdata(pdev, data);
> +
> +	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> +}

...

CJ
