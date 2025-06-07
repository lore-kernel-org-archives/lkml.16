Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C43C21D00A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749294090; cv=none; b=QTxIrWG7a7qpqntmrL5JbvKZVcYVX8UTEzBsWyFAyn6IjJ/spZxCGAa8f+aGk56SB04ivXGXHQPou7yJdFn6HAV219z8s5Zi9bTxzlLnSuHyvaimZC/3/18dH/XXK1mZKxhzuBo7szOL5f9ySEoCw0aenLVJZfQQzCHFtA2SFI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749294090; c=relaxed/simple;
	bh=hZDopfsy/5RUpRh7iHHJ9oyFZtRp6nzxMpX9j0C1bi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ua5RQLUr8CdsZTbRSiJIVZ9hTjCF4MnoYF3Gfuq8wWsKwOscDkVZOAWw7wZurkTuUKwUeFJsgWg4peIiCI7zZAyYXOxIWVi7BY4X3BHKZkuuCtgt115RUp5V0n/sQNEoDQPN4+Pqk9sifBGynbLN6aidW6wvGcNlAte0gGLGw8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bgI2kXh+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bgI2kXh+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so412488966b.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294087; x=1749898887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uN0r+Aza/K95m42q5KAJfh2hepELl55Kp/4kcMWaJo=;
        b=bgI2kXh+4ON+0AAmwUktPEeHy+OpCjN239MMopPgv6YTfurCHqbDy66IHJ/VXgz7x1
         XqQPswXxm47MLZsZv510I8PFdkqQsSbxzf4IkBEd5qiCxj2MISPQBylVmsG0kkbitpGB
         +R0Q3Ze0dgjpmsXWUPQPqyfxIHUuO3cBvIRvTYtz4UhbEGJfQCJwdNrh160AnKP4Yaxu
         +fPzi8vwbyLLJNrUInTLUAfiIRLFM3MHrdwPFeJFqveidwpN3PsOwXNL+kGRGQz1v4Z1
         M0piwoo0Cb/SJiraDB1h3O94XTsQSsrtNmTI1e6enOuhf87T4uZlxG0JCsnmDlwZharR
         IMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294087; x=1749898887;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uN0r+Aza/K95m42q5KAJfh2hepELl55Kp/4kcMWaJo=;
        b=ByBiRdbEjbmD8nqYKgvzeDX/rUnayk1/SxSUj87hgtVsnWU9uc3HVM2QJ9EhOlImO5
         rABlgXhvER04SlUOv+jaR4cKzoQeqn0GSk9twU+0g981SN+Adf1TezIuUEzOWNRpuK78
         7yteo4RwRkEjSNmIrlJf4jXPgDCkwD+yfb2Ju7nFixPfQQeXYJqKWkckGzY0woOLYrrC
         QixcfBkGvV5yLRLWLARjXs0YJ+c2qPGw48SB0s9Ujw/VrnFjZoys1JdjwAZL0wcfiAKk
         IRnFRjEaMoP7VS80Ecg+0PSDzOOKtqrnf8Hw9sgynzwX0O2bFKonQij3WqVs2x5/hr5d
         x7tA==
X-Forwarded-Encrypted: i=1; AJvYcCVfj3QojsD/ComSjTn4WiE5TJXrXyJbh4lBLF8SDoyd17Z6g/GBVrgNUBly0ahamCOeZ2jaJhC9LsAiYbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfdpNVHnjuzbWpB1uED70+ORyWDNACeJ6GJfqpS96gm1d8l68s
	ibXPz3/b9RimKSHMieeX20VL7zcW6e5aPoASjXfT8n9pUgzIsWIozl8F04yNqoWpMMg=
