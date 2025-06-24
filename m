Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E913B1876;
	Tue, 24 Jun 2025 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750751307; cv=none; b=jzHIXju4IlxCmcBsAVs4QV/rN9fxRgIHba6PcxEguK2YSXopiJDfTXM0LA+Z7X/lDFtsXU0G3QZntPxxJimylzxD2BDYJt8aYXfTKP31HvD75fH9PTMpJqy3xwcvTnZ43LEz/sqnpATfir3jjiocyppPDIWqJMxv5mra3mNjdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750751307; c=relaxed/simple;
	bh=87IhusWnFHqddKhc+u8V+JDM2N3zSseDLKZaCid1I40=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=maVC0QzgSQ2Ii4p+eyoARxoAqzn4LO4Wwz4Px+C/r0ktRCJfCWii4k8oSMf34dqu7ihRWHP8fGoLfRMUYlud6gpcXFqJzwQlJk2RF7+2r5OCdg0enEJ3SOCEM9DNKBC20mSfqmao21+jzpytljBDjBCMjhxHdSzgo3za+wsYI7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMUDRSnX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMUDRSnX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA07DC4CEEF;
	Tue, 24 Jun 2025 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750751306;
	bh=87IhusWnFHqddKhc+u8V+JDM2N3zSseDLKZaCid1I40=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NMUDRSnXUpS0q4QJmlAwIads/FCRoiKqHnNK5yRu6FGT5xYQP6Yyy2JTuuvYrjKEF
	 RTe7bnuTLb/QxEVqPfMPeDrhLqEihckLvvl04TVZX6cCy1T4/IxnCB6vAmDfZB/9n0
	 LauTe6pP3miPobjsX9ru22b4Ar4ipL9WjEx6PzS6s0oBNpsAj+VAroU8mXeI0ieg/X
	 zo8VXTdLze62zoSFMpPncIbj8G5Bv7+VLXE/zVaBtMTKn9StAxMiVKpr7Lp3GtsoTt
	 EeNcsJjhVuz1snW7tVDZpSfyWZc0g1M5APYV8IceaBgdMt3XcMPs+KuNYrC3h+cykC
	 TkQIIG0jt452g==
Message-ID: <9bd05709-7702-4b74-85e1-3df25b57c535@kernel.org>
Date: Tue, 24 Jun 2025 09:48:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (pmbus) Add support for MPS multi-phase
 mp2869a/mp29612a controllers
To: tzuhao.wtmh@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Fabio Estevam <festevam@gmail.com>,
 Henry Wu <Henry_Wu@quantatw.com>, Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Leo Yang <leo.yang.sy0@gmail.com>, Ninad Palsule <ninad@linux.ibm.com>,
 Alex Vdovydchenko <xzeol@yahoo.com>,
 John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
 Nuno Sa <nuno.sa@analog.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Noah Wang <noahwang.wang@outlook.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250624074156.291176-1-Henry_Wu@quantatw.tw>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250624074156.291176-1-Henry_Wu@quantatw.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2025 09:41, tzuhao.wtmh@gmail.com wrote:
> +static int
> +MP2869A_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		/* Enforce VOUT direct format. */
> +		return PB_VOUT_MODE_DIRECT;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
> +static int
> +MP2869A_identify_vout_format(struct i2c_client *client,

Use Linux coding style, so lowercase for variables, types and functions.
Everywhere (except when coding style tells you different, so please read
it).

> +			    struct MP2869A_data *data)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < data->info.pages; i++) {
> +		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = i2c_smbus_read_word_data(client, MP2869A_VOUT_MODE);
> +		if (ret < 0)
> +			return ret;
> +
> +		switch (ret & MP2869A_VOUT_MODE_MASK) {
> +		case MP2869A_VOUT_MODE_VID:
> +			data->vout_format[i] = vid;
> +			break;
> +		default:
> +		return -EINVAL;
> +		}
> +		}

Messed indentation in multiple places.

> +	return 0;
> +}
> +
> +static struct pmbus_driver_info MP2869A_info = {

This is const.

> +	.pages = MP2869A_PAGE_NUM,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = -3,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
> +		PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> +	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |
> +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP,
> +	.read_byte_data = MP2869A_read_byte_data,
> +	.read_word_data = MP2869A_read_word_data,
> +};
> +
> +static int mp2869a_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +	struct MP2869A_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct MP2869A_data),

sizeof(*)

> +		GFP_KERNEL);

Misaligned. Run checkpatch --srtict

> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->chip_id = (enum chips)(uintptr_t)i2c_get_match_data(client);

These are just wrong or redundant casts. You need only one cast -
kernel_ulong_t

> +
> +	memcpy(data->max_phases, mp2869a_max_phases[data->chip_id],
> +		sizeof(data->max_phases));

Why you cannot just store the pointer?

> +
> +	memcpy(&data->info, &MP2869A_info, sizeof(*info));

Why you cannot just store the pointer?

> +	info = &data->info;
> +
> +

One blank line, not two

> +	/* Identify vout format. */
> +	ret = MP2869A_identify_vout_format(client, data);
> +	if (ret)
> +		return ret;
> +
> +	/* set the device to page 0 */
> +	i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct of_device_id __maybe_unused mp2869a_of_match[] = {
> +	{ .compatible = "mps,mp2869a", .data = (void *)mp2869a },
> +	{ .compatible = "mps,mp29612a", .data = (void *)mp29612a},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, mp2869a_of_match);
> +
> +static struct i2c_driver mp2869a_driver = {
> +	.driver = {
> +		.name = "mp2869a",
> +		.of_match_table = mp2869a_of_match,
> +	},
> +	.probe = mp2869a_probe,
> +	.id_table = mp2869a_id,
> +};
> +
> +module_i2c_driver(mp2869a_driver);
> +
> +

One blank line, not two. This applies everywhere.

> +MODULE_AUTHOR("Henry Wu <Henry_WU@quantatw.com>");
> +MODULE_DESCRIPTION("PMBus driver for MPS MP2869A/MP29612A device");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);


Best regards,
Krzysztof
