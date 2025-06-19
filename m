Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663FB259CB5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339411; cv=none; b=rLNIINnvDy9LHJfbR0MbKzaPG38Pw4msh1iGz5lN3q40E5Kw2Y3yZS/UKrISzkd13Nw8xTUI5hKB2MR+ukWZBdkGue0XbP4mgfURU8TYtC+9hrhVrNDzmAmwzxf5tnrBfA7dNnMZo3LCPpQ/P6L2t0/3pFXswDEmBq0CDbFaS1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339411; c=relaxed/simple;
	bh=s56PJFNbAR0+4oVC0BXCzijj2cnK6zrUkEsGzFgWjP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hpGuIyxGRYgrP5JyeeZSZYymWTChUtPkj9i5Jd0EzzXUoyTDs2ETHeZUaGjYP+PwsejhGixqDdUXBqhQHy5LzugHqFSA3uKWnLHsS1OsN4aPKw4NI42K1DEGjJYj9LUy7tDFK51JGORWL0xS6r6JlWd+vGzfdahKbxzciWC7HLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FF86Bo6q; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FF86Bo6q"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-40791b696a2so192485b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750339408; x=1750944208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/70FnD9tQ+fRiZyRY5r5SMsQadgm6QXv7BQ/o/RrZC4=;
        b=FF86Bo6qxRQ8Pl6dSeK5qzm53GQ6TBS9Se8r4YJzHuiO+JY9IoGYIGdPuQRJ8C6geE
         /AkDfJAh3EPzRMpJ5Gmf0SjFcVZLUKnIobFoG6UziErg1OWolNRoS6dlVQXp8EU0x3cZ
         ot/cthRbs8bEpqlqAPG86krgX8PwstOZMezw8KELEUk2EXX4xVaT3PqJv6u8w03LR6ja
         iMkD+QwIiQxnxZdVjrDDlHu1Hv3s2oHKIgR3Y+WHKmw/B7I4mbob9dLWfGmO7Xaaczxk
         98tJK7Eu0a735LnvvZYFtlkatiTinWQoTghCWVBjTWMPQssj9dMj0MG0Bx8XaBFUXtxt
         62jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339408; x=1750944208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/70FnD9tQ+fRiZyRY5r5SMsQadgm6QXv7BQ/o/RrZC4=;
        b=LrKE9tN8lPjApxOhvfGXG2A1Hja/KbXIaEd9B8dFm3+pVF+E/5+3yIzOh/gf8ITV6D
         fhjqY0gqdHCnt05YAZ3sOw5TjuiuKXxIhTFrBkRNp0bQq2rWIRQuedXwq/+HzAraK2fY
         5lb8598yTsTWpK6ucduakiRhm1tHf9Ig/0VLaqn4Eddd7FCLl2IQnNMHLjdNtU1e8Gsd
         Jx98dx07HdyzQRMK4CLw8Gtyryyh1CaORWOrg5x42Dg8Lbhfayv7js4zeljroWbuE0m4
         i4SKcwGcJ3/oUkmBjVCll2Ci+5xgiOiOBv90/UN6eK4v8MSRVDexUzkHbuBjttFwuCw4
         P2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS1eUjB2NJMvDbeeMUakNGxqvI3g/Aew/yroHzO7Sa2lQyvDWbJ55/JnDeI3hQYDvR7GpV+zO93oNGa9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjy9UIv1Ae53oxczElXKSRvhiwbNKnIr8X46wqEWN1bCXcxSK
	KeSI2/2jQvf/NNXG/uYGvnhTRRKpA/+Fh34EExaTeN9rT39EuXG+WGaxbFuoGHgpSyM=
X-Gm-Gg: ASbGncvSGCUaA0oLoB8SI4x0rH3i/OxxRkOV23yz0ozH2+yokr7dI9axIyyDDJLFQnd
	Xf3tCvA/zzTD8uZuXMKl0bYSZTvzP16Xs90szQREijQgcIXb3DM25DmBz/soatZFOCFSjutSmyJ
	nL7Ky6IMEYb4aCAdPwDOOT8yKgx4yHGtgqJMdto642XbtGS+bvBC2tHVdAhAT1XBg2m52UyptaE
	7CiBUAeh1WzYUTLK4mw0yQvxHxBOSfRECcVIQ2JlMlVBBwr0FqX/B1JtbUFhb0x17oimhLZjURP
	AnTZLn9hqt0d4IgPa3KsBqneXdoV3C1Z5Yj0O2u1YXXfGwrpEuqEGecEgYu8k//GdyEKvq19V27
	BemBDasMz2uru67KpLQdBQyt5ew==
X-Google-Smtp-Source: AGHT+IGVYUqAL7UYn2pwdI0pVBJFm39ZocyoGLl1F6P4Vm48on+LUD6YmdbeE2h0MWfBSEJb6OB1Ew==
X-Received: by 2002:a05:6808:152a:b0:3f9:8b5b:294c with SMTP id 5614622812f47-40a7c23cff7mr13295372b6e.31.1750339408304;
        Thu, 19 Jun 2025 06:23:28 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a741b8837sm2759463b6e.46.2025.06.19.06.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:23:27 -0700 (PDT)
Message-ID: <3d8b4025-4e82-4245-8923-b55954894137@riscstar.com>
Date: Thu, 19 Jun 2025 08:23:26 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Vivian Wang <wangruikang@iscas.ac.cn>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <4036e3c2-8324-4eeb-9aa8-df1fbe9c7943@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <4036e3c2-8324-4eeb-9aa8-df1fbe9c7943@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 12:46 AM, Vivian Wang wrote:
> On 6/14/25 05:01, Alex Elder wrote:
>> <snip>
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 6fb3768e3d71c..c59ae6cc2dd8d 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
>>   	  Say M here if you want to include support for the Qualcomm RPM as a
>>   	  module. This will build a module called "qcom_rpm".
>>   
>> +config MFD_SPACEMIT_PMIC
>> +	tristate "SpacemiT PMIC"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on I2C && OF
>> +	select MFD_CORE
>> +	select REGMAP_I2C
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  This option enables support for SpacemiT I2C based PMICs.  At
>> +	  this time only the P1 PMIC (used with the K1 SoC) is supported.
>> +
> 
> Module name?
> 
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called spacemit-pmic.

I will add a comment like this to the help text.

> 
>>   config MFD_SPMI_PMIC
>>   	tristate "Qualcomm SPMI PMICs"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>>
>> <snip>
>>
>> +static struct i2c_driver spacemit_pmic_i2c_driver = {
>> +	.driver = {
>> +		.name = "spacemit-pmic",
>> +		.of_match_table = spacemit_pmic_match,
>> +	},
>> +	.probe    = spacemit_pmic_probe,
>> +};
>> +
>> +static int __init spacemit_pmic_init(void)
>> +{
>> +	return i2c_add_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +static void __exit spacemit_pmic_exit(void)
>> +{
>> +	i2c_del_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +module_init(spacemit_pmic_init);
>> +module_exit(spacemit_pmic_exit);
>> +
> 
> module_i2c_driver

You're right.  Thanks for the review.  I also added
MODULE_ALIAS() for this driver, and defined MOD_NAME.

					-Alex
> 
> Regards,
> Vivian "dramforever" Wang
> 
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");
> 

