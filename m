Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8630225403
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707391; cv=none; b=RdTqJ5DjCbVnikwX+Bpa2fkkcALBFROT2VkR9p/VoZicsdYPhD97FAPbZxlj1Pd7uvt2ccoPtZHGr+CqTIQyMsbFru56mvCKu5li6BZuyY9O2mCRzuU9LXlqLJpBfGbbPqIAqDOpfLHzAIBuEG1neUpm3U5qb1D08LXi3EGkdiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707391; c=relaxed/simple;
	bh=TDGsCti3mPtYzlEBmLlDoOJKGEqKrgzVDiHCOzJhQgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exeS5KCd1+f9MQbgi5MlRt2ZvmG57zHFMqFgclAyjoPvwNEOSub7Sj6kJ53YGAWTb9LTpwUWas4km/zhhMDWLOf3ZJh94uVah5T2caXwUysSe5NsDkZZUkXdQ0uYpP3dcpv3BX7/vBlA+mDrnPl/reLWfCL6/5eHHbCBt6kR33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Omlxtdkx; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Omlxtdkx"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-8647e143f28so76218639f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746707388; x=1747312188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EchSTz2ixLAWYTB96sLu87zXRfh/aWLsrM0Vf/7G5Gc=;
        b=OmlxtdkxzJusAKKBcHr6DeLha/mV/iP9Nk7vwb3sM3rN+eDYqyA6iMFj8roR+ntE8s
         w3wbjV9rXmL5tK6hNdeJg2Ku+xs9zYIqbImZcvIIZ09ImIwXEZuzFv+cnOGPhv9JMnct
         n9rqYr9MemeaelbRsdpY7H3cChhDYiPq6AA0SxebbrWWpVdrzUqNI5h8jope7LhPQ2Rt
         tN78rrZ8fFPfXcDv9hpH5sMaM1QoTX2nTJANH37k/8Qky3jq3cygzC/eJj9eeFp77Jv9
         k0DudVv60jSxTP3IDc3wuqs+xwKJDt4ty24S6fDnKSGna9hf76botuhcqtLa72TX1PPG
         otUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707388; x=1747312188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EchSTz2ixLAWYTB96sLu87zXRfh/aWLsrM0Vf/7G5Gc=;
        b=mprhk43whp943vpqXKDcDi22wg9nIwha6UdFN6PKMw1d5nZQ3kHfFcZrGTo60JbgA7
         OO+ixfK5jmx9PPWJEmnAwQSuYJZw/6JeNpn3XqM6Duxd6szFW0zpxoYmPqbSVG6/7aNo
         0cJ0KJDCCWaOYzlUP8AM//4t3cscmSrEWw/TAElJF7QhKvkvVctXTH3DAYH3CczCrbs/
         r8PPSgCGhBnKEoFCpgcxwWndHFrr9tbar2tFBMszCvuULFMATAH9WOcHoy3jrYClYLHp
         nzc9QE2dz0UXdi1yO696Rr1KRSpW81Fxa6C6Shgo8qmdEMBcyp0cVpq98oPob/dPn1qt
         HXoA==
X-Forwarded-Encrypted: i=1; AJvYcCWyPxADqZUCt8/9z3noen3ZYfgwTs6O8XWj5uX1nUyTiZi/p65b7a4cggpoNOBSDcdjs5LBpiXAArh8CFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY1I2d5RYnH8sD1lhV2UCTgwSQPvKJVTt4nCi+1ZIbTbZ9mfVh
	Ii1ZTzoKSaiLDt/z19KsRTN++GAeLM7xv7SJmAx0+I2AbkyaORgCPLUleCt4L4A=
X-Gm-Gg: ASbGncsw3vDsWGthuZQasB5kNaN9hhY7X7BE3DsQFuxbO88YfbkKOnOMAcSF9mjL3RA
	isP289vR6/8kvvYOo5TVPIzMN4hBIHYGM9HKMDtE9q3yP3LhPEhhBNZgTr1geHNWYlVA1ifBMa0
	i1dUk/lE1bW+J8/3szwa1aLkuHU9MKhwrV6FGd7KJDxkBT8IIJxZnBjKaYHr1BytDVFX4MaUIPI
	Tuft2LKocCCRF5Bs5GfHSOAGWT8LDSM3wdglTsc/lKmBVGrAm3GjNga+VkMwGTBbG8iral+JSV+
	YpxwM8RQJOh0VmVMzS2ReXiF6Wc+JjY9kM+DyDooGtuaOVyoi9g6w/lMH0LZsGCM7h86dqQdenR
	UdQHh