X-Gm-Gg: ASbGncv7H6HM+NK04Xs0Avxw9h9cd+1qxH1r2RxhZgIOGe2PHN1EHsOSpheZIF8T8ao
	DJDQ9vdroWQcwuVJZyqNTYbVaKmru70XCR7vINnFID5iL2zrCfaCKgIBZr/o0BaJDEHneBL8G7C
	O1dJeGAWHc+TRt65v7cshFL8JxX6pY5cnbWAikza14j1gDURg1+PQSmML0XrPRxUAL0mAsLD4f7
	9K+BBJoSHsGZQ7PwlfDBXB64VISJuG4ZBd+dxEUBKx8tawarq3Qj0fjXk8rXdF8pO3T9Cs04ZQ4
	EJOqiwq+VGR2V4FqGE8dsMOsGnjfpLKdmmlbDYheC29lF2CjhRO3aslN76NO
X-Google-Smtp-Source: AGHT+IHfOkKx9NcfIAZ9nTpnZxlHwpeFAbEacglR5IGGcoWk8RG7mokCDPs4dSHS/5Gsct64uui31w==
X-Received: by 2002:a17:907:1c8e:b0:ad8:9466:3354 with SMTP id a640c23a62f3a-ade1a9e9335mr594588566b.54.1749294085887;
        Sat, 07 Jun 2025 04:01:25 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db5572csm257317166b.38.2025.06.07.04.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:01:25 -0700 (PDT)
Message-ID: <343d77a8-1d52-40e6-9ae0-ba77a259d377@tuxon.dev>
Date: Sat, 7 Jun 2025 14:01:23 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: sfdp: parse SFDP SST vendor map and
 register EUI addresses into NVMEM framework
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-2-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521070336.402202-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Manikandan,

