Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDFC191
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 01:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211126; cv=none; b=jgP4eBWMrdNFpKDi7RL6npniCfy9XLNxqX8TvvQfJeaoTrCxpyPxE6DEQX1pNWgalFdRioPB38t69K792V2XKLZl1BgH5Y/1fVHuSqk71wRluDmXj/kwt+2G8H9nczJdyyws7bWz9wYNTr7aYpMmhPviyYAi87pxuWkUz0P1b+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211126; c=relaxed/simple;
	bh=B6WXFv42WibloTinEG3stIHOn2nFdQfJskknML+aNxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grHm0jShDeBkllBrbDllgixes3N7eQtwCRMAt7FL/dKOeWI5pcKTIhXEr1xi6EghASh2cZiDhK9CKwYckcSQATPhtl+akScI8J0R25gNK+7PhzMawUp1hCHZ7XH92Apt8U91isLYcahDgjQ/zz5/yWeA80EiMHAB6fBO4qufdFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X535yHZn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X535yHZn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-399749152b4so932643f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211122; x=1743815922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpne36gCiaUf/vOcHEmQCMmIt/bPKT4qWHgc4yEtsfA=;
        b=X535yHZnjDUOa4beakAT6hhV9jRva/k7GCoMpmIwoHgGSZJX1MtSg6RKRXjzXyOcrM
         FHh48ol0DBcStf06WfxlVuAIgsXVNWKZVPhRn0JqA8wJWCuPhYhRFe7KfMScZojUvO3J
         RgaE9CttjtLGXOWwZGXO396neipjCWfZWY8biTZ18x6fTnGG74NprPB4qdxAeBMkOr5R
         48lPCXrACiV5S5+zYwevL3QqSZd/S2nKMC6pG2/XEHnuKyWGpLMRnNp1Mlur3fz9OY4K
         2wyKLrhF987HdsHNDWlurwduNtjXCzdrtD6w8sy/E40bus2pRgFLhD7b4isSlL8VSzJo
         nd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211122; x=1743815922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpne36gCiaUf/vOcHEmQCMmIt/bPKT4qWHgc4yEtsfA=;
        b=Zt3kTqMOABJzINKHUxWGto79byrdIA/dhKPfXZ1iLZNOhybQiG72zT7ohh5edLNZ24
         37t74W7/p/LloEwJNszzUYS9Ke0hiGo1tqG5vAANwKxrkEek3dxAV/pWB4KVmsiBD1lx
         u3squAyRK9HP5iBb3/Z4pbIJ/iMUzUZBvMhqiDKpirsg/XhqMD4QQsXIZeFLE/xR7Dk7
         d9zSwA7d967oH8nYIQBY6o9XKTDzewMI7f08Z2FX3js7Gsap5LcMa/ZYNFpOSGSxR80y
         gXu3Pkcc3QBed9cfcDO/xxh9bVsdfxFMGaN9r8F+Iztm9IGJOfdxcrpcUKoGBrQGCA81
         UlfA==
X-Forwarded-Encrypted: i=1; AJvYcCUP6BKs8amsoy4jlJLd8BFfG5Oef5ObUiLBknd6FIpI0pNQNglm9Ur84RQXUFIdJqR4TS52LZxCeXL5+SI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiIivTjePCpEYxBJCABUoRwbe1pGNq11zapDILsX98Fs4TpmMQ
	OKQZh8N7evf1NEmEyXEdTC7EW7LZ7wdg63y7tLHdtPtYWzKuRFqEqApfbIgwwIk=
X-Gm-Gg: ASbGnctUcFcHBxcXBN5+3BoBO4dhNY/dwBbm1UVsINCPLtjtfswVz9c7SdZkFCNHBIW
	tS0rySM3FabCtwkNzCo+B2soAeFJtNPFiOKbmtG+ekQD3VgofERkDRumnpxWMjtJXYbx5kRTqSl
	nd4CyOrgFWOKGHBcpdzbZ3g81QV1NSQWJ6kCmtHnypFdi6VTYP0CYoT5wNlmDNqYs+XiL1jdi3W
	EDgNeBcvwix+8QeaKFPrMlW3BFvrYsQ3sSC7MrPkmadCMtDXXSsM7jv3IecdPQBVVi8bFZcSpwr
	gYRr6+PVoP8gnnSvQFNB06Zpr9YZySjPzbYcZKZOo/HX1TGQCsIshpFkaJajkBZEgc1c45F+5Ss
	5tPolY0U0YA==
X-Google-Smtp-Source: AGHT+IGgq3lN2khHUfxvzTLLGRHiPLTs5+vkkxGV/MOmv/iCHJ4zdsJUQ6EeZEdYriKuTFWbLbYrNg==
X-Received: by 2002:a05:6000:40cd:b0:38f:38eb:fcfc with SMTP id ffacd0b85a97d-39c120ca794mr739070f8f.7.1743211122572;
        Fri, 28 Mar 2025 18:18:42 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b662c11sm4252858f8f.31.2025.03.28.18.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 18:18:41 -0700 (PDT)
Message-ID: <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
Date: Sat, 29 Mar 2025 01:18:39 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
 krzk@kernel.org, dan.carpenter@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <MhUYQD7uWnfZQAPq7VslFWPHOmx2B2UfAIpbMhLq1-7GC_i5bI2hhns_-ov_AAVpEH_VmDDFYkS5aOKBwnY61g==@protonmail.internalid>
 <20250328214706.1516566-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250328214706.1516566-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/03/2025 21:42, Pratap Nirujogi wrote:
> From: Bin Du <Bin.Du@amd.com>

> +static const struct i2c_device_id ov05c10_id[] = {
> +	{"ov05c10", 0 },
> +	{ }
> +};

There's an IPU6/IPU7 version of this driver.

https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov05c10.c

Perhaps you could import the Intel ACPI name contained in there too.

> +
> +MODULE_DEVICE_TABLE(i2c, ov05c10_id);
> +
> +static struct i2c_driver ov05c10_i2c_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +		.pm = pm_ptr(&ov05c10_pm_ops),
> +	},
> +	.id_table = ov05c10_id,
> +	.probe = ov05c10_probe,
> +	.remove = ov05c10_remove,
> +};
> +
> +module_i2c_driver(ov05c10_i2c_driver);
> +
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
> +MODULE_LICENSE("GPL v2");

Why v2 ? Checkpatch will complain about v2 and BTW the IPU6 driver above 
is GPL not GPL v2.

---
bod