X-Google-Smtp-Source: AGHT+IF690lf3lW382YdkiJiBkYc8A/KfmHLjKI68D6s9G2Rm2ydeiV8IBPkiN5nxv5k+Txl9dCHlg==
X-Received: by 2002:a05:6602:3413:b0:867:17a6:9fd2 with SMTP id ca18e2360f4ac-8674737348bmr976931039f.9.1746707387766;
        Thu, 08 May 2025 05:29:47 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8cf769sm3129157173.2.2025.05.08.05.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:29:47 -0700 (PDT)
Message-ID: <65bc21e7-d936-492a-b095-4c1469932623@riscstar.com>
Date: Thu, 8 May 2025 07:29:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] reset: spacemit: define three more CCUs
To: Philipp Zabel <p.zabel@pengutronix.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-6-elder@riscstar.com>
 <a3febd3718397d7cf067e2ae637c2d633388f89f.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a3febd3718397d7cf067e2ae637c2d633388f89f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 4:11 AM, Philipp Zabel wrote:
> On Di, 2025-05-06 at 16:06 -0500, Alex Elder wrote:
>> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
>> Define these resets so they can be used.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++
>>   drivers/reset/spacemit/k1.c   | 54 +++++++++++++++++++++++++++++++++++
>>   include/soc/spacemit/ccu_k1.h | 30 +++++++++++++++++++
>>   3 files changed, 108 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 6b1845e899e5f..bddc83aff23cd 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -939,6 +939,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
>>   	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>>   };
>>   
>> +static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
> 
> The /* No clocks in the RCPU CCU */ comment belongs here, instead of in
> the reset driver.
> 
> I wonder though, if these units have no clocks, why are they called
> CCUs? It doesn't make much sense to me to add their compatibles to the
> ccu-k1 driver only to load the reset aux driver. Why not just add a
> platform driver next to the aux driver in reset-spacemit.ko for these
> three?

In fact, the particular registers involved *do* have fields
to control some clocks, but there is currently no use for
them, so support for them isn't implemented.  The reset
controls in those registers are needed now, however.

I actually first implemented this as a small, separate reset
driver, only to learn late in the process that these other
clocks might be needed someday.

> 
>> +	.reset_name	= "rcpu-reset",
>> +};
>> +
>> +static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
>> +	.reset_name	= "rcpu2-reset",
>> +};
>> +
>> +static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
>> +	.reset_name	= "apbc2-reset",
>> +};
>> +
>>   static int spacemit_ccu_register(struct device *dev,
>>   				 struct regmap *regmap,
>>   				 struct regmap *lock_regmap,
>> @@ -1106,6 +1118,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
>>   		.compatible	= "spacemit,k1-syscon-apmu",
>>   		.data		= &k1_ccu_apmu_data,
>>   	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu",
>> +		.data		= &k1_ccu_rcpu_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu2",
>> +		.data		= &k1_ccu_rcpu2_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-apbc2",
>> +		.data		= &k1_ccu_apbc2_data,
>> +	},
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
>> diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
>> index 19a34f151b214..27434a1928261 100644
>> --- a/drivers/reset/spacemit/k1.c
>> +++ b/drivers/reset/spacemit/k1.c
>> @@ -137,6 +137,57 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
>>   	.count		= ARRAY_SIZE(apmu_resets),
>>   };
>>   
>> +static const struct ccu_reset_data rcpu_resets[] = {
>> +	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
>> +	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
>> +	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
>> +	/* No clocks in the RCPU CCU */
> 
> This information is not useful in the reset driver.

Yes, I think this was just copy-pasted from the previous code.
This won't be there in the next version.

					-Alex

> regards
> Philipp