On 21.05.2025 10:03, Manikandan Muralidharan wrote:
> Some SST flash like SST26VF064BEUI serial quad flash memory is programmed
> at the factory with a globally unique EUI-48 and EUI-64 identifiers stored
> in the SFDP vendor parameter table and it is permanently write-protected.
> 
> Add SST Vendor table SFDP parser to read the EUI-48 and EUI-64
> Mac Addresses and allocate them using resource-managed devm_kcalloc
> which will be freed on driver detach.
> 
> Regitser the Addresses into NVMEM framework and parse them when
> requested using the nvmem properties in the DT by the net drivers.
> In kernel the Ethernet MAC address relied on U-Boot env variables or
> generated a random address, which posed challenges for boards without
> on-board EEPROMs or with multiple Ethernet ports.
> This change ensures consistent and reliable MAC address retrieval
> from QSPI benefiting boards like the sama5d27-wlsom1-ek, sama5d29 curiosity
> and sam9x75 curiosity.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c  | 161 ++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |   7 ++
>  2 files changed, 168 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 21727f9a4ac6..920708ae928a 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -31,6 +31,7 @@
>  					 * Register Map Offsets for Multi-Chip
>  					 * SPI Memory Devices.
>  					 */
> +#define SFDP_MCHP_SST_ID	0x01bf
>  
>  #define SFDP_SIGNATURE		0x50444653U
>  
> @@ -1344,6 +1345,163 @@ static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
>  	return ret;
>  }
>  
> +#define SFDP_MCHP_PARAM_TABLE_LEN	28
> +#define SFDP_SST26VF064BEUI_ID		0xFF4326BFU
> +
> +#define SFDP_MCHP_EUI48			0x30
> +#define SFDP_MCHP_EUI48_MASK		GENMASK(7, 0)
> +#define SFDP_MCHP_EUI48_MAC_LEN		6
> +
> +#define SFDP_MCHP_EUI64			0x40
> +#define SFDP_MCHP_EUI64_MASK		GENMASK(31, 24)
> +#define SFDP_MCHP_EUI64_MAC_LEN		8
> +
> +/**
> + * spi_nor_mchp_sfdp_read_addr()- read callback to copy the EUI-48 or EUI-68
> + *				  Addresses for device that request via NVMEM
> + *
> + * @priv: User context passed to read callbacks.
> + * @offset: Offset within the NVMEM device.
> + * @val: pointer where to fill the ethernet address
> + * @bytes: Length of the NVMEM cell
> + *
> + * Return: 0 on success, -EINVAL  otherwise.
> + */
> +static int spi_nor_mchp_sfdp_read_addr(void *priv, unsigned int off,
> +				       void *val, size_t bytes)
> +{
> +	struct spi_nor *nor = priv;
> +
> +	if (SFDP_MCHP_PARAM_TABLE_LEN == nor->mchp_eui->vendor_param_length) {

From checkpatch.pl:

[Checkpatch]      WARNING: Comparisons should place the constant on the
right side of the test
#71: FILE: drivers/mtd/spi-nor/sfdp.c:1375:
+       if (SFDP_MCHP_PARAM_TABLE_LEN == nor->mchp_eui->vendor_param_length) {

Also, to avoid indenting the above block you can reverse the check here,
and return, e.g.:

if (nor->mchp_eui->vendor_param_length != SFDP_MCHP_PARAM_TABLE_LEN)
        return 0;

> +		switch (bytes) {
> +		case SFDP_MCHP_EUI48_MAC_LEN:
> +			memcpy(val, nor->mchp_eui->ethaddr_eui48, SFDP_MCHP_EUI48_MAC_LEN);
> +			break;
> +		case SFDP_MCHP_EUI64_MAC_LEN:
> +			memcpy(val, nor->mchp_eui->ethaddr_eui64, SFDP_MCHP_EUI64_MAC_LEN);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * spi_nor_parse_mchp_sfdp() - Parse the Microchip vendor specific parameter table
> + *			       Read and store the EUI-48 and EUI-64 address to
> + *			       struct spi_nor_sst_mchp_eui_info if the addresses are
> + *			       programmed in the SST26VF064BEUI sst flag
> + *
> + * @nor:		pointer to a 'struct spi_nor'
> + * @sccr_header:	pointer to the 'struct sfdp_parameter_header' describing
> + *			the Microchip vendor parameter header length and version.
> + *
> + * Return: 0 on success of if addresses are not programmed, -errno otherwise.
> + */
> +static int spi_nor_parse_mchp_sfdp(struct spi_nor *nor,
> +				   const struct sfdp_parameter_header *mchp_header)
> +{
> +	struct nvmem_device *nvmem;
> +	struct nvmem_config nvmem_config = { };
> +	struct spi_nor_sst_mchp_eui_info *mchp_eui;
> +	u32 *dwords, addr, sst_flash_id;
> +	size_t len;
> +	int ret = 0, size = 0;
> +
> +	if (SFDP_MCHP_PARAM_TABLE_LEN != mchp_header->length)

From checkpatch.pl:

WARNING: Comparisons should place the constant on the right side of the test
#109: FILE: drivers/mtd/spi-nor/sfdp.c:1413:
+       if (SFDP_MCHP_PARAM_TABLE_LEN != mchp_header->length)

> +		return -EINVAL;
> +
> +	addr = SFDP_PARAM_HEADER_PTP(mchp_header);
> +	/* Get the SST SPI NOR FLASH ID */
> +	ret = spi_nor_read_sfdp_dma_unsafe(nor, addr, sizeof(sst_flash_id),
> +					   &sst_flash_id);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Check the SPI NOR FLASH ID */
> +	if (le32_to_cpu(sst_flash_id) != SFDP_SST26VF064BEUI_ID)
> +		return -EINVAL;
> +
> +	len = mchp_header->length * sizeof(*dwords);
> +	dwords = kmalloc(len, GFP_KERNEL);

I think this can be replaced by:

u32 *dwords __free(kfree) = kmalloc(...);

> +	if (!dwords)
> +		return -ENOMEM;
> +
> +	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> +	if (ret)
> +		goto out;
> +
> +	le32_to_cpu_array(dwords, mchp_header->length);
> +
> +	mchp_eui = devm_kzalloc(nor->dev, sizeof(*mchp_eui), GFP_KERNEL);
> +	if (!mchp_eui) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	if (SFDP_MCHP_EUI48 == FIELD_GET(SFDP_MCHP_EUI48_MASK,
> +					 dwords[SFDP_DWORD(25)])) {
> +		mchp_eui->ethaddr_eui48 = devm_kcalloc(nor->dev,
> +						       SFDP_MCHP_EUI48_MAC_LEN,
> +						       sizeof(u8), GFP_KERNEL);
> +		if (!mchp_eui->ethaddr_eui48) {
> +			ret = -ENOMEM;
> +			devm_kfree(nor->dev, mchp_eui);
> +			goto out;
> +		}
> +		memcpy(mchp_eui->ethaddr_eui48, (u8 *)&dwords[SFDP_DWORD(25)] + 1,
> +		       SFDP_MCHP_EUI48_MAC_LEN);
> +		size = SFDP_MCHP_EUI48_MAC_LEN;
> +	}
> +
> +	if (SFDP_MCHP_EUI64 == FIELD_GET(SFDP_MCHP_EUI64_MASK,
> +					 dwords[SFDP_DWORD(26)])) {
> +		mchp_eui->ethaddr_eui64 = devm_kcalloc(nor->dev,
> +						       SFDP_MCHP_EUI64_MAC_LEN,
> +						       sizeof(u8), GFP_KERNEL);
> +		if (!mchp_eui->ethaddr_eui64) {
> +			ret = -ENOMEM;
> +			devm_kfree(nor->dev, mchp_eui->ethaddr_eui48);
> +			devm_kfree(nor->dev, mchp_eui);
> +			goto out;
> +		}
> +		memcpy(mchp_eui->ethaddr_eui64, (u8 *)&dwords[SFDP_DWORD(27)],
> +		       SFDP_MCHP_EUI64_MAC_LEN);
> +		size += SFDP_MCHP_EUI64_MAC_LEN;
> +	}
> +
> +	/*
> +	 * Return if SST26VF064BEUI sst flash is not programmed
> +	 * with EUI-48 or EUI-64 information
> +	 */
> +	if (!size) {
> +		devm_kfree(nor->dev, mchp_eui);
> +		goto out;
> +	}
> +
> +	mchp_eui->vendor_param_length = mchp_header->length;
> +	nor->mchp_eui = mchp_eui;
> +	nvmem_config.word_size = 1;
> +	nvmem_config.stride = 1;
> +	nvmem_config.dev = nor->dev;
> +	nvmem_config.size = size;
> +	nvmem_config.priv = nor;
> +	nvmem_config.reg_read = spi_nor_mchp_sfdp_read_addr;
> +
> +	nvmem = devm_nvmem_register(nor->dev, &nvmem_config);
> +	if (IS_ERR(nvmem)) {
> +		dev_err(nor->dev, "failed to register NVMEM device: %ld\n",
> +			PTR_ERR(nvmem));
> +		ret = PTR_ERR(nvmem);
> +	}
> +
> +out:
> +	kfree(dwords);
> +	return ret;
> +}
> +
>  /**
>   * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
>   * after SFDP has been parsed. Called only for flashes that define JESD216 SFDP
> @@ -1564,6 +1722,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  			err = spi_nor_parse_sccr_mc(nor, param_header);
>  			break;
>  
> +		case SFDP_MCHP_SST_ID:
> +			err = spi_nor_parse_mchp_sfdp(nor, param_header);
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cdcfe0fd2e7d..051078d23ea1 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -339,6 +339,12 @@ struct flash_info;
>  struct spi_nor_manufacturer;
>  struct spi_nor_flash_parameter;
>  
> +struct spi_nor_sst_mchp_eui_info {
> +	u8 vendor_param_length;
> +	u8 *ethaddr_eui48;
> +	u8 *ethaddr_eui64;

you may want to keep pointer first to avoid padding, if any.

Thank you,
Claudiu

> +};
> +
>  /**
>   * struct spi_nor - Structure for defining the SPI NOR layer
>   * @mtd:		an mtd_info structure
> @@ -408,6 +414,7 @@ struct spi_nor {
>  	u32			flags;
>  	enum spi_nor_cmd_ext	cmd_ext_type;
>  	struct sfdp		*sfdp;
> +	struct spi_nor_sst_mchp_eui_info *mchp_eui;
>  	struct dentry		*debugfs_root;
>  
>  	const struct spi_nor_controller_ops *controller_ops;

